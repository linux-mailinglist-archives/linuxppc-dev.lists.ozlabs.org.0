Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B416843D6F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkTk4124z3cR1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:52:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a1C0lJ0g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a1C0lJ0g; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhP54fFcz2xDH;
 Thu, 28 Oct 2021 08:18:01 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id j2so9012433lfg.3;
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HanWLUgUF9ofZz0QDrpGI0FWc48M0ufWpqHp0nt1b2E=;
 b=a1C0lJ0gvckIcvrduJKizBVznyKnv2//TCPoPAKkXD5DGkkQrqb/ViKHcln36NfZVY
 ISxWYKFK39QVsDuVPSlu1LT5SZ/nBBGFDz/uufiZqdO/sZQ/qKfQbI2KUPqf8Q5RxkHA
 MqrWECpWx+g/FtcgYyau3zztbhU+vtw2w2aCc+udZXZ6rXXp+WIwUtGzuFURsYXqbmre
 UplyFnSR1G34j0+8EfYoJdUe8oXvIadmEQEw4Cs4f6QOILfUENf3Exk7blXkIQnIkrzz
 fkcmzAmhEcuM9KSNxc0P3MxX2C8tZcNnFx2+J321vEf5QsS8Rq276nN8ZpOlB8JNgrdd
 UeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HanWLUgUF9ofZz0QDrpGI0FWc48M0ufWpqHp0nt1b2E=;
 b=MwfqU6T6s4oWi0Ri8ZHj9n2h49jdhhw8Ar191HfcTg1c+ZY1B0vCMvS0lqERx/bgnI
 mMM832kTr2nTUkxnmmjXmeQTse2aKFvAOU5pYr0dT+SDM7oXEhDLSSlKZqvbc2wfUAHe
 lIpdlJb+unCp76gaKQJKmhCDSntFxubbuE/jn+/K3B/Y861UyuN4+eCmvzhiTXoGkLZq
 xsbzFzjLnb+t9g1/Y8D3Lhk5x6xfz34WNc6XrxKY9R+sVdHCZh+WSwXhOZfUVYJn0ki2
 CpLM/nrnkP37+UImhM9T2cKRIsKVB3vOylHA07Hz8d6hOeef+HRQH29HfSB+EzGV+Pe5
 wWUw==
X-Gm-Message-State: AOAM531I/ykWlgXBetaCUuSRcdeC7a33Dmv4QUTY7cDtgXw4gDnGbpUM
 Md8k3Wf6+8hc9rBR2wEiaAA=
X-Google-Smtp-Source: ABdhPJwziuHQfMqUpY6gmZyMY580K8cBL+Vix4M/+v/UKEXvEr1gkREZREaCQS2oC15RMdaQR1Q4+A==
X-Received: by 2002:a05:6512:31a:: with SMTP id
 t26mr121977lfp.280.1635369472536; 
 Wed, 27 Oct 2021 14:17:52 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:52 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 00/45] Introduce power-off+restart call chain API
Date: Thu, 28 Oct 2021 00:16:30 +0300
Message-Id: <20211027211715.12671-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:51:48 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-sh@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-acpi@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Problem
-------

SoC devices require power-off call chaining functionality from kernel.
We have a widely used restart chaining provided by restart notifier API,
but nothing for power-off.

Solution
--------

Introduce new API that provides both restart and power-off call chains.

Why combine restart with power-off? Because drivers often do both.
More practical to have API that provides both under the same roof.

The new API is designed with simplicity and extensibility in mind.
It's built upon the existing restart and reboot APIs. The simplicity
is in new helper functions that are convenient for drivers. The
extensibility is in the design that doesn't hardcode callback
arguments, making easy to add new parameters and remove old.

This is a third attempt to introduce the new API. First was made by
Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
In fact the work didn't stop and recently arm_pm_restart() was removed
from v5.14 kernel, which was a part of preparatory work started by
Guenter Roeck. I took into account experience and ideas from the
previous attempts, extended and polished them.

Adoption plan
-------------

This patchset introduces the new API. It also converts multiple drivers
and arch code to the new API to demonstrate how it all looks in practice.

The plan is:

1. Merge new API (patches 1-8). This API will co-exist with the old APIs.

2. Convert arch code to do_kernel_power_off() (patches 9-21).

3. Convert drivers and platform code to the new API.

4. Remove obsolete pm_power_off and pm_power_off_prepare variables.

5. Make restart-notifier API private to kernel/reboot.c once no users left.

Results
-------

1. Devices can be powered off properly.

2. Global variables are removed from drivers.

3. Global pm_power_off and pm_power_off_prepare callback variables are
removed once all users are converted to the new API. The latter callback
is removed by patch #25 of this series.

4. Ambiguous call chain ordering is prohibited. See patch #5 which adds
verification of restart handlers priorities, ensuring that they are unique.

Changelog:

v2: - Replaced standalone power-off call chain demo-API with the combined
      power-off+restart API because this is what drivers want. It's a more
      comprehensive solution.

    - Converted multiple drivers and arch code to the new API. Suggested by
      Andy Shevchenko. I skimmed through the rest of drivers, verifying that
      new API suits them. The rest of the drivers will be converted once we
      will settle on the new API, otherwise will be too many patches here.

    - v2 API doesn't expose notifier to users and require handlers to
      have unique priority. Suggested by Guenter Roeck.

    - v2 API has power-off chaining disabled by default and require
      drivers to explicitly opt-in to the chaining. This preserves old
      behaviour for existing drivers once they are converted to the new
      API.

Dmitry Osipenko (45):
  notifier: Remove extern annotation from function prototypes
  notifier: Add blocking_notifier_call_chain_empty()
  notifier: Add atomic/blocking_notifier_has_unique_priority()
  reboot: Correct typo in a comment
  reboot: Warn if restart handler has duplicated priority
  reboot: Warn if unregister_restart_handler() fails
  reboot: Remove extern annotation from function prototypes
  kernel: Add combined power-off+restart handler call chain API
  xen/x86: Use do_kernel_power_off()
  ARM: Use do_kernel_power_off()
  arm64: Use do_kernel_power_off()
  csky: Use do_kernel_power_off()
  ia64: Use do_kernel_power_off()
  mips: Use do_kernel_power_off()
  nds32: Use do_kernel_power_off()
  parisc: Use do_kernel_power_off()
  powerpc: Use do_kernel_power_off()
  riscv: Use do_kernel_power_off()
  sh: Use do_kernel_power_off()
  x86: Use do_kernel_power_off()
  m68k: Switch to new power-handler API
  memory: emif: Use kernel_can_power_off()
  ACPI: power: Switch to power-handler API
  regulator: pfuze100: Use devm_register_power_handler()
  reboot: Remove pm_power_off_prepare()
  soc/tegra: pmc: Utilize power-handler API to power off Nexus 7
    properly
  mfd: ntxec: Use devm_register_power_handler()
  mfd: rn5t618: Use devm_register_power_handler()
  mfd: acer-a500: Use devm_register_power_handler()
  mfd: ene-kb3930: Use devm_register_power_handler()
  mfd: axp20x: Use register_simple_power_off_handler()
  mfd: retu: Use devm_register_simple_power_off_handler()
  mfd: rk808: Use devm_register_simple_power_off_handler()
  mfd: palmas: Use devm_register_simple_power_off_handler()
  mfd: max8907: Use devm_register_simple_power_off_handler()
  mfd: tps6586x: Use devm_register_simple_power_off_handler()
  mfd: tps65910: Use devm_register_simple_power_off_handler()
  mfd: max77620: Use devm_register_simple_power_off_handler()
  mfd: dm355evm_msp: Use devm_register_trivial_power_off_handler()
  mfd: twl4030: Use devm_register_trivial_power_off_handler()
  mfd: ab8500: Use devm_register_trivial_power_off_handler()
  reset: ath79: Use devm_register_simple_restart_handler()
  reset: intel-gw: Use devm_register_simple_restart_handler()
  reset: lpc18xx: Use devm_register_prioritized_restart_handler()
  reset: npcm: Use devm_register_prioritized_restart_handler()

 arch/arm/kernel/reboot.c               |   4 +-
 arch/arm64/kernel/process.c            |   3 +-
 arch/csky/kernel/power.c               |   6 +-
 arch/ia64/kernel/process.c             |   4 +-
 arch/m68k/emu/natfeat.c                |   3 +-
 arch/m68k/include/asm/machdep.h        |   1 -
 arch/m68k/kernel/process.c             |   5 +-
 arch/m68k/kernel/setup_mm.c            |   1 -
 arch/m68k/kernel/setup_no.c            |   1 -
 arch/m68k/mac/config.c                 |   4 +-
 arch/mips/kernel/reset.c               |   3 +-
 arch/nds32/kernel/process.c            |   3 +-
 arch/parisc/kernel/process.c           |   4 +-
 arch/powerpc/kernel/setup-common.c     |   4 +-
 arch/powerpc/xmon/xmon.c               |   3 +-
 arch/riscv/kernel/reset.c              |  12 +-
 arch/sh/kernel/reboot.c                |   3 +-
 arch/x86/kernel/reboot.c               |   4 +-
 arch/x86/xen/enlighten_pv.c            |   4 +-
 drivers/acpi/sleep.c                   |  25 +-
 drivers/memory/emif.c                  |   2 +-
 drivers/mfd/ab8500-sysctrl.c           |  17 +-
 drivers/mfd/acer-ec-a500.c             |  52 +--
 drivers/mfd/axp20x.c                   |  22 +-
 drivers/mfd/dm355evm_msp.c             |  20 +-
 drivers/mfd/ene-kb3930.c               |  45 +-
 drivers/mfd/max77620.c                 |  21 +-
 drivers/mfd/max8907.c                  |  22 +-
 drivers/mfd/ntxec.c                    |  50 +-
 drivers/mfd/palmas.c                   |  24 +-
 drivers/mfd/retu-mfd.c                 |  31 +-
 drivers/mfd/rk808.c                    |  23 +-
 drivers/mfd/rn5t618.c                  |  56 +--
 drivers/mfd/tps6586x.c                 |  21 +-
 drivers/mfd/tps65910.c                 |  17 +-
 drivers/mfd/twl4030-power.c            |  10 +-
 drivers/regulator/pfuze100-regulator.c |  39 +-
 drivers/reset/reset-ath79.c            |  15 +-
 drivers/reset/reset-intel-gw.c         |  13 +-
 drivers/reset/reset-lpc18xx.c          |  14 +-
 drivers/reset/reset-npcm.c             |  14 +-
 drivers/soc/tegra/pmc.c                |  54 ++-
 include/linux/mfd/axp20x.h             |   1 +
 include/linux/notifier.h               |  37 +-
 include/linux/pm.h                     |   1 -
 include/linux/reboot.h                 | 216 ++++++++-
 kernel/notifier.c                      |  88 ++++
 kernel/power/hibernate.c               |   2 +-
 kernel/reboot.c                        | 615 ++++++++++++++++++++++++-
 49 files changed, 1209 insertions(+), 430 deletions(-)

-- 
2.33.1

