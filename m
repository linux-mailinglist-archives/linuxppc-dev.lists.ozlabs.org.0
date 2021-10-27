Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C543CAA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfTzj4pZqz3bsp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YcopuqY/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YcopuqY/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfTz34cykz2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 00:28:15 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0A3F60E54;
 Wed, 27 Oct 2021 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635341292;
 bh=EubQhcLZiFFhLvGY743JDlU2CsiFAofCWoI/Tq6daTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YcopuqY/86PHp0diMOIqnqlv92hsF7zYHZF2pg23bhC5uktYbu6+Z5N5MsTM0HlAh
 QhZbyhKfgmFZ2jOl13wsl8n7bifDk0IH2n/qxiOLbtOnRu6e6bgwEF9RQMefKgF07I
 AmEGcPxHukeePYS+bHLyilD1YPaftFzy41fF6L5Rs4sqJf3f+9qSpDBXH0AvaQ4Cpo
 RuFpm5pqlGB7tFY6o0NyDPKiGa1iSHSeIkrnFn8Y1qze55y3dX+/APv51wOJo50HNN
 DQzC3Y0fWuauHQ5YFWDzNpMr2ADL3BX6TybX7GANMfB26gw1jLRT5fG/xky3Y2/lR/
 v3dRifrKOTiRQ==
From: Arnd Bergmann <arnd@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] fbdev: rework backlight dependencies
Date: Wed, 27 Oct 2021 15:27:13 +0200
Message-Id: <20211027132732.3993279-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211027132732.3993279-1-arnd@kernel.org>
References: <20211027132732.3993279-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Jens Frederich <jfrederich@gmail.com>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Lars Poeschel <poeschel@lemonage.de>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 linuxppc-dev@lists.ozlabs.org, Jon Nettleton <jon.nettleton@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
make any driver that needs it have a dependency on the class device
being available, to prevent circular dependencies.

This is the same way that the backlight is already treated for the DRM
subsystem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/auxdisplay/Kconfig        |  1 +
 drivers/macintosh/Kconfig         |  1 +
 drivers/staging/fbtft/Kconfig     |  1 +
 drivers/staging/olpc_dcon/Kconfig |  2 +-
 drivers/video/fbdev/Kconfig       | 14 +++++++++++---
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 64012cda4d12..356afb6a569d 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -170,6 +170,7 @@ config IMG_ASCII_LCD
 config HT16K33
 	tristate "Holtek Ht16K33 LED controller with keyscan"
 	depends on FB && I2C && INPUT
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 5cdc361da37c..cb0fbdf8ff7f 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -113,6 +113,7 @@ config PMAC_MEDIABAY
 config PMAC_BACKLIGHT
 	bool "Backlight control for LCD screens"
 	depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	help
 	  Say Y here to enable Macintosh specific extensions of the generic
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index dad1ddcd7b0c..c4f2f01cd798 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -3,6 +3,7 @@ menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
diff --git a/drivers/staging/olpc_dcon/Kconfig b/drivers/staging/olpc_dcon/Kconfig
index d1a0dea09ef0..a9f36538d7ab 100644
--- a/drivers/staging/olpc_dcon/Kconfig
+++ b/drivers/staging/olpc_dcon/Kconfig
@@ -4,7 +4,7 @@ config FB_OLPC_DCON
 	depends on OLPC && FB
 	depends on I2C
 	depends on GPIO_CS5535 && ACPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  In order to support very low power operation, the XO laptop uses a
 	  secondary Display CONtroller, or DCON.  This secondary controller
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c187a93c9a16..3ad499433726 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -186,7 +186,7 @@ config FB_MACMODES
 config FB_BACKLIGHT
 	tristate
 	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
@@ -275,12 +275,12 @@ config FB_ARMCLCD
 	tristate "ARM PrimeCell PL110 support"
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on FB && ARM_AMBA && HAS_IOMEM
+	depends on BACKLIGHT_CLASS_DEVICE || !OF
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_MODE_HELPERS if OF
 	select VIDEOMODE_HELPERS if OF
-	select BACKLIGHT_CLASS_DEVICE if OF
 	help
 	  This framebuffer device driver is for the ARM PrimeCell PL110
 	  Colour LCD controller.  ARM PrimeCells provide the building
@@ -863,6 +863,7 @@ config FB_ATMEL
 	tristate "AT91 LCD Controller support"
 	depends on FB && OF && HAVE_CLK && HAS_IOMEM
 	depends on HAVE_FB_ATMEL || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -916,6 +917,7 @@ config FB_NVIDIA_DEBUG
 config FB_NVIDIA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_NVIDIA
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -963,6 +965,7 @@ config FB_RIVA_DEBUG
 config FB_RIVA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RIVA
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RIVA
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1234,6 +1237,7 @@ config FB_RADEON_I2C
 config FB_RADEON_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RADEON
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RADEON
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1265,6 +1269,7 @@ config FB_ATY128
 config FB_ATY128_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_ATY128
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY128
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1314,6 +1319,7 @@ config FB_ATY_GX
 
 config FB_ATY_BACKLIGHT
 	bool "Support for backlight control"
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY
 	depends on FB_ATY
 	default y
 	help
@@ -1838,6 +1844,7 @@ config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
@@ -2166,7 +2173,7 @@ config FB_PRE_INIT_FB
 config FB_MX3
 	tristate "MX3 Framebuffer support"
 	depends on FB && MX3_IPU
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -2222,6 +2229,7 @@ config FB_SSD1307
 	tristate "Solomon SSD1307 framebuffer support"
 	depends on FB && I2C
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
-- 
2.29.2

