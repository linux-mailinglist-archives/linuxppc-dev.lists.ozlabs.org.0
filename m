Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE768E123
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:28:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBCqF4lbBz3f3r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 06:28:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dtjIj0+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dtjIj0+J;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB59x463rz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 01:29:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675780181; x=1707316181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=slc0KZtNoZ1bsJm/e5gBRrLuxfQ5uLgrlphY9y9ttTg=;
  b=dtjIj0+JqNBizSEf7k1qwn1JnWaqCLdHmZ50jG0OkFJviAtZQWvU7jg3
   B4B6ib/mzYyeRAoMTazp/+Qa33LqAdMGFCM3+wqhiqX2ysgdr4NI965vN
   mzwHR+e76irsOICrHfzfXZkiRGYy5x9cNmnOqTkCOC6VwC+eLFUagjiL6
   xFijSd2MPnZmGgGA9AffisNQslZ31jFHh2bJGUoXSoj5a5+7HFFkinqwS
   cyhIiY1Tf4UgRrBIAhUM1O/LPP7N7L7LkFsK1a4pQHDgJzzKVKKQQjzLY
   huWgZ5DtpwO8A4bfoZtzUVufdkJidSyry5DS11ia95XSeG10MZOVMFtEd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313163895"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="313163895"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 06:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644465265"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="644465265"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 07 Feb 2023 06:29:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 95C3D1C5; Tue,  7 Feb 2023 16:30:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Devarsh Thakkar <devarsht@ti.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	linux-arch@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 00/12] gpiolib cleanups
Date: Tue,  7 Feb 2023 16:29:40 +0200
Message-Id: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Feb 2023 06:27:18 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Eric Dumazet <edumazet@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Alex Shi <alexs@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Yanteng Si <siyanteng@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Kalle Valo <kvalo@kernel.org>, Hante Meuleman <hante.meuleman@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Franky Lin <franky.lin@broadcom.com>, Arend
  van Spriel <aspriel@gmail.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, Keerthy <j-keerthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Li Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are some older patches Arnd did last year, rebased to
linux-next-20230207. On top there are Andy's patches regarding
similar topic.

The main goal is to remove some of the legacy bits of the gpiolib
interfaces, where the corner cases are easily avoided or replaced
with gpio descriptor based interfaces.

Changes in v3:
- reworked touchscreen patch in accordance with Dmitry's comments
- rebased on the latest Linux Next
- added on top Andy's series

Changes in v2:
- dropped patch 8 after Andy's identical patch was merged
- rebase on latest gpio tree
- leave unused gpio_cansleep() in place for now
- address feedback from Andy Shevchenko

Andy Shevchenko (5):
  gpio: aggregator: Add missing header(s)
  gpiolib: Drop unused forward declaration from driver.h
  gpiolib: Deduplicate forward declarations in consumer.h
  gpiolib: Group forward declarations in consumer.h
  gpiolib: Clean up headers

Arnd Bergmann (7):
  gpiolib: remove empty asm/gpio.h files
  gpiolib: coldfire: remove custom asm/gpio.h
  gpiolib: remove asm-generic/gpio.h
  gpiolib: remove gpio_set_debounce
  gpiolib: remove legacy gpio_export
  gpiolib: split linux/gpio/driver.h out of linux/gpio.h
  gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h

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
 arch/arm/mach-s3c/s3c64xx.c                   |   1 +
 arch/arm/mach-sa1100/assabet.c                |   1 +
 arch/arm/plat-orion/gpio.c                    |   1 +
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
 drivers/gpio/gpiolib-acpi.c                   |  10 +-
 drivers/gpio/gpiolib-acpi.h                   |   1 -
 drivers/gpio/gpiolib-of.c                     |   9 +-
 drivers/gpio/gpiolib-of.h                     |   1 -
 drivers/gpio/gpiolib-swnode.c                 |   5 +-
 drivers/gpio/gpiolib-sysfs.c                  |  25 ++-
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/input/touchscreen/ads7846.c           |  24 +--
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  10 +-
 drivers/net/ieee802154/ca8210.c               |   3 +-
 .../broadcom/brcm80211/brcmsmac/led.c         |   1 +
 drivers/pinctrl/core.c                        |   1 -
 drivers/soc/fsl/qe/gpio.c                     |   2 +-
 include/asm-generic/gpio.h                    | 147 ------------------
 include/linux/gpio.h                          | 100 +++++++-----
 include/linux/gpio/consumer.h                 |  24 +--
 include/linux/gpio/driver.h                   |  31 +++-
 .../legacy-of-mm-gpiochip.h}                  |  33 +---
 include/linux/mfd/ucb1x00.h                   |   1 +
 include/linux/of_gpio.h                       |  21 ---
 53 files changed, 223 insertions(+), 549 deletions(-)
 delete mode 100644 arch/arm/include/asm/gpio.h
 delete mode 100644 arch/m68k/include/asm/gpio.h
 delete mode 100644 arch/sh/include/asm/gpio.h
 delete mode 100644 include/asm-generic/gpio.h
 copy include/linux/{of_gpio.h => gpio/legacy-of-mm-gpiochip.h} (50%)

-- 
2.39.1

