Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139E2F6C5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 21:42:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGx8W6c5HzDqC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 07:42:51 +1100 (AEDT)
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
 header.s=pp1 header.b=ip77GuWC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGwvy3lWbzDrQh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 07:31:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EK2D8j069176; Thu, 14 Jan 2021 15:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9rCZsdpWTuc9zRargT+2e60gHxzDGTdQNT6kzrtC5v0=;
 b=ip77GuWC4QLW4ZMEOqizsn6NO30SRfZ0E4hZugLHnSt80dD4XPdDGYGF4B1+VXOagv5r
 53AsoWnf8ukberKEV4tk9c+2RGRDsHnEb+qpPU17CfHu4/XD5ZioiTJdcNVyNyb9nj9u
 13NXqf+dWfN35lkFUwQoFYlJ4+Fhk//E2zRvX9hgkZ45TIc27tXZZGnLJuvrcvh5aNGW
 YPR0Z+b9OEgTdbnZC1dTzV+kZFkv1ah9XdDJXVpIzLRqaALpPNHuHrwWO571VhOaE7d8
 UDGG/TM5d4V82YnxFNJ35R+P77N7TgrcbUB7tbX7hXhF5I05pSa0wabKGnRgvY4WDKat zQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362ucvjutf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:31:55 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EKS7Yc026129;
 Thu, 14 Jan 2021 20:31:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 35y449sne3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 20:31:54 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EKVr1423527776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 20:31:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AA0E6E04E;
 Thu, 14 Jan 2021 20:31:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC1DE6E04C;
 Thu, 14 Jan 2021 20:31:52 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 20:31:52 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 07/21] ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ
 Channels
Date: Thu, 14 Jan 2021 14:31:34 -0600
Message-Id: <20210114203148.246656-8-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210114203148.246656-1-tyreld@linux.ibm.com>
References: <20210114203148.246656-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_07:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101140111
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
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian King <brking@linux.vnet.ibm.com>, brking@linux.ibm.com,
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
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 125 +++++++++++++++++++++++++++++++++
 drivers/scsi/ibmvscsi/ibmvfc.h |   1 +
 2 files changed, 126 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 612c7f3d7bd3..a198e118887d 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -895,6 +895,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	unsigned long flags;
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	struct ibmvfc_queue *crq = &vhost->crq;
+	struct ibmvfc_queue *scrq;
+	int i;
 
 	/* Close the CRQ */
 	do {
@@ -912,6 +914,16 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	memset(crq->msgs.crq, 0, PAGE_SIZE);
 	crq->cur = 0;
 
+	if (vhost->scsi_scrqs.scrqs) {
+		for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
+			scrq = &vhost->scsi_scrqs.scrqs[i];
+			spin_lock(scrq->q_lock);
+			memset(scrq->msgs.scrq, 0, PAGE_SIZE);
+			scrq->cur = 0;
+			spin_unlock(scrq->q_lock);
+		}
+	}
+
 	/* And re-open it again */
 	rc = plpar_hcall_norets(H_REG_CRQ, vdev->unit_address,
 				crq->msg_token, PAGE_SIZE);
@@ -5045,6 +5057,11 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 	case IBMVFC_ASYNC_FMT:
 		fmt_size = sizeof(*queue->msgs.async);
 		break;
+	case IBMVFC_SUB_CRQ_FMT:
+		fmt_size = sizeof(*queue->msgs.scrq);
+		/* We need one extra event for Cancel Commands */
+		pool_size = max_requests + 1;
+		break;
 	default:
 		dev_warn(dev, "Unknown command/response queue message format: %d\n", fmt);
 		return -EINVAL;
@@ -5136,6 +5153,107 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 	return retrc;
 }
 
+static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
+				  int index)
+{
+	struct device *dev = vhost->dev;
+	struct vio_dev *vdev = to_vio_dev(dev);
+	struct ibmvfc_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
+	int rc = -ENOMEM;
+
+	ENTER;
+
+	if (ibmvfc_alloc_queue(vhost, scrq, IBMVFC_SUB_CRQ_FMT))
+		return -ENOMEM;
+
+	rc = h_reg_sub_crq(vdev->unit_address, scrq->msg_token, PAGE_SIZE,
+			   &scrq->cookie, &scrq->hw_irq);
+
+	if (rc) {
+		dev_warn(dev, "Error registering sub-crq: %d\n", rc);
+		if (rc == H_PARAMETER)
+			dev_warn_once(dev, "Firmware may not support MQ\n");
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
+	ibmvfc_free_queue(vhost, scrq);
+	LEAVE;
+	return rc;
+}
+
+static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
+{
+	struct device *dev = vhost->dev;
+	struct vio_dev *vdev = to_vio_dev(dev);
+	struct ibmvfc_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
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
+	ibmvfc_free_queue(vhost, scrq);
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
@@ -5371,6 +5489,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
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
@@ -5427,6 +5551,7 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	list_splice_init(&vhost->purge, &purge);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	ibmvfc_complete_purge(&purge);
+	ibmvfc_release_sub_crqs(vhost);
 	ibmvfc_release_crq_queue(vhost);
 
 	ibmvfc_free_mem(vhost);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index b9eed05c165f..bdafe9956649 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -850,6 +850,7 @@ struct ibmvfc_host {
 	mempool_t *tgt_pool;
 	struct ibmvfc_queue crq;
 	struct ibmvfc_queue async_crq;
+	struct ibmvfc_scsi_channels scsi_scrqs;
 	struct ibmvfc_npiv_login login_info;
 	union ibmvfc_npiv_login_data *login_buf;
 	dma_addr_t login_buf_dma;
-- 
2.27.0

