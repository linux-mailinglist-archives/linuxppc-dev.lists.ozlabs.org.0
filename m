Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB355A9E56
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT0n1z9Xz3fRd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:43:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kTPvKd0P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ee0qywykdlyoqnajxckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kTPvKd0P;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrC6Spgz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:55 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33dc390f26cso233044047b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=SOzt98PYJdog9tZtODUdaF02HJMaRj5G7nUIc+/7MKg=;
        b=kTPvKd0Pj/2ICi2JaJbj4mvw83rGSI8D/7SpSALxOaZxZxYULx54dkMykzJllj/oUS
         acc8cAwohzpv9TG/117+M7kDarZ4pbcDRJw9kbqISJMHllJVQJpNPTnmGZHaFtdhW7jV
         te5Y1eTVCGFOLeMRtGhakQSv/C95dQTatvR3jNPFepOpi9BM4A2IDo4sHrk/Ld/IusAA
         C91XyLoa1Kj543iPIZk7cC0y8cEUyAun26iVaV/jukaSDh0nNNy3USNMwmiwPC/u6rrR
         uYxoBw75emQZr0TAylDwoEOSkfchxb9rhKIYoM9w58cv+ILGWIFbRnVoqe89UuzvgGW7
         /7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=SOzt98PYJdog9tZtODUdaF02HJMaRj5G7nUIc+/7MKg=;
        b=lsgNFgMQ4wINMSZsh6XFslQwM2LEW3yHGTCWOiBz55OgE5sLpvo8YnJzC815LI1gzU
         ISi4X2/3TyH9V5hEckByDDhiBGOqgJ381sEX0dh1dnl+Dp6vc7eiWQr9l+/740V62st9
         UohUbF0wkczGip9n4f0TcWBx1mSFpDp3Ep64ExbrKRPLh9TswNFtSjntWfegQDfgZrQh
         xmbinevO1clLTK8H9FPXYZNM2O9xT15mklZ49gs3cbokGMkZjez7ZmQ7P5iDhKTdhuke
         RT+f40z03JoUSiCKOYDKqRejdBoP05tmE1jegwtPkGRGRcFIEgca+GAthJpTdEDDbu+j
         FCJA==
X-Gm-Message-State: ACgBeo20lJwMM2K4y7FMr7ddYN+3fd/M1eAXyaMVgYctarrTbzzGuO6k
	0ixwxm5ykg3iCvF60dXF68SCt1OXV6U=
X-Google-Smtp-Source: AA6agR6YY4L9oqUniRiEloavxF9b7QDLSzaw7mgfeu4Gq//fIM/XBjFxGsDu3HVa5YMmDCpCvrS70nu4RUs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:3746:0:b0:69b:a100:521f with SMTP id
 e67-20020a253746000000b0069ba100521fmr16650279yba.135.1662053753176; Thu, 01
 Sep 2022 10:35:53 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:00 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-13-surenb@google.com>
Subject: [RFC PATCH RESEND 12/28] mm/mremap: mark VMA as locked while
 remapping it to a new address range
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

Mark VMA as locked before copying it and when copy_vma produces a new VMA.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c   | 1 +
 mm/mremap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index ade3909c89b4..121544fd90de 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3248,6 +3248,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			get_file(new_vma->vm_file);
 		if (new_vma->vm_ops && new_vma->vm_ops->open)
 			new_vma->vm_ops->open(new_vma);
+		vma_mark_locked(new_vma);
 		vma_link(mm, new_vma, prev, rb_link, rb_parent);
 		*need_rmap_locks = false;
 	}
diff --git a/mm/mremap.c b/mm/mremap.c
index b522cd0259a0..bdbf96254e43 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -620,6 +620,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 			return -ENOMEM;
 	}
 
+	vma_mark_locked(vma);
 	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
 	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
 			   &need_rmap_locks);
-- 
2.37.2.789.g6183377224-goog

