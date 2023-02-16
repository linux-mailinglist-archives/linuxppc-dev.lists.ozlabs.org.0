Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C23698BBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:20:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNZ81Djcz3f3R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:20:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gSbKQNPX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3hrztywykdnsprobk8dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gSbKQNPX;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWG03NNz2yg5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:01 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4fa63c84621so8390607b3.20
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiC+Iexfup+RTroKLCxxsKt1sRroZAPvjqioHV2wMiw=;
        b=gSbKQNPX+j8W3tzxYZsRNAblkFTxWANtMyo2LSqGNkakVHWziV6JTyqlohrqDf6nLO
         7F5N7WpIKnXsbFPEflJy25rhat2iqZIJRLZvV94iATncucILtc8zFlPzaxOQpEoApKoJ
         RWEtB6lTCeOcIkp8qbIxk4V683W1L3zeK3vTsHv9Yla4n9gJP1xuJQs99Ms5w5HF3olN
         Kli7prX+XczaCsAJ+8hVggWwSYtxp34C+A6/4yuDSchSQcAT4VW0lygmuaxa708qKR/5
         zV/LK3WvWxvtgplCG5tRDu/7iPKMsNWXdzFiEgVvRQ3tE0ZzhzdCi73gDraIVPZ+cD1H
         1RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiC+Iexfup+RTroKLCxxsKt1sRroZAPvjqioHV2wMiw=;
        b=nSjTPTmuolZkqMfo992nUaBcwZ5Ro0lSEZcMSBpdtsx8b0aK0mZbq/tpLOQXemsQBH
         GdvGuatuU/X7s6aYIQe9djg4AdGooIwderQZF6jOAvsUn1ooAp9C2K2yV2kv/K/H3yao
         QvVWWWjaV+jkIM68wEXJT5QuV6Jjv19E81vvnp1vAhIxlurzbNE40s5DWVGzTxmruRYg
         IHUIv6E10+sZDo/B8qrS8HuhJyEWL9kTpNx1HZ0ngzL6yhKkDjD0YttHpOsE7nN9tYqm
         8ZIjLODDmd3rvY9e14T1s1Wm+JQP5iC876WHK8aLIZddh1FtIXkJqTATjVY1VH8J35RR
         Rkfw==
X-Gm-Message-State: AO0yUKW/mhJKriXlQcaqz6ybssz1S6CoT9/Tj6b9/+68OHaQRmsBFC6w
	D740XEVYODPYVTEAOEcgR/e36ELzw+A=
X-Google-Smtp-Source: AK7set+h9VKChaGyyozNEu9Udu5uv7zPqiNZXg8WkDwG0C713PEP5x3O9LtVk8xkCPSk1ZyxP2XheyHDpnY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:10f:b0:855:fa17:4f5f with SMTP id
 o15-20020a056902010f00b00855fa174f5fmr78ybh.1.1676524678798; Wed, 15 Feb 2023
 21:17:58 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:17 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-3-surenb@google.com>
Subject: [PATCH v3 02/35] maple_tree: Detect dead nodes in mas_start()
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

When initially starting a search, the root node may already be in the
process of being replaced in RCU mode.  Detect and restart the walk if
this is the case.  This is necessary for RCU mode of the maple tree.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index cc356b8369ad..089cd76ec379 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -1360,12 +1360,16 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
 		mas->max = ULONG_MAX;
 		mas->depth = 0;
 
+retry:
 		root = mas_root(mas);
 		/* Tree with nodes */
 		if (likely(xa_is_node(root))) {
 			mas->depth = 1;
 			mas->node = mte_safe_root(root);
 			mas->offset = 0;
+			if (mte_dead_node(mas->node))
+				goto retry;
+
 			return NULL;
 		}
 
-- 
2.39.1

