Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A428A4E8367
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:40:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnpb34BWz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:40:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=eY1iX0wl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=M6I6oe9j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=eY1iX0wl; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=M6I6oe9j; 
 dkim-atps=neutral
X-Greylist: delayed 60 seconds by postgrey-1.36 at boromir;
 Sun, 27 Mar 2022 04:00:38 AEDT
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlZt2z7Mz303H
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:00:38 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 4F97BFBBE2; Sat, 26 Mar 2022 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314036; bh=yA14H5kSGXs8c9NCVOmgKRy/cJtHbkLoXQ2K5ISZu/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eY1iX0wlkZRA78TwrFBdZG5S+wos6UWvMNaeR3ebSkGbpl4BzyM69Wnujm+MCNQSH
 XbYHpCtunp+VYPd+8B4Z5YGwrYKyldxYneKwJEtMuoQi4VfjayP4248ZkrvYzPbvb7
 tGC3cCNQMmjqLyVHL80IqUG9N6enWqcQ/eJAksuxRO0+t/nSWobYmI6E3gPDs1NmYL
 ++FZTGyvor1q8BXZzeNj7KNTMHP2+jtmpdc0KeaKsrUDcsC7Efw6IdkQp5pRDFDxi5
 ZHAUmnDb1nehnND3R9P08aARBVYF4iAixYWRlLVzHEAsYgL1pTWrWTNVmmmb1i34gg
 o2AMI/9CsY+SQ==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id E7EF6FB7D3;
 Sat, 26 Mar 2022 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314033; bh=yA14H5kSGXs8c9NCVOmgKRy/cJtHbkLoXQ2K5ISZu/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M6I6oe9jogZM/zVnBnLg0eaNUUV4jcB+jkMO9qefS3HmAz419f42DcLOvKYiY1LvT
 ker3YtWSKtrbYWXcC4P4Q34z4I0kvS8nnURN2zDZp/1ciFgjp8H5+LMGc47dFCGwK3
 ZPM4LcjH7WSaWHLXUgQ1uu7Se/TXMvIZ6a51YDM4XN9HQOfPjY/V51c3xkYKlQc9Ff
 sw/spsdrAwyTcjFyMYk3HffZ0vEu3G6iY0fWhPwKxCUfoge6rziWcIxAyYMFWRia7f
 wJwSd/xnAYJBhYpaStdDoJq2gMpeyL3UlSNNsSRrS5W5qX2Ex1kaIwSG6rdxXYA+KQ
 WQdOdxe313yGg==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 11/22] rdmavt: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:58 +0100
Message-Id: <20220326165909.506926-11-benni@stuerz.xyz>
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
 drivers/infiniband/sw/rdmavt/rc.c | 62 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/infiniband/sw/rdmavt/rc.c b/drivers/infiniband/sw/rdmavt/rc.c
index 4e5d4a27633c..121b8a23ac07 100644
--- a/drivers/infiniband/sw/rdmavt/rc.c
+++ b/drivers/infiniband/sw/rdmavt/rc.c
@@ -10,37 +10,37 @@
  * Convert the AETH credit code into the number of credits.
  */
 static const u16 credit_table[31] = {
-	0,                      /* 0 */
-	1,                      /* 1 */
-	2,                      /* 2 */
-	3,                      /* 3 */
-	4,                      /* 4 */
-	6,                      /* 5 */
-	8,                      /* 6 */
-	12,                     /* 7 */
-	16,                     /* 8 */
-	24,                     /* 9 */
-	32,                     /* A */
-	48,                     /* B */
-	64,                     /* C */
-	96,                     /* D */
-	128,                    /* E */
-	192,                    /* F */
-	256,                    /* 10 */
-	384,                    /* 11 */
-	512,                    /* 12 */
-	768,                    /* 13 */
-	1024,                   /* 14 */
-	1536,                   /* 15 */
-	2048,                   /* 16 */
-	3072,                   /* 17 */
-	4096,                   /* 18 */
-	6144,                   /* 19 */
-	8192,                   /* 1A */
-	12288,                  /* 1B */
-	16384,                  /* 1C */
-	24576,                  /* 1D */
-	32768                   /* 1E */
+	[0x00] = 0,
+	[0x01] = 1,
+	[0x02] = 2,
+	[0x03] = 3,
+	[0x04] = 4,
+	[0x05] = 6,
+	[0x06] = 8,
+	[0x07] = 12,
+	[0x08] = 16,
+	[0x09] = 24,
+	[0x0A] = 32,
+	[0x0B] = 48,
+	[0x0C] = 64,
+	[0x0D] = 96,
+	[0x0E] = 128,
+	[0x0F] = 192,
+	[0x10] = 256,
+	[0x11] = 384,
+	[0x12] = 512,
+	[0x13] = 768,
+	[0x14] = 1024,
+	[0x15] = 1536,
+	[0x16] = 2048,
+	[0x17] = 3072,
+	[0x18] = 4096,
+	[0x19] = 6144,
+	[0x1A] = 8192,
+	[0x1B] = 12288,
+	[0x1C] = 16384,
+	[0x1D] = 24576,
+	[0x1E] = 32768
 };
 
 /**
-- 
2.35.1

