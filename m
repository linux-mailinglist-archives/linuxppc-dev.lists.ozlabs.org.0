Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1D6A485E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSWd684hz3fDq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J5wmcAzy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3nor8ywykdcmrtqdmafnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J5wmcAzy;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNk27p8z3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:54 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5395c8fc4a1so108700687b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQNoSLNi/WgstuG55kXE7+m1dHKl+fKKDPrkCWl/DCo=;
        b=J5wmcAzyDZcatSwztTuxgzaYtke6kriIvYIqPT/BFwSZWL+3VmHsJK6pm6uqTXXs0k
         hQBQeTTqtZMXoydWH2EraS1BwJQMWApBWO4fGke8/Jq0OvUOu4cfdsRQ8dDM68VxgizQ
         ztRQr+1fezpVtAc0lp78wCnDR/PHSs/vBVo6WXbM19HIw+eJAf+OKImpXbbC44F1OdAA
         e9ipoEkHKuhTw98suQdXekAHWIPjjRBuGbOkaPOXnZpP2dJYchLjizYibUTfDcgNqsor
         BtPgKlPExQUuIZmGBr+b23UCrNVwj01MSEdyN/KRD26rWer10z6tKSB96K/CBsjdr3nr
         Dy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQNoSLNi/WgstuG55kXE7+m1dHKl+fKKDPrkCWl/DCo=;
        b=57cRctIw/xZjSDwSHrolw6rB364puJrdIeYrBZ0VBLrhbHNsAuTlJEdaxmJ7aYWN2r
         kSqFce9l/tUK0/KQRhyq/dr8uMNLhbvzNRI9Insk27wO6h7EUAitsj+UGqTr8lt0Eipt
         ghChWkMO7ZTpOjYnhbTax8HQ3EnTzh1Tpaycm5E5kHI2z/pXUhgzqmD26ul9407ArlQ4
         EfpBmTZe3khMd2FJkc6Bm9b67PpzIrTO6l2RhAaj4CGOTmZXXxtqEbjNO7um/vmWrCFR
         Te8xArE48rk7mRNWwnzcKERbpR9kGrSnnTCyPOaWCOHeQGQvyyHxf4XO8MoO5KPpHuNV
         nxkQ==
X-Gm-Message-State: AO0yUKUJdgeOK66cfR33M+tsvhs+leoRxifCmCdFWcDwA/cCD7Z/Qohr
	kHxBf11H9SANOzr9W3b29gBwBcH7BoA=
X-Google-Smtp-Source: AK7set9MzLoXjLMA6aezNIGpaaorfvcTajbjU3PQe8ye5Rv3C1xsvBgDWbku9hWg2h6JXcwKW/yoJy8kVAo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a25:e805:0:b0:a5f:0:bf12 with SMTP id
 k5-20020a25e805000000b00a5f0000bf12mr3637071ybd.13.1677519412049; Mon, 27 Feb
 2023 09:36:52 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:05 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-7-surenb@google.com>
Subject: [PATCH v4 06/33] maple_tree: Add smp_rmb() to dead node detection
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
2.39.2.722.g9855ee24e9-goog

