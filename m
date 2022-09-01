Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F328B5A9E6A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT5T04mnz3fpq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:47:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YWMUacgH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3i-0qywykdmg685s1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YWMUacgH;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrY698Dz3bWM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:13 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id w63-20020a25c742000000b006960ac89fedso4937584ybe.18
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=OeaHSvnl3LkKr4l31U2Volg5xaVk+RMFLZSi6dgjePI=;
        b=YWMUacgHyaw45xClfelut3B8D4opaNKe1Jn1EvQGqzRnq9IAzY1SbxxDOw3yyYq+BA
         clLIFH+vCJyTvZqkcuk+nPAAVvk+cIcjjJaBgcqIDZI820XVBHBVS4HV09O0+jx02gz/
         GF82/kOz5NOA2SL5LGwa69qRF4uUvf5PcNaP24Dp6cprq2xiDwA1y9+n/C6LME/0C0u+
         LXVRqnwXAQFfakRcmYHnZMbYxKQr/xy2mJHdmdiugDAKPQMxfZlI1xF8c8WSAaPgs+Sf
         8cODiZAHBJrDioo32O0YL9A9GYzXrzP7oLTKiCYFarAedegbhpTrR5084qGw0ahgqNnD
         Ah8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=OeaHSvnl3LkKr4l31U2Volg5xaVk+RMFLZSi6dgjePI=;
        b=ZCqCcknAgC0jFruCT1IkbWcMPwnUyEM5OTxnhQkN494auADwmfhdDa1yrvXq7kQ9Il
         Vf7t6sCwEhPZ8ZlLppsk7nuA8/YljIXZvdcbnAC/gN0yGKJkcOjgTRtydWRNMsCwIz4S
         YZjXgCdPQ19GzMG+vdICXfp/Nfr94qpFPdD02klOkpcx/hHUhXw0fZ7piKs19dR9CKi9
         9zBG/k9yEgHRLbT69KETexacZ2BUlv4sqoIZxlGrpUXKiUW8XnUT3vp4Avncsxkb6VzM
         nGFmRVilEOTs3OgkK6i07qtVF0G+d1KBvDi8rNxrSA9OGZi+0Mc6iAGzmvUTeyxs/eAf
         tXsg==
X-Gm-Message-State: ACgBeo0pNVrjho1Ajvfa7hvZmyv6bUfi8URniGelMYdiJgDR5+5PSww3
	0mcuyQO0bE6006X6SXedZfLLs8+PyYU=
X-Google-Smtp-Source: AA6agR5WRy5fZ7FOeYwPAz+MoQjsxloN5BfCZpV2SaYdV4girws1lZ0WYC4kcT46D4arwsdXcJqkq+Ln5bw=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:6744:0:b0:696:52a9:2d84 with SMTP id
 b65-20020a256744000000b0069652a92d84mr20473184ybc.256.1662053771488; Thu, 01
 Sep 2022 10:36:11 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:07 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-20-surenb@google.com>
Subject: [RFC PATCH RESEND 19/28] mm: disallow do_swap_page to handle page
 faults under VMA lock
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

Due to the possibility of do_swap_page dropping mmap_lock, abort fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 9ac9944e8c62..29d2f49f922a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3738,6 +3738,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	void *shadow = NULL;
 
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		ret = VM_FAULT_RETRY;
+		goto out;
+	}
+
 	if (!pte_unmap_same(vmf))
 		goto out;
 
-- 
2.37.2.789.g6183377224-goog

