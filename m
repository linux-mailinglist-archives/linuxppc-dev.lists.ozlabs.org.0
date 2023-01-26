Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2767D59D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rlg2YZYz3fQy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GvhfT8Hl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3pnbsywykdmez1yluinvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GvhfT8Hl;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbT3K5Pz3fG0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:13 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-509ab88f98fso22194497b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4H2JbtyBCb+lt3BMZ9RAgqYMO7ps4l+zp9I9WxDZLg0=;
        b=GvhfT8HlBz8p1gZ280ovX9/6GB7ujyE0mC33XR4z1GFfE3I8rBROHcdRdAX/8UI7kA
         /F+C+c1VR8F/5pty6DCqVVruDJ+FaYTiv9UsQ8bkabW2bhFFn7ZL+2G4uHgbOUn5krhJ
         fiQ850rSEV9tTLdVi2NHnmwUiLmCH4I/Z4cZ3D16EzW0BLVVV/iXdAF/eWZsuUqdKoqi
         9eZJA3h4Rjp/9quiM/byi/qogeVI4BWZVX0aIFHJr1GCq2CPbuY3nPW4saofEcd9+PYA
         /BJraP5tfjgrTZGsc41WIPGTxAmsx46xM/4Aci0nkz69PkDLsJDEuVCiUF4lTsZCuGWJ
         Nacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4H2JbtyBCb+lt3BMZ9RAgqYMO7ps4l+zp9I9WxDZLg0=;
        b=zxA4wsw/DJ7vh5BNbLGiMtqqo0v+SO3pezpKLouTiWx+q/0OujFT7snv79lTD7tLMc
         gvat+wO/pvMqhzAlolky/UN5DjM1U5o/JoW3idOLAimUWREY3FTishqaxyL5pVGm7an+
         raPB95t68blIT8a0Kc+JvyUYg0OJzNUhkOFoRY23Nh1lZ/H2qzpJdlZ9jaLM2qdHNM+o
         +49pK673HR8HmfwYNMlotQ9oJ0EX6j+AW/wm23GeBlXxoe4o4OmQ93wmu6xn5bE1eToM
         yA4sWHRa1r7u2sRaeCJw35jCjyQWTRGFOzxKiVxuHGLV3p6vkTaHWTVe8Xrffa5KRHi1
         +47g==
X-Gm-Message-State: AO0yUKW3rWLkhTLKUog7JQ6AOWnoFHGtsqXvf4XG+FxGAZckCcYSEaGP
	V0TiqupTfiSpgBsVTceKUYHApB4M/gU=
X-Google-Smtp-Source: AK7set+emSOKq5kkIvzyTkfP4w6nIHmsUvmKyEJhxxnr9YfY72gnD2n+vNuYrEo9G5j6nG6EWinfQw9nh2Y=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a25:37d4:0:b0:80b:8602:f3fe with SMTP id
 e203-20020a2537d4000000b0080b8602f3femr1304845yba.36.1674761892878; Thu, 26
 Jan 2023 11:38:12 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:52 -0800
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
Mime-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-8-surenb@google.com>
Subject: [PATCH v4 7/7] mm: export dump_mm()
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmap_assert_write_locked() is used in vm_flags modifiers. Because
mmap_assert_write_locked() uses dump_mm() and vm_flags are sometimes
modified from inside a module, it's necessary to export dump_mm()
function.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 mm/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/debug.c b/mm/debug.c
index 9d3d893dc7f4..96d594e16292 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -215,6 +215,7 @@ void dump_mm(const struct mm_struct *mm)
 		mm->def_flags, &mm->def_flags
 	);
 }
+EXPORT_SYMBOL(dump_mm);
 
 static bool page_init_poisoning __read_mostly = true;
 
-- 
2.39.1

