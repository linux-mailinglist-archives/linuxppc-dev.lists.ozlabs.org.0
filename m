Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF54E8383
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnyB08vdz3f8K
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=BP2O3dxh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=cKhwvy4q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=BP2O3dxh; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=cKhwvy4q; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm34cG0z30BL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:35 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 2272DFB7D5; Sat, 26 Mar 2022 16:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313977; bh=2uH++cpt44frpysxfSOHHq51GioRGW69bGRAGT0KbXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BP2O3dxhqDHlQr32+1FSr374RJ0ZNHRseCZK9VEg7lMCeEvEnd5WcO+KANOF+wgNW
 8chjrRd69BSPsjq5nAOXVzGGIkLuSKK28Fh+hzkGKu++vaxYnFmpap6qUywaz6ohcx
 uaJjrP0/fIqp3u3z+XDG7ti8SrXryBTN2McjY1X+wXOb1eX2PHmPUvUnUFqJdxP2NN
 Fwwl7qri9e0NB4cquGlb9lurP+D19uVv5UDzCvPWoVM3/98loprZqd3tU8vcwm6Yt/
 9S6ewkrom6b9FWkFrcHCcYd4UMwkPZSiVEVMUGgmQzh1d7x1mkV1vcgywHcmc6dNid
 w34LAlt5oqnRQ==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 98AE0FB7D0;
 Sat, 26 Mar 2022 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313973; bh=2uH++cpt44frpysxfSOHHq51GioRGW69bGRAGT0KbXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cKhwvy4qhsPuBxAq0Y52RSBW8Kxkl55mtNsTt7h2uutsE3Y6bGf2uI+3fV4gjubw8
 GpKwU9W3Gsv+wbbqaJHSG5dn04mPUxOLS6vQZPWYgqSkhFdKYlwRBwMnnmBwqY8C2y
 6crdwbggZyh88T++mcaMq+N7QcoI6KJC9AH/jpS8zlcXylv3kJnUsJ9M6wHwPU2lhK
 5Jy5mDsKEM89BIiyKY4oOsX95B3qpGLhw7sJvKQKpaYWFVH1Z5mqAILb9LQIa5uOep
 +T7X2leuj8NeWwv8be761msNoWYvaNI/CeR3TDGXvIT6mSEVcBf6YLCLmfISYd0yHC
 URoafektSpMIg==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 02/22] s3c: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:49 +0100
Message-Id: <20220326165909.506926-2-benni@stuerz.xyz>
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
 arch/arm/mach-s3c/bast-irq.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-s3c/bast-irq.c b/arch/arm/mach-s3c/bast-irq.c
index d299f124e6dc..bd5471f9973b 100644
--- a/arch/arm/mach-s3c/bast-irq.c
+++ b/arch/arm/mach-s3c/bast-irq.c
@@ -29,22 +29,22 @@
  * the irq is not implemented
 */
 static const unsigned char bast_pc104_irqmasks[] = {
-	0,   /* 0 */
-	0,   /* 1 */
-	0,   /* 2 */
-	1,   /* 3 */
-	0,   /* 4 */
-	2,   /* 5 */
-	0,   /* 6 */
-	4,   /* 7 */
-	0,   /* 8 */
-	0,   /* 9 */
-	8,   /* 10 */
-	0,   /* 11 */
-	0,   /* 12 */
-	0,   /* 13 */
-	0,   /* 14 */
-	0,   /* 15 */
+	[0]  = 0,
+	[1]  = 0,
+	[2]  = 0,
+	[3]  = 1,
+	[4]  = 0,
+	[5]  = 2,
+	[6]  = 0,
+	[7]  = 4,
+	[8]  = 0,
+	[9]  = 0,
+	[10] = 8,
+	[11] = 0,
+	[12] = 0,
+	[13] = 0,
+	[14] = 0,
+	[15] = 0,
 };
 
 static const unsigned char bast_pc104_irqs[] = { 3, 5, 7, 10 };
-- 
2.35.1

