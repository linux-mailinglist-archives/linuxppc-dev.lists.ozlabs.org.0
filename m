Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811E4E8373
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:44:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQntN1TMsz3chr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:44:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=eiGwixJH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=qP7TgvW3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=eiGwixJH; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=qP7TgvW3; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlbm3ws7z306m
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:24 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 939E1FBC1A; Sat, 26 Mar 2022 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314082; bh=Atyp98CUeE2ls+rskgXqrYpiNVHIwFrsLn7qDkbs1Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eiGwixJHX40Mjai348pC1lzflWdZ4/TWZvazf9NVycjGc0PoBYsj0VNy4j7Mka+za
 a98m3NgnjoaCQtJcSVruSWZOywSSMCwwRWVny8PIEa5HlhaMJ8CJpagtorYZ4VqqEV
 qUgJYgoyi6RCc+k7y2g+pqAHlpazsKDlcdUpMvx72f2250fcmH7JaxOoHrHPYQmujg
 TBeaur9eBRGLzUqe67csfwQgqaU/6VFraimJlb+3o+ETHLpCgIHKp/oUornHhtMyik
 aun2rkV4cjxuTLhmj8e41iD+LRkrH3uMSjCVR/HpCU2uZtl+tDVLk54fHYcwao3JPi
 gycpBPm2WkAEg==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 4CC2BFBB90;
 Sat, 26 Mar 2022 17:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314079; bh=Atyp98CUeE2ls+rskgXqrYpiNVHIwFrsLn7qDkbs1Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qP7TgvW3oJ/sA3Yix4CPfWDhnnvNFSatDRinq+EiKUXUQ0FdQI4CUN9Ml1XU1whAq
 vjdvv9SLrRySrhuWfF7F3KT2Q0Q/afP2v/4p8uBka44hkcxbWaTdYLE/dfa6u+aVZs
 Hu5FjvNMk5YoWc87f4DSc4bGRxf3NY8w37161qCITHdWuasXmmoH++J1nnLZ8uMitr
 F2UHAiWPQaYkH9C51bVT6N2PKeePCyXwAGryWdjCX70SGZRwLFc7L5r/epKTjpJVF3
 Zxaxa7nN8V9aWqLDpaEQ1RakPYyfGoCHqw6V3gcaaKjBWRIkdx8c/QesH3NlUg1hGk
 gD7/Pz6t0ggBg==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 18/22] smsc: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:05 +0100
Message-Id: <20220326165909.506926-18-benni@stuerz.xyz>
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
 drivers/net/ethernet/smsc/smc9194.h | 15 ++++++---------
 drivers/net/ethernet/smsc/smc91x.h  | 18 ++++++++----------
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc9194.h b/drivers/net/ethernet/smsc/smc9194.h
index cf69d0a5a1cb..e1c780afb9bb 100644
--- a/drivers/net/ethernet/smsc/smc9194.h
+++ b/drivers/net/ethernet/smsc/smc9194.h
@@ -163,15 +163,12 @@ typedef unsigned long int 		dword;
 #define CHIP_91100	7
 
 static const char * chip_ids[ 15 ] =  {
-	NULL, NULL, NULL,
-	/* 3 */ "SMC91C90/91C92",
-	/* 4 */ "SMC91C94",
-	/* 5 */ "SMC91C95",
-	NULL,
-	/* 7 */ "SMC91C100",
-	/* 8 */ "SMC91C100FD",
-	NULL, NULL, NULL,
-	NULL, NULL, NULL};
+	[3] = "SMC91C90/91C92",
+	[4] = "SMC91C94",
+	[5] = "SMC91C95",
+	[7] = "SMC91C100",
+	[8] = "SMC91C100FD",
+};
 
 /*
  . Transmit status bits
diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 387539a8094b..122cdc849507 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -731,16 +731,14 @@ smc_pxa_dma_insw(void __iomem *ioaddr, struct smc_local *lp, int reg, int dma,
 #define CHIP_91111FD	9
 
 static const char * chip_ids[ 16 ] =  {
-	NULL, NULL, NULL,
-	/* 3 */ "SMC91C90/91C92",
-	/* 4 */ "SMC91C94",
-	/* 5 */ "SMC91C95",
-	/* 6 */ "SMC91C96",
-	/* 7 */ "SMC91C100",
-	/* 8 */ "SMC91C100FD",
-	/* 9 */ "SMC91C11xFD",
-	NULL, NULL, NULL,
-	NULL, NULL, NULL};
+	[3] = "SMC91C90/91C92",
+	[4] = "SMC91C94",
+	[5] = "SMC91C95",
+	[6] = "SMC91C96",
+	[7] = "SMC91C100",
+	[8] = "SMC91C100FD",
+	[9] = "SMC91C11xFD",
+};
 
 
 /*
-- 
2.35.1

