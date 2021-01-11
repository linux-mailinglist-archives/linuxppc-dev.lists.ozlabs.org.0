Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 733622F230C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:16:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF8hy2mykzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:16:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hN8Ix5Km; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8ch2PXszDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:35 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BN1RE0093692; Mon, 11 Jan 2021 18:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PuJ0PDc+UyiDlIECxar4D5rNl7YB2feQmh7l6C/SZIo=;
 b=hN8Ix5KmGljYHNh8LLVF/eRlvqXykcIYDBt/SNL1xD0Iilaw9O4Xp9OnDib83/vjOCln
 cNEMk7LCma45emZS+hPfcMoEfjSReMxcq51mHZmxNOBM4hcN86rdGok8Z/Sy4qE9t+Nc
 Mlrwcc2lmjoAVJx+DgZ786WguYZPR8GY/XenW7kio6cwvPqTphy87xGnHzIPia4C0l1l
 JKqbBZjro5vzITlsSyoVsFsiaHBdiJh+3OBeZgp+FZlreE8AcxhxN1n9E1cFFtN9LNIy
 KhulnOmWTKig78rZpx9ziQvMnnAk2Don/ZIQS4lvO53Ep8CqsK8kg5zraViN6SeGsqe+ lQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360wgfmegt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:33 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN7H5B018708;
 Mon, 11 Jan 2021 23:12:32 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 35y448sy6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCVbG23134510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3452E78063;
 Mon, 11 Jan 2021 23:12:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C61777805C;
 Mon, 11 Jan 2021 23:12:30 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:30 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 07/21] ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ
 Channels
Date: Mon, 11 Jan 2021 17:12:11 -0600
Message-Id: <20210111231225.105347-8-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210111231225.105347-1-tyreld@linux.ibm.com>
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_32:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110126
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

