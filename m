Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF855FD58C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 09:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp1SY3bf8z3dqv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 18:32:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cIl80GfH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cIl80GfH;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp1Rd5pTdz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 18:31:40 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id b5so884401pgb.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qqy0E8peNtf0s1BzlNPQIL7hRCDUUo7axCwoJEwRspo=;
        b=cIl80GfH4l+EsO3RpegIQG2jbC1lGHLhwIoVK2Qsh+l4awY4WrOC+Ouc1/UzcUNwcI
         NIidVHvXwCK6Q73rfxEtS57vVYy207DNYXIAQiL2xNfEFt/mIlDXpel5pF2vxYsXrI1o
         3lvib+P7BcJi319Ir1kB00hG1zAd8vBl7v0zXLGwMoTVP+MBm4LGzt7kS6v0Ej/lZ2vn
         dhYC32oCiF/tvkGho1jRvBw99w0m6nn8T+xRdJGCHvwWPvH9UqpSNMNUkiPZ+YJD64V1
         0QTQIIa7Ep/+oTiuI8zmicIrHUtNR3DCizKw7n4+lsm5kWvpmdorrORwZeMw1AUKxaQs
         ZnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqy0E8peNtf0s1BzlNPQIL7hRCDUUo7axCwoJEwRspo=;
        b=MZqHFqpDcXk4BOGyOVP2Bl3CONxnQbjR9rxHfgB2MhYeaVFLI3iZ5YHFeLtGoKeTFF
         3ebSHykb0VdmvNTjgdHV9IxfjchtKMAD4141vi7ONpyz5It/cKHnBObwiVpZC/qzwEKe
         jhuHcnpBPA2NF36D6feOZkxHwlVrzAV52ljINx+WM59qVGX+7M3v3YkfxrV+MoaCaVJA
         8+wCiTVpUZAEXtWl6EtVLysrge22hUtp9eMspIKONFoEo2+jNyYFuPT/cfsEr9/q8aAR
         GtinXWA0WiNIds+75EidraVb7EhDOackirASXT0hZfRsgsb75/QA2g4KmzcYrKoz//7W
         8XNw==
X-Gm-Message-State: ACrzQf2d0faE30+ew5f4ShZ/5tKcsRNz3FxIWiG9ksH3Ii9Kor9sIYyC
	tN+GVQxSwNGVDgIiv59hyWzfnbVnCpjM7Q==
X-Google-Smtp-Source: AMsMyM7NTgO3CUTUQaFu8w89AtI2hEmyCgXOww+eBQhb3jBP0WwAWreXfBIcmBgNBGW8l1/OCTVuHw==
X-Received: by 2002:a05:6a02:202:b0:42b:d711:f27c with SMTP id bh2-20020a056a02020200b0042bd711f27cmr28506912pgb.246.1665646298297;
        Thu, 13 Oct 2022 00:31:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d48300b0017870f471f6sm978106plg.226.2022.10.13.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 00:31:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Fix CONFIG_DTL=n build
Date: Thu, 13 Oct 2022 17:31:31 +1000
Message-Id: <20221013073131.1485742-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recently moved dtl code must be compiled-in if
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y even if CONFIG_DTL=n.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 6ba5aa541aaa0 ("powerpc/pseries: Move dtl scanning and steal time accounting to pseries platform")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/Makefile |   3 +-
 arch/powerpc/platforms/pseries/dtl.c    | 151 +++++++++++++-----------
 2 files changed, 80 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 14e143b946a3..92310202bdd7 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -7,7 +7,7 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
-			   papr_platform_attributes.o
+			   papr_platform_attributes.o dtl.o
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec.o
 obj-$(CONFIG_PSERIES_ENERGY)	+= pseries_energy.o
@@ -19,7 +19,6 @@ obj-$(CONFIG_HVC_CONSOLE)	+= hvconsole.o
 obj-$(CONFIG_HVCS)		+= hvcserver.o
 obj-$(CONFIG_HCALL_STATS)	+= hvCall_inst.o
 obj-$(CONFIG_CMM)		+= cmm.o
-obj-$(CONFIG_DTL)		+= dtl.o
 obj-$(CONFIG_IO_EVENT_IRQ)	+= io_event_irq.o
 obj-$(CONFIG_LPARCFG)		+= lparcfg.o
 obj-$(CONFIG_IBMVIO)		+= vio.o
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 1b1977bc78e7..3f1cdccebc9c 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -18,6 +18,7 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/machdep.h>
 
+#ifdef CONFIG_DTL
 struct dtl {
 	struct dtl_entry	*buf;
 	int			cpu;
@@ -57,78 +58,6 @@ static DEFINE_PER_CPU(struct dtl_ring, dtl_rings);
 
 static atomic_t dtl_count;
 
-/*
- * Scan the dispatch trace log and count up the stolen time.
- * Should be called with interrupts disabled.
- */
-static notrace u64 scan_dispatch_log(u64 stop_tb)
-{
-	u64 i = local_paca->dtl_ridx;
-	struct dtl_entry *dtl = local_paca->dtl_curr;
-	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
-	struct lppaca *vpa = local_paca->lppaca_ptr;
-	u64 tb_delta;
-	u64 stolen = 0;
-	u64 dtb;
-
-	if (!dtl)
-		return 0;
-
-	if (i == be64_to_cpu(vpa->dtl_idx))
-		return 0;
-	while (i < be64_to_cpu(vpa->dtl_idx)) {
-		dtb = be64_to_cpu(dtl->timebase);
-		tb_delta = be32_to_cpu(dtl->enqueue_to_dispatch_time) +
-			be32_to_cpu(dtl->ready_to_enqueue_time);
-		barrier();
-		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
-			/* buffer has overflowed */
-			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
-			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
-			continue;
-		}
-		if (dtb > stop_tb)
-			break;
-		if (dtl_consumer)
-			dtl_consumer(dtl, i);
-		stolen += tb_delta;
-		++i;
-		++dtl;
-		if (dtl == dtl_end)
-			dtl = local_paca->dispatch_log;
-	}
-	local_paca->dtl_ridx = i;
-	local_paca->dtl_curr = dtl;
-	return stolen;
-}
-
-/*
- * Accumulate stolen time by scanning the dispatch trace log.
- * Called on entry from user mode.
- */
-void notrace pseries_accumulate_stolen_time(void)
-{
-	u64 sst, ust;
-	struct cpu_accounting_data *acct = &local_paca->accounting;
-
-	sst = scan_dispatch_log(acct->starttime_user);
-	ust = scan_dispatch_log(acct->starttime);
-	acct->stime -= sst;
-	acct->utime -= ust;
-	acct->steal_time += ust + sst;
-}
-
-u64 pseries_calculate_stolen_time(u64 stop_tb)
-{
-	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
-		return 0;
-
-	if (get_paca()->dtl_ridx != be64_to_cpu(get_lppaca()->dtl_idx))
-		return scan_dispatch_log(stop_tb);
-
-	return 0;
-}
-
 /*
  * The cpu accounting code controls the DTL ring buffer, and we get
  * given entries as they are processed.
@@ -436,3 +365,81 @@ static int dtl_init(void)
 	return 0;
 }
 machine_arch_initcall(pseries, dtl_init);
+#endif /* CONFIG_DTL */
+
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+/*
+ * Scan the dispatch trace log and count up the stolen time.
+ * Should be called with interrupts disabled.
+ */
+static notrace u64 scan_dispatch_log(u64 stop_tb)
+{
+	u64 i = local_paca->dtl_ridx;
+	struct dtl_entry *dtl = local_paca->dtl_curr;
+	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
+	struct lppaca *vpa = local_paca->lppaca_ptr;
+	u64 tb_delta;
+	u64 stolen = 0;
+	u64 dtb;
+
+	if (!dtl)
+		return 0;
+
+	if (i == be64_to_cpu(vpa->dtl_idx))
+		return 0;
+	while (i < be64_to_cpu(vpa->dtl_idx)) {
+		dtb = be64_to_cpu(dtl->timebase);
+		tb_delta = be32_to_cpu(dtl->enqueue_to_dispatch_time) +
+			be32_to_cpu(dtl->ready_to_enqueue_time);
+		barrier();
+		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
+			/* buffer has overflowed */
+			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
+			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
+			continue;
+		}
+		if (dtb > stop_tb)
+			break;
+#ifdef CONFIG_DTL
+		if (dtl_consumer)
+			dtl_consumer(dtl, i);
+#endif
+		stolen += tb_delta;
+		++i;
+		++dtl;
+		if (dtl == dtl_end)
+			dtl = local_paca->dispatch_log;
+	}
+	local_paca->dtl_ridx = i;
+	local_paca->dtl_curr = dtl;
+	return stolen;
+}
+
+/*
+ * Accumulate stolen time by scanning the dispatch trace log.
+ * Called on entry from user mode.
+ */
+void notrace pseries_accumulate_stolen_time(void)
+{
+	u64 sst, ust;
+	struct cpu_accounting_data *acct = &local_paca->accounting;
+
+	sst = scan_dispatch_log(acct->starttime_user);
+	ust = scan_dispatch_log(acct->starttime);
+	acct->stime -= sst;
+	acct->utime -= ust;
+	acct->steal_time += ust + sst;
+}
+
+u64 pseries_calculate_stolen_time(u64 stop_tb)
+{
+	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
+		return 0;
+
+	if (get_paca()->dtl_ridx != be64_to_cpu(get_lppaca()->dtl_idx))
+		return scan_dispatch_log(stop_tb);
+
+	return 0;
+}
+
+#endif
-- 
2.37.2

