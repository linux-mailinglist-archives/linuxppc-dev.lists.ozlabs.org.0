Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E75505E98F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWvb68H0z3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ja9aahLQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ja9aahLQ;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrW6kW4z3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:23 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso11361636pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vQgfl0s0CGmr/GOrxmh25LRPGto3tjJ8Zgh3Z+Ioj18=;
        b=Ja9aahLQmKZJPmSRVcxmzsdVXz0gvdN8z+XnXyvIJzv1Z7DTtIl5jrSNHHI2DbMBz/
         jxFbh2VdDKKE0HM9DpsHAeHCgnh1YmKBylrxFqe+vBohI3d13JByQiJ+I0hYPfVQS0Aw
         UsvzuZyT3O8iE3taQARK/DHee2Xvei6zE5lnDQvODV5zHhn4wWq9gZCGqI0WtwREyNJd
         FX25uvRc3EmAsj89rF8n9okD5/NsOJEe/80+D8uF05gI9hX/SCO1cng3Bs8c6Zw+NPDo
         0nzTOHDKyFYeYPLNo/tuTAUnpdMgfDwlSlSkx9/F9vb5WFxZHMhOt9+yCAM8dLT60i9R
         LPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vQgfl0s0CGmr/GOrxmh25LRPGto3tjJ8Zgh3Z+Ioj18=;
        b=1M/1GXdg2oRMud2OP9KP3IKR3GfhS6mB3mlZqgLCRV4azlvMQA1Ma27tAfPsjaqrnn
         XprBnid566RK1SSh+IIaI4MzBZb9YEWInrNnZk8EtIDBA4zBCg1sfWxecApyuythIgMG
         DYlWFfvYRUTAtEnjzLgoZBoj5+7jSl5ZZQUzs//Dn5uS8hyACMgSdpmruKPjJEA24lZ4
         kLU8RgagIGlO28Qm8jv/wqaEZB9WHs1o82AXyWxQjcYK/E+rq3+2KaM25vvxVSsoTxXE
         5/V5Kh6nR15tgIVn6sa5wrrKd7BSt0fv1vCNCo+Mf/VaTvD5bLw5dXw76/jAIFwjwgNn
         PJ9w==
X-Gm-Message-State: ACrzQf22gaXIyBpzLQluUfsXoLwAjniKRuuxY/BF5wODOUA8phW8M+vE
	GkUVSbjgRxO3BoY9JeKq81Vpze51DiDMEA==
X-Google-Smtp-Source: AMsMyM7b3VSWGxkAelT6SSutvHf5UgCxtiQ4L7eAudJrQQWNb9W6GZWjrzzV10NLv2e9bZ0NBl18kA==
X-Received: by 2002:a17:902:c206:b0:176:a575:5ca8 with SMTP id 6-20020a170902c20600b00176a5755ca8mr20668496pll.74.1664171001136;
        Sun, 25 Sep 2022 22:43:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/7] powerpc/64s: Fix irq state management in runlatch functions
Date: Mon, 26 Sep 2022 15:43:02 +1000
Message-Id: <20220926054305.2671436-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926054305.2671436-1-npiggin@gmail.com>
References: <20220926054305.2671436-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When irqs are soft-disabled, MSR[EE] is volatile and can change from
1 to 0 asynchronously (if a PACA_IRQ_MUST_HARD_MASK interrupt hits).
So it can not be used to check hard IRQ enabled status, except to
confirm it is disabled.

ppc64_runlatch_on/off functions use MSR this way to decide whether to
re-enable MSR[EE] after disabling it, which leads to MSR[EE] being
enabled when it shouldn't be (when a PACA_IRQ_MUST_HARD_MASK had
disabled it between reading the MSR and clearing EE).

This has been tolerated in the kernel previously, and it doesn't seem
to cause a problem, but it is unexpected and may trip warnings or cause
other problems as we tighten up this state management. Fix this by only
re-enabling if PACA_IRQ_HARD_DIS is clear.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/runlatch.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/runlatch.h b/arch/powerpc/include/asm/runlatch.h
index cfb390edf7d0..ceb66d761fe1 100644
--- a/arch/powerpc/include/asm/runlatch.h
+++ b/arch/powerpc/include/asm/runlatch.h
@@ -19,10 +19,9 @@ extern void __ppc64_runlatch_off(void);
 	do {							\
 		if (cpu_has_feature(CPU_FTR_CTRL) &&		\
 		    test_thread_local_flags(_TLF_RUNLATCH)) {	\
-			unsigned long msr = mfmsr();		\
 			__hard_irq_disable();			\
 			__ppc64_runlatch_off();			\
-			if (msr & MSR_EE)			\
+			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) \
 				__hard_irq_enable();		\
 		}      						\
 	} while (0)
@@ -31,10 +30,9 @@ extern void __ppc64_runlatch_off(void);
 	do {							\
 		if (cpu_has_feature(CPU_FTR_CTRL) &&		\
 		    !test_thread_local_flags(_TLF_RUNLATCH)) {	\
-			unsigned long msr = mfmsr();		\
 			__hard_irq_disable();			\
 			__ppc64_runlatch_on();			\
-			if (msr & MSR_EE)			\
+			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) \
 				__hard_irq_enable();		\
 		}      						\
 	} while (0)
-- 
2.37.2

