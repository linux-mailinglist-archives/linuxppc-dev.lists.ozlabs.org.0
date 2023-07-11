Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337074F4A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:15:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mFL6hg0z3gwv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m6T6nPKz3dJj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5S03gdz9sFB;
	Tue, 11 Jul 2023 18:09:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dq2wk4YP3-Sx; Tue, 11 Jul 2023 18:08:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C5dM5z9sFP;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBF348B779;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mZOkKT6vsgFz; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD3D68B77E;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8j593696828
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:45 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8j7f3696827;
	Tue, 11 Jul 2023 18:08:45 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 07/15] objtool: Merge mark_func_jump_tables() and add_func_jump_tables()
Date: Tue, 11 Jul 2023 18:08:33 +0200
Message-ID: <0803f9de476eb9485fc22e2ac080e6ae734f5d6b.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091705; l=1922; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=SlmT1C5ivl5NXIHNullp0y7NLXMRpXMW0bpClqDQ3p0=; b=sanrNniV6SKkllj2MruVQBdISFqCNjpG00G9TvrcwGoJ5Wd8zVl1zTXpzjJjSY0OWU3EO02MG bcomKi4le9pBWZTWw6PCXu891aLL3ZdwcLxGUEOYTdv4aXCQj9ncldR
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

Those two functions loop over the instructions of a function.
Merge the two loops in order to ease enhancement of table end
in a following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 5a6a87ddbf27..d51f47c4a3bd 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2097,11 +2097,12 @@ static struct reloc *find_jump_table(struct objtool_file *file,
  * First pass: Mark the head of each jump table so that in the next pass,
  * we know when a given jump table ends and the next one starts.
  */
-static void mark_func_jump_tables(struct objtool_file *file,
-				    struct symbol *func)
+static int mark_add_func_jump_tables(struct objtool_file *file,
+				     struct symbol *func)
 {
-	struct instruction *insn, *last = NULL;
+	struct instruction *insn, *last = NULL, *insn_t1 = NULL, *insn_t2;
 	struct reloc *reloc;
+	int ret = 0;
 
 	func_for_each_insn(file, func, insn) {
 		if (!last)
@@ -2127,17 +2128,7 @@ static void mark_func_jump_tables(struct objtool_file *file,
 		reloc = find_jump_table(file, func, insn);
 		if (reloc)
 			insn->_jump_table = reloc;
-	}
-}
-
-static int add_func_jump_tables(struct objtool_file *file,
-				  struct symbol *func)
-{
-	struct instruction *insn, *insn_t1 = NULL, *insn_t2;
-	int ret = 0;
-
-	func_for_each_insn(file, func, insn) {
-		if (!insn_jump_table(insn))
+		else
 			continue;
 
 		if (!insn_t1) {
@@ -2177,8 +2168,7 @@ static int add_jump_table_alts(struct objtool_file *file)
 		if (func->type != STT_FUNC)
 			continue;
 
-		mark_func_jump_tables(file, func);
-		ret = add_func_jump_tables(file, func);
+		ret = mark_add_func_jump_tables(file, func);
 		if (ret)
 			return ret;
 	}
-- 
2.41.0

