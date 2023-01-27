Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA267EEBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Slr2572z3fQ2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:47:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=h4z95aWq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=36cjuywykdk8hjgtcqvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=h4z95aWq;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scq1ybVz3fHZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:31 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id z9-20020a25ba49000000b007d4416e3667so6418993ybj.23
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A97N+ZL4sr7Moa7VA3MaIfeszXjKUidgl5sbUl4VE3M=;
        b=h4z95aWqlTijLuw2+pa/O521iwctvYJ/JE9Gk94Om8JNdm1J4qRBJ1EfNZDOaurfUb
         h0xAr5ZA79m4jhsd5KmptV8L5YTVXkJEqIIo06fTcAgDWyf2Iw1unXEy8R6f3F+h7n0/
         eKAno27phPvhqEsCndY+cAQm1TD4BuL7gONpQNAXYFn8Kf2q+ZhvCxmCxJsT4hK4blKF
         lDmG8J5RutFJ9mwfq4DqWgfTIN8+TeptwgRlAF+qB5k0K+pf2NR8dkIUNhEjxCEKvwc/
         GAm3buayP+cfA/HX9e16HQfg7j+WzzAIFSLNgZD3Zm/44+VjSwN/Bplr8AdUjUNKklkq
         c5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A97N+ZL4sr7Moa7VA3MaIfeszXjKUidgl5sbUl4VE3M=;
        b=QEh6W33yoUazr6V2m7Mlhmp3i9Ayv5RGaSMfoETvnzWTAEwfUGYXd/8SdFaNiKY+J8
         tYWfeUJDJ3wBtyEIxU2XKF2qUdBR5cNU5O5MTbTh6WxTqonGQf7R1MSL6Ss6F26AkOed
         SrkAw4GmEowRe++rS3rb6FXqmmfiRWwHiZvngAdRGuLFwO7RiBDh4fXWOd13f/2MPAZs
         CVAou/V8V4GYB70bXy9ecD805e1saLKpu7GyAOlKEirWbfLwXgktAviDIVdY32x+ISKE
         n+DPUa0A+7eu8PWE0a9EOBMob7kog31OwfG2aLlBXfl1H1sPrZ0gF39LifIZ7Z98cmFF
         lllw==
X-Gm-Message-State: AO0yUKWPnIKL40sewk6OE+cohth47H2O/yL2D9IZbaa0EuWt1mt371b0
	KHGtx/8swJF9+eJTKpqcVxr11J4Ysbc=
X-Google-Smtp-Source: AK7set8r1BYS7Wv/oAXgdJ6+dIiQhgZ/QiambSorQvdFTePlCpS2jC0PmTUUP3dVFKS1ORR7IfLO9gpuOYg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:9bd6:0:b0:509:5557:c194 with SMTP id
 s205-20020a819bd6000000b005095557c194mr892323ywg.449.1674848488954; Fri, 27
 Jan 2023 11:41:28 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:43 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-7-surenb@google.com>
Subject: [PATCH v2 06/33] maple_tree: Add smp_rmb() to dead node detection
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@tec
 hsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Liam R. Howlett" <Liam.Howlett@oracle.com>

Add an smp_rmb() before reading the parent pointer to ensure that
anything read from the node prior to the parent pointer hasn't been
reordered ahead of this check.

The is necessary for RCU mode.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 49e399e8afaa..859303d2da90 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -532,9 +532,11 @@ static inline struct maple_node *mte_parent(const struct maple_enode *enode)
  */
 static inline bool ma_dead_node(const struct maple_node *node)
 {
-	struct maple_node *parent = (void *)((unsigned long)
-					     node->parent & ~MAPLE_NODE_MASK);
+	struct maple_node *parent;
 
+	/* Do not reorder reads from the node prior to the parent check */
+	smp_rmb();
+	parent = (void *)((unsigned long) node->parent & ~MAPLE_NODE_MASK);
 	return (parent == node);
 }
 
@@ -549,6 +551,8 @@ static inline bool mte_dead_node(const struct maple_enode *enode)
 	struct maple_node *parent, *node;
 
 	node = mte_to_node(enode);
+	/* Do not reorder reads from the node prior to the parent check */
+	smp_rmb();
 	parent = mte_parent(enode);
 	return (parent == node);
 }
-- 
2.39.1

