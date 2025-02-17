Return-Path: <linuxppc-dev+bounces-6271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC867A38954
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxN4Z4Cz30RK;
	Tue, 18 Feb 2025 03:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810248;
	cv=none; b=gL7J6i4Yzi2OooH8rhYxea76a//xi60HfYTYn4xNIGUFu6YzWwnJWZCLLCpustzfJ5C9i8KaIW7977G7IoJBdXnNxVAEFI/JSXsPpJ6XIkO8BB0cq9EWA1THq5KSfgi3SmUPhYPlHdvJ2V6Y/woS8QqqYBnG/WSFxRZ8AG+h+61lZdY3ayFfH1snlbaunHlWnBwM8hc6bn9Wl6AXRXUfC7KIOHyXyOlatRRVw/C0GU9xLkctLMBGak49q2xC0ZH4Ro9vvWqCKfJ7tE9xtP0tSODLumim5dBtut+zeFxLb0cLYslihBi9PRc5mGXC9eYnwtphykynekovgb8qfXc0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810248; c=relaxed/relaxed;
	bh=ht6Tw66XBXpDEdLi5x6CX6yF/C+fg+QYQL0S/NppgKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWl8QiOgjFnoIg2AVLgMZTIdpFcT9He2jH5Ug7sp2qA/aKd2tYA6XCLaraBTJ1mMBljHS6DPxjW7orjj55egFj4WH+3FEbeIjFXLjOBXXbPTR4AWSTnslNjBh9PhBwRcY5W2cvuDK3sXiZfaVgvB+RZCMUPoX4DylBLcwZ0Z6qbdzJAxAqipXOlce5Unx0GQ9cqww+PDlgZ/qzs9TfDZx3M1qXEdypXM/5NwbVk5h5gugCbQHBSqxGurEn3hZwbAQWsdwVpUck8h+F2kDQ1ojk6LqSDkOqiCPI2xvz0JixaVYVJbepism5PWoviARKzzven/EVBWR96jpaGu62+ZAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F8wBbEg0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F8wBbEg0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxL5JHwz306S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:26 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38de1a5f039so4443860f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810243; x=1740415043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht6Tw66XBXpDEdLi5x6CX6yF/C+fg+QYQL0S/NppgKE=;
        b=F8wBbEg0kkNEcUbcQQ34pEG18y+mwAUGAFC5S/uUZLOIghI9WGRqNlUWp8G0dchGg4
         Nwe3lLentsEVmy37PrHPNMwWOK/12m8bbhaQRJFWPqF+MxJGzCrIlx3y48NoMGH+wSui
         /Mkj6GykGall6LtzGqfKQcZRYt2TgJIEM3vbpbDXUN5Auuff37a5iYIqzc6BKb1h3iTn
         PzRkkqlF9XqV+66UVxj/I1/ASwSDYRcQ1H6jseXJkM+vMKkzrWu8CwKuetoc+6IBCUWp
         vB8lKYyDKDWh30B2xqzdbZMYXG+p/WYaQooGOaToofuBD9m+zUvlx+7gpAsrHWVaJm/Y
         5C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810243; x=1740415043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht6Tw66XBXpDEdLi5x6CX6yF/C+fg+QYQL0S/NppgKE=;
        b=wWLMzuABDQ1H1dMWFWHu5iWXDmXOZA4pGheFuc5At6X4TE8T2FJXexzIad6AiDca/5
         BRHAZv6VZ2GDTQKkfhGPDm2erMplUVKDqhN2t18dDhKLDrj5zfpeU9M3bpoVhoihGX/d
         m4Vip2DCL5M70YZe3sFFLDjoOzfVo4XFYKG8Sl+SeWQFbKySfivg+fhcl6dMhFwNux4A
         2bYFCIWQQ0dlHcQr9l5xWjQG1iRdYLiUAlO6QcC0c3CFHgJfSOgEH95w7ybvysbzMb+i
         3AXx60qK+GPqAcUshXyAsyW3we0VRzI59YYOgE17IUtWIFCvqQfq+mdEBD5SJsxhKX9n
         ARMg==
X-Forwarded-Encrypted: i=1; AJvYcCXh45DRuplCB7F6gRcZYBAdaPy6G8nZujssJ/UQMt9XrrJfKb9FuFceqz3x0Z+BTTInKp1CE+rptLQnlHo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxKPzKos8kEaPIWi/waX9h1EyTX+b8M7+lxMLUeCXcNIMxdOWn
	xEh2MqChtlxyhLj4r/Gk1qepzwjEbfySN6FgffszIQ16P9QVC7tu
X-Gm-Gg: ASbGncvindwcq6C74TOZrbnTJMA2J0XcQPXdYPGh+HZ2L5um9YyqUDc0UNqlLDSBUyv
	O5LCAv2b5Cj8/S0qpIRKgzfwi5pe9Qf6SPtoRuHCTV6AfNKKawkQC37p65WH1r5JsH/31aQ3rvA
	1JlH20PzM3pT5eZqhW1HDVOVaJXwTyaXPZlbSbGna0EDP6YShL6kjpQ/nGkSmla3/NIIU1uZMBD
	Ze7e4yQoufyTJSTjvRaAIOB0YVUOHfqyWd4iRStg+NBaCfFcyxWb43fl/q7pJZTgXq2sv7pDcX+
	KFNyBgat907xGSyvq3yLErgQdTBaq5C90gxvrG2gIof09DMjp4Jspab7Y7G+cfTf5yfsSwFpuEN
	VyRFG/HU=
X-Google-Smtp-Source: AGHT+IG2VnNWvd1Smnp6D3wlajIrpI/BwbrfZkIXbLuygzQ8+rlsnp9dqjIX61Nx7wg6bF3b5jg72g==
X-Received: by 2002:a5d:6c66:0:b0:38f:2f0e:9813 with SMTP id ffacd0b85a97d-38f33e8067cmr12055449f8f.0.1739810242634;
        Mon, 17 Feb 2025 08:37:22 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f2591570esm12880746f8f.59.2025.02.17.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:21 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] syscore: Pass context data to callbacks
Date: Mon, 17 Feb 2025 17:37:07 +0100
Message-ID: <20250217163713.211949-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Pass a pointer to the syscore_ops structure that was registered to the
callbacks. This enables callbacks to act on instance data (syscore_ops
can be embedded into other structures, and driver-specific data can be
obtained using container_of()) rather than the current practice of
relying on global variables.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/mach-exynos/mcpm-exynos.c        |  4 ++--
 arch/arm/mach-exynos/suspend.c            | 14 +++++++-------
 arch/arm/mach-pxa/irq.c                   |  4 ++--
 arch/arm/mach-pxa/mfp-pxa2xx.c            |  4 ++--
 arch/arm/mach-pxa/mfp-pxa3xx.c            |  4 ++--
 arch/arm/mach-pxa/smemc.c                 |  4 ++--
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        |  4 ++--
 arch/arm/mach-s5pv210/pm.c                |  2 +-
 arch/arm/mach-versatile/integrator_ap.c   |  4 ++--
 arch/arm/mm/cache-b15-rac.c               |  4 ++--
 arch/loongarch/kernel/smp.c               |  4 ++--
 arch/mips/alchemy/common/dbdma.c          |  4 ++--
 arch/mips/alchemy/common/irq.c            |  8 ++++----
 arch/mips/alchemy/common/usb.c            |  4 ++--
 arch/mips/pci/pci-alchemy.c               |  4 ++--
 arch/powerpc/platforms/cell/spu_base.c    |  2 +-
 arch/powerpc/platforms/powermac/pic.c     |  4 ++--
 arch/powerpc/sysdev/fsl_lbc.c             |  4 ++--
 arch/powerpc/sysdev/fsl_pci.c             |  4 ++--
 arch/powerpc/sysdev/ipic.c                |  4 ++--
 arch/powerpc/sysdev/mpic.c                |  4 ++--
 arch/powerpc/sysdev/mpic_timer.c          |  2 +-
 arch/sh/mm/pmb.c                          |  2 +-
 arch/x86/events/amd/ibs.c                 |  4 ++--
 arch/x86/hyperv/hv_init.c                 |  4 ++--
 arch/x86/kernel/amd_gart_64.c             |  2 +-
 arch/x86/kernel/apic/apic.c               |  4 ++--
 arch/x86/kernel/apic/io_apic.c            |  9 +++++++--
 arch/x86/kernel/cpu/aperfmperf.c          |  6 +++---
 arch/x86/kernel/cpu/intel_epb.c           |  8 ++++----
 arch/x86/kernel/cpu/mce/core.c            |  6 +++---
 arch/x86/kernel/cpu/microcode/core.c      |  7 ++++++-
 arch/x86/kernel/cpu/mtrr/legacy.c         |  4 ++--
 arch/x86/kernel/cpu/umwait.c              |  2 +-
 arch/x86/kernel/i8237.c                   |  2 +-
 arch/x86/kernel/i8259.c                   |  6 +++---
 arch/x86/kernel/kvm.c                     |  4 ++--
 drivers/acpi/pci_link.c                   |  2 +-
 drivers/acpi/sleep.c                      |  4 ++--
 drivers/base/firmware_loader/main.c       |  2 +-
 drivers/base/syscore.c                    |  8 ++++----
 drivers/bus/mvebu-mbus.c                  |  4 ++--
 drivers/clk/at91/pmc.c                    |  4 ++--
 drivers/clk/imx/clk-vf610.c               |  4 ++--
 drivers/clk/ingenic/pm.c                  |  4 ++--
 drivers/clk/ingenic/tcu.c                 |  4 ++--
 drivers/clk/mvebu/common.c                |  4 ++--
 drivers/clk/rockchip/clk-rk3288.c         |  4 ++--
 drivers/clk/samsung/clk-s5pv210-audss.c   |  4 ++--
 drivers/clk/samsung/clk.c                 |  4 ++--
 drivers/clk/tegra/clk-tegra210.c          |  4 ++--
 drivers/clocksource/timer-armada-370-xp.c |  4 ++--
 drivers/cpuidle/cpuidle-psci.c            |  4 ++--
 drivers/gpio/gpio-mxc.c                   |  4 ++--
 drivers/gpio/gpio-pxa.c                   |  4 ++--
 drivers/hv/vmbus_drv.c                    |  4 ++--
 drivers/iommu/amd/init.c                  |  4 ++--
 drivers/iommu/intel/iommu.c               |  4 ++--
 drivers/irqchip/exynos-combiner.c         |  6 ++++--
 drivers/irqchip/irq-armada-370-xp.c       |  4 ++--
 drivers/irqchip/irq-bcm7038-l1.c          |  4 ++--
 drivers/irqchip/irq-gic-v3-its.c          |  4 ++--
 drivers/irqchip/irq-i8259.c               |  4 ++--
 drivers/irqchip/irq-imx-gpcv2.c           |  4 ++--
 drivers/irqchip/irq-loongson-eiointc.c    |  4 ++--
 drivers/irqchip/irq-loongson-htpic.c      |  2 +-
 drivers/irqchip/irq-loongson-htvec.c      |  4 ++--
 drivers/irqchip/irq-loongson-pch-lpc.c    |  4 ++--
 drivers/irqchip/irq-loongson-pch-pic.c    |  4 ++--
 drivers/irqchip/irq-mchp-eic.c            |  4 ++--
 drivers/irqchip/irq-mst-intc.c            |  4 ++--
 drivers/irqchip/irq-mtk-cirq.c            |  4 ++--
 drivers/irqchip/irq-renesas-rzg2l.c       |  4 ++--
 drivers/irqchip/irq-sa11x0.c              |  4 ++--
 drivers/irqchip/irq-sifive-plic.c         |  4 ++--
 drivers/irqchip/irq-sun6i-r.c             | 10 +++++-----
 drivers/irqchip/irq-tegra.c               |  4 ++--
 drivers/irqchip/irq-vic.c                 |  4 ++--
 drivers/leds/trigger/ledtrig-cpu.c        |  6 +++---
 drivers/macintosh/via-pmu.c               |  4 ++--
 drivers/power/reset/sc27xx-poweroff.c     |  2 +-
 drivers/sh/clk/core.c                     |  2 +-
 drivers/sh/intc/core.c                    |  4 ++--
 drivers/soc/bcm/brcmstb/biuctrl.c         |  4 ++--
 drivers/soc/tegra/pmc.c                   |  4 ++--
 drivers/thermal/intel/intel_hfi.c         |  4 ++--
 drivers/xen/xen-acpi-processor.c          |  2 +-
 include/linux/syscore_ops.h               |  6 +++---
 kernel/cpu_pm.c                           |  4 ++--
 kernel/irq/generic-chip.c                 |  6 +++---
 kernel/irq/pm.c                           |  2 +-
 kernel/printk/printk.c                    |  2 +-
 kernel/time/sched_clock.c                 | 14 ++++++++++++--
 kernel/time/timekeeping.c                 | 14 ++++++++++++--
 virt/kvm/kvm_main.c                       |  6 +++---
 95 files changed, 227 insertions(+), 195 deletions(-)

diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
index fd0dbeb93357..e9ec6bc1936e 100644
--- a/arch/arm/mach-exynos/mcpm-exynos.c
+++ b/arch/arm/mach-exynos/mcpm-exynos.c
@@ -215,7 +215,7 @@ static const struct of_device_id exynos_dt_mcpm_match[] = {
 	{},
 };
 
-static void exynos_mcpm_setup_entry_point(void)
+static void exynos_mcpm_setup_entry_point(struct syscore_ops *ops)
 {
 	/*
 	 * U-Boot SPL is hardcoded to jump to the start of ns_sram_base_addr
@@ -300,7 +300,7 @@ static int __init exynos_mcpm_init(void)
 		pmu_raw_writel(value, EXYNOS_COMMON_OPTION(i));
 	}
 
-	exynos_mcpm_setup_entry_point();
+	exynos_mcpm_setup_entry_point(NULL);
 
 	register_syscore_ops(&exynos_mcpm_syscore_ops);
 
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index cac4e82f6c82..0c355e8e01cf 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -53,8 +53,8 @@ struct exynos_pm_data {
 
 	void (*pm_prepare)(void);
 	void (*pm_resume_prepare)(void);
-	void (*pm_resume)(void);
-	int (*pm_suspend)(void);
+	void (*pm_resume)(struct syscore_ops *ops);
+	int (*pm_suspend)(struct syscore_ops *ops);
 	int (*cpu_suspend)(unsigned long);
 };
 
@@ -377,7 +377,7 @@ static void exynos5420_pm_prepare(void)
 }
 
 
-static int exynos_pm_suspend(void)
+static int exynos_pm_suspend(struct syscore_ops *ops)
 {
 	exynos_pm_central_suspend();
 
@@ -391,7 +391,7 @@ static int exynos_pm_suspend(void)
 	return 0;
 }
 
-static int exynos5420_pm_suspend(void)
+static int exynos5420_pm_suspend(struct syscore_ops *ops)
 {
 	u32 this_cluster;
 
@@ -409,7 +409,7 @@ static int exynos5420_pm_suspend(void)
 	return 0;
 }
 
-static void exynos_pm_resume(void)
+static void exynos_pm_resume(struct syscore_ops *ops)
 {
 	u32 cpuid = read_cpuid_part();
 
@@ -430,7 +430,7 @@ static void exynos_pm_resume(void)
 	exynos_set_delayed_reset_assertion(true);
 }
 
-static void exynos3250_pm_resume(void)
+static void exynos3250_pm_resume(struct syscore_ops *ops)
 {
 	u32 cpuid = read_cpuid_part();
 
@@ -474,7 +474,7 @@ static void exynos5420_prepare_pm_resume(void)
 	}
 }
 
-static void exynos5420_pm_resume(void)
+static void exynos5420_pm_resume(struct syscore_ops *ops)
 {
 	unsigned long tmp;
 
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index a9ef71008147..6f4ab713a0d1 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -179,7 +179,7 @@ void __init pxa_init_irq(int irq_nr, int (*fn)(struct irq_data *, unsigned int))
 static unsigned long saved_icmr[MAX_INTERNAL_IRQS/32];
 static unsigned long saved_ipr[MAX_INTERNAL_IRQS];
 
-static int pxa_irq_suspend(void)
+static int pxa_irq_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -198,7 +198,7 @@ static int pxa_irq_suspend(void)
 	return 0;
 }
 
-static void pxa_irq_resume(void)
+static void pxa_irq_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index f5a3d890f682..55d697c80f45 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -346,7 +346,7 @@ static unsigned long saved_gpdr[4];
 static unsigned long saved_gplr[4];
 static unsigned long saved_pgsr[4];
 
-static int pxa2xx_mfp_suspend(void)
+static int pxa2xx_mfp_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -385,7 +385,7 @@ static int pxa2xx_mfp_suspend(void)
 	return 0;
 }
 
-static void pxa2xx_mfp_resume(void)
+static void pxa2xx_mfp_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/arch/arm/mach-pxa/mfp-pxa3xx.c b/arch/arm/mach-pxa/mfp-pxa3xx.c
index d16ab7451efe..263ffe35e893 100644
--- a/arch/arm/mach-pxa/mfp-pxa3xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa3xx.c
@@ -27,13 +27,13 @@
  * a pull-down mode if they're an active low chip select, and we're
  * just entering standby.
  */
-static int pxa3xx_mfp_suspend(void)
+static int pxa3xx_mfp_suspend(struct syscore_ops *ops)
 {
 	mfp_config_lpm();
 	return 0;
 }
 
-static void pxa3xx_mfp_resume(void)
+static void pxa3xx_mfp_resume(struct syscore_ops *ops)
 {
 	mfp_config_run();
 
diff --git a/arch/arm/mach-pxa/smemc.c b/arch/arm/mach-pxa/smemc.c
index 2d2a321d82f8..265a6b86d19d 100644
--- a/arch/arm/mach-pxa/smemc.c
+++ b/arch/arm/mach-pxa/smemc.c
@@ -18,7 +18,7 @@ static unsigned long msc[2];
 static unsigned long sxcnfg, memclkcfg;
 static unsigned long csadrcfg[4];
 
-static int pxa3xx_smemc_suspend(void)
+static int pxa3xx_smemc_suspend(struct syscore_ops *ops)
 {
 	msc[0] = __raw_readl(MSC0);
 	msc[1] = __raw_readl(MSC1);
@@ -32,7 +32,7 @@ static int pxa3xx_smemc_suspend(void)
 	return 0;
 }
 
-static void pxa3xx_smemc_resume(void)
+static void pxa3xx_smemc_resume(struct syscore_ops *ops)
 {
 	__raw_writel(msc[0], MSC0);
 	__raw_writel(msc[1], MSC1);
diff --git a/arch/arm/mach-s3c/irq-pm-s3c64xx.c b/arch/arm/mach-s3c/irq-pm-s3c64xx.c
index 4a1e935bada1..0841c5df9614 100644
--- a/arch/arm/mach-s3c/irq-pm-s3c64xx.c
+++ b/arch/arm/mach-s3c/irq-pm-s3c64xx.c
@@ -58,7 +58,7 @@ static struct irq_grp_save {
 
 static u32 irq_uart_mask[SERIAL_SAMSUNG_UARTS];
 
-static int s3c64xx_irq_pm_suspend(void)
+static int s3c64xx_irq_pm_suspend(struct syscore_ops *ops)
 {
 	struct irq_grp_save *grp = eint_grp_save;
 	int i;
@@ -79,7 +79,7 @@ static int s3c64xx_irq_pm_suspend(void)
 	return 0;
 }
 
-static void s3c64xx_irq_pm_resume(void)
+static void s3c64xx_irq_pm_resume(struct syscore_ops *ops)
 {
 	struct irq_grp_save *grp = eint_grp_save;
 	int i;
diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
index 6fa70f787df4..5b1dd70259f3 100644
--- a/arch/arm/mach-s5pv210/pm.c
+++ b/arch/arm/mach-s5pv210/pm.c
@@ -195,7 +195,7 @@ static const struct platform_suspend_ops s5pv210_suspend_ops = {
 /*
  * Syscore operations used to delay restore of certain registers.
  */
-static void s5pv210_pm_resume(void)
+static void s5pv210_pm_resume(struct syscore_ops *ops)
 {
 	s3c_pm_do_restore_core(s5pv210_core_save, ARRAY_SIZE(s5pv210_core_save));
 }
diff --git a/arch/arm/mach-versatile/integrator_ap.c b/arch/arm/mach-versatile/integrator_ap.c
index 4bd6712e9f52..90718a4ca613 100644
--- a/arch/arm/mach-versatile/integrator_ap.c
+++ b/arch/arm/mach-versatile/integrator_ap.c
@@ -63,13 +63,13 @@ static void __init ap_map_io(void)
 #ifdef CONFIG_PM
 static unsigned long ic_irq_enable;
 
-static int irq_suspend(void)
+static int irq_suspend(struct syscore_ops *ops)
 {
 	ic_irq_enable = readl(VA_IC_BASE + IRQ_ENABLE);
 	return 0;
 }
 
-static void irq_resume(void)
+static void irq_resume(struct syscore_ops *ops)
 {
 	/* disable all irq sources */
 	cm_clear_irqs();
diff --git a/arch/arm/mm/cache-b15-rac.c b/arch/arm/mm/cache-b15-rac.c
index 6f63b90f9e1a..fcb07d2050d0 100644
--- a/arch/arm/mm/cache-b15-rac.c
+++ b/arch/arm/mm/cache-b15-rac.c
@@ -256,7 +256,7 @@ static int b15_rac_dead_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int b15_rac_suspend(void)
+static int b15_rac_suspend(struct syscore_ops *ops)
 {
 	/* Suspend the read-ahead cache oeprations, forcing our cache
 	 * implementation to fallback to the regular ARMv7 calls.
@@ -271,7 +271,7 @@ static int b15_rac_suspend(void)
 	return 0;
 }
 
-static void b15_rac_resume(void)
+static void b15_rac_resume(struct syscore_ops *ops)
 {
 	/* Coming out of a S3 suspend/resume cycle, the read-ahead cache
 	 * register RAC_CONFIG0_REG will be restored to its default value, make
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index fbf747447f13..cd8c5e639b5a 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -454,12 +454,12 @@ void __noreturn arch_cpu_idle_dead(void)
  */
 #ifdef CONFIG_PM
 
-static int loongson_ipi_suspend(void)
+static int loongson_ipi_suspend(struct syscore_ops *ops)
 {
 	return 0;
 }
 
-static void loongson_ipi_resume(void)
+static void loongson_ipi_resume(struct syscore_ops *ops)
 {
 	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_EN);
 }
diff --git a/arch/mips/alchemy/common/dbdma.c b/arch/mips/alchemy/common/dbdma.c
index 6a3c890f7bbf..0cccf427756a 100644
--- a/arch/mips/alchemy/common/dbdma.c
+++ b/arch/mips/alchemy/common/dbdma.c
@@ -982,7 +982,7 @@ u32 au1xxx_dbdma_put_dscr(u32 chanid, au1x_ddma_desc_t *dscr)
 
 static unsigned long alchemy_dbdma_pm_data[NUM_DBDMA_CHANS + 1][6];
 
-static int alchemy_dbdma_suspend(void)
+static int alchemy_dbdma_suspend(struct syscore_ops *ops)
 {
 	int i;
 	void __iomem *addr;
@@ -1019,7 +1019,7 @@ static int alchemy_dbdma_suspend(void)
 	return 0;
 }
 
-static void alchemy_dbdma_resume(void)
+static void alchemy_dbdma_resume(struct syscore_ops *ops)
 {
 	int i;
 	void __iomem *addr;
diff --git a/arch/mips/alchemy/common/irq.c b/arch/mips/alchemy/common/irq.c
index da9f9220048f..8e999dbbed46 100644
--- a/arch/mips/alchemy/common/irq.c
+++ b/arch/mips/alchemy/common/irq.c
@@ -758,7 +758,7 @@ static inline void alchemy_ic_resume_one(void __iomem *base, unsigned long *d)
 	wmb();
 }
 
-static int alchemy_ic_suspend(void)
+static int alchemy_ic_suspend(struct syscore_ops *ops)
 {
 	alchemy_ic_suspend_one((void __iomem *)KSEG1ADDR(AU1000_IC0_PHYS_ADDR),
 			       alchemy_gpic_pmdata);
@@ -767,7 +767,7 @@ static int alchemy_ic_suspend(void)
 	return 0;
 }
 
-static void alchemy_ic_resume(void)
+static void alchemy_ic_resume(struct syscore_ops *ops)
 {
 	alchemy_ic_resume_one((void __iomem *)KSEG1ADDR(AU1000_IC1_PHYS_ADDR),
 			      &alchemy_gpic_pmdata[7]);
@@ -775,7 +775,7 @@ static void alchemy_ic_resume(void)
 			      alchemy_gpic_pmdata);
 }
 
-static int alchemy_gpic_suspend(void)
+static int alchemy_gpic_suspend(struct syscore_ops *ops)
 {
 	void __iomem *base = (void __iomem *)KSEG1ADDR(AU1300_GPIC_PHYS_ADDR);
 	int i;
@@ -806,7 +806,7 @@ static int alchemy_gpic_suspend(void)
 	return 0;
 }
 
-static void alchemy_gpic_resume(void)
+static void alchemy_gpic_resume(struct syscore_ops *ops)
 {
 	void __iomem *base = (void __iomem *)KSEG1ADDR(AU1300_GPIC_PHYS_ADDR);
 	int i;
diff --git a/arch/mips/alchemy/common/usb.c b/arch/mips/alchemy/common/usb.c
index 5d618547ebf0..3d9bb51e00ea 100644
--- a/arch/mips/alchemy/common/usb.c
+++ b/arch/mips/alchemy/common/usb.c
@@ -580,13 +580,13 @@ static void alchemy_usb_pm(int susp)
 	}
 }
 
-static int alchemy_usb_suspend(void)
+static int alchemy_usb_suspend(struct syscore_ops *ops)
 {
 	alchemy_usb_pm(1);
 	return 0;
 }
 
-static void alchemy_usb_resume(void)
+static void alchemy_usb_resume(struct syscore_ops *ops)
 {
 	alchemy_usb_pm(0);
 }
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 58625d1b6465..a20de7160b6b 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -304,7 +304,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 }
 
 /* save PCI controller register contents. */
-static int alchemy_pci_suspend(void)
+static int alchemy_pci_suspend(struct syscore_ops *ops)
 {
 	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
 	if (!ctx)
@@ -326,7 +326,7 @@ static int alchemy_pci_suspend(void)
 	return 0;
 }
 
-static void alchemy_pci_resume(void)
+static void alchemy_pci_resume(struct syscore_ops *ops)
 {
 	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
 	if (!ctx)
diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index dea6f0f25897..c85a1eb0745d 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -727,7 +727,7 @@ static inline void crash_register_spus(struct list_head *list)
 }
 #endif
 
-static void spu_shutdown(void)
+static void spu_shutdown(struct syscore_ops *ops)
 {
 	struct spu *spu;
 
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2202bf77c7a3..571f7039a7cc 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -599,7 +599,7 @@ static int pmacpic_find_viaint(void)
 	return viaint;
 }
 
-static int pmacpic_suspend(void)
+static int pmacpic_suspend(struct syscore_ops *ops)
 {
 	int viaint = pmacpic_find_viaint();
 
@@ -620,7 +620,7 @@ static int pmacpic_suspend(void)
         return 0;
 }
 
-static void pmacpic_resume(void)
+static void pmacpic_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 217cea150987..d215c6aeec8b 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -350,7 +350,7 @@ static int fsl_lbc_ctrl_probe(struct platform_device *dev)
 #ifdef CONFIG_SUSPEND
 
 /* save lbc registers */
-static int fsl_lbc_syscore_suspend(void)
+static int fsl_lbc_syscore_suspend(struct syscore_ops *ops)
 {
 	struct fsl_lbc_ctrl *ctrl;
 	struct fsl_lbc_regs __iomem *lbc;
@@ -374,7 +374,7 @@ static int fsl_lbc_syscore_suspend(void)
 }
 
 /* restore lbc registers */
-static void fsl_lbc_syscore_resume(void)
+static void fsl_lbc_syscore_resume(struct syscore_ops *ops)
 {
 	struct fsl_lbc_ctrl *ctrl;
 	struct fsl_lbc_regs __iomem *lbc;
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index ef7707ea0db7..64ab3f46a1b7 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1258,7 +1258,7 @@ static void fsl_pci_syscore_do_suspend(struct pci_controller *hose)
 	send_pme_turnoff_message(hose);
 }
 
-static int fsl_pci_syscore_suspend(void)
+static int fsl_pci_syscore_suspend(struct syscore_ops *ops)
 {
 	struct pci_controller *hose, *tmp;
 
@@ -1291,7 +1291,7 @@ static void fsl_pci_syscore_do_resume(struct pci_controller *hose)
 	setup_pci_atmu(hose);
 }
 
-static void fsl_pci_syscore_resume(void)
+static void fsl_pci_syscore_resume(struct syscore_ops *ops)
 {
 	struct pci_controller *hose, *tmp;
 
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 5f69e2d50f26..f63040ec022c 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -817,7 +817,7 @@ static struct {
 	u32 sercr;
 } ipic_saved_state;
 
-static int ipic_suspend(void)
+static int ipic_suspend(struct syscore_ops *ops)
 {
 	struct ipic *ipic = primary_ipic;
 
@@ -848,7 +848,7 @@ static int ipic_suspend(void)
 	return 0;
 }
 
-static void ipic_resume(void)
+static void ipic_resume(struct syscore_ops *ops)
 {
 	struct ipic *ipic = primary_ipic;
 
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index d94cf36b0f65..c56f2287b3a8 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1943,7 +1943,7 @@ static void mpic_suspend_one(struct mpic *mpic)
 	}
 }
 
-static int mpic_suspend(void)
+static int mpic_suspend(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpics;
 
@@ -1985,7 +1985,7 @@ static void mpic_resume_one(struct mpic *mpic)
 	} /* end for loop */
 }
 
-static void mpic_resume(void)
+static void mpic_resume(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpics;
 
diff --git a/arch/powerpc/sysdev/mpic_timer.c b/arch/powerpc/sysdev/mpic_timer.c
index 7166e2e0baaf..9f9986bb2dc9 100644
--- a/arch/powerpc/sysdev/mpic_timer.c
+++ b/arch/powerpc/sysdev/mpic_timer.c
@@ -519,7 +519,7 @@ static void __init timer_group_init(struct device_node *np)
 	kfree(priv);
 }
 
-static void mpic_timer_resume(void)
+static void mpic_timer_resume(struct syscore_ops *ops)
 {
 	struct timer_group_priv *priv;
 
diff --git a/arch/sh/mm/pmb.c b/arch/sh/mm/pmb.c
index 68eb7cc6e564..7b71038bcc71 100644
--- a/arch/sh/mm/pmb.c
+++ b/arch/sh/mm/pmb.c
@@ -857,7 +857,7 @@ static int __init pmb_debugfs_init(void)
 subsys_initcall(pmb_debugfs_init);
 
 #ifdef CONFIG_PM
-static void pmb_syscore_resume(void)
+static void pmb_syscore_resume(struct syscore_ops *ops)
 {
 	struct pmb_entry *pmbe;
 	int i;
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 7978d7910adc..278a579834d1 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1545,13 +1545,13 @@ static int x86_pmu_amd_ibs_starting_cpu(unsigned int cpu)
 
 #ifdef CONFIG_PM
 
-static int perf_ibs_suspend(void)
+static int perf_ibs_suspend(struct syscore_ops *ops)
 {
 	clear_APIC_ibs();
 	return 0;
 }
 
-static void perf_ibs_resume(void)
+static void perf_ibs_resume(struct syscore_ops *ops)
 {
 	ibs_eilvt_setup();
 	setup_APIC_ibs();
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 9be1446f5bd3..c8e0600b5353 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -312,7 +312,7 @@ static int __init hv_pci_init(void)
 	return 1;
 }
 
-static int hv_suspend(void)
+static int hv_suspend(struct syscore_ops *ops)
 {
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
@@ -339,7 +339,7 @@ static int hv_suspend(void)
 	return ret;
 }
 
-static void hv_resume(void)
+static void hv_resume(struct syscore_ops *ops)
 {
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index c884deca839b..29206f0ba7fd 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -591,7 +591,7 @@ static void gart_fixup_northbridges(void)
 	}
 }
 
-static void gart_resume(void)
+static void gart_resume(struct syscore_ops *ops)
 {
 	pr_info("PCI-DMA: Resuming GART IOMMU\n");
 
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index e893dc6f11c1..6d8f4ee0e629 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2378,7 +2378,7 @@ static struct {
 	unsigned int apic_cmci;
 } apic_pm_state;
 
-static int lapic_suspend(void)
+static int lapic_suspend(struct syscore_ops *ops)
 {
 	unsigned long flags;
 	int maxlvt;
@@ -2426,7 +2426,7 @@ static int lapic_suspend(void)
 	return 0;
 }
 
-static void lapic_resume(void)
+static void lapic_resume(struct syscore_ops *ops)
 {
 	unsigned int l, h;
 	unsigned long flags;
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index eebc360ed1bb..497e29c1e248 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2308,7 +2308,12 @@ static void resume_ioapic_id(int ioapic_idx)
 	}
 }
 
-static void ioapic_resume(void)
+static int ioapic_suspend(struct syscore_ops *ops)
+{
+	return save_ioapic_entries();
+}
+
+static void ioapic_resume(struct syscore_ops *ops)
 {
 	int ioapic_idx;
 
@@ -2319,7 +2324,7 @@ static void ioapic_resume(void)
 }
 
 static struct syscore_ops ioapic_syscore_ops = {
-	.suspend	= save_ioapic_entries,
+	.suspend	= ioapic_suspend,
 	.resume		= ioapic_resume,
 };
 
diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index f642de2ebdac..b82c89756941 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -36,7 +36,7 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct aperfmperf, cpu_samples) = {
 	.seq = SEQCNT_ZERO(cpu_samples.seq)
 };
 
-static void init_counter_refs(void)
+static void init_counter_refs(struct syscore_ops *ops)
 {
 	u64 aperf, mperf;
 
@@ -534,7 +534,7 @@ static int __init bp_init_aperfmperf(void)
 	if (!cpu_feature_enabled(X86_FEATURE_APERFMPERF))
 		return 0;
 
-	init_counter_refs();
+	init_counter_refs(NULL);
 	bp_init_freq_invariance();
 	return 0;
 }
@@ -543,5 +543,5 @@ early_initcall(bp_init_aperfmperf);
 void ap_init_aperfmperf(void)
 {
 	if (cpu_feature_enabled(X86_FEATURE_APERFMPERF))
-		init_counter_refs();
+		init_counter_refs(NULL);
 }
diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
index 30b1d63b97f3..d41db3b9544d 100644
--- a/arch/x86/kernel/cpu/intel_epb.c
+++ b/arch/x86/kernel/cpu/intel_epb.c
@@ -75,7 +75,7 @@ static u8 energ_perf_values[] = {
 	[EPB_INDEX_POWERSAVE] = ENERGY_PERF_BIAS_POWERSAVE,
 };
 
-static int intel_epb_save(void)
+static int intel_epb_save(struct syscore_ops *ops)
 {
 	u64 epb;
 
@@ -89,7 +89,7 @@ static int intel_epb_save(void)
 	return 0;
 }
 
-static void intel_epb_restore(void)
+static void intel_epb_restore(struct syscore_ops *ops)
 {
 	u64 val = this_cpu_read(saved_epb);
 	u64 epb;
@@ -185,7 +185,7 @@ static int intel_epb_online(unsigned int cpu)
 {
 	struct device *cpu_dev = get_cpu_device(cpu);
 
-	intel_epb_restore();
+	intel_epb_restore(NULL);
 	if (!cpuhp_tasks_frozen)
 		sysfs_merge_group(&cpu_dev->kobj, &intel_epb_attr_group);
 
@@ -199,7 +199,7 @@ static int intel_epb_offline(unsigned int cpu)
 	if (!cpuhp_tasks_frozen)
 		sysfs_unmerge_group(&cpu_dev->kobj, &intel_epb_attr_group);
 
-	intel_epb_save();
+	intel_epb_save(NULL);
 	return 0;
 }
 
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 0dc00c9894c7..9f1755bed917 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2459,13 +2459,13 @@ static void vendor_disable_error_reporting(void)
 	mce_disable_error_reporting();
 }
 
-static int mce_syscore_suspend(void)
+static int mce_syscore_suspend(struct syscore_ops *ops)
 {
 	vendor_disable_error_reporting();
 	return 0;
 }
 
-static void mce_syscore_shutdown(void)
+static void mce_syscore_shutdown(struct syscore_ops *ops)
 {
 	vendor_disable_error_reporting();
 }
@@ -2475,7 +2475,7 @@ static void mce_syscore_shutdown(void)
  * Only one CPU is active at this time, the others get re-added later using
  * CPU hotplug:
  */
-static void mce_syscore_resume(void)
+static void mce_syscore_resume(struct syscore_ops *ops)
 {
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_vendor(raw_cpu_ptr(&cpu_info));
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..20943f4d2b7a 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -762,8 +762,13 @@ void microcode_bsp_resume(void)
 		reload_early_microcode(cpu);
 }
 
+static void microcode_bsp_syscore_resume(struct syscore_ops *ops)
+{
+	microcode_bsp_resume();
+}
+
 static struct syscore_ops mc_syscore_ops = {
-	.resume	= microcode_bsp_resume,
+	.resume	= microcode_bsp_syscore_resume,
 };
 
 static int mc_cpu_online(unsigned int cpu)
diff --git a/arch/x86/kernel/cpu/mtrr/legacy.c b/arch/x86/kernel/cpu/mtrr/legacy.c
index d25882fcf181..51258e44f246 100644
--- a/arch/x86/kernel/cpu/mtrr/legacy.c
+++ b/arch/x86/kernel/cpu/mtrr/legacy.c
@@ -41,7 +41,7 @@ struct mtrr_value {
 
 static struct mtrr_value *mtrr_value;
 
-static int mtrr_save(void)
+static int mtrr_save(struct syscore_ops *ops)
 {
 	int i;
 
@@ -56,7 +56,7 @@ static int mtrr_save(void)
 	return 0;
 }
 
-static void mtrr_restore(void)
+static void mtrr_restore(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/arch/x86/kernel/cpu/umwait.c b/arch/x86/kernel/cpu/umwait.c
index 2293efd6ffa6..757df74d2aa6 100644
--- a/arch/x86/kernel/cpu/umwait.c
+++ b/arch/x86/kernel/cpu/umwait.c
@@ -86,7 +86,7 @@ static int umwait_cpu_offline(unsigned int cpu)
  * trust the firmware nor does it matter if the same value is written
  * again.
  */
-static void umwait_syscore_resume(void)
+static void umwait_syscore_resume(struct syscore_ops *ops)
 {
 	umwait_update_control_msr(NULL);
 }
diff --git a/arch/x86/kernel/i8237.c b/arch/x86/kernel/i8237.c
index 2cd124ad9380..aaa86ed1539a 100644
--- a/arch/x86/kernel/i8237.c
+++ b/arch/x86/kernel/i8237.c
@@ -19,7 +19,7 @@
  * in asm/dma.h.
  */
 
-static void i8237A_resume(void)
+static void i8237A_resume(struct syscore_ops *ops)
 {
 	unsigned long flags;
 	int i;
diff --git a/arch/x86/kernel/i8259.c b/arch/x86/kernel/i8259.c
index c20d1832c481..091d9d3e7420 100644
--- a/arch/x86/kernel/i8259.c
+++ b/arch/x86/kernel/i8259.c
@@ -246,19 +246,19 @@ static void save_ELCR(char *trigger)
 	trigger[1] = inb(PIC_ELCR2) & 0xDE;
 }
 
-static void i8259A_resume(void)
+static void i8259A_resume(struct syscore_ops *ops)
 {
 	init_8259A(i8259A_auto_eoi);
 	restore_ELCR(irq_trigger);
 }
 
-static int i8259A_suspend(void)
+static int i8259A_suspend(struct syscore_ops *ops)
 {
 	save_ELCR(irq_trigger);
 	return 0;
 }
 
-static void i8259A_shutdown(void)
+static void i8259A_shutdown(struct syscore_ops *ops)
 {
 	/* Put the i8259A into a quiescent state that
 	 * the kernel initialization code can get it
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 7a422a6c5983..b845d0592915 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -720,7 +720,7 @@ static int kvm_cpu_down_prepare(unsigned int cpu)
 
 #endif
 
-static int kvm_suspend(void)
+static int kvm_suspend(struct syscore_ops *ops)
 {
 	u64 val = 0;
 
@@ -734,7 +734,7 @@ static int kvm_suspend(void)
 	return 0;
 }
 
-static void kvm_resume(void)
+static void kvm_resume(struct syscore_ops *ops)
 {
 	kvm_cpu_online(raw_smp_processor_id());
 
diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index 08e10b6226dc..b1ab30522f98 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -761,7 +761,7 @@ static int acpi_pci_link_resume(struct acpi_pci_link *link)
 	return 0;
 }
 
-static void irqrouter_resume(void)
+static void irqrouter_resume(struct syscore_ops *ops)
 {
 	struct acpi_pci_link *link;
 
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index c8ee8e42b0f6..9f6b108384a7 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -884,13 +884,13 @@ bool acpi_s2idle_wakeup(void)
 #ifdef CONFIG_PM_SLEEP
 static u32 saved_bm_rld;
 
-static int  acpi_save_bm_rld(void)
+static int  acpi_save_bm_rld(struct syscore_ops *ops)
 {
 	acpi_read_bit_register(ACPI_BITREG_BUS_MASTER_RLD, &saved_bm_rld);
 	return 0;
 }
 
-static void  acpi_restore_bm_rld(void)
+static void  acpi_restore_bm_rld(struct syscore_ops *ops)
 {
 	u32 resumed_bm_rld = 0;
 
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index cb0912ea3e62..7f9a775abf7d 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1620,7 +1620,7 @@ static int fw_pm_notify(struct notifier_block *notify_block,
 }
 
 /* stop caching firmware once syscore_suspend is reached */
-static int fw_suspend(void)
+static int fw_suspend(struct syscore_ops *ops)
 {
 	fw_cache.state = FW_LOADER_NO_CACHE;
 	return 0;
diff --git a/drivers/base/syscore.c b/drivers/base/syscore.c
index 13db1f78d2ce..e467078faa28 100644
--- a/drivers/base/syscore.c
+++ b/drivers/base/syscore.c
@@ -62,7 +62,7 @@ int syscore_suspend(void)
 	list_for_each_entry_reverse(ops, &syscore_ops_list, node)
 		if (ops->suspend) {
 			pm_pr_dbg("Calling %pS\n", ops->suspend);
-			ret = ops->suspend();
+			ret = ops->suspend(ops);
 			if (ret)
 				goto err_out;
 			WARN_ONCE(!irqs_disabled(),
@@ -77,7 +77,7 @@ int syscore_suspend(void)
 
 	list_for_each_entry_continue(ops, &syscore_ops_list, node)
 		if (ops->resume)
-			ops->resume();
+			ops->resume(ops);
 
 	return ret;
 }
@@ -99,7 +99,7 @@ void syscore_resume(void)
 	list_for_each_entry(ops, &syscore_ops_list, node)
 		if (ops->resume) {
 			pm_pr_dbg("Calling %pS\n", ops->resume);
-			ops->resume();
+			ops->resume(ops);
 			WARN_ONCE(!irqs_disabled(),
 				"Interrupts enabled after %pS\n", ops->resume);
 		}
@@ -121,7 +121,7 @@ void syscore_shutdown(void)
 		if (ops->shutdown) {
 			if (initcall_debug)
 				pr_info("PM: Calling %pS\n", ops->shutdown);
-			ops->shutdown();
+			ops->shutdown(ops);
 		}
 
 	mutex_unlock(&syscore_ops_lock);
diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 00cb792bda18..92daa45cc844 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -1006,7 +1006,7 @@ static __init int mvebu_mbus_debugfs_init(void)
 }
 fs_initcall(mvebu_mbus_debugfs_init);
 
-static int mvebu_mbus_suspend(void)
+static int mvebu_mbus_suspend(struct syscore_ops *ops)
 {
 	struct mvebu_mbus_state *s = &mbus_state;
 	int win;
@@ -1040,7 +1040,7 @@ static int mvebu_mbus_suspend(void)
 	return 0;
 }
 
-static void mvebu_mbus_resume(void)
+static void mvebu_mbus_resume(struct syscore_ops *ops)
 {
 	struct mvebu_mbus_state *s = &mbus_state;
 	int win;
diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index acf780a81589..ad1ac97f65c9 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -115,7 +115,7 @@ struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
 /* Address in SECURAM that say if we suspend to backup mode. */
 static void __iomem *at91_pmc_backup_suspend;
 
-static int at91_pmc_suspend(void)
+static int at91_pmc_suspend(struct syscore_ops *ops)
 {
 	unsigned int backup;
 
@@ -129,7 +129,7 @@ static int at91_pmc_suspend(void)
 	return clk_save_context();
 }
 
-static void at91_pmc_resume(void)
+static void at91_pmc_resume(struct syscore_ops *ops)
 {
 	unsigned int backup;
 
diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..94aee6c5f9f4 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -139,7 +139,7 @@ static struct clk * __init vf610_get_fixed_clock(
 	return clk;
 };
 
-static int vf610_clk_suspend(void)
+static int vf610_clk_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -156,7 +156,7 @@ static int vf610_clk_suspend(void)
 	return 0;
 }
 
-static void vf610_clk_resume(void)
+static void vf610_clk_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/drivers/clk/ingenic/pm.c b/drivers/clk/ingenic/pm.c
index 341752b640d2..b13f7f56b816 100644
--- a/drivers/clk/ingenic/pm.c
+++ b/drivers/clk/ingenic/pm.c
@@ -15,7 +15,7 @@
 
 static void __iomem * __maybe_unused ingenic_cgu_base;
 
-static int __maybe_unused ingenic_cgu_pm_suspend(void)
+static int __maybe_unused ingenic_cgu_pm_suspend(struct syscore_ops *ops)
 {
 	u32 val = readl(ingenic_cgu_base + CGU_REG_LCR);
 
@@ -24,7 +24,7 @@ static int __maybe_unused ingenic_cgu_pm_suspend(void)
 	return 0;
 }
 
-static void __maybe_unused ingenic_cgu_pm_resume(void)
+static void __maybe_unused ingenic_cgu_pm_resume(struct syscore_ops *ops)
 {
 	u32 val = readl(ingenic_cgu_base + CGU_REG_LCR);
 
diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 7d04ef40b7cf..85bd4bc73c1b 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -455,7 +455,7 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void)
+static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
 {
 	struct ingenic_tcu *tcu = ingenic_tcu;
 
@@ -465,7 +465,7 @@ static int __maybe_unused tcu_pm_suspend(void)
 	return 0;
 }
 
-static void __maybe_unused tcu_pm_resume(void)
+static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
 {
 	struct ingenic_tcu *tcu = ingenic_tcu;
 
diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 785dbede4835..ee77d307efe0 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -215,13 +215,13 @@ static struct clk *clk_gating_get_src(
 	return ERR_PTR(-ENODEV);
 }
 
-static int mvebu_clk_gating_suspend(void)
+static int mvebu_clk_gating_suspend(struct syscore_ops *ops)
 {
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
-static void mvebu_clk_gating_resume(void)
+static void mvebu_clk_gating_resume(struct syscore_ops *ops)
 {
 	writel(ctrl->saved_reg, ctrl->base);
 }
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 90d329216064..357471d85799 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -871,7 +871,7 @@ static const int rk3288_saved_cru_reg_ids[] = {
 
 static u32 rk3288_saved_cru_regs[ARRAY_SIZE(rk3288_saved_cru_reg_ids)];
 
-static int rk3288_clk_suspend(void)
+static int rk3288_clk_suspend(struct syscore_ops *ops)
 {
 	int i, reg_id;
 
@@ -906,7 +906,7 @@ static int rk3288_clk_suspend(void)
 	return 0;
 }
 
-static void rk3288_clk_resume(void)
+static void rk3288_clk_resume(struct syscore_ops *ops)
 {
 	int i, reg_id;
 
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index d19a3d9fd452..0059abeb6362 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -35,7 +35,7 @@ static unsigned long reg_save[][2] = {
 	{ASS_CLK_GATE, 0},
 };
 
-static int s5pv210_audss_clk_suspend(void)
+static int s5pv210_audss_clk_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -45,7 +45,7 @@ static int s5pv210_audss_clk_suspend(void)
 	return 0;
 }
 
-static void s5pv210_audss_clk_resume(void)
+static void s5pv210_audss_clk_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 8d440cf56bd4..93e395509d6f 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -271,7 +271,7 @@ void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int samsung_clk_suspend(void)
+static int samsung_clk_suspend(struct syscore_ops *ops)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
@@ -284,7 +284,7 @@ static int samsung_clk_suspend(void)
 	return 0;
 }
 
-static void samsung_clk_resume(void)
+static void samsung_clk_resume(struct syscore_ops *ops)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index a3488aaac3f7..6f8c2d7be0b1 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3444,7 +3444,7 @@ static void tegra210_disable_cpu_clock(u32 cpu)
 static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
 static u32 cpu_softrst_ctx[3];
 
-static int tegra210_clk_suspend(void)
+static int tegra210_clk_suspend(struct syscore_ops *ops)
 {
 	unsigned int i;
 
@@ -3465,7 +3465,7 @@ static int tegra210_clk_suspend(void)
 	return 0;
 }
 
-static void tegra210_clk_resume(void)
+static void tegra210_clk_resume(struct syscore_ops *ops)
 {
 	unsigned int i;
 
diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
index 54284c1c0651..5f6225842018 100644
--- a/drivers/clocksource/timer-armada-370-xp.c
+++ b/drivers/clocksource/timer-armada-370-xp.c
@@ -207,14 +207,14 @@ static int armada_370_xp_timer_dying_cpu(unsigned int cpu)
 
 static u32 timer0_ctrl_reg, timer0_local_ctrl_reg;
 
-static int armada_370_xp_timer_suspend(void)
+static int armada_370_xp_timer_suspend(struct syscore_ops *ops)
 {
 	timer0_ctrl_reg = readl(timer_base + TIMER_CTRL_OFF);
 	timer0_local_ctrl_reg = readl(local_base + TIMER_CTRL_OFF);
 	return 0;
 }
 
-static void armada_370_xp_timer_resume(void)
+static void armada_370_xp_timer_resume(struct syscore_ops *ops)
 {
 	writel(0xffffffff, timer_base + TIMER0_VAL_OFF);
 	writel(0xffffffff, timer_base + TIMER0_RELOAD_OFF);
diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 2562dc001fc1..03408ebb18bd 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -151,13 +151,13 @@ static void psci_idle_syscore_switch(bool suspend)
 	}
 }
 
-static int psci_idle_syscore_suspend(void)
+static int psci_idle_syscore_suspend(struct syscore_ops *ops)
 {
 	psci_idle_syscore_switch(true);
 	return 0;
 }
 
-static void psci_idle_syscore_resume(void)
+static void psci_idle_syscore_resume(struct syscore_ops *ops)
 {
 	psci_idle_syscore_switch(false);
 }
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833..00c8aa7e8266 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -659,7 +659,7 @@ static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(mxc_gpio_runtime_suspend, mxc_gpio_runtime_resume, NULL)
 };
 
-static int mxc_gpio_syscore_suspend(void)
+static int mxc_gpio_syscore_suspend(struct syscore_ops *ops)
 {
 	struct mxc_gpio_port *port;
 	int ret;
@@ -676,7 +676,7 @@ static int mxc_gpio_syscore_suspend(void)
 	return 0;
 }
 
-static void mxc_gpio_syscore_resume(void)
+static void mxc_gpio_syscore_resume(struct syscore_ops *ops)
 {
 	struct mxc_gpio_port *port;
 	int ret;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 91cea97255fa..0394f0b1ca25 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -746,7 +746,7 @@ static int __init pxa_gpio_dt_init(void)
 device_initcall(pxa_gpio_dt_init);
 
 #ifdef CONFIG_PM
-static int pxa_gpio_suspend(void)
+static int pxa_gpio_suspend(struct syscore_ops *ops)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	struct pxa_gpio_bank *c;
@@ -767,7 +767,7 @@ static int pxa_gpio_suspend(void)
 	return 0;
 }
 
-static void pxa_gpio_resume(void)
+static void pxa_gpio_resume(struct syscore_ops *ops)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	struct pxa_gpio_bank *c;
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 75eb1390b45c..c816ee45d2fb 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2605,7 +2605,7 @@ static void hv_crash_handler(struct pt_regs *regs)
 	hv_synic_disable_regs(cpu);
 };
 
-static int hv_synic_suspend(void)
+static int hv_synic_suspend(struct syscore_ops *ops)
 {
 	/*
 	 * When we reach here, all the non-boot CPUs have been offlined.
@@ -2632,7 +2632,7 @@ static int hv_synic_suspend(void)
 	return 0;
 }
 
-static void hv_synic_resume(void)
+static void hv_synic_resume(struct syscore_ops *ops)
 {
 	hv_synic_enable_regs(0);
 
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index cb536d372b12..3ec029e57da3 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -2910,7 +2910,7 @@ static void disable_iommus(void)
  * disable suspend until real resume implemented
  */
 
-static void amd_iommu_resume(void)
+static void amd_iommu_resume(struct syscore_ops *ops)
 {
 	struct amd_iommu *iommu;
 
@@ -2924,7 +2924,7 @@ static void amd_iommu_resume(void)
 	amd_iommu_enable_interrupts();
 }
 
-static int amd_iommu_suspend(void)
+static int amd_iommu_suspend(struct syscore_ops *ops)
 {
 	/* disable IOMMUs to go out of the way for BIOS */
 	disable_iommus();
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index cc46098f875b..e17b92d50f29 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2330,7 +2330,7 @@ static void iommu_flush_all(void)
 	}
 }
 
-static int iommu_suspend(void)
+static int iommu_suspend(struct syscore_ops *ops)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu = NULL;
@@ -2357,7 +2357,7 @@ static int iommu_suspend(void)
 	return 0;
 }
 
-static void iommu_resume(void)
+static void iommu_resume(struct syscore_ops *ops)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu = NULL;
diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 552aa04ff063..f2783a0d520b 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -200,12 +200,13 @@ static void __init combiner_init(void __iomem *combiner_base,
 
 /**
  * combiner_suspend - save interrupt combiner state before suspend
+ * @ops: syscore context
  *
  * Save the interrupt enable set register for all combiner groups since
  * the state is lost when the system enters into a sleep state.
  *
  */
-static int combiner_suspend(void)
+static int combiner_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -218,12 +219,13 @@ static int combiner_suspend(void)
 
 /**
  * combiner_resume - restore interrupt combiner state after resume
+ * @ops: syscore context
  *
  * Restore the interrupt enable set register for all combiner groups since
  * the state is lost when the system enters into a sleep state on suspend.
  *
  */
-static void combiner_resume(void)
+static void combiner_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index d7c5ef248474..c643b438f35e 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -724,7 +724,7 @@ static void __exception_irq_entry mpic_handle_irq(struct pt_regs *regs)
 	} while (1);
 }
 
-static int mpic_suspend(void)
+static int mpic_suspend(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpic_data;
 
@@ -733,7 +733,7 @@ static int mpic_suspend(void)
 	return 0;
 }
 
-static void mpic_resume(void)
+static void mpic_resume(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpic_data;
 	bool src0, src1;
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 36e71af054e9..1e6576997bc2 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -292,7 +292,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
 static LIST_HEAD(bcm7038_l1_intcs_list);
 static DEFINE_RAW_SPINLOCK(bcm7038_l1_intcs_lock);
 
-static int bcm7038_l1_suspend(void)
+static int bcm7038_l1_suspend(struct syscore_ops *ops)
 {
 	struct bcm7038_l1_chip *intc;
 	int boot_cpu, word;
@@ -318,7 +318,7 @@ static int bcm7038_l1_suspend(void)
 	return 0;
 }
 
-static void bcm7038_l1_resume(void)
+static void bcm7038_l1_resume(struct syscore_ops *ops)
 {
 	struct bcm7038_l1_chip *intc;
 	int boot_cpu, word;
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 8c3ec5734f1e..7f069522d1d8 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4969,7 +4969,7 @@ static void its_enable_quirks(struct its_node *its)
 				     its_quirks, its);
 }
 
-static int its_save_disable(void)
+static int its_save_disable(struct syscore_ops *ops)
 {
 	struct its_node *its;
 	int err = 0;
@@ -5005,7 +5005,7 @@ static int its_save_disable(void)
 	return err;
 }
 
-static void its_restore_enable(void)
+static void its_restore_enable(struct syscore_ops *ops)
 {
 	struct its_node *its;
 	int ret;
diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index 115bdcffab24..5b25556569c0 100644
--- a/drivers/irqchip/irq-i8259.c
+++ b/drivers/irqchip/irq-i8259.c
@@ -202,13 +202,13 @@ static void mask_and_ack_8259A(struct irq_data *d)
 	}
 }
 
-static void i8259A_resume(void)
+static void i8259A_resume(struct syscore_ops *ops)
 {
 	if (i8259A_auto_eoi >= 0)
 		init_8259A(i8259A_auto_eoi);
 }
 
-static void i8259A_shutdown(void)
+static void i8259A_shutdown(struct syscore_ops *ops)
 {
 	/* Put the i8259A into a quiescent state that
 	 * the kernel initialization code can get it
diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 8a0e82067924..83b009881e2a 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -33,7 +33,7 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 	return cd->gpc_base + cd->cpu2wakeup + i * 4;
 }
 
-static int gpcv2_wakeup_source_save(void)
+static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 {
 	struct gpcv2_irqchip_data *cd;
 	void __iomem *reg;
@@ -52,7 +52,7 @@ static int gpcv2_wakeup_source_save(void)
 	return 0;
 }
 
-static void gpcv2_wakeup_source_restore(void)
+static void gpcv2_wakeup_source_restore(struct syscore_ops *ops)
 {
 	struct gpcv2_irqchip_data *cd;
 	int i;
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index bb79e19dfb59..1b47c5897eba 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -358,12 +358,12 @@ static struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group
 	return NULL;
 }
 
-static int eiointc_suspend(void)
+static int eiointc_suspend(struct syscore_ops *ops)
 {
 	return 0;
 }
 
-static void eiointc_resume(void)
+static void eiointc_resume(struct syscore_ops *ops)
 {
 	eiointc_router_init(0);
 }
diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
index f4abdf156de7..723a2a1169c2 100644
--- a/drivers/irqchip/irq-loongson-htpic.c
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -71,7 +71,7 @@ static void htpic_reg_init(void)
 	writel(0xffff, htpic->base + HTINT_EN_OFF);
 }
 
-static void htpic_resume(void)
+static void htpic_resume(struct syscore_ops *ops)
 {
 	htpic_reg_init();
 }
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 5da02c7ad0b3..7e91f114dd29 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -159,7 +159,7 @@ static void htvec_reset(struct htvec *priv)
 	}
 }
 
-static int htvec_suspend(void)
+static int htvec_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -169,7 +169,7 @@ static int htvec_suspend(void)
 	return 0;
 }
 
-static void htvec_resume(void)
+static void htvec_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 2d4c3ec128b8..ce86bd209a9b 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -151,7 +151,7 @@ static int pch_lpc_disabled(struct pch_lpc *priv)
 			(readl(priv->base + LPC_INT_STS) == 0xffffffff);
 }
 
-static int pch_lpc_suspend(void)
+static int pch_lpc_suspend(struct syscore_ops *ops)
 {
 	pch_lpc_priv->saved_reg_ctl = readl(pch_lpc_priv->base + LPC_INT_CTL);
 	pch_lpc_priv->saved_reg_ena = readl(pch_lpc_priv->base + LPC_INT_ENA);
@@ -159,7 +159,7 @@ static int pch_lpc_suspend(void)
 	return 0;
 }
 
-static void pch_lpc_resume(void)
+static void pch_lpc_resume(struct syscore_ops *ops)
 {
 	writel(pch_lpc_priv->saved_reg_ctl, pch_lpc_priv->base + LPC_INT_CTL);
 	writel(pch_lpc_priv->saved_reg_ena, pch_lpc_priv->base + LPC_INT_ENA);
diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 69efda35a8e7..769e355eb50c 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -278,7 +278,7 @@ static void pch_pic_reset(struct pch_pic *priv)
 	}
 }
 
-static int pch_pic_suspend(void)
+static int pch_pic_suspend(struct syscore_ops *ops)
 {
 	int i, j;
 
@@ -296,7 +296,7 @@ static int pch_pic_suspend(void)
 	return 0;
 }
 
-static void pch_pic_resume(void)
+static void pch_pic_resume(struct syscore_ops *ops)
 {
 	int i, j;
 
diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index 5dcd94c000a2..96d5234d3720 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -109,7 +109,7 @@ static int mchp_eic_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
-static int mchp_eic_irq_suspend(void)
+static int mchp_eic_irq_suspend(struct syscore_ops *ops)
 {
 	unsigned int hwirq;
 
@@ -123,7 +123,7 @@ static int mchp_eic_irq_suspend(void)
 	return 0;
 }
 
-static void mchp_eic_irq_resume(void)
+static void mchp_eic_irq_resume(struct syscore_ops *ops)
 {
 	unsigned int hwirq;
 
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index f6133ae28155..734450bca8d4 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -143,7 +143,7 @@ static void mst_intc_polarity_restore(struct mst_intc_chip_data *cd)
 		writew_relaxed(cd->saved_polarity_conf[i], addr + i * 4);
 }
 
-static void mst_irq_resume(void)
+static void mst_irq_resume(struct syscore_ops *ops)
 {
 	struct mst_intc_chip_data *cd;
 
@@ -151,7 +151,7 @@ static void mst_irq_resume(void)
 		mst_intc_polarity_restore(cd);
 }
 
-static int mst_irq_suspend(void)
+static int mst_irq_suspend(struct syscore_ops *ops)
 {
 	struct mst_intc_chip_data *cd;
 
diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 76bc0283e3b9..bf20052e7a85 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -199,7 +199,7 @@ static const struct irq_domain_ops cirq_domain_ops = {
 };
 
 #ifdef CONFIG_PM_SLEEP
-static int mtk_cirq_suspend(void)
+static int mtk_cirq_suspend(struct syscore_ops *ops)
 {
 	void __iomem *reg;
 	u32 value, mask;
@@ -257,7 +257,7 @@ static int mtk_cirq_suspend(void)
 	return 0;
 }
 
-static void mtk_cirq_resume(void)
+static void mtk_cirq_resume(struct syscore_ops *ops)
 {
 	void __iomem *reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	u32 value;
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 99e27e01b0b1..308aa2800c04 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -399,7 +399,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
-static int rzg2l_irqc_irq_suspend(void)
+static int rzg2l_irqc_irq_suspend(struct syscore_ops *ops)
 {
 	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data->cache;
 	void __iomem *base = rzg2l_irqc_data->base;
@@ -411,7 +411,7 @@ static int rzg2l_irqc_irq_suspend(void)
 	return 0;
 }
 
-static void rzg2l_irqc_irq_resume(void)
+static void rzg2l_irqc_irq_resume(struct syscore_ops *ops)
 {
 	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data->cache;
 	void __iomem *base = rzg2l_irqc_data->base;
diff --git a/drivers/irqchip/irq-sa11x0.c b/drivers/irqchip/irq-sa11x0.c
index 9d0b80271949..d13a1635723d 100644
--- a/drivers/irqchip/irq-sa11x0.c
+++ b/drivers/irqchip/irq-sa11x0.c
@@ -85,7 +85,7 @@ static struct sa1100irq_state {
 	unsigned int	iccr;
 } sa1100irq_state;
 
-static int sa1100irq_suspend(void)
+static int sa1100irq_suspend(struct syscore_ops *ops)
 {
 	struct sa1100irq_state *st = &sa1100irq_state;
 
@@ -102,7 +102,7 @@ static int sa1100irq_suspend(void)
 	return 0;
 }
 
-static void sa1100irq_resume(void)
+static void sa1100irq_resume(struct syscore_ops *ops)
 {
 	struct sa1100irq_state *st = &sa1100irq_state;
 
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71..7dedfcbe220b 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -243,7 +243,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 	return IRQ_SET_MASK_OK;
 }
 
-static int plic_irq_suspend(void)
+static int plic_irq_suspend(struct syscore_ops *ops)
 {
 	unsigned int i, cpu;
 	unsigned long flags;
@@ -274,7 +274,7 @@ static int plic_irq_suspend(void)
 	return 0;
 }
 
-static void plic_irq_resume(void)
+static void plic_irq_resume(struct syscore_ops *ops)
 {
 	unsigned int i, index, cpu;
 	unsigned long flags;
diff --git a/drivers/irqchip/irq-sun6i-r.c b/drivers/irqchip/irq-sun6i-r.c
index 99958d470d62..f9157cf02442 100644
--- a/drivers/irqchip/irq-sun6i-r.c
+++ b/drivers/irqchip/irq-sun6i-r.c
@@ -268,7 +268,7 @@ static const struct irq_domain_ops sun6i_r_intc_domain_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-static int sun6i_r_intc_suspend(void)
+static int sun6i_r_intc_suspend(struct syscore_ops *ops)
 {
 	u32 buf[BITS_TO_U32(MAX(SUN6I_NR_TOP_LEVEL_IRQS, SUN6I_NR_MUX_BITS))];
 	int i;
@@ -284,7 +284,7 @@ static int sun6i_r_intc_suspend(void)
 	return 0;
 }
 
-static void sun6i_r_intc_resume(void)
+static void sun6i_r_intc_resume(struct syscore_ops *ops)
 {
 	int i;
 
@@ -294,9 +294,9 @@ static void sun6i_r_intc_resume(void)
 		writel_relaxed(0, base + SUN6I_IRQ_ENABLE(i));
 }
 
-static void sun6i_r_intc_shutdown(void)
+static void sun6i_r_intc_shutdown(struct syscore_ops *ops)
 {
-	sun6i_r_intc_suspend();
+	sun6i_r_intc_suspend(ops);
 }
 
 static struct syscore_ops sun6i_r_intc_syscore_ops = {
@@ -349,7 +349,7 @@ static int __init sun6i_r_intc_init(struct device_node *node,
 	register_syscore_ops(&sun6i_r_intc_syscore_ops);
 
 	sun6i_r_intc_ack_nmi();
-	sun6i_r_intc_resume();
+	sun6i_r_intc_resume(NULL);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index ad3e2c1b3c87..24247e8418bb 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -132,7 +132,7 @@ static int tegra_set_wake(struct irq_data *d, unsigned int enable)
 	return 0;
 }
 
-static int tegra_ictlr_suspend(void)
+static int tegra_ictlr_suspend(struct syscore_ops *ops)
 {
 	unsigned long flags;
 	unsigned int i;
@@ -161,7 +161,7 @@ static int tegra_ictlr_suspend(void)
 	return 0;
 }
 
-static void tegra_ictlr_resume(void)
+static void tegra_ictlr_resume(struct syscore_ops *ops)
 {
 	unsigned long flags;
 	unsigned int i;
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index ea93e7236c4a..5f85a9c5a686 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -120,7 +120,7 @@ static void resume_one_vic(struct vic_device *vic)
 	writel(~vic->soft_int, base + VIC_INT_SOFT_CLEAR);
 }
 
-static void vic_resume(void)
+static void vic_resume(struct syscore_ops *ops)
 {
 	int id;
 
@@ -146,7 +146,7 @@ static void suspend_one_vic(struct vic_device *vic)
 	writel(~vic->resume_irqs, base + VIC_INT_ENABLE_CLEAR);
 }
 
-static int vic_suspend(void)
+static int vic_suspend(struct syscore_ops *ops)
 {
 	int id;
 
diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 05848a2fecff..48a99dfa28d8 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -94,18 +94,18 @@ void ledtrig_cpu(enum cpu_led_event ledevt)
 }
 EXPORT_SYMBOL(ledtrig_cpu);
 
-static int ledtrig_cpu_syscore_suspend(void)
+static int ledtrig_cpu_syscore_suspend(struct syscore_ops *ops)
 {
 	ledtrig_cpu(CPU_LED_STOP);
 	return 0;
 }
 
-static void ledtrig_cpu_syscore_resume(void)
+static void ledtrig_cpu_syscore_resume(struct syscore_ops *ops)
 {
 	ledtrig_cpu(CPU_LED_START);
 }
 
-static void ledtrig_cpu_syscore_shutdown(void)
+static void ledtrig_cpu_syscore_shutdown(struct syscore_ops *ops)
 {
 	ledtrig_cpu(CPU_LED_HALTED);
 }
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index b0f09c70f1ff..36919fae06b8 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -2600,7 +2600,7 @@ void pmu_blink(int n)
 #if defined(CONFIG_SUSPEND) && defined(CONFIG_PPC32)
 int pmu_sys_suspended;
 
-static int pmu_syscore_suspend(void)
+static int pmu_syscore_suspend(struct syscore_ops *ops)
 {
 	/* Suspend PMU event interrupts */
 	pmu_suspend();
@@ -2614,7 +2614,7 @@ static int pmu_syscore_suspend(void)
 	return 0;
 }
 
-static void pmu_syscore_resume(void)
+static void pmu_syscore_resume(struct syscore_ops *ops)
 {
 	struct adb_request req;
 
diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc27xx-poweroff.c
index 90287c31992c..b1c2d1038a8e 100644
--- a/drivers/power/reset/sc27xx-poweroff.c
+++ b/drivers/power/reset/sc27xx-poweroff.c
@@ -28,7 +28,7 @@ static struct regmap *regmap;
  * taking cpus down to avoid racing regmap or spi mutex lock when poweroff
  * system through PMIC.
  */
-static void sc27xx_poweroff_shutdown(void)
+static void sc27xx_poweroff_shutdown(struct syscore_ops *ops)
 {
 #ifdef CONFIG_HOTPLUG_CPU
 	int cpu;
diff --git a/drivers/sh/clk/core.c b/drivers/sh/clk/core.c
index 7a73f5e4a1fc..b8e2b391acd1 100644
--- a/drivers/sh/clk/core.c
+++ b/drivers/sh/clk/core.c
@@ -569,7 +569,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
 #ifdef CONFIG_PM
-static void clks_core_resume(void)
+static void clks_core_resume(struct syscore_ops *ops)
 {
 	struct clk *clkp;
 
diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index ea571eeb3078..53e468644883 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -394,7 +394,7 @@ int __init register_intc_controller(struct intc_desc *desc)
 	return -ENOMEM;
 }
 
-static int intc_suspend(void)
+static int intc_suspend(struct syscore_ops *ops)
 {
 	struct intc_desc_int *d;
 
@@ -420,7 +420,7 @@ static int intc_suspend(void)
 	return 0;
 }
 
-static void intc_resume(void)
+static void intc_resume(struct syscore_ops *ops)
 {
 	struct intc_desc_int *d;
 
diff --git a/drivers/soc/bcm/brcmstb/biuctrl.c b/drivers/soc/bcm/brcmstb/biuctrl.c
index 364ddbe365c2..d8c3aac61886 100644
--- a/drivers/soc/bcm/brcmstb/biuctrl.c
+++ b/drivers/soc/bcm/brcmstb/biuctrl.c
@@ -298,7 +298,7 @@ static int __init setup_hifcpubiuctrl_regs(struct device_node *np)
 #ifdef CONFIG_PM_SLEEP
 static u32 cpubiuctrl_reg_save[NUM_CPU_BIUCTRL_REGS];
 
-static int brcmstb_cpu_credit_reg_suspend(void)
+static int brcmstb_cpu_credit_reg_suspend(struct syscore_ops *ops)
 {
 	unsigned int i;
 
@@ -311,7 +311,7 @@ static int brcmstb_cpu_credit_reg_suspend(void)
 	return 0;
 }
 
-static void brcmstb_cpu_credit_reg_resume(void)
+static void brcmstb_cpu_credit_reg_resume(struct syscore_ops *ops)
 {
 	unsigned int i;
 
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a08c377933c5..6a3923e1c792 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3141,7 +3141,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 	}
 }
 
-static void tegra186_pmc_wake_syscore_resume(void)
+static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 {
 	u32 status, mask;
 	unsigned int i;
@@ -3154,7 +3154,7 @@ static void tegra186_pmc_wake_syscore_resume(void)
 	}
 }
 
-static int tegra186_pmc_wake_syscore_suspend(void)
+static int tegra186_pmc_wake_syscore_suspend(struct syscore_ops *ops)
 {
 	wke_read_sw_wake_status(pmc);
 
diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
index 5b18a46a10b0..cfca65de8cba 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -592,7 +592,7 @@ static void hfi_disable_instance(void *ptr)
 	hfi_disable();
 }
 
-static void hfi_syscore_resume(void)
+static void hfi_syscore_resume(struct syscore_ops *ops)
 {
 	/* This code runs only on the boot CPU. */
 	struct hfi_cpu_info *info = &per_cpu(hfi_cpu_info, 0);
@@ -603,7 +603,7 @@ static void hfi_syscore_resume(void)
 		hfi_enable_instance(hfi_instance);
 }
 
-static int hfi_syscore_suspend(void)
+static int hfi_syscore_suspend(struct syscore_ops *ops)
 {
 	/* No locking needed. There is no concurrency with CPU offline. */
 	hfi_disable();
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 296703939846..3d7ae6296367 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -495,7 +495,7 @@ static void xen_acpi_processor_resume_worker(struct work_struct *dummy)
 		pr_info("ACPI data upload failed, error = %d\n", rc);
 }
 
-static void xen_acpi_processor_resume(void)
+static void xen_acpi_processor_resume(struct syscore_ops *ops)
 {
 	static DECLARE_WORK(wq, xen_acpi_processor_resume_worker);
 
diff --git a/include/linux/syscore_ops.h b/include/linux/syscore_ops.h
index ae4d48e4c970..2bec5eb6f4b4 100644
--- a/include/linux/syscore_ops.h
+++ b/include/linux/syscore_ops.h
@@ -12,9 +12,9 @@
 
 struct syscore_ops {
 	struct list_head node;
-	int (*suspend)(void);
-	void (*resume)(void);
-	void (*shutdown)(void);
+	int (*suspend)(struct syscore_ops *ops);
+	void (*resume)(struct syscore_ops *ops);
+	void (*shutdown)(struct syscore_ops *ops);
 };
 
 extern void register_syscore_ops(struct syscore_ops *ops);
diff --git a/kernel/cpu_pm.c b/kernel/cpu_pm.c
index b0f0d15085db..512efe0f209d 100644
--- a/kernel/cpu_pm.c
+++ b/kernel/cpu_pm.c
@@ -173,7 +173,7 @@ int cpu_cluster_pm_exit(void)
 EXPORT_SYMBOL_GPL(cpu_cluster_pm_exit);
 
 #ifdef CONFIG_PM
-static int cpu_pm_suspend(void)
+static int cpu_pm_suspend(struct syscore_ops *ops)
 {
 	int ret;
 
@@ -185,7 +185,7 @@ static int cpu_pm_suspend(void)
 	return ret;
 }
 
-static void cpu_pm_resume(void)
+static void cpu_pm_resume(struct syscore_ops *ops)
 {
 	cpu_cluster_pm_exit();
 	cpu_pm_exit();
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index c4a8bca5f2b0..dabf9df9a2cf 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -665,7 +665,7 @@ static struct irq_data *irq_gc_get_irq_data(struct irq_chip_generic *gc)
 }
 
 #ifdef CONFIG_PM
-static int irq_gc_suspend(void)
+static int irq_gc_suspend(struct syscore_ops *ops)
 {
 	struct irq_chip_generic *gc;
 
@@ -685,7 +685,7 @@ static int irq_gc_suspend(void)
 	return 0;
 }
 
-static void irq_gc_resume(void)
+static void irq_gc_resume(struct syscore_ops *ops)
 {
 	struct irq_chip_generic *gc;
 
@@ -708,7 +708,7 @@ static void irq_gc_resume(void)
 #define irq_gc_resume NULL
 #endif
 
-static void irq_gc_shutdown(void)
+static void irq_gc_shutdown(struct syscore_ops *ops)
 {
 	struct irq_chip_generic *gc;
 
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index c556bc49d213..a3936238f972 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -230,7 +230,7 @@ void rearm_wake_irq(unsigned int irq)
  *
  * Enable all interrupt lines with %IRQF_EARLY_RESUME set.
  */
-static void irq_pm_syscore_resume(void)
+static void irq_pm_syscore_resume(struct syscore_ops *ops)
 {
 	resume_irqs(true);
 }
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 07668433644b..b32e9a4ea2bc 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3645,7 +3645,7 @@ static bool legacy_kthread_create(void)
  * to transition back to atomic printing, thus providing a robust mechanism
  * for the final shutdown/reboot messages to be output.
  */
-static void printk_kthreads_shutdown(void)
+static void printk_kthreads_shutdown(struct syscore_ops *ops)
 {
 	struct console *con;
 
diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index fcca4e72f1ef..297cd948e50f 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -297,6 +297,11 @@ int sched_clock_suspend(void)
 	return 0;
 }
 
+static int sched_clock_syscore_suspend(struct syscore_ops *ops)
+{
+	return sched_clock_suspend();
+}
+
 void sched_clock_resume(void)
 {
 	struct clock_read_data *rd = &cd.read_data[0];
@@ -306,9 +311,14 @@ void sched_clock_resume(void)
 	rd->read_sched_clock = cd.actual_read_sched_clock;
 }
 
+static void sched_clock_syscore_resume(struct syscore_ops *ops)
+{
+	sched_clock_resume();
+}
+
 static struct syscore_ops sched_clock_ops = {
-	.suspend	= sched_clock_suspend,
-	.resume		= sched_clock_resume,
+	.suspend	= sched_clock_syscore_suspend,
+	.resume		= sched_clock_syscore_resume,
 };
 
 static int __init sched_clock_syscore_init(void)
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 1e67d076f195..2d611c15d05d 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1845,6 +1845,11 @@ void timekeeping_resume(void)
 	timerfd_resume();
 }
 
+static void timekeeping_syscore_resume(struct syscore_ops *ops)
+{
+	timekeeping_resume();
+}
+
 int timekeeping_suspend(void)
 {
 	struct timekeeper *tks = &tk_core.shadow_timekeeper;
@@ -1912,10 +1917,15 @@ int timekeeping_suspend(void)
 	return 0;
 }
 
+static int timekeeping_syscore_suspend(struct syscore_ops *ops)
+{
+	return timekeeping_suspend();
+}
+
 /* sysfs resume/suspend bits for timekeeping */
 static struct syscore_ops timekeeping_syscore_ops = {
-	.resume		= timekeeping_resume,
-	.suspend	= timekeeping_suspend,
+	.resume		= timekeeping_syscore_resume,
+	.suspend	= timekeeping_syscore_suspend,
 };
 
 static int __init timekeeping_init_ops(void)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 08b34841b834..6f4cef82ed50 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5533,7 +5533,7 @@ static int kvm_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void kvm_shutdown(void)
+static void kvm_shutdown(struct syscore_ops *ops)
 {
 	/*
 	 * Disable hardware virtualization and set kvm_rebooting to indicate
@@ -5551,7 +5551,7 @@ static void kvm_shutdown(void)
 	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
-static int kvm_suspend(void)
+static int kvm_suspend(struct syscore_ops *ops)
 {
 	/*
 	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
@@ -5568,7 +5568,7 @@ static int kvm_suspend(void)
 	return 0;
 }
 
-static void kvm_resume(void)
+static void kvm_resume(struct syscore_ops *ops)
 {
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
-- 
2.48.1


