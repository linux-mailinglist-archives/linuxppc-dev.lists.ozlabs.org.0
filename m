Return-Path: <linuxppc-dev+bounces-15702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0DD1D00C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:04:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdsF3ftrz2yHD;
	Wed, 14 Jan 2026 19:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377793;
	cv=none; b=OjxZHy4DpsC3fQsr7kpIrN4lb9dIqeFtUOt5+TNMjDNbLSFaLlB4xeYEMgm/zQi2u0aQMolPX3+vEbFcZEdE/UThqpIrTq4WnOKmeS0IepcgbrSdOUOkUtwMCE6FqaN8AShL0RiW57512IlpBicFEBEjHBKK02xD8+iWsTCynDbMhRfH8y4uX6/QxLvLpb76JAnKU3c4I/gXj3r+T470nTWlcDgXjUy6GHBpgn1zV6cgQ1JUUVQ3uiekCMoNFbzb4Gp36UgoUb/EJCT2+tm2hqrKJpkWxj8dfefYqP350alVDxdHokwpgUycwd8bZ1BpXLLCVDt69QlVPy4IDjoqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377793; c=relaxed/relaxed;
	bh=wccHyx90+77q+HvZP634VNgb7Z8yQVCGjbolkwO42fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JV0y4fNFhdEY3MynNIpw5qQe48rhvOeREM+ONfzQVvJv2OPIX+spxmiFCXle6T4T1R/a4LUSJrrC0jLDBR1a4zDA53o9M40UiZTCiwKgv8JXYLIXjvCnqaho9d9fR3oYZEqdUL73phLOC5vyAnq1s77vjGmPYHjpRRUKe6dd8D3zsgjGlERInD+2PxYgGW9GyivkPR9oL2HTfsvUcTQd/2Bp43vUxsP090lUz4xGfalSAUSdN6L6PRKywqX73ShWkRotO/D3BtIvE8UCRwN10UA/0f4cwCmG9s4m8S0QhFmXKiYnEXFDQ1BdtsXeR6WHpTK3eWVHul9VPiwlPCCBXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FJq06CMr; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FJq06CMr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdsC4Wlkz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:03:09 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 179A7C1E4B4;
	Wed, 14 Jan 2026 08:02:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC76E6074A;
	Wed, 14 Jan 2026 08:03:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B92AC103C82AE;
	Wed, 14 Jan 2026 09:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768377783; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wccHyx90+77q+HvZP634VNgb7Z8yQVCGjbolkwO42fU=;
	b=FJq06CMrGUsDp0A7dlUoJU+xfMq5DxDxyEC6GTwjQmZzHw3askRRyKuu1uzafbDGFiC2JC
	rCnVtNMkayGQPuLM2ccJOsElIwo1a4A/HoXR60cJjMvd1sFYM01l9lTnRQDla6Bp4kPMTN
	f/9YhGRCIB0PjRjOMvr4c8X1qTR6E7DIpJmQGipvjmtR5FRbmG0ZuWbRtjdDLjQ8+J4tGJ
	tEdWoTq8MjhyRKNF3PsFvZG/Zq42qwyW3AVmPxRnmktiNIod/j4Id5Pw3t7sS3KII/f/6n
	FKaNMORzYf6o673G1wWB5+zeehxBs9l67sSNcACddVYTdP6GTd6AK2RlXYBd0Q==
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
Subject: [PATCH net v2] net: freescale: ucc_geth: Return early when TBI PHY can't be found
Date: Wed, 14 Jan 2026 09:02:46 +0100
Message-ID: <20260114080247.366252-1-maxime.chevallier@bootlin.com>
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

In ucc_geth's .mac_config(), we configure the TBI Serdes block represented by a
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
V2: Fix commit title, adjust a bit the commit log. No code change.

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


