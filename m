Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3368FA6F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:52:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwH21zBzz3fDl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 09:51:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nm21+t5n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nm21+t5n;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnD34bc7z2ymk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:33:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877635; x=1707413635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Dq4mU58s7wFVOS4xMQ0zOI9I/hT6Ikw0b7RarExmhA=;
  b=nm21+t5n8owEXuOtkBTTEAn8+reV39uurwKVZZaqGD3LVOPAfJLr2BUl
   0F9PYv9qZtgjTpAEBrecWIIQA/9bSxWoOJ3jFDD72ZllF57UZlVtxH4n7
   hW6kyO8KnJjqle5Ji01Z8IVLuMFI7Or7jDH96NCS9R9HxR+HHHj4T6Ubl
   Boor0Z1bhQsEqziH7Iz2Ktv+YCw5+Y+2p3asTCjffS43fVqrCkO4P9lWZ
   zwA1ccQ1fRAno9gcfu8Ylwu+2bxh/dNQribhfGoF/i1+ySd3f8ooDbYrt
   ER4is7PwvFhnzmYx5i2jw20C9oXV6JJVWszOgiONKZTvfFVCtG7MY7OEc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="327564231"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="327564231"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644939054"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644939054"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 09:33:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CF9FB299; Wed,  8 Feb 2023 19:33:47 +0200 (EET)
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
Subject: [PATCH v4 06/18] gpiolib: coldfire: remove custom asm/gpio.h
Date: Wed,  8 Feb 2023 19:33:31 +0200
Message-Id: <20230208173343.37582-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
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

From: Arnd Bergmann <arnd@arndb.de>

Now that coldfire is the only user of a custom asm/gpio.h, it seems
better to remove this as well, and have the same interface everywhere.

For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
functions, the custom version is only a micro-optimization to inline the
function for constant GPIO numbers. However, in the coldfire defconfigs,
I was unable to find a single instance where this micro-optimization
was even used, and according to Geert the only user appears to be the
QSPI chip that is disabled everywhere.

The custom gpio_request_one() function is even less useful, as it is
guarded by an #ifdef that is never true.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/m68k/Kconfig.cpu        |  1 -
 arch/m68k/include/asm/gpio.h | 95 ------------------------------------
 drivers/gpio/Kconfig         |  8 ---
 include/linux/gpio.h         |  7 ---
 4 files changed, 111 deletions(-)
 delete mode 100644 arch/m68k/include/asm/gpio.h

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 9380f6e3bb66..96a0fb4f1af5 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -24,7 +24,6 @@ config M68KCLASSIC
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
-	select ARCH_HAVE_CUSTOM_GPIO_H
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_CAS
 	select CPU_HAS_NO_MULDIV64
diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
deleted file mode 100644
index 5cfc0996ba94..000000000000
--- a/arch/m68k/include/asm/gpio.h
+++ /dev/null
@@ -1,95 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Coldfire generic GPIO support
- *
- * (C) Copyright 2009, Steven King <sfking@fdwdc.com>
-*/
-
-#ifndef coldfire_gpio_h
-#define coldfire_gpio_h
-
-#include <linux/io.h>
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfgpio.h>
-/*
- * The Generic GPIO functions
- *
- * If the gpio is a compile time constant and is one of the Coldfire gpios,
- * use the inline version, otherwise dispatch thru gpiolib.
- */
-
-static inline int gpio_get_value(unsigned gpio)
-{
-	if (__builtin_constant_p(gpio) && gpio < MCFGPIO_PIN_MAX)
-		return mcfgpio_read(__mcfgpio_ppdr(gpio)) & mcfgpio_bit(gpio);
-	else
-		return __gpio_get_value(gpio);
-}
-
-static inline void gpio_set_value(unsigned gpio, int value)
-{
-	if (__builtin_constant_p(gpio) && gpio < MCFGPIO_PIN_MAX) {
-		if (gpio < MCFGPIO_SCR_START) {
-			unsigned long flags;
-			MCFGPIO_PORTTYPE data;
-
-			local_irq_save(flags);
-			data = mcfgpio_read(__mcfgpio_podr(gpio));
-			if (value)
-				data |= mcfgpio_bit(gpio);
-			else
-				data &= ~mcfgpio_bit(gpio);
-			mcfgpio_write(data, __mcfgpio_podr(gpio));
-			local_irq_restore(flags);
-		} else {
-			if (value)
-				mcfgpio_write(mcfgpio_bit(gpio),
-						MCFGPIO_SETR_PORT(gpio));
-			else
-				mcfgpio_write(~mcfgpio_bit(gpio),
-						MCFGPIO_CLRR_PORT(gpio));
-		}
-	} else
-		__gpio_set_value(gpio, value);
-}
-
-static inline int gpio_to_irq(unsigned gpio)
-{
-#if defined(MCFGPIO_IRQ_MIN)
-	if ((gpio >= MCFGPIO_IRQ_MIN) && (gpio < MCFGPIO_IRQ_MAX))
-#else
-	if (gpio < MCFGPIO_IRQ_MAX)
-#endif
-		return gpio + MCFGPIO_IRQ_VECBASE;
-	else
-		return __gpio_to_irq(gpio);
-}
-
-static inline int gpio_cansleep(unsigned gpio)
-{
-	return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);
-}
-
-#ifndef CONFIG_GPIOLIB
-static inline int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
-{
-	int err;
-
-	err = gpio_request(gpio, label);
-	if (err)
-		return err;
-
-	if (flags & GPIOF_DIR_IN)
-		err = gpio_direction_input(gpio);
-	else
-		err = gpio_direction_output(gpio,
-			(flags & GPIOF_INIT_HIGH) ? 1 : 0);
-
-	if (err)
-		gpio_free(gpio);
-
-	return err;
-}
-#endif /* !CONFIG_GPIOLIB */
-#endif
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 218d7e4c27ff..06a268d56800 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -3,14 +3,6 @@
 # GPIO infrastructure and drivers
 #
 
-config ARCH_HAVE_CUSTOM_GPIO_H
-	bool
-	help
-	  Selecting this config option from the architecture Kconfig allows
-	  the architecture to provide a custom asm/gpio.h implementation
-	  overriding the default implementations.  New uses of this are
-	  strongly discouraged.
-
 menuconfig GPIOLIB
 	bool "GPIO Support"
 	help
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 85beb236c925..2b75017b3aad 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -54,11 +54,6 @@ struct gpio {
 };
 
 #ifdef CONFIG_GPIOLIB
-
-#ifdef CONFIG_ARCH_HAVE_CUSTOM_GPIO_H
-#include <asm/gpio.h>
-#else
-
 #include <asm-generic/gpio.h>
 
 static inline int gpio_get_value(unsigned int gpio)
@@ -81,8 +76,6 @@ static inline int gpio_to_irq(unsigned int gpio)
 	return __gpio_to_irq(gpio);
 }
 
-#endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
-
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
 
 struct device;
-- 
2.39.1

