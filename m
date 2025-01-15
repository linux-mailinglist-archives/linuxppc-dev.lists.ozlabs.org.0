Return-Path: <linuxppc-dev+bounces-5315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE02A12EA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnD2sw7z3d95;
	Thu, 16 Jan 2025 09:50:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981440;
	cv=none; b=JlRHKSxh6FQgi6b1bbVpU8Cwz/nSHZDlm1Cqil5DyLlcXJXhl6/iG7CXTl8MV9pTfo9TOk2v0MxgRYOquTNDD1gQE8wmXjQo3dSqBauVyrnk2sNFUaMHHaU+JOofyOF3I0qENI+k+UdBlcPSTf+9YnaDRl8lrKcESiARUZaYFyWbzYVzFqoyfTZ6GWT9IYW4VnLQATWKRXzZdLHc7ZO2yGPw/MqI1osAxPpF40KMxUcUxoEZX+kmJh3WFRkky9d7MALEEJDyMiNWOJ5uBO2qlJJzQmwFUfxLWc3MyrNmqGaYkQB5w4i+c/XkNK82D4qWgsuAJRJWtZNA3ULs48gTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981440; c=relaxed/relaxed;
	bh=94avEXc1PB+ibtjocBLR94KmLqNP5HW9Vmq297nZa7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxWmkd0mYCq8KhSqI/xGpyxNKubwc+CrOSf8XVagOFO7v3AhdtTH0jPwbD0LEI3wao+Ou5RKVFX9kKBI0JUnv58IAsNcT8WyCpsJNgSqZk2vP9TcdZSJIEdS5DMQ+UFqvlSlmyTMtvcWOJZD5SNV/jIVQqG3ilIzEsDFqfvT5Cqx2EF/RYFYSEe0ntnfd+n8pYaYk1yuWd8Q9ED2c12vS4+VuazUS5FP0xIzJdt1gHFzcHpiCySKywZjLBanpKoD5yjNhkxSNl6cLAr9iMKdwErDyYrDsBWiA24uXENLzHEcx06Ts/JUSYUA1i4TRATWDXXwtqvmuW6xKWFqYDJHIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnC5GZjz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcd2pn8z9sSY;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdYktiID7W5v; Wed, 15 Jan 2025 23:43:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcd1v6Vz9sSX;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F7B08B77A;
	Wed, 15 Jan 2025 23:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Kex8_2sVL1dd; Wed, 15 Jan 2025 23:43:13 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BAC938B774;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 09/15] objtool: Find end of switch table directly
Date: Wed, 15 Jan 2025 23:42:49 +0100
Message-ID: <3e31a9910c471ad9c17b76a96cc910e7a8aa2a10.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=3780; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5NdIHm7DD4bTebG2kf3cj71x6eBUoq5xTfa2EU+XO1s=; b=BcAyjkvv2GQlZ+Fyl9KJ+tQwNqAdeIWlAHl9O6Ty4zCgkXVj/S8xZQe1aKUxm5oF0FDMbJc7W JOP1Tx9G/avATVxQ3jZE7d6jRzv5jFdeUmD+Jmkmbse21bYHCv8HrCo
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

At the time being, the end of a switch table can only be known
once the start of the following switch table has ben located.

This is a problem when switch tables are nested because until the first
switch table is properly added, the second one cannot be located as a
the backward walk will abut on the dynamic switch of the previous one.

So perform a first forward walk in the code in order to locate all
possible relocations to switch tables and build a local table with
those relocations. Later on once one switch table is found, go through
this local table to know where next switch table starts.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 63 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 72b977f81dd6..0ad2bdd92232 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2058,14 +2058,30 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 	}
 }
 
+static struct reloc *find_next_table(struct instruction *insn,
+				     struct reloc **table, unsigned int size)
+{
+	unsigned long offset = reloc_offset(insn_jump_table(insn));
+	int i;
+	struct reloc *reloc = NULL;
+
+	for (i = 0; i < size; i++) {
+		if (reloc_offset(table[i]) > offset &&
+		    (!reloc || reloc_offset(table[i]) < reloc_offset(reloc)))
+			reloc = table[i];
+	}
+	return reloc;
+}
+
 /*
  * First pass: Mark the head of each jump table so that in the next pass,
  * we know when a given jump table ends and the next one starts.
  */
 static int mark_add_func_jump_tables(struct objtool_file *file,
-				     struct symbol *func)
+				     struct symbol *func,
+				     struct reloc **table, unsigned int size)
 {
-	struct instruction *insn, *last = NULL, *insn_t1 = NULL, *insn_t2;
+	struct instruction *insn, *last = NULL;
 	int ret = 0;
 
 	func_for_each_insn(file, func, insn) {
@@ -2094,23 +2110,11 @@ static int mark_add_func_jump_tables(struct objtool_file *file,
 		if (!insn_jump_table(insn))
 			continue;
 
-		if (!insn_t1) {
-			insn_t1 = insn;
-			continue;
-		}
-
-		insn_t2 = insn;
-
-		ret = add_jump_table(file, insn_t1, insn_jump_table(insn_t2));
+		ret = add_jump_table(file, insn, find_next_table(insn, table, size));
 		if (ret)
 			return ret;
-
-		insn_t1 = insn_t2;
 	}
 
-	if (insn_t1)
-		ret = add_jump_table(file, insn_t1, NULL);
-
 	return ret;
 }
 
@@ -2123,15 +2127,42 @@ static int add_jump_table_alts(struct objtool_file *file)
 {
 	struct symbol *func;
 	int ret;
+	struct instruction *insn;
+	unsigned int size = 0, i = 0;
+	struct reloc **table = NULL;
 
 	if (!file->rodata)
 		return 0;
 
+	for_each_insn(file, insn) {
+		struct instruction *dest_insn;
+		struct reloc *reloc;
+		unsigned long table_size;
+
+		func = insn_func(insn) ? insn_func(insn)->pfunc : NULL;
+		reloc = arch_find_switch_table(file, insn, &table_size, NULL);
+		/*
+		 * Each table entry has a rela associated with it.  The rela
+		 * should reference text in the same function as the original
+		 * instruction.
+		 */
+		if (!reloc)
+			continue;
+		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
+			continue;
+		if (i == size) {
+			size += 1024;
+			table = realloc(table, size * sizeof(*table));
+		}
+		table[i++] = reloc;
+	}
+
 	for_each_sym(file, func) {
 		if (func->type != STT_FUNC)
 			continue;
 
-		ret = mark_add_func_jump_tables(file, func);
+		ret = mark_add_func_jump_tables(file, func, table, i);
 		if (ret)
 			return ret;
 	}
-- 
2.47.0


