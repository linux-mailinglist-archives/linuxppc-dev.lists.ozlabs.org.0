Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A46A4853
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:41:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSTT74LQz3c83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:41:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cLE4KbCr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3l-r8ywykdb4mol8h5aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cLE4KbCr;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNc1fQwz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:48 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536a4eba107so153275917b3.19
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnkDgHrJ0cqyk4yVnPbndf59jVemOaMLlO/iS92oZbE=;
        b=cLE4KbCrSo3Ipu4g+yzfkRmcncyjiA+PVjyxhSlE0CxpbROsbbX5H0DHpPWYcZcUvL
         IgBczq5t3IK+5ladr1TbWOx/+SU8LSbf8Yx9jr8PkelvEstvvhZXeX43s6JTSESoyEye
         3OJvntBP7bSxCk5pBrTwRFBtDhh/o6VDU9KVAovEJZ9n4EduivQuGfxt0pt6fskiyQUB
         zHwyjGzqyAJgiciJUq8aC5hSo+rK3+lmuiggplyhk0zrZZEyghcsffT9pFo2TSF/swmL
         j04i+/EYbcR8DTa/IGgGuaUtWO9uflgS4pwivCZBPdFnqw+L6jKJzSVJqswEg+Tmf1nw
         9kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnkDgHrJ0cqyk4yVnPbndf59jVemOaMLlO/iS92oZbE=;
        b=2xYOxirtE14PgTgBlEk0r1+pBBpp6qDeH2R282FCwdnsbewZiZkumYLM4XPyFG0Jf2
         shdCYSxFK9d4EEWGgs3vOo0/WuBndnrsAHbPKOMxfrqe8aELiMRiyB6eYX/Sq7tuOMYO
         Y7cVrOy8b5sl1y4XsVqg3rBn0WB9HUhXHlq3jHUZp+ZkyAdTfI23gyHn/nKXdLhjar/r
         mHFaUxwOBAzIwJFbsXwOmUPSfgyM1HNmwQtu5xZcqcSd5FzQ253XIBZeB5xFuadDhy9h
         i9wf1sNKBnsW8pzokSJcAD1lowMAYUdqSQWxuUtiAq7mFqasURVm/p+cekZmxavYJF5f
         Lp9Q==
X-Gm-Message-State: AO0yUKUrJ4UXFbCs/hNwytFCBcDaSavgSmINRqCd8kFI7Ef+wcqZqjPe
	NzhswEzmQMuCklaZ4kh/cfp7E4WJGjs=
X-Google-Smtp-Source: AK7set9OxVnGQxF1LzHrZxP47amBuaMy7ZRonNPJ1uJTtUoNYZIGL83gP4W8p3rUFsPEboBNOudLGUD3TJ0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a05:6902:34f:b0:a35:f3f2:7deb with SMTP id
 e15-20020a056902034f00b00a35f3f27debmr14636ybs.250.1677519407298; Mon, 27 Feb
 2023 09:36:47 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:03 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-5-surenb@google.com>
Subject: [PATCH v4 04/33] maple_tree: remove extra smp_wmb() from mas_dead_leaves()
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
index 44d6ce30b28e..3d5ab02f981a 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5517,7 +5517,6 @@ unsigned char mas_dead_leaves(struct ma_state *mas, void __rcu **slots,
 			break;
 
 		mte_set_node_dead(entry);
-		smp_wmb(); /* Needed for RCU */
 		node->type = type;
 		rcu_assign_pointer(slots[offset], node);
 	}
-- 
2.39.2.722.g9855ee24e9-goog

