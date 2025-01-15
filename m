Return-Path: <linuxppc-dev+bounces-5311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DBCA12E9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmv1KbJz3cTy;
	Thu, 16 Jan 2025 09:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981423;
	cv=none; b=UcGaYQatKCShsDoD8jkp3G9oWKKHwgcdWfo0ICNyGQ2jK3sGgmZh+B8GiwrAfu4iDJjhrsCvU9lTUQtealprfblwwnS+pBPmxy6ehtOAx5/IKyyURHiwlNiHoXoW0cqvaK9xvyACz7uChaIfZmhV2rBU97v45K5GhoH6xnmlLOEoOxGyUrFmnqZ6OGbNqby4TpnDiv52/sNkab2fBhIWVgSOtaFmBz966XZU7sJ7b3baImzhF1rtvoVqq7RN89lLZxNPUOidsdnxkXR8y9Gj1biumyCQmRE6f+eV7MaeV81dgs02XDs/pbbWGx61lZHuqWN/ZrbW5ionSM92+g0FIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981423; c=relaxed/relaxed;
	bh=qNP09e3mo4va6iqzBtAeSUZCxZTh2dhHrinbwFeREic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L254UZDd8NQ5seMzHx7UrD3xtLdO/CUl/sJixBvrGZv9epryp4qqZgaPW8QbXi6cJc2r6nEX2jFaMYva22tH0EXPMlaImhQtxXrSukfcagb5e7YxA6YpCGD6uRy47+trXNL+OfQrjCD3cWMN8Np2/D/2q2LxQvyicv3W5Z3PT4QC+CqcmNHtSFreUQX/pAyzuec+nlLJZx1MOfuW3gEjNddxPemqGti4tYpws9+awUGtEYBKTF+LqcfiZ1ElQECerh/bUGKsr09GSbymJ6MdMKrfwek0pyqCSIUeS28ytFR/J3rKuvDAHRgHDbLXB4MmEqONTkJEOB7jbUNgpLQgpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmt3mt2z2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcX29s1z9sST;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwAN_bvuo6ta; Wed, 15 Jan 2025 23:43:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcX1QY9z9sSS;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FE798B77A;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MyG2dnFOf3Vo; Wed, 15 Jan 2025 23:43:08 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B1A9B8B774;
	Wed, 15 Jan 2025 23:43:05 +0100 (CET)
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
Subject: [PATCH v5 07/15] objtool: Merge mark_func_jump_tables() and add_func_jump_tables()
Date: Wed, 15 Jan 2025 23:42:47 +0100
Message-ID: <98a12e927d23a817a11b2ad9cdf209f64be53567.1736955567.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1841; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y/lU/ClBPP266lfq5TBMJ0Mc7FqwzIGQ/ba4ZqZNO8o=; b=ihN06500jJgWzVltSkCjOOw0Dd4+kOXr7vMofNesf4gxw29RG1Dve/n4b9Uq1ABgP/9Hcf40A hlXu1vJuIUlDCYzDGUJfz3m6xFv9AAZZI5W6raZIDtyeCgjot3kjjjB
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Those two functions loop over the instructions of a function.
Merge the two loops in order to ease enhancement of table end
in a following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4495e7823b29..613d169eb6b8 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2061,10 +2061,11 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
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
+	int ret = 0;
 
 	func_for_each_insn(file, func, insn) {
 		if (!last)
@@ -2088,16 +2089,7 @@ static void mark_func_jump_tables(struct objtool_file *file,
 			continue;
 
 		find_jump_table(file, func, insn);
-	}
-}
 
-static int add_func_jump_tables(struct objtool_file *file,
-				  struct symbol *func)
-{
-	struct instruction *insn, *insn_t1 = NULL, *insn_t2;
-	int ret = 0;
-
-	func_for_each_insn(file, func, insn) {
 		if (!insn_jump_table(insn))
 			continue;
 
@@ -2138,8 +2130,7 @@ static int add_jump_table_alts(struct objtool_file *file)
 		if (func->type != STT_FUNC)
 			continue;
 
-		mark_func_jump_tables(file, func);
-		ret = add_func_jump_tables(file, func);
+		ret = mark_add_func_jump_tables(file, func);
 		if (ret)
 			return ret;
 	}
-- 
2.47.0


