Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816BF74F49D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mD93Jllz3gmb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:14:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m6L2sXQz3dJ9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5P4Z6Hz9sFM;
	Tue, 11 Jul 2023 18:08:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7h6PuQNjCwxH; Tue, 11 Jul 2023 18:08:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C4m0pz9sFK;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D2608B77A;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ApjKmr9blWDq; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E75B98B783;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8inM3696801
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:44 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8hr53696798;
	Tue, 11 Jul 2023 18:08:43 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 02/15] objtool: Move back misplaced comment
Date: Tue, 11 Jul 2023 18:08:28 +0200
Message-ID: <ef65962348c12705b291a6e06ad63aaa29ae5213.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091705; l=1925; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=4ExwdTByGoB2+8hlDUXdUlnHvdx3p3zBzyXw0Z2vUVg=; b=gIH6fljQ7rT92xPZWkRaTFrAS8KnWZjltM17fd/9Swn12qYCdIetVOAhY6tEGKUvHVjtGQkcQ hWmyJCc3ZZkAj/b4UCCbIIk1jXr/asR3uHbHZElbAm619yeirANyCD0
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
index 29e949579ede..8e8302fe909f 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -118,11 +118,6 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
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
index 8936a05f0e5a..25f6df4713ed 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2072,6 +2072,12 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		table_reloc = arch_find_switch_table(file, insn);
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
2.41.0

