Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 707252CB1F5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:00:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm0yP3BHnzDqss
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 12:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mq+4JhMU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm0pF2jCszDr22
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 11:53:40 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B20XBIM191252; Tue, 1 Dec 2020 19:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CnHVvUkUx6YZ9zjf2V3StKrmNCJc7WEt8essI7a2Vhg=;
 b=mq+4JhMUYJ9EzVr+H/JTmDSqvVWtVFUogQikkYSNCnXkeMNL/g3Gg3Muh7D6cooXuI8k
 +JdyBtFMZmxdzteC+JhGParGKLRS3S4K7dIn8x4/BxISdrLpjxsD3f//8iz7pjQNcR7t
 QB/FyFkXJBMvE98nGKGiRkIpu3UXRPLdlRmbMd6OZstn4p6Zx0ygZLFNPny5c8HuPP0Z
 1062ZzxtZCSG56XQJBv7J+CbWK/gYtv/50SyBIbqfcUfS1Bre9U7ZsJuX5+xNZGUyinj
 j9qI1U8f9G/EgwTgRcoTBoLjDz//0/qjGsENv/3EDE5BxZZ/Z1Z5eyQ10dI7j4Iz8g74 uA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355y6cj9ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 19:53:35 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B20cNlI028139;
 Wed, 2 Dec 2020 00:53:35 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 353e69beeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:53:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B20rNu69765470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 00:53:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 738217805C;
 Wed,  2 Dec 2020 00:53:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16E7878066;
 Wed,  2 Dec 2020 00:53:33 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 00:53:33 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 04/17] ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ
 Channels
Date: Tue,  1 Dec 2020 18:53:16 -0600
Message-Id: <20201202005329.4538-5-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202005329.4538-1-tyreld@linux.ibm.com>
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_12:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=3 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020000
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
 drivers/scsi/ibmvscsi/ibmvfc.c | 128 +++++++++++++++++++++++++++++++++
 drivers/scsi/ibmvscsi/ibmvfc.h |   1 +
 2 files changed, 129 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 64674054dbae..4860487c6779 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -793,6 +793,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	unsigned long flags;
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	struct ibmvfc_crq_queue *crq = &vhost->crq;
+	struct ibmvfc_sub_queue *scrq;
+	int i;
 
 	/* Close the CRQ */
 	do {
@@ -809,6 +811,14 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	memset(crq->msgs, 0, PAGE_SIZE);
 	crq->cur = 0;
 
+	if (vhost->scsi_scrqs.scrqs) {
+		for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
+			scrq = &vhost->scsi_scrqs.scrqs[i];
+			memset(scrq->msgs, 0, PAGE_SIZE);
+			scrq->cur = 0;
+		}
+	}
+
 	/* And re-open it again */
 	rc = plpar_hcall_norets(H_REG_CRQ, vdev->unit_address,
 				crq->msg_token, PAGE_SIZE);
@@ -4983,6 +4993,117 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
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
+	vhost->scsi_scrqs.scrqs = kcalloc(IBMVFC_SCSI_HW_QUEUES,
+					  sizeof(*vhost->scsi_scrqs.scrqs),
+					  GFP_KERNEL);
+	if (!vhost->scsi_scrqs.scrqs)
+		return -1;
+
+	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
+		if (ibmvfc_register_scsi_channel(vhost, i)) {
+			for (j = i; j > 0; j--)
+				ibmvfc_deregister_scsi_channel(vhost, j - 1);
+			kfree(vhost->scsi_scrqs.scrqs);
+			vhost->scsi_scrqs.scrqs = NULL;
+			vhost->scsi_scrqs.active_queues = 0;
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
+	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++)
+		ibmvfc_deregister_scsi_channel(vhost, i);
+
+	kfree(vhost->scsi_scrqs.scrqs);
+	vhost->scsi_scrqs.scrqs = NULL;
+	vhost->scsi_scrqs.active_queues = 0;
+	LEAVE;
+}
+
 /**
  * ibmvfc_free_mem - Free memory for vhost
  * @vhost:	ibmvfc host struct
@@ -5239,6 +5360,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
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
@@ -5296,6 +5423,7 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	ibmvfc_purge_requests(vhost, DID_ERROR);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	ibmvfc_free_event_pool(vhost);
+	ibmvfc_release_sub_crqs(vhost);
 
 	ibmvfc_free_mem(vhost);
 	spin_lock(&ibmvfc_driver_lock);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index b3cd35cbf067..986ce4530382 100644
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

