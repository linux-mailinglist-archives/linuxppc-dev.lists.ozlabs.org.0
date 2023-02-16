Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E7698BD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNfX34l0z3cQ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WMbcZd2H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3kbztywykdoyaczmvjowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WMbcZd2H;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWS275nz3cgy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:12 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id v63-20020a254842000000b008f257b16d71so840820yba.15
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TbDrnT4JTA4cMZmAjPRNE76LJNgcWEHHiVobOaA+Y8=;
        b=WMbcZd2H6xEYgh8jPBjtr3c52H6Pfawu+33AP54ppxn4975bHziKOFepXARIS5jFg+
         e6WwvlJoOPdxReXGpPCKc/NAAxfX4rbkO7DDbRqhMho2D2UtZ3EYOUrPrXvxo+yY0eM4
         LMQxZ5khHMqm3h0sfllZRxbm/tuunDq1ItomZ38Vc5vIB77wslGrayg6KY3mbC66vptv
         Do13gHFViUDuIVWARk2CRzZ0n21J2khqCauKfFko2Yy6sWDAGtNFzpXO3m4fv/AYk9g9
         lA127TPhorpqkZg7qKdsS4C88Qpbq0ryHT7Lx24g1uyKmp6VAfvqXa/maK1LoDRn6fAx
         1DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TbDrnT4JTA4cMZmAjPRNE76LJNgcWEHHiVobOaA+Y8=;
        b=k+JlSWeGyu0r8L4kjzpi5ZhctrPoZ9lsKkBta0zE2lNg9a8bP7H4vUCdBBqvQl2rht
         UGuD9viEtqXH37J3/R11eSkUunknw/Hl91X+aD5NtfN8PyX5q1ec5UxDdXnouxJpr0tI
         H/t+0qW/3eWMSYZwGOP9V0Kc9/vL3+rYOVXQRfNc4cr2omIXdwtWdQo7zW8seVMzSeUx
         hhJElbpfFOAeor/fG5bJ/x7qhHmA04y3+oeH9UD21yD0IZZAX/jLFZcImsvoSkFfV8js
         eF1moMel7n9ORd6PYC/MH+WHFl6NLaZgQBmr2reNyHV6tUgtK4SG7JSoeUZrY3QXQUk1
         4aPA==
X-Gm-Message-State: AO0yUKUKLxdBAX/+slMLkwwy1hpxBw8kr8Mnoe3HWkiJKUaY13oeRlmZ
	Oq4WzVtkoYQWOre3RZYUUS4hFbNp1lw=
X-Google-Smtp-Source: AK7set9oeDTHuLB1nfzndbZXzwVBlMHEMtdn96b6e8LnbJxiPKVQLZhG0+zpZpEt4JvzRmnu9oC+9ACRvag=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a25:7805:0:b0:8d7:9497:cbb3 with SMTP id
 t5-20020a257805000000b008d79497cbb3mr12ybc.5.1676524689233; Wed, 15 Feb 2023
 21:18:09 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:21 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-7-surenb@google.com>
Subject: [PATCH v3 06/35] maple_tree: Add smp_rmb() to dead node detection
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
index 6b6eddadd9d2..8ad2d1669fad 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -539,9 +539,11 @@ static inline struct maple_node *mte_parent(const struct maple_enode *enode)
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
 
@@ -556,6 +558,8 @@ static inline bool mte_dead_node(const struct maple_enode *enode)
 	struct maple_node *parent, *node;
 
 	node = mte_to_node(enode);
+	/* Do not reorder reads from the node prior to the parent check */
+	smp_rmb();
 	parent = mte_parent(enode);
 	return (parent == node);
 }
-- 
2.39.1

