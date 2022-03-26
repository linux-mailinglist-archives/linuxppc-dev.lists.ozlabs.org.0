Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26254E8386
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnzn5JRNz3cgC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:48:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=N07pKZu3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=cAGmc7q/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=N07pKZu3; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=cAGmc7q/; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm56VQTz307W
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:37 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id E8950FBBBE; Sat, 26 Mar 2022 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314023; bh=gqt1+kI42FGInscQtbmdIv8LY19kdHpeRO5nUSHeT20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N07pKZu3PISVns7G2iZJv14fX/jwnESzADyM5Dx/r6L9sSxM0haJk5+tnBgpAyzCb
 +bcRnGGeZLdgEti0RBF6/peH+MAuHYEWN8l8ab6/pFSI7H+xBtErE3drEXhK87cucK
 iehJIcpblsj3APUGYt6GFsXFwTwWRaqJtVWs26MIaSpTHPrIXmc19cY1fnB9xo4THp
 4my3AngN5VVhg66lKwuktjmjicEqkD+u1b+EEZoYLWcI5k2CuzFsN8AShSUtDZkHYp
 EJWh5lVV9Oke0cOvwUtoYV3TJK748kw/aYqU4SsyyFAkZKcs9RimkIkuSsncxlfQWk
 lgSWLe4xdWZ6A==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id A8729FB7D3;
 Sat, 26 Mar 2022 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314020; bh=gqt1+kI42FGInscQtbmdIv8LY19kdHpeRO5nUSHeT20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cAGmc7q/v70fp/d8OErxnqAUtLx7NZZMJRTXOS0xd3wx/9j3/80aOVZpisTnSXgpD
 prCgpdgT77LpFvxgJNlKEBWLSBjZ4kxEnRiiQ8dYJXZz/rVa+mwrDqlAxyVCXFhHlW
 pIK2SHvu+HJwUEPSNGCBAg9W2pTt/tLFKw/zKUqmtezySp/jWWzvO2dxfFwiuWRJ/2
 xpQDsn76lN3Gog+YDVovDRsTD/FUOFZK+XpCqNI1kFh28CwW7J2ObwhgE7g2W94Ieh
 euilI5YMx4HWkP8cW5lsUQrviC9YxhnjqgNxitvFz2aa9gpm6UrKMQ8V/jtHu5kgQn
 iXGM/MCmHVf9Q==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 09/22] gpio-winbond: Use C99 initializers
Date: Sat, 26 Mar 2022 17:58:56 +0100
Message-Id: <20220326165909.506926-9-benni@stuerz.xyz>
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
 drivers/gpio/gpio-winbond.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
index 7f8f5b02e31d..0b637fdb407c 100644
--- a/drivers/gpio/gpio-winbond.c
+++ b/drivers/gpio/gpio-winbond.c
@@ -249,7 +249,7 @@ struct winbond_gpio_info {
 };
 
 static const struct winbond_gpio_info winbond_gpio_infos[6] = {
-	{ /* 0 */
+	[0] = {
 		.dev = WB_SIO_DEV_GPIO12,
 		.enablereg = WB_SIO_GPIO12_REG_ENABLE,
 		.enablebit = WB_SIO_GPIO12_ENABLE_1,
@@ -266,7 +266,7 @@ static const struct winbond_gpio_info winbond_gpio_infos[6] = {
 			.warnonly = true
 		}
 	},
-	{ /* 1 */
+	[1] = {
 		.dev = WB_SIO_DEV_GPIO12,
 		.enablereg = WB_SIO_GPIO12_REG_ENABLE,
 		.enablebit = WB_SIO_GPIO12_ENABLE_2,
@@ -277,7 +277,7 @@ static const struct winbond_gpio_info winbond_gpio_infos[6] = {
 		.datareg = WB_SIO_GPIO12_REG_DATA2
 		/* special conflict handling so doesn't use conflict data */
 	},
-	{ /* 2 */
+	[2] = {
 		.dev = WB_SIO_DEV_GPIO34,
 		.enablereg = WB_SIO_GPIO34_REG_ENABLE,
 		.enablebit = WB_SIO_GPIO34_ENABLE_3,
@@ -294,7 +294,7 @@ static const struct winbond_gpio_info winbond_gpio_infos[6] = {
 			.warnonly = true
 		}
 	},
-	{ /* 3 */
+	[3] = {
 		.dev = WB_SIO_DEV_GPIO34,
 		.enablereg = WB_SIO_GPIO34_REG_ENABLE,
 		.enablebit = WB_SIO_GPIO34_ENABLE_4,
@@ -311,7 +311,7 @@ static const struct winbond_gpio_info winbond_gpio_infos[6] = {
 			.warnonly = true
 		}
 	},
-	{ /* 4 */
+	[4] = {
 		.dev = WB_SIO_DEV_WDGPIO56,
 		.enablereg = WB_SIO_WDGPIO56_REG_ENABLE,
 		.enablebit = WB_SIO_WDGPIO56_ENABLE_5,
@@ -328,7 +328,7 @@ static const struct winbond_gpio_info winbond_gpio_infos[6] = {
 			.warnonly = true
 		}
 	},
-	{ /* 5 */
+	[5] = {
 		.dev = WB_SIO_DEV_WDGPIO56,
 		.enablereg = WB_SIO_WDGPIO56_REG_ENABLE,
 		.enablebit = WB_SIO_WDGPIO56_ENABLE_6,
-- 
2.35.1

