Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9F4E8368
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnq71ZDrz3bgn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:41:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=JsiZ950Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=wNRlS1xv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=JsiZ950Z; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=wNRlS1xv; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Sun, 27 Mar 2022 04:00:45 AEDT
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlb15J27z305B
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:00:45 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id B1677FBBE6; Sat, 26 Mar 2022 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314043; bh=nThPDkDF2XLY5J3RiAKQRe1b62vpRwWyWtPgVZyXRO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JsiZ950ZLfkne2NOnvzVj10XXg4Zt4h7oNwdhAGtKWsC46eB/TPcb8wq96t+rUk8v
 L1iiTmLrfN6nfmmKNxsIzXjWqolWkorZ7yhpyvqIH2rh2mnSHy/mKBYhV2Gxyiskoo
 Qw/icbGFvoYdZoHv9dD2wEtRQ5PdpV9GGM1R4qr7CbXCMDtRR6VWP33Dq7j1LYzTb/
 L9Zh4YyljFmY9vaOoaj8iBuXWIypdwcu5bajRj2V6P79HBgGo6L0Iw82lX8956KXFQ
 xhXfkxMyNBX1VyYfTVOuenlmElEGNmfC+PoXKt1F4ZuJrxU4kA8jg2iDvrk2y1WbRN
 WlJ1i2cciLxcw==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 7E9C4FBBB2;
 Sat, 26 Mar 2022 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314039; bh=nThPDkDF2XLY5J3RiAKQRe1b62vpRwWyWtPgVZyXRO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wNRlS1xv//eXMRaT7zlFJ8fDp4Tsg2CzMO5ONij0+zqqguTk7QhKI4oCIqXPVryh+
 tVP+rQ/6jMPFT21raOJfu2nhdw0W4orrMWuDhkMZ2JgtVG7WJA4ykvSfr1xZidzFMB
 axWfyOmdByaaaBLNtdPHufNsL3Rabi3BawPkeeFDO2RHZKSZ/XhKY8OxzXg+YhTYWm
 H3oRW50TqfYGA+eq5ZLaryp1Hjp+iw9dn0u+O7WJBbJiq/Yo+72f/A5Zq8O02n9pZ8
 migv038XS1iEQAyL5ExZAJdD/UiEJgyp8C9pGPCvhaZ+7C/9hLic8i2BVTmosbCwnB
 aFryaSvC2NznA==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 12/22] alps: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:59 +0100
Message-Id: <20220326165909.506926-12-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 drivers/input/mouse/alps.c | 96 +++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 4a6b33bbe7ea..333f18b198eb 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -33,60 +33,60 @@
 #define ALPS_REG_BASE_PINNACLE	0x0000
 
 static const struct alps_nibble_commands alps_v3_nibble_commands[] = {
-	{ PSMOUSE_CMD_SETPOLL,		0x00 }, /* 0 */
-	{ PSMOUSE_CMD_RESET_DIS,	0x00 }, /* 1 */
-	{ PSMOUSE_CMD_SETSCALE21,	0x00 }, /* 2 */
-	{ PSMOUSE_CMD_SETRATE,		0x0a }, /* 3 */
-	{ PSMOUSE_CMD_SETRATE,		0x14 }, /* 4 */
-	{ PSMOUSE_CMD_SETRATE,		0x28 }, /* 5 */
-	{ PSMOUSE_CMD_SETRATE,		0x3c }, /* 6 */
-	{ PSMOUSE_CMD_SETRATE,		0x50 }, /* 7 */
-	{ PSMOUSE_CMD_SETRATE,		0x64 }, /* 8 */
-	{ PSMOUSE_CMD_SETRATE,		0xc8 }, /* 9 */
-	{ ALPS_CMD_NIBBLE_10,		0x00 }, /* a */
-	{ PSMOUSE_CMD_SETRES,		0x00 }, /* b */
-	{ PSMOUSE_CMD_SETRES,		0x01 }, /* c */
-	{ PSMOUSE_CMD_SETRES,		0x02 }, /* d */
-	{ PSMOUSE_CMD_SETRES,		0x03 }, /* e */
-	{ PSMOUSE_CMD_SETSCALE11,	0x00 }, /* f */
+	[0x0] = { PSMOUSE_CMD_SETPOLL,		0x00 },
+	[0x1] = { PSMOUSE_CMD_RESET_DIS,	   0x00 },
+	[0x2] = { PSMOUSE_CMD_SETSCALE21,	0x00 },
+	[0x3] = { PSMOUSE_CMD_SETRATE,		0x0a },
+	[0x4] = { PSMOUSE_CMD_SETRATE,		0x14 },
+	[0x5] = { PSMOUSE_CMD_SETRATE,		0x28 },
+	[0x6] = { PSMOUSE_CMD_SETRATE,		0x3c },
+	[0x7] = { PSMOUSE_CMD_SETRATE,		0x50 },
+	[0x8] = { PSMOUSE_CMD_SETRATE,		0x64 },
+	[0x9] = { PSMOUSE_CMD_SETRATE,		0xc8 },
+	[0xa] = { ALPS_CMD_NIBBLE_10,		   0x00 },
+	[0xb] = { PSMOUSE_CMD_SETRES,		   0x00 },
+	[0xc] = { PSMOUSE_CMD_SETRES,		   0x01 },
+	[0xd] = { PSMOUSE_CMD_SETRES,		   0x02 },
+	[0xe] = { PSMOUSE_CMD_SETRES,		   0x03 },
+	[0xf] = { PSMOUSE_CMD_SETSCALE11,	0x00 },
 };
 
 static const struct alps_nibble_commands alps_v4_nibble_commands[] = {
-	{ PSMOUSE_CMD_ENABLE,		0x00 }, /* 0 */
-	{ PSMOUSE_CMD_RESET_DIS,	0x00 }, /* 1 */
-	{ PSMOUSE_CMD_SETSCALE21,	0x00 }, /* 2 */
-	{ PSMOUSE_CMD_SETRATE,		0x0a }, /* 3 */
-	{ PSMOUSE_CMD_SETRATE,		0x14 }, /* 4 */
-	{ PSMOUSE_CMD_SETRATE,		0x28 }, /* 5 */
-	{ PSMOUSE_CMD_SETRATE,		0x3c }, /* 6 */
-	{ PSMOUSE_CMD_SETRATE,		0x50 }, /* 7 */
-	{ PSMOUSE_CMD_SETRATE,		0x64 }, /* 8 */
-	{ PSMOUSE_CMD_SETRATE,		0xc8 }, /* 9 */
-	{ ALPS_CMD_NIBBLE_10,		0x00 }, /* a */
-	{ PSMOUSE_CMD_SETRES,		0x00 }, /* b */
-	{ PSMOUSE_CMD_SETRES,		0x01 }, /* c */
-	{ PSMOUSE_CMD_SETRES,		0x02 }, /* d */
-	{ PSMOUSE_CMD_SETRES,		0x03 }, /* e */
-	{ PSMOUSE_CMD_SETSCALE11,	0x00 }, /* f */
+	[0x0] = { PSMOUSE_CMD_ENABLE,		   0x00 },
+	[0x1] = { PSMOUSE_CMD_RESET_DIS,	   0x00 },
+	[0x2] = { PSMOUSE_CMD_SETSCALE21,	0x00 },
+	[0x3] = { PSMOUSE_CMD_SETRATE,		0x0a },
+	[0x4] = { PSMOUSE_CMD_SETRATE,		0x14 },
+	[0x5] = { PSMOUSE_CMD_SETRATE,		0x28 },
+	[0x6] = { PSMOUSE_CMD_SETRATE,		0x3c },
+	[0x7] = { PSMOUSE_CMD_SETRATE,		0x50 },
+	[0x8] = { PSMOUSE_CMD_SETRATE,		0x64 },
+	[0x9] = { PSMOUSE_CMD_SETRATE,		0xc8 },
+	[0xa] = { ALPS_CMD_NIBBLE_10,		   0x00 },
+	[0xb] = { PSMOUSE_CMD_SETRES,		   0x00 },
+	[0xc] = { PSMOUSE_CMD_SETRES,		   0x01 },
+	[0xd] = { PSMOUSE_CMD_SETRES,		   0x02 },
+	[0xe] = { PSMOUSE_CMD_SETRES,		   0x03 },
+	[0xf] = { PSMOUSE_CMD_SETSCALE11,	0x00 },
 };
 
 static const struct alps_nibble_commands alps_v6_nibble_commands[] = {
-	{ PSMOUSE_CMD_ENABLE,		0x00 }, /* 0 */
-	{ PSMOUSE_CMD_SETRATE,		0x0a }, /* 1 */
-	{ PSMOUSE_CMD_SETRATE,		0x14 }, /* 2 */
-	{ PSMOUSE_CMD_SETRATE,		0x28 }, /* 3 */
-	{ PSMOUSE_CMD_SETRATE,		0x3c }, /* 4 */
-	{ PSMOUSE_CMD_SETRATE,		0x50 }, /* 5 */
-	{ PSMOUSE_CMD_SETRATE,		0x64 }, /* 6 */
-	{ PSMOUSE_CMD_SETRATE,		0xc8 }, /* 7 */
-	{ PSMOUSE_CMD_GETID,		0x00 }, /* 8 */
-	{ PSMOUSE_CMD_GETINFO,		0x00 }, /* 9 */
-	{ PSMOUSE_CMD_SETRES,		0x00 }, /* a */
-	{ PSMOUSE_CMD_SETRES,		0x01 }, /* b */
-	{ PSMOUSE_CMD_SETRES,		0x02 }, /* c */
-	{ PSMOUSE_CMD_SETRES,		0x03 }, /* d */
-	{ PSMOUSE_CMD_SETSCALE21,	0x00 }, /* e */
-	{ PSMOUSE_CMD_SETSCALE11,	0x00 }, /* f */
+	[0x0] = { PSMOUSE_CMD_ENABLE,		   0x00 },
+	[0x1] = { PSMOUSE_CMD_SETRATE,		0x0a },
+	[0x2] = { PSMOUSE_CMD_SETRATE,		0x14 },
+	[0x3] = { PSMOUSE_CMD_SETRATE,		0x28 },
+	[0x4] = { PSMOUSE_CMD_SETRATE,		0x3c },
+	[0x5] = { PSMOUSE_CMD_SETRATE,		0x50 },
+	[0x6] = { PSMOUSE_CMD_SETRATE,		0x64 },
+	[0x7] = { PSMOUSE_CMD_SETRATE,		0xc8 },
+	[0x8] = { PSMOUSE_CMD_GETID,		   0x00 },
+	[0x9] = { PSMOUSE_CMD_GETINFO,		0x00 },
+	[0xa] = { PSMOUSE_CMD_SETRES,		   0x00 },
+	[0xb] = { PSMOUSE_CMD_SETRES,		   0x01 },
+	[0xc] = { PSMOUSE_CMD_SETRES,		   0x02 },
+	[0xd] = { PSMOUSE_CMD_SETRES,		   0x03 },
+	[0xe] = { PSMOUSE_CMD_SETSCALE21,	0x00 },
+	[0xf] = { PSMOUSE_CMD_SETSCALE11,	0x00 },
 };
 
 
-- 
2.35.1

