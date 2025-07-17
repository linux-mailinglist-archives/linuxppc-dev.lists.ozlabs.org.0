Return-Path: <linuxppc-dev+bounces-10282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE55B08A9F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlY1215z3bmJ;
	Thu, 17 Jul 2025 20:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748377;
	cv=none; b=BOnktd/g/V6D4bii5GuuCaTyfWOVaJuTM3n/h+CEUdRiJFxpMYp68C5OgX3awDWpqR1IGukxfCI778JiHzk/ob3KvVL3M7lhKEUp7Xb6XYMG1di69ZeYEe/KKFF9DdxepUhQwm9l8VHbszcMwP4T7nW//DU5RC/t9EtXe6LPS8/Wq/Op4ieElv/dS1yZrLknwTtk5u7I8z9lH2INbYUBcSC6dfjnAXBO+1znJBzV/e28Hpa+Csd5lLTcLmFjKzjbz/lohramk9mrvKh64CrV291JETVjeimmf+sr8KGdMLyba/OTfwH35oCcwZT8/f/cg355Vsdbr1KW/iy4oYoNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748377; c=relaxed/relaxed;
	bh=fmiAxeXJl7NfWYj2quZOlWIoxDl5YAGHUrINbxFGpug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqG1Uq2cyxmHSOBcXPKD/IAI95kNKum0H2RDhMnHGarUDc1dvWhYFgDqDkKgEnpp5Go2oLYowE3X+PRr+2LkXlK9asy15yHG8CemUC7vux3zgYF8A9obol1zGPwr81DowH8qHc3oX6ST9xlgThxEYzJda4rqaFZaxO9PmIlpRjt2h2fCYRxgk/H1y4soeVnEKljAZay49EMI+RouDguwMT3Qe3LkK4YkriWzjIFiqgZmfEFt+1+pfhxnXs2JM0DgytHSVuLcnNXNDHteqPjva7W445xsn/70zhYAEHXCgJHkBk05TMHV+/dt71Kug1UDFKLHJgjkPem9wrRYzft0OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iScyijWr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iScyijWr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlT3pZlz3064
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:32:53 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so335799f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748371; x=1753353171; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmiAxeXJl7NfWYj2quZOlWIoxDl5YAGHUrINbxFGpug=;
        b=iScyijWrwBwY5rPqdT6I2fKpDT1fHiuzytOjVDlYGDzCMNu46MXMUkL5Z12v4Tb+a0
         SRRtZBKTKO/Jn3IOAaxxrRwpuqvVQ5u64FsWg9Ipxz5ZlFPeQE/jVhkr/w2vy0Ppg66e
         J2BqTekrnlG6LFkpxxz7rQc3HWqPnNGXeTMC9fOlvx17Q+bY5EGKyEc0eiWI4Mqq0YB3
         +crEmQfbLnl5l817najDRk1KZxCnJfuiIiaSIQtTn8/m31ogUW6upgO4wd50DqT8P99K
         sVnJGv0ktJ36qqawR9qmO93ccpk9L++VHir9xpTwLbfJyhfGd2duYW8qWC3X9hIDTRV9
         a22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748371; x=1753353171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmiAxeXJl7NfWYj2quZOlWIoxDl5YAGHUrINbxFGpug=;
        b=gIxTkoDrr+ynK/1gf6lB6SWz+/jdYd4tgrTCPsI9DTw3pRC0Gi4yxoB3HtlUbIOm1h
         I/Nd8qB4oyQCC6vk1Wh0cJHVFJJ0Xq3vgrCXWGSQN8xCPg1CfAybuFxI/kLJ8x78xj+8
         /eOfCcac7WZO5dnYtK2XQ52/WmfItoUmzj0F/7g2KnfjB60Uo+oRpwdZHs7t//BWzuAD
         cxJ8I9qNKCIOe6BRcgnTcA1oepqX4R+UKW/vj2/ZxWta4914IL8uMebv+4N1Ka7dRxYU
         E3EcnfQ2YAhq6sBrs7hL2620Gtn9U2zHhJMeusP7vo9RcPhBOEssx+XtdPCoUURXOgEn
         N5eg==
X-Forwarded-Encrypted: i=1; AJvYcCVJrUWsNaxogOcXolnGcEQc6PjGx50YO6Dv9WIeLjF4zxwAsi6yFGTQkEzD8RKtNaL+UFnTKhUj9J8W6c4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLw2b5zg73uv9FZtiRaeb7yR9QGFDhaAPIDiZZHA4Lt1LR75Cz
	tGyloXf73b8kgRJylS8xoA4uPzqoG0Dd5YZCiIjMSJ97+ksS1qurykM1
X-Gm-Gg: ASbGncshMIBKvzBFfb0pgY/YcinSIalJZH3+U3ZjKFN1GJXAoIJP8ilcVwHIqfluZmL
	7nKFZRSnL+AtI/xPtWQIi0abvOHHESo6UhZynexlliq9nPq/Fmj/Rh4iX8mKFuBOhj5RtcQ5xda
	yAs9eqEO8u2X1Jr5Sf+MEQg0n2/EOdvTFdInbC3yzOJQk7G45JIby4slp2oqZ8W4buUeCmEK0VX
	MXO2T9DS8OlkEh3FABlUU7oSngX1EN925uvqyEYuffJcRB25Wzv0/KIgP391zRaYn3bnmh7HXE/
	stPef030LLuJ+aYcgNP+mkub72RYg3cZTcCzPoO92dDVy8Nvh6ExNZ7+YT1Y4wLIAf38yCit3Sa
	x20dJ3SqfRaExTXCdfTUWoiPiX14CYabanAqQy9E3sV+MyR4C9Msg7EYjeLX/MopDPU7Zv81rs5
	//QXqnVNXC/TXmLg==
X-Google-Smtp-Source: AGHT+IEKMrV8c/Mr3JU9gEtVP9yynTvipBxlgXW5f1nKxOGLuC6ebyFVEoN2I1Ei9WvFgRTQy4DTCQ==
X-Received: by 2002:adf:9dc3:0:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3b60e5127e4mr4145956f8f.32.1752748369847;
        Thu, 17 Jul 2025 03:32:49 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1647sm20270513f8f.1.2025.07.17.03.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:48 -0700 (PDT)
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
Subject: [PATCH v2 1/7] syscore: Pass context data to callbacks
Date: Thu, 17 Jul 2025 12:32:35 +0200
Message-ID: <20250717103241.2806798-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Pass a pointer to the syscore_ops structure that was registered to the
callbacks. This enables callbacks to act on instance data (syscore_ops
can be embedded into other structures, and driver-specific data can be
obtained using container_of()) rather than the current practice of
relying on global variables.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add missing kerneldoc for added ops parameter

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
 drivers/gpio/gpio-sa1100.c                |  4 ++--
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
 kernel/irq/pm.c                           |  3 ++-
 kernel/printk/printk.c                    |  3 ++-
 kernel/time/sched_clock.c                 | 14 ++++++++++++--
 kernel/time/timekeeping.c                 | 14 ++++++++++++--
 virt/kvm/kvm_main.c                       |  6 +++---
 96 files changed, 231 insertions(+), 197 deletions(-)

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
index 150a1e56dcae..a147783ac7e0 100644
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
 
@@ -376,7 +376,7 @@ static void exynos5420_pm_prepare(void)
 }
 
 
-static int exynos_pm_suspend(void)
+static int exynos_pm_suspend(struct syscore_ops *ops)
 {
 	exynos_pm_central_suspend();
 
@@ -390,7 +390,7 @@ static int exynos_pm_suspend(void)
 	return 0;
 }
 
-static int exynos5420_pm_suspend(void)
+static int exynos5420_pm_suspend(struct syscore_ops *ops)
 {
 	u32 this_cluster;
 
@@ -408,7 +408,7 @@ static int exynos5420_pm_suspend(void)
 	return 0;
 }
 
-static void exynos_pm_resume(void)
+static void exynos_pm_resume(struct syscore_ops *ops)
 {
 	u32 cpuid = read_cpuid_part();
 
@@ -429,7 +429,7 @@ static void exynos_pm_resume(void)
 	exynos_set_delayed_reset_assertion(true);
 }
 
-static void exynos3250_pm_resume(void)
+static void exynos3250_pm_resume(struct syscore_ops *ops)
 {
 	u32 cpuid = read_cpuid_part();
 
@@ -473,7 +473,7 @@ static void exynos5420_prepare_pm_resume(void)
 	}
 }
 
-static void exynos5420_pm_resume(void)
+static void exynos5420_pm_resume(struct syscore_ops *ops)
 {
 	unsigned long tmp;
 
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index 5bfce8aa4102..b4f676d27169 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -178,7 +178,7 @@ void __init pxa_init_irq(int irq_nr, int (*fn)(struct irq_data *, unsigned int))
 static unsigned long saved_icmr[MAX_INTERNAL_IRQS/32];
 static unsigned long saved_ipr[MAX_INTERNAL_IRQS];
 
-static int pxa_irq_suspend(void)
+static int pxa_irq_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -197,7 +197,7 @@ static int pxa_irq_suspend(void)
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
index 46036d98da75..6888747beed3 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -535,12 +535,12 @@ int hibernate_resume_nonboot_cpu_disable(void)
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
index 2c07387201d0..354770a3ebea 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -726,7 +726,7 @@ static inline void crash_register_spus(struct list_head *list)
 }
 #endif
 
-static void spu_shutdown(void)
+static void spu_shutdown(struct syscore_ops *ops)
 {
 	struct spu *spu;
 
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index c37783a03d25..f3bd86befa2a 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -600,7 +600,7 @@ static int pmacpic_find_viaint(void)
 	return viaint;
 }
 
-static int pmacpic_suspend(void)
+static int pmacpic_suspend(struct syscore_ops *ops)
 {
 	int viaint = pmacpic_find_viaint();
 
@@ -621,7 +621,7 @@ static int pmacpic_suspend(void)
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
index 70be2105865d..7aa9ab99ebcf 100644
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
index ad7310bba00b..a7b75a9d2907 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1944,7 +1944,7 @@ static void mpic_suspend_one(struct mpic *mpic)
 	}
 }
 
-static int mpic_suspend(void)
+static int mpic_suspend(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpics;
 
@@ -1986,7 +1986,7 @@ static void mpic_resume_one(struct mpic *mpic)
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
index 112f43b23ebf..6671f548a646 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1718,13 +1718,13 @@ static int x86_pmu_amd_ibs_starting_cpu(unsigned int cpu)
 
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
index afdbda2dd7b7..f8efb8972084 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -314,7 +314,7 @@ static int __init hv_pci_init(void)
 	return 1;
 }
 
-static int hv_suspend(void)
+static int hv_suspend(struct syscore_ops *ops)
 {
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
@@ -341,7 +341,7 @@ static int hv_suspend(void)
 	return ret;
 }
 
-static void hv_resume(void)
+static void hv_resume(struct syscore_ops *ops)
 {
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5..8f19b48e0b16 100644
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
index d73ba5a7b623..e1fec51e0e67 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2376,7 +2376,7 @@ static struct {
 	unsigned int apic_cmci;
 } apic_pm_state;
 
-static int lapic_suspend(void)
+static int lapic_suspend(struct syscore_ops *ops)
 {
 	unsigned long flags;
 	int maxlvt;
@@ -2424,7 +2424,7 @@ static int lapic_suspend(void)
 	return 0;
 }
 
-static void lapic_resume(void)
+static void lapic_resume(struct syscore_ops *ops)
 {
 	unsigned int l, h;
 	unsigned long flags;
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 5ba2feb2c04c..967c4a47af5a 100644
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
index a315b0627dfb..e971e0cfd7c6 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -37,7 +37,7 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct aperfmperf, cpu_samples) = {
 	.seq = SEQCNT_ZERO(cpu_samples.seq)
 };
 
-static void init_counter_refs(void)
+static void init_counter_refs(struct syscore_ops *ops)
 {
 	u64 aperf, mperf;
 
@@ -535,7 +535,7 @@ static int __init bp_init_aperfmperf(void)
 	if (!cpu_feature_enabled(X86_FEATURE_APERFMPERF))
 		return 0;
 
-	init_counter_refs();
+	init_counter_refs(NULL);
 	bp_init_freq_invariance();
 	return 0;
 }
@@ -544,5 +544,5 @@ early_initcall(bp_init_aperfmperf);
 void ap_init_aperfmperf(void)
 {
 	if (cpu_feature_enabled(X86_FEATURE_APERFMPERF))
-		init_counter_refs();
+		init_counter_refs(NULL);
 }
diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
index bc7671f920a7..1c55c601d3f6 100644
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
index 4da4eab56c81..ce9112ce566b 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2463,13 +2463,13 @@ static void vendor_disable_error_reporting(void)
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
@@ -2479,7 +2479,7 @@ static void mce_syscore_shutdown(void)
  * Only one CPU is active at this time, the others get re-added later using
  * CPU hotplug:
  */
-static void mce_syscore_resume(void)
+static void mce_syscore_resume(struct syscore_ops *ops)
 {
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_vendor(raw_cpu_ptr(&cpu_info));
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b92e09a87c69..259bb5f6662f 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -775,8 +775,13 @@ void microcode_bsp_resume(void)
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
index 933fcd7ff250..e7bb00a3fe13 100644
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
index 2bade73f49e3..0c2a8b4f4a83 100644
--- a/arch/x86/kernel/i8259.c
+++ b/arch/x86/kernel/i8259.c
@@ -247,19 +247,19 @@ static void save_ELCR(char *trigger)
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
index 921c1c783bc1..607d23d47a2b 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -721,7 +721,7 @@ static int kvm_cpu_down_prepare(unsigned int cpu)
 
 #endif
 
-static int kvm_suspend(void)
+static int kvm_suspend(struct syscore_ops *ops)
 {
 	u64 val = 0;
 
@@ -735,7 +735,7 @@ static int kvm_suspend(void)
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
index 6942c62fa59d..171f1541b9bb 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1585,7 +1585,7 @@ static int fw_pm_notify(struct notifier_block *notify_block,
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
index 0a1e017df7c6..f474ba266837 100644
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
index b1fd8fac3a4c..9bc5ed4b128e 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -36,7 +36,7 @@ static unsigned long reg_save[][2] = {
 	{ASS_CLK_GATE, 0},
 };
 
-static int s5pv210_audss_clk_suspend(void)
+static int s5pv210_audss_clk_suspend(struct syscore_ops *ops)
 {
 	int i;
 
@@ -46,7 +46,7 @@ static int s5pv210_audss_clk_suspend(void)
 	return 0;
 }
 
-static void s5pv210_audss_clk_resume(void)
+static void s5pv210_audss_clk_resume(struct syscore_ops *ops)
 {
 	int i;
 
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index dbc9925ca8f4..a08fb9e99604 100644
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
index b19bc60cc627..8c6dd709b443 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -177,13 +177,13 @@ static void psci_idle_syscore_switch(bool suspend)
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
index 433cbadc3a4c..307a1f999500 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -667,7 +667,7 @@ static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(mxc_gpio_runtime_suspend, mxc_gpio_runtime_resume, NULL)
 };
 
-static int mxc_gpio_syscore_suspend(void)
+static int mxc_gpio_syscore_suspend(struct syscore_ops *ops)
 {
 	struct mxc_gpio_port *port;
 	int ret;
@@ -684,7 +684,7 @@ static int mxc_gpio_syscore_suspend(void)
 	return 0;
 }
 
-static void mxc_gpio_syscore_resume(void)
+static void mxc_gpio_syscore_resume(struct syscore_ops *ops)
 {
 	struct mxc_gpio_port *port;
 	int ret;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 13f7da2a9486..0fc8d4d0c885 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -753,7 +753,7 @@ static int __init pxa_gpio_dt_init(void)
 device_initcall(pxa_gpio_dt_init);
 
 #ifdef CONFIG_PM
-static int pxa_gpio_suspend(void)
+static int pxa_gpio_suspend(struct syscore_ops *ops)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	struct pxa_gpio_bank *c;
@@ -774,7 +774,7 @@ static int pxa_gpio_suspend(void)
 	return 0;
 }
 
-static void pxa_gpio_resume(void)
+static void pxa_gpio_resume(struct syscore_ops *ops)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	struct pxa_gpio_bank *c;
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index e9d054d78ccb..dd3250067646 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -256,7 +256,7 @@ static void sa1100_gpio_handler(struct irq_desc *desc)
 	} while (mask);
 }
 
-static int sa1100_gpio_suspend(void)
+static int sa1100_gpio_suspend(struct syscore_ops *ops)
 {
 	struct sa1100_gpio_chip *sgc = &sa1100_gpio_chip;
 
@@ -275,7 +275,7 @@ static int sa1100_gpio_suspend(void)
 	return 0;
 }
 
-static void sa1100_gpio_resume(void)
+static void sa1100_gpio_resume(struct syscore_ops *ops)
 {
 	sa1100_update_edge_regs(&sa1100_gpio_chip);
 }
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 2ed5a1e89d69..2800e8ff1392 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2801,7 +2801,7 @@ static void hv_crash_handler(struct pt_regs *regs)
 	hv_synic_disable_regs(cpu);
 };
 
-static int hv_synic_suspend(void)
+static int hv_synic_suspend(struct syscore_ops *ops)
 {
 	/*
 	 * When we reach here, all the non-boot CPUs have been offlined.
@@ -2828,7 +2828,7 @@ static int hv_synic_suspend(void)
 	return 0;
 }
 
-static void hv_synic_resume(void)
+static void hv_synic_resume(struct syscore_ops *ops)
 {
 	hv_synic_enable_regs(0);
 
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 7b5af6176de9..878d9f05dee3 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -2922,7 +2922,7 @@ static void disable_iommus(void)
  * disable suspend until real resume implemented
  */
 
-static void amd_iommu_resume(void)
+static void amd_iommu_resume(struct syscore_ops *ops)
 {
 	struct amd_iommu *iommu;
 
@@ -2936,7 +2936,7 @@ static void amd_iommu_resume(void)
 	amd_iommu_enable_interrupts();
 }
 
-static int amd_iommu_suspend(void)
+static int amd_iommu_suspend(struct syscore_ops *ops)
 {
 	/* disable IOMMUs to go out of the way for BIOS */
 	disable_iommus();
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 8f02009a2568..a863e579beec 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2310,7 +2310,7 @@ static void iommu_flush_all(void)
 	}
 }
 
-static int iommu_suspend(void)
+static int iommu_suspend(struct syscore_ops *ops)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu = NULL;
@@ -2337,7 +2337,7 @@ static int iommu_suspend(void)
 	return 0;
 }
 
-static void iommu_resume(void)
+static void iommu_resume(struct syscore_ops *ops)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu = NULL;
diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index e7dfcf0cda43..69f68fce309d 100644
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
index a44c49e985b7..31a34721e1ca 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -726,7 +726,7 @@ static void __exception_irq_entry mpic_handle_irq(struct pt_regs *regs)
 	} while (1);
 }
 
-static int mpic_suspend(void)
+static int mpic_suspend(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpic_data;
 
@@ -735,7 +735,7 @@ static int mpic_suspend(void)
 	return 0;
 }
 
-static void mpic_resume(void)
+static void mpic_resume(struct syscore_ops *ops)
 {
 	struct mpic *mpic = mpic_data;
 	bool src0, src1;
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 04fac0cc857f..38d5d9aa5f92 100644
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
index 467cb78435a9..0ebc15f054ed 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4992,7 +4992,7 @@ static void its_enable_quirks(struct its_node *its)
 				     its_quirks, its);
 }
 
-static int its_save_disable(void)
+static int its_save_disable(struct syscore_ops *ops)
 {
 	struct its_node *its;
 	int err = 0;
@@ -5028,7 +5028,7 @@ static int its_save_disable(void)
 	return err;
 }
 
-static void its_restore_enable(void)
+static void its_restore_enable(struct syscore_ops *ops)
 {
 	struct its_node *its;
 	int ret;
diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index 91b2f587119c..e9b186b7b9fd 100644
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
index b91f5c14b405..bdee15a327f3 100644
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
index b2860eb2d32c..917672f0004d 100644
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
index d8558eb35044..a7d4953a1381 100644
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
index 62e6bf3a0611..7b15d2a31491 100644
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
index 516a3a0e359c..ad8252b6c656 100644
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
index 9643cc3a77d7..a89d27821eb3 100644
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
index de481ba340f8..321c1f761e1f 100644
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
index 360d88687e4f..3a0edbbda0b2 100644
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
index d8d4dff16276..f4365341fcc6 100644
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
index 37d4b29763bc..45d926a1c75b 100644
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
index 66cbb9f77ff3..7951c98bd6ed 100644
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
index 2bcdf216a000..33173ce84c4b 100644
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
index a94cf7d15b8e..455e55cbd2cc 100644
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
index bd2fca7dc017..568c4844593c 100644
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
index bf59e37d650a..10ed53c322ce 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -650,7 +650,7 @@ static struct irq_data *irq_gc_get_irq_data(struct irq_chip_generic *gc)
 }
 
 #ifdef CONFIG_PM
-static int irq_gc_suspend(void)
+static int irq_gc_suspend(struct syscore_ops *ops)
 {
 	struct irq_chip_generic *gc;
 
@@ -670,7 +670,7 @@ static int irq_gc_suspend(void)
 	return 0;
 }
 
-static void irq_gc_resume(void)
+static void irq_gc_resume(struct syscore_ops *ops)
 {
 	struct irq_chip_generic *gc;
 
@@ -693,7 +693,7 @@ static void irq_gc_resume(void)
 #define irq_gc_resume NULL
 #endif
 
-static void irq_gc_shutdown(void)
+static void irq_gc_shutdown(struct syscore_ops *ops)
 {
 	struct irq_chip_generic *gc;
 
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index 445912d51033..ec95049fe590 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -215,10 +215,11 @@ void rearm_wake_irq(unsigned int irq)
 
 /**
  * irq_pm_syscore_resume - enable interrupt lines early
+ * @ops: syscore context
  *
  * Enable all interrupt lines with %IRQF_EARLY_RESUME set.
  */
-static void irq_pm_syscore_resume(void)
+static void irq_pm_syscore_resume(struct syscore_ops *ops)
 {
 	resume_irqs(true);
 }
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0efbcdda9aab..94cba646e66a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3666,12 +3666,13 @@ static bool legacy_kthread_create(void)
 
 /**
  * printk_kthreads_shutdown - shutdown all threaded printers
+ * @ops: syscore context
  *
  * On system shutdown all threaded printers are stopped. This allows printk
  * to transition back to atomic printing, thus providing a robust mechanism
  * for the final shutdown/reboot messages to be output.
  */
-static void printk_kthreads_shutdown(void)
+static void printk_kthreads_shutdown(struct syscore_ops *ops)
 {
 	struct console *con;
 
diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc1afec306b3..2a85e684153b 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -296,6 +296,11 @@ int sched_clock_suspend(void)
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
@@ -305,9 +310,14 @@ void sched_clock_resume(void)
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
index 243fe25e680a..4f15e0bc8395 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1988,6 +1988,11 @@ void timekeeping_resume(void)
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
@@ -2055,10 +2060,15 @@ int timekeeping_suspend(void)
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
index 6c07dd423458..d9d191ee1a1b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5617,7 +5617,7 @@ static int kvm_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void kvm_shutdown(void)
+static void kvm_shutdown(struct syscore_ops *ops)
 {
 	/*
 	 * Disable hardware virtualization and set kvm_rebooting to indicate
@@ -5635,7 +5635,7 @@ static void kvm_shutdown(void)
 	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
-static int kvm_suspend(void)
+static int kvm_suspend(struct syscore_ops *ops)
 {
 	/*
 	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
@@ -5652,7 +5652,7 @@ static int kvm_suspend(void)
 	return 0;
 }
 
-static void kvm_resume(void)
+static void kvm_resume(struct syscore_ops *ops)
 {
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
-- 
2.50.0


