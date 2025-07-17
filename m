Return-Path: <linuxppc-dev+bounces-10280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0FCB08A99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:32:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlV5WGTz307K;
	Thu, 17 Jul 2025 20:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748374;
	cv=none; b=NCyuYNMt+YX6TJgM6bhQbytupgOlPM6QY95Ka4MQ4TkLUtXFdS+wDmOMJ0p4wUNZW52F/DYULn1i86F5L4oL3AkJGrY1Z5+C+W6hMeRuwrJTZdmbTp2Mqr0TsnjEx0DDPJKl51txDYhpFxh5zjq9TYdVs9mped9ZQS5rv62OpQYT85tZwmdAmiy6t8g3vVokjMVHPc58GM3qhyBbgHv1Oa2zMtQiJOBC/qBHdlOSb4utMmGkj5F5wKh+w9pQx8s4YkoatkIfjc/8V3LLLvaN5UU5DGbgzEkuklCvpHymTwQRkigVDrm6zhvxMZDmdo6sAY1qiL2C6s+8/qkEJAa9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748374; c=relaxed/relaxed;
	bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPyIGqbjHsP/2Jd8Jk0LWCy9pwuwUyRFOI9dpw0317Mwm0fyovNwIkSlcZxIdXzUKrWVua1trqlNh5X3K3KqGctmN8wnivYPMO3WTgjGNUI5zGm27O64wZRhkt1HEVSIwR1Xp92FOMPLwoYDcr9q/5/SMfJVniB6I2XwTfB2O/KzXBk8aanzaei+QCEDykb/kuWQxh0+j/FA3Uei9t7xMVHRDI02Og0I+hjHJdac5c2t84yj+QUdkCEzhVzDCl+MRwnEutlwvRu031bnwbmLAraPMtKLWIdkydEPqv1YQ9govTihXUyah2k4VsMouxoT+PQe3BrxkVeoyLe3liKWsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aNCmjVub; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aNCmjVub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlT0mS8z2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:32:52 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so761190f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748368; x=1753353168; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
        b=aNCmjVubngpz40IqqjrX/mzDSqn1ASpABeECjP5ujpfgEIn7Lme2I9W9R5vFkqW1bg
         Iteth4GARtpnO9yku0LUpLd/nv65C+NoiZqXEMzkForg0jM4qsANWqUCHlm3SlFXFCDK
         xReZbPc+n44h2uljX0QxegRD5Jv5YFNUDj0AIqk9apYkDaf0H107hby6+HWR6CGsyqDs
         WGPCG3chHZrUIho8oSXzYiL3+uoTgU6tGehnjzBwq/g6MVwnxkeWdspVQ4UnzPdVIwLe
         eiin2r8tj7DbFjsHfUGzy6kyaCVFR+2DEvVXMcV1/tZcXVbwQN5mCiEZ5LtRs2Uc4YBA
         fAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748368; x=1753353168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
        b=pz4LSfN/8YHKtAjBxftyPZVeY3uYbFv/czWvSRbjGNnPpygOerJ7N6ZXhM/LfObPiM
         0I9tE8V66BZ2wlowqYAwUa37KV3RdvNKiHK8Jv5yrcyH0Dr9fB484vlo0539c2jwt8FP
         neubcbOACvbcCbiVjoQ/vevBznTl5+lQ3S90Ub5XIiYnN4WjPGzWld2EGYlXLgqHKbyv
         PR58pyf5KMG8LgnDRsVhLLwVi1jqIhQ1+jW8gj+f1IQOOLw/wyqq+iaTREG7GmgSTe1p
         e0PGwqvX/jZjdfpIAV67RFJShVAGb1OIrbMqX+f1HYjZ99VdLqTpmW6pLz/Zuqh0/KxJ
         jWSw==
X-Forwarded-Encrypted: i=1; AJvYcCVbrtCdpFiWng88zH/G/JCvcMbZzKCXB9b1OYxWrAMCDv3vjl7khutSowz2UnmuRbzXrTJlNEnnl96CNHY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTSFyQocIDEgrO7TDfkN2/sCElRMap46c9rdBCq+hrRa+kXmdL
	yRjQrNeUyEF9b8K42PyBpNbBwvYD6UltxfbmqrRJY9OAnumASf7BUYEV
X-Gm-Gg: ASbGncuM5qHYRsur6HC3msRh/SVnNxUTeuXX7Lh9vWC4JeRZlJeGAXgegrXHEb7EHe0
	dz/zNjGeAM6tGo6qsuyHQlWs5MC5vUelOpO8hsqGDUKUX/9nrqNi8GFD+FFfii9DWG4/P1d7lbf
	i9erxNVJLUtMy6O+wJA43X6s4WpBWxpNHxu7DTZPqCERVu7xzkBMFJGtI3yR4cvjfcMuC4O0FHt
	nwZ+bUDybYbHqhIJ5CEEl3/sh115FEi0X2TDUTIJXqBsrN+iomd2dGaLEwYIM4b4GXUI89BSv+f
	vvWDmbwtkjA8iOLFdsH7PzJRxrUbUglF//NEQS9gxVR+2+LseHZTmwLEk2IZ5nykbmlQN4ZA2Uq
	OwOJZqg2V4Ixai69TzLp/dtuFQ4gKDDEgiRx5cNRki2I6jyryeqpAniDi+00EW14T5IekxKCDOT
	DSaAVtfmeepS1asg==
X-Google-Smtp-Source: AGHT+IHYr+e6HRnWiJaX4uEEec2eLY7pIXWpQP51NQ3+bvIOdtAIUdk3bgr+G16cAKYOJRVTeTk/yA==
X-Received: by 2002:a05:6000:1882:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b60dd731damr5816056f8f.34.1752748367574;
        Thu, 17 Jul 2025 03:32:47 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d758sm20033465f8f.49.2025.07.17.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:46 -0700 (PDT)
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
Subject: [PATCH v2 0/7] syscore: Pass context data to callbacks
Date: Thu, 17 Jul 2025 12:32:34 +0200
Message-ID: <20250717103241.2806798-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
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

Hi,

Something that's been bugging me over the years is how some drivers have
had to adopt file-scoped variables to pass data into something like the
syscore operations. This is often harmless, but usually leads to drivers
not being able to deal with multiple instances, or additional frameworks
or data structures needing to be created to handle multiple instances.

This series proposes to "objectify" struct syscore_ops by passing a
pointer to struct syscore_ops to the syscore callbacks. Implementations
of these callbacks can then make use of container_of() to get access to
contextual data that struct syscore_ops was embedded in. This elegantly
avoids the need for file-scoped, singleton variables, by tying syscore
to individual instances.

Patch 1 contains the bulk of these changes. It's fairly intrusive
because it does the conversion of the function signature all in one
patch. An alternative would've been to introduce new callbacks such that
these changes could be staged in. However, the amount of changes here
are not quite numerous enough to justify that, in my opinion, and
syscore isn't very frequently used, so the risk of another user getting
added while this is merged is rather small. All in all I think merging
this in one go is the simplest way.

Patches 2-7 are conversions of some existing drivers to take advantage
of this new parameter and tie the code to per-instance data.

Given that the recipient list for this is huge, I'm limiting this to
Greg (because it's at the core a... core change) and a set of larger
lists for architectures and subsystems that are impacted.

Changes in v2:
- kerneldoc fixes

Thanks,
Thierry

Thierry Reding (7):
  syscore: Pass context data to callbacks
  MIPS: Embed syscore_ops in PCI context
  bus: mvebu-mbus: Embed syscore_ops in mbus context
  clk: ingenic: tcu: Embed syscore_ops in TCU context
  clk: mvebu: Embed syscore_ops in clock context
  irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
  soc/tegra: pmc: Derive PMC context from syscore ops

 arch/arm/mach-exynos/mcpm-exynos.c        |  4 +-
 arch/arm/mach-exynos/suspend.c            | 14 +++---
 arch/arm/mach-pxa/irq.c                   |  4 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c            |  4 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c            |  4 +-
 arch/arm/mach-pxa/smemc.c                 |  4 +-
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        |  4 +-
 arch/arm/mach-s5pv210/pm.c                |  2 +-
 arch/arm/mach-versatile/integrator_ap.c   |  4 +-
 arch/arm/mm/cache-b15-rac.c               |  4 +-
 arch/loongarch/kernel/smp.c               |  4 +-
 arch/mips/alchemy/common/dbdma.c          |  4 +-
 arch/mips/alchemy/common/irq.c            |  8 ++--
 arch/mips/alchemy/common/usb.c            |  4 +-
 arch/mips/pci/pci-alchemy.c               | 28 ++++++------
 arch/powerpc/platforms/cell/spu_base.c    |  2 +-
 arch/powerpc/platforms/powermac/pic.c     |  4 +-
 arch/powerpc/sysdev/fsl_lbc.c             |  4 +-
 arch/powerpc/sysdev/fsl_pci.c             |  4 +-
 arch/powerpc/sysdev/ipic.c                |  4 +-
 arch/powerpc/sysdev/mpic.c                |  4 +-
 arch/powerpc/sysdev/mpic_timer.c          |  2 +-
 arch/sh/mm/pmb.c                          |  2 +-
 arch/x86/events/amd/ibs.c                 |  4 +-
 arch/x86/hyperv/hv_init.c                 |  4 +-
 arch/x86/kernel/amd_gart_64.c             |  2 +-
 arch/x86/kernel/apic/apic.c               |  4 +-
 arch/x86/kernel/apic/io_apic.c            |  9 +++-
 arch/x86/kernel/cpu/aperfmperf.c          |  6 +--
 arch/x86/kernel/cpu/intel_epb.c           |  8 ++--
 arch/x86/kernel/cpu/mce/core.c            |  6 +--
 arch/x86/kernel/cpu/microcode/core.c      |  7 ++-
 arch/x86/kernel/cpu/mtrr/legacy.c         |  4 +-
 arch/x86/kernel/cpu/umwait.c              |  2 +-
 arch/x86/kernel/i8237.c                   |  2 +-
 arch/x86/kernel/i8259.c                   |  6 +--
 arch/x86/kernel/kvm.c                     |  4 +-
 drivers/acpi/pci_link.c                   |  2 +-
 drivers/acpi/sleep.c                      |  4 +-
 drivers/base/firmware_loader/main.c       |  2 +-
 drivers/base/syscore.c                    |  8 ++--
 drivers/bus/mvebu-mbus.c                  | 24 +++++-----
 drivers/clk/at91/pmc.c                    |  4 +-
 drivers/clk/imx/clk-vf610.c               |  4 +-
 drivers/clk/ingenic/pm.c                  |  4 +-
 drivers/clk/ingenic/tcu.c                 | 54 +++++++++++------------
 drivers/clk/mvebu/common.c                | 25 +++++++----
 drivers/clk/rockchip/clk-rk3288.c         |  4 +-
 drivers/clk/samsung/clk-s5pv210-audss.c   |  4 +-
 drivers/clk/samsung/clk.c                 |  4 +-
 drivers/clk/tegra/clk-tegra210.c          |  4 +-
 drivers/clocksource/timer-armada-370-xp.c |  4 +-
 drivers/cpuidle/cpuidle-psci.c            |  4 +-
 drivers/gpio/gpio-mxc.c                   |  4 +-
 drivers/gpio/gpio-pxa.c                   |  4 +-
 drivers/gpio/gpio-sa1100.c                |  4 +-
 drivers/hv/vmbus_drv.c                    |  4 +-
 drivers/iommu/amd/init.c                  |  4 +-
 drivers/iommu/intel/iommu.c               |  4 +-
 drivers/irqchip/exynos-combiner.c         |  6 ++-
 drivers/irqchip/irq-armada-370-xp.c       |  4 +-
 drivers/irqchip/irq-bcm7038-l1.c          |  4 +-
 drivers/irqchip/irq-gic-v3-its.c          |  4 +-
 drivers/irqchip/irq-i8259.c               |  4 +-
 drivers/irqchip/irq-imx-gpcv2.c           | 33 ++++++--------
 drivers/irqchip/irq-loongson-eiointc.c    |  4 +-
 drivers/irqchip/irq-loongson-htpic.c      |  2 +-
 drivers/irqchip/irq-loongson-htvec.c      |  4 +-
 drivers/irqchip/irq-loongson-pch-lpc.c    |  4 +-
 drivers/irqchip/irq-loongson-pch-pic.c    |  4 +-
 drivers/irqchip/irq-mchp-eic.c            |  4 +-
 drivers/irqchip/irq-mst-intc.c            |  4 +-
 drivers/irqchip/irq-mtk-cirq.c            |  4 +-
 drivers/irqchip/irq-renesas-rzg2l.c       |  4 +-
 drivers/irqchip/irq-sa11x0.c              |  4 +-
 drivers/irqchip/irq-sifive-plic.c         |  4 +-
 drivers/irqchip/irq-sun6i-r.c             | 10 ++---
 drivers/irqchip/irq-tegra.c               |  4 +-
 drivers/irqchip/irq-vic.c                 |  4 +-
 drivers/leds/trigger/ledtrig-cpu.c        |  6 +--
 drivers/macintosh/via-pmu.c               |  4 +-
 drivers/power/reset/sc27xx-poweroff.c     |  2 +-
 drivers/sh/clk/core.c                     |  2 +-
 drivers/sh/intc/core.c                    |  4 +-
 drivers/soc/bcm/brcmstb/biuctrl.c         |  4 +-
 drivers/soc/tegra/pmc.c                   |  7 ++-
 drivers/thermal/intel/intel_hfi.c         |  4 +-
 drivers/xen/xen-acpi-processor.c          |  2 +-
 include/linux/syscore_ops.h               |  6 +--
 kernel/cpu_pm.c                           |  4 +-
 kernel/irq/generic-chip.c                 |  6 +--
 kernel/irq/pm.c                           |  3 +-
 kernel/printk/printk.c                    |  3 +-
 kernel/time/sched_clock.c                 | 14 +++++-
 kernel/time/timekeeping.c                 | 14 +++++-
 virt/kvm/kvm_main.c                       |  6 +--
 96 files changed, 306 insertions(+), 269 deletions(-)

-- 
2.50.0


