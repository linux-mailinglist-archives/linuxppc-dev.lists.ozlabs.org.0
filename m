Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D246A484A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:39:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSRV5lJ0z3f41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:39:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rtawk/5q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3kur8ywykdbkhjg3c05dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rtawk/5q;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNY1mjTz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:45 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536a4eba107so153271757b3.19
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lArWv6/BKpLmlLXC6GszXodHEO09dxzXTjGiFRBLB5o=;
        b=Rtawk/5qB+wQAwcC1iD4VXuhoYDvFfWXoR8TLDjNU0mxzXG+OcIc5M1YDwWsJSdzc1
         5ov0BA8i2CNkZg28B06fzU5xhMSs1uI1giDFkRO+7bYBZMhhkWnMlBAHldMBIWHj/nI6
         Se6XX7qnInZ409hEUwR8XAgKIrmPJD89Fz59bDJnlZVSabti6XILWdKtE9EozNXeoXJo
         jeE4G4VS8SUdBqPqEoVdM/8Bov6AoMRWvMj0a5NQOXvkupkTbiI158Odu2A7RSMPsE77
         crrvpWC4xPR29dzTvNq/UerrAnu3X0id5UHZqYhq5AWR42pdWVuHy+UOicXnyhpFqhVJ
         jDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lArWv6/BKpLmlLXC6GszXodHEO09dxzXTjGiFRBLB5o=;
        b=KQ6ZxUu2NGaNh0UyananO9Raxc3GJHCJBUmXpA+9T5MMS5JpN9vFyvlhGMbYKSryAN
         qbl9V9GUDXLt54HKlUR6z3lyov6181Xv11TU+Zc/NSAYoO5DNWm7W5ViIfFYaJklSu8A
         OSeRGELGJwMOKPaH3rZdb/pV+uBwzrCbEPh+ijrypH0v8+LwrIUGIC0w1//YzOGttzJf
         70jMN6S0dFw992rPKjwgJCEL2ooq39HeuEdgdwWdpOP+lrc06HH0XlYMyqWvx860Voow
         PznZRDlFo6rB7BqKiSTTf9rsJTF4Fe8mXsHG2INz1W9LlY+SBUK58dAiib0+nRcZfOio
         ZMDg==
X-Gm-Message-State: AO0yUKU0YOB4YFULkoFH9xVUIblKO7hNwT4xYYTT74Bl0Cp4UMEhpJEU
	WXoUbSeoIhn4MEP0e0F5yiZCmQ1eeIs=
X-Google-Smtp-Source: AK7set/6BFahylhHoQQLwR3PqP3k7QFJ6TbZ44w6th+v/3oGX1dR6WIuOL9QS1wjUZYjoh9QnZVdIWwPxxI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a25:8890:0:b0:a0d:8150:be04 with SMTP id
 d16-20020a258890000000b00a0d8150be04mr7185754ybl.13.1677519402335; Mon, 27
 Feb 2023 09:36:42 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:01 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-3-surenb@google.com>
Subject: [PATCH v4 02/33] maple_tree: Detect dead nodes in mas_start()
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
2.39.2.722.g9855ee24e9-goog

