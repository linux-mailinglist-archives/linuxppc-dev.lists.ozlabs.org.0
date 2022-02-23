Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00184C122C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 13:03:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3ZRl16Bzz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 23:02:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3ZRK5Dvjz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 23:02:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K3ZRC1BTJz9sSm;
 Wed, 23 Feb 2022 13:02:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQQeifkscaiX; Wed, 23 Feb 2022 13:02:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K3ZRC0BxJz9sSZ;
 Wed, 23 Feb 2022 13:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC4838B77E;
 Wed, 23 Feb 2022 13:02:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ceDBNvG5e-Zo; Wed, 23 Feb 2022 13:02:30 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.201])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 646108B763;
 Wed, 23 Feb 2022 13:02:30 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21NC2LJL1148183
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 13:02:21 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21NC2LgI1148176;
 Wed, 23 Feb 2022 13:02:21 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@redhat.com>
Subject: [PATCH v6 1/6] module: Always have struct mod_tree_root
Date: Wed, 23 Feb 2022 13:02:11 +0100
Message-Id: <c79d6178a96245e5ff6e7b9e75e067dec7de8f4d.1645607143.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1645607143.git.christophe.leroy@csgroup.eu>
References: <cover.1645607143.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645617734; l=1943; s=20211009;
 h=from:subject:message-id; bh=rL9BbR0Vuko4WRBzQFmQdRuSxsE8/lm7k9tqySSgYZk=;
 b=OIxX2OikSXw/4nJCjbBV9MFp637S3wjOVl9+TyhFVdUbLpSANdBrX/S480ZDiV7LqNk0SLARauhc
 Cy0aO/4HBSBR/ifQV/OFH32ToJMCvwrXjMnqIAHlRTbkkcmTRkMI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Aaron Tomlin <atomlin@atomlin.com>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to separate text and data, we need to setup
two rb trees.

This means that struct mod_tree_root is required even without
MODULES_TREE_LOOKUP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/module/internal.h | 4 +++-
 kernel/module/main.c     | 5 -----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index cbc268af23ae..ac64e53ac5e3 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -143,15 +143,17 @@ static inline void module_decompress_cleanup(struct load_info *info)
 }
 #endif
 
-#ifdef CONFIG_MODULES_TREE_LOOKUP
 struct mod_tree_root {
+#ifdef CONFIG_MODULES_TREE_LOOKUP
 	struct latch_tree_root root;
+#endif
 	unsigned long addr_min;
 	unsigned long addr_max;
 };
 
 extern struct mod_tree_root mod_tree;
 
+#ifdef CONFIG_MODULES_TREE_LOOKUP
 void mod_tree_insert(struct module *mod);
 void mod_tree_remove_init(struct module *mod);
 void mod_tree_remove(struct module *mod);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6e3a6b4efd21..3832a71cdacb 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -74,7 +74,6 @@ static void do_free_init(struct work_struct *w);
 static DECLARE_WORK(init_free_wq, do_free_init);
 static LLIST_HEAD(init_free_list);
 
-#ifdef CONFIG_MODULES_TREE_LOOKUP
 struct mod_tree_root mod_tree __cacheline_aligned = {
 	.addr_min = -1UL,
 };
@@ -82,10 +81,6 @@ struct mod_tree_root mod_tree __cacheline_aligned = {
 #define module_addr_min mod_tree.addr_min
 #define module_addr_max mod_tree.addr_max
 
-#else /* !CONFIG_MODULES_TREE_LOOKUP */
-static unsigned long module_addr_min = -1UL, module_addr_max;
-#endif /* CONFIG_MODULES_TREE_LOOKUP */
-
 struct symsearch {
 	const struct kernel_symbol *start, *stop;
 	const s32 *crcs;
-- 
2.34.1

