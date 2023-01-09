Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6186631F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrR7S13msz3fDk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 07:56:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cDmwrsTn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=32x68ywykdowgifsbpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cDmwrsTn;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4X41NQz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:53:48 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id h12-20020a17090a604c00b00225b2dbe4cfso3632391pjm.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GU7SFbwLvAPdD9ofPJY8ZC3AFrLWlaqOvHr/TBsM1Ak=;
        b=cDmwrsTnYnxMRe2M80E4L23YmooQix5wB2D0eUb+oN2Hp3bbyg7HFQB/PgVNLoHyKT
         pK0aWtF4CTk14CmlPxG5u4iqhHXIU+wNQHLdGD94tpFP5D5/s9ok9CC5dVKy7ZTVeaNC
         t3/Bp5EGifXzniBaXl20JHyzpYwXEFHr6vzZDBUr27QQthKbHcJnIlWiGRlMM6UQg0ND
         gIbAYHo5+gFS5Z1JXyH/8Q0hICWyuNm77sn6kp0Bt2Cy3fEKAr803t0EnzzgxBkOELQu
         v2Q/SfqHP/lVu/l9N+v6WarwdrrXQ25UydUZpK32X5OyRK1NLw7E4rGZtvAQp6+5paD/
         Xoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GU7SFbwLvAPdD9ofPJY8ZC3AFrLWlaqOvHr/TBsM1Ak=;
        b=YPc7E7YllDgonUyOaYauZ+qLQbcapxWBdrslgbzqCjFDsL8L80gTIg/tcJOgcB4M0H
         1OhI26CMBYBNmwRaSb19ICj8vRQayODtn/MVMaQmXQybN/jlTYPpYKzmnJpNP9cc+xll
         EOfAhFuqNI58a0Njm7oVt3KCLSSIhxJtReeoTq2svT1hl4OwmlRgnlg3MihcoS0M0WW2
         Dz5jHp1ZVPzuGL4PJtGSetclunCEl+vOtEclNfG0/PFQWHFVWepK9z2LTu7c0134t1aA
         DBcPV18gJiaYJ7mBfLtlgfkZR8KLCZ3JcwaCr2e3jGExZ3PCEZWNKQmm8NfB9fdgXWag
         Dq0g==
X-Gm-Message-State: AFqh2koi5kqC49GLm2MOFjTNhGIPSxpCpx6fpGrQCnb/IFZ8j/6k3RFC
	29mytNLPu2PizpfS646aiSvxVe8HOSc=
X-Google-Smtp-Source: AMrXdXsx8jOEqF8lBOHYbim74eUIuqk/BpJXbormK1OrkMgDb8c5pT4kOfmHApmrR7R22KnvvmwfjroHm1I=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a17:902:c209:b0:177:faf5:58c5 with SMTP id
 9-20020a170902c20900b00177faf558c5mr4095626pll.166.1673297625715; Mon, 09 Jan
 2023 12:53:45 -0800 (PST)
Date: Mon,  9 Jan 2023 12:52:57 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-3-surenb@google.com>
Subject: [PATCH 02/41] maple_tree: Detect dead nodes in mas_start()
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
index ff9f04e0150d..a748938ad2e9 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -1359,11 +1359,15 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
 		mas->depth = 0;
 		mas->offset = 0;
 
+retry:
 		root = mas_root(mas);
 		/* Tree with nodes */
 		if (likely(xa_is_node(root))) {
 			mas->depth = 1;
 			mas->node = mte_safe_root(root);
+			if (mte_dead_node(mas->node))
+				goto retry;
+
 			return NULL;
 		}
 
-- 
2.39.0

