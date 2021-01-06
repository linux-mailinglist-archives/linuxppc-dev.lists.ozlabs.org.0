Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A24BD2EC4D7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 21:23:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB16D0WQczDqkS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 07:23:48 +1100 (AEDT)
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
 header.s=pp1 header.b=tWtyGhNv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB10X2Q59zDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jan 2021 07:18:51 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 106K1hwe120070; Wed, 6 Jan 2021 15:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JZJirEr2ZMKDam+PzZs2jlJjmCPtCO/qBj7ZlGBTUeI=;
 b=tWtyGhNvG7C9vpyj03ViXT+tKOvq9E7E4pu3YkC7DBBZqlH2XWsqjv5HmkJc17YYj5AK
 TH0qfg1I5nEPGTAjP4jUF+je08ZESw2DHElRYmA2mHO9OWbx+jjjkbC/XY8aJ0BznxwL
 WjIo8rLl+5gHJjwC55hOEtiOnIUbphyet0qMjaOmKi+wDxVazTxfhIWaN4iocnG3CrrV
 bftr+lxF/BvYHAqZrBALoh37xLYYg5rsYF+JGrUMcPvYcVXEntTlfdNKgOD+GzHMMmyt
 dCjg+K9nfvtt0coGHgQBPokD4kCQdYpdJaobcHex3oEP4rQUEulZSlmU9OQbbmUf06ni 3w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35wkmkrw8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 15:18:48 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 106KH1TQ004175;
 Wed, 6 Jan 2021 20:18:47 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 35tgf9yfw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 20:18:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 106KIjaT26149186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Jan 2021 20:18:45 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0655C6055;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6726FC605A;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Jan 2021 20:18:45 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 2/5] ibmvfc: make command event pool queue specific
Date: Wed,  6 Jan 2021 14:18:32 -0600
Message-Id: <20210106201835.1053593-3-tyreld@linux.ibm.com>
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
 impostorscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060109
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

There is currently a single command event pool per host. In anticipation
of providing multiple queues add a per-queue event pool definition and
reimplement the existing CRQ to use its queue defined event pool for
command submission and completion.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 95 ++++++++++++++++++----------------
 drivers/scsi/ibmvscsi/ibmvfc.h | 10 ++--
 2 files changed, 55 insertions(+), 50 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index c8e7c4701ac4..8de2a25b05ee 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -852,12 +852,11 @@ static int ibmvfc_valid_event(struct ibmvfc_event_pool *pool,
  **/
 static void ibmvfc_free_event(struct ibmvfc_event *evt)
 {
-	struct ibmvfc_host *vhost = evt->vhost;
-	struct ibmvfc_event_pool *pool = &vhost->pool;
+	struct ibmvfc_event_pool *pool = &evt->queue->evt_pool;
 
 	BUG_ON(!ibmvfc_valid_event(pool, evt));
 	BUG_ON(atomic_inc_return(&evt->free) != 1);
-	list_add_tail(&evt->queue, &vhost->free);
+	list_add_tail(&evt->queue_list, &evt->queue->free);
 }
 
 /**
@@ -898,7 +897,7 @@ static void ibmvfc_fail_request(struct ibmvfc_event *evt, int error_code)
 	} else
 		evt->xfer_iu->mad_common.status = cpu_to_be16(IBMVFC_MAD_DRIVER_FAILED);
 
-	list_del(&evt->queue);
+	list_del(&evt->queue_list);
 	del_timer(&evt->timer);
 	ibmvfc_trc_end(evt);
 	evt->done(evt);
@@ -917,7 +916,7 @@ static void ibmvfc_purge_requests(struct ibmvfc_host *vhost, int error_code)
 	struct ibmvfc_event *evt, *pos;
 
 	ibmvfc_dbg(vhost, "Purging all requests\n");
-	list_for_each_entry_safe(evt, pos, &vhost->sent, queue)
+	list_for_each_entry_safe(evt, pos, &vhost->crq.sent, queue_list)
 		ibmvfc_fail_request(evt, error_code);
 }
 
@@ -1292,10 +1291,11 @@ static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
  *
  * Returns zero on success.
  **/
-static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost)
+static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
+				  struct ibmvfc_queue *queue)
 {
 	int i;
-	struct ibmvfc_event_pool *pool = &vhost->pool;
+	struct ibmvfc_event_pool *pool = &queue->evt_pool;
 
 	ENTER;
 	pool->size = max_requests + IBMVFC_NUM_INTERNAL_REQ;
@@ -1312,6 +1312,9 @@ static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost)
 		return -ENOMEM;
 	}
 
+	INIT_LIST_HEAD(&queue->sent);
+	INIT_LIST_HEAD(&queue->free);
+
 	for (i = 0; i < pool->size; ++i) {
 		struct ibmvfc_event *evt = &pool->events[i];
 		atomic_set(&evt->free, 1);
@@ -1319,8 +1322,9 @@ static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost)
 		evt->crq.ioba = cpu_to_be64(pool->iu_token + (sizeof(*evt->xfer_iu) * i));
 		evt->xfer_iu = pool->iu_storage + i;
 		evt->vhost = vhost;
+		evt->queue = queue;
 		evt->ext_list = NULL;
-		list_add_tail(&evt->queue, &vhost->free);
+		list_add_tail(&evt->queue_list, &queue->free);
 	}
 
 	LEAVE;
@@ -1332,14 +1336,15 @@ static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost)
  * @vhost:	ibmvfc host who owns the event pool
  *
  **/
-static void ibmvfc_free_event_pool(struct ibmvfc_host *vhost)
+static void ibmvfc_free_event_pool(struct ibmvfc_host *vhost,
+				   struct ibmvfc_queue *queue)
 {
 	int i;
-	struct ibmvfc_event_pool *pool = &vhost->pool;
+	struct ibmvfc_event_pool *pool = &queue->evt_pool;
 
 	ENTER;
 	for (i = 0; i < pool->size; ++i) {
-		list_del(&pool->events[i].queue);
+		list_del(&pool->events[i].queue_list);
 		BUG_ON(atomic_read(&pool->events[i].free) != 1);
 		if (pool->events[i].ext_list)
 			dma_pool_free(vhost->sg_pool,
@@ -1360,14 +1365,14 @@ static void ibmvfc_free_event_pool(struct ibmvfc_host *vhost)
  *
  * Returns a free event from the pool.
  **/
-static struct ibmvfc_event *ibmvfc_get_event(struct ibmvfc_host *vhost)
+static struct ibmvfc_event *ibmvfc_get_event(struct ibmvfc_queue *queue)
 {
 	struct ibmvfc_event *evt;
 
-	BUG_ON(list_empty(&vhost->free));
-	evt = list_entry(vhost->free.next, struct ibmvfc_event, queue);
+	BUG_ON(list_empty(&queue->free));
+	evt = list_entry(queue->free.next, struct ibmvfc_event, queue_list);
 	atomic_set(&evt->free, 0);
-	list_del(&evt->queue);
+	list_del(&evt->queue_list);
 	return evt;
 }
 
@@ -1512,7 +1517,7 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 	else
 		BUG();
 
-	list_add_tail(&evt->queue, &vhost->sent);
+	list_add_tail(&evt->queue_list, &evt->queue->sent);
 	timer_setup(&evt->timer, ibmvfc_timeout, 0);
 
 	if (timeout) {
@@ -1524,7 +1529,7 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 
 	if ((rc = ibmvfc_send_crq(vhost, be64_to_cpu(crq_as_u64[0]),
 				  be64_to_cpu(crq_as_u64[1])))) {
-		list_del(&evt->queue);
+		list_del(&evt->queue_list);
 		del_timer(&evt->timer);
 
 		/* If send_crq returns H_CLOSED, return SCSI_MLQUEUE_HOST_BUSY.
@@ -1747,7 +1752,7 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	}
 
 	cmnd->result = (DID_OK << 16);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, ibmvfc_scsi_done, IBMVFC_CMD_FORMAT);
 	evt->cmnd = cmnd;
 	cmnd->scsi_done = done;
@@ -1836,7 +1841,7 @@ static int ibmvfc_bsg_timeout(struct bsg_job *job)
 	}
 
 	vhost->aborting_passthru = 1;
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, ibmvfc_bsg_timeout_done, IBMVFC_MAD_FORMAT);
 
 	tmf = &evt->iu.tmf;
@@ -1894,7 +1899,7 @@ static int ibmvfc_bsg_plogi(struct ibmvfc_host *vhost, unsigned int port_id)
 	if (unlikely((rc = ibmvfc_host_chkready(vhost))))
 		goto unlock_out;
 
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_MAD_FORMAT);
 	plogi = &evt->iu.plogi;
 	memset(plogi, 0, sizeof(*plogi));
@@ -2012,7 +2017,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 		goto out;
 	}
 
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_MAD_FORMAT);
 	mad = &evt->iu.passthru;
 
@@ -2096,7 +2101,7 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	if (vhost->state == IBMVFC_ACTIVE) {
-		evt = ibmvfc_get_event(vhost);
+		evt = ibmvfc_get_event(&vhost->crq);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
@@ -2215,7 +2220,7 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 	do {
 		wait = 0;
 		spin_lock_irqsave(vhost->host->host_lock, flags);
-		list_for_each_entry(evt, &vhost->sent, queue) {
+		list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 			if (match(evt, device)) {
 				evt->eh_comp = &comp;
 				wait++;
@@ -2229,7 +2234,7 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 			if (!timeout) {
 				wait = 0;
 				spin_lock_irqsave(vhost->host->host_lock, flags);
-				list_for_each_entry(evt, &vhost->sent, queue) {
+				list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 					if (match(evt, device)) {
 						evt->eh_comp = NULL;
 						wait++;
@@ -2274,7 +2279,7 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 	ENTER;
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	found_evt = NULL;
-	list_for_each_entry(evt, &vhost->sent, queue) {
+	list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 		if (evt->cmnd && evt->cmnd->device == sdev) {
 			found_evt = evt;
 			break;
@@ -2289,7 +2294,7 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 	}
 
 	if (vhost->logged_in) {
-		evt = ibmvfc_get_event(vhost);
+		evt = ibmvfc_get_event(&vhost->crq);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_MAD_FORMAT);
 
 		tmf = &evt->iu.tmf;
@@ -2411,7 +2416,7 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	found_evt = NULL;
-	list_for_each_entry(evt, &vhost->sent, queue) {
+	list_for_each_entry(evt, &vhost->crq.sent, queue_list) {
 		if (evt->cmnd && evt->cmnd->device == sdev) {
 			found_evt = evt;
 			break;
@@ -2426,7 +2431,7 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	}
 
 	if (vhost->state == IBMVFC_ACTIVE) {
-		evt = ibmvfc_get_event(vhost);
+		evt = ibmvfc_get_event(&vhost->crq);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
@@ -2917,7 +2922,7 @@ static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
 	 * things we send. Make sure this response is to something we
 	 * actually sent
 	 */
-	if (unlikely(!ibmvfc_valid_event(&vhost->pool, evt))) {
+	if (unlikely(!ibmvfc_valid_event(&vhost->crq.evt_pool, evt))) {
 		dev_err(vhost->dev, "Returned correlation_token 0x%08llx is invalid!\n",
 			crq->ioba);
 		return;
@@ -2930,7 +2935,7 @@ static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
 	}
 
 	del_timer(&evt->timer);
-	list_del(&evt->queue);
+	list_del(&evt->queue_list);
 	ibmvfc_trc_end(evt);
 	evt->done(evt);
 }
@@ -3508,7 +3513,7 @@ static void ibmvfc_tgt_send_prli(struct ibmvfc_target *tgt)
 		return;
 
 	kref_get(&tgt->kref);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	vhost->discovery_threads++;
 	ibmvfc_init_event(evt, ibmvfc_tgt_prli_done, IBMVFC_MAD_FORMAT);
 	evt->tgt = tgt;
@@ -3615,7 +3620,7 @@ static void ibmvfc_tgt_send_plogi(struct ibmvfc_target *tgt)
 
 	kref_get(&tgt->kref);
 	tgt->logo_rcvd = 0;
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	vhost->discovery_threads++;
 	ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_INIT_WAIT);
 	ibmvfc_init_event(evt, ibmvfc_tgt_plogi_done, IBMVFC_MAD_FORMAT);
@@ -3690,7 +3695,7 @@ static struct ibmvfc_event *__ibmvfc_tgt_get_implicit_logout_evt(struct ibmvfc_t
 	struct ibmvfc_event *evt;
 
 	kref_get(&tgt->kref);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, done, IBMVFC_MAD_FORMAT);
 	evt->tgt = tgt;
 	mad = &evt->iu.implicit_logout;
@@ -3855,7 +3860,7 @@ static void ibmvfc_tgt_move_login(struct ibmvfc_target *tgt)
 		return;
 
 	kref_get(&tgt->kref);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	vhost->discovery_threads++;
 	ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_INIT_WAIT);
 	ibmvfc_init_event(evt, ibmvfc_tgt_move_login_done, IBMVFC_MAD_FORMAT);
@@ -4021,7 +4026,7 @@ static void ibmvfc_adisc_timeout(struct timer_list *t)
 
 	vhost->abort_threads++;
 	kref_get(&tgt->kref);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, ibmvfc_tgt_adisc_cancel_done, IBMVFC_MAD_FORMAT);
 
 	evt->tgt = tgt;
@@ -4071,7 +4076,7 @@ static void ibmvfc_tgt_adisc(struct ibmvfc_target *tgt)
 		return;
 
 	kref_get(&tgt->kref);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	vhost->discovery_threads++;
 	ibmvfc_init_event(evt, ibmvfc_tgt_adisc_done, IBMVFC_MAD_FORMAT);
 	evt->tgt = tgt;
@@ -4174,7 +4179,7 @@ static void ibmvfc_tgt_query_target(struct ibmvfc_target *tgt)
 		return;
 
 	kref_get(&tgt->kref);
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	vhost->discovery_threads++;
 	evt->tgt = tgt;
 	ibmvfc_init_event(evt, ibmvfc_tgt_query_target_done, IBMVFC_MAD_FORMAT);
@@ -4341,7 +4346,7 @@ static void ibmvfc_discover_targets_done(struct ibmvfc_event *evt)
 static void ibmvfc_discover_targets(struct ibmvfc_host *vhost)
 {
 	struct ibmvfc_discover_targets *mad;
-	struct ibmvfc_event *evt = ibmvfc_get_event(vhost);
+	struct ibmvfc_event *evt = ibmvfc_get_event(&vhost->crq);
 
 	ibmvfc_init_event(evt, ibmvfc_discover_targets_done, IBMVFC_MAD_FORMAT);
 	mad = &evt->iu.discover_targets;
@@ -4454,7 +4459,7 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
 static void ibmvfc_npiv_login(struct ibmvfc_host *vhost)
 {
 	struct ibmvfc_npiv_login_mad *mad;
-	struct ibmvfc_event *evt = ibmvfc_get_event(vhost);
+	struct ibmvfc_event *evt = ibmvfc_get_event(&vhost->crq);
 
 	ibmvfc_gather_partition_info(vhost);
 	ibmvfc_set_login_info(vhost);
@@ -4491,7 +4496,7 @@ static void ibmvfc_npiv_logout_done(struct ibmvfc_event *evt)
 
 	switch (mad_status) {
 	case IBMVFC_MAD_SUCCESS:
-		if (list_empty(&vhost->sent) &&
+		if (list_empty(&vhost->crq.sent) &&
 		    vhost->action == IBMVFC_HOST_ACTION_LOGO_WAIT) {
 			ibmvfc_init_host(vhost);
 			return;
@@ -4519,7 +4524,7 @@ static void ibmvfc_npiv_logout(struct ibmvfc_host *vhost)
 	struct ibmvfc_npiv_logout_mad *mad;
 	struct ibmvfc_event *evt;
 
-	evt = ibmvfc_get_event(vhost);
+	evt = ibmvfc_get_event(&vhost->crq);
 	ibmvfc_init_event(evt, ibmvfc_npiv_logout_done, IBMVFC_MAD_FORMAT);
 
 	mad = &evt->iu.npiv_logout;
@@ -5208,8 +5213,6 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	shost->unique_id = shost->host_no;
 
 	vhost = shost_priv(shost);
-	INIT_LIST_HEAD(&vhost->sent);
-	INIT_LIST_HEAD(&vhost->free);
 	INIT_LIST_HEAD(&vhost->targets);
 	sprintf(vhost->name, IBMVFC_NAME);
 	vhost->host = shost;
@@ -5241,7 +5244,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 		goto kill_kthread;
 	}
 
-	if ((rc = ibmvfc_init_event_pool(vhost))) {
+	if ((rc = ibmvfc_init_event_pool(vhost, &vhost->crq))) {
 		dev_err(dev, "Couldn't initialize event pool. rc=%d\n", rc);
 		goto release_crq;
 	}
@@ -5271,7 +5274,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 remove_shost:
 	scsi_remove_host(shost);
 release_event_pool:
-	ibmvfc_free_event_pool(vhost);
+	ibmvfc_free_event_pool(vhost, &vhost->crq);
 release_crq:
 	ibmvfc_release_crq_queue(vhost);
 kill_kthread:
@@ -5313,7 +5316,7 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	ibmvfc_purge_requests(vhost, DID_ERROR);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
-	ibmvfc_free_event_pool(vhost);
+	ibmvfc_free_event_pool(vhost, &vhost->crq);
 
 	ibmvfc_free_mem(vhost);
 	spin_lock(&ibmvfc_driver_lock);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 5bf1621223d6..61c73b6f7a77 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -726,8 +726,9 @@ struct ibmvfc_target {
 
 /* a unit of work for the hosting partition */
 struct ibmvfc_event {
-	struct list_head queue;
+	struct list_head queue_list;
 	struct ibmvfc_host *vhost;
+	struct ibmvfc_queue *queue;
 	struct ibmvfc_target *tgt;
 	struct scsi_cmnd *cmnd;
 	atomic_t free;
@@ -767,6 +768,10 @@ struct ibmvfc_queue {
 	dma_addr_t msg_token;
 	enum ibmvfc_msg_fmt fmt;
 	int size, cur;
+
+	struct ibmvfc_event_pool evt_pool;
+	struct list_head sent;
+	struct list_head free;
 };
 
 enum ibmvfc_host_action {
@@ -808,10 +813,7 @@ struct ibmvfc_host {
 	u32 trace_index:IBMVFC_NUM_TRACE_INDEX_BITS;
 	int num_targets;
 	struct list_head targets;
-	struct list_head sent;
-	struct list_head free;
 	struct device *dev;
-	struct ibmvfc_event_pool pool;
 	struct dma_pool *sg_pool;
 	mempool_t *tgt_pool;
 	struct ibmvfc_queue crq;
-- 
2.27.0

