Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1368FA7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwN72TTXz3fVl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 09:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jJjGQkMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jJjGQkMO;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnDB01Klz3cJC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:34:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877642; x=1707413642;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sDFh6JeR2XcTkYhVvLPcaBAq4Ze0UO0qz9+CSTh3saw=;
  b=jJjGQkMO/f/Ws46vZ5HLhM2pTLXwx2VOb/tK2s+ilnP7wz0uas+uImPs
   eqwx+PEwhExmK3JRk8Ol7+XANU9kfvLTjsrSHHW0MzOD8QJF7DstAOZnm
   5g0AeZ3miB8kRHVAKBOdxqngdhCeOXIH8ASyfuv5VVgC7gAYHunz0HRON
   Qe3LAqPdoTZ4gKh48BUUjv/SmQfcQqPpWHDbRZXV+m8nZm11n87Jpe8AJ
   GsTvEvjxFPVro97CX/oEJu70/+jEZz67q+HFp96p7Mj8WTEDZCb5sAoDr
   ADqgzSWjpVkMFRUSq7Ow6BCjxyQ2d6hmoGJl7mxutkDPnLicqnWjx+D0e
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225284"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225284"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697723002"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="697723002"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 09:33:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6543F1A6; Wed,  8 Feb 2023 19:33:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Michael Walle <michael@walle.cc>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc-tw-discuss@lists.sourceforge.net,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	linux-arch@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 00/18] gpiolib cleanups
Date: Wed,  8 Feb 2023 19:33:25 +0200
Message-Id: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:48:32 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Alex Shi <alexs@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Yanteng Si <siyanteng@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kalle Valo <kvalo@kernel.org>, Hante Meuleman <hante.meuleman@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Frank
 y Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, Keerthy <j-keerthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, "David S. Miller" <davem@davemloft.net>, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are some older patches Arnd did last year, rebased to
linux-next-20230208. On top there are Andy's patches regarding
similar topic. The series starts with Linus Walleij's patches.

The main goal is to remove some of the legacy bits of the gpiolib
interfaces, where the corner cases are easily avoided or replaced
with gpio descriptor based interfaces.

The idea is to get an immutable branch and route the whole series
via GPIO tree.

Changes in v4:
- incorporated Linus Walleij's patches
- reworked touchscreen patch to have bare minimum changes (Dmitry)
- described changes in gpio-aggregator in full (Geert)
- addressed compilation errors (LKP)
- added tags (Geert, Lee, Vincenzo)

Changes in v3:
- reworked touchscreen patch in accordance with Dmitry's comments
- rebased on the latest Linux Next
- added on top Andy's series

Changes in v2:
- dropped patch 8 after Andy's identical patch was merged
- rebase on latest gpio tree
- leave unused gpio_cansleep() in place for now
- address feedback from Andy Shevchenko

Andy Shevchenko (7):
  gpio: aggregator: Add missing header(s)
  gpio: reg: Add missing header(s)
  gpio: regmap: Add missing header(s)
  gpiolib: Drop unused forward declaration from driver.h
  gpiolib: Deduplicate forward declarations in consumer.h
  gpiolib: Group forward declarations in consumer.h
  gpiolib: Clean up headers

Arnd Bergmann (7):
  gpiolib: remove empty asm/gpio.h files
  gpiolib: coldfire: remove custom asm/gpio.h
  gpiolib: remove asm-generic/gpio.h
  gpiolib: remove gpio_set_debounce()
  gpiolib: remove legacy gpio_export()
  gpiolib: split linux/gpio/driver.h out of linux/gpio.h
  gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h

Linus Walleij (4):
  ARM: orion/gpio: Use the right include
  ARM: s3c24xx: Use the right include
  hte: tegra-194: Use proper includes
  gpiolib: Make the legacy <linux/gpio.h> consumer-only

 Documentation/admin-guide/gpio/sysfs.rst      |   2 +-
 Documentation/driver-api/gpio/legacy.rst      |  23 ---
 .../zh_CN/driver-api/gpio/legacy.rst          |  20 ---
 Documentation/translations/zh_TW/gpio.txt     |  19 ---
 MAINTAINERS                                   |   1 -
 arch/arm/Kconfig                              |   1 -
 arch/arm/include/asm/gpio.h                   |  21 ---
 arch/arm/mach-omap1/irq.c                     |   1 +
 arch/arm/mach-omap2/pdata-quirks.c            |   9 +-
 arch/arm/mach-orion5x/board-rd88f5182.c       |   1 +
 arch/arm/mach-s3c/s3c64xx.c                   |   2 +-
 arch/arm/mach-sa1100/assabet.c                |   1 +
 arch/arm/plat-orion/gpio.c                    |   5 +-
 arch/m68k/Kconfig.cpu                         |   1 -
 arch/m68k/include/asm/gpio.h                  |  95 -----------
 arch/m68k/include/asm/mcfgpio.h               |   2 +-
 arch/powerpc/platforms/44x/Kconfig            |   1 +
 arch/powerpc/platforms/4xx/gpio.c             |   2 +-
 arch/powerpc/platforms/8xx/Kconfig            |   1 +
 arch/powerpc/platforms/8xx/cpm1.c             |   2 +-
 arch/powerpc/platforms/Kconfig                |   2 +
 arch/powerpc/sysdev/cpm_common.c              |   2 +-
 arch/sh/Kconfig                               |   1 -
 arch/sh/boards/board-magicpanelr2.c           |   1 +
 arch/sh/boards/mach-ap325rxa/setup.c          |   7 +-
 arch/sh/include/asm/gpio.h                    |  45 ------
 drivers/gpio/Kconfig                          |  19 ++-
 drivers/gpio/TODO                             |  15 +-
 drivers/gpio/gpio-aggregator.c                |   9 +-
 drivers/gpio/gpio-altera.c                    |   2 +-
 drivers/gpio/gpio-davinci.c                   |   2 -
 drivers/gpio/gpio-mm-lantiq.c                 |   2 +-
 drivers/gpio/gpio-mpc5200.c                   |   2 +-
 drivers/gpio/gpio-reg.c                       |  12 +-
 drivers/gpio/gpio-regmap.c                    |  12 +-
 drivers/gpio/gpiolib-acpi.c                   |  10 +-
 drivers/gpio/gpiolib-acpi.h                   |   1 -
 drivers/gpio/gpiolib-of.c                     |   9 +-
 drivers/gpio/gpiolib-of.h                     |   1 -
 drivers/gpio/gpiolib-swnode.c                 |   5 +-
 drivers/gpio/gpiolib-sysfs.c                  |  25 ++-
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/hte/hte-tegra194-test.c               |  10 +-
 drivers/input/touchscreen/ads7846.c           |   5 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  10 +-
 drivers/net/ieee802154/ca8210.c               |   3 +-
 .../broadcom/brcm80211/brcmsmac/led.c         |   1 +
 drivers/pinctrl/core.c                        |   1 -
 drivers/soc/fsl/qe/gpio.c                     |   2 +-
 include/asm-generic/gpio.h                    | 147 ------------------
 include/linux/gpio.h                          | 104 ++++++++-----
 include/linux/gpio/consumer.h                 |  24 +--
 include/linux/gpio/driver.h                   |  31 +++-
 .../legacy-of-mm-gpiochip.h}                  |  33 +---
 include/linux/mfd/ucb1x00.h                   |   1 +
 include/linux/of_gpio.h                       |  21 ---
 56 files changed, 240 insertions(+), 556 deletions(-)
 delete mode 100644 arch/arm/include/asm/gpio.h
 delete mode 100644 arch/m68k/include/asm/gpio.h
 delete mode 100644 arch/sh/include/asm/gpio.h
 delete mode 100644 include/asm-generic/gpio.h
 copy include/linux/{of_gpio.h => gpio/legacy-of-mm-gpiochip.h} (50%)

-- 
2.39.1

