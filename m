Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601373BD8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 19:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnkNs3y7Dz3gcT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 03:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnkDW1DQgz3cD0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 03:06:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QnkCg0hpMz9sgm;
	Fri, 23 Jun 2023 19:06:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShVDkEIm6MIw; Fri, 23 Jun 2023 19:06:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QnkCS0MM9z9sgq;
	Fri, 23 Jun 2023 19:05:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 078B88B763;
	Fri, 23 Jun 2023 19:05:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HlLOMHVpME1H; Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.71])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 861628B786;
	Fri, 23 Jun 2023 19:05:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35NH5l4S2645763
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 19:05:47 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35NH5l0G2645762;
	Fri, 23 Jun 2023 19:05:47 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v3 08/15] objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
Date: Fri, 23 Jun 2023 19:05:19 +0200
Message-Id: <7b9142e0f28e931c0274779891452d68e8050360.1687539638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687539638.git.christophe.leroy@csgroup.eu>
References: <cover.1687539638.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687539922; l=3047; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5pWBtfwxAMLbaKTOUA1+5ICdhBBvxz47VFDxStwc/L0=; b=5GbZz/1d6n8JMVkabeRJeFjViSGn/szfenlyCeBukU6BsLv/SMqKNID/36+mJHWOOubtp7QxU zGBiA88WWioAd05i+M83wbS1rvsETq1dTGZyPeIYJqpvVqfB9Hslsui
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 .../arch/powerpc/include/arch/special.h       |  2 +-
 tools/objtool/special.c                       | 55 +++++++++----------
 2 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
index ffef9ada7133..b17802dcf436 100644
--- a/tools/objtool/arch/powerpc/include/arch/special.h
+++ b/tools/objtool/arch/powerpc/include/arch/special.h
@@ -6,7 +6,7 @@
 #define EX_ORIG_OFFSET 0
 #define EX_NEW_OFFSET 4
 
-#define JUMP_ENTRY_SIZE 16
+#define JUMP_ENTRY_SIZE (8 + elf_addr_size(elf)) /* 12 on PPC32, 16 on PPC64 */
 #define JUMP_ORIG_OFFSET 0
 #define JUMP_NEW_OFFSET 4
 #define JUMP_KEY_OFFSET 8
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 91b1950f5bd8..b3f07e8beb85 100644
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

