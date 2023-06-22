Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2C739F29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:00:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmy8Z3N2cz3c3s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:00:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmy2j1ZJ4z3brV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:55:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qmy261sJdz9sRw;
	Thu, 22 Jun 2023 12:55:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7h7cRNzj8o8D; Thu, 22 Jun 2023 12:55:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qmy1w0LvVz9sRy;
	Thu, 22 Jun 2023 12:55:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 07B5A8B77D;
	Thu, 22 Jun 2023 12:55:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id B_gfYa5CvPIE; Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EE278B780;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35MAssbH2382591
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 12:54:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35MAss3e2382590;
	Thu, 22 Jun 2023 12:54:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 10/14] objtool: Add support for relative switch tables
Date: Thu, 22 Jun 2023 12:54:32 +0200
Message-Id: <1d60e0ffe692289fd01485f680e87161bef98760.1687430631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687430631.git.christophe.leroy@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687431272; l=6797; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xvlcGloqvQ2Rre7Q94wG8EUJ6xZSV+MbLLnxuvwPGC4=; b=JvulI/ygHvEYPWgk+Ik3QDika4dOXY5JE8/Z/jhRMM3MKVb7/G+ZutHXu0bLEiREAerpojtB5 22TajAU2KGgCp+peNeYcOzfWpeIHUbbQk52wLxlcipeBIQ9RtRwee2l
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

On powerpc, switch tables are relative, than means the address of the
table is added to the value of the entry in order to get the pointed
address: (r10 is the table address, r4 the index in the table)

      lis     r10,0		<== Load r10 with upper part of .rodata address
          R_PPC_ADDR16_HA     .rodata
      addi    r10,r10,0		<== Add lower part of .rodata address
          R_PPC_ADDR16_LO     .rodata
      lwzx    r8,r10,r4		<== Read table entry at r10 + r4 into r8
      add     r10,r8,r10	<== Add table address to read value
      mtctr   r10		<== Save calculated address in CTR
      bctr			<== Branch to address in CTR

But for c_jump_tables it is not the case, they contain the
pointed address directly:

      lis     r28,0		<== Load r28 with upper .rodata..c_jump_table
          R_PPC_ADDR16_HA   .rodata..c_jump_table
      addi    r28,r28,0		<== Add lower part of .rodata..c_jump_table
          R_PPC_ADDR16_LO   .rodata..c_jump_table
      lwzx    r10,r28,r10	<== Read table entry at r10 + r28 into r10
      mtctr   r10		<== Save read value in CTR
      bctr			<== Branch to address in CTR

Add support to objtool for relative tables, with a flag in order to
tell table by table if that table uses relative or absolute addressing.

And use correct size for 'long' instead of hard coding a size of '8'.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/powerpc/special.c    |  2 +-
 tools/objtool/arch/x86/special.c        |  3 ++-
 tools/objtool/check.c                   | 21 ++++++++++++++-------
 tools/objtool/include/objtool/elf.h     |  1 +
 tools/objtool/include/objtool/special.h |  2 +-
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index d33868147196..979b555b16ea 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -13,7 +13,7 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 }
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				     struct instruction *insn, bool *is_rel)
 {
 	exit(-1);
 }
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 7c97b7391279..e7e1775f313a 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -92,7 +92,7 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
  *    NOTE: RETPOLINE made it harder still to decode dynamic jumps.
  */
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				     struct instruction *insn, bool *is_rel)
 {
 	struct reloc  *text_reloc, *rodata_reloc;
 	struct section *table_sec;
@@ -141,5 +141,6 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	if (text_reloc->type == R_X86_64_PC32)
 		file->ignore_unreachables = true;
 
+	*is_rel = false;
 	return rodata_reloc;
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 8977cdf93f54..b810be087d7c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2053,7 +2053,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	struct instruction *dest_insn;
 	struct alternative *alt;
 	struct symbol *pfunc = insn_func(insn)->pfunc;
-	unsigned int prev_offset = 0;
+	unsigned int offset, prev_offset = 0;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -2066,7 +2066,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			break;
 
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc->offset != prev_offset + 8)
+		if (prev_offset && reloc->offset != prev_offset + elf_class_addrsize(file->elf))
 			break;
 
 		/* Detect function pointers from contiguous objects: */
@@ -2074,7 +2074,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		    reloc->addend == pfunc->offset)
 			break;
 
-		dest_insn = find_insn(file, reloc->sym->sec, reloc->addend);
+		if (table->jump_table_is_rel)
+			offset = reloc->addend + table->offset - reloc->offset;
+		else
+			offset = reloc->addend;
+
+		dest_insn = find_insn(file, reloc->sym->sec, offset);
 		if (!dest_insn)
 			break;
 
@@ -2107,8 +2112,8 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
  * associated with it.
  */
 static struct reloc *find_jump_table(struct objtool_file *file,
-				      struct symbol *func,
-				      struct instruction *insn)
+				     struct symbol *func,
+				     struct instruction *insn, bool *is_rel)
 {
 	struct reloc *table_reloc;
 	struct instruction *dest_insn, *orig_insn = insn;
@@ -2132,7 +2137,7 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		     insn->jump_dest->offset > orig_insn->offset))
 		    break;
 
-		table_reloc = arch_find_switch_table(file, insn);
+		table_reloc = arch_find_switch_table(file, insn, is_rel);
 		if (!table_reloc)
 			continue;
 		dest_insn = find_insn(file, table_reloc->sym->sec, table_reloc->addend);
@@ -2154,6 +2159,7 @@ static void mark_func_jump_tables(struct objtool_file *file,
 {
 	struct instruction *insn, *last = NULL;
 	struct reloc *reloc;
+	bool is_rel;
 
 	func_for_each_insn(file, func, insn) {
 		if (!last)
@@ -2176,9 +2182,10 @@ static void mark_func_jump_tables(struct objtool_file *file,
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
index 86d4af9c5aa9..5edfc4c3e582 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -38,5 +38,5 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
 				 struct reloc *reloc);
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn);
+				     struct instruction *insn, bool *is_rel);
 #endif /* _SPECIAL_H */
-- 
2.40.1

