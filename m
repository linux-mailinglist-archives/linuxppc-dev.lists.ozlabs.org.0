Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 780066A4859
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSVV2lssz3fCZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mjTDCe3u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3mer8ywykdcaoqnaj7ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mjTDCe3u;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNh2S8Fz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:52 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id iw4-20020a170903044400b0019ccafc1fbeso3925656plb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ei1aTodbgKgkLCHkAcrfXghqfC4aFVkwG1NwHfqe18=;
        b=mjTDCe3um0lc/xjVfVjgd+Npe9HefebnR6MJBHLvf3YF1uIBfRxVZUnFRJLGFeQ5Qn
         8RjZv63JPHIbjxEVYDv4CrjZbJnnn4Mt2fDeT1LOlyG88MFvPDh3biXldQxmJDhFfhkL
         MeulbY1wD03auJFox9o7eR+S24BryOLDDsTTZGQeZ4URN1aDTRabL9SThEbzRf62X937
         1Tp2+9t6o/KfoCPMJmoRWi+E8Rd5yccUzXxzvOPdrAcdSgNX0Ahh/fjHi6t+VXE449Oh
         mngGw09qy20HWkPARPiqIZAx0mZi+xWfyiKlsc96M1s7LVT+aejv+nyRL84gn5iOqmCZ
         H2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ei1aTodbgKgkLCHkAcrfXghqfC4aFVkwG1NwHfqe18=;
        b=oMJm5MIPvVKZoOVJioRbvcupBd5oo9T+n2S++Qal3Sx5O5GRnjVifSnPWklqNn5/bj
         H6QXSPXsNGPUgSMvCyennVM0EbXHhcbGElQ8Xishx2nmS2VbBkKqPoSc97Ixv6t6oJqg
         5yADyXzS9NwFPtwGB8juq2xRpF81PVIShEab++ek2QY+W0dfovV7SaT6FyVr49nlfj7E
         wWYEFJFk2ythqkTzn+6vLgALoY5P9/lbk5+Prfh/LBg4aLIbkdwAtM6BHj0jHAACRTuo
         Iiai8m0sjgy4yS/YfZDvzRT/cYYHBjObxt1KSM7QHv6Iq9xWiyelUula1mnibeH9SZn4
         y49g==
X-Gm-Message-State: AO0yUKVzy092WWm1y6jeZxEQtelx1dP+L1l3+jJdlz/M3Na1CD5JP424
	atNnwZebLmhyrDgWL73wJOMFlINiUYA=
X-Google-Smtp-Source: AK7set8gSrJb7C7al4vp6knawTGaEfFTfMkKKVc0fZqqef6Oc8nGI6YkUfCL0eSaXZ77p/UxVJxZTTA+0vM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a63:714f:0:b0:4fc:2058:fa2b with SMTP id
 b15-20020a63714f000000b004fc2058fa2bmr6283546pgn.3.1677519409843; Mon, 27 Feb
 2023 09:36:49 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:04 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-6-surenb@google.com>
Subject: [PATCH v4 05/33] maple_tree: Fix write memory barrier of nodes once
 dead for RCU mode
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-ker
 nel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Liam R. Howlett" <Liam.Howlett@oracle.com>

During the development of the maple tree, the strategy of freeing
multiple nodes changed and, in the process, the pivots were reused to
store pointers to dead nodes.  To ensure the readers see accurate
pivots, the writers need to mark the nodes as dead and call smp_wmb() to
ensure any readers can identify the node as dead before using the pivot
values.

There were two places where the old method of marking the node as dead
without smp_wmb() were being used, which resulted in RCU readers seeing
the wrong pivot value before seeing the node was dead.  Fix this race
condition by using mte_set_node_dead() which has the smp_wmb() call to
ensure the race is closed.

Add a WARN_ON() to the ma_free_rcu() call to ensure all nodes being
freed are marked as dead to ensure there are no other call paths besides
the two updated paths.

This is necessary for the RCU mode of the maple tree.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c                 |  7 +++++--
 tools/testing/radix-tree/maple.c | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 3d5ab02f981a..6b6eddadd9d2 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -185,7 +185,7 @@ static void mt_free_rcu(struct rcu_head *head)
  */
 static void ma_free_rcu(struct maple_node *node)
 {
-	node->parent = ma_parent_ptr(node);
+	WARN_ON(node->parent != ma_parent_ptr(node));
 	call_rcu(&node->rcu, mt_free_rcu);
 }
 
@@ -1778,8 +1778,10 @@ static inline void mas_replace(struct ma_state *mas, bool advanced)
 		rcu_assign_pointer(slots[offset], mas->node);
 	}
 
-	if (!advanced)
+	if (!advanced) {
+		mte_set_node_dead(old_enode);
 		mas_free(mas, old_enode);
+	}
 }
 
 /*
@@ -4218,6 +4220,7 @@ static inline bool mas_wr_node_store(struct ma_wr_state *wr_mas)
 done:
 	mas_leaf_set_meta(mas, newnode, dst_pivots, maple_leaf_64, new_end);
 	if (in_rcu) {
+		mte_set_node_dead(mas->node);
 		mas->node = mt_mk_node(newnode, wr_mas->type);
 		mas_replace(mas, false);
 	} else {
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 958ee9bdb316..4c89ff333f6f 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -108,6 +108,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 	MT_BUG_ON(mt, mn->slot[1] != NULL);
 	MT_BUG_ON(mt, mas_allocated(&mas) != 0);
 
+	mn->parent = ma_parent_ptr(mn);
 	ma_free_rcu(mn);
 	mas.node = MAS_START;
 	mas_nomem(&mas, GFP_KERNEL);
@@ -160,6 +161,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 		MT_BUG_ON(mt, mas_allocated(&mas) != i);
 		MT_BUG_ON(mt, !mn);
 		MT_BUG_ON(mt, not_empty(mn));
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 	}
 
@@ -192,6 +194,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 		MT_BUG_ON(mt, not_empty(mn));
 		MT_BUG_ON(mt, mas_allocated(&mas) != i - 1);
 		MT_BUG_ON(mt, !mn);
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 	}
 
@@ -210,6 +213,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 			mn = mas_pop_node(&mas);
 			MT_BUG_ON(mt, not_empty(mn));
 			MT_BUG_ON(mt, mas_allocated(&mas) != j - 1);
+			mn->parent = ma_parent_ptr(mn);
 			ma_free_rcu(mn);
 		}
 		MT_BUG_ON(mt, mas_allocated(&mas) != 0);
@@ -233,6 +237,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 			MT_BUG_ON(mt, mas_allocated(&mas) != i - j);
 			mn = mas_pop_node(&mas);
 			MT_BUG_ON(mt, not_empty(mn));
+			mn->parent = ma_parent_ptr(mn);
 			ma_free_rcu(mn);
 			MT_BUG_ON(mt, mas_allocated(&mas) != i - j - 1);
 		}
@@ -269,6 +274,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 			mn = mas_pop_node(&mas); /* get the next node. */
 			MT_BUG_ON(mt, mn == NULL);
 			MT_BUG_ON(mt, not_empty(mn));
+			mn->parent = ma_parent_ptr(mn);
 			ma_free_rcu(mn);
 		}
 		MT_BUG_ON(mt, mas_allocated(&mas) != 0);
@@ -294,6 +300,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 			mn = mas_pop_node(&mas2); /* get the next node. */
 			MT_BUG_ON(mt, mn == NULL);
 			MT_BUG_ON(mt, not_empty(mn));
+			mn->parent = ma_parent_ptr(mn);
 			ma_free_rcu(mn);
 		}
 		MT_BUG_ON(mt, mas_allocated(&mas2) != 0);
@@ -334,10 +341,12 @@ static noinline void check_new_node(struct maple_tree *mt)
 	MT_BUG_ON(mt, mas_allocated(&mas) != MAPLE_ALLOC_SLOTS + 2);
 	mn = mas_pop_node(&mas);
 	MT_BUG_ON(mt, not_empty(mn));
+	mn->parent = ma_parent_ptr(mn);
 	ma_free_rcu(mn);
 	for (i = 1; i <= MAPLE_ALLOC_SLOTS + 1; i++) {
 		mn = mas_pop_node(&mas);
 		MT_BUG_ON(mt, not_empty(mn));
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 	}
 	MT_BUG_ON(mt, mas_allocated(&mas) != 0);
@@ -375,6 +384,7 @@ static noinline void check_new_node(struct maple_tree *mt)
 		mas_node_count(&mas, i); /* Request */
 		mas_nomem(&mas, GFP_KERNEL); /* Fill request */
 		mn = mas_pop_node(&mas); /* get the next node. */
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 		mas_destroy(&mas);
 
@@ -382,10 +392,13 @@ static noinline void check_new_node(struct maple_tree *mt)
 		mas_node_count(&mas, i); /* Request */
 		mas_nomem(&mas, GFP_KERNEL); /* Fill request */
 		mn = mas_pop_node(&mas); /* get the next node. */
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 		mn = mas_pop_node(&mas); /* get the next node. */
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 		mn = mas_pop_node(&mas); /* get the next node. */
+		mn->parent = ma_parent_ptr(mn);
 		ma_free_rcu(mn);
 		mas_destroy(&mas);
 	}
@@ -35369,6 +35382,7 @@ static noinline void check_prealloc(struct maple_tree *mt)
 	MT_BUG_ON(mt, allocated != 1 + height * 3);
 	mn = mas_pop_node(&mas);
 	MT_BUG_ON(mt, mas_allocated(&mas) != allocated - 1);
+	mn->parent = ma_parent_ptr(mn);
 	ma_free_rcu(mn);
 	MT_BUG_ON(mt, mas_preallocate(&mas, GFP_KERNEL) != 0);
 	mas_destroy(&mas);
@@ -35386,6 +35400,7 @@ static noinline void check_prealloc(struct maple_tree *mt)
 	mas_destroy(&mas);
 	allocated = mas_allocated(&mas);
 	MT_BUG_ON(mt, allocated != 0);
+	mn->parent = ma_parent_ptr(mn);
 	ma_free_rcu(mn);
 
 	MT_BUG_ON(mt, mas_preallocate(&mas, GFP_KERNEL) != 0);
@@ -35756,6 +35771,7 @@ void farmer_tests(void)
 	tree.ma_root = mt_mk_node(node, maple_leaf_64);
 	mt_dump(&tree);
 
+	node->parent = ma_parent_ptr(node);
 	ma_free_rcu(node);
 
 	/* Check things that will make lockdep angry */
-- 
2.39.2.722.g9855ee24e9-goog

