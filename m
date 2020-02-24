Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C55169B66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 01:48:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qk2s1bvFzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PCBjXDV2; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qk1432tHzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 11:47:17 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id y1so3332058plp.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2020 16:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=NGZulyvP6eeKZRuNg6oqElKEJJKue2aiE15uYLFokJ4=;
 b=PCBjXDV2zJyWyUYKXQD7Jm6R1zYT5v9A16XrzB4xrFI0uL56BWSUxYsbb3pgfHjJM4
 3ipAexIiEslMZDwOOaa94nPIsSoQ7vBuYVX6dPIAz0p2Fx2e5QQdAiBXet/rp2e859QD
 C/ntghzO2NWtyylyCoarUR80PjFo18wm6WZQX5YNL8p8CwAcHXNe1j6xGh3lKp3ZO6ee
 G/p372+XBSLe3aOhAHwK2gkC8twzKPK5ZzM3rNV+gztlq9wAIKohcox+ymJPnNuQBYdh
 NYxVp8PYBgoDNKDfBWpN1DdEgWacKJZsio9gzz4ZlxNacNr3RnzWuh/b3pRGLpArdV9I
 h7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=NGZulyvP6eeKZRuNg6oqElKEJJKue2aiE15uYLFokJ4=;
 b=qCms1Af2j3Jcy9vl4VC1M6zHOq/NTzVxkbnZGxDLCqjkXFib7uVXvyMthJdqOB2FiN
 orgTygFtQELEu9rxVitd9BZ8Z9ybPBilpOln83zqR0cy71Zs+B+GdcAAbvjqr/hzoAxe
 I2iUlNM74dd93s0MAevttL3vuJ0l9r7fgJBFeQcYDN0VP3U1ocVZqOcxjVWPtCMlMHUz
 yCFRLjgroCyZEY/jWpiTj2SQRtp6itRgrrqg3O+09yUYxkwM9PWjkPGK8mM/sjyElTEH
 4V6n/j+4r6h+asOK1ez9C4fHVmqYTISldckdSXrmPXuxzgiXMNycUAMeAfEWpB/d1hX0
 2tpg==
X-Gm-Message-State: APjAAAUOyXYxvlBK1dOQhmum4hsfzrcM9N9S6gbBHawrLRkODwJfZ8ol
 KEn8bRt+YPkjXacQaij3noE=
X-Google-Smtp-Source: APXvYqzsrg2HiD2xn64NNxjB867u34XuwSUi1T0w+UBfhB69kaB63NtC9WJD72JPVEqh7kGl2/xMKw==
X-Received: by 2002:a17:90a:5285:: with SMTP id
 w5mr17583711pjh.77.1582505233395; 
 Sun, 23 Feb 2020 16:47:13 -0800 (PST)
Received: from localhost ([106.51.232.35])
 by smtp.gmail.com with ESMTPSA id k3sm5291565pgh.34.2020.02.23.16.47.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Feb 2020 16:47:12 -0800 (PST)
Date: Mon, 24 Feb 2020 06:17:11 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, x86@kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-omap@vger.kernel.org,
 linux-alpha@vger.kernel.org
Subject: [PATCH v2 00/18] genirq: Remove setup_irq()
Message-ID: <cover.1582471508.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.3 (2018-01-21)
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While trying to understand internals of irq handling, came across a
thread [1] in which tglx was referring to avoid usage of setup_irq().
The early boot setup_irq() invocations happen either via 'init_IRQ()'
or 'time_init()', while memory allocators are ready by 'mm_init()'.

Hence instances of setup_irq() are replaced by request_irq() &
setup_irq() [along with remove_irq()] definition deleted in the last
patch.

Seldom remove_irq() usage has been observed coupled with setup_irq(),
wherever that has been found, it too has been replaced by free_irq().

Build & boot tested on ARM & x86_64 platforms (ensured that on the
machines used for testing, modifications made in this series is being
exercised at runtime)

Much of the changes were created using Coccinelle with an intention
to learn it. But not everything could be automated.

Searching with 'git grep -n '\Wsetup_irq('' & avoiding the irrelevant
ones, 153 invocation's of setup_irq() were found. 112 could be replaced
w/ cocci, of which in a few files some desired hunks were missing or
not as expected, these were fixed up manually. Also the remaining 41
had to be done manually.

Although cocci could replace 112, because of line continue not
happening at paranthesis for request_irq(), around 80 had to be
manually aligned in the request_irq() statement.

So though many changes could be automated, there are a considerable
amount of manual changes, please review carefully especially mips &
alpha.

Usage of setup_percpu_irq() is untouched w/ this series.

There are 2 checkpatch warning about usage of BUG(), they were already
present w/ setup_irq(), status quo maintained.

[1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos

Since changes from v1 are trivial as below, tags received has been
applied to the relevant patches, if any objections, please shout.

v2:
 * Replace pr_err("request_irq() on %s failed" by
           pr_err("%s: request_irq() failed"
 * m68k: remove now irrelevant comment separation comment lines
 * Commit message massage


afzal mohammed (18):
  alpha: replace setup_irq() by request_irq()
  ARM: replace setup_irq() by request_irq()
  c6x: replace setup_irq() by request_irq()
  hexagon: replace setup_irq() by request_irq()
  ia64: replace setup_irq() by request_irq()
  m68k: Replace setup_irq() by request_irq()
  microblaze: Replace setup_irq() by request_irq()
  MIPS: Replace setup_irq() by request_irq()
  parisc: Replace setup_irq() by request_irq()
  powerpc: Replace setup_irq() by request_irq()
  s390: replace setup_irq() by request_irq()
  sh: replace setup_irq() by request_irq()
  unicore32: replace setup_irq() by request_irq()
  x86: Replace setup_irq() by request_irq()
  xtensa: replace setup_irq() by request_irq()
  clocksource: Replace setup_irq() by request_irq()
  irqchip: Replace setup_irq() by request_irq()
  genirq: Remove setup_irq() and remove_irq()

 arch/alpha/kernel/irq_alpha.c                 | 29 ++-------
 arch/alpha/kernel/irq_i8259.c                 |  8 +--
 arch/alpha/kernel/irq_impl.h                  |  7 +--
 arch/alpha/kernel/irq_pyxis.c                 |  3 +-
 arch/alpha/kernel/sys_alcor.c                 |  3 +-
 arch/alpha/kernel/sys_cabriolet.c             |  3 +-
 arch/alpha/kernel/sys_eb64p.c                 |  3 +-
 arch/alpha/kernel/sys_marvel.c                |  2 +-
 arch/alpha/kernel/sys_miata.c                 |  6 +-
 arch/alpha/kernel/sys_ruffian.c               |  3 +-
 arch/alpha/kernel/sys_rx164.c                 |  3 +-
 arch/alpha/kernel/sys_sx164.c                 |  3 +-
 arch/alpha/kernel/sys_wildfire.c              |  7 +--
 arch/alpha/kernel/time.c                      |  6 +-
 arch/arm/mach-cns3xxx/core.c                  | 10 +---
 arch/arm/mach-ebsa110/core.c                  | 10 +---
 arch/arm/mach-ep93xx/timer-ep93xx.c           | 12 ++--
 arch/arm/mach-footbridge/dc21285-timer.c      | 11 +---
 arch/arm/mach-footbridge/isa-irq.c            |  8 +--
 arch/arm/mach-footbridge/isa-timer.c          | 11 +---
 arch/arm/mach-iop32x/time.c                   | 12 ++--
 arch/arm/mach-mmp/time.c                      | 11 +---
 arch/arm/mach-omap1/pm.c                      | 22 ++++---
 arch/arm/mach-omap1/time.c                    | 10 +---
 arch/arm/mach-omap1/timer32k.c                | 10 +---
 arch/arm/mach-omap2/timer.c                   | 11 +---
 arch/arm/mach-rpc/time.c                      |  8 +--
 arch/arm/mach-spear/time.c                    |  9 +--
 arch/arm/plat-orion/time.c                    | 10 +---
 arch/c6x/platforms/timer64.c                  | 11 +---
 arch/hexagon/kernel/smp.c                     | 17 +++---
 arch/hexagon/kernel/time.c                    | 11 +---
 arch/ia64/kernel/irq_ia64.c                   | 42 +++++--------
 arch/ia64/kernel/mca.c                        | 51 +++++-----------
 arch/m68k/68000/timers.c                      | 11 +---
 arch/m68k/coldfire/pit.c                      | 11 +---
 arch/m68k/coldfire/sltimers.c                 | 19 ++----
 arch/m68k/coldfire/timers.c                   | 21 ++-----
 arch/microblaze/kernel/timer.c                | 10 +---
 arch/mips/alchemy/common/time.c               | 11 +---
 arch/mips/ar7/irq.c                           | 18 +++---
 arch/mips/ath25/ar2315.c                      |  9 +--
 arch/mips/ath25/ar5312.c                      |  9 +--
 arch/mips/bcm63xx/irq.c                       | 38 +++++-------
 arch/mips/cobalt/irq.c                        | 14 ++---
 arch/mips/dec/setup.c                         | 59 ++++++++-----------
 arch/mips/emma/markeins/irq.c                 | 20 +++----
 arch/mips/include/asm/sni.h                   |  2 +-
 arch/mips/jazz/irq.c                          | 12 +---
 arch/mips/kernel/cevt-bcm1480.c               | 11 +---
 arch/mips/kernel/cevt-ds1287.c                |  9 +--
 arch/mips/kernel/cevt-gt641xx.c               |  9 +--
 arch/mips/kernel/cevt-r4k.c                   |  4 +-
 arch/mips/kernel/cevt-sb1250.c                | 11 +---
 arch/mips/kernel/cevt-txx9.c                  | 11 +---
 arch/mips/kernel/i8253.c                      | 10 +---
 arch/mips/kernel/rtlx-mt.c                    |  8 +--
 arch/mips/kernel/smp.c                        | 33 ++++-------
 arch/mips/lasat/interrupt.c                   | 10 +---
 arch/mips/loongson2ef/common/bonito-irq.c     |  9 +--
 .../loongson2ef/common/cs5536/cs5536_mfgpt.c  | 10 +---
 arch/mips/loongson2ef/fuloong-2e/irq.c        | 14 ++---
 arch/mips/loongson2ef/lemote-2f/irq.c         | 20 ++-----
 arch/mips/loongson32/common/irq.c             | 21 ++++---
 arch/mips/loongson32/common/time.c            | 12 ++--
 arch/mips/loongson64/hpet.c                   | 10 +---
 arch/mips/mti-malta/malta-int.c               | 10 +---
 arch/mips/netlogic/xlr/fmn.c                  |  9 +--
 arch/mips/pmcs-msp71xx/msp_irq.c              | 28 ++++-----
 arch/mips/pmcs-msp71xx/msp_smp.c              | 22 ++-----
 arch/mips/pmcs-msp71xx/msp_time.c             |  7 ++-
 arch/mips/ralink/cevt-rt3352.c                | 17 +++---
 arch/mips/sgi-ip22/ip22-eisa.c                |  8 +--
 arch/mips/sgi-ip22/ip22-int.c                 | 49 +++++----------
 arch/mips/sgi-ip32/ip32-irq.c                 | 18 ++----
 arch/mips/sni/a20r.c                          |  4 +-
 arch/mips/sni/irq.c                           |  8 +--
 arch/mips/sni/pcit.c                          |  8 ++-
 arch/mips/sni/rm200.c                         | 23 +++-----
 arch/mips/sni/time.c                          | 10 +---
 arch/mips/vr41xx/common/irq.c                 |  9 +--
 arch/parisc/kernel/irq.c                      | 21 ++-----
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 10 +---
 arch/powerpc/platforms/8xx/cpm1.c             |  9 +--
 arch/powerpc/platforms/8xx/m8xx_setup.c       |  9 +--
 arch/powerpc/platforms/chrp/setup.c           | 14 ++---
 arch/powerpc/platforms/powermac/pic.c         | 31 ++++------
 arch/powerpc/platforms/powermac/smp.c         |  9 +--
 arch/s390/kernel/irq.c                        |  8 +--
 arch/sh/boards/mach-cayman/irq.c              | 18 ++----
 arch/sh/drivers/dma/dma-pvr2.c                |  9 +--
 arch/unicore32/kernel/time.c                  | 11 +---
 arch/x86/kernel/irqinit.c                     | 18 +++---
 arch/x86/kernel/time.c                        | 10 +---
 arch/xtensa/kernel/smp.c                      |  8 +--
 arch/xtensa/kernel/time.c                     | 10 +---
 drivers/clocksource/bcm2835_timer.c           |  8 +--
 drivers/clocksource/bcm_kona_timer.c          | 10 +---
 drivers/clocksource/dw_apb_timer.c            | 11 +---
 drivers/clocksource/exynos_mct.c              | 12 ++--
 drivers/clocksource/mxs_timer.c               | 10 +---
 drivers/clocksource/nomadik-mtu.c             | 11 +---
 drivers/clocksource/samsung_pwm_timer.c       | 12 ++--
 drivers/clocksource/timer-atlas7.c            | 50 ++++++++--------
 drivers/clocksource/timer-cs5535.c            | 10 +---
 drivers/clocksource/timer-efm32.c             | 10 +---
 drivers/clocksource/timer-fsl-ftm.c           | 10 +---
 drivers/clocksource/timer-imx-gpt.c           | 10 +---
 drivers/clocksource/timer-integrator-ap.c     | 11 +---
 drivers/clocksource/timer-meson6.c            | 11 +---
 drivers/clocksource/timer-orion.c             |  9 +--
 drivers/clocksource/timer-prima2.c            | 11 +---
 drivers/clocksource/timer-pxa.c               | 10 +---
 drivers/clocksource/timer-sp804.c             | 11 +---
 drivers/clocksource/timer-u300.c              |  9 +--
 drivers/clocksource/timer-vf-pit.c            | 10 +---
 drivers/clocksource/timer-vt8500.c            | 11 +---
 drivers/clocksource/timer-zevio.c             | 13 ++--
 drivers/irqchip/irq-i8259.c                   |  9 +--
 drivers/irqchip/irq-ingenic.c                 | 11 ++--
 drivers/parisc/eisa.c                         |  8 +--
 drivers/s390/cio/airq.c                       |  8 +--
 drivers/s390/cio/cio.c                        |  8 +--
 include/linux/dw_apb_timer.h                  |  1 -
 include/linux/irq.h                           |  2 -
 kernel/irq/manage.c                           | 44 --------------
 126 files changed, 528 insertions(+), 1117 deletions(-)


base-commit: v5.6-rc1
-- 
2.25.1

