Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314855E990E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:59:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXCc6Lxfz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:59:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LRmM9CVZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LRmM9CVZ;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7p6QsLz3brh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:38 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id b75so5621634pfb.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=sYSpv5QERNvLxR32H6o+2VcLaf/RGvB/HyqdkhQ/8Lk=;
        b=LRmM9CVZ+v6eLzrQmCv4jlns/Cxzus4Ru/2H2ylmQ9Y1Z2oXY+5Zxbi16//Z5+ExMc
         8UJo8NbIkFLOm6K6O9sDvFSEX8/qdTGi4iOTAs5n4tzbDAlGqyzPeAAkFsS8SI28emkZ
         Ns72XmH3Xbxh54A0wNcxOi2LFB6yWeB9wkLZ9ZWTImZJVU5Ypx1Qe4TZtaoXzrdE1fkt
         XawLIhQxhpjzMmNgSHtiOPOrnzUDsoYeWzL/qzZrGFtZry0nB7VJ46ueAFAzPKb2lsun
         HSzprm44F/4pajAx57a+sn2wanC+1LqT27EFjVJ/jmMH/sj8uLa71HDvTfPNXZn2HLPz
         TvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sYSpv5QERNvLxR32H6o+2VcLaf/RGvB/HyqdkhQ/8Lk=;
        b=J1HIxnZ4vj7ZGQijfiOD1zri6hQrVKMJf+ueAHMpvNM8Kfs+PP4vaHBxUq/UjnWT2P
         HGpUQERaxLSRBh+wkNnRRuhBOzhxg0dLRQndgNeFZ8t+NHupxAflN4NhrwA1a1GPlgeQ
         lHxQ29SQxMQd9f7iQiuFZNaBKveyUyQksmbAlkaDcpqmHY0X9FKTTjxGXzWDMhhBB6UJ
         ax7IU19RWcT6CoNKhB1D6UjEEuklMP/PmlKc/8TmDHwZ/4sWemq1sykG8MsZpPljAcuC
         /0P8gPUHL5JAxnylOg+6VlTtAEGztC8y3vvQmmYbxughf/OFWj9YmswZAQZbGdkkA8iB
         PDeg==
X-Gm-Message-State: ACrzQf0fD3uDiL5yLtcQ9HEVWxqqGrHa4N3G4b61Or7rs9VFRDAfCb4t
	RmVmOVJZDeTLl8cq+8zBOLFoOPn/7Y0/cg==
X-Google-Smtp-Source: AMsMyM6dQcDTwgRntAVFPDLh0mPYkQ+qBO00DMYwKoxWwRUydErLLDE/mkFYHz4taAazKmhoCr5H1A==
X-Received: by 2002:a05:6a00:1488:b0:542:78a:3f8a with SMTP id v8-20020a056a00148800b00542078a3f8amr21881397pfu.85.1664171796117;
        Sun, 25 Sep 2022 22:56:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id pv7-20020a17090b3c8700b00203a4f70b90sm5628075pjb.45.2022.09.25.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:56:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] powerpc/64: don't set boot CPU's r13 to paca until the structure is set up
Date: Mon, 26 Sep 2022 15:56:19 +1000
Message-Id: <20220926055620.2676869-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926055620.2676869-1-npiggin@gmail.com>
References: <20220926055620.2676869-1-npiggin@gmail.com>
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
index e68d316b993e..83e564564f63 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -177,10 +177,10 @@ early_param("smt-enabled", early_smt_enabled);
 #endif /* CONFIG_SMP */
 
 /** Fix up paca fields required for the boot cpu */
-static void __init fixup_boot_paca(void)
+static void __init fixup_boot_paca(struct paca_struct *boot_paca)
 {
 	/* The boot cpu is started */
-	get_paca()->cpu_start = 1;
+	boot_paca->cpu_start = 1;
 #ifdef CONFIG_PPC_BOOK3S_64
 	/*
 	 * Give the early boot machine check stack somewhere to use, use
@@ -188,14 +188,14 @@ static void __init fixup_boot_paca(void)
 	 * deep stack usage in early init so shouldn't overflow it or overwrite
 	 * things.
 	 */
-	get_paca()->mc_emergency_sp = (void *)&init_thread_union +
+	boot_paca->mc_emergency_sp = (void *)&init_thread_union +
 		(THREAD_SIZE/2);
 #endif
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
 
@@ -363,8 +363,8 @@ void __init early_setup(unsigned long dt_ptr)
 	 * what CPU we are on.
 	 */
 	initialise_paca(&boot_paca, 0);
-	setup_paca(&boot_paca);
-	fixup_boot_paca();
+	fixup_boot_paca(&boot_paca);
+	setup_paca(&boot_paca); /* install the paca into registers */
 
 	/* -------- printk is now safe to use ------- */
 
@@ -393,8 +393,8 @@ void __init early_setup(unsigned long dt_ptr)
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

