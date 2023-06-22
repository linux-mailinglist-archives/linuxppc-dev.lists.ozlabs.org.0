Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3E739F18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 12:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmy5P1ZHdz3c5g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 20:58:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmy2L13wzz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:55:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qmy1z2rnNz9sRn;
	Thu, 22 Jun 2023 12:55:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2sTXnLGuWS1; Thu, 22 Jun 2023 12:55:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qmy1v6Sspz9sRs;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA12C8B763;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Xnxzm3g9CkGg; Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3732F8B77C;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35MAssr72382583
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 12:54:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35MAssQM2382582;
	Thu, 22 Jun 2023 12:54:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 08/14] objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
Date: Thu, 22 Jun 2023 12:54:30 +0200
Message-Id: <85a0e5fde0c36219332a74871ef4699008ec7edb.1687430631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687430631.git.christophe.leroy@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687431272; l=2995; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=oDQ+yu2c80GlkN1xTGQWllMn8lTFly+buQPlZ9vYv6s=; b=6vfsq3Ai6s9XeMQ1kxtJ6r3TF2kx85UhChrMJNVC4mdQ8sLprQlge6yFmcRWx40NJePTmHT3I XfRCVc4YhaAB1BLREE9Z8hKbzZY5Mz6XVdJI3m/cPrUXr8TtPxzAFbs
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

	struct jump_entry {
		s32 code;
		s32 target;
		long key;
	};

It means that the size of the third argument depends on
whether we are building a 32 bits or 64 bits kernel.

Therefore JUMP_ENTRY_SIZE must depend on elf_class_addrsize(elf).

To allow that, entries[] table must be initialised at runtime. This is
easily done by moving it into its only user which is special_get_alts().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../arch/powerpc/include/arch/special.h       |  2 +-
 tools/objtool/special.c                       | 55 +++++++++----------
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
index ffef9ada7133..ede05633c2e4 100644
--- a/tools/objtool/arch/powerpc/include/arch/special.h
+++ b/tools/objtool/arch/powerpc/include/arch/special.h
@@ -6,7 +6,7 @@
 #define EX_ORIG_OFFSET 0
 #define EX_NEW_OFFSET 4
 
-#define JUMP_ENTRY_SIZE 16
+#define JUMP_ENTRY_SIZE (8 + elf_class_addrsize(elf)) /* 12 on PPC32, 16 on PPC64 */
 #define JUMP_ORIG_OFFSET 0
 #define JUMP_NEW_OFFSET 4
 #define JUMP_KEY_OFFSET 8
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index baa85c31526b..4015c1cd0fe1 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -26,34 +26,6 @@ struct special_entry {
 	unsigned char key; /* jump_label key */
 };
 
-static const struct special_entry entries[] = {
-	{
-		.sec = ".altinstructions",
-		.group = true,
-		.size = ALT_ENTRY_SIZE,
-		.orig = ALT_ORIG_OFFSET,
-		.orig_len = ALT_ORIG_LEN_OFFSET,
-		.new = ALT_NEW_OFFSET,
-		.new_len = ALT_NEW_LEN_OFFSET,
-		.feature = ALT_FEATURE_OFFSET,
-	},
-	{
-		.sec = "__jump_table",
-		.jump_or_nop = true,
-		.size = JUMP_ENTRY_SIZE,
-		.orig = JUMP_ORIG_OFFSET,
-		.new = JUMP_NEW_OFFSET,
-		.key = JUMP_KEY_OFFSET,
-	},
-	{
-		.sec = "__ex_table",
-		.size = EX_ENTRY_SIZE,
-		.orig = EX_ORIG_OFFSET,
-		.new = EX_NEW_OFFSET,
-	},
-	{},
-};
-
 void __weak arch_handle_alternative(unsigned short feature, struct special_alt *alt)
 {
 }
@@ -144,6 +116,33 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
 	unsigned int nr_entries;
 	struct special_alt *alt;
 	int idx, ret;
+	const struct special_entry entries[] = {
+		{
+			.sec = ".altinstructions",
+			.group = true,
+			.size = ALT_ENTRY_SIZE,
+			.orig = ALT_ORIG_OFFSET,
+			.orig_len = ALT_ORIG_LEN_OFFSET,
+			.new = ALT_NEW_OFFSET,
+			.new_len = ALT_NEW_LEN_OFFSET,
+			.feature = ALT_FEATURE_OFFSET,
+		},
+		{
+			.sec = "__jump_table",
+			.jump_or_nop = true,
+			.size = JUMP_ENTRY_SIZE,
+			.orig = JUMP_ORIG_OFFSET,
+			.new = JUMP_NEW_OFFSET,
+			.key = JUMP_KEY_OFFSET,
+		},
+		{
+			.sec = "__ex_table",
+			.size = EX_ENTRY_SIZE,
+			.orig = EX_ORIG_OFFSET,
+			.new = EX_NEW_OFFSET,
+		},
+		{},
+	};
 
 	INIT_LIST_HEAD(alts);
 
-- 
2.40.1

