Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB44E8379
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:45:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnvz6nkCz3dv7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=S2prIJ+6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=ZESfxOfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=S2prIJ+6; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=ZESfxOfP; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlcB00Tkz307C
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:45 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 0DD1DFBC29; Sat, 26 Mar 2022 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314104; bh=HDJNUFNaZRuc9mdrjQyM6/8vy0/JkqPoaLqrDaW8yUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S2prIJ+6oG+jPpHDNrCoU7fAw8iEKYFyYqkwaVTPUC5q74a3t6JSeAIv1n0bfwFTh
 6/g3vstHz7hFEuPeIYE9ZeeHd0DxKUKgNmjRrwJHdsiazRAw5SXMLlkA3NRJSF3BgJ
 /5iYpzO7Z5aqvkr+cXBvqZZ+n5MFbj3wKGTK6V50W/Evj8qoALA2EO/UUTRSsaWjTS
 fdeh4wq66a9NC4SCqtDfbnQQs9YPTD3EBEgyoLdlAtTZNwN/ZdTY4CpbyLdB+mpfv6
 i36ay+I3Qtcah9vw5CPUAlvcvc9A6ppDu91m0IjUValAMVqNxInqs3apLzmJcr90QS
 X/Rvn/XaSW+aQ==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 2DB82FB7CD;
 Sat, 26 Mar 2022 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314099; bh=HDJNUFNaZRuc9mdrjQyM6/8vy0/JkqPoaLqrDaW8yUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZESfxOfP1ficzDOwydWI8+C/F3ouJMGJC6tf4AKAkdEpregRcXG20PgsKtilPdq13
 W8EQ3Cx6FOQOODyzjZ4lr+IgSLtoZaHTd5NxIpWRWspaT6BIxn1UVuyHgCtPOT4yQM
 bQpR2xEtzDBvOPbq532lUAGfrGyFBs3w68d5bAYuc4MO1PWb0x91MTstmWRpqnA1G7
 Sd0vZvLmGNBHaSZCx5xqn9XMMwtxOCTq4Rl5edD9hsUWeMqoJlv1bfYjRbXz0abjYX
 5DBq5O7rPCyiTxa6LC7JLdHrRuIfiSnkjqC6svuFsQd2U8uQUnuqEPJ19MzTs6mDJD
 18n23nDk5z+1Q==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 21/22] rtw89: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:08 +0100
Message-Id: <20220326165909.506926-21-benni@stuerz.xyz>
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
 drivers/net/wireless/realtek/rtw89/coex.c | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
index 684583955511..3c83a0bfb120 100644
--- a/drivers/net/wireless/realtek/rtw89/coex.c
+++ b/drivers/net/wireless/realtek/rtw89/coex.c
@@ -97,26 +97,26 @@ static const struct rtw89_btc_fbtc_slot s_def[] = {
 };
 
 static const u32 cxtbl[] = {
-	0xffffffff, /* 0 */
-	0xaaaaaaaa, /* 1 */
-	0x55555555, /* 2 */
-	0x66555555, /* 3 */
-	0x66556655, /* 4 */
-	0x5a5a5a5a, /* 5 */
-	0x5a5a5aaa, /* 6 */
-	0xaa5a5a5a, /* 7 */
-	0x6a5a5a5a, /* 8 */
-	0x6a5a5aaa, /* 9 */
-	0x6a5a6a5a, /* 10 */
-	0x6a5a6aaa, /* 11 */
-	0x6afa5afa, /* 12 */
-	0xaaaa5aaa, /* 13 */
-	0xaaffffaa, /* 14 */
-	0xaa5555aa, /* 15 */
-	0xfafafafa, /* 16 */
-	0xffffddff, /* 17 */
-	0xdaffdaff, /* 18 */
-	0xfafadafa  /* 19 */
+	[0]  = 0xffffffff,
+	[1]  = 0xaaaaaaaa,
+	[2]  = 0x55555555,
+	[3]  = 0x66555555,
+	[4]  = 0x66556655,
+	[5]  = 0x5a5a5a5a,
+	[6]  = 0x5a5a5aaa,
+	[7]  = 0xaa5a5a5a,
+	[8]  = 0x6a5a5a5a,
+	[9]  = 0x6a5a5aaa,
+	[10] = 0x6a5a6a5a,
+	[11] = 0x6a5a6aaa,
+	[12] = 0x6afa5afa,
+	[13] = 0xaaaa5aaa,
+	[14] = 0xaaffffaa,
+	[15] = 0xaa5555aa,
+	[16] = 0xfafafafa,
+	[17] = 0xffffddff,
+	[18] = 0xdaffdaff,
+	[19] = 0xfafadafa
 };
 
 struct rtw89_btc_btf_tlv {
-- 
2.35.1

