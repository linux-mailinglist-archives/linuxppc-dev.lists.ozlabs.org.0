Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 267986612CA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 01:59:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqJcd0HBMz3fF3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 11:59:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lztt/Lr8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+sam.ravnborg.org@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lztt/Lr8;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nq7vQ3dW8z3c6y
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 05:26:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 15368B8068A;
	Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A387C43392;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673115981;
	bh=VwfafFJh85RTWNScBOqwx3qqZPO0h3ATlgYbyDEPC5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lztt/Lr87i5c5lExc8vdn4aZe8aWtC6RKTHYiRttCMz90bu5Ax1mdzomVNCwu7drn
	 xP3k487BFOopcNf1kfC30z86+ItuByGgcoHCb2mp/e+aHZ/C4KGO2DKAagrjLVrj9a
	 hqzJwM4QvyNOsOR8eRQg61WHXI+uu7fiI6j46dhoNBPK6y7NMLSh9Mflp7fsElyopH
	 8tz4fBs4Ful6Dq4060z9n3U52FvXMkwKKi4MswVznK4MRtlX82iio03yHbYOYO8PQa
	 CqXPOymgAQYQdhEOHtKShOvXYXFoR4EVvg5oDqUVdVaXNiBuVM9LXgy0iHpuTSvdJA
	 Bc5YWuZUj1BOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27032C46467;
	Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From:  Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 07 Jan 2023 19:26:17 +0100
Subject:  [PATCH 03/15] video: fbdev: nvidia: Introduce backlight_get_brightness()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230107-sam-video-backlight-drop-fb_blank-v1-3-1bd9bafb351f@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=1193;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=RQWprkm6DY1nK1XlfLALnIqlG+B5HpXX5nbpp2tYP5w=; =?utf-8?q?b=3D6PTpxwIiFZKL?=
 =?utf-8?q?U7iAjk5SURSyOARWGJhvy9t+pxCYjyWSnVB5zn7lmv5isPTykC0kqbBVYgHfNrQN?=
 OZnhe0MqCfAtmCpuzISqqz7yPrFGies9O1YR3IhYNqqN2c2yJA35
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
 drivers/video/fbdev/nvidia/nv_backlight.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nv_backlight.c b/drivers/video/fbdev/nvidia/nv_backlight.c
index 2ce53529f636..503a7a683855 100644
--- a/drivers/video/fbdev/nvidia/nv_backlight.c
+++ b/drivers/video/fbdev/nvidia/nv_backlight.c
@@ -49,17 +49,11 @@ static int nvidia_bl_update_status(struct backlight_device *bd)
 {
 	struct nvidia_par *par = bl_get_data(bd);
 	u32 tmp_pcrt, tmp_pmc, fpcontrol;
-	int level;
+	int level = backlight_get_brightness(bd);
 
 	if (!par->FlatPanel)
 		return 0;
 
-	if (bd->props.power != FB_BLANK_UNBLANK ||
-	    bd->props.fb_blank != FB_BLANK_UNBLANK)
-		level = 0;
-	else
-		level = bd->props.brightness;
-
 	tmp_pmc = NV_RD32(par->PMC, 0x10F0) & 0x0000FFFF;
 	tmp_pcrt = NV_RD32(par->PCRTC0, 0x081C) & 0xFFFFFFFC;
 	fpcontrol = NV_RD32(par->PRAMDAC, 0x0848) & 0xCFFFFFCC;

-- 
2.34.1
