Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1364F2EC4DB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 21:25:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB18G6b5FzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 07:25:34 +1100 (AEDT)
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
 header.s=pp1 header.b=jlYddjqo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB10X2hZ4zDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jan 2021 07:18:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 106K2qwu131990; Wed, 6 Jan 2021 15:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cj6IE0ErS4Q/shDuCwCjKhD6UD8J6yps+V4H4B4GawM=;
 b=jlYddjqoMJmJNfNvOR2ZDZoTDGP9BlfAGvynTIaj+S41NxCEdRQ5DsenkKzYvIUi4tZU
 LDanFoqODgmdp4Vug/VsApWIp3K2pSyLfPL7Cwu57vK59lolQegr1oe/2sNRWXnN5uTK
 Ef+qk/PXI3pH97tWPqnBmpRLjhni+oykeRXweVxIQQRbY6uJrZXNCt4ZJ50zG0HQVHZq
 XWuYxX46EKTwb7Yyn/KKjgqx2hj2FOdlaUkFmmK/znGEnWdmDYUETrAeX9RB1IzYUnLm
 mKRYdQfdWtnU1v96OXI8LM7lwmFQYW9coejMKNXewAc9DooJpMBbwre1pF/uDhQpGAT9 OQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35wkj78x0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 15:18:48 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 106KGstI014214;
 Wed, 6 Jan 2021 20:18:47 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 35tgf97fp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 20:18:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 106KIk8K28574128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Jan 2021 20:18:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27CF4C6057;
 Wed,  6 Jan 2021 20:18:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD651C605D;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 3/5] ibmvfc: define per-queue state/list locks
Date: Wed,  6 Jan 2021 14:18:33 -0600
Message-Id: <20210106201835.1053593-4-tyreld@linux.ibm.com>
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
 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Define per-queue locks for protecting queue state and event pool
sent/free lists. The evt list lock is initially redundant but it allows
the driver to be modified in the follow-up patches to relax the queue
locking around submissions and completions.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 93 +++++++++++++++++++++++++++-------
 drivers/scsi/ibmvscsi/ibmvfc.h |  7 ++-
 2 files changed, 80 insertions(+), 20 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 8de2a25b05ee..69a6401ca504 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -176,8 +176,9 @@ static void ibmvfc_trc_start(struct ibmvfc_event *evt)
 	struct ibmvfc_mad_common *mad = &evt->iu.mad_common;
 	struct ibmvfc_fcp_cmd_iu *iu = ibmvfc_get_fcp_iu(vhost, vfc_cmd);
 	struct ibmvfc_trace_entry *entry;
+	int index = atomic_inc_return(&vhost->trace_index) & IBMVFC_TRACE_INDEX_MASK;
 
-	entry = &vhost->trace[vhost->trace_index++];
+	entry = &vhost->trace[index];
 	entry->evt = evt;
 	entry->time = jiffies;
 	entry->fmt = evt->crq.format;
@@ -211,8 +212,10 @@ static void ibmvfc_trc_end(struct ibmvfc_event *evt)
 	struct ibmvfc_mad_common *mad = &evt->xfer_iu->mad_common;
 	struct ibmvfc_fcp_cmd_iu *iu = ibmvfc_get_fcp_iu(vhost, vfc_cmd);
 	struct ibmvfc_fcp_rsp *rsp = ibmvfc_get_fcp_rsp(vhost, vfc_cmd);
-	struct ibmvfc_trace_entry *entry = &vhost->trace[vhost->trace_index++];
+	struct ibmvfc_trace_entry *entry;
+	int index = atomic_inc_return(&vhost->trace_index) & IBMVFC_TRACE_INDEX_MASK;
 
+	entry = &vhost->trace[index];
 	entry->evt = evt;
 	entry->time = jiffies;
 	entry->fmt = evt->crq.format;
@@ -805,6 +808,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
+	spin_lock(vhost->crq.q_lock);
 	vhost->state = IBMVFC_NO_CRQ;
 	vhost->logged_in = 0;
 
@@ -821,6 +825,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 		dev_warn(vhost->dev, "Partner adapter not ready\n");
 	else if (rc != 0)
 		dev_warn(vhost->dev, "Couldn't register crq (rc=%d)\n", rc);
+	spin_unlock(vhost->crq.q_lock);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 
 	return rc;
@@ -853,10 +858,16 @@ static int ibmvfc_valid_event(struct ibmvfc_event_pool *pool,
 static void ibmvfc_free_event(struct ibmvfc_event *evt)
 {
 	struct ibmvfc_event_pool *pool = &evt->queue->evt_pool;
+	unsigned long flags;
 
 	BUG_ON(!ibmvfc_valid_event(pool, evt));
 	BUG_ON(atomic_inc_return(&evt->free) != 1);
+
+	spin_lock_irqsave(&evt->queue->l_lock, flags);
 	list_add_tail(&evt->queue_list, &evt->queue->free);
+	if (evt->eh_comp)
+		complete(evt->eh_comp);
+	spin_unlock_irqrestore(&evt->queue->l_lock, flags);
 }
 
 /**
@@ -875,12 +886,27 @@ static void ibmvfc_scsi_eh_done(struct ibmvfc_event *evt)
 		cmnd->scsi_done(cmnd);
 	}
 
-	if (evt->eh_comp)
-		complete(evt->eh_comp);
-
 	ibmvfc_free_event(evt);
 }
 
+/**
+ * ibmvfc_complete_purge - Complete failed command list
+ * @purge_list:		list head of failed commands
+ *
+ * This function runs completions on commands to fail as a result of a
+ * host reset or platform migration. Caller must hold host_lock.
+ **/
+static void ibmvfc_complete_purge(struct list_head *purge_list)
+{
+	struct ibmvfc_event *evt, *pos;
+
+	list_for_each_entry_safe(evt, pos, purge_list, queue_list) {
+		list_del(&evt->queue_list);
+		ibmvfc_trc_end(evt);
+		evt->done(evt);
+	}
+}
+
 /**
  * ibmvfc_fail_request - Fail request with specified error code
  * @evt:		ibmvfc event struct
@@ -897,10 +923,7 @@ static void ibmvfc_fail_request(struct ibmvfc_event *evt, int error_code)
 	} else
 		evt->xfer_iu->mad_common.status = cpu_to_be16(IBMVFC_MAD_DRIVER_FAILED);
 
-	list_del(&evt->queue_list);
 	del_timer(&evt->timer);
-	ibmvfc_trc_end(evt);
-	evt->done(evt);
 }
 
 /**
@@ -914,10 +937,14 @@ static void ibmvfc_fail_request(struct ibmvfc_event *evt, int error_code)
 static void ibmvfc_purge_requests(struct ibmvfc_host *vhost, int error_code)
 {
 	struct ibmvfc_event *evt, *pos;
+	unsigned long flags;
 
 	ibmvfc_dbg(vhost, "Purging all requests\n");
+	spin_lock_irqsave(&vhost->crq.l_lock, flags);
 	list_for_each_entry_safe(evt, pos, &vhost->crq.sent, queue_list)
 		ibmvfc_fail_request(evt, error_code);
+	list_splice_init(&vhost->crq.sent, &vhost->purge);
+	spin_unlock_irqrestore(&vhost->crq.l_lock, flags);
 }
 
 /**
@@ -1314,6 +1341,7 @@ static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
 
 	INIT_LIST_HEAD(&queue->sent);
 	INIT_LIST_HEAD(&queue->free);
+	spin_lock_init(&queue->l_lock);
 
 	for (i = 0; i < pool->size; ++i) {
 		struct ibmvfc_event *evt = &pool->events[i];
@@ -1368,11 +1396,14 @@ static void ibmvfc_free_event_pool(struct ibmvfc_host *vhost,
 static struct ibmvfc_event *ibmvfc_get_event(struct ibmvfc_queue *queue)
 {
 	struct ibmvfc_event *evt;
+	unsigned long flags;
 
+	spin_lock_irqsave(&queue->l_lock, flags);
 	BUG_ON(list_empty(&queue->free));
 	evt = list_entry(queue->free.next, struct ibmvfc_event, queue_list);
 	atomic_set(&evt->free, 0);
 	list_del(&evt->queue_list);
+	spin_unlock_irqrestore(&queue->l_lock, flags);
 	return evt;
 }
 
@@ -1506,6 +1537,7 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 			     struct ibmvfc_host *vhost, unsigned long timeout)
 {
 	__be64 *crq_as_u64 = (__be64 *) &evt->crq;
+	unsigned long flags;
 	int rc;
 
 	/* Copy the IU into the transfer area */
@@ -1517,7 +1549,6 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 	else
 		BUG();
 
-	list_add_tail(&evt->queue_list, &evt->queue->sent);
 	timer_setup(&evt->timer, ibmvfc_timeout, 0);
 
 	if (timeout) {
@@ -1525,11 +1556,15 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 		add_timer(&evt->timer);
 	}
 
+	spin_lock_irqsave(&evt->queue->l_lock, flags);
+	list_add_tail(&evt->queue_list, &evt->queue->sent);
+
 	mb();
 
 	if ((rc = ibmvfc_send_crq(vhost, be64_to_cpu(crq_as_u64[0]),
 				  be64_to_cpu(crq_as_u64[1])))) {
 		list_del(&evt->queue_list);
+		spin_unlock_irqrestore(&evt->queue->l_lock, flags);
 		del_timer(&evt->timer);
 
 		/* If send_crq returns H_CLOSED, return SCSI_MLQUEUE_HOST_BUSY.
@@ -1554,8 +1589,10 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 			evt->xfer_iu->mad_common.status = cpu_to_be16(IBMVFC_MAD_CRQ_ERROR);
 
 		evt->done(evt);
-	} else
+	} else {
+		spin_unlock_irqrestore(&evt->queue->l_lock, flags);
 		ibmvfc_trc_start(evt);
+	}
 
 	return 0;
 }
@@ -1663,9 +1700,6 @@ static void ibmvfc_scsi_done(struct ibmvfc_event *evt)
 		cmnd->scsi_done(cmnd);
 	}
 
-	if (evt->eh_comp)
-		complete(evt->eh_comp);
-
 	ibmvfc_free_event(evt);
 }
 
@@ -2219,28 +2253,28 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 	ENTER;
 	do {
 		wait = 0;
-		spin_lock_irqsave(vhost->host->host_lock, flags);
+		spin_lock_irqsave(&vhost->crq.l_lock, flags);
 		list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 			if (match(evt, device)) {
 				evt->eh_comp = &comp;
 				wait++;
 			}
 		}
-		spin_unlock_irqrestore(vhost->host->host_lock, flags);
+		spin_unlock_irqrestore(&vhost->crq.l_lock, flags);
 
 		if (wait) {
 			timeout = wait_for_completion_timeout(&comp, timeout);
 
 			if (!timeout) {
 				wait = 0;
-				spin_lock_irqsave(vhost->host->host_lock, flags);
+				spin_lock_irqsave(&vhost->crq.l_lock, flags);
 				list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 					if (match(evt, device)) {
 						evt->eh_comp = NULL;
 						wait++;
 					}
 				}
-				spin_unlock_irqrestore(vhost->host->host_lock, flags);
+				spin_unlock_irqrestore(&vhost->crq.l_lock, flags);
 				if (wait)
 					dev_err(vhost->dev, "Timed out waiting for aborted commands\n");
 				LEAVE;
@@ -2277,14 +2311,16 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 	u16 status;
 
 	ENTER;
-	spin_lock_irqsave(vhost->host->host_lock, flags);
 	found_evt = NULL;
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+	spin_lock(&vhost->crq.l_lock);
 	list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 		if (evt->cmnd && evt->cmnd->device == sdev) {
 			found_evt = evt;
 			break;
 		}
 	}
+	spin_unlock(&vhost->crq.l_lock);
 
 	if (!found_evt) {
 		if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
@@ -2414,14 +2450,16 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	unsigned long flags, timeout = IBMVFC_ABORT_TIMEOUT;
 	int rsp_code = 0;
 
-	spin_lock_irqsave(vhost->host->host_lock, flags);
 	found_evt = NULL;
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+	spin_lock(&vhost->crq.l_lock);
 	list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 		if (evt->cmnd && evt->cmnd->device == sdev) {
 			found_evt = evt;
 			break;
 		}
 	}
+	spin_unlock(&vhost->crq.l_lock);
 
 	if (!found_evt) {
 		if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
@@ -2935,7 +2973,9 @@ static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
 	}
 
 	del_timer(&evt->timer);
+	spin_lock(&evt->queue->l_lock);
 	list_del(&evt->queue_list);
+	spin_unlock(&evt->queue->l_lock);
 	ibmvfc_trc_end(evt);
 	evt->done(evt);
 }
@@ -3328,6 +3368,7 @@ static void ibmvfc_tasklet(void *data)
 	int done = 0;
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
+	spin_lock(vhost->crq.q_lock);
 	while (!done) {
 		/* Pull all the valid messages off the async CRQ */
 		while ((async = ibmvfc_next_async_crq(vhost)) != NULL) {
@@ -3358,6 +3399,7 @@ static void ibmvfc_tasklet(void *data)
 			done = 1;
 	}
 
+	spin_unlock(vhost->crq.q_lock);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 }
 
@@ -4734,6 +4776,7 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 	struct ibmvfc_target *tgt;
 	unsigned long flags;
 	struct fc_rport *rport;
+	LIST_HEAD(purge);
 	int rc;
 
 	ibmvfc_log_ae(vhost, vhost->events_to_log);
@@ -4746,6 +4789,8 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 		break;
 	case IBMVFC_HOST_ACTION_RESET:
 		vhost->action = IBMVFC_HOST_ACTION_TGT_DEL;
+		list_splice_init(&vhost->purge, &purge);
+		ibmvfc_complete_purge(&purge);
 		spin_unlock_irqrestore(vhost->host->host_lock, flags);
 		rc = ibmvfc_reset_crq(vhost);
 		spin_lock_irqsave(vhost->host->host_lock, flags);
@@ -4759,6 +4804,8 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 		break;
 	case IBMVFC_HOST_ACTION_REENABLE:
 		vhost->action = IBMVFC_HOST_ACTION_TGT_DEL;
+		list_splice_init(&vhost->purge, &purge);
+		ibmvfc_complete_purge(&purge);
 		spin_unlock_irqrestore(vhost->host->host_lock, flags);
 		rc = ibmvfc_reenable_crq_queue(vhost);
 		spin_lock_irqsave(vhost->host->host_lock, flags);
@@ -4936,6 +4983,9 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 	size_t fmt_size;
 
 	ENTER;
+	spin_lock_init(&queue->_lock);
+	queue->q_lock = &queue->_lock;
+
 	switch (fmt) {
 	case IBMVFC_CRQ_FMT:
 		fmt_size = sizeof(*queue->msgs.crq);
@@ -5098,6 +5148,7 @@ static int ibmvfc_alloc_mem(struct ibmvfc_host *vhost)
 
 	vhost->trace = kcalloc(IBMVFC_NUM_TRACE_ENTRIES,
 			       sizeof(struct ibmvfc_trace_entry), GFP_KERNEL);
+	atomic_set(&vhost->trace_index, -1);
 
 	if (!vhost->trace)
 		goto free_disc_buffer;
@@ -5214,6 +5265,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 
 	vhost = shost_priv(shost);
 	INIT_LIST_HEAD(&vhost->targets);
+	INIT_LIST_HEAD(&vhost->purge);
 	sprintf(vhost->name, IBMVFC_NAME);
 	vhost->host = shost;
 	vhost->dev = dev;
@@ -5298,6 +5350,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 static int ibmvfc_remove(struct vio_dev *vdev)
 {
 	struct ibmvfc_host *vhost = dev_get_drvdata(&vdev->dev);
+	LIST_HEAD(purge);
 	unsigned long flags;
 
 	ENTER;
@@ -5315,6 +5368,8 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	ibmvfc_purge_requests(vhost, DID_ERROR);
+	list_splice_init(&vhost->purge, &purge);
+	ibmvfc_complete_purge(&purge);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	ibmvfc_free_event_pool(vhost, &vhost->crq);
 
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 61c73b6f7a77..faf5b50d65b9 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -768,10 +768,13 @@ struct ibmvfc_queue {
 	dma_addr_t msg_token;
 	enum ibmvfc_msg_fmt fmt;
 	int size, cur;
+	spinlock_t _lock;
+	spinlock_t *q_lock;
 
 	struct ibmvfc_event_pool evt_pool;
 	struct list_head sent;
 	struct list_head free;
+	spinlock_t l_lock;
 };
 
 enum ibmvfc_host_action {
@@ -808,11 +811,13 @@ struct ibmvfc_host {
 	enum ibmvfc_host_action action;
 #define IBMVFC_NUM_TRACE_INDEX_BITS		8
 #define IBMVFC_NUM_TRACE_ENTRIES		(1 << IBMVFC_NUM_TRACE_INDEX_BITS)
+#define IBMVFC_TRACE_INDEX_MASK			(IBMVFC_NUM_TRACE_ENTRIES - 1)
 #define IBMVFC_TRACE_SIZE	(sizeof(struct ibmvfc_trace_entry) * IBMVFC_NUM_TRACE_ENTRIES)
 	struct ibmvfc_trace_entry *trace;
-	u32 trace_index:IBMVFC_NUM_TRACE_INDEX_BITS;
+	atomic_t trace_index;
 	int num_targets;
 	struct list_head targets;
+	struct list_head purge;
 	struct device *dev;
 	struct dma_pool *sg_pool;
 	mempool_t *tgt_pool;
-- 
2.27.0

