Return-Path: <linuxppc-dev+bounces-15613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1030D171A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 08:50:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr1cr7031z2xWJ;
	Tue, 13 Jan 2026 18:50:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768290620;
	cv=none; b=Bv2nixqfryz1p/xKC15JDQSZodPwjLWA6Vf5UZll0AkYfE66TmdDxdMxWo5BNhj01DOcbkyGMq3mHdCBKXJ8o1rqHOEgU+f9GpiegBBmf+6rMgvacum/wLEWDMAtea+SpZQP7+XyPZfF1D0S1aJfPBw3MDY2wufPKIfR8bS3wXHK63mf66zStMPTZTYU3uRZJadTYkowcF8w5s2H0SeoWXf1ws/hbZoPOqH+FP/Xw2F7G3h48MFyUaHudIQa4R7cFv+qV2Xer63RpjeLWN392fvPpY4G3Qc6Rzz/gYYVg+1FrD08yJlBnkgrOm2zHWRGPSE2XdVbstlqbds2o4s8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768290620; c=relaxed/relaxed;
	bh=HmfawJeph5zrc/JQ3yN5fBTmU7PzUKSvNQ03fKIgN2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUp7VfMfUTUP9PiCq3GoXpY8nTniE7yum0ND/hTrTUdhn/XMyVDc/TulK+DpKWZUutKDffK5JHXQJXeka3WqwizFpRmcM2wTOE5kQH9LOdK+zu9EEWgarHrkumAAP8O5X/GAiYGfsOjODMt6iYHxQh1E36Jxx4c2K2Ysz6G/j6RoBKziEzWKUsJ1YHmI3DH5f3WOKWaxY2gvi9wU9Gy5bOaDH0Cp4jpCQTjPbpjYLgNSzlmXt9seGVYjlzMxzes7rg5s4JvMiOjy+sx2Mp9un6sbO7cJo6KDkilQogm/jv7AWX8SqKk4eXllUcXx75+7HsL4XdpM8nsRsPxNcau1TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IhV3i2/m; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IhV3i2/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 403 seconds by postgrey-1.37 at boromir; Tue, 13 Jan 2026 18:50:19 AEDT
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr1cq3bYrz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 18:50:17 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09A83C20878;
	Tue, 13 Jan 2026 07:43:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6909B60732;
	Tue, 13 Jan 2026 07:43:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EF4A103C9297;
	Tue, 13 Jan 2026 08:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768290209; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HmfawJeph5zrc/JQ3yN5fBTmU7PzUKSvNQ03fKIgN2o=;
	b=IhV3i2/mfLNUHoS9K/xk7g7E069bNzozobESkhXkwuKPnhHyjy/jqwYbzx0j3daBQPjIGA
	6QGC8dBTCvXj9I0G5YZT93WIzHOL3aYorIE+LXOc0iLbA7ws4ymwoCZvEFP3yDbD9IMLtC
	MD2HEPEof7ZIKuV9PP0YsBocy35oQPc890QxD2gueebMpFM5nOjR0siIjuIJV8pqmzBFkc
	qvwjx0u1+afdtnUtZqz9dNt7R0hc9X+jk3pZN+/Ib6UMSc5vvw6NtQVc1O2G7cwhL/wfUM
	RofTXY/40NkSj9F06BLr1wIoGGEgNWlFBzinX7nq2dadLtRQcNOzX4MJq5jnkw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Dan Carpenter <dan.carpenter@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH net] net: freescale: ucc_geth: Return early when TBI found can't be found
Date: Tue, 13 Jan 2026 08:43:15 +0100
Message-ID: <20260113074316.145077-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In ucc_geth's .mac_config(), we configure the TBI block represented by a
struct phy_device that we get from firmware.

While porting to phylink, a check was missed to make sure we don't try
to access the TBI PHY if we can't get it. Let's add it and return early
in case of error

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202601130843.rFGNXA5a-lkp@intel.com/
Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index affd5a6c44e7..131d1210dc4a 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1602,8 +1602,10 @@ static void ugeth_mac_config(struct phylink_config *config, unsigned int mode,
 			pr_warn("TBI mode requires that the device tree specify a tbi-handle\n");
 
 		tbiphy = of_phy_find_device(ug_info->tbi_node);
-		if (!tbiphy)
+		if (!tbiphy) {
 			pr_warn("Could not get TBI device\n");
+			return;
+		}
 
 		value = phy_read(tbiphy, ENET_TBI_MII_CR);
 		value &= ~0x1000;	/* Turn off autonegotiation */
-- 
2.49.0


