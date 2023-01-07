Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D186612C9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 01:58:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqJbb4wNXz3cfP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 11:58:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7SME9CL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+sam.ravnborg.org@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7SME9CL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nq7vQ34Z6z3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 05:26:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E488B803F3;
	Sat,  7 Jan 2023 18:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0F58C433EF;
	Sat,  7 Jan 2023 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673115981;
	bh=G9hzMu5p0tLB7xBK5DaOacF6SFxP5wjAYhU58D1pA54=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s7SME9CLzwcTO/ASMmBSkFdogveRGnrTzvOdb0R/wUCIMbl12h0AAX6mJfV+N/YT5
	 Q6CeS34Bbfd8kFxZIG/tClO7GSrWtHTdQy1K5G8xn+b/jKPP6nD6fbKwnKcoVyTvkE
	 L4GmB62ApgAjt1hooWH0M6/Ysb214IItHyrMMKeDxl7ybzUppwU01l3Sghai0DEgKj
	 3EBCDpydzGHkoF6Ml3yNh2ZrCLl3cSwVaD/b8Ke/VlUsXeQ2GRrMZKPTjUNMHLvnbE
	 jc3OkOtpk+Zxh+/92Zp4oWzgtwyZs6qi047z3PnSmi5cJ3qYzUGbVpinxuq4Ctih5D
	 jjOQRfS49bhsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC7FC46467;
	Sat,  7 Jan 2023 18:26:20 +0000 (UTC)
From:  Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>
Subject: [PATCH 00/15] backlight: Drop use of deprecated fb_blank property
Date: Sat, 07 Jan 2023 19:26:15 +0100
Message-Id:  <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEe5uWMC/x2NQQrDIBAAvxL23AVjaIV+pZSy6hqXWA2ahkLI3
 ys9zhxmDmhchRvchwMq79Kk5A7jZQAXKc+M4juDVnpSozLY6I27eC5oyS1J5rihr2XFYF82UV7Q
 3wJbM12NDgF6x1JjtJWyi72UPyl1uVYO8v2PH8/z/AF/VluqiAAAAA==
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=3981;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=G9hzMu5p0tLB7xBK5DaOacF6SFxP5wjAYhU58D1pA54=; =?utf-8?q?b=3DFNO5zZgcfHvw?=
 =?utf-8?q?8aK7wMXzvmp/dYtdmD0IQvqUZjY3X80l+WPDDLGTQyLG8MFQqLK6OxIku5yHTG4f?=
 c85wS6ixCns7gLN5/2aI3NwPuKvJlO0zM95nxUrNYAzqepPg69ZN
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received:  by B4 Submission Endpoint for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Sun, 08 Jan 2023 11:52:16 +1100
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
Reply-To: sam@ravnborg.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Peter Suti <peter.suti@streamunlimited.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alexios Zavras <alexios.zavras@intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Allison Randal <allison@lohutok.net>, Jason Yan <yanaijie@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, So
 uptick Joarder <jrdr.linux@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Enrico Weigelt <info@metux.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series refactor backlight users to avoid use of the
deprecated backlight_properties.fb_blank member.

Stephen Kitt <steve@sk2.org> and others already did a lot of
work and this is the final touches.

Patches 1-13 are independent and can be applied individually.
Patch 14 was already sent by Stephen and included here to make
the series complete.

The last patch may have to wait to avoid breaking the build
as it depends on all the other patches.

The series touches several sub-systems, so with acks I could
take them all in drm-misc. Or we can let the subsystems take
them and wait until next merge window with the final removal.
As new users of fb_blank do not pop up that often, waiting
one merge cycle is fine.

Sam

To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Helge Deller <deller@gmx.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
To: Antonino Daplas <adaplas@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Paul Mackerras <paulus@samba.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Robin van der Gracht <robin@protonic.nl>
To: Miguel Ojeda <ojeda@kernel.org>
To: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Stephen Kitt <steve@sk2.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

---
Sam Ravnborg (14):
      video: fbdev: atmel_lcdfb: Rework backlight handling
      video: fbdev: atyfb: Introduce backlight_get_brightness()
      video: fbdev: nvidia: Introduce backlight_get_brightness()
      video: fbdev: radeon: Introduce backlight_get_brightness()
      video: fbdev: riva: Introduce backlight_get_brightness()
      video: fbdev: aty128fb: Introduce backlight_get_brightness()
      video: fbdev: mx3fb: Introduce backlight_get_brightness()
      video: fbdev: omap2: Introduce backlight_get_brightness()
      staging: fbtft: fb_ssd1351.c: Introduce backlight_is_blank()
      staging: fbtft: core: Introduce backlight_is_blank()
      powerpc: via-pmu-backlight: Introduce backlight_get_brightness()
      auxdisplay: ht16k33: Introduce backlight_get_brightness()
      backlight: omap1: Use backlight helpers
      backlight: backlight: Drop the deprecated fb_blank property

Stephen Kitt (1):
      backlight: tosa: Use backlight helper

 drivers/auxdisplay/ht16k33.c                       |  7 +--
 drivers/macintosh/via-pmu-backlight.c              |  7 +--
 drivers/staging/fbtft/fb_ssd1351.c                 |  9 +--
 drivers/staging/fbtft/fbtft-core.c                 | 12 ++--
 drivers/video/backlight/backlight.c                |  2 -
 drivers/video/backlight/omap1_bl.c                 | 67 +++-------------------
 drivers/video/backlight/tosa_bl.c                  |  7 +--
 drivers/video/fbdev/atmel_lcdfb.c                  | 24 +-------
 drivers/video/fbdev/aty/aty128fb.c                 | 11 +---
 drivers/video/fbdev/aty/atyfb_base.c               |  8 +--
 drivers/video/fbdev/aty/radeon_backlight.c         | 10 +---
 drivers/video/fbdev/mx3fb.c                        |  8 +--
 drivers/video/fbdev/nvidia/nv_backlight.c          |  8 +--
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 19 +-----
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 23 +++-----
 drivers/video/fbdev/riva/fbdev.c                   |  8 +--
 include/linux/backlight.h                          | 22 -------
 17 files changed, 41 insertions(+), 211 deletions(-)
---
base-commit: a53be8dae86fe5d3567db245177e814e58210632
change-id: 20230107-sam-video-backlight-drop-fb_blank-d6feb73572ff

Best regards,
-- 
Sam Ravnborg <sam@ravnborg.org>
