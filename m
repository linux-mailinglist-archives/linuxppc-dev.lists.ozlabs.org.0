Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D78698BC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:21:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNbJ6w7Fz3fHV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:21:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JaAJMQvk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ibztywykdn4surenbgoogle.comlinuxppc-devlists.ozlabs.org@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JaAJMQvk;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWH5X3Yz3bg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:03 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-532e96672b3so8508507b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHRaAOWRO45il7vCWYolP2vMSHNJY77rtpcEDPLreFo=;
        b=JaAJMQvkQYkAsRG/T0d+zxwkrl7mq+q9FZsokrXfiBXR+R1ZXxx2vVNR2lMSqf4OC/
         WN5L5m6K8l41JtRKI2HZbVfjAY+cjnkF1BJGHx4Vp8UHSVK5UGOhTfSvkmRDjsxq+IrD
         02V2mM9EdjYNQiXsOwUhDaiCYn5z8ljJQUJeFnF2XY5CF0WF7YFz2opQhOGyVfb59slI
         zMkZhBxatB6Jt2s9icMmk1QAWL7dqweRI7j0fEknZ3XaTRcFBLrS6UTE7S7Q4BJqI8Vo
         VXsm9/T42jqn+e5iri473tsxrbcsgusYZ9oNJzgxHuxj6F/D7b6ACgioO/upEa2Rro7t
         uyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHRaAOWRO45il7vCWYolP2vMSHNJY77rtpcEDPLreFo=;
        b=H6d9bfusIZDmpBjBwWT9B+dSED+yMWvm1oMbPPrqvV11Rj+ue24/r12OKge87zH7Kx
         IjxZrhWzju+4k4giUFCASq7Di5LtwmBw/yGioa2uDDGx2LRmcrWR4HBWOCPmM2Y7PcTq
         84mV4QIQYaSdb9qb5wTmNEQyWE2HJxRojmYkead2fGIW7OgXqoPySz7mKPp6elBAOJQD
         9NGqjeKjXfNcDxNC9vMeFVF8rteu2czqDbz54L0MvQ3bgP9m4iDixeydOiYFuNGnMz1D
         PWXbzBwing3zQqK7XfczmHIZXJ65ji3VzT3W6ZMemvK1v0cLpp/zAJApSo/WEbNADBkd
         4FrA==
X-Gm-Message-State: AO0yUKV33Z2xLiY9IM5O9YbGvkvJV89GPgvR+XCfGOIkISy3b5ws+G63
	UxaAT0OhiqZilMZX0YDuGBf4AEdQRmc=
X-Google-Smtp-Source: AK7set8Uq/nZgRLZFfJuxWYQ4ij1Dw1PY56gBuOAhM9aSZ73J6nsbhc6qz5TmHaa+yP435YL3FPEkHcMzr0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:10f:b0:855:fa17:4f5f with SMTP id
 o15-20020a056902010f00b00855fa174f5fmr80ybh.1.1676524681354; Wed, 15 Feb 2023
 21:18:01 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:18 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-4-surenb@google.com>
Subject: [PATCH v3 03/35] maple_tree: Fix freeing of nodes in rcu mode
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
2.39.1

