Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E967EE8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sgd2GcYz3fQJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:43:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ij3G6594;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=33ijuywykdkuxzwjsglttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ij3G6594;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scd3ZDWz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:21 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id on9-20020a17090b1d0900b0022955c2f0f4so5025887pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6D7AVbhEFxAo5EKdbJ2HQfTq9cKDp9C6gMDUsIDn2rU=;
        b=ij3G6594G9QMVIcaC7y7IotZlrRGSd461+VUEA/BMKS/DqdJRnleVk5IzJ5gil69bZ
         nXwMrZpHBfopZhY+dBOM8TntT+xgyMzx0lhn0c4XjFlDdq8hUc51rQLAJayIjAlxU0Vs
         tSDUCQts0+fWuoHVHrLcPeZOnjtBdS6uOzMiFPrkU4AVT++YMj0+eDXitszbX73gjVet
         Uj7on6Z68KT42I30IFAHZ8MnQyKVo+KH97KXkIJWbVMmYdISzeeP/HtVHdR/3Pzjnpiz
         r0YfwFvkG3mRoMMu6hvaQ0O0QqVpO+Mcl7G8itnKrK/kLoHBd5Ey6CcVhBTBp6nBJTd/
         24fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6D7AVbhEFxAo5EKdbJ2HQfTq9cKDp9C6gMDUsIDn2rU=;
        b=GzC+iJwykXrQerLjyhtMMPi07EorTWg15EK54tx0CSHYZh5XsmjM/FW/XmxHTvkord
         AXGr0aROpcCZNA84wy6PZj02sQieSKl+M62elCGLSTJKDJZntT6PuOieo50UXqQj0OmK
         t50b3T6xuNY80OS82S52JiJFoaqQKaeOwFp/GnRmkHNfeg9hnfQiAm0maTr5de1hAPyk
         wDDu2nqYJSH6IoUm7WuVnIsAG9uOjLdA8DngiVQZS7FsE8OY7qdtlnUFNUwb64sUyx2l
         TarM/sjNi0eAMwYqPAV869Vo3/R3gPBKWcC9ZrSTsH34bW0wzJU/IiJc1nepeqt103mF
         vFZA==
X-Gm-Message-State: AO0yUKX5Jb44cccb3kzP7zgrGDbcf4boOOQlez1g3ZF6DF14q+N6O7LW
	N5RulEsEHNgEMW+8upc5AeJaKCag70A=
X-Google-Smtp-Source: AK7set+8nPPCBQ/ToCHxQhHQnspD+CZKcqljSV2Aj5HMLvXZA8Wu8rpp2+AujJr6dncfulY9izqabQa2p3o=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a05:6a00:1990:b0:593:909f:ed45 with SMTP id
 d16-20020a056a00199000b00593909fed45mr72889pfl.0.1674848478930; Fri, 27 Jan
 2023 11:41:18 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:39 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-3-surenb@google.com>
Subject: [PATCH v2 02/33] maple_tree: Detect dead nodes in mas_start()
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
index e5eeecd14eee..482e17a460cb 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -1353,12 +1353,16 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
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

