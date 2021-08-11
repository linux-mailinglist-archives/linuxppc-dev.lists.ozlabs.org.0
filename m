Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445753E95AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:15:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFJz1FMCz3dpQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:14:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Rd+1J8yi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rd+1J8yi; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2l0WlCz3cXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:38 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so10308085pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8Q3KwZ/CYYBaLeek32FHX+IEOZLMmBQsPsW8ZydE6I=;
 b=Rd+1J8yiTcTvQ57f+VFxDmknStxCe5TXGMpFuMGgEPf+SWha0OfA3fYMSflmDVRIOT
 Hn0xLZp02j6pUnZ/3MDDGR0uWN/QGBUZlmr8D0aHwqBFKkSTgQl/+I1gM0NlJ6/eVHWt
 mwr8HiILeF0T92kLSqarvJpa2vbuN7F7xh5jzNwRZnfKozu5WKmsy5DcbMSK13Y4v9GE
 Ur3VbGXxyeLiTTdHkHI/KI7IH8QIqQEKUqFsQ9t7JRqcMzQpHZSm37m+VnVJJ60I1sb3
 +usEL2Uq2V0x/PfBqsqkUc5HEGB+2rf6/eBdB8SwRiuzUV6/BqROI+edpP5IXFiwpk84
 tvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8Q3KwZ/CYYBaLeek32FHX+IEOZLMmBQsPsW8ZydE6I=;
 b=gV5YKJPyKWr7awb6VYHwOJrbr1suBi73F0Ge9X0WxUBxRPcd8/3LBY+N5MwGGsLcaa
 c73XjWTFptdxoVG94/TRNcag/UERjhx+Tj+Db7fCbnGukNvy0JxE5lmZvd0gA/OuWBTe
 nB8QNJ2URjGz60Ln7PmNdausZJg1SBhm7ZkaX+mpUvLSTm1TckK6fM1MCyHbrr9TQ2CQ
 AMpiPvuUg/cFo4eCnAvhdKMY9eOUj7St2i8T5nzkaQsGq2x52f+7GLklAu+t3uEOpwuK
 KtDG6eFnMONF2unezfGqvD805x3/JB5rYq9GXb74hmwdGSgqmnPIuIdJSDC5jfKa1ebV
 PMkQ==
X-Gm-Message-State: AOAM533nK2Qh1KG3ZvZvQNficmU56ZYroMHOuT2cDns0fxdD5mT4xUU4
 WzawYM8iGH5do00SzpY+ZLI=
X-Google-Smtp-Source: ABdhPJzPBN/9GCDk1LaiEjr3yjtRuKnH01sbJ+ZIjey6T/vO2JeP5QhBaS/ecfYcsuHD8PL3+4zH0A==
X-Received: by 2002:a62:b504:0:b029:3c7:aa49:85a3 with SMTP id
 y4-20020a62b5040000b02903c7aa4985a3mr28650510pfe.60.1628697756888; 
 Wed, 11 Aug 2021 09:02:36 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 20/60] powerpc/64s: Implement PMU override command line
 option
Date: Thu, 12 Aug 2021 02:00:54 +1000
Message-Id: <20210811160134.904987-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It can be useful in simulators (with very constrained environments)
to allow some PMCs to run from boot so they can be sampled directly
by a test harness, rather than having to run perf.

A previous change freezes counters at boot by default, so provide
a boot time option to un-freeze (plus a bit more flexibility).

Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 arch/powerpc/perf/core-book3s.c               | 35 +++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bdb22006f713..f8ef1fc2ee9e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4089,6 +4089,14 @@
 			Override pmtimer IOPort with a hex value.
 			e.g. pmtmr=0x508
 
+	pmu_override=	[PPC] Override the PMU.
+			This option takes over the PMU facility, so it is no
+			longer usable by perf. Setting this option starts the
+			PMU counters by setting MMCR0 to 0 (the FC bit is
+			cleared). If a number is given, then MMCR1 is set to
+			that number, otherwise (e.g., 'pmu_override=on'), MMCR1
+			remains 0.
+
 	pm_debug_messages	[SUSPEND,KNL]
 			Enable suspend/resume debug messages during boot up.
 
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 65795cadb475..45d894d85966 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2428,8 +2428,24 @@ int register_power_pmu(struct power_pmu *pmu)
 }
 
 #ifdef CONFIG_PPC64
+static bool pmu_override = false;
+static unsigned long pmu_override_val;
+static void do_pmu_override(void *data)
+{
+	ppc_set_pmu_inuse(1);
+	if (pmu_override_val)
+		mtspr(SPRN_MMCR1, pmu_override_val);
+	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
+}
+
 static int __init init_ppc64_pmu(void)
 {
+	if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
+		printk(KERN_WARNING "perf: disabling perf due to pmu_override= command line option.\n");
+		on_each_cpu(do_pmu_override, NULL, 1);
+		return 0;
+	}
+
 	/* run through all the pmu drivers one at a time */
 	if (!init_power5_pmu())
 		return 0;
@@ -2451,4 +2467,23 @@ static int __init init_ppc64_pmu(void)
 		return init_generic_compat_pmu();
 }
 early_initcall(init_ppc64_pmu);
+
+static int __init pmu_setup(char *str)
+{
+	unsigned long val;
+
+	if (!early_cpu_has_feature(CPU_FTR_HVMODE))
+		return 0;
+
+	pmu_override = true;
+
+	if (kstrtoul(str, 0, &val))
+		val = 0;
+
+	pmu_override_val = val;
+
+	return 1;
+}
+__setup("pmu_override=", pmu_setup);
+
 #endif
-- 
2.23.0

