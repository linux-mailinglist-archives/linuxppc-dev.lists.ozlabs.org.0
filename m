Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBA725149
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 02:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbTT31XMSz3dwp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 10:57:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jwW5B4hl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jwW5B4hl;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbTS75M0Lz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 10:56:21 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2566e60cc5aso5566421a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 17:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686099374; x=1688691374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyACQhsQFszvJGp2M3txzY4M593DBZCC55YhFOUr4G8=;
        b=jwW5B4hl2+XoKNUq8Qe4fMJY0Q1aIqHMf/dOfDWfOAZFJ7FZo+pKGVTuNf+i4lbeql
         ii0R0ey6wFXxi7mJqEOb8To+Xz7M0uXuQL5/VOl0/qPgxT5KF3OQcZpER6rvfSRdboQ7
         +QLFFHTOXNWXQJ2wVX5TUS5ZLB1EjyCbVhA4fobz5uypFzSZ447U5tBpddr4sSMRlgEy
         aJUdu5mus7VFM/cWiOZ49rtfbHJcTXb63NOKEguvi9fFJ8VJrAk0ld1+2DUB1WzMEEXw
         l3qaJ24qfcOfrwcTZ3pmVOGrg4WFpgl2oQtEnOa3aFWoQG5WGBNYWaFafpdT81+dLMog
         xdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686099374; x=1688691374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyACQhsQFszvJGp2M3txzY4M593DBZCC55YhFOUr4G8=;
        b=ikq8wefnfhflnUEkCiGU3HOyMR9Pw/RcjQiAdZRyKbyEDtmGNPYcJxeFFPDwZVWnMA
         wds70qfOk25ieNvkEIJnsXaZwHNnVXPW90RVdnffa1iDgxOCJG4c65OvVqmoCL+R85JF
         yzL0Sc61sVYPCRbEVVhKpQ1OKGT+mCF1U2vJl8OeWzgaujjMb3hFJ4ev72nkO2PQmuM8
         8hOYA0r8M5u4gkSwNNpf+GfS0nsH5TH15LzQwgd6JC7uLAx6/5lrIe+zsdLJo/E1U/KG
         hNJ4knL4jFUIzoJPHiI+B0chPoIDyGXgmrlVhCQihU9zqkqHKjxlPRKDmkWFDimQGt4v
         wG9g==
X-Gm-Message-State: AC+VfDxq3ecFO1SO0V+LUleExKTKMu6cuFI5nv3K22ylzeOMAAURSJqW
	OaI8DKVzJYK1NV7Ay/YOB3XR2skINBsXNQ==
X-Google-Smtp-Source: ACHHUZ5CnAUEMijC+bXGGHjzCTml5+g62SXyfnw/akEnuKY5615bImN3hwdQ+cnJVs3fOOJwitjOaQ==
X-Received: by 2002:a17:90a:f2cf:b0:259:45c2:7339 with SMTP id gt15-20020a17090af2cf00b0025945c27339mr3473271pjb.23.1686099373991;
        Tue, 06 Jun 2023 17:56:13 -0700 (PDT)
Received: from wheely.local0.net (193-116-206-233.tpgi.com.au. [193.116.206.233])
        by smtp.gmail.com with ESMTPSA id li13-20020a17090b48cd00b00252a7b73486sm138949pjb.29.2023.06.06.17.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 17:56:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs enabled
Date: Wed,  7 Jun 2023 10:56:00 +1000
Message-Id: <20230607005601.583293-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switching mm and tinkering with current->active_mm should be done with
irqs disabled. There is a path where exit_lazy_flush_tlb can be called
with irqs enabled:

    exit_lazy_flush_tlb
    flush_type_needed
    __flush_all_mm
    tlb_finish_mmu
    exit_mmap

Which results in the switching being incorrectly with irqs enabled.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Link: https://lore.kernel.org/linuxppc-dev/87a5xcgopc.fsf@mail.lhotse/T/#m105488939d0cd9f980978ed2fdeeb89bf731e673
Fixes: a665eec0a22e1 ("powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This sounds worse than it probably is, radix can likely tolerate an
interrupt hitting in mm switch, and the active_mm update may not be racy
in practice either. Still be good to backport it because I'm not 100%
sure of that.

This path can be stressed by reducing tlb_mm_cpumask_trim_timer (e.g.,
to 3).

Thanks,
Nick

 arch/powerpc/mm/book3s64/radix_tlb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index ce804b7bf84e..0bd4866d9824 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -795,12 +795,20 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 		goto out;
 
 	if (current->active_mm == mm) {
+		unsigned long flags;
+
 		WARN_ON_ONCE(current->mm != NULL);
-		/* Is a kernel thread and is using mm as the lazy tlb */
+		/*
+		 * It is a kernel thread and is using mm as the lazy tlb, so
+		 * switch it to init_mm. This is not always called from IPI
+		 * (e.g., flush_type_needed), so must disable irqs.
+		 */
+		local_irq_save(flags);
 		mmgrab_lazy_tlb(&init_mm);
 		current->active_mm = &init_mm;
 		switch_mm_irqs_off(mm, &init_mm, current);
 		mmdrop_lazy_tlb(mm);
+		local_irq_restore(flags);
 	}
 
 	/*
-- 
2.40.1

