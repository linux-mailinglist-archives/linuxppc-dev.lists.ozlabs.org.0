Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8B4E837E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnx45ktfz3bj9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:46:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=ufnfsXYy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=Hf7mJJcW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=ufnfsXYy; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=Hf7mJJcW; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm348pvz307W
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:35 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 9EAA5FBBC0; Sat, 26 Mar 2022 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314017; bh=HOFmAYiVvnT7rSVfobZmsnPlgQ5nBBe17TNp3HtbNU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ufnfsXYyR3N17k3zg+cOeF1ppjMFAshfvhuH1gVyMVcHkxpYZUapf7tDtaq5gpMoc
 ucbhQRPg+EJe/T7pwIyM+Dmt539N9vIAt48cadCWafXguWUDxDzCibWT8kUeWxZEWR
 BdurrHkkyyIkhvYZzYqDYMGeN8tvhTMIeIMtGoVoBO6Q/fnGSOxPV+bNxu6e0Bxt+8
 o6B2bX7Sn945aiMUChPEkF76/dFsUOmOLC17kjJHpt0K3aJjNFLSc0kgz0B44av7KA
 gWE7tRpnnfiqAZ452yIXrpC30AZUgte9sc5+sjee+LQzE1HHEiGCM7aR9XN1M7KFVr
 6q8TtmG2xujBA==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 20D94FB7EA;
 Sat, 26 Mar 2022 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314013; bh=HOFmAYiVvnT7rSVfobZmsnPlgQ5nBBe17TNp3HtbNU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hf7mJJcWBmIj3C+XCxyzFO7S9C0oUaIl8hxKEGBu6X8vw2n1pWSpj6iB15/DP+6Lp
 3QX2TjmaymPMgIhJcqwVkwY6dEsEyphIorKi1wt0xa4x6MJ6oAZB59LvQ3nuveeFu0
 348YW/tdR5UvOfRwGWcPa9XVwbxu+xibpp/4thWzzXOlH3zZnJHzTtHyLYycZzhdQ3
 Slg6rVaVkmUpHlV6SbMwW2oDlerJ1InqL387Q5Q/hQQJH1awaV4a52wpm8TuxMZYnL
 WGg8OJF9bO4XtyqoNzz5xIgxnsqwooQQF0Nsc2pHaLUBhYt9zf8O+zC8ZiS2I6nTZh
 bsWtkEHhv2HFw==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 08/22] i5100: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:55 +0100
Message-Id: <20220326165909.506926-8-benni@stuerz.xyz>
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
 drivers/edac/i5100_edac.c | 44 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/edac/i5100_edac.c b/drivers/edac/i5100_edac.c
index 324a46b8479b..5992f0ee5f28 100644
--- a/drivers/edac/i5100_edac.c
+++ b/drivers/edac/i5100_edac.c
@@ -379,28 +379,28 @@ static int i5100_rank_to_slot(const struct mem_ctl_info *mci,
 static const char *i5100_err_msg(unsigned err)
 {
 	static const char *merrs[] = {
-		"unknown", /* 0 */
-		"uncorrectable data ECC on replay", /* 1 */
-		"unknown", /* 2 */
-		"unknown", /* 3 */
-		"aliased uncorrectable demand data ECC", /* 4 */
-		"aliased uncorrectable spare-copy data ECC", /* 5 */
-		"aliased uncorrectable patrol data ECC", /* 6 */
-		"unknown", /* 7 */
-		"unknown", /* 8 */
-		"unknown", /* 9 */
-		"non-aliased uncorrectable demand data ECC", /* 10 */
-		"non-aliased uncorrectable spare-copy data ECC", /* 11 */
-		"non-aliased uncorrectable patrol data ECC", /* 12 */
-		"unknown", /* 13 */
-		"correctable demand data ECC", /* 14 */
-		"correctable spare-copy data ECC", /* 15 */
-		"correctable patrol data ECC", /* 16 */
-		"unknown", /* 17 */
-		"SPD protocol error", /* 18 */
-		"unknown", /* 19 */
-		"spare copy initiated", /* 20 */
-		"spare copy completed", /* 21 */
+		[0]  = "unknown",
+		[1]  = "uncorrectable data ECC on replay",
+		[2]  = "unknown",
+		[3]  = "unknown",
+		[4]  = "aliased uncorrectable demand data ECC",
+		[5]  = "aliased uncorrectable spare-copy data ECC",
+		[6]  = "aliased uncorrectable patrol data ECC",
+		[7]  = "unknown",
+		[8]  = "unknown",
+		[9]  = "unknown",
+		[10] = "non-aliased uncorrectable demand data ECC",
+		[11] = "non-aliased uncorrectable spare-copy data ECC",
+		[12] = "non-aliased uncorrectable patrol data ECC",
+		[13] = "unknown",
+		[14] = "correctable demand data ECC",
+		[15] = "correctable spare-copy data ECC",
+		[16] = "correctable patrol data ECC",
+		[17] = "unknown",
+		[18] = "SPD protocol error",
+		[19] = "unknown",
+		[20] = "spare copy initiated",
+		[21] = "spare copy completed",
 	};
 	unsigned i;
 
-- 
2.35.1

