Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF472514C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 02:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbTTz4Nf3z3f77
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 10:57:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UoU8zsk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UoU8zsk4;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbTSN1z9Zz3drr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 10:56:36 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b05e96dabbso39483475ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 17:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686099394; x=1688691394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxUSbOn/cQ7COb96lv6UMi7n7+g7FzwMELmWuTwfcnQ=;
        b=UoU8zsk44fp1tGyhcECM5q0mMqWNEiKQqhAHIjo6wE0A1Ai3c5163j+ebN2jL5KRk5
         3qF2ig5GkXjaMzjtiC3dWnbwrzPtElcPumIhFZYjoP+VYcK/1N7/Sqks1uRwo+e2y739
         V6iIhzUzVXlcSoYfE0O/uv1CivLO+U2Lev/dt0Q0UkNiTkwxLPC+eC4rtArh4AjGEuG+
         dBhW+vu5XSKoizeIEPMBqZpqFWfYvIWCKZnf45WT6K3f7qw4xwWFxWA/znAr+YsDRvb7
         ue1DUcna35qO6NpwbAGbnFMzPwgw19Cq7LN9mRKt4Ptw9cRXFtlyjcyhS+Qn61Ln2NV1
         bVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686099394; x=1688691394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxUSbOn/cQ7COb96lv6UMi7n7+g7FzwMELmWuTwfcnQ=;
        b=atO9IVwsfDQBjW+gU1Ks0BJnfgsv5CAGYutVjOgJmKeTd4HEZonVitaPICPpFF1I3G
         XzHsX/XlAA6qHsfD/ZdT3OAk/+MWRv24DC81RKUUhWw2WzmFJNwnZRKECcQ7l6wDUcps
         D7CxPJT+/mEguD3AaMWx6knqV8aI7VRLirGeaQVRgfUs+lxERva51aRNbuejmtzuiuwN
         EhB2lWpvcim3tywnbQA8HbVSAqeSZ6Wvda+5rA/6TtZG41h0J+uzySOUoc1DXtSWNlre
         w3BY9pZks5vppjC4q8KDrKRst4CmdmFKv2RCrlUPIWhdwmGWiUMZ+M0Ojh6px3y4AVWn
         Yjog==
X-Gm-Message-State: AC+VfDwT1aLWFfrbr9Cn3suODZYSSfCwCMu0RzIVb+j3mMGLehziW/Rp
	WSpwAU5nHyjbhQSzC4FscTg=
X-Google-Smtp-Source: ACHHUZ6cC97mmOeODTPPycHtrlBmRG+pO3ZcBSrvfESxyU+j2DXFthfuNBgiZOOIH+wdxm2FYNDvfQ==
X-Received: by 2002:a17:902:f68c:b0:1b0:5425:2165 with SMTP id l12-20020a170902f68c00b001b054252165mr3386891plg.29.1686099394122;
        Tue, 06 Jun 2023 17:56:34 -0700 (PDT)
Received: from wheely.local0.net (193-116-206-233.tpgi.com.au. [193.116.206.233])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b001b00dae8771sm9108178plh.201.2023.06.06.17.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 17:56:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] lazy tlb: consolidate lazy tlb mm switching fix
Date: Wed,  7 Jun 2023 10:56:22 +1000
Message-Id: <20230607005622.583318-1-npiggin@gmail.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix an upstream powerpc bug that was discovered with a WARN_ON added in
"lazy tlb: consolidate lazy tlb mm switching":

   Switching mm and tinkering with current->active_mm should be done with
    irqs disabled. There is a path where exit_lazy_flush_tlb can be called
    with irqs enabled:

        exit_lazy_flush_tlb
        flush_type_needed
        __flush_all_mm
        tlb_finish_mmu
        exit_mmap

    Which results in the switching being incorrectly with irqs enabled.

    Link: https://lore.kernel.org/linuxppc-dev/87a5xcgopc.fsf@mail.lhotse/T/#m105488939d0cd9f980978ed2fdeeb89bf731e673
    Fixes: a665eec0a22e1 ("powerpc/64s/radix: Fix mm_cpumask trimming race vs k>

I will send that fix upstream, which will end up conflicting with these.
The resolution will be to take akpm's side of the merge (with this patch).
Or drop the patch when it conflicts and I'll resend it rebased on the fix.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 90953cf9f648..8d71fe8f5cdb 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -795,8 +795,16 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 		goto out;
 
 	if (current->active_mm == mm) {
-		/* Is a kernel thread and is using mm as the lazy tlb */
+		unsigned long flags;
+
+		/*
+		 * It is a kernel thread and is using mm as the lazy tlb, so
+		 * switch it to init_mm. This is not always called from IPI
+		 * (e.g., flush_type_needed), so must disable irqs.
+		 */
+		local_irq_save(flags);
 		kthread_end_lazy_tlb_mm();
+		local_irq_restore(flags);
 	}
 
 	/*
-- 
2.40.1

