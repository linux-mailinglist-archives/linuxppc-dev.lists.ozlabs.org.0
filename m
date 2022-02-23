Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F93C4C1247
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 13:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3ZSm5XNKz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 23:03:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3ZRV4BQBz3cC5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 23:02:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K3ZRF5YZlz9sSg;
 Wed, 23 Feb 2022 13:02:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PupAe0jjbyvw; Wed, 23 Feb 2022 13:02:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K3ZRC0gJ1z9sSh;
 Wed, 23 Feb 2022 13:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 085D78B779;
 Wed, 23 Feb 2022 13:02:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AROrFHZOhGpQ; Wed, 23 Feb 2022 13:02:30 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.201])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 65ED78B778;
 Wed, 23 Feb 2022 13:02:30 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21NC2LZS1148187
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 13:02:21 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21NC2LuK1148186;
 Wed, 23 Feb 2022 13:02:21 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@redhat.com>
Subject: [PATCH v6 2/6] module: Prepare for handling several RB trees
Date: Wed, 23 Feb 2022 13:02:12 +0100
Message-Id: <8788e5b6180ad45ec933359bc97c1c8fe865f186.1645607143.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1645607143.git.christophe.leroy@csgroup.eu>
References: <cover.1645607143.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645617734; l=4776; s=20211009;
 h=from:subject:message-id; bh=zW762VTX2wgJQdaUEhSgceFO6MryOmerkmFB78i7T/o=;
 b=opu3ZV2a7zUveKjdvLUAJlBYvn4o0Fkim4MybaD/po/M6L4Jo4sZpUoZZojQnG+EvZEEnt+68ssv
 sFG4q5q6CiQMIjcCvJRlIX2LlhqxRcsmGyvpggqXstHlEUFEb+xb
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
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to separate text and data, we need to setup
two rb trees.

Modify functions to give the tree as a parameter.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module/internal.h    |  4 ++--
 kernel/module/main.c        | 16 ++++++++--------
 kernel/module/tree_lookup.c | 20 ++++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index ac64e53ac5e3..0f3146347256 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -157,13 +157,13 @@ extern struct mod_tree_root mod_tree;
 void mod_tree_insert(struct module *mod);
 void mod_tree_remove_init(struct module *mod);
 void mod_tree_remove(struct module *mod);
-struct module *mod_find(unsigned long addr);
+struct module *mod_find(unsigned long addr, struct mod_tree_root *tree);
 #else /* !CONFIG_MODULES_TREE_LOOKUP */
 
 static inline void mod_tree_insert(struct module *mod) { }
 static inline void mod_tree_remove_init(struct module *mod) { }
 static inline void mod_tree_remove(struct module *mod) { }
-static inline struct module *mod_find(unsigned long addr)
+static inline struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
 {
 	struct module *mod;
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 3832a71cdacb..a831f51595d7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -91,22 +91,22 @@ struct symsearch {
  * Bounds of module text, for speeding up __module_address.
  * Protected by module_mutex.
  */
-static void __mod_update_bounds(void *base, unsigned int size)
+static void __mod_update_bounds(void *base, unsigned int size, struct mod_tree_root *tree)
 {
 	unsigned long min = (unsigned long)base;
 	unsigned long max = min + size;
 
-	if (min < module_addr_min)
-		module_addr_min = min;
-	if (max > module_addr_max)
-		module_addr_max = max;
+	if (min < tree->addr_min)
+		tree->addr_min = min;
+	if (max > tree->addr_max)
+		tree->addr_max = max;
 }
 
 static void mod_update_bounds(struct module *mod)
 {
-	__mod_update_bounds(mod->core_layout.base, mod->core_layout.size);
+	__mod_update_bounds(mod->core_layout.base, mod->core_layout.size, &mod_tree);
 	if (mod->init_layout.size)
-		__mod_update_bounds(mod->init_layout.base, mod->init_layout.size);
+		__mod_update_bounds(mod->init_layout.base, mod->init_layout.size, &mod_tree);
 }
 
 static void module_assert_mutex_or_preempt(void)
@@ -3017,7 +3017,7 @@ struct module *__module_address(unsigned long addr)
 
 	module_assert_mutex_or_preempt();
 
-	mod = mod_find(addr);
+	mod = mod_find(addr, &mod_tree);
 	if (mod) {
 		BUG_ON(!within_module(addr, mod));
 		if (mod->state == MODULE_STATE_UNFORMED)
diff --git a/kernel/module/tree_lookup.c b/kernel/module/tree_lookup.c
index 0bc4ec3b22ce..995fe68059db 100644
--- a/kernel/module/tree_lookup.c
+++ b/kernel/module/tree_lookup.c
@@ -61,14 +61,14 @@ static const struct latch_tree_ops mod_tree_ops = {
 	.comp = mod_tree_comp,
 };
 
-static noinline void __mod_tree_insert(struct mod_tree_node *node)
+static noinline void __mod_tree_insert(struct mod_tree_node *node, struct mod_tree_root *tree)
 {
-	latch_tree_insert(&node->node, &mod_tree.root, &mod_tree_ops);
+	latch_tree_insert(&node->node, &tree->root, &mod_tree_ops);
 }
 
-static void __mod_tree_remove(struct mod_tree_node *node)
+static void __mod_tree_remove(struct mod_tree_node *node, struct mod_tree_root *tree)
 {
-	latch_tree_erase(&node->node, &mod_tree.root, &mod_tree_ops);
+	latch_tree_erase(&node->node, &tree->root, &mod_tree_ops);
 }
 
 /*
@@ -80,28 +80,28 @@ void mod_tree_insert(struct module *mod)
 	mod->core_layout.mtn.mod = mod;
 	mod->init_layout.mtn.mod = mod;
 
-	__mod_tree_insert(&mod->core_layout.mtn);
+	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
 	if (mod->init_layout.size)
-		__mod_tree_insert(&mod->init_layout.mtn);
+		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
 }
 
 void mod_tree_remove_init(struct module *mod)
 {
 	if (mod->init_layout.size)
-		__mod_tree_remove(&mod->init_layout.mtn);
+		__mod_tree_remove(&mod->init_layout.mtn, &mod_tree);
 }
 
 void mod_tree_remove(struct module *mod)
 {
-	__mod_tree_remove(&mod->core_layout.mtn);
+	__mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
 	mod_tree_remove_init(mod);
 }
 
-struct module *mod_find(unsigned long addr)
+struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
 {
 	struct latch_tree_node *ltn;
 
-	ltn = latch_tree_find((void *)addr, &mod_tree.root, &mod_tree_ops);
+	ltn = latch_tree_find((void *)addr, &tree->root, &mod_tree_ops);
 	if (!ltn)
 		return NULL;
 
-- 
2.34.1

