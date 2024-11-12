Return-Path: <linuxppc-dev+bounces-3126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2F9C6326
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 22:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnzhG3Hz5z2xQK;
	Wed, 13 Nov 2024 08:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731446094;
	cv=none; b=GuT9bG35L7cXxrVKF4GxW6Yms5xd8j2mYhQfKB0le5LjhsZ5CLdcvnJTF5cJ/10Acm3EQ2N72PrdEpHOu/y3IkH8V2KMB8ERiOJfdsHn+QFZ27kmsRdD2fVR/3QpTOtMjOwlVijVJLwdZpmg6zWynaEwFUn/Gw4VkSE9yZQ8l/nqPvEmSx9DYHz04xn0kujxvn6Od/FWTLcweQ36JVheXIXguVdMv7Uye7WdJK2Tcv/cqJZvibgYCgkr7ZXVltNVteRGldXIyP1H4n+gpKASAnp6r1Ub4g3QiuqC0Z1Am96M8uejYlgZlypf+2ye3YlXDqBWW5S/EauEJdVofbu2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731446094; c=relaxed/relaxed;
	bh=/E9JaS6GNPOhFzH/hTsYBjh3LFrXVv5Wnd8IVRw0MwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAl8EMenTY6vWITC2l+Cn6jhwvCMhENh5dfJB20gfn9d/bNjCi5XGzRXDYCJJCS+gGOLvY46N9+hqHaNE6JZu9RFiT7YJ48MWDPBNuXfNNMxsFvR4KM4GfGoe+wOp6GEpNATGnKHOvK6aS1Cc1YCZ62i32e6eRvok6pwvI/I5+5Ef2rq0aE6wkrR8Qr9jDpqBfcO8Rj32dQbanHsktCQwzdiRYvWrTMyqmWt7tXEvwpBK2kd0XwNbikg72U4fB7K3EZCoGQJYfR4WNPIvoZkACWJXoUxS/5pXKLq8dd6VJiU3l+Ej649qUurmqfujNGpj7uWMyiEtGi/JfaaCpa12w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SkdFXwjB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SkdFXwjB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnzhD67D0z2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 08:14:51 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720d01caa66so5877186b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 13:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731446086; x=1732050886; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/E9JaS6GNPOhFzH/hTsYBjh3LFrXVv5Wnd8IVRw0MwA=;
        b=SkdFXwjBawWklMbEBXO91RQDScTLtlhJNqLzvrAwVnlrBaLPPSqGllw9bTOUfi5KVb
         4Gaa0YfAhP4OtzVfBuAb1tzL0U+J9BQRI2cMqLlbd8z9EOAaT2R45lPkwlku8wG14yz9
         gss0TF+ocF29Lnz5Vv8GwLNhaAFtOUV/0NJ3dvg6QgGUoAx/cvDymSICUkaOm+W2iBfl
         YTRke76MY8G+ZAIqPVPIzmvsOmlqp9vdXBxv6Px7ohijopq3eAbmwLnTLd5XyfUJmKyY
         nyijmWUTssuc9KaLDZdxLxY5v3mG9i6DBPTx+uhNDStlQbxjR8mMvBKSzRTFJN6WbT6C
         ZtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731446086; x=1732050886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/E9JaS6GNPOhFzH/hTsYBjh3LFrXVv5Wnd8IVRw0MwA=;
        b=PKGzlJ+ELZwu6lSyDIYAtbZRiQx8HadJOEbcH59cZ1p1yribSX4Tw/kWlJrRLI5f9R
         9T/N7J6+KGibvqBd2ZBSTUcuV//OVcaxp4CzWfS5xJwjB3tbriliunzaM5nlu6QGfsWY
         iwywlyuZMDuyVdC2ql+7bC39Y+18JH56D8XX4gLoiFW0fiyzYGbvaHE54QdKO96698rZ
         NcQr1Plisj5jt/SJ7OwxwNhhOmUGzz4NtZ9yV331eguGCj5VrTwWEeJrgkrhlqCalAtR
         iwuuT/dniOmgW6FRKweLatl4XWvYDynob6Q/NRlEDAR3K0Q0Zxk7PkKd9SsviXHizzaJ
         fE7g==
X-Forwarded-Encrypted: i=1; AJvYcCVK0pPaQvzMad7QBdGtN0bVk2DtPkkZmYHt/EdkJfQuWVDGyU/u3CEEKhxgKhQesfW6o6QDOua1qLFQaAc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAColy08rFMloNcqjQRo9XEJFRbaBbssgU5mpDjGk50lNlCA9L
	nFI5gnNZqctGS+94Hxhv1x+qGPvpkgWif0TQHrVkLIIg+Gdp7DSC
X-Google-Smtp-Source: AGHT+IEYLl+iSufvvHMXoUuiJUyTbTMzcH9dmY86uH3TzWouUTAb7GMiGaFKlPZZaY+yfk420KCG5g==
X-Received: by 2002:a05:6a00:4605:b0:71e:75c0:2552 with SMTP id d2e1a72fcca58-7245782938bmr753499b3a.0.1731446086149;
        Tue, 12 Nov 2024 13:14:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a4126sm12062338b3a.102.2024.11.12.13.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 13:14:45 -0800 (PST)
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
Subject: [PATCHv3 net-next] net: modernize IRQ resource acquisition
Date: Tue, 12 Nov 2024 13:14:42 -0800
Message-ID: <20241112211442.7205-1-rosenp@gmail.com>
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

In probe, np == pdev->dev.of_node. It's easier to pass pdev directly.

Replace irq_of_parse_and_map() by platform_get_irq() to do so. Requires
removing the error message as well as fixing the return type.

Replace of_address_to_resource() with platform_get_resource() for the
same reason.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
(for CAN)
Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 v3: fix coccinelle bad return and error message checks. Also reword
 commit title and message
 v2: fixed compilation errors. Also removed non devm transformations.
 drivers/net/can/grcan.c                       |  5 ++--
 drivers/net/can/mscan/mpc5xxx_can.c           |  5 ++--
 drivers/net/dsa/bcm_sf2.c                     |  4 ++--
 drivers/net/ethernet/allwinner/sun4i-emac.c   |  5 ++--
 drivers/net/ethernet/freescale/fec_mpc52xx.c  |  4 ++--
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  4 ++--
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  4 ++--
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |  4 ++--
 drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
 drivers/net/ethernet/marvell/mvneta.c         |  4 ++--
 drivers/net/ethernet/moxa/moxart_ether.c      |  6 ++---
 .../ethernet/samsung/sxgbe/sxgbe_platform.c   | 24 +++++++------------
 drivers/net/ethernet/via/via-rhine.c          |  4 ++--
 drivers/net/ethernet/via/via-velocity.c       |  4 ++--
 drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
 drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
 drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
 17 files changed, 55 insertions(+), 66 deletions(-)

diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index cdf0ec9fa7f3..48e93c3445e7 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -1673,9 +1673,8 @@ static int grcan_probe(struct platform_device *ofdev)
 		goto exit_error;
 	}
 
-	irq = irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
-	if (!irq) {
-		dev_err(&ofdev->dev, "no irq found\n");
+	irq = platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
+	if (irq < 0) {
 		err = -ENODEV;
 		goto exit_error;
 	}
diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/mpc5xxx_can.c
index 0080c39ee182..c916c9ab912a 100644
--- a/drivers/net/can/mscan/mpc5xxx_can.c
+++ b/drivers/net/can/mscan/mpc5xxx_can.c
@@ -300,9 +300,8 @@ static int mpc5xxx_can_probe(struct platform_device *ofdev)
 	if (!base)
 		return dev_err_probe(&ofdev->dev, err, "couldn't ioremap\n");
 
-	irq = irq_of_parse_and_map(np, 0);
-	if (!irq) {
-		dev_err(&ofdev->dev, "no irq found\n");
+	irq = platform_get_irq(ofdev, 0);
+	if (irq < 0) {
 		err = -ENODEV;
 		goto exit_unmap_mem;
 	}
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
index 2f516b950f4e..353ebec76c92 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -995,9 +995,8 @@ static int emac_probe(struct platform_device *pdev)
 
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr = (unsigned long)db->membase;
-	ndev->irq = irq_of_parse_and_map(np, 0);
-	if (ndev->irq == -ENXIO) {
-		netdev_err(ndev, "No irq resource\n");
+	ndev->irq = platform_get_irq(pdev, 0);
+	if (ndev->irq < 0) {
 		ret = ndev->irq;
 		goto out_iounmap;
 	}
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index 5d7769b38ae4..b0849a448c6d 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
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
index be63293511d9..9006137e3a55 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -83,8 +83,8 @@ static int do_pd_setup(struct fs_enet_private *fep)
 	struct fs_platform_info *fpi = fep->fpi;
 	int ret = -EINVAL;
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
-	if (!fep->interrupt)
+	fep->interrupt = platform_get_irq(ofdev, 0);
+	if (fep->interrupt < 0)
 		goto out;
 
 	fep->fcc.fccp = of_iomap(ofdev->dev.of_node, 0);
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index f2ecd20027cf..f8ae38e37feb 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -88,8 +88,8 @@ static int do_pd_setup(struct fs_enet_private *fep)
 {
 	struct platform_device *ofdev = to_platform_device(fep->dev);
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
-	if (!fep->interrupt)
+	fep->interrupt = platform_get_irq(ofdev, 0);
+	if (fep->interrupt < 0)
 		return -EINVAL;
 
 	fep->fec.fecp = of_iomap(ofdev->dev.of_node, 0);
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 6c97191649de..2e817bc5c512 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -87,8 +87,8 @@ static int do_pd_setup(struct fs_enet_private *fep)
 {
 	struct platform_device *ofdev = to_platform_device(fep->dev);
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
-	if (!fep->interrupt)
+	fep->interrupt = platform_get_irq(ofdev, 0);
+	if (fep->interrupt < 0)
 		return -EINVAL;
 
 	fep->scc.sccp = of_iomap(ofdev->dev.of_node, 0);
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6663c1768089..dbc00f759212 100644
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
index 7bb781fb93b5..8ef9c73735c2 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5511,8 +5511,8 @@ static int mvneta_probe(struct platform_device *pdev)
 		pp->neta_ac5 = true;
 	}
 
-	dev->irq = irq_of_parse_and_map(dn, 0);
-	if (dev->irq == 0)
+	dev->irq = platform_get_irq(pdev, 0);
+	if (dev->irq < 0)
 		return -EINVAL;
 
 	pp->clk = devm_clk_get(&pdev->dev, "core");
diff --git a/drivers/net/ethernet/moxa/moxart_ether.c b/drivers/net/ethernet/moxa/moxart_ether.c
index 8bd60168624a..7fca8a05f755 100644
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
@@ -465,9 +464,8 @@ static int moxart_mac_probe(struct platform_device *pdev)
 	if (!ndev)
 		return -ENOMEM;
 
-	irq = irq_of_parse_and_map(node, 0);
-	if (irq <= 0) {
-		netdev_err(ndev, "irq_of_parse_and_map failed\n");
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
 		ret = -EINVAL;
 		goto irq_map_fail;
 	}
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
index 2eccc7617507..54faa01f4e31 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
@@ -111,37 +111,29 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 	}
 
 	/* Get the SXGBE common INT information */
-	priv->irq  = irq_of_parse_and_map(node, 0);
-	if (priv->irq <= 0) {
-		dev_err(dev, "sxgbe common irq parsing failed\n");
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
 		goto err_drv_remove;
-	}
 
 	/* Get MAC address if available (DT) */
 	of_get_ethdev_address(node, priv->dev);
 
 	/* Get the TX/RX IRQ numbers */
 	for (i = 0, chan = 1; i < SXGBE_TX_QUEUES; i++) {
-		priv->txq[i]->irq_no = irq_of_parse_and_map(node, chan++);
-		if (priv->txq[i]->irq_no <= 0) {
-			dev_err(dev, "sxgbe tx irq parsing failed\n");
+		priv->txq[i]->irq_no = platform_get_irq(pdev, chan++);
+		if (priv->txq[i]->irq_no < 0)
 			goto err_tx_irq_unmap;
-		}
 	}
 
 	for (i = 0; i < SXGBE_RX_QUEUES; i++) {
-		priv->rxq[i]->irq_no = irq_of_parse_and_map(node, chan++);
-		if (priv->rxq[i]->irq_no <= 0) {
-			dev_err(dev, "sxgbe rx irq parsing failed\n");
+		priv->rxq[i]->irq_no = platform_get_irq(pdev, chan++);
+		if (priv->rxq[i]->irq_no < 0)
 			goto err_rx_irq_unmap;
-		}
 	}
 
-	priv->lpi_irq = irq_of_parse_and_map(node, chan);
-	if (priv->lpi_irq <= 0) {
-		dev_err(dev, "sxgbe lpi irq parsing failed\n");
+	priv->lpi_irq = platform_get_irq(pdev, chan);
+	if (priv->lpi_irq < 0)
 		goto err_rx_irq_unmap;
-	}
 
 	platform_set_drvdata(pdev, priv->dev);
 
diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index 894911f3d560..95e5437b16b4 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -1127,8 +1127,8 @@ static int rhine_init_one_platform(struct platform_device *pdev)
 	if (IS_ERR(ioaddr))
 		return PTR_ERR(ioaddr);
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq)
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
 		return -EINVAL;
 
 	return rhine_init_one_common(&pdev->dev, *quirks,
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index 72271a51d0e7..16cf7db41c54 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -2950,8 +2950,8 @@ static int velocity_platform_probe(struct platform_device *pdev)
 	if (!info)
 		return -EINVAL;
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq)
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
 		return -EINVAL;
 
 	return velocity_probe(&pdev->dev, irq, info, BUS_PLATFORM);
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


