Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9166A4852
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:40:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSSV3Njxz3fV9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Am83ro2Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lor8ywykdbsjli5e27ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Am83ro2Y;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNb10mdz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:47 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536d63d17dbso154486187b3.22
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=orUi5wHnC++aji9CdkMMFCsYDd1RwNIxCQdLrt+cFY0=;
        b=Am83ro2YmRzZ4VgyIBhDoTNrPllqfw/5UTqTUL7yZCncC06+SMYT4eArFva+POwT7g
         6A/0/pFhHTsDxJdieAltqSAe6HtiFFVlFItush+XbcRSxs2FetQjqrV9RzDHQ5xUXxy+
         EFVFqHW9b/Vfsu1fjnNuXuTzPWG0kNjoL02ASewZm4aTLFi207WQmvOLdMhmY0rXGsBi
         NgW5j6vPb4Yb97AotYvdQXAzm4p61g/PV5t8r9ru9nwtbYld830L0Sd8TDb9hbnZaf2S
         Co5g3ZCxIRR9yw3YwCJpCKA97OC2cOIFxPWxIRbJAgeIMHg6EAO/atx61gUeYr5Wxasb
         jnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orUi5wHnC++aji9CdkMMFCsYDd1RwNIxCQdLrt+cFY0=;
        b=UlDgwqI4sfKMEkNVF3YT03SkEvEgBmuq15S9s66/l7jnewyFXrO0Zu0hRwQi5IvlcK
         jzVM3smCWzw9JddJAbsReIDBf4dUzlHhycMbrbXf79CwZ8/m+rhnVJdad+8JImoaMXi2
         OBHUjnz4VGZkb3Q7VwcU92ia+28OC/Ypc0MLJpt/eFPJN+IHrb3UtebzQIzmkCWQ0F9G
         WgjybGxsLrNaXYRcvIZFXeCFc3BBusMnSN7kN1LItItPeKBd4PboK6TEhSqYsoTs/HXn
         VDbQFVWDouJxOpG9TnD/qS9zqW2mhJq1gbTOqW1d0a+k4QuHlwF6PGi3kzP0ReQaFYmk
         bzJA==
X-Gm-Message-State: AO0yUKUGZmS7WQt3UypbyYXeB3LEsR4Kce1NQlBrg3G75E+yiFmS5FDP
	85lkxQlLfmoC/ZsZC567A1A6vIT/eBQ=
X-Google-Smtp-Source: AK7set8ivfKmLT2u3vpwWqjPXs4Ue9yElb1Co2/gr63/ZMmCdo5ef9MT+bBbe/btFlir1Y+dX6RcjVs74cU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a5b:ecb:0:b0:a03:da3f:3e68 with SMTP id
 a11-20020a5b0ecb000000b00a03da3f3e68mr9395474ybs.12.1677519404853; Mon, 27
 Feb 2023 09:36:44 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:02 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-4-surenb@google.com>
Subject: [PATCH v4 03/33] maple_tree: Fix freeing of nodes in rcu mode
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, Liam Howlett <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@v
 ger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Liam Howlett <Liam.Howlett@oracle.com>

The walk to destroy the nodes was not always setting the node type and
would result in a destroy method potentially using the values as nodes.
Avoid this by setting the correct node types.  This is necessary for the
RCU mode of the maple tree.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 73 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 089cd76ec379..44d6ce30b28e 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -902,6 +902,44 @@ static inline void ma_set_meta(struct maple_node *mn, enum maple_type mt,
 	meta->end = end;
 }
 
+/*
+ * mas_clear_meta() - clear the metadata information of a node, if it exists
+ * @mas: The maple state
+ * @mn: The maple node
+ * @mt: The maple node type
+ * @offset: The offset of the highest sub-gap in this node.
+ * @end: The end of the data in this node.
+ */
+static inline void mas_clear_meta(struct ma_state *mas, struct maple_node *mn,
+				  enum maple_type mt)
+{
+	struct maple_metadata *meta;
+	unsigned long *pivots;
+	void __rcu **slots;
+	void *next;
+
+	switch (mt) {
+	case maple_range_64:
+		pivots = mn->mr64.pivot;
+		if (unlikely(pivots[MAPLE_RANGE64_SLOTS - 2])) {
+			slots = mn->mr64.slot;
+			next = mas_slot_locked(mas, slots,
+					       MAPLE_RANGE64_SLOTS - 1);
+			if (unlikely((mte_to_node(next) && mte_node_type(next))))
+				return; /* The last slot is a node, no metadata */
+		}
+		fallthrough;
+	case maple_arange_64:
+		meta = ma_meta(mn, mt);
+		break;
+	default:
+		return;
+	}
+
+	meta->gap = 0;
+	meta->end = 0;
+}
+
 /*
  * ma_meta_end() - Get the data end of a node from the metadata
  * @mn: The maple node
@@ -5455,20 +5493,22 @@ static inline int mas_rev_alloc(struct ma_state *mas, unsigned long min,
  * mas_dead_leaves() - Mark all leaves of a node as dead.
  * @mas: The maple state
  * @slots: Pointer to the slot array
+ * @type: The maple node type
  *
  * Must hold the write lock.
  *
  * Return: The number of leaves marked as dead.
  */
 static inline
-unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots)
+unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots,
+			      enum maple_type mt)
 {
 	struct maple_node *node;
 	enum maple_type type;
 	void *entry;
 	int offset;
 
-	for (offset = 0; offset < mt_slot_count(mas->node); offset++) {
+	for (offset = 0; offset < mt_slots[mt]; offset++) {
 		entry = mas_slot_locked(mas, slots, offset);
 		type = mte_node_type(entry);
 		node = mte_to_node(entry);
@@ -5487,14 +5527,13 @@ unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots)
 
 static void __rcu **mas_dead_walk(struct ma_state *mas, unsigned char offset)
 {
-	struct maple_node *node, *next;
+	struct maple_node *next;
 	void __rcu **slots = NULL;
 
 	next = mas_mn(mas);
 	do {
-		mas->node = ma_enode_ptr(next);
-		node = mas_mn(mas);
-		slots = ma_slots(node, node->type);
+		mas->node = mt_mk_node(next, next->type);
+		slots = ma_slots(next, next->type);
 		next = mas_slot_locked(mas, slots, offset);
 		offset = 0;
 	} while (!ma_is_leaf(next->type));
@@ -5558,11 +5597,14 @@ static inline void __rcu **mas_destroy_descend(struct ma_state *mas,
 		node = mas_mn(mas);
 		slots = ma_slots(node, mte_node_type(mas->node));
 		next = mas_slot_locked(mas, slots, 0);
-		if ((mte_dead_node(next)))
+		if ((mte_dead_node(next))) {
+			mte_to_node(next)->type = mte_node_type(next);
 			next = mas_slot_locked(mas, slots, 1);
+		}
 
 		mte_set_node_dead(mas->node);
 		node->type = mte_node_type(mas->node);
+		mas_clear_meta(mas, node, node->type);
 		node->piv_parent = prev;
 		node->parent_slot = offset;
 		offset = 0;
@@ -5582,13 +5624,18 @@ static void mt_destroy_walk(struct maple_enode *enode, unsigned char ma_flags,
 
 	MA_STATE(mas, &mt, 0, 0);
 
-	if (mte_is_leaf(enode))
+	mas.node = enode;
+	if (mte_is_leaf(enode)) {
+		node->type = mte_node_type(enode);
 		goto free_leaf;
+	}
 
+	ma_flags &= ~MT_FLAGS_LOCK_MASK;
 	mt_init_flags(&mt, ma_flags);
 	mas_lock(&mas);
 
-	mas.node = start = enode;
+	mte_to_node(enode)->ma_flags = ma_flags;
+	start = enode;
 	slots = mas_destroy_descend(&mas, start, 0);
 	node = mas_mn(&mas);
 	do {
@@ -5596,7 +5643,8 @@ static void mt_destroy_walk(struct maple_enode *enode, unsigned char ma_flags,
 		unsigned char offset;
 		struct maple_enode *parent, *tmp;
 
-		node->slot_len = mas_dead_leaves(&mas, slots);
+		node->type = mte_node_type(mas.node);
+		node->slot_len = mas_dead_leaves(&mas, slots, node->type);
 		if (free)
 			mt_free_bulk(node->slot_len, slots);
 		offset = node->parent_slot + 1;
@@ -5620,7 +5668,8 @@ static void mt_destroy_walk(struct maple_enode *enode, unsigned char ma_flags,
 	} while (start != mas.node);
 
 	node = mas_mn(&mas);
-	node->slot_len = mas_dead_leaves(&mas, slots);
+	node->type = mte_node_type(mas.node);
+	node->slot_len = mas_dead_leaves(&mas, slots, node->type);
 	if (free)
 		mt_free_bulk(node->slot_len, slots);
 
@@ -5630,6 +5679,8 @@ static void mt_destroy_walk(struct maple_enode *enode, unsigned char ma_flags,
 free_leaf:
 	if (free)
 		mt_free_rcu(&node->rcu);
+	else
+		mas_clear_meta(&mas, node, node->type);
 }
 
 /*
-- 
2.39.2.722.g9855ee24e9-goog

