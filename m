Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F452BB89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Dgb0L9rz3chY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:42:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzuW54yF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AzuW54yF; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Dcs30ZSz3c7p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:39:57 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id bh5so1795438plb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fvtg033ODf5bpD5YmPMWzbt0qPpMWnaEIFxLAkDAMVc=;
 b=AzuW54yFXVzHql4fnlFj6WgbfzDM6dahxIB6AVHLyspdcErTFQEtKnuSEsRhBQ+G0k
 ks9aIhUC2XvzpZz3eU7HSCazSqQYnfkIvqMKh9c6n1my/dOrUiB6GbQG5h2ZLu5n0QpZ
 WxSB+sV8iMJOkyiuZHmbf8phxOVllHyOQk3TO4L735u6NXE5VuC+UOBoRQTzwgIJDz3q
 wbVXJLz6LA6GYX5/c8KTegxDBjrkzCiw8kLj3GTnC3KpGFcaPYTyLWXhhx5KR7nt9yUP
 EBfqtJQgE2NgWcmaIMZQfXJui2NJj3b0dFnry9E7v20O1opi7VGEVXbEFJ+2D9n6I/+y
 RkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fvtg033ODf5bpD5YmPMWzbt0qPpMWnaEIFxLAkDAMVc=;
 b=TTUbfAJZopKWeMJAaGk8EOAwtW9sV2lVO0L8/0wDmCeCkD/oCRwq4Xw+VhabwHYc0T
 mLTtoajThL3WxywRaiwADucZzaWVniQDliWLJlhIF9onm0yZg6NT2RyoFKgo+5zVPh9o
 x7LtK4ZQTPwVW1WOL0lHL+vN4mZRzhnNMXsre3kLJ62zmInSH+/6O8znd/lwNamDmUit
 xJfy1Wpq3pVHoZm6lgip0d6oJomjd/OoFIHs+g/IpEvyPNfGQwN+Eo7xTuacyX/V0FHK
 hZOWY6DBqdnsubPcw4onVv3E311Es3ElgAA+ofjsRg4hg7v1zOHc5ehZeJlko9D9y7KH
 E3ZQ==
X-Gm-Message-State: AOAM533i09P1sWNgC9UNy+yYvnDHEA1E2Al2EGzL+AyxC4lPiqQ6iA2h
 GeDym2iKWpxyFj93AzOW8d984O2oBdwH4w==
X-Google-Smtp-Source: ABdhPJzsck2ZwD4f+5qNfFP5flKuCngQkMsHPGb4bgofVwkJ/ECF8SgvfNbREgqG7kNZPwaNGor/Zw==
X-Received: by 2002:a17:90b:2250:b0:1df:665c:79d1 with SMTP id
 hk16-20020a17090b225000b001df665c79d1mr34103pjb.220.1652881196752; 
 Wed, 18 May 2022 06:39:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([193.114.105.210])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a170902e1d400b0015e8d4eb209sm1677511pla.83.2022.05.18.06.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:39:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING
Date: Wed, 18 May 2022 23:39:34 +1000
Message-Id: <20220518133935.3878954-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518133935.3878954-1-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
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

CONFIG_VIRT_CPU_ACCOUNTING_GEN under pseries does not implement
stolen time accounting. Implement it with the paravirt time
accounting option.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++---
 arch/powerpc/include/asm/paravirt.h           | 12 ++++++++++++
 arch/powerpc/platforms/pseries/Kconfig        |  8 ++++++++
 arch/powerpc/platforms/pseries/lpar.c         | 11 +++++++++++
 arch/powerpc/platforms/pseries/setup.c        | 19 +++++++++++++++++++
 5 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3f1cc5e317ed..855fc7b02261 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3604,9 +3604,9 @@
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
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index f7fd91d153a4..d4306ebdca5e 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -24,13 +24,21 @@ config PPC_PSERIES
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
index 760581c5752f..1965b7d7d8f1 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -661,6 +661,17 @@ static int __init vcpudispatch_stats_procfs_init(void)
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
index 955ff8aa1644..691c9add4a5a 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -78,6 +78,20 @@
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
@@ -831,6 +845,11 @@ static void __init pSeries_setup_arch(void)
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
2.35.1

