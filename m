Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A274F4BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mGx5B5bz3dyN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m6j5Gqwz3dR2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:10:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5W1QLJz9sFQ;
	Tue, 11 Jul 2023 18:09:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImeBvd80un5Y; Tue, 11 Jul 2023 18:09:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C6PN4z9sFS;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D7FE48B763;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yEpAzXIs1e1Z; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 002DA8B78B;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8ktA3696860
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:46 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8kvL3696859;
	Tue, 11 Jul 2023 18:08:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 15/15] powerpc: Implement UACCESS validation on PPC32
Date: Tue, 11 Jul 2023 18:08:41 +0200
Message-ID: <dc3c8785588ad716478089c8af423d285787b2e0.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091706; l=15786; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=v6EEfkjahz4Q5UtE7x5g0L/3XYx24okZA6rlhISqk4Q=; b=+striK7ipBZaHPwAPlH17GnR+39DUH1yZESK047SFO+vKEeA51Pdv25cztmb87s1QYc5H00Fo UJTHzB3YoI6B8bKTEdzCRrKtuDQHaL2njXBIMwoFUadWUcgGvWDjh5A
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to implement UACCESS validation, objtool support
for powerpc needs to be enhanced to decode more instructions.

It also requires implementation of switch tables finding.
On PPC32 it is similar to x86, switch tables are anonymous in .rodata,
the difference is that the value is relative to its index in the table.
But several switch tables can be nested so the register containing
the table base address also needs to be tracked and taken into account.

Don't activate if for Clang for now because its switch tables are
different from GCC switch tables.

Then comes the UACCESS enabling/disabling instructions. On booke and
8xx it is done with a mtspr instruction. For 8xx that's in SPRN_MD_AP,
for booke that's in SPRN_PID. Annotate those instructions.

No work has been done for ASM files, they are not used for UACCESS
so for the moment just tell objtool to ignore ASM files.

For relocable code, the .got2 relocation preceding each global
function needs to be marked as ignored because some versions of GCC
do this:

     120:	00 00 00 00	.long 0x0
			120: R_PPC_REL32	.got2+0x7ff0

00000124 <tohex>:
     124:	94 21 ff f0 	stwu    r1,-16(r1)
     128:	7c 08 02 a6 	mflr    r0
     12c:	42 9f 00 05 	bcl     20,4*cr7+so,130 <tohex+0xc>
     130:	39 00 00 00 	li      r8,0
     134:	39 20 00 08 	li      r9,8
     138:	93 c1 00 08 	stw     r30,8(r1)
     13c:	7f c8 02 a6 	mflr    r30
     140:	90 01 00 14 	stw     r0,20(r1)
     144:	80 1e ff f0 	lwz     r0,-16(r30)
     148:	7f c0 f2 14 	add     r30,r0,r30
     14c:	81 5e 80 00 	lwz     r10,-32768(r30)
     150:	80 fe 80 04 	lwz     r7,-32764(r30)

Also declare longjmp() and start_secondary_resume() as global noreturn
functions, and declare __copy_tofrom_user() and __arch_clear_user()
as UACCESS safe.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          |   2 +
 arch/powerpc/include/asm/book3s/32/kup.h      |   2 +
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   4 +-
 arch/powerpc/include/asm/nohash/kup-booke.h   |   4 +-
 arch/powerpc/kexec/core_32.c                  |   4 +-
 arch/powerpc/mm/nohash/kup.c                  |   2 +
 tools/objtool/arch/powerpc/decode.c           | 155 +++++++++++++++++-
 .../arch/powerpc/include/arch/noreturns.h     |  11 ++
 tools/objtool/arch/powerpc/special.c          |  36 +++-
 tools/objtool/check.c                         |   6 +-
 10 files changed, 211 insertions(+), 15 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/include/arch/noreturns.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b1172cbeccb..cdaca38868e1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -159,6 +159,7 @@ config PPC
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
+	select ARCH_OBJTOOL_SKIP_ASM
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_SPLIT_ARG64			if PPC32
@@ -257,6 +258,7 @@ config PPC
 	select HAVE_OPTPROBES
 	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
 	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
+	select HAVE_UACCESS_VALIDATION		if HAVE_OBJTOOL && PPC_KUAP && PPC32 && CC_IS_GCC
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 4e14a5427a63..842d9a6f4b7a 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -34,6 +34,7 @@ static __always_inline void uaccess_begin_32s(unsigned long addr)
 	asm volatile(ASM_MMU_FTR_IFSET(
 		"mfsrin %0, %1;"
 		"rlwinm %0, %0, 0, %2;"
+		ASM_UACCESS_BEGIN
 		"mtsrin %0, %1;"
 		"isync", "", %3)
 		: "=&r"(tmp)
@@ -48,6 +49,7 @@ static __always_inline void uaccess_end_32s(unsigned long addr)
 	asm volatile(ASM_MMU_FTR_IFSET(
 		"mfsrin %0, %1;"
 		"oris %0, %0, %2;"
+		ASM_UACCESS_END
 		"mtsrin %0, %1;"
 		"isync", "", %3)
 		: "=&r"(tmp)
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 46bc5925e5fd..38c7ed766445 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -39,13 +39,13 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 
 static __always_inline void uaccess_begin_8xx(unsigned long val)
 {
-	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1", "", %2) : :
+	asm(ASM_UACCESS_BEGIN ASM_MMU_FTR_IFSET("mtspr %0, %1", "", %2) : :
 	    "i"(SPRN_MD_AP), "r"(val), "i"(MMU_FTR_KUAP) : "memory");
 }
 
 static __always_inline void uaccess_end_8xx(void)
 {
-	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1", "", %2) : :
+	asm(ASM_UACCESS_END ASM_MMU_FTR_IFSET("mtspr %0, %1", "", %2) : :
 	    "i"(SPRN_MD_AP), "r"(MD_APG_KUAP), "i"(MMU_FTR_KUAP) : "memory");
 }
 
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 0c7c3258134c..26eb6d10a964 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -63,13 +63,13 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 
 static __always_inline void uaccess_begin_booke(unsigned long val)
 {
-	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1; isync", "", %2) : :
+	asm(ASM_UACCESS_BEGIN ASM_MMU_FTR_IFSET("mtspr %0, %1; isync", "", %2) : :
 	    "i"(SPRN_PID), "r"(val), "i"(MMU_FTR_KUAP) : "memory");
 }
 
 static __always_inline void uaccess_end_booke(void)
 {
-	asm(ASM_MMU_FTR_IFSET("mtspr %0, %1; isync", "", %2) : :
+	asm(ASM_UACCESS_END ASM_MMU_FTR_IFSET("mtspr %0, %1; isync", "", %2) : :
 	    "i"(SPRN_PID), "r"(0), "i"(MMU_FTR_KUAP) : "memory");
 }
 
diff --git a/arch/powerpc/kexec/core_32.c b/arch/powerpc/kexec/core_32.c
index c95f96850c9e..6e955f32e7c3 100644
--- a/arch/powerpc/kexec/core_32.c
+++ b/arch/powerpc/kexec/core_32.c
@@ -17,7 +17,7 @@
 typedef void (*relocate_new_kernel_t)(
 				unsigned long indirection_page,
 				unsigned long reboot_code_buffer,
-				unsigned long start_address) __noreturn;
+				unsigned long start_address);
 
 /*
  * This is a generic machine_kexec function suitable at least for
@@ -61,6 +61,8 @@ void default_machine_kexec(struct kimage *image)
 	/* now call it */
 	rnk = (relocate_new_kernel_t) reboot_code_buffer;
 	(*rnk)(page_list, reboot_code_buffer_phys, image->start);
+
+	unreachable();	/* For objtool */
 }
 
 int machine_kexec_prepare(struct kimage *image)
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index e1f7de2e54ec..e23c7ca269fe 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -24,6 +24,8 @@ void setup_kuap(bool disabled)
 
 	pr_info("Activating Kernel Userspace Access Protection\n");
 
+	/* Performed a paired allow/prevent to silence objtool warning */
+	allow_user_access(NULL, NULL, 0, KUAP_READ_WRITE);
 	prevent_user_access(KUAP_READ_WRITE);
 }
 #endif
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..62774d2cca33 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -39,28 +39,164 @@ const char *arch_ret_insn(int len)
 	exit(-1);
 }
 
+static u32 read_instruction(struct objtool_file *file, const struct section *sec,
+			    unsigned long offset)
+{
+	return bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
+}
+
+/*
+ * Try to find the register used as base for a table jump.
+ * If not found return r1 which is the stack so can't be valid
+ *
+ * For relative jump tables we expect the following sequence
+ *   lwzx rx, reg1, reg2 or lwz rx, 0(reg)
+ *   add ry, rx, rbase or add ry, rbase, rx
+ *   mtctr ry
+ *   bctr
+ *
+ * For absolute jump tables we expect the following sequence
+ *   lwzx rx, rbase, rindex
+ *   mtctr rx
+ *   bctr
+ *
+ * Those sequences might be nested with other code, but we expect
+ * it within the last 16 instructions.
+ */
+static unsigned int arch_decode_jumptable_base(struct objtool_file *file,
+					       const struct section *sec,
+					       struct instruction *jump_insn)
+{
+	int i;
+	unsigned int td = ~0, ta = ~0, tb = ~0;
+	struct instruction *insn;
+
+	for (insn = jump_insn, i = 0;
+	     insn && i < 16;
+	     insn = prev_insn_same_sec(file, insn), i++) {
+		u32 ins = read_instruction(file, sec, insn->offset);
+		unsigned int ra = (ins >> 16) & 0x1f;
+		unsigned int rb = (ins >> 11) & 0x1f;
+		unsigned int rd = (ins >> 21) & 0x1f;
+
+		if (td == ~0 && ta == ~0) {
+			if ((ins & 0xfc1ffffe) == 0x7c0903a6)	/* mtctr rd */
+				td = rd;
+			continue;
+		}
+			/* lwzx td, ra, rb */
+		if (td != ~0 && (ins & 0xfc0007fe) == 0x7c00002e && rd == td)
+			return ra;
+
+			/* lwzx ta, ra, rb  or  lwzx tb, ra, rb */
+		if (ta != ~0 && (ins & 0xfc0007fe) == 0x7c00002e && (rd == ta || rd == tb))
+			return rd == ta ? tb : ta;
+
+			/* lwz ta, 0(ra)  or  lwz tb, 0(ra) */
+		if (ta != ~0 && (ins & 0xfc00ffff) == 0x80000000 && (rd == ta || rd == tb))
+			return rd == ta ? tb : ta;
+
+			/* add td, ta, tb */
+		if (ta == ~0 && (ins & 0xfc0007ff) == 0x7c000214 && rd == td) {
+			ta = ra;
+			tb = rb;
+			td = ~0;
+		}
+	}
+	return 1;
+}
+
 int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
 			    unsigned long offset, unsigned int maxlen,
 			    struct instruction *insn)
 {
-	unsigned int opcode;
+	unsigned int opcode, xop;
+	unsigned int rs, ra, rb, bo, bi, to, uimm, simm, lk, aa;
 	enum insn_type typ;
 	unsigned long imm;
-	u32 ins;
+	u32 ins = read_instruction(file, sec, offset);
+
+	if (!ins && file->elf->ehdr.e_flags & EF_PPC_RELOCATABLE_LIB) {
+		struct reloc *reloc;
+
+		reloc = find_reloc_by_dest_range(file->elf, insn->sec, insn->offset, 4);
+
+		if (reloc && reloc_type(reloc) == R_PPC_REL32 &&
+		    !strncmp(reloc->sym->sec->name, ".got2", 5)) {
+			insn->type = INSN_OTHER;
+			insn->ignore = true;
+			insn->len = 4;
+
+			return 0;
+		}
+	}
 
-	ins = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
 	opcode = ins >> 26;
-	typ = INSN_OTHER;
-	imm = 0;
+	xop = (ins >> 1) & 0x3ff;
+	rs = bo = to = (ins >> 21) & 0x1f;
+	ra = bi = (ins >> 16) & 0x1f;
+	rb = (ins >> 11) & 0x1f;
+	uimm = simm = (ins >> 0) & 0xffff;
+	aa = ins & 2;
+	lk = ins & 1;
 
 	switch (opcode) {
+	case 3:
+		if (to == 31 && ra == 0 && simm == 0) /* twi 31, r0, 0 */
+			typ = INSN_BUG;
+		else
+			typ = INSN_OTHER;
+		break;
+	case 16: /* bc[l][a] */
+		if (lk)	/* bcl[a] */
+			typ = INSN_OTHER;
+		else		/* bc[a] */
+			typ = INSN_JUMP_CONDITIONAL;
+
+		imm = ins & 0xfffc;
+		if (imm & 0x8000)
+			imm -= 0x10000;
+		insn->immediate = imm | aa;
+		break;
 	case 18: /* b[l][a] */
-		if ((ins & 3) == 1) /* bl */
+		if (lk)	/* bl[a] */
 			typ = INSN_CALL;
+		else		/* b[a] */
+			typ = INSN_JUMP_UNCONDITIONAL;
 
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
+		insn->immediate = imm | aa;
+		break;
+	case 19:
+		if (xop == 16 && bo == 20 && bi == 0)	/* blr */
+			typ = INSN_RETURN;
+		else if (xop == 16)	/* bclr */
+			typ = INSN_RETURN_CONDITIONAL;
+		else if (xop == 50)	/* rfi */
+			typ = INSN_JUMP_DYNAMIC;
+		else if (xop == 528 && bo == 20 && bi == 0 && !lk)	/* bctr */
+			typ = INSN_JUMP_DYNAMIC;
+		else if (xop == 528 && bo == 20 && bi == 0 && lk)	/* bctrl */
+			typ = INSN_CALL_DYNAMIC;
+		else
+			typ = INSN_OTHER;
+		break;
+	case 24:
+		if (rs == 0 && ra == 0 && uimm == 0)
+			typ = INSN_NOP;
+		else
+			typ = INSN_OTHER;
+		break;
+	case 31:
+		if (xop == 4 && to == 31 && ra == 0 && rb == 0) /* trap */
+			typ = INSN_BUG;
+		else
+			typ = INSN_OTHER;
+		break;
+	default:
+		typ = INSN_OTHER;
 		break;
 	}
 
@@ -70,13 +206,18 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		insn->len = 4;
 
 	insn->type = typ;
-	insn->immediate = imm;
+
+	if (typ == INSN_JUMP_DYNAMIC)
+		insn->gpr = arch_decode_jumptable_base(file, sec, insn);
 
 	return 0;
 }
 
 unsigned long arch_jump_destination(struct instruction *insn)
 {
+	if (insn->immediate & 2)
+		return insn->immediate & ~2;
+
 	return insn->offset + insn->immediate;
 }
 
diff --git a/tools/objtool/arch/powerpc/include/arch/noreturns.h b/tools/objtool/arch/powerpc/include/arch/noreturns.h
new file mode 100644
index 000000000000..664f17d39026
--- /dev/null
+++ b/tools/objtool/arch/powerpc/include/arch/noreturns.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * This is a (sorted!) list of all known __noreturn functions in arch/powerpc.
+ * It's needed for objtool to properly reverse-engineer the control flow graph.
+ *
+ * Yes, this is unfortunate.  A better solution is in the works.
+ */
+NORETURN(longjmp)
+NORETURN(start_secondary_resume)
+NORETURN(unrecoverable_exception)
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index a7dd2559b536..c241a6dca8b0 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -3,7 +3,7 @@
 #include <stdlib.h>
 #include <objtool/special.h>
 #include <objtool/builtin.h>
-
+#include <objtool/endianness.h>
 
 bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
@@ -16,5 +16,37 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
 				     struct instruction *orig_insn)
 {
-	exit(-1);
+	struct reloc *text_reloc;
+	struct section *table_sec;
+	unsigned long table_offset;
+	u32 ins;
+
+	/* look for a relocation which references .rodata */
+	text_reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+					      insn->offset, insn->len);
+	if (!text_reloc || reloc_type(text_reloc) != R_PPC_ADDR16_LO ||
+	    text_reloc->sym->type != STT_SECTION || !text_reloc->sym->sec->rodata)
+		return NULL;
+
+	ins = bswap_if_needed(file->elf, *(u32 *)(insn->sec->data->d_buf + insn->offset));
+	if (orig_insn && ((ins >> 21) & 0x1f) != orig_insn->gpr)
+		return NULL;
+
+	table_offset = reloc_addend(text_reloc);
+	table_sec = text_reloc->sym->sec;
+
+	/*
+	 * Make sure the .rodata address isn't associated with a
+	 * symbol.  GCC jump tables are anonymous data.
+	 *
+	 * Also support C jump tables which are in the same format as
+	 * switch jump tables.  For objtool to recognize them, they
+	 * need to be placed in the C_JUMP_TABLE_SECTION section.  They
+	 * have symbols associated with them.
+	 */
+	if (find_symbol_containing(table_sec, table_offset) &&
+	    strcmp(table_sec->name, C_JUMP_TABLE_SECTION))
+		return NULL;
+
+	return find_reloc_by_dest(file->elf, table_sec, table_offset);
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 5af6c6c3fbed..0d2df15f553a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1259,13 +1259,17 @@ static const char *uaccess_safe_builtin[] = {
 	"stackleak_track_stack",
 	/* misc */
 	"csum_partial_copy_generic",
+	"ftrace_likely_update", /* CONFIG_TRACE_BRANCH_PROFILING */
+	/* misc x86 */
 	"copy_mc_fragile",
 	"copy_mc_fragile_handle_tail",
 	"copy_mc_enhanced_fast_string",
-	"ftrace_likely_update", /* CONFIG_TRACE_BRANCH_PROFILING */
 	"rep_stos_alternative",
 	"rep_movs_alternative",
 	"__copy_user_nocache",
+	/* misc powerpc */
+	"__copy_tofrom_user",
+	"__arch_clear_user",
 	NULL
 };
 
-- 
2.41.0

