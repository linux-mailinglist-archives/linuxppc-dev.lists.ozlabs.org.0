Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527A68E13A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:31:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBCtH0HnCz3cfY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 06:31:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fzgy0PmY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fzgy0PmY;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB5B00XWvz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 01:29:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675780184; x=1707316184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7nNz03Wp2DuSzy1drxMZo+ycm4pzz0+FxjuOEGlypMU=;
  b=fzgy0PmY3OazE4K/umC2cgK2eCiVunhTbez15VZwYUizAcgkooqAxqpK
   q+IC2AQwuos/calRKQiTbhwJC7PamO5mcIGiiMmowsRTAD/9FAnPdC6Qc
   BUnsSIFipmT0I76ooEZ1N9ngCgauqybYKVKgVcQV5HrN/7nLrtfpblpGj
   eeA5LDr14BMUxL4yz+K3j6Gwyhjdny3XMtYam3NcF0Ob1y+vP7cqOSnmU
   X+FkcYrQWMZ1QeCChQb+/q0Rn3wfQH8dbueyqZLHoWgZmwbwPXpmb+s67
   qIBC6po0XGME782riZVDSudYdqL0gkjH47jHf5pTsqWjiIUrMas18Clq3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="391915646"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="391915646"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 06:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="912355057"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="912355057"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2023 06:29:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 660EF299; Tue,  7 Feb 2023 16:30:02 +0200 (EET)
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
Subject: [PATCH v3 04/12] gpiolib: remove gpio_set_debounce
Date: Tue,  7 Feb 2023 16:29:44 +0200
Message-Id: <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Arnd Bergmann <arnd@arndb.de>

gpio_set_debounce() only has a single user, which is trivially
converted to gpiod_set_debounce().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/gpio/legacy.rst      |  2 --
 .../zh_CN/driver-api/gpio/legacy.rst          |  1 -
 Documentation/translations/zh_TW/gpio.txt     |  1 -
 drivers/input/touchscreen/ads7846.c           | 24 ++++++++++++-------
 include/linux/gpio.h                          | 10 --------
 5 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index a0559d93efd1..e0306e78e34b 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -238,8 +238,6 @@ setup or driver probe/teardown code, so this is an easy constraint.)::
         ## 	gpio_free_array()
 
                 gpio_free()
-                gpio_set_debounce()
-
 
 
 Claiming and Releasing GPIOs
diff --git a/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst b/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
index 74fa473bb504..dee2a0517c1c 100644
--- a/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
+++ b/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
@@ -219,7 +219,6 @@ GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其
         ## 	gpio_free_array()
 
                 gpio_free()
-                gpio_set_debounce()
 
 
 
diff --git a/Documentation/translations/zh_TW/gpio.txt b/Documentation/translations/zh_TW/gpio.txt
index 1b986bbb0909..dc608358d90a 100644
--- a/Documentation/translations/zh_TW/gpio.txt
+++ b/Documentation/translations/zh_TW/gpio.txt
@@ -226,7 +226,6 @@ GPIO 值的命令需要等待其信息排到隊首才發送命令，再獲得其
 ## 	gpio_free_array()
 
 	gpio_free()
-	gpio_set_debounce()
 
 
 
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 17f11bce8113..a9a4a7f7d315 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -25,8 +25,8 @@
 #include <linux/slab.h>
 #include <linux/pm.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
@@ -999,7 +999,6 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 	if (pdata->get_pendown_state) {
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else if (gpio_is_valid(pdata->gpio_pendown)) {
-
 		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
 					    GPIOF_IN, "ads7846_pendown");
 		if (err) {
@@ -1010,14 +1009,21 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 		}
 
 		ts->gpio_pendown = pdata->gpio_pendown;
-
-		if (pdata->gpio_pendown_debounce)
-			gpio_set_debounce(pdata->gpio_pendown,
-					  pdata->gpio_pendown_debounce);
 	} else {
-		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
-		return -EINVAL;
+		struct gpio_desc *desc;
+
+		desc = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
+		if (IS_ERR(desc)) {
+			dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
+			return PTR_ERR(desc);
+		}
+		gpiod_set_consumer_name(desc, "ads7846_pendown");
+
+		ts->gpio_pendown = desc_to_gpio(desc);
 	}
+	if (pdata->gpio_pendown_debounce)
+		gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
+				   pdata->gpio_pendown_debounce);
 
 	return 0;
 }
@@ -1194,7 +1200,7 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
 	pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
 			of_property_read_bool(node, "linux,wakeup");
 
-	pdata->gpio_pendown = of_get_named_gpio(dev->of_node, "pendown-gpio", 0);
+	pdata->gpio_pendown = -ENOENT;
 
 	return pdata;
 }
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 6719a82eeec5..220e8656f2ab 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -100,11 +100,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
 	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
 }
 
-static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
-{
-	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
-}
-
 static inline int gpio_get_value_cansleep(unsigned gpio)
 {
 	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
@@ -215,11 +210,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
 	return -ENOSYS;
 }
 
-static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
-{
-	return -ENOSYS;
-}
-
 static inline int gpio_get_value(unsigned gpio)
 {
 	/* GPIO can never have been requested or set as {in,out}put */
-- 
2.39.1

