Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3EF4E837C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnwW53bBz3bgY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=HsVTDpQf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=QFzkX74Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=HsVTDpQf; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=QFzkX74Q; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlcH4tVtz307L
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:51 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id AA28BFBC3A; Sat, 26 Mar 2022 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314109; bh=zpxJ79zszsKX8TM//ybBnHh4vZKZRo3BO9XqXVgJ4hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HsVTDpQf8DGOqsdDGkFbM6cftL9a2IWd7w3yL5twO0Xea/Sq+VbjpjORVDuNbuyTA
 wnv4Y8XfCeTMAnd1InbytVShx+wlT6sQvWDD7UXf78NAl0w8cmGhE7RXMYpKooangs
 08FqJo+Fse3SDFJCtsipm31nEhBWKHIIhemjbcPo6sRWWLcbGNGindBThcwNG6L4er
 2mEPoVgp+YfBXlSrM3Y4uNgv0+/y1DKKkh5bFlhFz+f1v9cxDEBuS7AzE/LfqecXV/
 zCpCKem0vgoGTyFbtDK7XmiO46rYbUofHiz7wSmN0BMUrfwKIJQBJ1JXsiso8cclFQ
 AJ1jli2/Cvhyw==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id BF429FBC00;
 Sat, 26 Mar 2022 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314106; bh=zpxJ79zszsKX8TM//ybBnHh4vZKZRo3BO9XqXVgJ4hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QFzkX74QwvGJRSAH8nyF07v7tuFcsGUKMAzRbKS3uDpNx91ZpOF5dGe9b+4Bv85yo
 70jPo5unJpPvS56P8dHLYofQ7y1rDtfgtZk8+TlkYDhfPm9XnE8iB2A8u4L2yM46Fd
 669OAbDndeFdLy+diF2W2mrLDGyPQUmL0lWs464/oQs9O/bUjXXd/lCo7nLW7pDa79
 4NOUamqZwEO0a2FO04rW5OgmGgUIdWccKwRJAyvTdnyleVgq8z7hZ9I8rAN6WqHyUw
 F/tYZ46CRFeXYIzLANoC69PP10fAQQ3dtVOQ2BejnXMk7j3InWh1EUHil7rYDCGUY/
 fkwZDJ4hUFfnw==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 22/22] pci: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:09 +0100
Message-Id: <20220326165909.506926-22-benni@stuerz.xyz>
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
 drivers/pci/probe.c | 116 ++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 17a969942d37..3de27b0765c8 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -653,42 +653,42 @@ EXPORT_SYMBOL(pci_free_host_bridge);

 /* Indexed by PCI_X_SSTATUS_FREQ (secondary bus mode and frequency) */
 static const unsigned char pcix_bus_speed[] = {
-	PCI_SPEED_UNKNOWN,		/* 0 */
-	PCI_SPEED_66MHz_PCIX,		/* 1 */
-	PCI_SPEED_100MHz_PCIX,		/* 2 */
-	PCI_SPEED_133MHz_PCIX,		/* 3 */
-	PCI_SPEED_UNKNOWN,		/* 4 */
-	PCI_SPEED_66MHz_PCIX_ECC,	/* 5 */
-	PCI_SPEED_100MHz_PCIX_ECC,	/* 6 */
-	PCI_SPEED_133MHz_PCIX_ECC,	/* 7 */
-	PCI_SPEED_UNKNOWN,		/* 8 */
-	PCI_SPEED_66MHz_PCIX_266,	/* 9 */
-	PCI_SPEED_100MHz_PCIX_266,	/* A */
-	PCI_SPEED_133MHz_PCIX_266,	/* B */
-	PCI_SPEED_UNKNOWN,		/* C */
-	PCI_SPEED_66MHz_PCIX_533,	/* D */
-	PCI_SPEED_100MHz_PCIX_533,	/* E */
-	PCI_SPEED_133MHz_PCIX_533	/* F */
+	[0x0] = PCI_SPEED_UNKNOWN,
+	[0x1] = PCI_SPEED_66MHz_PCIX,
+	[0x2] = PCI_SPEED_100MHz_PCIX,
+	[0x3] = PCI_SPEED_133MHz_PCIX,
+	[0x4] = PCI_SPEED_UNKNOWN,
+	[0x5] = PCI_SPEED_66MHz_PCIX_ECC,
+	[0x6] = PCI_SPEED_100MHz_PCIX_ECC,
+	[0x7] = PCI_SPEED_133MHz_PCIX_ECC,
+	[0x8] = PCI_SPEED_UNKNOWN,
+	[0x9] = PCI_SPEED_66MHz_PCIX_266,
+	[0xA] = PCI_SPEED_100MHz_PCIX_266,
+	[0xB] = PCI_SPEED_133MHz_PCIX_266,
+	[0xC] = PCI_SPEED_UNKNOWN,
+	[0xD] = PCI_SPEED_66MHz_PCIX_533,
+	[0xE] = PCI_SPEED_100MHz_PCIX_533,
+	[0xF] = PCI_SPEED_133MHz_PCIX_533
 };

 /* Indexed by PCI_EXP_LNKCAP_SLS, PCI_EXP_LNKSTA_CLS */
 const unsigned char pcie_link_speed[] = {
-	PCI_SPEED_UNKNOWN,		/* 0 */
-	PCIE_SPEED_2_5GT,		/* 1 */
-	PCIE_SPEED_5_0GT,		/* 2 */
-	PCIE_SPEED_8_0GT,		/* 3 */
-	PCIE_SPEED_16_0GT,		/* 4 */
-	PCIE_SPEED_32_0GT,		/* 5 */
-	PCIE_SPEED_64_0GT,		/* 6 */
-	PCI_SPEED_UNKNOWN,		/* 7 */
-	PCI_SPEED_UNKNOWN,		/* 8 */
-	PCI_SPEED_UNKNOWN,		/* 9 */
-	PCI_SPEED_UNKNOWN,		/* A */
-	PCI_SPEED_UNKNOWN,		/* B */
-	PCI_SPEED_UNKNOWN,		/* C */
-	PCI_SPEED_UNKNOWN,		/* D */
-	PCI_SPEED_UNKNOWN,		/* E */
-	PCI_SPEED_UNKNOWN		/* F */
+	[0x0] = PCI_SPEED_UNKNOWN,
+	[0x1] = PCIE_SPEED_2_5GT,
+	[0x2] = PCIE_SPEED_5_0GT,
+	[0x3] = PCIE_SPEED_8_0GT,
+	[0x4] = PCIE_SPEED_16_0GT,
+	[0x5] = PCIE_SPEED_32_0GT,
+	[0x6] = PCIE_SPEED_64_0GT,
+	[0x7] = PCI_SPEED_UNKNOWN,
+	[0x8] = PCI_SPEED_UNKNOWN,
+	[0x9] = PCI_SPEED_UNKNOWN,
+	[0xA] = PCI_SPEED_UNKNOWN,
+	[0xB] = PCI_SPEED_UNKNOWN,
+	[0xC] = PCI_SPEED_UNKNOWN,
+	[0xD] = PCI_SPEED_UNKNOWN,
+	[0xE] = PCI_SPEED_UNKNOWN,
+	[0xF] = PCI_SPEED_UNKNOWN
 };
 EXPORT_SYMBOL_GPL(pcie_link_speed);

@@ -696,32 +696,32 @@ const char *pci_speed_string(enum pci_bus_speed speed)
 {
 	/* Indexed by the pci_bus_speed enum */
 	static const char *speed_strings[] = {
-	    "33 MHz PCI",		/* 0x00 */
-	    "66 MHz PCI",		/* 0x01 */
-	    "66 MHz PCI-X",		/* 0x02 */
-	    "100 MHz PCI-X",		/* 0x03 */
-	    "133 MHz PCI-X",		/* 0x04 */
-	    NULL,			/* 0x05 */
-	    NULL,			/* 0x06 */
-	    NULL,			/* 0x07 */
-	    NULL,			/* 0x08 */
-	    "66 MHz PCI-X 266",		/* 0x09 */
-	    "100 MHz PCI-X 266",	/* 0x0a */
-	    "133 MHz PCI-X 266",	/* 0x0b */
-	    "Unknown AGP",		/* 0x0c */
-	    "1x AGP",			/* 0x0d */
-	    "2x AGP",			/* 0x0e */
-	    "4x AGP",			/* 0x0f */
-	    "8x AGP",			/* 0x10 */
-	    "66 MHz PCI-X 533",		/* 0x11 */
-	    "100 MHz PCI-X 533",	/* 0x12 */
-	    "133 MHz PCI-X 533",	/* 0x13 */
-	    "2.5 GT/s PCIe",		/* 0x14 */
-	    "5.0 GT/s PCIe",		/* 0x15 */
-	    "8.0 GT/s PCIe",		/* 0x16 */
-	    "16.0 GT/s PCIe",		/* 0x17 */
-	    "32.0 GT/s PCIe",		/* 0x18 */
-	    "64.0 GT/s PCIe",		/* 0x19 */
+		[0x00] = "33 MHz PCI",
+		[0x01] = "66 MHz PCI",
+		[0x02] = "66 MHz PCI-X",
+		[0x03] = "100 MHz PCI-X",
+		[0x04] = "133 MHz PCI-X",
+		[0x05] = NULL,
+		[0x06] = NULL,
+		[0x07] = NULL,
+		[0x08] = NULL,
+		[0x09] = "66 MHz PCI-X 266",
+		[0x0a] = "100 MHz PCI-X 266",
+		[0x0b] = "133 MHz PCI-X 266",
+		[0x0c] = "Unknown AGP",
+		[0x0d] = "1x AGP",
+		[0x0e] = "2x AGP",
+		[0x0f] = "4x AGP",
+		[0x10] = "8x AGP",
+		[0x11] = "66 MHz PCI-X 533",
+		[0x12] = "100 MHz PCI-X 533",
+		[0x13] = "133 MHz PCI-X 533",
+		[0x14] = "2.5 GT/s PCIe",
+		[0x15] = "5.0 GT/s PCIe",
+		[0x16] = "8.0 GT/s PCIe",
+		[0x17] = "16.0 GT/s PCIe",
+		[0x18] = "32.0 GT/s PCIe",
+		[0x19] = "64.0 GT/s PCIe",
 	};

 	if (speed < ARRAY_SIZE(speed_strings))
--
2.35.1

