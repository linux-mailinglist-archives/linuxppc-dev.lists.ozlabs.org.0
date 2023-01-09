Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76E6631E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrR5R27kXz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 07:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hV1eYOET;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=31368ywykdooegdqznsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hV1eYOET;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4T6wTBz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:53:45 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id k18-20020a25e812000000b0077cc9ab9dd9so10215707ybd.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqXJ+ZomBW9TS34c/jGDj4kdswhUlT56T9j0TeoADNk=;
        b=hV1eYOET6T2afidyHxuU+TDalPYH7SoLHvYl4BYwO2+JPtGGpug5jlQUoy9K4emxnp
         wkRJchtDj68k/F+2XFNh7yn/DcVU/S6b5BfTlEf/HmlwKUP7B8xL+hIWlClC+stgjn0Q
         yjEqU4w0bHW24Tkvl4HAvFsvboqjzGC/OqOppLTxN2NoinKdWAqCYIk7Wp05H1K9TySk
         fMjEc/Qrcjc9huA2llMuqioo8fVnZzgiNBMYUce/o/EkMO+/Qtv30xUsop9ErVhi9UD1
         18fRcEvtN38NaeuSdMu7DJkgG+1MjHvnJbjraNd54FiH0BDnP0iYXASfyl6JxE09JvbK
         zNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqXJ+ZomBW9TS34c/jGDj4kdswhUlT56T9j0TeoADNk=;
        b=SxJPr0q5LBTRPl1/3Xx9yKrSdix41EcgYXPGQqhxyPXktS4ghxgtGwaqAuPZ2SoMGd
         3avmKftTmcmOCxkzu237hmJ3zhK+C6fUV8ytc43j5RfyDumtDNTHGXS08fEs3UgyRFhm
         LncBATGct5sH+L5A/OszJRmiO7tIDQEPxTaI70BpyOx3kJS6O0W2r9VpwcVJ1zyR3EO9
         v0DopSrBotrr5XnLZnGFhpCaHPlxX9LEse8IBQR7xoy2euqB3lbKUiSLe0m076EiPzPz
         AgHtqgZhN80NOs9Roy4MKwKbbz0WIuYRwVpoYhkCJ/XPzV8Y4J9qQbOJTuul+0dq2WqF
         xnCg==
X-Gm-Message-State: AFqh2kpohNMzti7xAgrY2bKGSvfBDoHa5shU7PVaBrjzS2FtsBn6GWtV
	M+8tz5IaXLLi66gGfXetVVunlipRkjc=
X-Google-Smtp-Source: AMrXdXsc+lRNNMUj/grXDfNh64QUbjHDxIxAaFKRrkqMjOPH6SvLaEBts0d+5j6B8x6v1ECq7EPEJR82hgY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:7189:0:b0:707:18f:7226 with SMTP id
 m131-20020a257189000000b00707018f7226mr210074ybc.505.1673297623117; Mon, 09
 Jan 2023 12:53:43 -0800 (PST)
Date: Mon,  9 Jan 2023 12:52:56 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-2-surenb@google.com>
Subject: [PATCH 01/41] maple_tree: Be more cautious about dead nodes
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, Liam Howlett <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mg
 orman@techsingularity.net
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
 lib/maple_tree.c | 53 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 26e2045d3cda..ff9f04e0150d 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -540,6 +540,7 @@ static inline bool ma_dead_node(const struct maple_node *node)
 
 	return (parent == node);
 }
+
 /*
  * mte_dead_node() - check if the @enode is dead.
  * @enode: The encoded maple node
@@ -621,6 +622,8 @@ static inline unsigned int mas_alloc_req(const struct ma_state *mas)
  * @node - the maple node
  * @type - the node type
  *
+ * In the event of a dead node, this array may be %NULL
+ *
  * Return: A pointer to the maple node pivots
  */
 static inline unsigned long *ma_pivots(struct maple_node *node,
@@ -1091,8 +1094,11 @@ static int mas_ascend(struct ma_state *mas)
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
@@ -1398,6 +1404,9 @@ static inline unsigned char ma_data_end(struct maple_node *node,
 {
 	unsigned char offset;
 
+	if (!pivots)
+		return 0;
+
 	if (type == maple_arange_64)
 		return ma_meta_end(node, type);
 
@@ -1433,6 +1442,9 @@ static inline unsigned char mas_data_end(struct ma_state *mas)
 		return ma_meta_end(node, type);
 
 	pivots = ma_pivots(node, type);
+	if (unlikely(ma_dead_node(node)))
+		return 0;
+
 	offset = mt_pivots[type] - 1;
 	if (likely(!pivots[offset]))
 		return ma_meta_end(node, type);
@@ -4504,6 +4516,9 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 	node = mas_mn(mas);
 	slots = ma_slots(node, mt);
 	pivots = ma_pivots(node, mt);
+	if (unlikely(ma_dead_node(node)))
+		return 1;
+
 	mas->max = pivots[offset];
 	if (offset)
 		mas->min = pivots[offset - 1] + 1;
@@ -4525,6 +4540,9 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 		slots = ma_slots(node, mt);
 		pivots = ma_pivots(node, mt);
 		offset = ma_data_end(node, mt, pivots, mas->max);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
 		if (offset)
 			mas->min = pivots[offset - 1] + 1;
 
@@ -4573,6 +4591,7 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 	struct maple_enode *enode;
 	int level = 0;
 	unsigned char offset;
+	unsigned char node_end;
 	enum maple_type mt;
 	void __rcu **slots;
 
@@ -4596,7 +4615,11 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
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
@@ -4612,6 +4635,9 @@ static inline int mas_next_node(struct ma_state *mas, struct maple_node *node,
 		mt = mte_node_type(mas->node);
 		slots = ma_slots(node, mt);
 		pivots = ma_pivots(node, mt);
+		if (unlikely(ma_dead_node(node)))
+			return 1;
+
 		offset = 0;
 		pivot = pivots[0];
 	}
@@ -4658,16 +4684,18 @@ static inline void *mas_next_nentry(struct ma_state *mas,
 		return NULL;
 	}
 
-	pivots = ma_pivots(node, type);
 	slots = ma_slots(node, type);
-	mas->index = mas_safe_min(mas, pivots, mas->offset);
-	if (ma_dead_node(node))
+	pivots = ma_pivots(node, type);
+	count = ma_data_end(node, type, pivots, mas->max);
+	if (unlikely(ma_dead_node(node)))
 		return NULL;
 
+	mas->index = mas_safe_min(mas, pivots, mas->offset);
+	if (unlikely(ma_dead_node(node)))
+		return NULL;
 	if (mas->index > max)
 		return NULL;
 
-	count = ma_data_end(node, type, pivots, mas->max);
 	if (mas->offset > count)
 		return NULL;
 
@@ -4815,6 +4843,11 @@ static inline void *mas_prev_nentry(struct ma_state *mas, unsigned long limit,
 
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
@@ -6613,11 +6646,11 @@ static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
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
@@ -6637,13 +6670,13 @@ static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
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
2.39.0

