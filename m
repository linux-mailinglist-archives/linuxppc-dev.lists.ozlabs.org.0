Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD334213AA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQdG2c5Sz2ynB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=prRjjKhj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=prRjjKhj; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSY0NKpz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:32 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id g184so16987042pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMCXCraIHhTkxvi2migC0AGUwf7Sq1N7w4sWT8WmJ8w=;
 b=prRjjKhj42goSNuNQo7GDFdVXeBEPvv5l2gYZWfql08VR9c28zDSA0rKbeNS3pDzZ6
 CPnwDwmn+P1ylB3+ydoMg7oM6S+EzFFj1rKq5OHG1osz8+yTPVu8Y2mg22EUisImSBOb
 IN8hu3f0I80oIat49mRrWayjDOw+Dq7nVuXQQo5u9p7rJsAm1V5ExHWgDsGKaeES8Y7g
 fGmDMSWgbsuzWU6c9fwsxdm7av+SE3DovBEFXIcY+sueVZmut5pt+VlQ06owQQufLw/k
 VSnDseQekfhVyCUIWl34tKMDBgp3gSMn8yW5/9ECEiNJao5aLz7G0r15rtYBbRKrqIAq
 cd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HMCXCraIHhTkxvi2migC0AGUwf7Sq1N7w4sWT8WmJ8w=;
 b=6oIqXeGo4UP79Dtk1KaT860RNbdhKz3uJruqgx1s1e13iqgetRVrmkevd6RdSOSI5H
 l7CnPtHHGICyO0kOtNTDmofk44oiygvpml0dxuX+IX8P0WvZXoHyiRr0U1+kK6nTD6cZ
 BOsq0LwgwIdtxoU8JefEWGN21Jkyz5DKoWsJxKDZk4HfgT4fk5VghEPjS8w/4gQbhNBG
 lPQAyBYsyR6ik9gA+9c6G2yX4rEubpYf5C+1CRM42EM1IZ4CLDSaBjzLi6nFKJUlaB8o
 f7t0p1dxXboFjZPaWn4iz2qxXfzDRl1pw68RDjI+ncNMZKQBeLFX1r2bhBNclTrNCZVj
 gU5w==
X-Gm-Message-State: AOAM533A5fvezNtAWtSQQ90COS+drJ9YEFRzJxCPe3zUqf10Q4hgCpnc
 zH4NkclMCdMWwxXmvZQ2yJ4=
X-Google-Smtp-Source: ABdhPJzviaQrucqm9C7UK7ONuBECuwhIQdEz6XBlxz795QHTv/tNuuTPqVo3vJ/ZwdN+/zztutw6ow==
X-Received: by 2002:a63:e916:: with SMTP id i22mr11581714pgh.76.1633363290982; 
 Mon, 04 Oct 2021 09:01:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/52] powerpc/64s: Implement PMU override command line
 option
Date: Tue,  5 Oct 2021 02:00:09 +1000
Message-Id: <20211004160049.1338837-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
index 91ba391f9b32..02a80c02a713 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4120,6 +4120,14 @@
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

