# 🎧 FAQ — Por que o SSDT de Áudio funciona em Clover mas não em OpenCore (HDEF vs HDAS)

---

## ❓ 1. Por que o SSDT com layout-id não ativa o som no OpenCore quando o caminho é `HDEF`?

Porque o DSDT da maioria dos notebooks já inclui um método `_DSM` dentro do dispositivo `HDEF`.

Esse método geralmente contém lógica dinâmica como:

```asl
If (PCIC (Arg0)) { Return (PCID (Arg0, Arg1, Arg2, Arg3)) }
```

🛑 O OpenCore **não sobrescreve métodos existentes** no DSDT.  
Ou seja, o método `_DSM` do seu SSDT **é ignorado** se já existir um no DSDT.

---

## ❓ 2. Por que funciona normalmente quando o dispositivo de áudio se chama `HDAS`?

Em muitos PCs e desktops, o DSDT **não contém** um método `_DSM` dentro de `HDAS`.  
Nesses casos, o macOS executa corretamente o método `_DSM` do SSDT.

✅ Resultado: o layout-id injetado no SSDT **ativa o som com sucesso** via `AppleALC.kext` ou `VoodooHDA.kext`.

---

## ❓ 3. Clover consegue contornar isso?

✅ **Sim.** O Clover tem a opção `DropOEM_DSM`, que remove automaticamente o método `_DSM` do DSDT para dispositivos como `HDEF`.

Isso permite que o SSDT com layout-id funcione corretamente, mesmo quando o dispositivo é `HDEF`.

---

## ❓ 4. Então não tem jeito de usar SSDT com OpenCore em `HDEF`?

Tem, mas com **restrições**:

- ❌ O patch ACPI do OpenCore para remover o `_DSM` de `HDEF` **geralmente falha**, causando erro de boot.
- ✅ A única forma garantida é:
  - **Editar o DSDT manualmente**, remover o `_DSM` e recompilar
  - Ou usar o boot-arg: `alcid=13` (sem SSDT)

---

## ❓ 5. Qual é a solução mais segura para notebooks com `HDEF` no OpenCore?

Use a injeção via **boot-arg** no `config.plist > NVRAM > boot-args`:

```
alcid=13
```

✅ Funciona em 100% dos casos  
✅ Compatível com `AppleALC.kext`  
✅ Compatível com `VoodooHDA.kext` (já testado e funcional!)  
✅ Não exige SSDT nem patch ACPI

---

## ✅ Resumo técnico:

| Caminho | Método `_DSM` no DSDT | SSDT com `_DSM` funciona? | Solução ideal              |
|---------|------------------------|----------------------------|----------------------------|
| `HDEF`  | ✅ Sim                 | ❌ Não no OpenCore         | `alcid=13` ou Clover + SSDT |
| `HDAS`  | ❌ Não                 | ✅ Sim no OpenCore         | SSDT com layout-id         |

---

## ✅ Extras

- ✅ `VoodooHDA.kext` também responde ao método `_DSM` com `layout-id`, funcionando tanto com SSDT quanto com `alcid`.
- ✅ Clover continua sendo uma opção viável quando o controle sobre ACPI é necessário.

---

🎥 Criado por Hackintosh and Beyond — compartilhe com quem estiver apanhando com áudio no Hackintosh!
