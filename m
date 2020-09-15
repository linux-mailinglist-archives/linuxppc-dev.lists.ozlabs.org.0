Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEA26A475
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:55:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrM9V1YM8zDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QNAZ2Xmz; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrM0K1WRDzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:47:13 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id q4so1633846pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATSHRwKrC0SlKGwl6nh3JVb2BPimYxcW2WgbtWffH24=;
 b=QNAZ2XmzUDa68qqGkv438mX1/bBmxr27/IY/ueLjyf7ghU/WrXWRKN8REbEyZVrsm2
 XMEK2+TheLfOcSQWGcR+BQBHzRZMAAsB/7opUsVcdTfX0VnxOaizR1Mik3Cgy3Xz4DZt
 OsbMKRMqt4pnj9bAP5cVGSaPfyIfZZT7ddPCcqBQcWpKK5dVeUVeQJcTFWAfhjLOnPpS
 slcnpPm3acsmGhJiGBUh/RK1KFXOsaL/ku5YMZUmP9oW1Qi9RlXkZ5iBttZues8YDHwR
 bm0TVktQ8d7uH+BBp4j5re1n4HsyaGt0GYCauypTBkYuO0HMcfiwmTd03NdlIKVxUHhf
 u2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATSHRwKrC0SlKGwl6nh3JVb2BPimYxcW2WgbtWffH24=;
 b=F2c71DXpC7eRw+j93uOHtcxgIWa57KKwuA2LItWSlh8u7+cbsBxMQooeH4cXYexipx
 ph9tO+5IsgpscrIRtoMviAk+WsCTpfrJRIIBv8rp9R2pxHN1fD6UnLzYOgjMmP3cGuUP
 p43wBJe06tIiIc8cKPqvklbPw42L9JqXt64xaaqyZuytELEVzoqM28Smc6avcXKoxDy+
 3A1rzZuZZVD6ubYeVOfBfOsnft+bb/G6Rtfu68rGkmXMDd8VFNAFOFsLQHQ+3QLe27vu
 IdBTTGm074mW0XFVWI+ZyjmB2vI6wX3xCF7TNMrdFSREEt+ZtWLSuZb3rLSS5Cdf2gMR
 gbWQ==
X-Gm-Message-State: AOAM532eFaJGTRXITcA13/lPB0q6ev5y9pEKlE3x6tHH6uFSSrP9G+WG
 4TXoj97s7Pb78sfIlMnr9C58aA6QOrB91Q==
X-Google-Smtp-Source: ABdhPJwwxe35bmnuuAwOzkdr/435n+XxCLOUVv2BVi4KgKRVdimy5a3iSgqUhRN++1gNw7JcSQu81A==
X-Received: by 2002:a17:902:700a:b029:d1:e5e7:be1e with SMTP id
 y10-20020a170902700ab02900d1e5e7be1emr1373482plk.81.1600170430486; 
 Tue, 15 Sep 2020 04:47:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u2sm12118077pji.50.2020.09.15.04.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:47:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/64: make restore_interrupts 64e only
Date: Tue, 15 Sep 2020 21:46:49 +1000
Message-Id: <20200915114650.3980244-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200915114650.3980244-1-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is not used by 64s.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index b725509f9073..631e6d236c97 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -191,6 +191,25 @@ notrace unsigned int __check_irq_replay(void)
 
 	return 0;
 }
+
+/*
+ * This is specifically called by assembly code to re-enable interrupts
+ * if they are currently disabled. This is typically called before
+ * schedule() or do_signal() when returning to userspace. We do it
+ * in C to avoid the burden of dealing with lockdep etc...
+ *
+ * NOTE: This is called with interrupts hard disabled but not marked
+ * as such in paca->irq_happened, so we need to resync this.
+ */
+void notrace restore_interrupts(void)
+{
+	if (irqs_disabled()) {
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		local_irq_enable();
+	} else
+		__hard_irq_enable();
+}
+
 #endif /* CONFIG_PPC_BOOK3E */
 
 void replay_soft_interrupts(void)
@@ -364,24 +383,6 @@ notrace void arch_local_irq_restore(unsigned long mask)
 }
 EXPORT_SYMBOL(arch_local_irq_restore);
 
-/*
- * This is specifically called by assembly code to re-enable interrupts
- * if they are currently disabled. This is typically called before
- * schedule() or do_signal() when returning to userspace. We do it
- * in C to avoid the burden of dealing with lockdep etc...
- *
- * NOTE: This is called with interrupts hard disabled but not marked
- * as such in paca->irq_happened, so we need to resync this.
- */
-void notrace restore_interrupts(void)
-{
-	if (irqs_disabled()) {
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-		local_irq_enable();
-	} else
-		__hard_irq_enable();
-}
-
 /*
  * This is a helper to use when about to go into idle low-power
  * when the latter has the side effect of re-enabling interrupts
-- 
2.23.0

