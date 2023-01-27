Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9767EE83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sfc6ZL3z3fKV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:43:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q++c4JbF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=33cjuywykdkmvxuhqejrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q++c4JbF;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scb4f53z3fFW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:19 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id x188-20020a2531c5000000b00716de19d76bso6360478ybx.19
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRJKiHKrq/SvrK23nJ6WvAwYz6ftOZ3c7xtMrR/Zkmo=;
        b=q++c4JbFs1cULNmXHJ6C3DczcQ0hXzOKIr6+9Qx2yz39vZWA+rjLc18PKWJkWy6B+C
         UeBdui8K3sk0l0OIGcxNzLRt494xbxI7WVRAtP+VLTOL1/q+UNWJf0WDLHuQPthduco2
         hKKj52t3wKu54Vbflyx5DWFngCga+0YCh2aWf3wXfSgRE76VHyLLWka1QvKlb5EEsVq+
         yKsc5SnLc4E9cZlzwXYLALtVVR/qLY2NGEjlF8VIz3gJJ8VVrEVxdVCt2bqpvNVXSzLO
         bCSv1unz+7C8JA4tTmfPKXKgKgaiBEIUDtx7XKU+dM+xg3yKNZdzkdQzW0TW1MecPnG9
         7xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRJKiHKrq/SvrK23nJ6WvAwYz6ftOZ3c7xtMrR/Zkmo=;
        b=fCaOi4UqOctQYHD6R8fH7I/TYV1X8CwjLPEss/qbrra/yh4n4pdj+Q9y72tk4UM0hs
         509YdSv9urTtAs1grcvWGT9Qe2EGochahymP1UPdMuvUfvfxgK1I8ioewSSorMaPTCdX
         eHuQAAxUHQCDPyHai/DTLItOhk1sMlmJuF7CulJJidLjl8oqWC2eSo5EQp+tQ5o0L0Mn
         FKTHfKjJpvx8M8gAbPjXoxQ21dK6hPaGsshpSavcdphu8NHqgnrgEKv6HGGkD9NLOP7l
         pWEbBx6U4uNu6cyUXkiYBxuFvsSgagsxF+ZF7pH28d18abPPihfC2P/iqjgMorPLGgim
         FM2Q==
X-Gm-Message-State: AFqh2krlGm3oL1OCvR2TA7kHRXw5Ys7G3GEwq0diB14YbDIy5m1V9KEF
	Zeb8t73AmiLdvQKHVViC5Jzodm7SmhY=
X-Google-Smtp-Source: AMrXdXvEqVwWOYAYjpqjq4VZxkQLftXilDeGRL6KyIgBgBs2rP6fdUqH1kwtp8PmmItyT8YCkU5DjbIMLFI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:4e54:0:b0:7fe:6d35:1a28 with SMTP id
 c81-20020a254e54000000b007fe6d351a28mr4351236ybb.534.1674848476456; Fri, 27
 Jan 2023 11:41:16 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:38 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-2-surenb@google.com>
Subject: [PATCH v2 01/33] maple_tree: Be more cautious about dead nodes
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, Liam Howlett <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsing
 ularity.net, rppt@kernel.org
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
index 5e9703189259..e5eeecd14eee 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -537,6 +537,7 @@ static inline bool ma_dead_node(const struct maple_node *node)
 
 	return (parent == node);
 }
+
 /*
  * mte_dead_node() - check if the @enode is dead.
  * @enode: The encoded maple node
@@ -618,6 +619,8 @@ static inline unsigned int mas_alloc_req(const struct ma_state *mas)
  * @node - the maple node
  * @type - the node type
  *
+ * In the event of a dead node, this array may be %NULL
+ *
  * Return: A pointer to the maple node pivots
  */
 static inline unsigned long *ma_pivots(struct maple_node *node,
@@ -1089,8 +1092,11 @@ static int mas_ascend(struct ma_state *mas)
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
@@ -1394,6 +1400,9 @@ static inline unsigned char ma_data_end(struct maple_node *node,
 {
 	unsigned char offset;
 
+	if (!pivots)
+		return 0;
+
 	if (type == maple_arange_64)
 		return ma_meta_end(node, type);
 
@@ -1429,6 +1438,9 @@ static inline unsigned char mas_data_end(struct ma_state *mas)
 		return ma_meta_end(node, type);
 
 	pivots = ma_pivots(node, type);
+	if (unlikely(ma_dead_node(node)))
+		return 0;
+
 	offset = mt_pivots[type] - 1;
 	if (likely(!pivots[offset]))
 		return ma_meta_end(node, type);
@@ -4498,6 +4510,9 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 	node = mas_mn(mas);
 	slots = ma_slots(node, mt);
 	pivots = ma_pivots(node, mt);
+	if (unlikely(ma_dead_node(node)))
+		return 1;
+
 	mas->max = pivots[offset];
 	if (offset)
 		mas->min = pivots[offset - 1] + 1;
@@ -4519,6 +4534,9 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 		slots = ma_slots(node, mt);
 		pivots = ma_pivots(node, mt);
 		offset = ma_data_end(node, mt, pivots, mas->max);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
 		if (offset)
 			mas->min = pivots[offset - 1] + 1;
 
@@ -4567,6 +4585,7 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 	struct maple_enode *enode;
 	int level = 0;
 	unsigned char offset;
+	unsigned char node_end;
 	enum maple_type mt;
 	void __rcu **slots;
 
@@ -4590,7 +4609,11 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
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
@@ -4606,6 +4629,9 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 		mt = mte_node_type(mas->node);
 		slots = ma_slots(node, mt);
 		pivots = ma_pivots(node, mt);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
 		offset = 0;
 		pivot = pivots[0];
 	}
@@ -4652,11 +4678,14 @@ static inline void *mas_next_nentry(struct ma_state *mas,
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
@@ -4810,6 +4839,11 @@ static inline void *mas_prev_nentry(struct ma_state *mas, unsigned long limit,
 
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
@@ -6624,11 +6658,11 @@ static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
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
@@ -6648,13 +6682,13 @@ static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
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
2.39.1

