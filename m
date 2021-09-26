Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E26F4186DC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 09:08:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHH1Z3Z0Lz2ypR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 17:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baidu.com (client-ip=111.206.215.185; helo=baidu.com;
 envelope-from=caihuoqing@baidu.com; receiver=<UNKNOWN>)
X-Greylist: delayed 949 seconds by postgrey-1.36 at boromir;
 Sun, 26 Sep 2021 17:08:24 AEST
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HHH141QHXz2yNn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 17:08:19 +1000 (AEST)
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
 by Forcepoint Email with ESMTPS id C07ABCB2A5B8EE19BD12;
 Sun, 26 Sep 2021 14:52:22 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sun, 26 Sep 2021 14:52:22 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sun, 26 Sep 2021 14:52:21 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Subject: [PATCH v2] ibmveth: Use dma_alloc_coherent() instead of
 kmalloc/dma_map_single()
Date: Sun, 26 Sep 2021 14:52:14 +0800
Message-ID: <20210926065214.495-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex13.internal.baidu.com (172.31.51.53) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replacing kmalloc/kfree/dma_map_single/dma_unmap_single()
with dma_alloc_coherent/dma_free_coherent() helps to reduce
code size, and simplify the code, and coherent DMA will not
clear the cache every time.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Remove extra change in Kconfig

 drivers/net/ethernet/ibm/ibmveth.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 3d9b4f99d357..3aedb680adb8 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -605,17 +605,13 @@ static int ibmveth_open(struct net_device *netdev)
 	}
 
 	rc = -ENOMEM;
-	adapter->bounce_buffer =
-	    kmalloc(netdev->mtu + IBMVETH_BUFF_OH, GFP_KERNEL);
-	if (!adapter->bounce_buffer)
-		goto out_free_irq;
 
-	adapter->bounce_buffer_dma =
-	    dma_map_single(&adapter->vdev->dev, adapter->bounce_buffer,
-			   netdev->mtu + IBMVETH_BUFF_OH, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, adapter->bounce_buffer_dma)) {
-		netdev_err(netdev, "unable to map bounce buffer\n");
-		goto out_free_bounce_buffer;
+	adapter->bounce_buffer = dma_alloc_coherent(&adapter->vdev->dev,
+						    netdev->mtu + IBMVETH_BUFF_OH,
+						    &adapter->bounce_buffer_dma, GFP_KERNEL);
+	if (!adapter->bounce_buffer) {
+		netdev_err(netdev, "unable to alloc bounce buffer\n");
+		goto out_free_irq;
 	}
 
 	netdev_dbg(netdev, "initial replenish cycle\n");
@@ -627,8 +623,6 @@ static int ibmveth_open(struct net_device *netdev)
 
 	return 0;
 
-out_free_bounce_buffer:
-	kfree(adapter->bounce_buffer);
 out_free_irq:
 	free_irq(netdev->irq, netdev);
 out_free_buffer_pools:
@@ -702,10 +696,9 @@ static int ibmveth_close(struct net_device *netdev)
 			ibmveth_free_buffer_pool(adapter,
 						 &adapter->rx_buff_pool[i]);
 
-	dma_unmap_single(&adapter->vdev->dev, adapter->bounce_buffer_dma,
-			 adapter->netdev->mtu + IBMVETH_BUFF_OH,
-			 DMA_BIDIRECTIONAL);
-	kfree(adapter->bounce_buffer);
+	dma_free_coherent(&adapter->vdev->dev,
+			  adapter->netdev->mtu + IBMVETH_BUFF_OH,
+			  adapter->bounce_buffer, adapter->bounce_buffer_dma);
 
 	netdev_dbg(netdev, "close complete\n");
 
-- 
2.25.1

