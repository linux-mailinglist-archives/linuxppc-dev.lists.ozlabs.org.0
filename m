Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4577F83C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRRWx5TGXz3cWY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 00:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yuehaibing@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1130 seconds by postgrey-1.37 at boromir; Fri, 18 Aug 2023 00:01:38 AEST
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRRWQ4szjz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 00:01:34 +1000 (AEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRR1L6nX9zNmrP;
	Thu, 17 Aug 2023 21:39:02 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 21:42:34 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <madalin.bucur@nxp.com>, <sean.anderson@seco.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<pantelis.antoniou@gmail.com>, <camelia.groza@nxp.com>,
	<christophe.leroy@csgroup.eu>, <yuehaibing@huawei.com>
Subject: [PATCH net-next] net: freescale: Remove unused declarations
Date: Thu, 17 Aug 2023 21:41:59 +0800
Message-ID: <20230817134159.38484-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 5d93cfcf7360 ("net: dpaa: Convert to phylink") removed
fman_set_mac_active_pause()/fman_get_pause_cfg() but not declarations.
Commit 48257c4f168e ("Add fs_enet ethernet network driver, for several
embedded platforms.") declared but never implemented
fs_enet_platform_init() and fs_enet_platform_cleanup().

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/freescale/fman/mac.h        | 4 ----
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.h b/drivers/net/ethernet/freescale/fman/mac.h
index ad06f8d7924b..fe747915cc73 100644
--- a/drivers/net/ethernet/freescale/fman/mac.h
+++ b/drivers/net/ethernet/freescale/fman/mac.h
@@ -68,10 +68,6 @@ struct dpaa_eth_data {
 
 extern const char	*mac_driver_description;
 
-int fman_set_mac_active_pause(struct mac_device *mac_dev, bool rx, bool tx);
-
-void fman_get_pause_cfg(struct mac_device *mac_dev, bool *rx_pause,
-			bool *tx_pause);
 int fman_set_multi(struct net_device *net_dev, struct mac_device *mac_dev);
 
 #endif	/* __MAC_H */
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index d371072fff60..759bb7080e22 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -208,11 +208,6 @@ void fs_cleanup_bds(struct net_device *dev);
 #define DRV_MODULE_NAME		"fs_enet"
 #define PFX DRV_MODULE_NAME	": "
 
-/***************************************************************************/
-
-int fs_enet_platform_init(void);
-void fs_enet_platform_cleanup(void);
-
 /***************************************************************************/
 /* buffer descriptor access macros */
 
-- 
2.34.1

