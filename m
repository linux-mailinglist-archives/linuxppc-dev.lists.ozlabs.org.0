Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A679D5B9A8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSx3F37RWz3dV2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g00LEzV4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g00LEzV4;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzS12xcz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:31 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id x1so18149696plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=U5dstr6s1X7aN6wvLVSL3cQ3bYUMLDEq54B0w+D32uE=;
        b=g00LEzV4lD7HdZzg6Cu7sNccxi/MOLhR6oXpDWKXJtCQgtSOOHcQ1yPZsw+s7CkDCs
         vU19AktDani9W6aGz1qjnc/lw6R1uFuI8YhOZHHjo8+A9on8mzKfeWBRcGyEVyhx+jvS
         EruOXe5h5CC2DJd7XDu+Kj4LTRjuYrJOgzulsDuPoRCsuMLVkuF3yKzjbM09B/PMqZg3
         u/eZ5bn0Pkrk/i0Eo+a5djvSArxdlboU5t2OAj+lSRayy+/wWeMVdgUqxfO/qHCj4xr3
         u51w5QGmwoSB2tuHIdW8oYQgMz0KqO9R4LBVM9GbIYMepLx12DWD8QEt8pzOrs+ERT6d
         UptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U5dstr6s1X7aN6wvLVSL3cQ3bYUMLDEq54B0w+D32uE=;
        b=cgqBsjiD/xr0f1oTcUUrOoZei+tyHInPWuGPV8KopVhOYQIuL/AkZBzDh9JlQDrWUe
         gGj2sxGhMz4qv09Z3hpohMYiF0m9CaqnGHUI+t3DijDRNc4QJVu+bDSRZ+2IryeSNocw
         mYvc+YjxXY4M2IP2DiGW/kaN0m+uia8E74ucAB8v+2onB49WPnQi7VjcPW3BPGeTcmrm
         GB6xVOzDVq+J+YMRF0KtO3EgT7O7xt9KJxc0jdtUmSu3q3lhmJoFiKfpt1kvP4CM3ls2
         qctyU/aTDxt0pVU7T0+TwSo5YG2FXDBP7SAYaXRaIZruj5MvBbjfHmdAeFLEQVBfvMns
         p1AQ==
X-Gm-Message-State: ACrzQf3xutFKxT9I2FaSMIXS+OAwceYydmKRRKhtvexcdtZkS/wE0JvS
	Xj4DvBiB3WdD29rMWS6S69iZavvZVKs=
X-Google-Smtp-Source: AMsMyM5HTIM6jKvW00jTUakoK+hfBuZHn5ylrmwt05UZhUjvcopK5hWc8nIjvtP/vEAGPwKteZaodg==
X-Received: by 2002:a17:902:e74f:b0:176:e68f:f902 with SMTP id p15-20020a170902e74f00b00176e68ff902mr4071508plf.41.1663243889446;
        Thu, 15 Sep 2022 05:11:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/64: don't set boot CPU's r13 to paca until the structure is set up
Date: Thu, 15 Sep 2022 22:10:57 +1000
Message-Id: <20220915121058.2288916-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915121058.2288916-1-npiggin@gmail.com>
References: <20220915121058.2288916-1-npiggin@gmail.com>
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

The idea is to get to the point where if r13 is non-zero, then it should
contain a reasonable paca. This can be used in early boot program check
and machine check handlers to avoid running off into the weeds if they
hit before r13 has a paca.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 08173eea8977..214d10caf458 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -177,23 +177,23 @@ early_param("smt-enabled", early_smt_enabled);
 #endif /* CONFIG_SMP */
 
 /** Fix up paca fields required for the boot cpu */
-static void __init fixup_boot_paca(void)
+static void __init fixup_boot_paca(struct paca_struct *boot_paca)
 {
 	/* The boot cpu is started */
-	get_paca()->cpu_start = 1;
+	boot_paca->cpu_start = 1;
 	/*
 	 * Give the early boot machine check stack somewhere to use, use
 	 * half of the init stack. This is a bit hacky but there should not be
 	 * deep stack usage in early init so shouldn't overflow it or overwrite
 	 * things.
 	 */
-	get_paca()->mc_emergency_sp = (void *)&init_thread_union +
+	boot_paca->mc_emergency_sp = (void *)&init_thread_union +
 		(THREAD_SIZE/2);
 	/* Allow percpu accesses to work until we setup percpu data */
-	get_paca()->data_offset = 0;
+	boot_paca->data_offset = 0;
 	/* Mark interrupts soft and hard disabled in PACA */
-	irq_soft_mask_set(IRQS_DISABLED);
-	get_paca()->irq_happened = PACA_IRQ_HARD_DIS;
+	boot_paca->irq_soft_mask = IRQS_DISABLED;
+	boot_paca->irq_happened = PACA_IRQ_HARD_DIS;
 	WARN_ON(mfmsr() & MSR_EE);
 }
 
@@ -361,8 +361,8 @@ void __init early_setup(unsigned long dt_ptr)
 	 * what CPU we are on.
 	 */
 	initialise_paca(&boot_paca, 0);
-	setup_paca(&boot_paca);
-	fixup_boot_paca();
+	fixup_boot_paca(&boot_paca);
+	setup_paca(&boot_paca); /* install the paca into registers */
 
 	/* -------- printk is now safe to use ------- */
 
@@ -391,8 +391,8 @@ void __init early_setup(unsigned long dt_ptr)
 		/* Poison paca_ptrs[0] again if it's not the boot cpu */
 		memset(&paca_ptrs[0], 0x88, sizeof(paca_ptrs[0]));
 	}
-	setup_paca(paca_ptrs[boot_cpuid]);
-	fixup_boot_paca();
+	fixup_boot_paca(paca_ptrs[boot_cpuid]);
+	setup_paca(paca_ptrs[boot_cpuid]); /* install the paca into registers */
 
 	/*
 	 * Configure exception handlers. This include setting up trampolines
-- 
2.37.2

