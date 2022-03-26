Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF44E836D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:42:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnrB6pZRz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:42:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=m/kM4yfw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=0ISm2sIC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=m/kM4yfw; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=0ISm2sIC; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlbG1PvMz305B
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:00:58 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 15ECCFBBF9; Sat, 26 Mar 2022 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314056; bh=mxL996mePhc5doSrJVmK9wWxYLVsdD05aWSE5jpqwgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/kM4yfwuqLmw3KkaEYW0f9H0EGrDwFEOW59wezrmvV0lSyCvgB3WAT5xEKpIo4J+
 emEFYNwfXF6TrKahijeGP2FA3h++kZXU5+/BVQ5+zmHoyRklXur8kKz5A+Fy5iF2cY
 m1zR1eDGol00B4xwNCEFV9WnEA2gtoTCdTnqNgcwruAK9Vym1Q/rNJw4Jb/QoeuvcW
 cRmw1poJa6Nc9y83+eg9bUDMSym8U98GPO+AasHU2lTaqZfoQZs7WZqO6dccdoQWK4
 Dv504iyYu2bThOTUt6INOIw795O326gSCDL6ri3BRyUEZp6jI5flPhbfHer7WIC+3+
 LROo2c0BLmBGw==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id B5CC6FBBC5;
 Sat, 26 Mar 2022 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314053; bh=mxL996mePhc5doSrJVmK9wWxYLVsdD05aWSE5jpqwgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0ISm2sICjREB7i6ZY+hcmpK+FAsc4ir5tgtu2b41kIUk8cdnWXYPNctMwWMc+yqGY
 xE89kOsZJ5+h2o+7XWUivQuolcP2KXzXGQb6fd+Y8TS0yuYWbNOSN6btuEooHVjjuj
 8JKZZMBk8tYdjI3JgefS7seEI0GtGtqQx9E0AqC67Np8T82c4FRLR6NZg4I3/yK/j5
 L5uQ4pIe/JOu6y1D2+f9m3W6obafdHos+wMy1+w/a2sknJdP3KnxZG1eeX8AWjzYTg
 8On2/ySm9JPTp33qSK7+6dLyxuQTCUT1vZM6WbotlhOjRkLsDStcjg352nzJOes48/
 aK7RGoHdkjlsg==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 14/22] mISDN: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:01 +0100
Message-Id: <20220326165909.506926-14-benni@stuerz.xyz>
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
 drivers/isdn/hardware/mISDN/hfcmulti.c | 88 +++++++++++++-------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 4f7eaa17fb27..fb6ed4167845 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -5283,50 +5283,50 @@ static void hfc_remove_pci(struct pci_dev *pdev)
 #define VENDOR_PRIM	"PrimuX"
 
 static const struct hm_map hfcm_map[] = {
-	/*0*/	{VENDOR_BN, "HFC-1S Card (mini PCI)", 4, 1, 1, 3, 0, DIP_4S, 0, 0},
-	/*1*/	{VENDOR_BN, "HFC-2S Card", 4, 2, 1, 3, 0, DIP_4S, 0, 0},
-	/*2*/	{VENDOR_BN, "HFC-2S Card (mini PCI)", 4, 2, 1, 3, 0, DIP_4S, 0, 0},
-	/*3*/	{VENDOR_BN, "HFC-4S Card", 4, 4, 1, 2, 0, DIP_4S, 0, 0},
-	/*4*/	{VENDOR_BN, "HFC-4S Card (mini PCI)", 4, 4, 1, 2, 0, 0, 0, 0},
-	/*5*/	{VENDOR_CCD, "HFC-4S Eval (old)", 4, 4, 0, 0, 0, 0, 0, 0},
-	/*6*/	{VENDOR_CCD, "HFC-4S IOB4ST", 4, 4, 1, 2, 0, DIP_4S, 0, 0},
-	/*7*/	{VENDOR_CCD, "HFC-4S", 4, 4, 1, 2, 0, 0, 0, 0},
-	/*8*/	{VENDOR_DIG, "HFC-4S Card", 4, 4, 0, 2, 0, 0, HFC_IO_MODE_REGIO, 0},
-	/*9*/	{VENDOR_CCD, "HFC-4S Swyx 4xS0 SX2 QuadBri", 4, 4, 1, 2, 0, 0, 0, 0},
-	/*10*/	{VENDOR_JH, "HFC-4S (junghanns 2.0)", 4, 4, 1, 2, 0, 0, 0, 0},
-	/*11*/	{VENDOR_PRIM, "HFC-2S Primux Card", 4, 2, 0, 0, 0, 0, 0, 0},
-
-	/*12*/	{VENDOR_BN, "HFC-8S Card", 8, 8, 1, 0, 0, 0, 0, 0},
-	/*13*/	{VENDOR_BN, "HFC-8S Card (+)", 8, 8, 1, 8, 0, DIP_8S,
-		 HFC_IO_MODE_REGIO, 0},
-	/*14*/	{VENDOR_CCD, "HFC-8S Eval (old)", 8, 8, 0, 0, 0, 0, 0, 0},
-	/*15*/	{VENDOR_CCD, "HFC-8S IOB4ST Recording", 8, 8, 1, 0, 0, 0, 0, 0},
-
-	/*16*/	{VENDOR_CCD, "HFC-8S IOB8ST", 8, 8, 1, 0, 0, 0, 0, 0},
-	/*17*/	{VENDOR_CCD, "HFC-8S", 8, 8, 1, 0, 0, 0, 0, 0},
-	/*18*/	{VENDOR_CCD, "HFC-8S", 8, 8, 1, 0, 0, 0, 0, 0},
-
-	/*19*/	{VENDOR_BN, "HFC-E1 Card", 1, 1, 0, 1, 0, DIP_E1, 0, 0},
-	/*20*/	{VENDOR_BN, "HFC-E1 Card (mini PCI)", 1, 1, 0, 1, 0, 0, 0, 0},
-	/*21*/	{VENDOR_BN, "HFC-E1+ Card (Dual)", 1, 1, 0, 1, 0, DIP_E1, 0, 0},
-	/*22*/	{VENDOR_BN, "HFC-E1 Card (Dual)", 1, 1, 0, 1, 0, DIP_E1, 0, 0},
-
-	/*23*/	{VENDOR_CCD, "HFC-E1 Eval (old)", 1, 1, 0, 0, 0, 0, 0, 0},
-	/*24*/	{VENDOR_CCD, "HFC-E1 IOB1E1", 1, 1, 0, 1, 0, 0, 0, 0},
-	/*25*/	{VENDOR_CCD, "HFC-E1", 1, 1, 0, 1, 0, 0, 0, 0},
-
-	/*26*/	{VENDOR_CCD, "HFC-4S Speech Design", 4, 4, 0, 0, 0, 0,
-		 HFC_IO_MODE_PLXSD, 0},
-	/*27*/	{VENDOR_CCD, "HFC-E1 Speech Design", 1, 1, 0, 0, 0, 0,
-		 HFC_IO_MODE_PLXSD, 0},
-	/*28*/	{VENDOR_CCD, "HFC-4S OpenVox", 4, 4, 1, 0, 0, 0, 0, 0},
-	/*29*/	{VENDOR_CCD, "HFC-2S OpenVox", 4, 2, 1, 0, 0, 0, 0, 0},
-	/*30*/	{VENDOR_CCD, "HFC-8S OpenVox", 8, 8, 1, 0, 0, 0, 0, 0},
-	/*31*/	{VENDOR_CCD, "XHFC-4S Speech Design", 5, 4, 0, 0, 0, 0,
-		 HFC_IO_MODE_EMBSD, XHFC_IRQ},
-	/*32*/	{VENDOR_JH, "HFC-8S (junghanns)", 8, 8, 1, 0, 0, 0, 0, 0},
-	/*33*/	{VENDOR_BN, "HFC-2S Beronet Card PCIe", 4, 2, 1, 3, 0, DIP_4S, 0, 0},
-	/*34*/	{VENDOR_BN, "HFC-4S Beronet Card PCIe", 4, 4, 1, 2, 0, DIP_4S, 0, 0},
+	[0]  =	{VENDOR_BN, "HFC-1S Card (mini PCI)", 4, 1, 1, 3, 0, DIP_4S, 0, 0},
+	[1]  =	{VENDOR_BN, "HFC-2S Card", 4, 2, 1, 3, 0, DIP_4S, 0, 0},
+	[2]  =	{VENDOR_BN, "HFC-2S Card (mini PCI)", 4, 2, 1, 3, 0, DIP_4S, 0, 0},
+	[3]  =	{VENDOR_BN, "HFC-4S Card", 4, 4, 1, 2, 0, DIP_4S, 0, 0},
+	[4]  =	{VENDOR_BN, "HFC-4S Card (mini PCI)", 4, 4, 1, 2, 0, 0, 0, 0},
+	[5]  =	{VENDOR_CCD, "HFC-4S Eval (old)", 4, 4, 0, 0, 0, 0, 0, 0},
+	[6]  =	{VENDOR_CCD, "HFC-4S IOB4ST", 4, 4, 1, 2, 0, DIP_4S, 0, 0},
+	[7]  =	{VENDOR_CCD, "HFC-4S", 4, 4, 1, 2, 0, 0, 0, 0},
+	[8]  =	{VENDOR_DIG, "HFC-4S Card", 4, 4, 0, 2, 0, 0, HFC_IO_MODE_REGIO, 0},
+	[9]  =	{VENDOR_CCD, "HFC-4S Swyx 4xS0 SX2 QuadBri", 4, 4, 1, 2, 0, 0, 0, 0},
+	[10] =	{VENDOR_JH, "HFC-4S (junghanns 2.0)", 4, 4, 1, 2, 0, 0, 0, 0},
+	[11] =	{VENDOR_PRIM, "HFC-2S Primux Card", 4, 2, 0, 0, 0, 0, 0, 0},
+
+	[12] =	{VENDOR_BN, "HFC-8S Card", 8, 8, 1, 0, 0, 0, 0, 0},
+	[13] =	{VENDOR_BN, "HFC-8S Card (+)", 8, 8, 1, 8, 0, DIP_8S,
+		       HFC_IO_MODE_REGIO, 0},
+	[14] =	{VENDOR_CCD, "HFC-8S Eval (old)", 8, 8, 0, 0, 0, 0, 0, 0},
+	[15] =	{VENDOR_CCD, "HFC-8S IOB4ST Recording", 8, 8, 1, 0, 0, 0, 0, 0},
+
+	[16] =	{VENDOR_CCD, "HFC-8S IOB8ST", 8, 8, 1, 0, 0, 0, 0, 0},
+	[17] =	{VENDOR_CCD, "HFC-8S", 8, 8, 1, 0, 0, 0, 0, 0},
+	[18] =	{VENDOR_CCD, "HFC-8S", 8, 8, 1, 0, 0, 0, 0, 0},
+
+	[19] =	{VENDOR_BN, "HFC-E1 Card", 1, 1, 0, 1, 0, DIP_E1, 0, 0},
+	[20] =	{VENDOR_BN, "HFC-E1 Card (mini PCI)", 1, 1, 0, 1, 0, 0, 0, 0},
+	[21] =	{VENDOR_BN, "HFC-E1+ Card (Dual)", 1, 1, 0, 1, 0, DIP_E1, 0, 0},
+	[22] =	{VENDOR_BN, "HFC-E1 Card (Dual)", 1, 1, 0, 1, 0, DIP_E1, 0, 0},
+
+	[23] =	{VENDOR_CCD, "HFC-E1 Eval (old)", 1, 1, 0, 0, 0, 0, 0, 0},
+	[24] =	{VENDOR_CCD, "HFC-E1 IOB1E1", 1, 1, 0, 1, 0, 0, 0, 0},
+	[25] =	{VENDOR_CCD, "HFC-E1", 1, 1, 0, 1, 0, 0, 0, 0},
+
+	[26] =	{VENDOR_CCD, "HFC-4S Speech Design", 4, 4, 0, 0, 0, 0,
+		       HFC_IO_MODE_PLXSD, 0},
+	[27] =	{VENDOR_CCD, "HFC-E1 Speech Design", 1, 1, 0, 0, 0, 0,
+		       HFC_IO_MODE_PLXSD, 0},
+	[28] =	{VENDOR_CCD, "HFC-4S OpenVox", 4, 4, 1, 0, 0, 0, 0, 0},
+	[29] =	{VENDOR_CCD, "HFC-2S OpenVox", 4, 2, 1, 0, 0, 0, 0, 0},
+	[30] =	{VENDOR_CCD, "HFC-8S OpenVox", 8, 8, 1, 0, 0, 0, 0, 0},
+	[31] =	{VENDOR_CCD, "XHFC-4S Speech Design", 5, 4, 0, 0, 0, 0,
+		       HFC_IO_MODE_EMBSD, XHFC_IRQ},
+	[32] =	{VENDOR_JH, "HFC-8S (junghanns)", 8, 8, 1, 0, 0, 0, 0, 0},
+	[33] =	{VENDOR_BN, "HFC-2S Beronet Card PCIe", 4, 2, 1, 3, 0, DIP_4S, 0, 0},
+	[34] =	{VENDOR_BN, "HFC-4S Beronet Card PCIe", 4, 4, 1, 2, 0, DIP_4S, 0, 0},
 };
 
 #undef H
-- 
2.35.1

