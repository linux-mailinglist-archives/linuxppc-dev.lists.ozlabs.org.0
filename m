Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D55F733369
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 16:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjLvC1chwz3bng
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 00:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjLsX68B2z2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 00:20:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QjL8l0BHtz9s12;
	Fri, 16 Jun 2023 15:48:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1067xZSW2GWH; Fri, 16 Jun 2023 15:48:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QjL8g6fQdz9s0s;
	Fri, 16 Jun 2023 15:48:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DFC958B77D;
	Fri, 16 Jun 2023 15:48:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 66P6jqudVMmj; Fri, 16 Jun 2023 15:48:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.18])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B09E78B764;
	Fri, 16 Jun 2023 15:48:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35GDmB0X1175663
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 15:48:11 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35GDmACk1175661;
	Fri, 16 Jun 2023 15:48:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
Subject: [RFC PATCH v1 3/3] powerpc: WIP draft support to objtool check
Date: Fri, 16 Jun 2023 15:47:52 +0200
Message-Id: <8fbf16dd6a89e1b5b05244bd5e0746410674829e.1686922583.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686922583.git.christophe.leroy@csgroup.eu>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686923268; l=11701; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Wg1RgV9ghOKrFYk6CuUre0qE0meV8NHuNie239IWks0=; b=FzMQ7Ae/8RiM/prENbOAaI8UYe39viWv5CyvyTyvNOMCIJ7zsvdOWo2adpJfHwPrEP+bSwnCO msOtJNs3NKkBrcvxGsAabMDI6BvlTu4q+4EJw6RtmC3T7ezsnI8WLrH
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

This draft messy patch is first try to add support of objtool
check for powerpc. This is in preparation of doing uaccess
validation for powerpc.

For the time being, this is implemented for PPC32 only breaking
support for other targets eventually. Will be reworked to be more
generic once a final working status has been achieved.

All assembly files have been deactivated as they require huge
work and are not really needed at the first place for uaccess validation.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          |  1 +
 scripts/Makefile.lib                          |  2 +-
 tools/objtool/arch/powerpc/decode.c           | 60 +++++++++++++++++--
 .../arch/powerpc/include/arch/special.h       |  2 +-
 tools/objtool/arch/powerpc/special.c          | 44 +++++++++++++-
 tools/objtool/check.c                         | 29 +++++----
 tools/objtool/include/objtool/elf.h           |  1 +
 tools/objtool/include/objtool/special.h       |  2 +-
 8 files changed, 118 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 542be1c3c315..3bd244784af1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -259,6 +259,7 @@ config PPC
 	select HAVE_OPTPROBES
 	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
 	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
+	select HAVE_UACCESS_VALIDATION		if HAVE_OBJTOOL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 100a386fcd71..298e2656e911 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -267,7 +267,7 @@ objtool-args-$(CONFIG_RETHUNK)				+= --rethunk
 objtool-args-$(CONFIG_SLS)				+= --sls
 objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
 objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
-objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
+objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess --sec-address
 objtool-args-$(CONFIG_GCOV_KERNEL)			+= --no-unreachable
 objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
 
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..e95c0470e34b 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -43,24 +43,72 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			    unsigned long offset, unsigned int maxlen,
 			    struct instruction *insn)
 {
-	unsigned int opcode;
+	unsigned int opcode, xop;
+	unsigned int rs, ra, rb, bo, bi, to, uimm, l;
 	enum insn_type typ;
 	unsigned long imm;
 	u32 ins;
 
 	ins = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
 	opcode = ins >> 26;
-	typ = INSN_OTHER;
-	imm = 0;
+	xop = (ins >> 1) & 0x3ff;
+	rs = bo = to = (ins >> 21) & 0x1f;
+	ra = bi = (ins >> 16) & 0x1f;
+	rb = (ins >> 11) & 0x1f;
+	uimm = (ins >> 0) & 0xffff;
+	l = ins & 1;
 
 	switch (opcode) {
+	case 16: /* bc[l][a] */
+		if (ins & 1)	/* bcl[a] */
+			typ = INSN_OTHER;
+		else		/* bc[a] */
+			typ = INSN_JUMP_CONDITIONAL;
+
+		imm = ins & 0xfffc;
+		if (imm & 0x8000)
+			imm -= 0x10000;
+		imm |= ins & 2;	/* AA flag */
+		insn->immediate = imm;
+		break;
 	case 18: /* b[l][a] */
-		if ((ins & 3) == 1) /* bl */
+		if (ins & 1)	/* bl[a] */
 			typ = INSN_CALL;
+		else		/* b[a] */
+			typ = INSN_JUMP_UNCONDITIONAL;
 
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
+		imm |= ins & 2;	/* AA flag */
+		insn->immediate = imm;
+		break;
+	case 19:
+		if (xop == 16 && bo == 20 && bi == 0)	/* blr */
+			typ = INSN_RETURN;
+		else if (xop == 50)	/* rfi */
+			typ = INSN_JUMP_DYNAMIC;
+		else if (xop == 528 && bo == 20 && bi ==0 && !l)	/* bctr */
+			typ = INSN_JUMP_DYNAMIC;
+		else if (xop == 528 && bo == 20 && bi ==0 && l)		/* bctrl */
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
 
@@ -70,13 +118,15 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
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
 
diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
index ffef9ada7133..a679b36307a9 100644
--- a/tools/objtool/arch/powerpc/include/arch/special.h
+++ b/tools/objtool/arch/powerpc/include/arch/special.h
@@ -6,7 +6,7 @@
 #define EX_ORIG_OFFSET 0
 #define EX_NEW_OFFSET 4
 
-#define JUMP_ENTRY_SIZE 16
+#define JUMP_ENTRY_SIZE 12
 #define JUMP_ORIG_OFFSET 0
 #define JUMP_NEW_OFFSET 4
 #define JUMP_KEY_OFFSET 8
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index d33868147196..0e301b3a5b71 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -13,7 +13,47 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 }
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				    struct instruction *insn, bool *is_rel)
 {
-	exit(-1);
+	struct reloc  *text_reloc, *rodata_reloc;
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
+	table_offset = text_reloc->addend;
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
+	if (find_symbol_containing(table_sec, table_offset)) {
+		*is_rel = false;
+		if (strcmp(table_sec->name, C_JUMP_TABLE_SECTION))
+			return NULL;
+	} else {
+		*is_rel = true;
+	}
+
+	/*
+	 * Each table entry has a rela associated with it.  The rela
+	 * should reference text in the same function as the original
+	 * instruction.
+	 */
+	rodata_reloc = find_reloc_by_dest(file->elf, table_sec, table_offset);
+	if (!rodata_reloc)
+		return NULL;
+
+	return rodata_reloc;
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 0fcf99c91400..f945fe271706 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -236,6 +236,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"x86_64_start_reservations",
 		"xen_cpu_bringup_again",
 		"xen_start_kernel",
+		"longjmp",
 	};
 
 	if (!func)
@@ -2060,13 +2061,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	 * instruction.
 	 */
 	list_for_each_entry_from(reloc, &table->sec->reloc_list, list) {
-
 		/* Check for the end of the table: */
 		if (reloc != table && reloc->jump_table_start)
 			break;
 
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc->offset != prev_offset + 8)
+		if (prev_offset && reloc->offset != prev_offset + 4)
 			break;
 
 		/* Detect function pointers from contiguous objects: */
@@ -2074,7 +2074,10 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		    reloc->addend == pfunc->offset)
 			break;
 
-		dest_insn = find_insn(file, reloc->sym->sec, reloc->addend);
+		if (table->jump_table_is_rel)
+			dest_insn = find_insn(file, reloc->sym->sec, reloc->addend + table->offset - reloc->offset);
+		else
+			dest_insn = find_insn(file, reloc->sym->sec, reloc->addend);
 		if (!dest_insn)
 			break;
 
@@ -2108,7 +2111,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
  */
 static struct reloc *find_jump_table(struct objtool_file *file,
 				      struct symbol *func,
-				      struct instruction *insn)
+				      struct instruction *insn, bool *is_rel)
 {
 	struct reloc *table_reloc;
 	struct instruction *dest_insn, *orig_insn = insn;
@@ -2125,14 +2128,7 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
 			break;
 
-		/* allow small jumps within the range */
-		if (insn->type == INSN_JUMP_UNCONDITIONAL &&
-		    insn->jump_dest &&
-		    (insn->jump_dest->offset <= insn->offset ||
-		     insn->jump_dest->offset > orig_insn->offset))
-		    break;
-
-		table_reloc = arch_find_switch_table(file, insn);
+		table_reloc = arch_find_switch_table(file, insn, is_rel);
 		if (!table_reloc)
 			continue;
 		dest_insn = find_insn(file, table_reloc->sym->sec, table_reloc->addend);
@@ -2154,6 +2150,7 @@ static void mark_func_jump_tables(struct objtool_file *file,
 {
 	struct instruction *insn, *last = NULL;
 	struct reloc *reloc;
+	bool is_rel;
 
 	func_for_each_insn(file, func, insn) {
 		if (!last)
@@ -2176,9 +2173,10 @@ static void mark_func_jump_tables(struct objtool_file *file,
 		if (insn->type != INSN_JUMP_DYNAMIC)
 			continue;
 
-		reloc = find_jump_table(file, func, insn);
+		reloc = find_jump_table(file, func, insn, &is_rel);
 		if (reloc) {
 			reloc->jump_table_start = true;
+			reloc->jump_table_is_rel = is_rel;
 			insn->_jump_table = reloc;
 		}
 	}
@@ -4024,6 +4022,11 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	if (insn->ignore || insn->type == INSN_NOP || insn->type == INSN_TRAP)
 		return true;
 
+	/* powerpc relocatable files have a word in front of each relocatable function */
+	if ((file->elf->ehdr.e_machine == EM_PPC || file->elf->ehdr.e_machine == EM_PPC64) &&
+	    (file->elf->ehdr.e_flags & EF_PPC_RELOCATABLE_LIB) &&
+	    insn_func(next_insn_same_sec(file, insn)))
+		return true;
 	/*
 	 * Ignore alternative replacement instructions.  This can happen
 	 * when a whitelisted function uses one of the ALTERNATIVE macros.
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index e1ca588eb69d..64aac87a4825 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -80,6 +80,7 @@ struct reloc {
 	s64 addend;
 	int idx;
 	bool jump_table_start;
+	bool jump_table_is_rel;
 };
 
 #define ELF_HASH_BITS	20
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 86d4af9c5aa9..803c6d3ba389 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -38,5 +38,5 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
 				 struct reloc *reloc);
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn);
+				    struct instruction *insn, bool *is_rel);
 #endif /* _SPECIAL_H */
-- 
2.40.1

