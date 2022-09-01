Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEC5A9E44
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSxN3cjjz3dp6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U5hxVmDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3a-0qywykdkgaczmvjowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U5hxVmDF;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqy4j3Hz303C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:42 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id d8-20020a25bc48000000b00680651cf051so4958943ybk.23
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=byYdzgQ2nb1BwMzAK8Db5EPtebwswE17va5vsTNHDvI=;
        b=U5hxVmDFnvg3Zh8mYi2DwtWs5BxWMTUQESfFDYoN6r6izeiWA5yaRxl1nHFUTbwk//
         Dnd8HHqghiMd97Zw1zIzmeB4ars9SXmdp/qLpi9efptTbpKgnXouiU6jw117QN+WP9qs
         3UWSwrzjzVFJ688YmwTVx+XNrjpewHxiYcGpgCH/HREdk2crWCVRYVVfKgVwMdBm3Bmp
         0cmyfTq+1Is86HcJ8rQc8vT+aBrCdpHLLyCE4j/1ArHGf12SJ516YZIyRc8DbZTCjB20
         ojn6KPPAcVM9EzDOR735/i5/Hcf8Q/BBi2k53VcG0tY24s/K8Lqz5/8Ca9tGedcRR97p
         PE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=byYdzgQ2nb1BwMzAK8Db5EPtebwswE17va5vsTNHDvI=;
        b=Fj+RR6xkPlG93NXZW+D7qH1T1U9BVudzm6rNsBjqLeTK9zBSqGYBwVmUmThs9DRc4v
         upn6DqQ8vHNAgI5c0mjFWkHDkcRIQEOJujb14fQuJOLksUrN7YlsjwoQUUu4OOIlL91d
         XcEPN0W+VPqcc2Q49kiWfki11Xssk6NNaMvyRRC+vo2H/OUOw2tto5JFBor/tBocKkfG
         ejDT5ifVFIwhAX4M2XNH/ln5KjtBUNvml+erYPr5V5/MFTGB+7SHEeyb4TPvU9bo5Wkg
         +v2MSC7swFMhUSd+8d1q1vAkiEhkMQStjHFkCUyvHf/dqDVhuYDwq0z68t18IVGzxRpQ
         +5Lw==
X-Gm-Message-State: ACgBeo1ynm6kiTuvjVarb2X4THHRjSMbQdqpCo/n9ATMoM2Get1W39hn
	UB6bU3+s/d9bUknZUXnCp8l/4crq4qY=
X-Google-Smtp-Source: AA6agR7fnwkRjroGVHJxi1RhhEsQJMH0R75zEmK00qUWtCXpP69RbgB6GRXVWsVMb26fPpccLe4aPhca22w=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:40c6:0:b0:67a:5c8a:21d2 with SMTP id
 n189-20020a2540c6000000b0067a5c8a21d2mr20567843yba.158.1662053739927; Thu, 01
 Sep 2022 10:35:39 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:55 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-8-surenb@google.com>
Subject: [RFC PATCH RESEND 07/28] kernel/fork: mark VMAs as locked before
 copying pages during fork
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Protect VMAs from concurrent page fault handler while performing
copy_page_range for VMAs having VM_WIPEONFORK flag set.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/fork.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index bfab31ecd11e..1872ad549fed 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -709,8 +709,10 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 		rb_parent = &tmp->vm_rb;
 
 		mm->map_count++;
-		if (!(tmp->vm_flags & VM_WIPEONFORK))
+		if (!(tmp->vm_flags & VM_WIPEONFORK)) {
+			vma_mark_locked(mpnt);
 			retval = copy_page_range(tmp, mpnt);
+		}
 
 		if (tmp->vm_ops && tmp->vm_ops->open)
 			tmp->vm_ops->open(tmp);
-- 
2.37.2.789.g6183377224-goog

