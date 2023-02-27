Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 277786A483A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:38:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSQM0MHRz3f61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:38:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J1npsbv1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3j-r8ywykdbyegd09x2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J1npsbv1;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNV4rgNz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:42 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id fy8-20020a17090b020800b002374c592205so1891530pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oOfd5ioBGFgnDThXBfBlaouYrbK90Ol7CTAINZYLi8=;
        b=J1npsbv1gUS6Xx9BiEsQjP7XeeP4aS0zilvFmnv/Rz+GOr5UTDVWeJrWl0j62csJqw
         pABdpewltkyMDTz5x9er0/tmyJAZh7x/KhM7c8duF9xadmsMayPg+H71fGIGq8oPKWOj
         MgbVwv2JgaJHWGglF3BAvt4DqnEv/mXmkg9toQmUgHu4O8sWHghp6pe4qMmBQxfPPa9Z
         PixCDkJQkwa7ilKkjAeCuQR96NDmtVqp0ZmLhbk++NpcJ1RgmTRpPPKm+6LBvLnGJc6j
         5RqWVbaNSaafI5Uk5daP/3bMtRsXgSv4TZmCrUrgFU7+20OuWfc4Q8qOQnmnQqR2Eexd
         RlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oOfd5ioBGFgnDThXBfBlaouYrbK90Ol7CTAINZYLi8=;
        b=0mrjB/Z1bDVwwjCJWQPHWoMoCPJOXTHi+p/YSUNzKItCAElGwdjUfs1P0K8CR1PRla
         DQk9cNRtcA9c09Vi18utugYrC7wgcYuQMhvaCyXmu68e1wE4FyHpY+oE3s27IgIzVRxI
         OZnDLordWoMM6QPByI4rHJYqGYeUbQKJVZDNXYWoGGcnxVJ81nXfggRyWdLKKNcpSUEF
         f0EKXe7Hj9bvOXGzsFwfVhDFYYulv+W1Tezu3RjzP9+F0rpG+5bFoGdt8EBAaqxGY5aK
         4iZRf2EanxXyUyev/xg6k2G4nALwUgN7/mipkU+Iih08xluOfSTX4wcVTQ3Zz+BMttv4
         QIwg==
X-Gm-Message-State: AO0yUKUwFTren9Y2rw8fkn0HQhkfFhbloZV00u2YIVtcAu9f/kQS0D+z
	zwnIr+XDNkU9q/AmxPkc7qKHRI+Rl9A=
X-Google-Smtp-Source: AK7set8H0aV6OfunNhl/Vx76nzg5qpE5z0RrBhYwaC/okN28yJslkLbmkGTcNV4WqgwtQAFy3/Xgq0PVYIo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a17:90b:17c9:b0:237:ae7c:1595 with SMTP id
 me9-20020a17090b17c900b00237ae7c1595mr187914pjb.2.1677519399986; Mon, 27 Feb
 2023 09:36:39 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:00 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-2-surenb@google.com>
Subject: [PATCH v4 01/33] maple_tree: Be more cautious about dead nodes
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

ma_pivots() and ma_data_end() may be called with a dead node.  Ensure to
that the node isn't dead before using the returned values.

This is necessary for RCU mode of the maple tree.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 52 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 646297cae5d1..cc356b8369ad 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -544,6 +544,7 @@ static inline bool ma_dead_node(const struct maple_node *node)
 
 	return (parent == node);
 }
+
 /*
  * mte_dead_node() - check if the @enode is dead.
  * @enode: The encoded maple node
@@ -625,6 +626,8 @@ static inline unsigned int mas_alloc_req(const struct ma_state *mas)
  * @node - the maple node
  * @type - the node type
  *
+ * In the event of a dead node, this array may be %NULL
+ *
  * Return: A pointer to the maple node pivots
  */
 static inline unsigned long *ma_pivots(struct maple_node *node,
@@ -1096,8 +1099,11 @@ static int mas_ascend(struct ma_state *mas)
 		a_type = mas_parent_enum(mas, p_enode);
 		a_node = mte_parent(p_enode);
 		a_slot = mte_parent_slot(p_enode);
-		pivots = ma_pivots(a_node, a_type);
 		a_enode = mt_mk_node(a_node, a_type);
+		pivots = ma_pivots(a_node, a_type);
+
+		if (unlikely(ma_dead_node(a_node)))
+			return 1;
 
 		if (!set_min && a_slot) {
 			set_min = true;
@@ -1401,6 +1407,9 @@ static inline unsigned char ma_data_end(struct maple_node *node,
 {
 	unsigned char offset;
 
+	if (!pivots)
+		return 0;
+
 	if (type == maple_arange_64)
 		return ma_meta_end(node, type);
 
@@ -1436,6 +1445,9 @@ static inline unsigned char mas_data_end(struct ma_state *mas)
 		return ma_meta_end(node, type);
 
 	pivots = ma_pivots(node, type);
+	if (unlikely(ma_dead_node(node)))
+		return 0;
+
 	offset = mt_pivots[type] - 1;
 	if (likely(!pivots[offset]))
 		return ma_meta_end(node, type);
@@ -4505,6 +4517,9 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 	node = mas_mn(mas);
 	slots = ma_slots(node, mt);
 	pivots = ma_pivots(node, mt);
+	if (unlikely(ma_dead_node(node)))
+		return 1;
+
 	mas->max = pivots[offset];
 	if (offset)
 		mas->min = pivots[offset - 1] + 1;
@@ -4526,6 +4541,9 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 		slots = ma_slots(node, mt);
 		pivots = ma_pivots(node, mt);
 		offset = ma_data_end(node, mt, pivots, mas->max);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
 		if (offset)
 			mas->min = pivots[offset - 1] + 1;
 
@@ -4574,6 +4592,7 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 	struct maple_enode *enode;
 	int level = 0;
 	unsigned char offset;
+	unsigned char node_end;
 	enum maple_type mt;
 	void __rcu **slots;
 
@@ -4597,7 +4616,11 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 		node = mas_mn(mas);
 		mt = mte_node_type(mas->node);
 		pivots = ma_pivots(node, mt);
-	} while (unlikely(offset == ma_data_end(node, mt, pivots, mas->max)));
+		node_end = ma_data_end(node, mt, pivots, mas->max);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
+	} while (unlikely(offset == node_end));
 
 	slots = ma_slots(node, mt);
 	pivot = mas_safe_pivot(mas, pivots, ++offset, mt);
@@ -4613,6 +4636,9 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 		mt = mte_node_type(mas->node);
 		slots = ma_slots(node, mt);
 		pivots = ma_pivots(node, mt);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
 		offset = 0;
 		pivot = pivots[0];
 	}
@@ -4659,11 +4685,14 @@ static inline void *mas_next_nentry(struct ma_state *mas,
 		return NULL;
 	}
 
-	pivots = ma_pivots(node, type);
 	slots = ma_slots(node, type);
-	mas->index = mas_safe_min(mas, pivots, mas->offset);
+	pivots = ma_pivots(node, type);
 	count = ma_data_end(node, type, pivots, mas->max);
-	if (ma_dead_node(node))
+	if (unlikely(ma_dead_node(node)))
+		return NULL;
+
+	mas->index = mas_safe_min(mas, pivots, mas->offset);
+	if (unlikely(ma_dead_node(node)))
 		return NULL;
 
 	if (mas->index > max)
@@ -4817,6 +4846,11 @@ static inline void *mas_prev_nentry(struct ma_state *mas, unsigned long limit,
 
 	slots = ma_slots(mn, mt);
 	pivots = ma_pivots(mn, mt);
+	if (unlikely(ma_dead_node(mn))) {
+		mas_rewalk(mas, index);
+		goto retry;
+	}
+
 	if (offset == mt_pivots[mt])
 		pivot = mas->max;
 	else
@@ -6631,11 +6665,11 @@ static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
 	while (likely(!ma_is_leaf(mt))) {
 		MT_BUG_ON(mas->tree, mte_dead_node(mas->node));
 		slots = ma_slots(mn, mt);
-		pivots = ma_pivots(mn, mt);
-		max = pivots[0];
 		entry = mas_slot(mas, slots, 0);
+		pivots = ma_pivots(mn, mt);
 		if (unlikely(ma_dead_node(mn)))
 			return NULL;
+		max = pivots[0];
 		mas->node = entry;
 		mn = mas_mn(mas);
 		mt = mte_node_type(mas->node);
@@ -6655,13 +6689,13 @@ static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
 	if (likely(entry))
 		return entry;
 
-	pivots = ma_pivots(mn, mt);
-	mas->index = pivots[0] + 1;
 	mas->offset = 1;
 	entry = mas_slot(mas, slots, 1);
+	pivots = ma_pivots(mn, mt);
 	if (unlikely(ma_dead_node(mn)))
 		return NULL;
 
+	mas->index = pivots[0] + 1;
 	if (mas->index > limit)
 		goto none;
 
-- 
2.39.2.722.g9855ee24e9-goog

