Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5D6612C5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 01:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqJXX6npsz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 11:55:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R0Vqm0kw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+sam.ravnborg.org@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R0Vqm0kw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nq7vP6hnkz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 05:26:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 10D6460BB1;
	Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A382C433AE;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673115981;
	bh=5ij+2zt071FaFgXPs/8g9HMxpQ5Rvn4NOrg8o4aDjAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R0Vqm0kwLCUMC/FFA+SwZYvkyVvRCwUaU1sKttT/VJJBVNEHRFOf7VvRZzlHTJkZG
	 jjwOFSnMDXFvNYr2SN2VsLrgU4CSuQ9MOmH7eo0WWSnwItqdjAYu/ZYW9aU81kUGBX
	 R39CPgkrOZwFdoE7pNj4N9tPVvQEikdGY5kaJNMaW7A+TZIGW21KtIjU6OqRUwklQl
	 S5JBCOzlHxApv1YqY1liRhR+fB9VwhN/rYiWd6Z2LUKDvnkbI+KBxZBmnEsLtO0Jfa
	 l3RLZMdBIrygDW6z0hb8uQ5n1gN1WEahYBr1Nnd6gvEn+QRWEUAge3ELmYT1mbJaLT
	 X6i2PWrdQxt1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EC0C54EBC;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From:  Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 07 Jan 2023 19:26:21 +0100
Subject:  [PATCH 07/15] video: fbdev: mx3fb: Introduce backlight_get_brightness()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230107-sam-video-backlight-drop-fb_blank-v1-7-1bd9bafb351f@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=1512;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=drvkdW0PBheGrMYY3qAlAUiLqN5UfH4VOwcA/aXugg0=; =?utf-8?q?b=3D8iTbagfWb1Lj?=
 =?utf-8?q?07cocG5qMfP8Ayj4BAQY4d64KWfzkOktfkyCN7IXzBwcj/9U/iJWYWB0GCaKShTH?=
 0OiuscjyAkCEJdcJGgJQX9THB3GVRSWeiPGBowlxgEHvu9p/2eio
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sam Ravnborg <sam@ravnborg.org>

Introduce backlight_get_brightness() to simplify logic
and avoid direct access to backlight properties.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/mx3fb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index b945b68984b9..bc35f664cbff 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -283,12 +283,7 @@ static int mx3fb_bl_get_brightness(struct backlight_device *bl)
 static int mx3fb_bl_update_status(struct backlight_device *bl)
 {
 	struct mx3fb_data *fbd = bl_get_data(bl);
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
+	int brightness = backlight_get_brightness(bl);
 
 	fbd->backlight_level = (fbd->backlight_level & ~0xFF) | brightness;
 
@@ -325,7 +320,6 @@ static void mx3fb_init_backlight(struct mx3fb_data *fbd)
 
 	fbd->bl = bl;
 	bl->props.power = FB_BLANK_UNBLANK;
-	bl->props.fb_blank = FB_BLANK_UNBLANK;
 	bl->props.brightness = mx3fb_bl_get_brightness(bl);
 }
 

-- 
2.34.1
