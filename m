Return-Path: <linuxppc-dev+bounces-5322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08367A12EB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:52:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnr00bcz3bq0;
	Thu, 16 Jan 2025 09:51:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981471;
	cv=none; b=mZOZxCzc8odMMgAW2ytgqmUh5vbU7XRr/+B75A9CdpNZvzGFXnltIt873tdCNUCsDSK/9KYzYCdgNf6Hs9kyLcEY4BHQbsqCzGk6eTsGLARPkGcEa1atI9Uw9X1N5jYHmzJ/f2rVY0RuaRM6PB36gdlSrUZTgTtzRCKHy32ujZr6ircTwjCBGYPozKvvYK7eZV2zBVOcGqJsNZpzYBmDl+oExGuSH+58/tqheY4N9/J0pPOBLviLThG6/Zh3BuSAYkMDbsIxxshvTukupweYKdlAxKa8BLT5u/W5YQZDX8WFc1aIIxuzGQ0SUqnn+gvqtiP76dcRr1Rnd/xnipsdww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981471; c=relaxed/relaxed;
	bh=Uu7A2wY2PSjLBWsLHAv2yKmZr6W0/jYsX07BxiaKOVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jp8ZYEoHhoe+rTX8elXM4yudgF6bw5mECo0goORIvU6Whm4x8IwIv1fiI48Y8oA5/J3mkdej4xpCjZ6RI9eGvoDFaoHDcvZeZWRpyTnSwWmnEJ6XukT/BNLRbc2v7A9PMi0YwvxSrkk44OxSkwPQ5K/xkNHmg74LM35VIVgcnXvrjYOAZv/hlsvHY3mwR9nIiNFl+4XiHWsLcnj3udrzC+nrttb8KURYMIvt7S8guQVAt84700Km4VvQsmIYBP67ZGbCuL4Y7t1YJpILUqfP7KW3zjYaD3Jo/xm8tsdAnxSrpQyKQoxEiAwL1WfwgKwpmdvB/CR1EL1A+yK8tHjjwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnq3BL2z3dDh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:51:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcH0Tmjz9sRy;
	Wed, 15 Jan 2025 23:42:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lk43c_pRbiud; Wed, 15 Jan 2025 23:42:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcG6jFkz9sRs;
	Wed, 15 Jan 2025 23:42:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0BB48B77A;
	Wed, 15 Jan 2025 23:42:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v0ej-sZ1G8Ss; Wed, 15 Jan 2025 23:42:54 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 97C768B774;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
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
Subject: [PATCH v5 02/15] objtool: Move back misplaced comment
Date: Wed, 15 Jan 2025 23:42:42 +0100
Message-ID: <2700fb1284bc4f72bc835911a4ec914083ab88c7.1736955567.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1950; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=s34YeKjlQMgJ0BPjun7wq17Hk3TXlOThHycw1E0DOE4=; b=FjZMuTKO1BBEU/WNDtvmcSAP87mwnWMHPfelMSZxYWv7DX6+kEpMCzJSD2yYB5uE0Ar+DqUkH CJPdTNqKIY9CRZbyQyxefgC7e5KtjsPtOfvWnYr2wWKft32htJZaqT6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A comment was introduced by commit 113d4bc90483 ("objtool: Fix
clang switch table edge case") and wrongly moved by
commit d871f7b5a6a2 ("objtool: Refactor jump table code to support
other architectures") without the piece of code added with the
comment in the original commit.

Fixes: d871f7b5a6a2 ("objtool: Refactor jump table code to support other architectures")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/x86/special.c | 5 -----
 tools/objtool/check.c            | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 9c1c9df09aaa..76c7933bcb19 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -142,11 +142,6 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	    strcmp(table_sec->name, C_JUMP_TABLE_SECTION))
 		return NULL;
 
-	/*
-	 * Each table entry has a rela associated with it.  The rela
-	 * should reference text in the same function as the original
-	 * instruction.
-	 */
 	rodata_reloc = find_reloc_by_dest(file->elf, table_sec, table_offset);
 	if (!rodata_reloc)
 		return NULL;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 129c4e2245ae..58d9b1a750e3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2036,6 +2036,12 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		table_reloc = arch_find_switch_table(file, insn, &table_size);
 		if (!table_reloc)
 			continue;
+
+		/*
+		 * Each table entry has a rela associated with it.  The rela
+		 * should reference text in the same function as the original
+		 * instruction.
+		 */
 		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
 		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
 			continue;
-- 
2.47.0


