Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3E68E15A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:37:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBD1J69zDz3fSd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 06:37:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xd3Qg6Ee;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xd3Qg6Ee;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB5BB27zkz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 01:29:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675780194; x=1707316194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YtyTSKv3igoWzjKzirfnsuSbOV1zJhPUEQxw+fpoykQ=;
  b=Xd3Qg6EeYgixa07QmHJ7pm1kSTYMia4mOZQMRh4KT1jYmlPOhAMHjnCe
   p0WxJNeNidbhqnxucidm3Rh6z6oFlSAoCzemWrNCN8ucda+wUWBnhrSBA
   MSO7WimaUAspl9jxlZW+IeSV/ABvepV6ceO6xIufBmPe7XMPBA2I7n0pj
   0FLWuRjSiFaiueIDR2qdjN7PmT/IDxTplL1hFgihCnn2y4q7xFSirQCro
   cvLRVQxduM1mGp5l67wJ4AAvUXfK/sgUwGfK4dLr7GEMYTyboD80tvrHt
   Mc+sDQzs/N/YWKkiebeDnGRwyOGGp6GtbjWsWFq8jtYgH3vil0ensMg/0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313164053"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="313164053"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 06:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644465379"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="644465379"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 07 Feb 2023 06:29:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C00A54BE; Tue,  7 Feb 2023 16:30:02 +0200 (EET)
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
Subject: [PATCH v3 10/12] gpiolib: Deduplicate forward declarations in consumer.h
Date: Tue,  7 Feb 2023 16:29:50 +0200
Message-Id: <20230207142952.51844-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
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

The struct fwnode_handle pointer is used in both branches of ifdeffery,
no need to have a copy of the same in each of them, just make it global.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/consumer.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 59cb20cfac3d..a7eb8aa1e54c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 
 struct device;
+struct fwnode_handle;
 struct gpio_desc;
 struct gpio_array;
 
@@ -171,9 +172,6 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
 
-/* Child properties interface */
-struct fwnode_handle;
-
 struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 					 const char *con_id, int index,
 					 enum gpiod_flags flags,
@@ -546,9 +544,6 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 	return -EINVAL;
 }
 
-/* Child properties interface */
-struct fwnode_handle;
-
 static inline
 struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 					 const char *con_id, int index,
-- 
2.39.1

