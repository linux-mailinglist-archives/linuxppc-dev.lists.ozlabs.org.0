Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81166320A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrR9d4Gddz3fFp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 07:58:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fcpOTy1E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=33n68ywykdpelnkxguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fcpOTy1E;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4d3wh4z3cCY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:53:53 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a4-20020a5b0004000000b006fdc6aaec4fso10371817ybp.20
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyMpIuQX3h8xEF8sgRu6qp18jXndG+tVBpDaAHqFUcE=;
        b=fcpOTy1E+3ThlAgpg3hHomgF7jysjdpHFVliFHHbaTXw696G+d4UafDfpkipyR4nuU
         tlOJBreetd3v3dCXyb/Rdewxh5p1khH4cqHcd7IJy4L2zy/b/nqItrk1BUqrfoTrE/cO
         7u4Zqnf/OqJvpx/Forf/3GSWw4rGhAxROXbd0Dn4cjHGhWxv2F6/FkGrRQlT4BSVn9QB
         Gq9sxTxT4dzmvld2wEbl8PkQKZUyemG56T9+2h4MZ3hLbr2uHjNUXIbifPrLJAMZf98P
         qyO5BkbAlxHe07UMVtRr4iqChj93uPwUR0TOsMr/XaxeajQHkPY5F6oCUcd/VOMyVzz5
         1yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyMpIuQX3h8xEF8sgRu6qp18jXndG+tVBpDaAHqFUcE=;
        b=MxmlDimbESK61sQMtglXNoDhdycjrKW9v6wJki+fdqVNqsBiy17BHo7dlxRsfOKMcR
         nCnVPuqn1UHEaluSFo2ZzWSyjdMcWzA/svRt/xZ9XXIYX7UWdLsqxuvd2azvFQZVZPXO
         sNpxlK4Dz5FEiZE0mexf+N0ISmiEyv59Jf22/XseYdaXoynxT8lbWkbAICGucBLsuLNk
         Gghk2hXjZyAdSaSwvcg3ROvrjR6OZf4G8I/CynmHax0SUrL0H3l2aGIPUhQyw+J2SI3E
         rrK1zTCvrvsY5WjONeUpbbcT0uJnXeB1ER/Lf2/8YsUY91dw4RQu97VjB8HBhDuVTANQ
         6zYA==
X-Gm-Message-State: AFqh2kqxP4UWckJxvXCceYQWM1bKbvFqD9GEtXv84G6PGbZULtGTOdZ+
	ZTdOwDVvA9S3CwCIwd9Lsm94gYaaWqk=
X-Google-Smtp-Source: AMrXdXs29F0iyIf9MRCODAQbmPmP2d9pU1gWPBdnTE2PRXcNw1d8zc+w15TjL10LubrEOMnWhSTePMV2FM0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a05:690c:299:b0:370:2d8c:8193 with SMTP id
 bf25-20020a05690c029900b003702d8c8193mr1225043ywb.221.1673297630870; Mon, 09
 Jan 2023 12:53:50 -0800 (PST)
Date: Mon,  9 Jan 2023 12:52:59 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-5-surenb@google.com>
Subject: [PATCH 04/41] maple_tree: remove extra smp_wmb() from mas_dead_leaves()
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

The call to mte_set_dead_node() before the smp_wmb() already calls
smp_wmb() so this is not needed.  This is an optimization for the RCU
mode of the maple tree.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index a11eea943f8d..d85291b19f86 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5510,7 +5510,6 @@ unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots,
 			break;
 
 		mte_set_node_dead(entry);
-		smp_wmb(); /* Needed for RCU */
 		node->type = type;
 		rcu_assign_pointer(slots[offset], node);
 	}
-- 
2.39.0

