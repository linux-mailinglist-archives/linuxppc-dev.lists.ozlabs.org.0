Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A775AAAAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJsDv39cmz3cd2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:55:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ochKfiE7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ochKfiE7;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsC36q73z303m
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:53:35 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id f12so1188150plb.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DY5sD2g6kgFjKvWJUI0jrUFr0KMCMPQJqpK12SfKsJo=;
        b=ochKfiE7thBU1rX3ISu/rj0bjTqv+A00TNKow4UCWGuvTVf5zjmWXQXl6yiR1KEUqT
         FmZgM5JAsIeaZ4/+oX4vHEJGl/dCh6PtivT6+VB5bQ1RzHPHfL472xWjGM8l4iqgYD+k
         LONfQ+XdY4VZQBNYbqYPBmMrM8DAjdDXAdkwZrN4+ryJSM62Y2qp3ONzB8SATU7h57QU
         TEOqvhqkNztC+f75LUe3jyZt/B5uS08VNOJ7MMzHdutOJDSOtDba3AWFm9rwFNxhFj+B
         YfVbBnF3Op5vN3WQz0dG98rAnlvGUCNxW5ajI6gQL1tGwTpcpt3Hyv+husYJ2Doylrrd
         NnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DY5sD2g6kgFjKvWJUI0jrUFr0KMCMPQJqpK12SfKsJo=;
        b=eHoOgVURrb6u2Kd61gaq07AGRVAuJgPwqN0UTW5NsCKMT0P3KhcEVMQWPK8LZaDiAj
         UBW8x0672ZRQDysaXXEOOmvgy6GWBbp8tU8uxgo/Fih+CRtEwQcD4Kge1ggUgw2QrbMo
         4RvDiKVbAuXhqaZSCPs4O91okE0SNsUaNIGia61+lUyRtj1HHdmhbMtdTKf/w1gL/1ko
         qgyVrKsr8y0krJoixfhqWDdniIMlLqi3IkSo7w33PTTpDLQDWlTYWe4/qOfWIrZQ9Hfi
         8QbSzbRzH1gZkygdvyVuTwgbPxED7U3VYDRatU9k5KVtzr7yh7yZElq+4nz5ldw/OZW6
         rniw==
X-Gm-Message-State: ACgBeo0pBospwn/ebag4c3yxOqvPgW8AbMYxEV6YZrmZ4l5dk/WD8Q5z
	a3vplEryeWUjMguerWx4pDL1u1YOdJs=
X-Google-Smtp-Source: AA6agR4+/fmRlo4Wf+cLIf8w5YcsFZfbDUXgx4MKi1NNlYzH+SYJFgwAOslHqoP9e2d7QSKPNuYviA==
X-Received: by 2002:a17:90a:e645:b0:1fd:7221:287c with SMTP id ep5-20020a17090ae64500b001fd7221287cmr3676662pjb.176.1662108811653;
        Fri, 02 Sep 2022 01:53:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001750b31faabsm1039130plg.262.2022.09.02.01.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:53:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING
Date: Fri,  2 Sep 2022 18:53:14 +1000
Message-Id: <20220902085316.2071519-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902085316.2071519-1-npiggin@gmail.com>
References: <20220902085316.2071519-1-npiggin@gmail.com>
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
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_VIRT_CPU_ACCOUNTING_GEN under pseries does not provide stolen
time accounting unless CONFIG_PARAVIRT_TIME_ACCOUNTING is enabled.
Implement this using the VPA accumulated wait counters.

Note this will not work on current KVM hosts because KVM does not
implement the VPA dispatch counters (yet). It could be implemented
with the dispatch trace log as it is for VIRT_CPU_ACCOUNTING_NATIVE,
but that is not necessary for the more limited accounting provided
by PARAVIRT_TIME_ACCOUNTING, and it is more expensive, complex, and
has downsides like potential log wrap.

From Shrikanth:

  [...] it was tested on Power10 [PowerVM] Shared LPAR. system has two
  LPAR. we will call first one LPAR1 and second one as LPAR2. Test was
  carried out in SMT=1. Similar observation was seen in SMT=8 as well.

  LPAR config header from each LPAR is below. LPAR1 is twice as big as
  LPAR2. Since Both are sharing the same underlying hardware, work
  stealing will happen when both the LPAR's are contending for the same
  resource.

  LPAR1:
  type=Shared mode=Uncapped smt=Off lcpu=40 cpus=40 ent=20.00
  LPAR2:
  type=Shared mode=Uncapped smt=Off lcpu=20 cpus=40 ent=10.00

  mpstat was used to check for the utilization. stress-ng has been used
  as the workload. Few cases are tested. when the both LPAR are idle
  there is no steal time. when LPAR1 starts running at 100% which
  consumes all of the physical resource, steal time starts to get
  accounted.  With LPAR1 running at 100% and LPAR2 starts running, steal
  time starts increasing. This is as expected. When the LPAR2 Load is
  increased further, steal time increases further.

  Case 1: 0% LPAR1; 0% LPAR2
   %usr  %nice   %sys %iowait  %irq  %soft %steal %guest %gnice  %idle
   0.00   0.00   0.05   0.00   0.00   0.00   0.00   0.00   0.00  99.95

  Case 2: 100% LPAR1; 0% LPAR2
   %usr  %nice   %sys %iowait  %irq  %soft %steal %guest %gnice  %idle
  97.68   0.00   0.00   0.00   0.00   0.00   2.32   0.00   0.00   0.00

  Case 3: 100% LPAR1; 50% LPAR2
   %usr  %nice   %sys %iowait  %irq  %soft %steal %guest %gnice  %idle
  86.34   0.00   0.10   0.00   0.00   0.03  13.54   0.00   0.00   0.00

  Case 4: 100% LPAR1; 100% LPAR2
   %usr  %nice   %sys %iowait  %irq  %soft %steal %guest %gnice  %idle
  78.54   0.00   0.07   0.00   0.00   0.02  21.36   0.00   0.00   0.00

  Case 5: 50% LPAR1; 100% LPAR2
   %usr  %nice   %sys %iowait  %irq  %soft %steal %guest %gnice  %idle
  49.37   0.00   0.00   0.00   0.00   0.00   1.17   0.00   0.00  49.47

  Patch is accounting for the steal time and basic tests are holding
  good.

Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++---
 arch/powerpc/include/asm/paravirt.h           | 12 ++++++++++++
 arch/powerpc/include/asm/paravirt_api_clock.h |  1 +
 arch/powerpc/platforms/pseries/Kconfig        |  8 ++++++++
 arch/powerpc/platforms/pseries/lpar.c         | 11 +++++++++++
 arch/powerpc/platforms/pseries/setup.c        | 19 +++++++++++++++++++
 6 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 426fa892d311..7172a91539f2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3741,9 +3741,9 @@
 			[X86,PV_OPS] Disable paravirtualized VMware scheduler
 			clock and use the default one.
 
-	no-steal-acc	[X86,PV_OPS,ARM64] Disable paravirtualized steal time
-			accounting. steal time is computed, but won't
-			influence scheduler behaviour
+	no-steal-acc	[X86,PV_OPS,ARM64,PPC/PSERIES] Disable paravirtualized
+			steal time accounting. steal time is computed, but
+			won't influence scheduler behaviour
 
 	nolapic		[X86-32,APIC] Do not enable or use the local APIC.
 
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index eb7df559ae74..f5ba1a3c41f8 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -21,6 +21,18 @@ static inline bool is_shared_processor(void)
 	return static_branch_unlikely(&shared_processor);
 }
 
+#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+extern struct static_key paravirt_steal_enabled;
+extern struct static_key paravirt_steal_rq_enabled;
+
+u64 pseries_paravirt_steal_clock(int cpu);
+
+static inline u64 paravirt_steal_clock(int cpu)
+{
+	return pseries_paravirt_steal_clock(cpu);
+}
+#endif
+
 /* If bit 0 is set, the cpu has been ceded, conferred, or preempted */
 static inline u32 yield_count_of(int cpu)
 {
diff --git a/arch/powerpc/include/asm/paravirt_api_clock.h b/arch/powerpc/include/asm/paravirt_api_clock.h
new file mode 100644
index 000000000000..65ac7cee0dad
--- /dev/null
+++ b/arch/powerpc/include/asm/paravirt_api_clock.h
@@ -0,0 +1 @@
+#include <asm/paravirt.h>
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index fb6499977f99..a3b4d99567cb 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -23,13 +23,21 @@ config PPC_PSERIES
 	select SWIOTLB
 	default y
 
+config PARAVIRT
+	bool
+
 config PARAVIRT_SPINLOCKS
 	bool
 
+config PARAVIRT_TIME_ACCOUNTING
+	select PARAVIRT
+	bool
+
 config PPC_SPLPAR
 	bool "Support for shared-processor logical partitions"
 	depends on PPC_PSERIES
 	select PARAVIRT_SPINLOCKS if PPC_QUEUED_SPINLOCKS
+	select PARAVIRT_TIME_ACCOUNTING if VIRT_CPU_ACCOUNTING_GEN
 	default y
 	help
 	  Enabling this option will make the kernel run more efficiently
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index e6c117fb6491..97ef6499e501 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -660,6 +660,17 @@ static int __init vcpudispatch_stats_procfs_init(void)
 }
 
 machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
+
+#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+u64 pseries_paravirt_steal_clock(int cpu)
+{
+	struct lppaca *lppaca = &lppaca_of(cpu);
+
+	return be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb)) +
+		be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
+}
+#endif
+
 #endif /* CONFIG_PPC_SPLPAR */
 
 void vpa_init(int cpu)
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 489f4c4df468..5e44c65a032c 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -80,6 +80,20 @@
 DEFINE_STATIC_KEY_FALSE(shared_processor);
 EXPORT_SYMBOL(shared_processor);
 
+#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+struct static_key paravirt_steal_enabled;
+struct static_key paravirt_steal_rq_enabled;
+
+static bool steal_acc = true;
+static int __init parse_no_stealacc(char *arg)
+{
+	steal_acc = false;
+	return 0;
+}
+
+early_param("no-steal-acc", parse_no_stealacc);
+#endif
+
 int CMO_PrPSP = -1;
 int CMO_SecPSP = -1;
 unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
@@ -834,6 +848,11 @@ static void __init pSeries_setup_arch(void)
 		if (lppaca_shared_proc(get_lppaca())) {
 			static_branch_enable(&shared_processor);
 			pv_spinlocks_init();
+#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+			static_key_slow_inc(&paravirt_steal_enabled);
+			if (steal_acc)
+				static_key_slow_inc(&paravirt_steal_rq_enabled);
+#endif
 		}
 
 		ppc_md.power_save = pseries_lpar_idle;
-- 
2.37.2

