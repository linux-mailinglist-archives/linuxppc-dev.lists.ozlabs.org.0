Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA3429BF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 05:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT1JJ0hRzz3035
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 14:25:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baidu.com (client-ip=220.181.50.185; helo=baidu.com;
 envelope-from=caihuoqing@baidu.com; receiver=<UNKNOWN>)
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HT1Hv62x5z2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 14:24:59 +1100 (AEDT)
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
 by Forcepoint Email with ESMTPS id 10170D13D26DC406E149;
 Tue, 12 Oct 2021 11:24:52 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 12 Oct 2021 11:24:51 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 12 Oct 2021 11:24:48 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Subject: [PATCH v2] tpm: ibmvtpm: Make use of dma_alloc_noncoherent()
Date: Tue, 12 Oct 2021 11:24:41 +0800
Message-ID: <20211012032442.2423-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-EX08.internal.baidu.com (172.31.51.48) To
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
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Jarkko Sakkinen <jarkko@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Peter Huewe <peterhuewe@gmx.de>, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replacing kmalloc/kfree/get_zeroed_page/free_page/dma_map_single/
dma_unmap_single() with dma_alloc_noncoherent/dma_free_noncoherent()
helps to reduce code size, and simplify the code, and the hardware
can keep DMA coherent itself.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2:
	*Change to dma_alloc/free_noncoherent from dma_alloc/free_coherent.
	*Update changelog.

 drivers/char/tpm/tpm_ibmvtpm.c | 63 +++++++++++-----------------------
 1 file changed, 20 insertions(+), 43 deletions(-)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 3af4c07a9342..b4552f8400b8 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -356,15 +356,13 @@ static void tpm_ibmvtpm_remove(struct vio_dev *vdev)
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
 
-	dma_unmap_single(ibmvtpm->dev, ibmvtpm->crq_dma_handle,
-			 CRQ_RES_BUF_SIZE, DMA_BIDIRECTIONAL);
-	free_page((unsigned long)ibmvtpm->crq_queue.crq_addr);
-
-	if (ibmvtpm->rtce_buf) {
-		dma_unmap_single(ibmvtpm->dev, ibmvtpm->rtce_dma_handle,
-				 ibmvtpm->rtce_size, DMA_BIDIRECTIONAL);
-		kfree(ibmvtpm->rtce_buf);
-	}
+	dma_free_noncoherent(ibmvtpm->dev, CRQ_RES_BUF_SIZE, crq_q->crq_addr,
+			     crq_q->crq_dma_handle, DMA_BIDIRECTIONAL);
+
+	if (ibmvtpm->rtce_buf)
+		dma_free_noncoherent(ibmvtpm->dev,
+				     ibmvtpm->rtce_size, ibmvtpm->rtce_buf,
+				     ibmvtpm->rtce_dma_handle, DMA_BIDIRECTIONAL);
 
 	kfree(ibmvtpm);
 	/* For tpm_ibmvtpm_get_desired_dma */
@@ -522,23 +520,12 @@ static void ibmvtpm_crq_process(struct ibmvtpm_crq *crq,
 				return;
 			}
 			ibmvtpm->rtce_size = be16_to_cpu(crq->len);
-			ibmvtpm->rtce_buf = kmalloc(ibmvtpm->rtce_size,
-						    GFP_ATOMIC);
-			if (!ibmvtpm->rtce_buf) {
-				dev_err(ibmvtpm->dev, "Failed to allocate memory for rtce buffer\n");
-				return;
-			}
-
-			ibmvtpm->rtce_dma_handle = dma_map_single(ibmvtpm->dev,
-				ibmvtpm->rtce_buf, ibmvtpm->rtce_size,
-				DMA_BIDIRECTIONAL);
-
-			if (dma_mapping_error(ibmvtpm->dev,
-					      ibmvtpm->rtce_dma_handle)) {
-				kfree(ibmvtpm->rtce_buf);
-				ibmvtpm->rtce_buf = NULL;
-				dev_err(ibmvtpm->dev, "Failed to dma map rtce buffer\n");
-			}
+			ibmvtpm->rtce_buf = dma_alloc_noncoherent(ibmvtpm->dev,
+								  ibmvtpm->rtce_size,
+								  &ibmvtpm->rtce_dma_handle,
+								  DMA_BIDIRECTIONAL, GFP_ATOMIC);
+			if (!ibmvtpm->rtce_buf)
+				dev_err(ibmvtpm->dev, "Failed to dma allocate rtce buffer\n");
 
 			return;
 		case VTPM_GET_VERSION_RES:
@@ -618,22 +605,14 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 	ibmvtpm->vdev = vio_dev;
 
 	crq_q = &ibmvtpm->crq_queue;
-	crq_q->crq_addr = (struct ibmvtpm_crq *)get_zeroed_page(GFP_KERNEL);
-	if (!crq_q->crq_addr) {
-		dev_err(dev, "Unable to allocate memory for crq_addr\n");
-		goto cleanup;
-	}
 
 	crq_q->num_entry = CRQ_RES_BUF_SIZE / sizeof(*crq_q->crq_addr);
 	init_waitqueue_head(&crq_q->wq);
-	ibmvtpm->crq_dma_handle = dma_map_single(dev, crq_q->crq_addr,
-						 CRQ_RES_BUF_SIZE,
-						 DMA_BIDIRECTIONAL);
-
-	if (dma_mapping_error(dev, ibmvtpm->crq_dma_handle)) {
-		dev_err(dev, "dma mapping failed\n");
+	crq_q->crq_addr = dma_alloc_noncoherent(dev, CRQ_RES_BUF_SIZE,
+						&ibmvtpm->crq_dma_handle,
+						DMA_BIDIRECTIONAL, GFP_KERNEL);
+	if (!crq_q->crq_addr)
 		goto cleanup;
-	}
 
 	rc = plpar_hcall_norets(H_REG_CRQ, vio_dev->unit_address,
 				ibmvtpm->crq_dma_handle, CRQ_RES_BUF_SIZE);
@@ -642,7 +621,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 
 	if (rc) {
 		dev_err(dev, "Unable to register CRQ rc=%d\n", rc);
-		goto reg_crq_cleanup;
+		goto cleanup;
 	}
 
 	rc = request_irq(vio_dev->irq, ibmvtpm_interrupt, 0,
@@ -704,13 +683,11 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 	do {
 		rc1 = plpar_hcall_norets(H_FREE_CRQ, vio_dev->unit_address);
 	} while (rc1 == H_BUSY || H_IS_LONG_BUSY(rc1));
-reg_crq_cleanup:
-	dma_unmap_single(dev, ibmvtpm->crq_dma_handle, CRQ_RES_BUF_SIZE,
-			 DMA_BIDIRECTIONAL);
 cleanup:
 	if (ibmvtpm) {
 		if (crq_q->crq_addr)
-			free_page((unsigned long)crq_q->crq_addr);
+			dma_free_noncoherent(dev, CRQ_RES_BUF_SIZE, crq_q->crq_addr,
+					     crq_q->crq_dma_handle, DMA_BIDIRECTIONAL);
 		kfree(ibmvtpm);
 	}
 
-- 
2.25.1

