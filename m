Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BFF73BD8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 19:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnkMc3kqQz3ff0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 03:13:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnkDM5ZCzz3c8c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 03:06:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QnkCd2p5Pz9sgh;
	Fri, 23 Jun 2023 19:06:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mUAF1mGRxpn; Fri, 23 Jun 2023 19:06:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QnkCR5fQnz9sgn;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC58F8B781;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lzMJBxt8936t; Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.71])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 70A6B8B77B;
	Fri, 23 Jun 2023 19:05:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35NH5nlj2645811
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 19:05:49 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35NH5n8F2645810;
	Fri, 23 Jun 2023 19:05:49 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v3 15/15] powerpc: Implement UACCESS validation on PPC32
Date: Fri, 23 Jun 2023 19:05:26 +0200
Message-Id: <8b52b0e94f3accfde0094d20fd7ff2dd55f2e9de.1687539638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687539638.git.christophe.leroy@csgroup.eu>
References: <cover.1687539638.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687539922; l=14239; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=eowYKU7L5EjcGwnYG+JbAqFpvGwLuFAM9eA67Jcqzw8=; b=ZbLLaezvplJu7QOfJ11G8Jg/vY4zUxE8B77Axb2NdR49coYmiLWIXkt2eKQD8j/0tHbxkRC+M EZW+2Y3DzyCAk47QWFdL54oHPAtpXUmnIktoT1wVm7a4pLp2I6Pmjbl
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

Then comes the UACCESS enabling/disabling instructions. On booke and
8xx it is done with a mtspr instruction. For 8xx that's in SPRN_MD_AP,
for booke that's in SPRN_PID. Annotate those instructions.

For book3s/32 that's a bit more complex and left aside for the moment.

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

While other versions do that:

00000120 <tohex>:
     120:	94 21 ff f0 	stwu    r1,-16(r1)
     124:	7c 08 02 a6 	mflr    r0
     128:	42 9f 00 05 	bcl     20,4*cr7+so,12c <tohex+0xc>
     12c:	39 00 00 00 	li      r8,0
     130:	39 20 00 08 	li      r9,8
     134:	93 c1 00 08 	stw     r30,8(r1)
     138:	7f c8 02 a6 	mflr    r30
     13c:	3f de 00 00 	addis   r30,r30,0
			13e: R_PPC_REL16_HA	.got2+0x8012
     140:	90 01 00 14 	stw     r0,20(r1)
     144:	3b de 00 00 	addi    r30,r30,0
			146: R_PPC_REL16_LO	.got2+0x801a
     148:	81 5e 80 00 	lwz     r10,-32768(r30)
     14c:	80 fe 80 04 	lwz     r7,-32764(r30)

Also declare longjmp() and start_secondary_resume() as global noreturn
functions, and declare __copy_tofrom_user() and __arch_clear_user()
as UACCESS safe.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          |  2 +
 arch/powerpc/include/asm/kup.h                | 12 +++
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  8 +-
 arch/powerpc/include/asm/nohash/kup-booke.h   |  8 +-
 arch/powerpc/kexec/core_32.c                  |  4 +-
 tools/objtool/arch/powerpc/decode.c           | 83 +++++++++++++++++--
 .../arch/powerpc/include/arch/noreturns.h     | 11 +++
 tools/objtool/arch/powerpc/special.c          | 34 +++++++-
 tools/objtool/check.c                         |  6 +-
 9 files changed, 152 insertions(+), 16 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/include/arch/noreturns.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8b955bc7b59f..8b613e520143 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -160,6 +160,7 @@ config PPC
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
+	select ARCH_OBJTOOL_SKIP_ASM
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_SPLIT_ARG64			if PPC32
@@ -258,6 +259,7 @@ config PPC
 	select HAVE_OPTPROBES
 	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
 	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
+	select HAVE_UACCESS_VALIDATION		if HAVE_OBJTOOL && PPC_KUAP && PPC32
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 132f1c7e1064..9f824cb93d8a 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -10,6 +10,8 @@
 #include <linux/types.h>
 
 static __always_inline bool kuap_is_disabled(void);
+static __always_inline void mtspr_uaccess_begin(int rn, unsigned long val);
+static __always_inline void mtspr_uaccess_end(int rn, unsigned long val);
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -222,6 +224,16 @@ static __always_inline void prevent_current_write_to_user(void)
 	prevent_user_access(KUAP_WRITE);
 }
 
+static __always_inline void mtspr_uaccess_begin(int rn, unsigned long val)
+{
+	asm(ASM_UACCESS_BEGIN "mtspr %0, %1\n\t" : : "i"(rn), "r"(val) : "memory");
+}
+
+static __always_inline void mtspr_uaccess_end(int rn, unsigned long val)
+{
+	asm(ASM_UACCESS_END "mtspr %0, %1\n\t" : : "i"(rn), "r"(val) : "memory");
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_KUAP_H_ */
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 61067e4c8f22..9b59231d87c9 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -42,12 +42,12 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 static __always_inline void __allow_user_access(void __user *to, const void __user *from,
 						unsigned long size, unsigned long dir)
 {
-	mtspr(SPRN_MD_AP, MD_APG_INIT);
+	mtspr_uaccess_begin(SPRN_MD_AP, MD_APG_INIT);
 }
 
 static __always_inline void __prevent_user_access(unsigned long dir)
 {
-	mtspr(SPRN_MD_AP, MD_APG_KUAP);
+	mtspr_uaccess_end(SPRN_MD_AP, MD_APG_KUAP);
 }
 
 static __always_inline unsigned long __prevent_user_access_return(void)
@@ -56,14 +56,14 @@ static __always_inline unsigned long __prevent_user_access_return(void)
 
 	flags = mfspr(SPRN_MD_AP);
 
-	mtspr(SPRN_MD_AP, MD_APG_KUAP);
+	mtspr_uaccess_end(SPRN_MD_AP, MD_APG_KUAP);
 
 	return flags;
 }
 
 static __always_inline void __restore_user_access(unsigned long flags)
 {
-	mtspr(SPRN_MD_AP, flags);
+	mtspr_uaccess_begin(SPRN_MD_AP, flags);
 }
 
 static __always_inline bool
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 416f3e0897d5..2967501c434e 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -64,13 +64,13 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 static __always_inline void __allow_user_access(void __user *to, const void __user *from,
 						unsigned long size, unsigned long dir)
 {
-	mtspr(SPRN_PID, current->thread.pid);
+	mtspr_uaccess_begin(SPRN_PID, current->thread.pid);
 	isync();
 }
 
 static __always_inline void __prevent_user_access(unsigned long dir)
 {
-	mtspr(SPRN_PID, 0);
+	mtspr_uaccess_end(SPRN_PID, 0);
 	isync();
 }
 
@@ -78,7 +78,7 @@ static __always_inline unsigned long __prevent_user_access_return(void)
 {
 	unsigned long flags = mfspr(SPRN_PID);
 
-	mtspr(SPRN_PID, 0);
+	mtspr_uaccess_end(SPRN_PID, 0);
 	isync();
 
 	return flags;
@@ -87,7 +87,7 @@ static __always_inline unsigned long __prevent_user_access_return(void)
 static __always_inline void __restore_user_access(unsigned long flags)
 {
 	if (flags) {
-		mtspr(SPRN_PID, current->thread.pid);
+		mtspr_uaccess_begin(SPRN_PID, current->thread.pid);
 		isync();
 	}
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
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..bac861cf1176 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -43,24 +43,95 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			    unsigned long offset, unsigned int maxlen,
 			    struct instruction *insn)
 {
-	unsigned int opcode;
+	unsigned int opcode, xop;
+	unsigned int rs, ra, rb, bo, bi, to, uimm, simm, lk, aa;
 	enum insn_type typ;
 	unsigned long imm;
 	u32 ins;
 
 	ins = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
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
+
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
 
@@ -70,13 +141,15 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		insn->len = 4;
 
 	insn->type = typ;
-	insn->immediate = imm;
 
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
index d33868147196..21940cbfd550 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -15,5 +15,37 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				    struct instruction *insn)
 {
-	exit(-1);
+	struct reloc *text_reloc;
+	struct section *table_sec;
+	unsigned long table_offset;
+
+	/* look for a relocation which references .rodata */
+	text_reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+					      insn->offset, insn->len);
+	if (!text_reloc || text_reloc->sym->type != STT_SECTION ||
+	    !text_reloc->sym->sec->rodata)
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
+	/*
+	 * Each table entry has a rela associated with it.  The rela
+	 * should reference text in the same function as the original
+	 * instruction.
+	 */
+	return find_reloc_by_dest(file->elf, table_sec, table_offset);
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 6daa13c25183..2d564d0e2ae1 100644
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
2.40.1

