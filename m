Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BA4A92D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 04:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqhNz6ZbHz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 14:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JqhNW2l2kz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 14:48:57 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 6CCC1804BD;
 Thu,  3 Feb 2022 22:48:48 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/64: Add UADDR64 relocation support
Date: Fri,  4 Feb 2022 14:48:44 +1100
Message-Id: <20220204034844.1187993-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When ld detects unaligned relocations, it emits R_PPC64_UADDR64
relocations instead of R_PPC64_RELATIVE. Currently R_PPC64_UADDR64 are
detected by arch/powerpc/tools/relocs_check.sh and expected not to work.
Below is a simple chunk to trigger this behaviour (this disables
optimization for the demonstration purposes only, this also happens with
-O1/-O2 when CONFIG_PRINTK_INDEX=y, for example):

\#pragma GCC push_options
\#pragma GCC optimize ("O0")
struct entry {
        const char *file;
        int line;
} __attribute__((packed));
static const struct entry e1 = { .file = __FILE__, .line = __LINE__ };
static const struct entry e2 = { .file = __FILE__, .line = __LINE__ };
...
prom_printf("e1=%s %lx %lx\n", e1.file, (unsigned long) e1.file, mfmsr());
prom_printf("e2=%s %lx\n", e2.file, (unsigned long) e2.file);
\#pragma GCC pop_options


This adds support for UADDR64 for 64bit. This reuses __dynamic_symtab
from the 32bit which supports more relocation types already.

Because RELACOUNT includes only R_PPC64_RELATIVE, this replaces it with
RELASZ which is the size of all relocation records.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* replaced RELACOUNT with RELASZ/RELAENT
* removed FIXME

---

Tested via qemu gdb stub (the kernel is loaded at 0x400000).

Disasm:

c000000001a804d0 <e1>:
c000000001a804d0:       b0 04 a8 01     .long 0x1a804b0
                        c000000001a804d0: R_PPC64_RELATIVE      *ABS*-0x3ffffffffe57fb50
c000000001a804d4:       00 00 00 c0     lfs     f0,0(0)
c000000001a804d8:       fa 08 00 00     .long 0x8fa

c000000001a804dc <e2>:
        ...
                        c000000001a804dc: R_PPC64_UADDR64       .rodata+0x4b0

Before relocation:
>>> p *(unsigned long *) 0x1e804d0
$1 = 0xc000000001a804b0
>>> p *(unsigned long *) 0x1e804dc
$2 = 0x0

After relocation in __boot_from_prom:
>>> p *(unsigned long *) 0x1e804d0
$1 = 0x1e804b0
>>> p *(unsigned long *) 0x1e804dc
$2 = 0x1e804b0

After relocation in __after_prom_start:
>>> p *(unsigned long *) 0x1e804d0
$1 = 0xc000000001a804b0
>>> p *(unsigned long *) 0x1e804dc
$2 = 0xc000000001a804b0
>>>
---
 arch/powerpc/kernel/reloc_64.S     | 56 ++++++++++++++++++++----------
 arch/powerpc/kernel/vmlinux.lds.S  |  2 --
 arch/powerpc/tools/relocs_check.sh |  7 +---
 3 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/reloc_64.S b/arch/powerpc/kernel/reloc_64.S
index 02d4719bf43a..f7dcc25e93d0 100644
--- a/arch/powerpc/kernel/reloc_64.S
+++ b/arch/powerpc/kernel/reloc_64.S
@@ -8,8 +8,10 @@
 #include <asm/ppc_asm.h>
 
 RELA = 7
-RELACOUNT = 0x6ffffff9
+RELASZ = 8
+RELAENT = 9
 R_PPC64_RELATIVE = 22
+R_PPC64_UADDR64 = 43
 
 /*
  * r3 = desired final address of kernel
@@ -25,29 +27,36 @@ _GLOBAL(relocate)
 	add	r9,r9,r12	/* r9 has runtime addr of .rela.dyn section */
 	ld	r10,(p_st - 0b)(r12)
 	add	r10,r10,r12	/* r10 has runtime addr of _stext */
+	ld	r13,(p_sym - 0b)(r12)
+	add	r13,r13,r12	/* r13 has runtime addr of .dynsym */
 
 	/*
-	 * Scan the dynamic section for the RELA and RELACOUNT entries.
+	 * Scan the dynamic section for the RELA, RELASZ and RELAENT entries.
 	 */
 	li	r7,0
 	li	r8,0
 1:	ld	r6,0(r11)	/* get tag */
 	cmpdi	r6,0
-	beq	4f		/* end of list */
+	beq	5f		/* end of list */
 	cmpdi	r6,RELA
 	bne	2f
 	ld	r7,8(r11)	/* get RELA pointer in r7 */
-	b	3f
-2:	addis	r6,r6,(-RELACOUNT)@ha
-	cmpdi	r6,RELACOUNT@l
+	b	4f
+2:	cmpdi	r6,RELASZ
 	bne	3f
-	ld	r8,8(r11)	/* get RELACOUNT value in r8 */
-3:	addi	r11,r11,16
+	ld	r8,8(r11)	/* get RELASZ value in r8 */
+	b	4f
+3:	cmpdi	r6,RELAENT
+	bne	4f
+	ld	r12,8(r11)	/* get RELAENT value in r12 */
+4:	addi	r11,r11,16
 	b	1b
-4:	cmpdi	r7,0		/* check we have both RELA and RELACOUNT */
+5:	cmpdi	r7,0		/* check we have RELA, RELASZ, RELAENT */
 	cmpdi	cr1,r8,0
-	beq	6f
-	beq	cr1,6f
+	beq	10f
+	beq	cr1,10f
+	cmpdi	r12,0
+	beq	10f
 
 	/*
 	 * Work out linktime address of _stext and hence the
@@ -62,23 +71,34 @@ _GLOBAL(relocate)
 
 	/*
 	 * Run through the list of relocations and process the
-	 * R_PPC64_RELATIVE ones.
+	 * R_PPC64_RELATIVE and R_PPC64_UADDR64 ones.
 	 */
+	divd	r8,r8,r12	/* RELASZ / RELAENT */
 	mtctr	r8
-5:	ld	r0,8(9)		/* ELF64_R_TYPE(reloc->r_info) */
+5:	lwa	r0,8(r9)	/* ELF64_R_TYPE(reloc->r_info) */
 	cmpdi	r0,R_PPC64_RELATIVE
-	bne	6f
+	bne	7f
 	ld	r6,0(r9)	/* reloc->r_offset */
 	ld	r0,16(r9)	/* reloc->r_addend */
-	add	r0,r0,r3
+	b	8f
+7:	cmpdi	r0,R_PPC64_UADDR64
+	bne	9f
+	ld	r6,0(r9)
+	ld	r0,16(r9)
+	lwa	r14,12(r9) 	/* ELF64_R_SYM(reloc->r_info) */
+	mulli	r14,r14,24	/* 24 == sizeof(elf64_sym) */
+	add	r14,r14,r13	/* elf64_sym[ELF64_R_SYM] */
+	ld	r14,8(r14)
+	add	r0,r0,r14
+8:	add	r0,r0,r3
 	stdx	r0,r7,r6
-	addi	r9,r9,24
+9:	add	r9,r9,r12
 	bdnz	5b
-
-6:	blr
+10:	blr
 
 .balign 8
 p_dyn:	.8byte	__dynamic_start - 0b
 p_rela:	.8byte	__rela_dyn_start - 0b
+p_sym:		.8byte __dynamic_symtab - 0b
 p_st:	.8byte	_stext - 0b
 
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 2bcca818136a..fe22d940412f 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -281,9 +281,7 @@ SECTIONS
 	. = ALIGN(8);
 	.dynsym : AT(ADDR(.dynsym) - LOAD_OFFSET)
 	{
-#ifdef CONFIG_PPC32
 		__dynamic_symtab = .;
-#endif
 		*(.dynsym)
 	}
 	.dynstr : AT(ADDR(.dynstr) - LOAD_OFFSET) { *(.dynstr) }
diff --git a/arch/powerpc/tools/relocs_check.sh b/arch/powerpc/tools/relocs_check.sh
index 014e00e74d2b..63792af00417 100755
--- a/arch/powerpc/tools/relocs_check.sh
+++ b/arch/powerpc/tools/relocs_check.sh
@@ -39,6 +39,7 @@ $objdump -R "$vmlinux" |
 	#	R_PPC_NONE
 	grep -F -w -v 'R_PPC64_RELATIVE
 R_PPC64_NONE
+R_PPC64_UADDR64
 R_PPC_ADDR16_LO
 R_PPC_ADDR16_HI
 R_PPC_ADDR16_HA
@@ -54,9 +55,3 @@ fi
 num_bad=$(echo "$bad_relocs" | wc -l)
 echo "WARNING: $num_bad bad relocations"
 echo "$bad_relocs"
-
-# If we see this type of relocation it's an idication that
-# we /may/ be using an old version of binutils.
-if echo "$bad_relocs" | grep -q -F -w R_PPC64_UADDR64; then
-	echo "WARNING: You need at least binutils >= 2.19 to build a CONFIG_RELOCATABLE kernel"
-fi
-- 
2.30.2

