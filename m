Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EAF2EC4AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 21:21:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB13Q21y4zDqXK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 07:21:22 +1100 (AEDT)
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
 header.s=pp1 header.b=kAvlDffS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB10X30DyzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jan 2021 07:18:51 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 106K2lOx068759; Wed, 6 Jan 2021 15:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zk4fwQ1mpTtaAgsE4A7FWK1EOTJDm11omUPkZUiLBb4=;
 b=kAvlDffSP4Khnj9Dfmg8necmWtWdzLnrjUm2jBHC7uGsjg97+l05AzFFyzA5ohdThR3K
 hakBZ7xEQnsLdVfn1FC1kvEal87W41LVSx9SigdmwXbP7P0rzUywgBVdrWo9m4n1q8jD
 Vja5tmm0362DXSopnf5Kq5wJpGHRUg8UQtEJyusazDLC8EgcgitmjqF53lWR5/9iFScb
 htVABSQ+AhQZizaVweeEJmbzH9OfmL3HDqaWWrfmVFUb/87SAmYkYhiPiA5FJJGBTP0j
 Z7Gt1GK5V64TD2XlI3OKosFFslPueO25U/RpaHsk9ND4ZyjoOZO0fWEImvirczJhO5e2 iw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35wk1vhy59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 15:18:47 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 106KHoZ4022346;
 Wed, 6 Jan 2021 20:18:46 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 35tgf97cd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 20:18:46 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 106KIjDE24838510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Jan 2021 20:18:45 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59C7AC6057;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AB50C6055;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Jan 2021 20:18:44 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 1/5] ibmvfc: define generic queue structure for CRQs
Date: Wed,  6 Jan 2021 14:18:31 -0600
Message-Id: <20210106201835.1053593-2-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210106201835.1053593-1-tyreld@linux.ibm.com>
References: <20210106201835.1053593-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_11:2021-01-06,
 2021-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060109
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

The primary and async CRQs are nearly identical outside of the format
and length of each message entry in the dma mapped page that represents
the queue data. These queues can be represented with a generic queue
structure that uses a union to differentiate between message format of
the mapped page.

This structure will further be leveraged in a followup patcheset that
introduce Sub-CRQs.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 135 +++++++++++++++++++++------------
 drivers/scsi/ibmvscsi/ibmvfc.h |  34 +++++----
 2 files changed, 107 insertions(+), 62 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 42e4d35e0d35..c8e7c4701ac4 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -660,7 +660,7 @@ static void ibmvfc_init_host(struct ibmvfc_host *vhost)
 	}
 
 	if (!ibmvfc_set_host_state(vhost, IBMVFC_INITIALIZING)) {
-		memset(vhost->async_crq.msgs, 0, PAGE_SIZE);
+		memset(vhost->async_crq.msgs.async, 0, PAGE_SIZE);
 		vhost->async_crq.cur = 0;
 
 		list_for_each_entry(tgt, &vhost->targets, queue)
@@ -713,6 +713,23 @@ static int ibmvfc_send_crq_init_complete(struct ibmvfc_host *vhost)
 	return ibmvfc_send_crq(vhost, 0xC002000000000000LL, 0);
 }
 
+/**
+ * ibmvfc_free_queue - Deallocate queue
+ * @vhost:	ibmvfc host struct
+ * @queue:	ibmvfc queue struct
+ *
+ * Unmaps dma and deallocates page for messages
+ **/
+static void ibmvfc_free_queue(struct ibmvfc_host *vhost,
+			      struct ibmvfc_queue *queue)
+{
+	struct device *dev = vhost->dev;
+
+	dma_unmap_single(dev, queue->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	free_page((unsigned long)queue->msgs.handle);
+	queue->msgs.handle = NULL;
+}
+
 /**
  * ibmvfc_release_crq_queue - Deallocates data and unregisters CRQ
  * @vhost:	ibmvfc host struct
@@ -724,7 +741,7 @@ static void ibmvfc_release_crq_queue(struct ibmvfc_host *vhost)
 {
 	long rc = 0;
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
-	struct ibmvfc_crq_queue *crq = &vhost->crq;
+	struct ibmvfc_queue *crq = &vhost->crq;
 
 	ibmvfc_dbg(vhost, "Releasing CRQ\n");
 	free_irq(vdev->irq, vhost);
@@ -737,8 +754,8 @@ static void ibmvfc_release_crq_queue(struct ibmvfc_host *vhost)
 
 	vhost->state = IBMVFC_NO_CRQ;
 	vhost->logged_in = 0;
-	dma_unmap_single(vhost->dev, crq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	free_page((unsigned long)crq->msgs);
+
+	ibmvfc_free_queue(vhost, crq);
 }
 
 /**
@@ -778,7 +795,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	int rc = 0;
 	unsigned long flags;
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
-	struct ibmvfc_crq_queue *crq = &vhost->crq;
+	struct ibmvfc_queue *crq = &vhost->crq;
 
 	/* Close the CRQ */
 	do {
@@ -792,7 +809,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	vhost->logged_in = 0;
 
 	/* Clean out the queue */
-	memset(crq->msgs, 0, PAGE_SIZE);
+	memset(crq->msgs.crq, 0, PAGE_SIZE);
 	crq->cur = 0;
 
 	/* And re-open it again */
@@ -1238,6 +1255,7 @@ static void ibmvfc_gather_partition_info(struct ibmvfc_host *vhost)
 static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
 {
 	struct ibmvfc_npiv_login *login_info = &vhost->login_info;
+	struct ibmvfc_queue *async_crq = &vhost->async_crq;
 	struct device_node *of_node = vhost->dev->of_node;
 	const char *location;
 
@@ -1257,7 +1275,8 @@ static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
 	login_info->max_cmds = cpu_to_be32(max_requests + IBMVFC_NUM_INTERNAL_REQ);
 	login_info->capabilities = cpu_to_be64(IBMVFC_CAN_MIGRATE | IBMVFC_CAN_SEND_VF_WWPN);
 	login_info->async.va = cpu_to_be64(vhost->async_crq.msg_token);
-	login_info->async.len = cpu_to_be32(vhost->async_crq.size * sizeof(*vhost->async_crq.msgs));
+	login_info->async.len = cpu_to_be32(async_crq->size *
+					    sizeof(*async_crq->msgs.async));
 	strncpy(login_info->partition_name, vhost->partition_name, IBMVFC_MAX_NAME);
 	strncpy(login_info->device_name,
 		dev_name(&vhost->host->shost_gendev), IBMVFC_MAX_NAME);
@@ -3230,10 +3249,10 @@ static struct scsi_host_template driver_template = {
  **/
 static struct ibmvfc_async_crq *ibmvfc_next_async_crq(struct ibmvfc_host *vhost)
 {
-	struct ibmvfc_async_crq_queue *async_crq = &vhost->async_crq;
+	struct ibmvfc_queue *async_crq = &vhost->async_crq;
 	struct ibmvfc_async_crq *crq;
 
-	crq = &async_crq->msgs[async_crq->cur];
+	crq = &async_crq->msgs.async[async_crq->cur];
 	if (crq->valid & 0x80) {
 		if (++async_crq->cur == async_crq->size)
 			async_crq->cur = 0;
@@ -3253,10 +3272,10 @@ static struct ibmvfc_async_crq *ibmvfc_next_async_crq(struct ibmvfc_host *vhost)
  **/
 static struct ibmvfc_crq *ibmvfc_next_crq(struct ibmvfc_host *vhost)
 {
-	struct ibmvfc_crq_queue *queue = &vhost->crq;
+	struct ibmvfc_queue *queue = &vhost->crq;
 	struct ibmvfc_crq *crq;
 
-	crq = &queue->msgs[queue->cur];
+	crq = &queue->msgs.crq[queue->cur];
 	if (crq->valid & 0x80) {
 		if (++queue->cur == queue->size)
 			queue->cur = 0;
@@ -4895,6 +4914,54 @@ static int ibmvfc_work(void *data)
 	return 0;
 }
 
+/**
+ * ibmvfc_alloc_queue - Allocate queue
+ * @vhost:	ibmvfc host struct
+ * @queue:	ibmvfc queue to allocate
+ * @fmt:	queue format to allocate
+ *
+ * Returns:
+ *	0 on success / non-zero on failure
+ **/
+static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
+			      struct ibmvfc_queue *queue,
+			      enum ibmvfc_msg_fmt fmt)
+{
+	struct device *dev = vhost->dev;
+	size_t fmt_size;
+
+	ENTER;
+	switch (fmt) {
+	case IBMVFC_CRQ_FMT:
+		fmt_size = sizeof(*queue->msgs.crq);
+		break;
+	case IBMVFC_ASYNC_FMT:
+		fmt_size = sizeof(*queue->msgs.async);
+		break;
+	default:
+		dev_warn(dev, "Unknown command/response queue message format: %d\n", fmt);
+		return -EINVAL;
+	}
+
+	queue->msgs.handle = (void *)get_zeroed_page(GFP_KERNEL);
+	if (!queue->msgs.handle)
+		return -ENOMEM;
+
+	queue->msg_token = dma_map_single(dev, queue->msgs.handle, PAGE_SIZE,
+					  DMA_BIDIRECTIONAL);
+
+	if (dma_mapping_error(dev, queue->msg_token)) {
+		free_page((unsigned long)queue->msgs.handle);
+		queue->msgs.handle = NULL;
+		return -ENOMEM;
+	}
+
+	queue->cur = 0;
+	queue->fmt = fmt;
+	queue->size = PAGE_SIZE / fmt_size;
+	return 0;
+}
+
 /**
  * ibmvfc_init_crq - Initializes and registers CRQ with hypervisor
  * @vhost:	ibmvfc host struct
@@ -4910,21 +4977,12 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 	int rc, retrc = -ENOMEM;
 	struct device *dev = vhost->dev;
 	struct vio_dev *vdev = to_vio_dev(dev);
-	struct ibmvfc_crq_queue *crq = &vhost->crq;
+	struct ibmvfc_queue *crq = &vhost->crq;
 
 	ENTER;
-	crq->msgs = (struct ibmvfc_crq *)get_zeroed_page(GFP_KERNEL);
-
-	if (!crq->msgs)
+	if (ibmvfc_alloc_queue(vhost, crq, IBMVFC_CRQ_FMT))
 		return -ENOMEM;
 
-	crq->size = PAGE_SIZE / sizeof(*crq->msgs);
-	crq->msg_token = dma_map_single(dev, crq->msgs,
-					PAGE_SIZE, DMA_BIDIRECTIONAL);
-
-	if (dma_mapping_error(dev, crq->msg_token))
-		goto map_failed;
-
 	retrc = rc = plpar_hcall_norets(H_REG_CRQ, vdev->unit_address,
 					crq->msg_token, PAGE_SIZE);
 
@@ -4953,7 +5011,6 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 		goto req_irq_failed;
 	}
 
-	crq->cur = 0;
 	LEAVE;
 	return retrc;
 
@@ -4963,9 +5020,7 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
 reg_crq_failed:
-	dma_unmap_single(dev, crq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
-map_failed:
-	free_page((unsigned long)crq->msgs);
+	ibmvfc_free_queue(vhost, crq);
 	return retrc;
 }
 
@@ -4978,7 +5033,7 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
  **/
 static void ibmvfc_free_mem(struct ibmvfc_host *vhost)
 {
-	struct ibmvfc_async_crq_queue *async_q = &vhost->async_crq;
+	struct ibmvfc_queue *async_q = &vhost->async_crq;
 
 	ENTER;
 	mempool_destroy(vhost->tgt_pool);
@@ -4988,9 +5043,7 @@ static void ibmvfc_free_mem(struct ibmvfc_host *vhost)
 	dma_free_coherent(vhost->dev, sizeof(*vhost->login_buf),
 			  vhost->login_buf, vhost->login_buf_dma);
 	dma_pool_destroy(vhost->sg_pool);
-	dma_unmap_single(vhost->dev, async_q->msg_token,
-			 async_q->size * sizeof(*async_q->msgs), DMA_BIDIRECTIONAL);
-	free_page((unsigned long)async_q->msgs);
+	ibmvfc_free_queue(vhost, async_q);
 	LEAVE;
 }
 
@@ -5003,26 +5056,15 @@ static void ibmvfc_free_mem(struct ibmvfc_host *vhost)
  **/
 static int ibmvfc_alloc_mem(struct ibmvfc_host *vhost)
 {
-	struct ibmvfc_async_crq_queue *async_q = &vhost->async_crq;
+	struct ibmvfc_queue *async_q = &vhost->async_crq;
 	struct device *dev = vhost->dev;
 
 	ENTER;
-	async_q->msgs = (struct ibmvfc_async_crq *)get_zeroed_page(GFP_KERNEL);
-	if (!async_q->msgs) {
-		dev_err(dev, "Couldn't allocate async queue.\n");
+	if (ibmvfc_alloc_queue(vhost, async_q, IBMVFC_ASYNC_FMT)) {
+		dev_err(dev, "Couldn't allocate/map async queue.\n");
 		goto nomem;
 	}
 
-	async_q->size = PAGE_SIZE / sizeof(struct ibmvfc_async_crq);
-	async_q->msg_token = dma_map_single(dev, async_q->msgs,
-					    async_q->size * sizeof(*async_q->msgs),
-					    DMA_BIDIRECTIONAL);
-
-	if (dma_mapping_error(dev, async_q->msg_token)) {
-		dev_err(dev, "Failed to map async queue\n");
-		goto free_async_crq;
-	}
-
 	vhost->sg_pool = dma_pool_create(IBMVFC_NAME, dev,
 					 SG_ALL * sizeof(struct srp_direct_buf),
 					 sizeof(struct srp_direct_buf), 0);
@@ -5077,10 +5119,7 @@ static int ibmvfc_alloc_mem(struct ibmvfc_host *vhost)
 free_sg_pool:
 	dma_pool_destroy(vhost->sg_pool);
 unmap_async_crq:
-	dma_unmap_single(dev, async_q->msg_token,
-			 async_q->size * sizeof(*async_q->msgs), DMA_BIDIRECTIONAL);
-free_async_crq:
-	free_page((unsigned long)async_q->msgs);
+	ibmvfc_free_queue(vhost, async_q);
 nomem:
 	LEAVE;
 	return -ENOMEM;
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 9d58cfd774d3..5bf1621223d6 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -645,12 +645,6 @@ struct ibmvfc_crq {
 	volatile __be64 ioba;
 } __packed __aligned(8);
 
-struct ibmvfc_crq_queue {
-	struct ibmvfc_crq *msgs;
-	int size, cur;
-	dma_addr_t msg_token;
-};
-
 enum ibmvfc_ae_link_state {
 	IBMVFC_AE_LS_LINK_UP		= 0x01,
 	IBMVFC_AE_LS_LINK_BOUNCED	= 0x02,
@@ -678,12 +672,6 @@ struct ibmvfc_async_crq {
 	__be64 reserved;
 } __packed __aligned(8);
 
-struct ibmvfc_async_crq_queue {
-	struct ibmvfc_async_crq *msgs;
-	int size, cur;
-	dma_addr_t msg_token;
-};
-
 union ibmvfc_iu {
 	struct ibmvfc_mad_common mad_common;
 	struct ibmvfc_npiv_login_mad npiv_login;
@@ -763,6 +751,24 @@ struct ibmvfc_event_pool {
 	dma_addr_t iu_token;
 };
 
+enum ibmvfc_msg_fmt {
+	IBMVFC_CRQ_FMT = 0,
+	IBMVFC_ASYNC_FMT,
+};
+
+union ibmvfc_msgs {
+	void *handle;
+	struct ibmvfc_crq *crq;
+	struct ibmvfc_async_crq *async;
+};
+
+struct ibmvfc_queue {
+	union ibmvfc_msgs msgs;
+	dma_addr_t msg_token;
+	enum ibmvfc_msg_fmt fmt;
+	int size, cur;
+};
+
 enum ibmvfc_host_action {
 	IBMVFC_HOST_ACTION_NONE = 0,
 	IBMVFC_HOST_ACTION_RESET,
@@ -808,8 +814,8 @@ struct ibmvfc_host {
 	struct ibmvfc_event_pool pool;
 	struct dma_pool *sg_pool;
 	mempool_t *tgt_pool;
-	struct ibmvfc_crq_queue crq;
-	struct ibmvfc_async_crq_queue async_crq;
+	struct ibmvfc_queue crq;
+	struct ibmvfc_queue async_crq;
 	struct ibmvfc_npiv_login login_info;
 	union ibmvfc_npiv_login_data *login_buf;
 	dma_addr_t login_buf_dma;
-- 
2.27.0

