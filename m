Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C92C4CFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:59:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChLXV6ThyzDrCG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 12:59:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CxP7mG/m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChLJP1M1ZzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 12:48:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ1W4KY067607; Wed, 25 Nov 2020 20:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3/mPVn03uqFDtBimosciq6VihOc2x3uUBljCXHZJm1c=;
 b=CxP7mG/mVy8HVkUyOtnaa7vfd+GIUw+rhamhUe8TPTfiu94ChySeSYT/rI4XFhtnhrbK
 5PtGvAyWfa1ryGSZNymKxtZOdxEXzAM3X9hrgNbSONLXxMD3F/H38GaQl0k9V8CUUMSN
 WcWsnT1OveZbRDhhRkglt+Pl5ttASbFv+VkqGzFCSC4PZFQZsvSfxCxeGRNg6UmOCreN
 BndXQ0NiPrZwqgZw4r2uNcHXCGTo7v8a6OVH9Ud72FutHRutMeAySOxwY6j/K5pTQAy2
 vE3J5ElRLyPoK0Zd3HpkPZYMt3ivcVz4n7D0W6NmvIJAjTJRpph2+SfJwS+6PPsRCnfd rQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352266gwe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 20:48:33 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ1m84N028844;
 Thu, 26 Nov 2020 01:48:32 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34xth9vrqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 01:48:32 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ1mMeb1573448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 01:48:22 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 466F06E052;
 Thu, 26 Nov 2020 01:48:31 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F27446E04C;
 Thu, 26 Nov 2020 01:48:30 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 01:48:30 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 04/13] ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ
 Channels
Date: Wed, 25 Nov 2020 19:48:15 -0600
Message-Id: <20201126014824.123831-5-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126014824.123831-1-tyreld@linux.ibm.com>
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_14:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=3 impostorscore=0 phishscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011260001
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allocate a set of Sub-CRQs in advance. During channel setup the client
and VIOS negotiate the number of queues the VIOS supports and the number
that the client desires to request. Its possible that the final channel
resources allocated is less than requested, but the client is still
responsible for sending handles for every queue it is hoping for.

Also, provide deallocation cleanup routines.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 115 +++++++++++++++++++++++++++++++++
 drivers/scsi/ibmvscsi/ibmvfc.h |   1 +
 2 files changed, 116 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 260b82e3cc01..571abdb48384 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4983,6 +4983,114 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 	return retrc;
 }
 
+static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
+				  int index)
+{
+	struct device *dev = vhost->dev;
+	struct vio_dev *vdev = to_vio_dev(dev);
+	struct ibmvfc_sub_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
+	int rc = -ENOMEM;
+
+	ENTER;
+
+	scrq->msgs = (struct ibmvfc_sub_crq *)get_zeroed_page(GFP_KERNEL);
+	if (!scrq->msgs)
+		return rc;
+
+	scrq->size = PAGE_SIZE / sizeof(*scrq->msgs);
+	scrq->msg_token = dma_map_single(dev, scrq->msgs, PAGE_SIZE,
+					 DMA_BIDIRECTIONAL);
+
+	if (dma_mapping_error(dev, scrq->msg_token))
+		goto dma_map_failed;
+
+	rc = h_reg_sub_crq(vdev->unit_address, scrq->msg_token, PAGE_SIZE,
+			   &scrq->cookie, &scrq->hw_irq);
+
+	if (rc) {
+		dev_warn(dev, "Error registering sub-crq: %d\n", rc);
+		dev_warn(dev, "Firmware may not support MQ\n");
+		goto reg_failed;
+	}
+
+	scrq->hwq_id = index;
+	scrq->vhost = vhost;
+
+	LEAVE;
+	return 0;
+
+reg_failed:
+	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
+dma_map_failed:
+	free_page((unsigned long)scrq->msgs);
+	LEAVE;
+	return rc;
+}
+
+static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
+{
+	struct device *dev = vhost->dev;
+	struct vio_dev *vdev = to_vio_dev(dev);
+	struct ibmvfc_sub_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
+	long rc;
+
+	ENTER;
+
+	do {
+		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address,
+					scrq->cookie);
+	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
+
+	if (rc)
+		dev_err(dev, "Failed to free sub-crq[%d]: rc=%ld\n", index, rc);
+
+	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)scrq->msgs);
+	LEAVE;
+}
+
+static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
+{
+	int i, j;
+
+	ENTER;
+
+	vhost->scsi_scrqs.scrqs = kcalloc(vhost->client_scsi_channels,
+					  sizeof(*vhost->scsi_scrqs.scrqs),
+					  GFP_KERNEL);
+	if (!vhost->scsi_scrqs.scrqs)
+		return -1;
+
+	for (i = 0; i < vhost->client_scsi_channels; i++) {
+		if (ibmvfc_register_scsi_channel(vhost, i)) {
+			for (j = i; j > 0; j--)
+				ibmvfc_deregister_scsi_channel(vhost, j - 1);
+			kfree(vhost->scsi_scrqs.scrqs);
+			LEAVE;
+			return -1;
+		}
+	}
+
+	LEAVE;
+	return 0;
+}
+
+static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
+{
+	int i;
+
+	ENTER;
+	if (!vhost->scsi_scrqs.scrqs)
+		return;
+
+	for (i = 0; i < vhost->client_scsi_channels; i++)
+		ibmvfc_deregister_scsi_channel(vhost, i);
+
+	vhost->scsi_scrqs.active_queues = 0;
+	kfree(vhost->scsi_scrqs.scrqs);
+	LEAVE;
+}
+
 /**
  * ibmvfc_free_mem - Free memory for vhost
  * @vhost:	ibmvfc host struct
@@ -5239,6 +5347,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 		goto remove_shost;
 	}
 
+	if (vhost->mq_enabled) {
+		rc = ibmvfc_init_sub_crqs(vhost);
+		if (rc)
+			dev_warn(dev, "Failed to allocate Sub-CRQs. rc=%d\n", rc);
+	}
+
 	if (shost_to_fc_host(shost)->rqst_q)
 		blk_queue_max_segments(shost_to_fc_host(shost)->rqst_q, 1);
 	dev_set_drvdata(dev, vhost);
@@ -5296,6 +5410,7 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	ibmvfc_purge_requests(vhost, DID_ERROR);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	ibmvfc_free_event_pool(vhost);
+	ibmvfc_release_sub_crqs(vhost);
 
 	ibmvfc_free_mem(vhost);
 	spin_lock(&ibmvfc_driver_lock);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 084ecdfe51ea..d80c7eeef409 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -838,6 +838,7 @@ struct ibmvfc_host {
 	mempool_t *tgt_pool;
 	struct ibmvfc_crq_queue crq;
 	struct ibmvfc_async_crq_queue async_crq;
+	struct ibmvfc_scsi_channels scsi_scrqs;
 	struct ibmvfc_npiv_login login_info;
 	union ibmvfc_npiv_login_data *login_buf;
 	dma_addr_t login_buf_dma;
-- 
2.27.0

