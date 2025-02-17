Return-Path: <linuxppc-dev+bounces-6270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5AA38950
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:37:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxL1PjQz30CD;
	Tue, 18 Feb 2025 03:37:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810246;
	cv=none; b=O3OH+ypR1uH04ToI0Sgu5DBrsJB/X/KMiAFaKyrc92C4jiCQeQNBbncwB68LFGD8TnFpT9go7ZCCBHmv1TAxwEF2rnTgaFDXzDGjsT5b4WFkgH6eJFhx6lixEX8R1lLH5ZLGU2XSbDjEiK/r5pzLmRI/Gu2DvCJyZr1gtPN3u1KEh3uDQKVZUgddYKB+0NkaOUYH6V289mIjfb2WhPsJ+8KbEvthzMLfPgRFPxEMFPi0u1IHRAS4uFQ3QFd6hcAkM/i40wbJyWeaG/dZEmfFZWrHNsOwxz16X54Z+Xwa9DZfieA08VDnEJHuUt7sAxeKzvWY32f7IDcUdS3pii5gww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810246; c=relaxed/relaxed;
	bh=yiZt2i6xSOw8eOJOYff501csDZIGzCac6UOW2wl3hpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TC4QIZrbsv9x05be+YNKqHpxSVP1/1OwdBNnYp2suJOz8FusKbqKysqoKwGwIXTLAIch0YQG2HzbInpUCZbLTfsUl5IRitN2HZd9fR6ThA8eFqZZklhjxeJWtBCg78uYq1AGOkqbEI05CBwdXLd5ozDU5SmvmK8bH4F1ZsaFyQmM2rtFSJN2f64nwGXA+hCK7lpB5UJN3Ir1C7iSTiCOnQbviiXyXnH+1wiRDMC+U0qWwA8W8NiAzQKqHtOglEozjUL+z+PSatL4ar/TQOIO4sjqp0AvGvuuVu4cWkPdnJZ/VV6puAUbnNL1knOV9lmvCnaCtlPmUdnHtC31N8uU0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+bpUDbf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+bpUDbf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxJ4dcbz306S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:23 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4396d2e32b7so17542985e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810240; x=1740415040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiZt2i6xSOw8eOJOYff501csDZIGzCac6UOW2wl3hpw=;
        b=G+bpUDbf9tBLoY6WIUrGU5TG3uPQScoycVWtFMiFH8yS8GYTWJANu5N+2gBNPpjCB3
         DHBRDgRIMvZTU7nAN8tuGZpK9nibp3/mgVNytSjDljBOh7qgMrwdOz6OtAvzTepeVvYL
         t+RNZ1ktZ0y3kWHp/GIAhIgTt4HgAKFDhJ9MLY7KRVZtImqhMngCtElodfIRUz22XbI1
         rXo3yWk9fWjAaa1R16w5Sc8YbHq9AY9mc20y7OGJoOL9tpkT19OtTRRiQhAgH8bnGwgc
         CJNIppSKyLsL2RNIHvD813jKYbBye9xlmIIASMy0BGtWZ2qA/kuAcKESC6nQ56lCZB5u
         laNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810240; x=1740415040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiZt2i6xSOw8eOJOYff501csDZIGzCac6UOW2wl3hpw=;
        b=AqcRsmmRCTy+JJiAZPrD9udVnAeiXyFA633LuCeA2GZI16pzdtKmmScAumL87jc7U2
         wQWci9ae4PfnwQiMADy4j9cNVsYrvy5q5nqLXM5XuJGEvPBOV38qS+WKGNDuOWhSzLkW
         ENjGGaAR/HqoQudCinOGoc+MNfXljmMzxF1GxDFfgk+4/4FqificAhqiancTL6rFdZQA
         2fEImtSFaVQqO5bJjlhJpomhiO8vY2bt6O+11tgSdLqv6HTG+FQEQJX2tvOhX0SJfrx1
         d6MRzLyG2qQ7sxhpqm8sKebSWHF0P6zYF99RMs/MkontrHYALO+rlpF2dDXZYAALpONm
         aRyA==
X-Forwarded-Encrypted: i=1; AJvYcCUp3mgSc3BCHY6DYOBFbF6r7WbJtrwa8l2uLBMipJjBADdcB3j5JZbJtDLzKZz2hZMqrYu2+xo1Bk226B8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTrJyMYegrsxLKh4MWoAd+FowlICJj0kml+8fLw2KqdPOm7ctV
	IGUcCMwdVO2DafzqGBLjhi1H92+ys3bAny+LHswVwXBLvVTjioIS
X-Gm-Gg: ASbGncs5QEgsA0GUufWwd7qYCR0yrWX4q2lVXQjuTfR/PHYT0Mn9blVh4r84ap7tGmp
	SjWRSsdWLStWowBBIoakVPR9B0cw7OvHziuazIMRu1QvPZ0qf8KrJMhtsi0XhP8b/Cl3f49Nnb2
	mLEeJ1FLF1eLLu/egj0fBAov4tJoS576u4vL8QRWjvvhzFeBOEj72msVqQCCLqih+TO+jXWiaqg
	9ovxS1SxnyEXBR5rDG2s2CBLwzUuD0v8wx3e/vyStKz3Xp9k2fE+O7AQEfIpcmMmwTmPQsbg1nJ
	3z5K6kavnl7WPv0N4fXVSckMgWWl4btgFbzcMzBSUjIZglqdbcaoEIgBBnDzlx1sXjj/4YFZ4U5
	SSlLR1uI=
X-Google-Smtp-Source: AGHT+IFZaRz1DpftXgns+QX0TjkeJRpqUCBrHv7Z6/192+MAz8sD7WUt6O+3frJRvsZQb4k9gj7a7g==
X-Received: by 2002:a05:600c:4f56:b0:439:3c71:16be with SMTP id 5b1f17b1804b1-4396e6f66a1mr101592005e9.13.1739810240075;
        Mon, 17 Feb 2025 08:37:20 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439880fbd6fsm24614705e9.18.2025.02.17.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:18 -0800 (PST)
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
Subject: [PATCH 0/7] syscore: Pass context data to callbacks
Date: Mon, 17 Feb 2025 17:37:06 +0100
Message-ID: <20250217163713.211949-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 kernel/irq/pm.c                           |  2 +-
 kernel/printk/printk.c                    |  2 +-
 kernel/time/sched_clock.c                 | 14 +++++-
 kernel/time/timekeeping.c                 | 14 +++++-
 virt/kvm/kvm_main.c                       |  6 +--
 95 files changed, 302 insertions(+), 267 deletions(-)

-- 
2.48.1


