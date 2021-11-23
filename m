Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD9459FAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:00:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0535LZmz3f2L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:00:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CqAmYcpU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CqAmYcpU; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzwR25DJz30J5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:11 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id iq11so16153078pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AiA9KCGQFm86SQ3s5sc6WMaLfeZbRF8+6EAfevnLWQ=;
 b=CqAmYcpUuSQn7+AzLa1RBQ420Znc/3rKivgRj8B+z70gVTUlNh9aMOJCF/vk3vP9uW
 ibYJasDPX78XIA70CYmHpVs128g5Ya1N//O2dNKu9cCn4YErtTe6pK/AK4zQzO7dXO+D
 Fy/X91UVg8SwVYwUjJagiLAKsmgWu9rN+XFuTzCjsfwD08nRsPK1W10c4wHQSsmPM2AK
 5WhirdyVw+2DlcY7auOjp6zyHcFAChnQ9wqiyF+r3jMM44jEyl5XSs2gF8hIw667HelU
 QvqFlhjQuMZiZLCtrA07jcunPsZGdjSlq2JYKX7+x3z6Eco32EoTPkCiUsQEJ89KMHPk
 OIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AiA9KCGQFm86SQ3s5sc6WMaLfeZbRF8+6EAfevnLWQ=;
 b=0ZcAVCXXp2bY/CSn2rkSob/5+Eu7c/feiIBeH73wyUeOYYi1cTE8yDDeyi+z+2M8I0
 TKMFw2UTf1BSMc1YwIK1aE6V5HoupS54on6BAqw8cjQfwjQew9CjVWWDPJLGN9ClKHSO
 oCKuhFkRVAzUZ5RKIH7peQrjcaPVb4c/as7XnkLQVyq3w5C6LOPlKVPyhV3Sd6pcv+8t
 Q+Hg5XLtFP/whkfZ5BRwcFjH5gfWH2Y4spmNn9h7kmjBRtGqTnrJl5i622zPZ8fsBg04
 NcTf8Q9hzq77H94vi5ORKtghRV8tI3RwRZgQltG7YLuFjb+9D7Mf8gD8eJGjpbPRBuYm
 JrGA==
X-Gm-Message-State: AOAM530JnxG5kxkl60WvUMlvqs18AgNtQfm6eNov5VOn8LVh+He0B1k1
 euefHSduQ0+N6y4EqR45Wli0LvD9WOOUvg==
X-Google-Smtp-Source: ABdhPJxlGUkC0d/nWCUAsJKY4dElhkccnofA4LXTKUUzytOvu/KuPdSMkwJrBE3UR4rRgZj2CwWnuA==
X-Received: by 2002:a17:903:1105:b0:143:a593:dc6e with SMTP id
 n5-20020a170903110500b00143a593dc6emr4810951plh.6.1637661189091; 
 Tue, 23 Nov 2021 01:53:09 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/53] powerpc/64s: Implement PMU override command line
 option
Date: Tue, 23 Nov 2021 19:51:50 +1000
Message-Id: <20211123095231.1036501-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It can be useful in simulators (with very constrained environments)
to allow some PMCs to run from boot so they can be sampled directly
by a test harness, rather than having to run perf.

A previous change freezes counters at boot by default, so provide
a boot time option to un-freeze (plus a bit more flexibility).

Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Reviewed-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 arch/powerpc/perf/core-book3s.c               | 35 +++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9725c546a0d4..2711ddb4835a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4144,6 +4144,14 @@
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
index 73e62e9b179b..8d4ff93462fb 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2419,8 +2419,24 @@ int register_power_pmu(struct power_pmu *pmu)
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
+		pr_warn("disabling perf due to pmu_override= command line option.\n");
+		on_each_cpu(do_pmu_override, NULL, 1);
+		return 0;
+	}
+
 	/* run through all the pmu drivers one at a time */
 	if (!init_power5_pmu())
 		return 0;
@@ -2442,4 +2458,23 @@ static int __init init_ppc64_pmu(void)
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

