Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FD6612C2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 01:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqJTT5vPpz3cBC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 11:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CQ5EFq+2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+sam.ravnborg.org@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CQ5EFq+2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nq7vQ02mwz3c6F
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 05:26:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2872160BC3;
	Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C138C433A1;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673115981;
	bh=UgErG0ahXvin5KqprcP4yTzkDgUMgisxrCT5F6v9v3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CQ5EFq+2BPJRiq3zf5snT1YX3p1YtwrJOo0UElQbxKCbR2zY/q0mm4QOeEwFbp0ob
	 wUKiM7ao8aI3qoMlKhkOZyBDK30hY9q6LvDt3jfbG4Ze4T+I4UWSQYU+/vwLW9Qydd
	 ZCx0Cp/78jutBDA25G5AXNmT4rc3GObY0qBV0Bxvv6OQGC4u19HXcqMGJXqNUiVHY1
	 +T7FM2SaxNG7uxi0OfBE+WHStPObR8Mbj2CGH4o3xT4I7bChwIDdc2m26PTFcSomG/
	 NeqTXSUoIeLn+P2wyPY0OZKk2JaTqOGlKH6Jzqsx70Yilgo+unfuPggd3lgcyKUjZo
	 YePqEkpjt0sHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475E3C64981;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From:  Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 07 Jan 2023 19:26:19 +0100
Subject:  [PATCH 05/15] video: fbdev: riva: Introduce backlight_get_brightness()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230107-sam-video-backlight-drop-fb_blank-v1-5-1bd9bafb351f@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=1045;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=j+HG2wSYqKNwTOfMiYjFHzSzlk0PGcAa2iiQeKtebpY=; =?utf-8?q?b=3DevW/7HEX3Tem?=
 =?utf-8?q?ZDTb3xs/18D5j66JRDk706eBMxDT6tdbE2dYtO9k/ExWbYOdsP9oRSxX+glDRK5M?=
 rxyrw8CID7AkL98sYMTbditO+j8pldVv8MCsELvig9PWwKcqU/Rv
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sam Ravnborg <sam@ravnborg.org>

Introduce backlight_get_brightness() to simplify logic
and avoid direct access to backlight properties.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/riva/fbdev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 644278146d3b..41edc6e79460 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -293,13 +293,7 @@ static int riva_bl_update_status(struct backlight_device *bd)
 {
 	struct riva_par *par = bl_get_data(bd);
 	U032 tmp_pcrt, tmp_pmc;
-	int level;
-
-	if (bd->props.power != FB_BLANK_UNBLANK ||
-	    bd->props.fb_blank != FB_BLANK_UNBLANK)
-		level = 0;
-	else
-		level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 
 	tmp_pmc = NV_RD32(par->riva.PMC, 0x10F0) & 0x0000FFFF;
 	tmp_pcrt = NV_RD32(par->riva.PCRTC0, 0x081C) & 0xFFFFFFFC;

-- 
2.34.1
