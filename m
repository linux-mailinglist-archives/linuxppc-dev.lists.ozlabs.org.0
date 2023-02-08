Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 311AA68FADB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:05:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwZK72KLz3f5q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 10:05:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NypPztbd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NypPztbd;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnDW6Dbnz3c83
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:34:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877660; x=1707413660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+wJ1YEr+a1gEPzvL6ED5LpiCM/LRrff7/mLXvqmfqJk=;
  b=NypPztbdorbt4g8SB3BuCnLdzf63SoWbi1QVnF2lzvRMWB51p/9INEgi
   Xz1RWEHptdHPAS9i0p2lErk6Y0am0yHqbF4hp0H1f8rRdCLqqWiPbqgKl
   TrvEdpkf2G14mXG2G/scaSUNDIJovyKz93xuDKN8cNGz0aeK8W7vDbru9
   hyg2/cwYnPNpFUpKGsTlMovLJt1PVxDq9tBZC804DQxLhmFKCdXqdxDtW
   PE7WLcDhXcisqIRZyX7vCtze9jrvL3aLOCKcsszfu/utq0ktd6LDxVXk9
   1n2HoJo/pO0zD5+JUxNCIhxWbS0ulu30ZlOvG362gn5XMcLveqZu1/yY1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225709"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225709"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660704004"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="660704004"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 09:33:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 95C0B612; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
Subject: [PATCH v4 18/18] gpiolib: Clean up headers
Date: Wed,  8 Feb 2023 19:33:43 +0200
Message-Id: <20230208173343.37582-19-andriy.shevchenko@linux.intel.com>
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

There is a few things done:
- include only the headers we are direct user of
- when pointer is in use, provide a forward declaration
- add missing headers
- group generic headers and subsystem headers
- sort each group alphabetically

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c   | 10 ++++++----
 drivers/gpio/gpiolib-acpi.h   |  1 -
 drivers/gpio/gpiolib-of.c     |  6 ++++--
 drivers/gpio/gpiolib-of.h     |  1 -
 drivers/gpio/gpiolib-swnode.c |  5 +++--
 drivers/gpio/gpiolib-sysfs.c  | 21 ++++++++++++++++-----
 drivers/gpio/gpiolib.c        |  9 ++++++---
 include/linux/gpio.h          | 10 ++++------
 include/linux/gpio/consumer.h | 14 ++++++++++----
 include/linux/gpio/driver.h   | 30 +++++++++++++++++++++++-------
 10 files changed, 72 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index bb583cea366c..3871dade186a 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -7,17 +7,19 @@
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/errno.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio/machine.h>
 #include <linux/export.h>
-#include <linux/acpi.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/mutex.h>
 #include <linux/pinctrl/pinctrl.h>
 
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+
 #include "gpiolib.h"
 #include "gpiolib-acpi.h"
 
diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index 5fa315b3c912..a6f3be0bb921 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -9,7 +9,6 @@
 #define GPIOLIB_ACPI_H
 
 #include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/types.h>
 
 #include <linux/gpio/consumer.h>
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0f699af438b0..1436cdb5fa26 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -10,14 +10,16 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/module.h>
 #include <linux/io.h>
-#include <linux/gpio/consumer.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
+#include <linux/string.h>
+
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 
 #include "gpiolib.h"
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index e5bb065d82ef..6b3a5347c5d9 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -4,7 +4,6 @@
 #define GPIOLIB_OF_H
 
 #include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/types.h>
 
 #include <linux/notifier.h>
diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index dd9ccac214d1..b5a6eaf3729b 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -6,13 +6,14 @@
  */
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
 #include <linux/kernel.h>
 #include <linux/printk.h>
 #include <linux/property.h>
 #include <linux/string.h>
 
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+
 #include "gpiolib.h"
 #include "gpiolib-swnode.h"
 
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 6e4267944f80..c1cbf71329f0 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -1,18 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitops.h>
+#include <linux/device.h>
 #include <linux/idr.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kdev_t.h>
+#include <linux/kstrtox.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
-#include <linux/device.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
+
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
-#include <linux/kdev_t.h>
-#include <linux/slab.h>
-#include <linux/ctype.h>
 
 #include "gpiolib.h"
 #include "gpiolib-sysfs.h"
 
+struct kernfs_node;
+
 #define GPIO_IRQF_TRIGGER_NONE		0
 #define GPIO_IRQF_TRIGGER_FALLING	BIT(0)
 #define GPIO_IRQF_TRIGGER_RISING	BIT(1)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 99a2c77c3711..900f6573c070 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -6,22 +6,25 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/file.h>
 #include <linux/fs.h>
-#include <linux/gpio.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio/machine.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib-acpi.h"
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index a86953696e47..8528353e073b 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -12,9 +12,10 @@
 #ifndef __LINUX_GPIO_H
 #define __LINUX_GPIO_H
 
-#include <linux/errno.h>
 #include <linux/types.h>
 
+struct device;
+
 /* see Documentation/driver-api/gpio/legacy.rst */
 
 /* make these flag values available regardless of GPIO kconfig options */
@@ -134,19 +135,16 @@ void gpio_free_array(const struct gpio *array, size_t num);
 
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
 
-struct device;
-
 int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
 
 #else /* ! CONFIG_GPIOLIB */
 
-#include <linux/bug.h>
 #include <linux/kernel.h>
 
-struct device;
-struct gpio_chip;
+#include <asm/bug.h>
+#include <asm/errno.h>
 
 static inline bool gpio_is_valid(int number)
 {
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 5432e5d5fbfb..1c4385a00f88 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,15 +3,14 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
-#include <linux/bug.h>
-#include <linux/compiler_types.h>
-#include <linux/err.h>
+#include <linux/types.h>
 
 struct acpi_device;
 struct device;
 struct fwnode_handle;
-struct gpio_desc;
+
 struct gpio_array;
+struct gpio_desc;
 
 /**
  * struct gpio_descs - Struct containing an array of descriptors that can be
@@ -185,8 +184,11 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #else /* CONFIG_GPIOLIB */
 
+#include <linux/err.h>
 #include <linux/kernel.h>
 
+#include <asm/bug.h>
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
@@ -616,6 +618,8 @@ struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char
 
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
+#include <linux/err.h>
+
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
@@ -647,6 +651,8 @@ void gpiod_unexport(struct gpio_desc *desc);
 
 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
+#include <asm/errno.h>
+
 static inline int gpiod_export(struct gpio_desc *desc,
 			       bool direction_may_change)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 262a84ce9bcb..5c6db5533be6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -2,27 +2,35 @@
 #ifndef __LINUX_GPIO_DRIVER_H
 #define __LINUX_GPIO_DRIVER_H
 
-#include <linux/device.h>
-#include <linux/irq.h>
+#include <linux/bits.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/irqhandler.h>
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/property.h>
+#include <linux/spinlock_types.h>
 #include <linux/types.h>
 
+#ifdef CONFIG_GENERIC_MSI_IRQ
 #include <asm/msi.h>
+#endif
 
-struct gpio_desc;
+struct device;
+struct irq_chip;
+struct irq_data;
+struct module;
 struct of_phandle_args;
+struct pinctrl_dev;
 struct seq_file;
-struct gpio_device;
-struct module;
-enum gpiod_flags;
-enum gpio_lookup_flags;
 
 struct gpio_chip;
+struct gpio_desc;
+struct gpio_device;
+
+enum gpio_lookup_flags;
+enum gpiod_flags;
 
 union gpio_irq_fwspec {
 	struct irq_fwspec	fwspec;
@@ -679,6 +687,10 @@ bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
 				struct irq_domain *domain);
 #else
+
+#include <asm/bug.h>
+#include <asm/errno.h>
+
 static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
 					      struct irq_domain *domain)
 {
@@ -756,6 +768,10 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
 #else /* CONFIG_GPIOLIB */
 
+#include <linux/err.h>
+
+#include <asm/bug.h>
+
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.39.1

