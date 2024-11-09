Return-Path: <linuxppc-dev+bounces-3073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFC9C301C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2024 00:38:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmC1V54l9z2y8W;
	Sun, 10 Nov 2024 10:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731195518;
	cv=none; b=buAuhWKluQeqUcMif6mAiyE6ZQQRfPPG+P6cu1IP2wOZD30OpTffdPBHj6MFivpXEQwn3ZSMU8v1Au4ViYbloNABb4w2OGT1XcRK8j88eEh0A/bXJolZVx+SXKcK/xaJuas25eFH6dP10ib4mEyXYBL8ZOiMVuO9rcXtXXKUXEVJmcwCGY2DLcVWg/HPkr/Ks/XG9ni6Gaozwam7mhIdLtTl74O/JjNT5W2OKkayfEWpuinlssPhKjG7qrDhoBdY3Jwk5JGy5FFqvuhzxHyb7G0EXNmKBXENgdDs8+6yZqR0p9F6NBlQPqI3j4laaiXaq00NE44/54/4zvv+DHpuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731195518; c=relaxed/relaxed;
	bh=4WS9Cf0rpv763uMkx6ljFiQoDVVkOxO5ZGRudjYIJ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nolrnZOLsQ0bR5q/wwMRAFw2Qn0wvPGRDPCz7foRh0iWfHpzx9zJET8LckWIPhyjUOqwVHX/thdysX8mbXpt6rh+o7ab5okN3yjjGHj+jKgHViuAQR08YI4h5aYyWXLhNLXnkMVEGSRjrFBm+WBGnsiqvc/nRj/2kOLZTZXhoPuMvVAwyBvkB7UKXGW3JisenlpdAGLdwomTIh0/6MBm1ch/15vEbzwc9po/K21ZF+5wjB2qS/AVh09/J9HZU4fvPtILU10RxTvAx9qIoLQ6Lhj7XtHCaRq5iU3RQKeqEY+Qn4M1n4XcV/IAHlE1LfK42+MYn4iDuy+foVjz27+iYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7E2n+/g; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7E2n+/g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmC1Q75nxz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2024 10:38:33 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cb7139d9dso31870895ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 Nov 2024 15:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731195504; x=1731800304; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WS9Cf0rpv763uMkx6ljFiQoDVVkOxO5ZGRudjYIJ+8=;
        b=F7E2n+/g42pBTzFBhtyeuuKfOpyKabnP6NfqaRybhAJrTzVMhy28pfX/Iddvz7kJq4
         EtOGgNNGPPRDDRG/KqrGLBjPaiP7PW9lfFLJ98sMzMzOfjLbC+EVQNBmpfnHZDgr75C/
         xHuh6CmEKTkeaQXFdcNAtE3Rev0ykO5vITcny1trGEC7uo7llUZf1s+BCrua3R0wZa5r
         6q5bIWIvVb12RskXuT2yu8gP/jP+SLZhy9HVZ2XVsiTjLz8tBug+kc+rOyxQu9LG2Mf8
         bhQcFLYYT0kEQ1sQUW/r4DsW355MSIAPXCI3LfPeKYdDZbNvtON6C3D9kQHFUeTT2ScG
         vC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731195504; x=1731800304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WS9Cf0rpv763uMkx6ljFiQoDVVkOxO5ZGRudjYIJ+8=;
        b=TK9PcLJjyXGslFSH3T23Xc7kpG+zxzeXO/bQiIhi2nwGevpFJLGD1TnDKKX3HjiNeG
         vzNN8g7W/PmLA7wntdt5ujf3MoO7VPoCdgorMRnVO2sdYYQW4VXtBsi3AUk+Wg3dyRQb
         RIh5Bf5I/HW9BgEJAFzgTrGfzObZPqw9C15+ucG2auENViqznwudRdmXl/WeLT8YGLAN
         RSlQ2/uDm5oSCO8cPtQ/XtZVxq3jsfjc+xJYpR2IAbYVYS+dfTGcXllDquqZB+K/JAeS
         /S7WstVGhjuU5iESSjjq7shyiEA35EBBnizO7Kd8JxW4MIMxuzm4qwnoygg+XcQ1MXb3
         HNUw==
X-Forwarded-Encrypted: i=1; AJvYcCU6UtU7W//YCJU17ymb59k1xW3jB8DMNA3kOWdCvrzbzJAdQ36ZIVppXGFigs+izil2BHXE3oMT1lcmATk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzl8rL8+H5NHHQk0QcLeXBMgrBCqjfb9xMoYQE2hIdn3nRgYG7G
	9DA1hD0bBkZQaS/W5iNaY/wNGiW3JEQpC8Z1pyoLmCzXYkWwQ+eW
X-Google-Smtp-Source: AGHT+IFWJIUgHc1oRxZrf0aN5OX+ho3LnxY/4odziwXSjaXs6zql+r8FAmb9Rw6CT2WgI37pumpZrg==
X-Received: by 2002:a17:902:f541:b0:20d:1866:ed6f with SMTP id d9443c01a7336-21183ccf11bmr103236155ad.4.1731195504224;
        Sat, 09 Nov 2024 15:38:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e86e30sm50116915ad.281.2024.11.09.15.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:38:23 -0800 (PST)
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
Subject: [PATCH net-next] net: use pdev instead of OF funcs
Date: Sat,  9 Nov 2024 15:38:21 -0800
Message-ID: <20241109233821.8619-1-rosenp@gmail.com>
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

np here is ofdev->dev.of_node. Better to use the proper functions as
there's no use of children or anything else.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/can/grcan.c                       |  2 +-
 drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
 drivers/net/dsa/bcm_sf2.c                     |  4 ++--
 drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
 .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
 drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
 drivers/net/ethernet/marvell/mvneta.c         |  2 +-
 drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
 .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
 drivers/net/ethernet/via/via-rhine.c          |  2 +-
 drivers/net/ethernet/via/via-velocity.c       |  2 +-
 drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
 drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
 drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
 19 files changed, 66 insertions(+), 59 deletions(-)

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
index 2bfaf14f65c8..553d33a98c99 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	int rv;
 	struct net_device *ndev;
 	struct mpc52xx_fec_priv *priv = NULL;
-	struct resource mem;
+	struct resource *mem;
 	const u32 *prop;
 	int prop_size;
 	struct device_node *np = op->dev.of_node;
@@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	priv->ndev = ndev;
 
 	/* Reserve FEC control zone */
-	rv = of_address_to_resource(np, 0, &mem);
-	if (rv) {
+	mem = platform_get_resource(op, 0, IORESOURCE_MEM);
+	if (!mem) {
 		pr_err("Error while parsing device node resource\n");
+		rv = -ENODEV;
 		goto err_netdev;
 	}
-	if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
+	if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
 		pr_err("invalid resource size (%lx < %x), check mpc52xx_devices.c\n",
-		       (unsigned long)resource_size(&mem),
+		       (unsigned long)resource_size(mem),
 		       sizeof(struct mpc52xx_fec));
 		rv = -EINVAL;
 		goto err_netdev;
 	}
 
-	if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
+	if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
 				DRIVER_NAME)) {
 		rv = -EBUSY;
 		goto err_netdev;
@@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	ndev->netdev_ops	= &mpc52xx_fec_netdev_ops;
 	ndev->ethtool_ops	= &mpc52xx_fec_ethtool_ops;
 	ndev->watchdog_timeo	= FEC_WATCHDOG_TIMEOUT;
-	ndev->base_addr		= mem.start;
+	ndev->base_addr		= mem->start;
 	SET_NETDEV_DEV(ndev, &op->dev);
 
 	spin_lock_init(&priv->lock);
 
 	/* ioremap the zones */
-	priv->fec = ioremap(mem.start, sizeof(struct mpc52xx_fec));
+	priv->fec = ioremap(mem->start, sizeof(struct mpc52xx_fec));
 
 	if (!priv->fec) {
 		rv = -ENOMEM;
@@ -879,9 +880,9 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 
 	/* Get the IRQ we need one by one */
 		/* Control */
-	ndev->irq = irq_of_parse_and_map(np, 0);
+	ndev->irq = platform_get_irq(op, 0);
 
-		/* RX */
+	/* RX */
 	priv->r_irq = bcom_get_task_irq(priv->rx_dmatsk);
 
 		/* TX */
@@ -967,7 +968,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 		bcom_fec_tx_release(priv->tx_dmatsk);
 	iounmap(priv->fec);
 err_mem_region:
-	release_mem_region(mem.start, sizeof(struct mpc52xx_fec));
+	release_mem_region(mem->start, sizeof(struct mpc52xx_fec));
 err_netdev:
 	free_netdev(ndev);
 
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
index 3d073f0fae63..4ffab516f770 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
@@ -68,7 +68,7 @@ static int mpc52xx_fec_mdio_probe(struct platform_device *of)
 	struct device_node *np = of->dev.of_node;
 	struct mii_bus *bus;
 	struct mpc52xx_fec_mdio_priv *priv;
-	struct resource res;
+	struct resource *res;
 	int err;
 
 	bus = mdiobus_alloc();
@@ -85,16 +85,18 @@ static int mpc52xx_fec_mdio_probe(struct platform_device *of)
 	bus->write = mpc52xx_fec_mdio_write;
 
 	/* setup registers */
-	err = of_address_to_resource(np, 0, &res);
-	if (err)
+	res = platform_get_resource(of, 0, IORESOURCE_MEM);
+	if (!res) {
+		err = -ENODEV;
 		goto out_free;
-	priv->regs = ioremap(res.start, resource_size(&res));
+	}
+	priv->regs = ioremap(res->start, resource_size(res));
 	if (priv->regs == NULL) {
 		err = -ENOMEM;
 		goto out_free;
 	}
 
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res.start);
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res->start);
 	bus->priv = priv;
 
 	bus->parent = dev;
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
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index dec31b638941..0e6faba74e34 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -96,7 +96,7 @@ static int fs_enet_fec_mii_write(struct mii_bus *bus, int phy_id, int location,
 
 static int fs_enet_mdio_probe(struct platform_device *ofdev)
 {
-	struct resource res;
+	struct resource *res;
 	struct mii_bus *new_bus;
 	struct fec_info *fec;
 	int (*get_bus_freq)(struct device *);
@@ -117,13 +117,15 @@ static int fs_enet_mdio_probe(struct platform_device *ofdev)
 	new_bus->read = &fs_enet_fec_mii_read;
 	new_bus->write = &fs_enet_fec_mii_write;
 
-	ret = of_address_to_resource(ofdev->dev.of_node, 0, &res);
-	if (ret)
+	res = platform_get_resource(ofdev, 0, IORESOURCE_MEM);
+	if (!res) {
+		ret = -ENODEV;
 		goto out_res;
+	}
 
-	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pap", &res.start);
+	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pap", &res->start);
 
-	fec->fecp = ioremap(res.start, resource_size(&res));
+	fec->fecp = ioremap(res->start, resource_size(res));
 	if (!fec->fecp) {
 		ret = -ENOMEM;
 		goto out_fec;
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6663c1768089..2a10486bc1f0 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3560,7 +3560,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	struct net_device *dev = NULL;
 	struct ucc_geth_private *ugeth = NULL;
 	struct ucc_geth_info *ug_info;
-	struct resource res;
+	struct resource *res;
 	int err, ucc_num, max_speed = 0;
 	const unsigned int *prop;
 	phy_interface_t phy_interface;
@@ -3605,12 +3605,12 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	if (err)
 		return err;
 
-	err = of_address_to_resource(np, 0, &res);
-	if (err)
-		return err;
+	res = platform_get_resource(ofdev 0, IORESOURCE_MEM);
+	if (!res)
+		return -ENODEV;
 
-	ug_info->uf_info.regs = res.start;
-	ug_info->uf_info.irq = irq_of_parse_and_map(np, 0);
+	ug_info->uf_info.regs = res->start;
+	ug_info->uf_info.irq = platform_get_irq(ofdev, 0);
 
 	ug_info->phy_node = of_parse_phandle(np, "phy-handle", 0);
 	if (!ug_info->phy_node && of_phy_is_fixed_link(np)) {
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 1fb285fa0bdb..0da7084b80c4 100644
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
index 8bd60168624a..f995591dc43b 100644
--- a/drivers/net/ethernet/moxa/moxart_ether.c
+++ b/drivers/net/ethernet/moxa/moxart_ether.c
@@ -465,9 +465,9 @@ static int moxart_mac_probe(struct platform_device *pdev)
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
index dd4a07c97eee..4aac9599c14d 100644
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


