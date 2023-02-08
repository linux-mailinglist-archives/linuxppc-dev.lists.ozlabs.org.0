Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A368FA7D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwQ945Zgz3fJ5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 09:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JxiuVgJj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JxiuVgJj;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnDG1Tbdz3c83
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:34:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877646; x=1707413646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YtyTSKv3igoWzjKzirfnsuSbOV1zJhPUEQxw+fpoykQ=;
  b=JxiuVgJjbbWVD0Is+4ntDjqB2tu4dnXDLkN47zqrp0xzm24ZnZT1F1s3
   vuCOdrY/cBF7Scy6SkESmJoDgcoSiaK284hmxwm/brxjJAyvnayqZ4+AL
   UzQqU3rwY+sjrhZ1QepEGVQ13sUlLuvevagD0pALaBWYUP8uFsQhgDnOG
   Eu+laHA0CXeQMqNgFjFvs1IIDaSu71wd6awi66tSKo019y6w8wbGn+pLZ
   t/Jz8pje6hzGQEclooHKFAl+7Ze0+TWOuloVEF01YVXVVWGJdyHfSDAej
   b+8nDh8jYAvWwlLuAzhCNkkK1OyKRb1JlibZkfxrOv9j+6Yq+fyuPGm7I
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="327564397"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="327564397"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644939107"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644939107"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 09:33:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 78A38591; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
Subject: [PATCH v4 16/18] gpiolib: Deduplicate forward declarations in consumer.h
Date: Wed,  8 Feb 2023 19:33:41 +0200
Message-Id: <20230208173343.37582-17-andriy.shevchenko@linux.intel.com>
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

