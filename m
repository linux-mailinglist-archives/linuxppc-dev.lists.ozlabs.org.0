Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A76612CD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 02:01:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqJff3GJlz3fLJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 12:00:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0EYwiLF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+sam.ravnborg.org@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0EYwiLF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nq7vR0l1kz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 05:26:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3851EB80502;
	Sat,  7 Jan 2023 18:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C8F8C433B0;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673115981;
	bh=iwnNyRt1Uh/vn2VAl963Pb04rJrM5CLPdltH1F0ndxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u0EYwiLFKeoi8LdlxSUgU5clp48P68nrijqXpU4h7+Z5CLlDdoNeKp4Mx+akH8xWT
	 AKhCN20VnV4AN9UVPTyftgJhOQNDK8pvOY1XBNk5SLA6lE737TImt53rj9Ons3EczW
	 3oexI3lb5LkoAqb1aj6i42N4OvFj560LZlbBlzdBG7oF8jkuNXIfwRDnZpOuTqD451
	 jXbqxJg7XPOhxiZQVfQJ8KiOM9mA8ZkcR0RibQi56Tqan+KqBKvIO2j849SCEGcZPi
	 lB94kSOFN+MT0G13wsnTJ7ewxD9JyBbcOjHrE7uqytPX+UJYhYVDIQ5T1AJL4g3g2+
	 PO7L9YSEUF9HQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F6CC54EBD;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From:  Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 07 Jan 2023 19:26:22 +0100
Subject:  [PATCH 08/15] video: fbdev: omap2: Introduce backlight_get_brightness()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230107-sam-video-backlight-drop-fb_blank-v1-8-1bd9bafb351f@ravnborg.org>
References:  <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
In-Reply-To:  <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=3952;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=rBdlXn3SJoyXVGp9uzOjpAfLNvN20Ns2vzMuJ6kxYVQ=; =?utf-8?q?b=3DSe0re9Bl1ixb?=
 =?utf-8?q?eQqgTVCOFbfiMaV8wK5dyWiyyTDaZXRNHbQpUsMhAzYvPdOF7Fw51VxQ1DRCZitU?=
 +Z1PfROxCt3Qh2feioD4dKYYqFcvi1MHfgqxhL6GFEL5iOWFqHYg
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Enrico Weigelt <info@metux.net>, linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>, Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sam Ravnborg <sam@ravnborg.org>

Introduce backlight_get_brightness() to simplify logic
and avoid direct access to backlight properties.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Allison Randal <allison@lohutok.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Enrico Weigelt <info@metux.net>
Cc: Alexios Zavras <alexios.zavras@intel.com>
---
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 19 +-----------------
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 23 +++++++---------------
 2 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index a2c7c5cb1523..bd73aa5328c9 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -330,14 +330,8 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
 	struct omap_dss_device *in = ddata->in;
+	int level = backlight_get_brightness(dev);
 	int r;
-	int level;
-
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
 
 	dev_dbg(&ddata->pdev->dev, "update brightness to %d\n", level);
 
@@ -360,17 +354,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	return r;
 }
 
-static int dsicm_bl_get_intensity(struct backlight_device *dev)
-{
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		return dev->props.brightness;
-
-	return 0;
-}
-
 static const struct backlight_ops dsicm_bl_ops = {
-	.get_brightness = dsicm_bl_get_intensity,
 	.update_status  = dsicm_bl_update_status,
 };
 
@@ -1251,7 +1235,6 @@ static int dsicm_probe(struct platform_device *pdev)
 
 		ddata->bldev = bldev;
 
-		bldev->props.fb_blank = FB_BLANK_UNBLANK;
 		bldev->props.power = FB_BLANK_UNBLANK;
 		bldev->props.brightness = 255;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index c0965bee12c5..c9c8f10e2e2f 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -337,16 +337,10 @@ static int acx565akm_get_actual_brightness(struct panel_drv_data *ddata)
 static int acx565akm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
-	int level;
+	int level = backlight_get_brightness(dev);
 
 	dev_dbg(&ddata->spi->dev, "%s\n", __func__);
 
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
-
 	if (ddata->has_bc)
 		acx565akm_set_brightness(ddata, level);
 	else
@@ -364,15 +358,13 @@ static int acx565akm_bl_get_intensity(struct backlight_device *dev)
 	if (!ddata->has_bc)
 		return -ENODEV;
 
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK) {
-		if (ddata->has_bc)
-			return acx565akm_get_actual_brightness(ddata);
-		else
-			return dev->props.brightness;
-	}
+	if (backlight_is_blank(dev))
+		return 0;
 
-	return 0;
+	if (ddata->has_bc)
+		return acx565akm_get_actual_brightness(ddata);
+	else
+		return backlight_get_brightness(dev);
 }
 
 static int acx565akm_bl_update_status_locked(struct backlight_device *dev)
@@ -795,7 +787,6 @@ static int acx565akm_probe(struct spi_device *spi)
 	}
 
 	memset(&props, 0, sizeof(props));
-	props.fb_blank = FB_BLANK_UNBLANK;
 	props.power = FB_BLANK_UNBLANK;
 	props.type = BACKLIGHT_RAW;
 

-- 
2.34.1
