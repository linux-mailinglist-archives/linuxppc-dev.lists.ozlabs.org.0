Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F568FAD4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:02:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwWH0sq0z3fKV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 10:02:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzSDyfvz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzSDyfvz;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnDS4x5Nz2xYL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:34:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877656; x=1707413656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2JggXg7c02DPXLMJdm8s8NdvcTFU3e1l9o8DD11R0M=;
  b=JzSDyfvzE4ybxVGrKoDzCucGkImuqQDV/OwwPBRmUw+8FnNo3Srewxff
   kpgolXswnTS8AzMPHgNpDv4Ce8SGd6WnBA8RtU0CB0UIEmVJ5+ikFBDu2
   ksKYeBIYZSaJmRyhnKzXmMIlD7z/qEae+Cc/Jb3Y5rh4PdEMjvflhc236
   k8p0C8uFiUk/AFVnYRWK2BshIWc+/rYDCtCITazWECUa3AZIigU+8MgXv
   T5M0OmE8FU84+b5SDxO8tQxVa3Es21rAG9Udds4knM7RKC1ubWr0HbJKX
   P5l+E3BSDcraUZacZ5J56xfRhMhq7m0prNvoxHSZI2S6oqZq9ucNAMxi3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225626"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225626"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660703988"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="660703988"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 09:33:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3C05D4BE; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
Subject: [PATCH v4 12/18] gpio: aggregator: Add missing header(s)
Date: Wed,  8 Feb 2023 19:33:37 +0200
Message-Id: <20230208173343.37582-13-andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Alex Shi <alexs@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Yanteng Si <siyanteng@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kalle Valo <kvalo@kernel.org>, Hante Meuleman <hante.meuleman@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mika Weste
 rberg <mika.westerberg@linux.intel.com>, Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, Keerthy <j-keerthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, "David S. Miller" <davem@davemloft.net>, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Do not imply that some of the generic headers may be always included.
Instead, include explicitly what we are direct user of.

While at it, drop unused linux/gpio.h and split out the GPIO group of
headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-aggregator.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 6d17d262ad91..20a686f12df7 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -10,19 +10,20 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/ctype.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio/machine.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+
 #define AGGREGATOR_MAX_GPIOS 512
 
 /*
-- 
2.39.1

