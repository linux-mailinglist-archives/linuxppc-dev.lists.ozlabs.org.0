Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED342826E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 18:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HS6Bf3GfPz2ypV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 03:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baidu.com (client-ip=111.206.215.185; helo=baidu.com;
 envelope-from=caihuoqing@baidu.com; receiver=<UNKNOWN>)
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HS6BC5ykZz2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 03:01:52 +1100 (AEDT)
Received: from BC-Mail-Ex18.internal.baidu.com (unknown [172.31.51.12])
 by Forcepoint Email with ESMTPS id F423C628CB139476D543;
 Mon, 11 Oct 2021 00:01:43 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex18.internal.baidu.com (172.31.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 11 Oct 2021 00:01:43 +0800
Received: from localhost.localdomain (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 11 Oct 2021 00:01:42 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Subject: [PATCH] scsi: ibmvscsi: Use dma_alloc_coherent() instead of
 get_zeroed_page/dma_map_single()
Date: Mon, 11 Oct 2021 00:01:19 +0800
Message-ID: <20211010160121.539-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex16.internal.baidu.com (10.127.64.39) To
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replacing get_zeroed_page/free_page/dma_map_single/dma_unmap_single()
with dma_alloc_coherent/dma_free_coherent() helps to reduce
code size, and simplify the code, and coherent DMA will not
clear the cache every time.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c   | 15 +++------------
 drivers/scsi/ibmvscsi/ibmvscsi.c | 26 ++++++--------------------
 2 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 1f1586ad48fe..f65d1a78b272 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -869,8 +869,7 @@ static void ibmvfc_free_queue(struct ibmvfc_host *vhost,
 {
 	struct device *dev = vhost->dev;
 
-	dma_unmap_single(dev, queue->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	free_page((unsigned long)queue->msgs.handle);
+	dma_free_coherent(dev, PAGE_SIZE, queue->msgs.handle, queue->msg_token);
 	queue->msgs.handle = NULL;
 
 	ibmvfc_free_event_pool(vhost, queue);
@@ -5663,19 +5662,11 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 		return -ENOMEM;
 	}
 
-	queue->msgs.handle = (void *)get_zeroed_page(GFP_KERNEL);
+	queue->msgs.handle = dma_alloc_coherent(dev, PAGE_SIZE,
+						&queue->msg_token, GFP_KERNEL);
 	if (!queue->msgs.handle)
 		return -ENOMEM;
 
-	queue->msg_token = dma_map_single(dev, queue->msgs.handle, PAGE_SIZE,
-					  DMA_BIDIRECTIONAL);
-
-	if (dma_mapping_error(dev, queue->msg_token)) {
-		free_page((unsigned long)queue->msgs.handle);
-		queue->msgs.handle = NULL;
-		return -ENOMEM;
-	}
-
 	queue->cur = 0;
 	queue->fmt = fmt;
 	queue->size = PAGE_SIZE / fmt_size;
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index ea8e01f49cba..61b315d1edbc 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -151,10 +151,7 @@ static void ibmvscsi_release_crq_queue(struct crq_queue *queue,
 			msleep(100);
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while ((rc == H_BUSY) || (H_IS_LONG_BUSY(rc)));
-	dma_unmap_single(hostdata->dev,
-			 queue->msg_token,
-			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
-	free_page((unsigned long)queue->msgs);
+	dma_free_coherent(hostdata->dev, PAGE_SIZE, queue->msgs, queue->msg_token);
 }
 
 /**
@@ -331,18 +328,11 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
 	int retrc;
 	struct vio_dev *vdev = to_vio_dev(hostdata->dev);
 
-	queue->msgs = (struct viosrp_crq *)get_zeroed_page(GFP_KERNEL);
-
-	if (!queue->msgs)
-		goto malloc_failed;
 	queue->size = PAGE_SIZE / sizeof(*queue->msgs);
-
-	queue->msg_token = dma_map_single(hostdata->dev, queue->msgs,
-					  queue->size * sizeof(*queue->msgs),
-					  DMA_BIDIRECTIONAL);
-
-	if (dma_mapping_error(hostdata->dev, queue->msg_token))
-		goto map_failed;
+	queue->msgs = dma_alloc_coherent(hostdata->dev, PAGE_SIZE,
+					&queue->msg_token, GFP_KERNEL);
+	if (!queue->msg)
+		goto malloc_failed;
 
 	gather_partition_info();
 	set_adapter_info(hostdata);
@@ -395,11 +385,7 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while ((rc == H_BUSY) || (H_IS_LONG_BUSY(rc)));
       reg_crq_failed:
-	dma_unmap_single(hostdata->dev,
-			 queue->msg_token,
-			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
-      map_failed:
-	free_page((unsigned long)queue->msgs);
+	dma_free_coherent(hostdata->dev, PAGE_SIZE, queue->msg, queue->msg_token);
       malloc_failed:
 	return -1;
 }
-- 
2.25.1

