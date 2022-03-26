Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C09B4E8377
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:45:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnvR1dPdz30Kq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:45:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=NGGF9R0n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=q5q75UwS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=NGGF9R0n; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=q5q75UwS; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlc13Wf1z3073
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:37 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 75A6FFBC2F; Sat, 26 Mar 2022 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314095; bh=OIgqNWNKM4FUx2aMq66C59LbU1toNuGdnuhts8rWjzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NGGF9R0nGgvoNNFVbJq7YUOhpFoUvd+UDHPvUqEnMYzLPg6wG2+tJNo4wtSym83rv
 3e8aQn+XKbF4ttvz+4/KC3GeQGYXzEoJtc4y0BaafRf5EeDEg4ovOyVXZPS4FyKcRw
 42c5RuqTLZhMmlfOxY2yReWU3IX8rYIr5t1BuqHffgiBNdXmZ+Q61YcTqgbkXLqV3L
 H3bt49ICqE4L7YN0S0TZFVtOO1hluDvo1e7tniOsD047S/6Mh4K5ujrrtQTh5JZM4X
 MHcbHwfrRCu8oq7ZWcxEz7lDMAtFI8pfUKvg9henVTNaE1F2VXlf1qeW4DJ16fL0+s
 K2d8xFT7UTT5A==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 88BC8FBB90;
 Sat, 26 Mar 2022 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314092; bh=OIgqNWNKM4FUx2aMq66C59LbU1toNuGdnuhts8rWjzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q5q75UwSTKYtxZSPnmZk34FK8PeXDHcTNRBj5CzYGeK0w2pwNaZU+fi90Oz/WKkid
 4WEqyQWecLkpaeHn3vE+T8T9IhcPNKppIdLidXwWPOkvmIRMdMQbgLWo7vumkiu7Ys
 yL3ZKk/BMn4WTB83Nz4BUSd7BvbvSh4mfApi64G8Ns4vDjEHHeCqwRPzckTwSkHXvN
 1U+V2EqlTgJP/JpZgtNYZ8hAXXSUwrkojdQjapu3jM+5NwQBSrq5YhphrzOyacM/cb
 qKXKHKGluyZwgMCRmQwUm/8nWGTHWd6eeIhFKVdr6V3ZsPI8N++ZPoBFNYgkN7OQEI
 2haFTg5IDR/XQ==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 20/22] wireless: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:07 +0100
Message-Id: <20220326165909.506926-20-benni@stuerz.xyz>
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
 drivers/net/wireless/ray_cs.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index 87e98ab068ed..dd11018b956c 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -2529,20 +2529,23 @@ static void clear_interrupt(ray_dev_t *local)
 #define MAXDATA (PAGE_SIZE - 80)
 
 static const char *card_status[] = {
-	"Card inserted - uninitialized",	/* 0 */
-	"Card not downloaded",			/* 1 */
-	"Waiting for download parameters",	/* 2 */
-	"Card doing acquisition",		/* 3 */
-	"Acquisition complete",			/* 4 */
-	"Authentication complete",		/* 5 */
-	"Association complete",			/* 6 */
-	"???", "???", "???", "???",		/* 7 8 9 10 undefined */
-	"Card init error",			/* 11 */
-	"Download parameters error",		/* 12 */
-	"???",					/* 13 */
-	"Acquisition failed",			/* 14 */
-	"Authentication refused",		/* 15 */
-	"Association failed"			/* 16 */
+	[0]  = "Card inserted - uninitialized",
+	[1]  = "Card not downloaded",
+	[2]  = "Waiting for download parameters",
+	[3]  = "Card doing acquisition",
+	[4]  = "Acquisition complete",
+	[5]  = "Authentication complete",
+	[6]  = "Association complete",
+	[7]  = "???",
+	[8]  = "???",
+	[9]  = "???",
+	[10] = "???",
+	[11] = "Card init error",
+	[12] = "Download parameters error",
+	[13] = "???",
+	[14] = "Acquisition failed",
+	[15] = "Authentication refused",
+	[16] = "Association failed"
 };
 
 static const char *nettype[] = { "Adhoc", "Infra " };
-- 
2.35.1

