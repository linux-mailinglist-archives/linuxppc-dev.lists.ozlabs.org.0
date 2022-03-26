Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 432CF4E8385
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:48:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnzF1j1Lz3bVX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:48:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=sOiuNOlq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=AlPQwI4E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=sOiuNOlq; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=AlPQwI4E; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm35d11z30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:35 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id C4160FBBA4; Sat, 26 Mar 2022 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314010; bh=l2IWPCqMKAH1wZwiF0dTGCOb58JalsVJpSOVxVm/2R4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sOiuNOlqhZ2bnfgzcgPvGCNAOQg5x5NqfFzAg1n1AxORZHqiC1+Mmpbwf8tcanVU8
 13BCnq8XG78PNnWOOd/YvCGqETFL4G2kPlwPTenLB2y/tvulPLtAWYuCpBmybehSIW
 522/M2q/85cLG5SGsYLcUet5p8g77uXE6Kj1XR4j0goYSPqIUGh0g/iGE6N/VMT3oo
 kP+7t/D3m/4KFY5oTXbk0TN/0vN9ww0XmlDajlg5kRwwFpWDrAg/DDfTegEtcYrI/K
 SK4ZsQbkZy1BRtAdeE13KvyG4n6UlMQHR8enPNhpM8vOXZdI09tlwH18EtHgvAGKUJ
 cZDxtmPcujhLg==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 8A2E4FB7F0;
 Sat, 26 Mar 2022 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314006; bh=l2IWPCqMKAH1wZwiF0dTGCOb58JalsVJpSOVxVm/2R4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AlPQwI4EjIDelvb9sF4uDVI7otwpQbfj6RKPYToutjnNxpt0yUwy6L1o6fhnNHML9
 IjOis25yddnKqT80p+JWkf7ie89Xz7ikPFa9eBWuVuoF28nvHT1nR0QaA8QlkLcfNz
 F++j1fFs+aEl1i2sLaj1VYlzUHQmtbV9jYG+n2TIzspceQ9ZiRO/3Me6/w9bom7+gQ
 57DAah7Nc1+01euyOmq0lMuDaWE6c/rM7RVHF+4v9hyADnsn7DtPxXibgKxlwELAkJ
 UBq3OD6Znyd/f15ARdsj2BbQPazIQ/WzcxiztoaGbrmnub0K3If1/KcHDORBXtoROm
 Vx8E2Z8ecrAMw==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 07/22] cm4000: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:54 +0100
Message-Id: <20220326165909.506926-7-benni@stuerz.xyz>
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
 drivers/char/pcmcia/cm4000_cs.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/char/pcmcia/cm4000_cs.c b/drivers/char/pcmcia/cm4000_cs.c
index adaec8fd4b16..8082025ab5b7 100644
--- a/drivers/char/pcmcia/cm4000_cs.c
+++ b/drivers/char/pcmcia/cm4000_cs.c
@@ -153,18 +153,18 @@ static struct class *cmm_class;
  * violates process/coding-style.rst.  However, I don't really think wrapping it around will
  * make it any clearer to read -HW */
 static unsigned char fi_di_table[10][14] = {
-/*FI     00   01   02   03   04   05   06   07   08   09   10   11   12   13 */
-/*DI */
-/* 0 */ {0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11},
-/* 1 */ {0x01,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x91,0x11,0x11,0x11,0x11},
-/* 2 */ {0x02,0x12,0x22,0x32,0x11,0x11,0x11,0x11,0x11,0x92,0xA2,0xB2,0x11,0x11},
-/* 3 */ {0x03,0x13,0x23,0x33,0x43,0x53,0x63,0x11,0x11,0x93,0xA3,0xB3,0xC3,0xD3},
-/* 4 */ {0x04,0x14,0x24,0x34,0x44,0x54,0x64,0x11,0x11,0x94,0xA4,0xB4,0xC4,0xD4},
-/* 5 */ {0x00,0x15,0x25,0x35,0x45,0x55,0x65,0x11,0x11,0x95,0xA5,0xB5,0xC5,0xD5},
-/* 6 */ {0x06,0x16,0x26,0x36,0x46,0x56,0x66,0x11,0x11,0x96,0xA6,0xB6,0xC6,0xD6},
-/* 7 */ {0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11},
-/* 8 */ {0x08,0x11,0x28,0x38,0x48,0x58,0x68,0x11,0x11,0x98,0xA8,0xB8,0xC8,0xD8},
-/* 9 */ {0x09,0x19,0x29,0x39,0x49,0x59,0x69,0x11,0x11,0x99,0xA9,0xB9,0xC9,0xD9}
+/*  FI     00   01   02   03   04   05   06   07   08   09   10   11   12   13 */
+/*  DI */
+	[0] = {0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11},
+	[1] = {0x01,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x91,0x11,0x11,0x11,0x11},
+	[2] = {0x02,0x12,0x22,0x32,0x11,0x11,0x11,0x11,0x11,0x92,0xA2,0xB2,0x11,0x11},
+	[3] = {0x03,0x13,0x23,0x33,0x43,0x53,0x63,0x11,0x11,0x93,0xA3,0xB3,0xC3,0xD3},
+	[4] = {0x04,0x14,0x24,0x34,0x44,0x54,0x64,0x11,0x11,0x94,0xA4,0xB4,0xC4,0xD4},
+	[5] = {0x00,0x15,0x25,0x35,0x45,0x55,0x65,0x11,0x11,0x95,0xA5,0xB5,0xC5,0xD5},
+	[6] = {0x06,0x16,0x26,0x36,0x46,0x56,0x66,0x11,0x11,0x96,0xA6,0xB6,0xC6,0xD6},
+	[7] = {0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11},
+	[8] = {0x08,0x11,0x28,0x38,0x48,0x58,0x68,0x11,0x11,0x98,0xA8,0xB8,0xC8,0xD8},
+	[9] = {0x09,0x19,0x29,0x39,0x49,0x59,0x69,0x11,0x11,0x99,0xA9,0xB9,0xC9,0xD9}
 };
 
 #ifndef CM4000_DEBUG
-- 
2.35.1

