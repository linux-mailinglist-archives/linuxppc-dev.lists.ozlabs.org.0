Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA368FACC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwTF1PHDz3fS4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 10:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F1JXklPI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F1JXklPI;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnDM3f4qz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:34:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877651; x=1707413651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Loz5frdfBtc0l4PlP9rbgkvfnulxYbRlKr/4QRrkgw=;
  b=F1JXklPIJt1Rub1CS4HHZ/DEUdsd4ZnjLSed5q+1DUpNiUffetwy155f
   yyC4C6S9EsyBw1hddm0/BMgw0/WMDV2Wy9JeEX36HhPUHbmqoFobIEXNE
   1fj0YrfNnTxLnBqwOX0HFoT+usF8QqcxLybPNAIUPKiSBgy23gURskfE5
   l0SfoDZKbZ65N+HHvRkJ9L81SZTUah/LLjsXqh7G9E3cRZ0aXovSc6JWh
   edbYk3Dt1F/XOhkXvne2pKtkaLSyK4xkmLuC4sltAEhXRXLm1hPotoPr9
   hnGLv/bfDoPnq6DYuFJPdr/gSQiesLf2UVWzj96yneXk9Fmel1/QqCWvI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225485"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225485"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697723053"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="697723053"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 09:33:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F316D37D; Wed,  8 Feb 2023 19:33:47 +0200 (EET)
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
Subject: [PATCH v4 08/18] gpiolib: remove gpio_set_debounce()
Date: Wed,  8 Feb 2023 19:33:33 +0200
Message-Id: <20230208173343.37582-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

gpio_set_debounce() only has a single user, which is trivially
converted to gpiod_set_debounce().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/gpio/legacy.rst               |  2 --
 .../translations/zh_CN/driver-api/gpio/legacy.rst      |  1 -
 Documentation/translations/zh_TW/gpio.txt              |  1 -
 drivers/input/touchscreen/ads7846.c                    |  5 +++--
 include/linux/gpio.h                                   | 10 ----------
 5 files changed, 3 insertions(+), 16 deletions(-)

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
index 17f11bce8113..bb1058b1e7fd 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -27,6 +27,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
@@ -1012,8 +1013,8 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 		ts->gpio_pendown = pdata->gpio_pendown;
 
 		if (pdata->gpio_pendown_debounce)
-			gpio_set_debounce(pdata->gpio_pendown,
-					  pdata->gpio_pendown_debounce);
+			gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
+					   pdata->gpio_pendown_debounce);
 	} else {
 		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
 		return -EINVAL;
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index d5ce78e2bdd9..fc56733e8514 100644
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
@@ -214,11 +209,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
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

