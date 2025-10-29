Return-Path: <linuxppc-dev+bounces-13523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD85C1C194
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXqz1pwzz3bfM;
	Thu, 30 Oct 2025 03:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755631;
	cv=none; b=YQecQreL9A0iZptNgVeXGrHhtq/EVoDhxDsQ1aXKiiE3+4hdsbMit0IbQbYA3YFtPl3A/Wvn2PI6H7DeNhhxoPiRwvsXJ0NaaWPPMZ/m/oGSea3eupeG1E88tpr82UUsaVDFU00aS8zqMDfMOkytwSAyXBnkonxODGOpCjf7q6lFpEw/igKpewszRJrGSaptRDhT0oLmLcgSwdHi7+laDqWn6C+acV8efVpeCHiECQ4u0gG/g0zjab/6E05etHZJ9eP5Oc8mZvizh7t3+wT3MF9vOSDzXiC1rL52lk3ODJRWW0ef6hHT5fAldlHbzvPATKDFLl8n4kxBabqsusFrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755631; c=relaxed/relaxed;
	bh=AAflKtaWcrVF6Nhfrfoz1N7w/0F8UwSgA56H4g4glHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFJrNVj+HUiXmBDJGesxE8/tKLxjAxEIB8hrWMh4sTxGTtmNeUmOA1GSGjVuFtLSC47+ZjdDs/Kfmp0DhvqAVuxZVwCuDhhNP90WLZNySkcqHOnyZlsInufNf1YuWEvmWBz/5lXL+WT5lm0PRYg/kWCBLvVaFKGV7fUQ52SwQTjtmnBL8Y3KIM999pHXjgfyqf6Q+5pdzRp5SX9w0jmvhwr61Aftbl7cjueJMm6VoHjqnpJTo3wasyWKdJ0p8GMNOib0nTDiHxSaviStIcEeSbiSdcLfDG5e5kcptL7RtNstjxP/Z0o41eFVdJvwjMR1sq9END+zo8hNXFHdqGatjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DzwY5HXt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DzwY5HXt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXqx1rMgz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:33:48 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so7459495e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755623; x=1762360423; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAflKtaWcrVF6Nhfrfoz1N7w/0F8UwSgA56H4g4glHQ=;
        b=DzwY5HXt9n9mgndjeu1v92T9yKseO+nlllULnhAAuoVhXxFfz3sP0Z80gqcG/TsBuy
         jasI4ZhtWNLPnjFadrJymhpConSrfLTs1cph2+LWyFS7eTwOvKEStwUp3Q7gaUAkPM7H
         W8WEmBHEcqjNEGpslhtR6+TRMOmSkNvSU3wd2tX22lhtdht8XK2y4y8p494Wh+NTqFLF
         TkCuFkFOMom9IaOqSNKyGSrxGx/P+615Fu64DCFk8wrDBcTZq7e08hjDZUiRHV6V2xz0
         f/kbqelmgdDdPJovFCMMr8oVMJNQg2J8hGKTenw4PnU+GhGsaGxycPg1bj12ZTcBfm91
         kHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755623; x=1762360423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAflKtaWcrVF6Nhfrfoz1N7w/0F8UwSgA56H4g4glHQ=;
        b=GY4zqf9f18UiGOIHwadEIpbUF0HcMHYVFG9gYasWLNj/Kq7MlKa92ghrapVtKaIaw+
         SiycnnCrdRZJtGSjaudC4O8Mw00HkxKz2gZpRcvDWbmIIZ7X9hSH1nAI8EKwV+BDZP2n
         ZIj3djZeDm1RE3pKz/AM8J4yK0pFJ4chY77TWW/QMh4NFR+WbM8FdaYUyRuXYim0sAzt
         wfDtGLlqnzl7oGdEjRjYUiborGT397Ma4E46HGelciBNZJlSuW+RMTxC6KRaQwRkp/ic
         Q2AeaidwNRBALCxSdgjkBs5FMgblHmnNC8u+zMlUFOErshYdy2YbgLqpCee80keczqJq
         SLng==
X-Forwarded-Encrypted: i=1; AJvYcCXVD5v0E1nd3TPQiFH8DKkqND4BOWhEw2JhWCzZOyyEbzBm7MToYH2MmLsS/pcNaECU2mbP2QcUnf6h2NQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBlcnupV2cNChwV38uT3Sy1nT0HxJNNRqlfAtVLxTuWgY0HNB4
	kGBAQXbrJYJ1Mf5bBkuFbZLgsgpp10tcFF5N+i3wsG2PpegwNJmYZ9BC
X-Gm-Gg: ASbGncsS0FBC62jiOU3+6/ZFXSsSVVTUpoxs5fh0SXJAwMfGuNu/MogKgIOASEgxn/l
	6TzVf73so36ADSn3Pwt9A5nuFuBbTi1RET7f1WmbhRSz8WNx15KPJuYf8Zag8fsiGQmziG6tyoD
	CMQd1/5ZOGm/W5c5SIqhicYFzVwOcd7PXQr1wlaTb/zMAjpLkbYehL8j+LuF6UkUYj8icIrFQ+l
	LXLhL9UyFHdtKuuq4A6uHwRy1IXAlu2nomxMg7JvlQvYEBB/prIw9Z7GBX3NqWPTTcHAilOhe+U
	c2P6fR3cHPyzz2xXT8YhJcRecvlGJT+fM4JloTE0tnrO/V+kAp1HzGfQNf/Rjx7xTEqrFeaPfGr
	epkz8dkLSJnrbtgxcsazoCb6iLazMrOPhQ0KoT6BoRkHCAr4/aVvEkOb7/gO6rkd9+nh/GyYgNa
	ER/5cjKHsVRNk/dARh70BQ6qg5wujRNQEcpXR1wvhyJVnDxwkp6EYDu/1LrA+ovb4b+WG0
X-Google-Smtp-Source: AGHT+IHTmDPmMpNCDFFQsAevLNP6qOs7nF+wicDIMZb/6KQd4rRWs7Qottj+hraNqh61j+yol+JE4g==
X-Received: by 2002:a05:6000:430c:b0:425:86da:325f with SMTP id ffacd0b85a97d-429b4c5303emr258811f8f.27.1761755622916;
        Wed, 29 Oct 2025 09:33:42 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952da12dsm27463002f8f.29.2025.10.29.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 0/7] syscore: Pass context data to callbacks
Date: Wed, 29 Oct 2025 17:33:29 +0100
Message-ID: <20251029163336.2785270-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Hi Greg, Rafael,

sorry, this took a while to rework because I had to find a large enough
block of free time to push through. I played around a bit with different
ideas based on our discussion and ended up with a mix between Rafael's
and my proposal. struct syscore_ops is now split out and can be made
const. struct syscore is introduced to contain the variable data such
as the list head and the driver data. It also has a pointer to the ops
structure. Registration APIs are changed accordingly. I initially wanted
to avoid this churn, but then realized I was already touching all of the
files anyway, so might as well make it all consistent. As a result the
series is about twice as large in terms of LOC, but that's mostly due to
the structure split.

For anyone who hasn't seen this yet, here's the full cover letter:

Hi,

Something that's been bugging me over the years is how some drivers have
had to adopt file-scoped variables to pass data into something like the
syscore operations. This is often harmless, but usually leads to drivers
not being able to deal with multiple instances, or additional frameworks
or data structures needing to be created to handle multiple instances.

This series proposes to "objectify" struct syscore_ops by passing driver
specific data to the syscore callbacks. The contextual data is stored in
a new struct syscore before registering the structure with the framework
and the structure can be embedded in driver-specific data to make it per
instance.

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

Changes in v3:
- add separate syscore structure containing the modifiable fields,
  including driver-specific data, as well as a pointer to the constified
  syscore_ops structure
- change registration/unregistration API to make these changes more
  obvious

Changes in v2:
- kerneldoc fixes

Thanks,
Thierry

Thierry Reding (7):
  syscore: Pass context data to callbacks
  MIPS: PCI: Use contextual data instead of global variable
  bus: mvebu-mbus: Use contextual data instead of global variable
  clk: ingenic: tcu: Use contextual data instead of global variable
  clk: mvebu: Use contextual data instead of global variable
  irqchip/irq-imx-gpcv2: Use contextual data instead of global variable
  soc/tegra: pmc: Use contextual data instead of global variable

 arch/arm/mach-exynos/mcpm-exynos.c        | 12 ++--
 arch/arm/mach-exynos/suspend.c            | 48 +++++++------
 arch/arm/mach-pxa/generic.h               |  6 +-
 arch/arm/mach-pxa/irq.c                   | 10 ++-
 arch/arm/mach-pxa/mfp-pxa2xx.c            | 10 ++-
 arch/arm/mach-pxa/mfp-pxa3xx.c            | 10 ++-
 arch/arm/mach-pxa/pxa25x.c                |  4 +-
 arch/arm/mach-pxa/pxa27x.c                |  4 +-
 arch/arm/mach-pxa/pxa3xx.c                |  4 +-
 arch/arm/mach-pxa/smemc.c                 | 12 ++--
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        | 12 ++--
 arch/arm/mach-s5pv210/pm.c                | 10 ++-
 arch/arm/mach-versatile/integrator_ap.c   | 12 ++--
 arch/arm/mm/cache-b15-rac.c               | 12 ++--
 arch/loongarch/kernel/smp.c               | 12 ++--
 arch/mips/alchemy/common/dbdma.c          | 12 ++--
 arch/mips/alchemy/common/irq.c            | 24 ++++---
 arch/mips/alchemy/common/usb.c            | 12 ++--
 arch/mips/pci/pci-alchemy.c               | 30 +++------
 arch/powerpc/platforms/cell/spu_base.c    | 10 ++-
 arch/powerpc/platforms/powermac/pic.c     | 12 ++--
 arch/powerpc/sysdev/fsl_lbc.c             | 12 ++--
 arch/powerpc/sysdev/fsl_pci.c             | 12 ++--
 arch/powerpc/sysdev/ipic.c                | 12 ++--
 arch/powerpc/sysdev/mpic.c                | 14 ++--
 arch/powerpc/sysdev/mpic_timer.c          | 10 ++-
 arch/sh/mm/pmb.c                          | 10 ++-
 arch/x86/events/amd/ibs.c                 | 12 ++--
 arch/x86/hyperv/hv_init.c                 | 12 ++--
 arch/x86/kernel/amd_gart_64.c             | 10 ++-
 arch/x86/kernel/apic/apic.c               | 12 ++--
 arch/x86/kernel/apic/io_apic.c            | 17 +++--
 arch/x86/kernel/cpu/aperfmperf.c          | 20 +++---
 arch/x86/kernel/cpu/intel_epb.c           | 16 +++--
 arch/x86/kernel/cpu/mce/core.c            | 14 ++--
 arch/x86/kernel/cpu/microcode/core.c      | 15 ++++-
 arch/x86/kernel/cpu/mtrr/legacy.c         | 12 ++--
 arch/x86/kernel/cpu/umwait.c              | 10 ++-
 arch/x86/kernel/i8237.c                   | 10 ++-
 arch/x86/kernel/i8259.c                   | 14 ++--
 arch/x86/kernel/kvm.c                     | 12 ++--
 drivers/acpi/pci_link.c                   | 10 ++-
 drivers/acpi/sleep.c                      | 12 ++--
 drivers/base/firmware_loader/main.c       | 12 ++--
 drivers/base/syscore.c                    | 82 ++++++++++++-----------
 drivers/bus/mvebu-mbus.c                  | 19 +++---
 drivers/clk/at91/pmc.c                    | 12 ++--
 drivers/clk/imx/clk-vf610.c               | 12 ++--
 drivers/clk/ingenic/jz4725b-cgu.c         |  2 +-
 drivers/clk/ingenic/jz4740-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4755-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4760-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4770-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4780-cgu.c          |  2 +-
 drivers/clk/ingenic/pm.c                  | 14 ++--
 drivers/clk/ingenic/pm.h                  |  2 +-
 drivers/clk/ingenic/tcu.c                 | 59 ++++++++--------
 drivers/clk/ingenic/x1000-cgu.c           |  2 +-
 drivers/clk/ingenic/x1830-cgu.c           |  2 +-
 drivers/clk/mvebu/common.c                | 19 ++++--
 drivers/clk/rockchip/clk-rk3288.c         | 12 ++--
 drivers/clk/samsung/clk-s5pv210-audss.c   | 12 ++--
 drivers/clk/samsung/clk.c                 | 12 ++--
 drivers/clk/tegra/clk-tegra210.c          | 12 ++--
 drivers/clocksource/timer-armada-370-xp.c | 12 ++--
 drivers/cpuidle/cpuidle-psci.c            | 12 ++--
 drivers/gpio/gpio-mxc.c                   | 12 ++--
 drivers/gpio/gpio-pxa.c                   | 12 ++--
 drivers/gpio/gpio-sa1100.c                | 12 ++--
 drivers/hv/vmbus_drv.c                    | 14 ++--
 drivers/iommu/amd/init.c                  | 12 ++--
 drivers/iommu/intel/iommu.c               | 12 ++--
 drivers/irqchip/exynos-combiner.c         | 14 ++--
 drivers/irqchip/irq-armada-370-xp.c       | 12 ++--
 drivers/irqchip/irq-bcm7038-l1.c          | 12 ++--
 drivers/irqchip/irq-gic-v3-its.c          | 12 ++--
 drivers/irqchip/irq-i8259.c               | 12 ++--
 drivers/irqchip/irq-imx-gpcv2.c           | 30 +++------
 drivers/irqchip/irq-loongson-eiointc.c    | 12 ++--
 drivers/irqchip/irq-loongson-htpic.c      | 10 ++-
 drivers/irqchip/irq-loongson-htvec.c      | 12 ++--
 drivers/irqchip/irq-loongson-pch-lpc.c    | 12 ++--
 drivers/irqchip/irq-loongson-pch-pic.c    | 12 ++--
 drivers/irqchip/irq-mchp-eic.c            | 12 ++--
 drivers/irqchip/irq-mst-intc.c            | 12 ++--
 drivers/irqchip/irq-mtk-cirq.c            | 12 ++--
 drivers/irqchip/irq-renesas-rzg2l.c       | 12 ++--
 drivers/irqchip/irq-sa11x0.c              | 12 ++--
 drivers/irqchip/irq-sifive-plic.c         | 12 ++--
 drivers/irqchip/irq-sun6i-r.c             | 18 +++--
 drivers/irqchip/irq-tegra.c               | 12 ++--
 drivers/irqchip/irq-vic.c                 | 12 ++--
 drivers/leds/trigger/ledtrig-cpu.c        | 14 ++--
 drivers/macintosh/via-pmu.c               | 12 ++--
 drivers/power/reset/sc27xx-poweroff.c     | 10 ++-
 drivers/sh/clk/core.c                     | 10 ++-
 drivers/sh/intc/core.c                    | 12 ++--
 drivers/soc/bcm/brcmstb/biuctrl.c         | 12 ++--
 drivers/soc/tegra/pmc.c                   | 21 ++++--
 drivers/thermal/intel/intel_hfi.c         | 12 ++--
 drivers/xen/xen-acpi-processor.c          | 12 ++--
 include/linux/syscore_ops.h               | 15 +++--
 kernel/cpu_pm.c                           | 12 ++--
 kernel/irq/generic-chip.c                 | 14 ++--
 kernel/irq/pm.c                           | 11 ++-
 kernel/printk/printk.c                    | 11 ++-
 kernel/time/sched_clock.c                 | 22 ++++--
 kernel/time/timekeeping.c                 | 22 ++++--
 virt/kvm/kvm_main.c                       | 18 +++--
 109 files changed, 930 insertions(+), 523 deletions(-)

-- 
2.51.0


