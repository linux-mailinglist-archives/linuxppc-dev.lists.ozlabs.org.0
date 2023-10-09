Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF37BE816
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 19:31:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W+Ynaydm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S45gP3qgKz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 04:31:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W+Ynaydm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S45fW18yXz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 04:30:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AEE2612B7;
	Mon,  9 Oct 2023 17:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EEDC433C7;
	Mon,  9 Oct 2023 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696872655;
	bh=Y+JRjQjy6aEMVusw3+mI2JFX4h/wKJooksD3bi06J5M=;
	h=From:To:Cc:Subject:Date:From;
	b=W+Ynaydm3yaAhrbiYCrKk9nCoglhA4dmwU1qKuPEFIdu4MmFvwE7P7tNioGw3aCHp
	 0xxU5l7Vf8fNdnRuXKh2jeWB04Q+iR2aqMlgMw7s8vPD5HY7IDSaIeBo00B9yzjFlN
	 Ewm7IXFr24hyXgGvIBBv6nfd55mXNfWoAPbApjVFYCRfzArgLLuGz9aR4cA6OfwWRH
	 S839eo9JM1e0m90ifVYEOhDKQelwquT1QLub5Fd2HRbgeWZxc9I7mInHMwPy3+2v3N
	 xFCMkp2xx4oSP1e57Zz6JPkf09HpBuRNt0a+/WgoCBV3oDFhKMajbNw0Ci/0deRBvH
	 F9ixT+Mm9lG6w==
Received: (nullmailer pid 2492231 invoked by uid 1000);
	Mon, 09 Oct 2023 17:30:52 -0000
From: Rob Herring <robh@kernel.org>
To: Joyce Ooi <joyce.ooi@intel.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next] net: ethernet: Use device_get_match_data()
Date: Mon,  9 Oct 2023 12:28:58 -0500
Message-ID: <20231009172923.2457844-3-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/net/ethernet/altera/altera_tse.h      |  2 +-
 drivers/net/ethernet/altera/altera_tse_main.c | 13 ++----
 drivers/net/ethernet/amd/xgbe/xgbe-platform.c | 42 +------------------
 .../net/ethernet/apm/xgene/xgene_enet_main.c  | 15 +------
 .../net/ethernet/apm/xgene/xgene_enet_main.h  |  3 +-
 drivers/net/ethernet/freescale/fec_main.c     | 12 +++---
 .../ethernet/freescale/fs_enet/fs_enet-main.c | 18 ++++----
 .../net/ethernet/freescale/fs_enet/mii-fec.c  | 10 ++---
 drivers/net/ethernet/freescale/fsl_pq_mdio.c  | 12 ++----
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 11 ++---
 .../stmicro/stmmac/dwmac-intel-plat.c         |  9 ++--
 drivers/net/ethernet/ti/davinci_emac.c        | 12 ++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 13 ++----
 13 files changed, 40 insertions(+), 132 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
index db5eed06e92d..82f2363a45cd 100644
--- a/drivers/net/ethernet/altera/altera_tse.h
+++ b/drivers/net/ethernet/altera/altera_tse.h
@@ -472,7 +472,7 @@ struct altera_tse_private {
 	/* ethtool msglvl option */
 	u32 msg_enable;
 
-	struct altera_dmaops *dmaops;
+	const struct altera_dmaops *dmaops;
 
 	struct phylink *phylink;
 	struct phylink_config phylink_config;
diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 1b1799985d1d..1c8763be0e4b 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -29,13 +29,13 @@
 #include <linux/mii.h>
 #include <linux/mdio/mdio-regmap.h>
 #include <linux/netdevice.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
 #include <linux/pcs-lynx.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/skbuff.h>
 #include <asm/cacheflush.h>
@@ -82,8 +82,6 @@ MODULE_PARM_DESC(dma_tx_num, "Number of descriptors in the TX list");
 
 #define TXQUEUESTOP_THRESHHOLD	2
 
-static const struct of_device_id altera_tse_ids[];
-
 static inline u32 tse_tx_avail(struct altera_tse_private *priv)
 {
 	return priv->tx_cons + priv->tx_ring_size - priv->tx_prod - 1;
@@ -1133,7 +1131,6 @@ static int request_and_map(struct platform_device *pdev, const char *name,
  */
 static int altera_tse_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id = NULL;
 	struct regmap_config pcs_regmap_cfg;
 	struct altera_tse_private *priv;
 	struct mdio_regmap_config mrc;
@@ -1159,11 +1156,7 @@ static int altera_tse_probe(struct platform_device *pdev)
 	priv->dev = ndev;
 	priv->msg_enable = netif_msg_init(debug, default_msg_level);
 
-	of_id = of_match_device(altera_tse_ids, &pdev->dev);
-
-	if (of_id)
-		priv->dmaops = (struct altera_dmaops *)of_id->data;
-
+	priv->dmaops = device_get_match_data(&pdev->dev);
 
 	if (priv->dmaops &&
 	    priv->dmaops->altera_dtype == ALTERA_DTYPE_SGDMA) {
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-platform.c b/drivers/net/ethernet/amd/xgbe/xgbe-platform.c
index 91842a5e161b..9131020d06af 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-platform.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-platform.c
@@ -123,9 +123,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
-#include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/property.h>
 #include <linux/acpi.h>
@@ -135,17 +133,6 @@
 #include "xgbe-common.h"
 
 #ifdef CONFIG_ACPI
-static const struct acpi_device_id xgbe_acpi_match[];
-
-static struct xgbe_version_data *xgbe_acpi_vdata(struct xgbe_prv_data *pdata)
-{
-	const struct acpi_device_id *id;
-
-	id = acpi_match_device(xgbe_acpi_match, pdata->dev);
-
-	return id ? (struct xgbe_version_data *)id->driver_data : NULL;
-}
-
 static int xgbe_acpi_support(struct xgbe_prv_data *pdata)
 {
 	struct device *dev = pdata->dev;
@@ -173,11 +160,6 @@ static int xgbe_acpi_support(struct xgbe_prv_data *pdata)
 	return 0;
 }
 #else   /* CONFIG_ACPI */
-static struct xgbe_version_data *xgbe_acpi_vdata(struct xgbe_prv_data *pdata)
-{
-	return NULL;
-}
-
 static int xgbe_acpi_support(struct xgbe_prv_data *pdata)
 {
 	return -EINVAL;
@@ -185,17 +167,6 @@ static int xgbe_acpi_support(struct xgbe_prv_data *pdata)
 #endif  /* CONFIG_ACPI */
 
 #ifdef CONFIG_OF
-static const struct of_device_id xgbe_of_match[];
-
-static struct xgbe_version_data *xgbe_of_vdata(struct xgbe_prv_data *pdata)
-{
-	const struct of_device_id *id;
-
-	id = of_match_device(xgbe_of_match, pdata->dev);
-
-	return id ? (struct xgbe_version_data *)id->data : NULL;
-}
-
 static int xgbe_of_support(struct xgbe_prv_data *pdata)
 {
 	struct device *dev = pdata->dev;
@@ -244,11 +215,6 @@ static struct platform_device *xgbe_of_get_phy_pdev(struct xgbe_prv_data *pdata)
 	return phy_pdev;
 }
 #else   /* CONFIG_OF */
-static struct xgbe_version_data *xgbe_of_vdata(struct xgbe_prv_data *pdata)
-{
-	return NULL;
-}
-
 static int xgbe_of_support(struct xgbe_prv_data *pdata)
 {
 	return -EINVAL;
@@ -290,12 +256,6 @@ static struct platform_device *xgbe_get_phy_pdev(struct xgbe_prv_data *pdata)
 	return phy_pdev;
 }
 
-static struct xgbe_version_data *xgbe_get_vdata(struct xgbe_prv_data *pdata)
-{
-	return pdata->use_acpi ? xgbe_acpi_vdata(pdata)
-			       : xgbe_of_vdata(pdata);
-}
-
 static int xgbe_platform_probe(struct platform_device *pdev)
 {
 	struct xgbe_prv_data *pdata;
@@ -321,7 +281,7 @@ static int xgbe_platform_probe(struct platform_device *pdev)
 	pdata->use_acpi = dev->of_node ? 0 : 1;
 
 	/* Get the version data */
-	pdata->vdata = xgbe_get_vdata(pdata);
+	pdata->vdata = (struct xgbe_version_data *)device_get_match_data(dev);
 
 	phy_pdev = xgbe_get_phy_pdev(pdata);
 	if (!phy_pdev) {
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
index b5d9f9a55b7f..56f2b3c229af 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
@@ -2018,7 +2018,6 @@ static int xgene_enet_probe(struct platform_device *pdev)
 	struct xgene_enet_pdata *pdata;
 	struct device *dev = &pdev->dev;
 	void (*link_state)(struct work_struct *);
-	const struct of_device_id *of_id;
 	int ret;
 
 	ndev = alloc_etherdev_mqs(sizeof(struct xgene_enet_pdata),
@@ -2039,19 +2038,7 @@ static int xgene_enet_probe(struct platform_device *pdev)
 			  NETIF_F_GRO |
 			  NETIF_F_SG;
 
-	of_id = of_match_device(xgene_enet_of_match, &pdev->dev);
-	if (of_id) {
-		pdata->enet_id = (uintptr_t)of_id->data;
-	}
-#ifdef CONFIG_ACPI
-	else {
-		const struct acpi_device_id *acpi_id;
-
-		acpi_id = acpi_match_device(xgene_enet_acpi_match, &pdev->dev);
-		if (acpi_id)
-			pdata->enet_id = (enum xgene_enet_id) acpi_id->driver_data;
-	}
-#endif
+	pdata->enet_id = (enum xgene_enet_id)device_get_match_data(&pdev->dev);
 	if (!pdata->enet_id) {
 		ret = -ENODEV;
 		goto err;
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.h b/drivers/net/ethernet/apm/xgene/xgene_enet_main.h
index 643f5e646740..bce2c19e3f22 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.h
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.h
@@ -15,9 +15,10 @@
 #include <linux/efi.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
+#include <linux/platform_device.h>
 #include <linux/mdio/mdio-xgene.h>
 #include <linux/module.h>
 #include <net/ip.h>
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 77c8e9cfb445..e0c991e792a4 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -52,11 +52,11 @@
 #include <linux/clk.h>
 #include <linux/crc32.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
 #include <linux/fec.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/regulator/consumer.h>
@@ -4292,14 +4292,13 @@ fec_probe(struct platform_device *pdev)
 	phy_interface_t interface;
 	struct net_device *ndev;
 	int i, irq, ret = 0;
-	const struct of_device_id *of_id;
 	static int dev_id;
 	struct device_node *np = pdev->dev.of_node, *phy_node;
 	int num_tx_qs;
 	int num_rx_qs;
 	char irq_name[8];
 	int irq_cnt;
-	struct fec_devinfo *dev_info;
+	const struct fec_devinfo *dev_info;
 
 	fec_enet_get_queue_num(pdev, &num_tx_qs, &num_rx_qs);
 
@@ -4314,10 +4313,9 @@ fec_probe(struct platform_device *pdev)
 	/* setup board info structure */
 	fep = netdev_priv(ndev);
 
-	of_id = of_match_device(fec_dt_ids, &pdev->dev);
-	if (of_id)
-		pdev->id_entry = of_id->data;
-	dev_info = (struct fec_devinfo *)pdev->id_entry->driver_data;
+	dev_info = device_get_match_data(&pdev->dev);
+	if (!dev_info)
+		dev_info = (const struct fec_devinfo *)pdev->id_entry->driver_data;
 	if (dev_info)
 		fep->quirks = dev_info->quirks;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index a6dfc8807d3d..cf392faa6105 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -35,10 +35,9 @@
 #include <linux/fs.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/of_net.h>
 #include <linux/pgtable.h>
 
@@ -884,9 +883,9 @@ static const struct ethtool_ops fs_ethtool_ops = {
 /**************************************************************************************/
 
 #ifdef CONFIG_FS_ENET_HAS_FEC
-#define IS_FEC(match) ((match)->data == &fs_fec_ops)
+#define IS_FEC(ops) ((ops) == &fs_fec_ops)
 #else
-#define IS_FEC(match) 0
+#define IS_FEC(ops) 0
 #endif
 
 static const struct net_device_ops fs_enet_netdev_ops = {
@@ -903,10 +902,9 @@ static const struct net_device_ops fs_enet_netdev_ops = {
 #endif
 };
 
-static const struct of_device_id fs_enet_match[];
 static int fs_enet_probe(struct platform_device *ofdev)
 {
-	const struct of_device_id *match;
+	const struct fs_ops *ops;
 	struct net_device *ndev;
 	struct fs_enet_private *fep;
 	struct fs_platform_info *fpi;
@@ -916,15 +914,15 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	const char *phy_connection_type;
 	int privsize, len, ret = -ENODEV;
 
-	match = of_match_device(fs_enet_match, &ofdev->dev);
-	if (!match)
+	ops = device_get_match_data(&ofdev->dev);
+	if (!ops)
 		return -EINVAL;
 
 	fpi = kzalloc(sizeof(*fpi), GFP_KERNEL);
 	if (!fpi)
 		return -ENOMEM;
 
-	if (!IS_FEC(match)) {
+	if (!IS_FEC(ops)) {
 		data = of_get_property(ofdev->dev.of_node, "fsl,cpm-command", &len);
 		if (!data || len != 4)
 			goto out_free_fpi;
@@ -986,7 +984,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	fep->dev = &ofdev->dev;
 	fep->ndev = ndev;
 	fep->fpi = fpi;
-	fep->ops = match->data;
+	fep->ops = ops;
 
 	ret = fep->ops->setup_data(ndev);
 	if (ret)
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index a1e777a4b75f..7bb69727952a 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -30,9 +30,10 @@
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
 #include <linux/pgtable.h>
 
 #include <asm/irq.h>
@@ -96,20 +97,15 @@ static int fs_enet_fec_mii_write(struct mii_bus *bus, int phy_id, int location,
 
 }
 
-static const struct of_device_id fs_enet_mdio_fec_match[];
 static int fs_enet_mdio_probe(struct platform_device *ofdev)
 {
-	const struct of_device_id *match;
 	struct resource res;
 	struct mii_bus *new_bus;
 	struct fec_info *fec;
 	int (*get_bus_freq)(struct device *);
 	int ret = -ENOMEM, clock, speed;
 
-	match = of_match_device(fs_enet_mdio_fec_match, &ofdev->dev);
-	if (!match)
-		return -EINVAL;
-	get_bus_freq = match->data;
+	get_bus_freq = device_get_match_data(&ofdev->dev);
 
 	new_bus = mdiobus_alloc();
 	if (!new_bus)
diff --git a/drivers/net/ethernet/freescale/fsl_pq_mdio.c b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
index eee675a25b2c..70dd982a5edc 100644
--- a/drivers/net/ethernet/freescale/fsl_pq_mdio.c
+++ b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
@@ -19,9 +19,10 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/mii.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_mdio.h>
-#include <linux/of_device.h>
+#include <linux/property.h>
 
 #include <asm/io.h>
 #if IS_ENABLED(CONFIG_UCC_GETH)
@@ -407,8 +408,6 @@ static void set_tbipa(const u32 tbipa_val, struct platform_device *pdev,
 
 static int fsl_pq_mdio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *id =
-		of_match_device(fsl_pq_mdio_match, &pdev->dev);
 	const struct fsl_pq_mdio_data *data;
 	struct device_node *np = pdev->dev.of_node;
 	struct resource res;
@@ -417,15 +416,12 @@ static int fsl_pq_mdio_probe(struct platform_device *pdev)
 	struct mii_bus *new_bus;
 	int err;
 
-	if (!id) {
+	data = device_get_match_data(&pdev->dev);
+	if (!data) {
 		dev_err(&pdev->dev, "Failed to match device\n");
 		return -ENODEV;
 	}
 
-	data = id->data;
-
-	dev_dbg(&pdev->dev, "found %s compatible node\n", id->compatible);
-
 	new_bus = mdiobus_alloc_size(sizeof(*priv));
 	if (!new_bus)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 506fa3d8bbee..1a972b093a42 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -7,7 +7,8 @@
 #include <linux/interrupt.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
 #include <linux/reset.h>
@@ -1094,7 +1095,6 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	const struct of_device_id *of_id = NULL;
 	struct net_device *ndev;
 	struct hix5hd2_priv *priv;
 	struct mii_bus *bus;
@@ -1110,12 +1110,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	priv->netdev = ndev;
 
-	of_id = of_match_device(hix5hd2_of_match, dev);
-	if (!of_id) {
-		ret = -EINVAL;
-		goto out_free_netdev;
-	}
-	priv->hw_cap = (unsigned long)of_id->data;
+	priv->hw_cap = (unsigned long)device_get_match_data(dev);
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 70edc5232379..d68f0c4e7835 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -7,8 +7,8 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/stmmac.h>
 
 #include "dwmac4.h"
@@ -76,7 +76,6 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
-	const struct of_device_id *match;
 	struct intel_dwmac *dwmac;
 	unsigned long rate;
 	int ret;
@@ -98,10 +97,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->tx_clk = NULL;
 
-	match = of_match_device(intel_eth_plat_match, &pdev->dev);
-	if (match && match->data) {
-		dwmac->data = (const struct intel_dwmac_data *)match->data;
-
+	dwmac->data = device_get_match_data(&pdev->dev);
+	if (dwmac->data) {
 		if (dwmac->data->fix_mac_speed)
 			plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
 
diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 5d756df133eb..23f8bc1cd20d 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -38,6 +38,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/clk.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/semaphore.h>
 #include <linux/phy.h>
@@ -47,10 +48,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/davinci_emac.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
-#include <linux/of_irq.h>
 #include <linux/of_net.h>
 #include <linux/mfd/syscon.h>
 
@@ -1726,13 +1724,10 @@ static const struct net_device_ops emac_netdev_ops = {
 #endif
 };
 
-static const struct of_device_id davinci_emac_of_match[];
-
 static struct emac_platform_data *
 davinci_emac_of_get_pdata(struct platform_device *pdev, struct emac_priv *priv)
 {
 	struct device_node *np;
-	const struct of_device_id *match;
 	const struct emac_platform_data *auxdata;
 	struct emac_platform_data *pdata = NULL;
 
@@ -1779,9 +1774,8 @@ davinci_emac_of_get_pdata(struct platform_device *pdev, struct emac_priv *priv)
 		pdata->interrupt_disable = auxdata->interrupt_disable;
 	}
 
-	match = of_match_device(davinci_emac_of_match, &pdev->dev);
-	if (match && match->data) {
-		auxdata = match->data;
+	auxdata = device_get_match_data(&pdev->dev);
+	if (auxdata) {
 		pdata->version = auxdata->version;
 		pdata->hw_ram_addr = auxdata->hw_ram_addr;
 	}
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 6635b28bc672..79e896972392 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -19,11 +19,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 #include <linux/remoteproc/pruss.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
@@ -1934,8 +1934,6 @@ static void prueth_put_cores(struct prueth *prueth, int slice)
 		pru_rproc_put(prueth->pru[slice]);
 }
 
-static const struct of_device_id prueth_dt_match[];
-
 static int prueth_probe(struct platform_device *pdev)
 {
 	struct device_node *eth_node, *eth_ports_node;
@@ -1944,7 +1942,6 @@ static int prueth_probe(struct platform_device *pdev)
 	struct genpool_data_align gp_data = {
 		.align = SZ_64K,
 	};
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct prueth *prueth;
@@ -1954,17 +1951,13 @@ static int prueth_probe(struct platform_device *pdev)
 
 	np = dev->of_node;
 
-	match = of_match_device(prueth_dt_match, dev);
-	if (!match)
-		return -ENODEV;
-
 	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
 	if (!prueth)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, prueth);
 	prueth->pdev = pdev;
-	prueth->pdata = *(const struct prueth_pdata *)match->data;
+	prueth->pdata = *(const struct prueth_pdata *)device_get_match_data(dev);
 
 	prueth->dev = dev;
 	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
-- 
2.42.0

