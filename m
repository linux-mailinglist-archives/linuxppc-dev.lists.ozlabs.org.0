Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4641C118
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 10:54:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK9DS5p52z2ynY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 18:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK9D13wJ7z2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 18:54:25 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVLB-0001rf-2C; Wed, 29 Sep 2021 10:53:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVLA-0004ip-CK; Wed, 29 Sep 2021 10:53:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL3-0000Qz-47; Wed, 29 Sep 2021 10:53:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v5 07/11] PCI: Replace pci_dev::driver usage that gets the
 driver name
Date: Wed, 29 Sep 2021 10:53:02 +0200
Message-Id: <20210929085306.2203850-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=x5Y9j5QPtBpKPfcAJK/OT7BRgKvI7pSChd5/rmmq6Xw=;
 m=uiYraG79NtpzJXVYTkT2krJ2oKsGebV/4PDlvGFyew0=;
 p=P030KPvGBgn0wACiWmlhwa6Q6u7mafsHSYpCChEQFbg=;
 g=d855fa8a2569029e17368da8c0bf9fc2e6496586
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFUKVkACgkQwfwUeK3K7AnywQf/YyT
 M2KQv0iVpRpzsG16PpDNiEPC9rdggnY7dQr4kG+ZVuebrIwmozRFQNmzB3qStmdKmTYQNIYAN9aZT
 N57ua890gfP8RZLIdmzppS+R3scVm4qrAaYlrVQMLOeX1u2eGpoBbCFQhJt59S10BFpDe3yqXTeG7
 iZw077F8icBm71e+fBqLbUTd8h46H1Isc4UskBU/VpSKdwyWHMVsmYfUi/f7m69IrYQ1eCV7PlNHH
 qk3a52EUxda9B6gfEYuy2qbSX57hIL5sXTW4dGuLi0d/xNs9Q/h8x4XpbnUV7b1/8xKnmYiy8qzZq
 Fx3d9cNhk25gOKOiAcc1UbnVl/xHP7Q==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: linux-pci@vger.kernel.org, Alexander Duyck <alexanderduyck@fb.com>,
 oss-drivers@corigine.com, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Vadym Kochan <vkochan@marvell.com>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Salil Mehta <salil.mehta@huawei.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Simon Horman <simon.horman@corigine.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

struct pci_dev::driver holds (apart from a constant offset) the same
data as struct pci_dev::dev->driver. With the goal to remove struct
pci_dev::driver to get rid of data duplication replace getting the
driver name by dev_driver_string() which implicitly makes use of struct
pci_dev::dev->driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/crypto/hisilicon/qm.c                        | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c   | 2 +-
 drivers/net/ethernet/marvell/prestera/prestera_pci.c | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/pci.c            | 2 +-
 drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c | 3 ++-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index 369562d34d66..8f361e54e524 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -3085,7 +3085,7 @@ static int qm_alloc_uacce(struct hisi_qm *qm)
 	};
 	int ret;
 
-	ret = strscpy(interface.name, pdev->driver->name,
+	ret = strscpy(interface.name, dev_driver_string(&pdev->dev),
 		      sizeof(interface.name));
 	if (ret < 0)
 		return -ENAMETOOLONG;
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
index 7ea511d59e91..f279edfce3f1 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
@@ -606,7 +606,7 @@ static void hns3_get_drvinfo(struct net_device *netdev,
 		return;
 	}
 
-	strncpy(drvinfo->driver, h->pdev->driver->name,
+	strncpy(drvinfo->driver, dev_driver_string(&h->pdev->dev),
 		sizeof(drvinfo->driver));
 	drvinfo->driver[sizeof(drvinfo->driver) - 1] = '\0';
 
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_pci.c b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
index a250d394da38..a8f007f6dad2 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_pci.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
@@ -720,7 +720,7 @@ static int prestera_fw_load(struct prestera_fw *fw)
 static int prestera_pci_probe(struct pci_dev *pdev,
 			      const struct pci_device_id *id)
 {
-	const char *driver_name = pdev->driver->name;
+	const char *driver_name = dev_driver_string(&pdev->dev);
 	struct prestera_fw *fw;
 	int err;
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/pci.c b/drivers/net/ethernet/mellanox/mlxsw/pci.c
index 13b0259f7ea6..8f306364f7bf 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/pci.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/pci.c
@@ -1876,7 +1876,7 @@ static void mlxsw_pci_cmd_fini(struct mlxsw_pci *mlxsw_pci)
 
 static int mlxsw_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	const char *driver_name = pdev->driver->name;
+	const char *driver_name = dev_driver_string(&pdev->dev);
 	struct mlxsw_pci *mlxsw_pci;
 	int err;
 
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c b/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
index 0685ece1f155..1de076f55740 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
@@ -202,7 +202,8 @@ nfp_get_drvinfo(struct nfp_app *app, struct pci_dev *pdev,
 {
 	char nsp_version[ETHTOOL_FWVERS_LEN] = {};
 
-	strlcpy(drvinfo->driver, pdev->driver->name, sizeof(drvinfo->driver));
+	strlcpy(drvinfo->driver, dev_driver_string(&pdev->dev),
+		sizeof(drvinfo->driver));
 	nfp_net_get_nspinfo(app, nsp_version);
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%s %s %s %s", vnic_version, nsp_version,
-- 
2.30.2

