Return-Path: <linuxppc-dev+bounces-3095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A262D9C4787
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 22:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnMTX2wPmz2xrC;
	Tue, 12 Nov 2024 08:03:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731359008;
	cv=none; b=Gumkh+1+hyPdNvR3qLkMAAjmIgn4ckHTT+cXF9ftWc+0gohedNLL5oHY8gMoL4Nh1ffjZNNNXRnczG3sbjPEVayQYuqM0InfJbFMI1tdH0fZujo/sR0jxGpNntP2RPIXKoE19vdC9IOf2qB51bgMjh36KVaemm6pHiYcsW+FPEo+gNygRR4k62VPqdSR3x52JCjwettnm5zNbJDg9bTEVB2E3i8ycKkMlFpDyjDIY4aIPDnyEzQ+JUuqf+nY2ON2u8zrowTRgqtTnerJVlB6v16WG0CWxifNK7z5N0g8avL5arPZ24Oic/YppbZKVhmuTlyYhP6Vp2U2o3TmoaKA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731359008; c=relaxed/relaxed;
	bh=azWUPzqegtxwsVeH4tA/deu682NaDN2sJPDW2kMEdrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwS96xsKtWuFfW/UQ5kcDRx9GkZvydSpK1zYe2JJIPkm49+mLaBEtsao8Vj4k9chszfHDO+4C5z8RiKrGPS0XDIybOuR2yBwRfMC9CzJof7YfUEa9yZ5ZEsCV1H1N78ggynAk+cWP2gEFU/cmYQpfTZOKC6xB810UTVJSixKkIKUOKiEXikOBX3tRSGhqWZ5bJ0gVpnEENs0u4n/3QmcDwUmR3GdE6vKadwxXJIo7E+ThzzR5WzkgSiJpiK6CmVP98p92UDqDFeMEbKtjuqeB0G90wXgEXGpKwgeFDMNItjhkNiC0tobOveuZZoiBOG+u1uVVbN2vYOEaEkDO3iCXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LUciDA2z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LUciDA2z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnMTT6B3Cz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 08:03:24 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so353441a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 13:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731359000; x=1731963800; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=azWUPzqegtxwsVeH4tA/deu682NaDN2sJPDW2kMEdrQ=;
        b=LUciDA2zm8J/igs+GAIJvoUEb5VNVq+qUmH5BKESyFX06QtNKyiTQoe0g0JrsuHeYe
         LlS9Z2UAwQBY8qLqU/4zfNksXZ5y3Ge0Uetnlk8z1mopmpmC3+szVjJFp0oSkNiFX7GR
         bfzDnOhW962CYu7Ge4I/n5Q9Ta9bB1KUq0UmJxM+kVy6nLqHByQFyROUU4LHiqCVUtrB
         +HCptKl4mFdKwKsXdbaeDN384ege1KhFicskmWmtKkC+zk/JEBAb7Z7986+TmqSl4XHu
         0HA7z+9hyxTgYaHsarE5k8ihfxZaxh4y3/MXw9KgprIKptnHabsyKDfkSzOp/z4JJKoY
         8FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731359000; x=1731963800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azWUPzqegtxwsVeH4tA/deu682NaDN2sJPDW2kMEdrQ=;
        b=nUL/FcKHNOzf8XI8HqelJFTw+XQvGHVdqAhihvGQigMSeMMj7KktERIF9luPvMS9dM
         w5V0+zcY2RPuaS85yrTI+O2uztdlRiwYnGiU7JXVpFfRGzecGY+NRo5876t0ngvUCKis
         olc5PaETaOBFu3NbCGi/BTHSX+gCAzBXq0awQ+aKOBSc9if/o3uAhUPtGZt4zEFBmDzM
         wnMXaD62TjwH190/NHgnSFcnthcihbm0t53Y7Wt+sQ5VeKxcm48wmrw9oDFj/ZoZn+6V
         dLd6o3JvZNgEBUxD3z1sr/AnhIUACtdN8ghMs95Ae9qmFzhZQ4TuJeF/kkKPqXmg2V+V
         UNlA==
X-Forwarded-Encrypted: i=1; AJvYcCXHaI0gqEepdgSB/56XiO4eun3s0SpCvaialSp8DzOcwcNSky3VogcmuOfj2MjNGEtJb7ndcIUk2Zj67RM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YykEo+SaM32GrrvUoxguuyNt4xhANGZ6/7xLOKQnyTjsMlYLmQo
	HGuNHVq+AYyYYOPDHFvfmaTQzWnSjJOvUsSkdLavM54i5U0n0AoZ
X-Google-Smtp-Source: AGHT+IF9mm136ZfH42Wc8PlDV1uhfJ4fHvtgeZ2Mx3K3btkIep/FS55/7z34rbpqTLR4aKZtBg7HUg==
X-Received: by 2002:a17:90b:5310:b0:2d3:cd27:c480 with SMTP id 98e67ed59e1d1-2e9b1787df7mr18324281a91.33.1731358999801;
        Mon, 11 Nov 2024 13:03:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fe8eb7sm9157309a91.50.2024.11.11.13.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 13:03:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Byungho An <bh74.an@samsung.com>,
	Kevin Brace <kevinbrace@bracecomputerlab.com>,
	Francois Romieu <romieu@fr.zoreil.com>,
	Michal Simek <michal.simek@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Zhao Qiang <qiang.zhao@nxp.com>,
	linux-can@vger.kernel.org (open list:CAN NETWORK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC FS_ENET DRIVER)
Subject: [PATCHv2 net-next] net: use pdev instead of OF funcs
Date: Mon, 11 Nov 2024 13:03:16 -0800
Message-ID: <20241111210316.15357-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

np here is the node coming from platform_device. No children are used.

I changed irq_of_parse_and_map to platform_get_irq to pass it directly.

I changed of_address_to_resource to platform_get_resource for the same
reason.

It ends up being the same.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fixed compilation errors. Also removed non devm transformations.
 Those will be handled separately. Also reworded description.
 drivers/net/can/grcan.c                          |  2 +-
 drivers/net/can/mscan/mpc5xxx_can.c              |  2 +-
 drivers/net/dsa/bcm_sf2.c                        |  4 ++--
 drivers/net/ethernet/allwinner/sun4i-emac.c      |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c     |  6 +++---
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c |  2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c |  2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c |  2 +-
 drivers/net/ethernet/freescale/ucc_geth.c        | 12 ++++++------
 drivers/net/ethernet/marvell/mvneta.c            |  2 +-
 drivers/net/ethernet/moxa/moxart_ether.c         |  5 ++---
 .../net/ethernet/samsung/sxgbe/sxgbe_platform.c  |  8 ++++----
 drivers/net/ethernet/via/via-rhine.c             |  2 +-
 drivers/net/ethernet/via/via-velocity.c          |  2 +-
 drivers/net/ethernet/xilinx/ll_temac_mdio.c      |  6 +++---
 drivers/net/mdio/mdio-mux-mmioreg.c              | 16 +++++++++-------
 drivers/net/wan/fsl_ucc_hdlc.c                   | 10 +++++-----
 17 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index cdf0ec9fa7f3..0a2cc0ba219f 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *ofdev)
 		goto exit_error;
 	}
 
-	irq = irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
+	irq = platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
 	if (!irq) {
 		dev_err(&ofdev->dev, "no irq found\n");
 		err = -ENODEV;
diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/mpc5xxx_can.c
index 0080c39ee182..252ad40bdb97 100644
--- a/drivers/net/can/mscan/mpc5xxx_can.c
+++ b/drivers/net/can/mscan/mpc5xxx_can.c
@@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device *ofdev)
 	if (!base)
 		return dev_err_probe(&ofdev->dev, err, "couldn't ioremap\n");
 
-	irq = irq_of_parse_and_map(np, 0);
+	irq = platform_get_irq(ofdev, 0);
 	if (!irq) {
 		dev_err(&ofdev->dev, "no irq found\n");
 		err = -ENODEV;
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 43bde1f583ff..9229582efd05 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 		of_node_put(ports);
 	}
 
-	priv->irq0 = irq_of_parse_and_map(dn, 0);
-	priv->irq1 = irq_of_parse_and_map(dn, 1);
+	priv->irq0 = platform_get_irq(pdev, 0);
+	priv->irq1 = platform_get_irq(pdev, 1);
 
 	base = &priv->core;
 	for (i = 0; i < BCM_SF2_REGS_NUM; i++) {
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 2f516b950f4e..18df8d1d93fd 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
 
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr = (unsigned long)db->membase;
-	ndev->irq = irq_of_parse_and_map(np, 0);
+	ndev->irq = platform_get_irq(pdev, 0);
 	if (ndev->irq == -ENXIO) {
 		netdev_err(ndev, "No irq resource\n");
 		ret = ndev->irq;
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index 6b47a2196a46..67e65a63a36f 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -839,7 +839,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	ndev->netdev_ops	= &mpc52xx_fec_netdev_ops;
 	ndev->ethtool_ops	= &mpc52xx_fec_ethtool_ops;
 	ndev->watchdog_timeo	= FEC_WATCHDOG_TIMEOUT;
-	ndev->base_addr		= mem.start;
+	ndev->base_addr		= mem->start;
 	SET_NETDEV_DEV(ndev, &op->dev);
 
 	spin_lock_init(&priv->lock);
@@ -859,9 +859,9 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 
 	/* Get the IRQ we need one by one */
 		/* Control */
-	ndev->irq = irq_of_parse_and_map(np, 0);
+	ndev->irq = platform_get_irq(op, 0);
 
-		/* RX */
+	/* RX */
 	priv->r_irq = bcom_get_task_irq(priv->rx_dmatsk);
 
 		/* TX */
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index be63293511d9..8bed0ea11dd1 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -83,7 +83,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 	struct fs_platform_info *fpi = fep->fpi;
 	int ret = -EINVAL;
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	fep->interrupt = platform_get_irq(ofdev, 0);
 	if (!fep->interrupt)
 		goto out;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index f2ecd20027cf..8dbd624b87ac 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -88,7 +88,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 {
 	struct platform_device *ofdev = to_platform_device(fep->dev);
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	fep->interrupt = platform_get_irq(ofdev, 0);
 	if (!fep->interrupt)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 6c97191649de..53d67fb08bad 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -87,7 +87,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 {
 	struct platform_device *ofdev = to_platform_device(fep->dev);
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	fep->interrupt = platform_get_irq(ofdev, 0);
 	if (!fep->interrupt)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 30453a20e467..f05b2b6857f6 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3563,7 +3563,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	struct net_device *dev = NULL;
 	struct ucc_geth_private *ugeth = NULL;
 	struct ucc_geth_info *ug_info;
-	struct resource res;
+	struct resource *res;
 	int err, ucc_num, max_speed = 0;
 	const unsigned int *prop;
 	phy_interface_t phy_interface;
@@ -3608,12 +3608,12 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	if (err)
 		return err;
 
-	err = of_address_to_resource(np, 0, &res);
-	if (err)
-		return err;
+	res = platform_get_resource(ofdev, 0, IORESOURCE_MEM);
+	if (!res)
+		return -ENODEV;
 
-	ug_info->uf_info.regs = res.start;
-	ug_info->uf_info.irq = irq_of_parse_and_map(np, 0);
+	ug_info->uf_info.regs = res->start;
+	ug_info->uf_info.irq = platform_get_irq(ofdev, 0);
 
 	ug_info->phy_node = of_parse_phandle(np, "phy-handle", 0);
 	if (!ug_info->phy_node && of_phy_is_fixed_link(np)) {
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 7bb781fb93b5..6039b7794b15 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5511,7 +5511,7 @@ static int mvneta_probe(struct platform_device *pdev)
 		pp->neta_ac5 = true;
 	}
 
-	dev->irq = irq_of_parse_and_map(dn, 0);
+	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq == 0)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/moxa/moxart_ether.c b/drivers/net/ethernet/moxa/moxart_ether.c
index 8bd60168624a..d931d439f139 100644
--- a/drivers/net/ethernet/moxa/moxart_ether.c
+++ b/drivers/net/ethernet/moxa/moxart_ether.c
@@ -454,7 +454,6 @@ static const struct net_device_ops moxart_netdev_ops = {
 static int moxart_mac_probe(struct platform_device *pdev)
 {
 	struct device *p_dev = &pdev->dev;
-	struct device_node *node = p_dev->of_node;
 	struct net_device *ndev;
 	struct moxart_mac_priv_t *priv;
 	struct resource *res;
@@ -465,9 +464,9 @@ static int moxart_mac_probe(struct platform_device *pdev)
 	if (!ndev)
 		return -ENOMEM;
 
-	irq = irq_of_parse_and_map(node, 0);
+	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
-		netdev_err(ndev, "irq_of_parse_and_map failed\n");
+		netdev_err(ndev, "platform_get_irq failed\n");
 		ret = -EINVAL;
 		goto irq_map_fail;
 	}
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
index 2eccc7617507..4118e35b99e5 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
@@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 	}
 
 	/* Get the SXGBE common INT information */
-	priv->irq  = irq_of_parse_and_map(node, 0);
+	priv->irq = platform_get_irq(pdev, 0);
 	if (priv->irq <= 0) {
 		dev_err(dev, "sxgbe common irq parsing failed\n");
 		goto err_drv_remove;
@@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 
 	/* Get the TX/RX IRQ numbers */
 	for (i = 0, chan = 1; i < SXGBE_TX_QUEUES; i++) {
-		priv->txq[i]->irq_no = irq_of_parse_and_map(node, chan++);
+		priv->txq[i]->irq_no = platform_get_irq(pdev, chan++);
 		if (priv->txq[i]->irq_no <= 0) {
 			dev_err(dev, "sxgbe tx irq parsing failed\n");
 			goto err_tx_irq_unmap;
@@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < SXGBE_RX_QUEUES; i++) {
-		priv->rxq[i]->irq_no = irq_of_parse_and_map(node, chan++);
+		priv->rxq[i]->irq_no = platform_get_irq(pdev, chan++);
 		if (priv->rxq[i]->irq_no <= 0) {
 			dev_err(dev, "sxgbe rx irq parsing failed\n");
 			goto err_rx_irq_unmap;
 		}
 	}
 
-	priv->lpi_irq = irq_of_parse_and_map(node, chan);
+	priv->lpi_irq = platform_get_irq(pdev, chan);
 	if (priv->lpi_irq <= 0) {
 		dev_err(dev, "sxgbe lpi irq parsing failed\n");
 		goto err_rx_irq_unmap;
diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index 894911f3d560..f079242c33e2 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -1127,7 +1127,7 @@ static int rhine_init_one_platform(struct platform_device *pdev)
 	if (IS_ERR(ioaddr))
 		return PTR_ERR(ioaddr);
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	irq = platform_get_irq(pdev, 0);
 	if (!irq)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index 72271a51d0e7..e92cc8122c1e 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -2950,7 +2950,7 @@ static int velocity_platform_probe(struct platform_device *pdev)
 	if (!info)
 		return -EINVAL;
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	irq = platform_get_irq(pdev, 0);
 	if (!irq)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/xilinx/ll_temac_mdio.c b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
index 07a9fb49eda1..4bc5d47ecb7e 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_mdio.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
@@ -69,7 +69,7 @@ int temac_mdio_setup(struct temac_local *lp, struct platform_device *pdev)
 	u32 bus_hz;
 	int clk_div;
 	int rc;
-	struct resource res;
+	struct resource *res;
 
 	/* Get MDIO bus frequency (if specified) */
 	bus_hz = 0;
@@ -98,9 +98,9 @@ int temac_mdio_setup(struct temac_local *lp, struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (np) {
-		of_address_to_resource(np, 0, &res);
+		res = platform_get_resource(pdev, 0, IORESOURCE_MEM);
 		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
-			 (unsigned long long)res.start);
+			 (unsigned long long)res->start);
 	} else if (pdata) {
 		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
 			 pdata->mdio_bus_id);
diff --git a/drivers/net/mdio/mdio-mux-mmioreg.c b/drivers/net/mdio/mdio-mux-mmioreg.c
index 9c4b1efd0d53..b5a65a1ab406 100644
--- a/drivers/net/mdio/mdio-mux-mmioreg.c
+++ b/drivers/net/mdio/mdio-mux-mmioreg.c
@@ -98,7 +98,7 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct mdio_mux_mmioreg_state *s;
-	struct resource res;
+	struct resource *res;
 	const __be32 *iprop;
 	int len, ret;
 
@@ -108,13 +108,15 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 	if (!s)
 		return -ENOMEM;
 
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "could not obtain memory map for node %pOF\n", np);
-	s->phys = res.start;
+	res = platform_get_resource(pdev, 0, IORESOURCE_MEM);
+	if (!res) {
+		dev_err(&pdev->dev,
+			"could not obtain memory map for node %pOF\n", np);
+		return -ENODEV;
+	}
+	s->phys = res->start;
 
-	s->iosize = resource_size(&res);
+	s->iosize = resource_size(res);
 	if (s->iosize != sizeof(uint8_t) &&
 	    s->iosize != sizeof(uint16_t) &&
 	    s->iosize != sizeof(uint32_t))
diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index f999798a5612..414a9d22da5e 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1118,7 +1118,7 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 	struct ucc_hdlc_private *uhdlc_priv = NULL;
 	struct ucc_tdm_info *ut_info;
 	struct ucc_tdm *utdm = NULL;
-	struct resource res;
+	struct resource *res;
 	struct net_device *dev;
 	hdlc_device *hdlc;
 	int ucc_num;
@@ -1170,12 +1170,12 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
+	res = platform_get_resource(pdev, 0, IORESOURCE_MEM);
+	if (!res)
 		return -EINVAL;
 
-	ut_info->uf_info.regs = res.start;
-	ut_info->uf_info.irq = irq_of_parse_and_map(np, 0);
+	ut_info->uf_info.regs = res->start;
+	ut_info->uf_info.irq = platform_get_irq(pdev, 0);
 
 	uhdlc_priv = kzalloc(sizeof(*uhdlc_priv), GFP_KERNEL);
 	if (!uhdlc_priv)
-- 
2.47.0


