Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAF86CB4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 15:19:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dcJ1B0Ei;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tltdp17bsz3vrG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 01:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dcJ1B0Ei;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TltYp73HMz3vXM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 01:16:14 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 464B84000F;
	Thu, 29 Feb 2024 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709216171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvIx8DaizrQghBKGl8R+5wAr2HBs0xxu5W0YcXy1Fj4=;
	b=dcJ1B0Ei7NJvgliJ/dCgxAMVeBJqAjPLVZ60J3qecbqz/dmzckJPbRDJBcVxaw+dGiDRqO
	RyWYtsifAOzDiUbKsREunPlM36dy5dmV3G7HsibxOUyoF0/EjMEjw/fjFWisGLqovAegmE
	LzJ+IhPMblZzioNvjFWikL2eS4PSfvS4CCFAbFxqcPa4uaN+98DOEaja3imH5qoi2KNeKR
	6KShmhS/sjug2np7chuT0b6sn8WBAOQX5CGfK17gwUHo49+XPyonxabDyXFnpxFbm9bFN7
	S2byIAUIULNrQuJmbnDKO+jcHLmm+UP8VuD+EqUFqzUrVFCFyzVl6VjjTEyOeg==
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v5 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots changes support
Date: Thu, 29 Feb 2024 15:15:52 +0100
Message-ID: <20240229141554.836867-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229141554.836867-1-herve.codina@bootlin.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

QMC channels support runtime timeslots changes but nothing is done at
the QMC HDLC driver to handle these changes.

Use existing IFACE ioctl in order to configure the timeslots to use.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/wan/fsl_qmc_hdlc.c | 151 ++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
index b9e067101171..80998ad89088 100644
--- a/drivers/net/wan/fsl_qmc_hdlc.c
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/bitmap.h>
 #include <linux/dma-mapping.h>
 #include <linux/hdlc.h>
 #include <linux/mod_devicetable.h>
@@ -33,6 +34,7 @@ struct qmc_hdlc {
 	struct qmc_hdlc_desc tx_descs[8];
 	unsigned int tx_out;
 	struct qmc_hdlc_desc rx_descs[4];
+	u32 slot_map;
 };
 
 static struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
@@ -197,6 +199,144 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
 	return NETDEV_TX_OK;
 }
 
+static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
+				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
+{
+	DECLARE_BITMAP(ts_mask_avail, 64);
+	DECLARE_BITMAP(ts_mask, 64);
+	DECLARE_BITMAP(map, 64);
+
+	/* Tx and Rx available masks must be identical */
+	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
+		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
+			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
+		return -EINVAL;
+	}
+
+	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
+	bitmap_from_u64(map, slot_map);
+	bitmap_scatter(ts_mask, map, ts_mask_avail, 64);
+
+	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
+		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %64pb -> (%64pb, %64pb)\n",
+			map, ts_mask_avail, ts_mask);
+		return -EINVAL;
+	}
+
+	bitmap_to_arr64(&ts_info->tx_ts_mask, ts_mask, 64);
+	ts_info->rx_ts_mask = ts_info->tx_ts_mask;
+	return 0;
+}
+
+static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
+				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
+{
+	DECLARE_BITMAP(ts_mask_avail, 64);
+	DECLARE_BITMAP(ts_mask, 64);
+	DECLARE_BITMAP(map, 64);
+	u32 array32[2];
+
+	/* Tx and Rx masks and available masks must be identical */
+	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
+		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
+			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
+		return -EINVAL;
+	}
+	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
+		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
+			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
+		return -EINVAL;
+	}
+
+	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
+	bitmap_from_u64(ts_mask, ts_info->rx_ts_mask);
+	bitmap_gather(map, ts_mask, ts_mask_avail, 64);
+
+	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
+		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (%64pb, %64pb) -> %64pb\n",
+			ts_mask_avail, ts_mask, map);
+		return -EINVAL;
+	}
+
+	bitmap_to_arr32(array32, map, 64);
+	if (array32[1]) {
+		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (%64pb, %64pb) -> %64pb\n",
+			ts_mask_avail, ts_mask, map);
+		return -EINVAL;
+	}
+
+	*slot_map = array32[0];
+	return 0;
+}
+
+static int qmc_hdlc_set_iface(struct qmc_hdlc *qmc_hdlc, int if_iface, const te1_settings *te1)
+{
+	struct qmc_chan_ts_info ts_info;
+	int ret;
+
+	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "get QMC channel ts info failed %d\n", ret);
+		return ret;
+	}
+	ret = qmc_hdlc_xlate_slot_map(qmc_hdlc, te1->slot_map, &ts_info);
+	if (ret)
+		return ret;
+
+	ret = qmc_chan_set_ts_info(qmc_hdlc->qmc_chan, &ts_info);
+	if (ret) {
+		dev_err(qmc_hdlc->dev, "set QMC channel ts info failed %d\n", ret);
+		return ret;
+	}
+
+	qmc_hdlc->slot_map = te1->slot_map;
+
+	return 0;
+}
+
+static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
+{
+	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
+	te1_settings te1;
+
+	switch (ifs->type) {
+	case IF_GET_IFACE:
+		ifs->type = IF_IFACE_E1;
+		if (ifs->size < sizeof(te1)) {
+			if (!ifs->size)
+				return 0; /* only type requested */
+
+			ifs->size = sizeof(te1); /* data size wanted */
+			return -ENOBUFS;
+		}
+
+		memset(&te1, 0, sizeof(te1));
+
+		/* Update slot_map */
+		te1.slot_map = qmc_hdlc->slot_map;
+
+		if (copy_to_user(ifs->ifs_ifsu.te1, &te1, sizeof(te1)))
+			return -EFAULT;
+		return 0;
+
+	case IF_IFACE_E1:
+	case IF_IFACE_T1:
+		if (!capable(CAP_NET_ADMIN))
+			return -EPERM;
+
+		if (netdev->flags & IFF_UP)
+			return -EBUSY;
+
+		if (copy_from_user(&te1, ifs->ifs_ifsu.te1, sizeof(te1)))
+			return -EFAULT;
+
+		return qmc_hdlc_set_iface(qmc_hdlc, ifs->type, &te1);
+
+	default:
+		return hdlc_ioctl(netdev, ifs);
+	}
+}
+
 static int qmc_hdlc_open(struct net_device *netdev)
 {
 	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
@@ -322,12 +462,13 @@ static const struct net_device_ops qmc_hdlc_netdev_ops = {
 	.ndo_open       = qmc_hdlc_open,
 	.ndo_stop       = qmc_hdlc_close,
 	.ndo_start_xmit = hdlc_start_xmit,
-	.ndo_siocwandev	= hdlc_ioctl,
+	.ndo_siocwandev = qmc_hdlc_ioctl,
 };
 
 static int qmc_hdlc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct qmc_chan_ts_info ts_info;
 	struct qmc_hdlc *qmc_hdlc;
 	struct qmc_chan_info info;
 	hdlc_device *hdlc;
@@ -353,6 +494,14 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "QMC chan mode %d is not QMC_HDLC\n",
 				     info.mode);
 
+	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
+	if (ret)
+		return dev_err_probe(dev, ret, "get QMC channel ts info failed\n");
+
+	ret = qmc_hdlc_xlate_ts_info(qmc_hdlc, &ts_info, &qmc_hdlc->slot_map);
+	if (ret)
+		return ret;
+
 	qmc_hdlc->netdev = alloc_hdlcdev(qmc_hdlc);
 	if (!qmc_hdlc->netdev)
 		return -ENOMEM;
-- 
2.43.0

