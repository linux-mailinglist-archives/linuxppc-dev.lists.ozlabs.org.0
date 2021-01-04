Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5195F2E9FFA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 23:26:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8qwN574DzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 09:26:12 +1100 (AEDT)
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
 header.s=pp1 header.b=MSqwNRG3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8qtQ3GTXzDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 09:24:30 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104MJ3OP025436; Mon, 4 Jan 2021 17:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/Yp10RyM//OGreXTa1xi/YsoDt+1g/GYthpRZ6iOldE=;
 b=MSqwNRG3XQuUsySAsc/8Zd0NnGTt7/T8Y3AScq6ZSkhiv0Ph2sxkxoBpW9DqGkYf9ro7
 aKjzQrj0KxC5k64mSJag3/8LhwJubd0kriO8FtSCMxPop45lPJqciIlmlJ7pZmJ9gDm+
 TuX9lFvsBtak98CS9Bl9N706VjFRSHpv8SiDeW+8V1+/ZbW7huxbsuEmZQNz5eX1lkAe
 /zsPKrTN2RBIIiGazsvFl0YKoti9WrHaq8u5QN2Qm3hpUnCnAQXR+HB3FV06tVrklS31
 8vnwpH6fiapytoqI4RX5vHgL3CkeitEggy9jxs9QAomGQQeTX4RBtxHGqOaNAMhqazQC XA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vbq58204-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 17:24:26 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104MHok4004753;
 Mon, 4 Jan 2021 22:24:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 35tgf8scwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 22:24:25 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104MOOqK20775408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 22:24:24 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7D026E04C;
 Mon,  4 Jan 2021 22:24:24 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DA9B6E059;
 Mon,  4 Jan 2021 22:24:24 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jan 2021 22:24:24 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 4/5] ibmvfc: complete commands outside the host/queue lock
Date: Mon,  4 Jan 2021 16:24:22 -0600
Message-Id: <20210104222422.981457-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218231916.279833-5-tyreld@linux.ibm.com>
References: <20201218231916.279833-5-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_14:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101040130
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

Drain the command queue and place all commands on a completion list.
Perform command completion on that list outside the host/queue locks.
Further, move purged command compeletions outside the host_lock as well.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---

Changes in v2:
* Changed ibmvfc_locked_done to static fixing no-prototype warning

 drivers/scsi/ibmvscsi/ibmvfc.c | 58 ++++++++++++++++++++++++++--------
 drivers/scsi/ibmvscsi/ibmvfc.h |  3 +-
 2 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 69a6401ca504..f680f96d5d06 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -894,7 +894,7 @@ static void ibmvfc_scsi_eh_done(struct ibmvfc_event *evt)
  * @purge_list:		list head of failed commands
  *
  * This function runs completions on commands to fail as a result of a
- * host reset or platform migration. Caller must hold host_lock.
+ * host reset or platform migration.
  **/
 static void ibmvfc_complete_purge(struct list_head *purge_list)
 {
@@ -1407,6 +1407,23 @@ static struct ibmvfc_event *ibmvfc_get_event(struct ibmvfc_queue *queue)
 	return evt;
 }
 
+/**
+ * ibmvfc_locked_done - Calls evt completion with host_lock held
+ * @evt:	ibmvfc evt to complete
+ *
+ * All non-scsi command completion callbacks have the expectation that the
+ * host_lock is held. This callback is used by ibmvfc_init_event to wrap a
+ * MAD evt with the host_lock.
+ **/
+static void ibmvfc_locked_done(struct ibmvfc_event *evt)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(evt->vhost->host->host_lock, flags);
+	evt->_done(evt);
+	spin_unlock_irqrestore(evt->vhost->host->host_lock, flags);
+}
+
 /**
  * ibmvfc_init_event - Initialize fields in an event struct that are always
  *				required.
@@ -1419,9 +1436,14 @@ static void ibmvfc_init_event(struct ibmvfc_event *evt,
 {
 	evt->cmnd = NULL;
 	evt->sync_iu = NULL;
-	evt->crq.format = format;
-	evt->done = done;
 	evt->eh_comp = NULL;
+	evt->crq.format = format;
+	if (format == IBMVFC_CMD_FORMAT)
+		evt->done = done;
+	else {
+		evt->_done = done;
+		evt->done = ibmvfc_locked_done;
+	}
 }
 
 /**
@@ -1640,7 +1662,9 @@ static void ibmvfc_relogin(struct scsi_device *sdev)
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
 	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_target *tgt;
+	unsigned long flags;
 
+	spin_lock_irqsave(vhost->host->host_lock, flags);
 	list_for_each_entry(tgt, &vhost->targets, queue) {
 		if (rport == tgt->rport) {
 			ibmvfc_del_tgt(tgt);
@@ -1649,6 +1673,7 @@ static void ibmvfc_relogin(struct scsi_device *sdev)
 	}
 
 	ibmvfc_reinit_host(vhost);
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 }
 
 /**
@@ -2901,7 +2926,8 @@ static void ibmvfc_handle_async(struct ibmvfc_async_crq *crq,
  * @vhost:	ibmvfc host struct
  *
  **/
-static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
+static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost,
+			      struct list_head *evt_doneq)
 {
 	long rc;
 	struct ibmvfc_event *evt = (struct ibmvfc_event *)be64_to_cpu(crq->ioba);
@@ -2972,12 +2998,9 @@ static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
 		return;
 	}
 
-	del_timer(&evt->timer);
 	spin_lock(&evt->queue->l_lock);
-	list_del(&evt->queue_list);
+	list_move_tail(&evt->queue_list, evt_doneq);
 	spin_unlock(&evt->queue->l_lock);
-	ibmvfc_trc_end(evt);
-	evt->done(evt);
 }
 
 /**
@@ -3364,8 +3387,10 @@ static void ibmvfc_tasklet(void *data)
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	struct ibmvfc_crq *crq;
 	struct ibmvfc_async_crq *async;
+	struct ibmvfc_event *evt, *temp;
 	unsigned long flags;
 	int done = 0;
+	LIST_HEAD(evt_doneq);
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	spin_lock(vhost->crq.q_lock);
@@ -3379,7 +3404,7 @@ static void ibmvfc_tasklet(void *data)
 
 		/* Pull all the valid messages off the CRQ */
 		while ((crq = ibmvfc_next_crq(vhost)) != NULL) {
-			ibmvfc_handle_crq(crq, vhost);
+			ibmvfc_handle_crq(crq, vhost, &evt_doneq);
 			crq->valid = 0;
 			wmb();
 		}
@@ -3392,7 +3417,7 @@ static void ibmvfc_tasklet(void *data)
 			wmb();
 		} else if ((crq = ibmvfc_next_crq(vhost)) != NULL) {
 			vio_disable_interrupts(vdev);
-			ibmvfc_handle_crq(crq, vhost);
+			ibmvfc_handle_crq(crq, vhost, &evt_doneq);
 			crq->valid = 0;
 			wmb();
 		} else
@@ -3401,6 +3426,13 @@ static void ibmvfc_tasklet(void *data)
 
 	spin_unlock(vhost->crq.q_lock);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+
+	list_for_each_entry_safe(evt, temp, &evt_doneq, queue_list) {
+		del_timer(&evt->timer);
+		list_del(&evt->queue_list);
+		ibmvfc_trc_end(evt);
+		evt->done(evt);
+	}
 }
 
 /**
@@ -4790,8 +4822,8 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 	case IBMVFC_HOST_ACTION_RESET:
 		vhost->action = IBMVFC_HOST_ACTION_TGT_DEL;
 		list_splice_init(&vhost->purge, &purge);
-		ibmvfc_complete_purge(&purge);
 		spin_unlock_irqrestore(vhost->host->host_lock, flags);
+		ibmvfc_complete_purge(&purge);
 		rc = ibmvfc_reset_crq(vhost);
 		spin_lock_irqsave(vhost->host->host_lock, flags);
 		if (rc == H_CLOSED)
@@ -4805,8 +4837,8 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 	case IBMVFC_HOST_ACTION_REENABLE:
 		vhost->action = IBMVFC_HOST_ACTION_TGT_DEL;
 		list_splice_init(&vhost->purge, &purge);
-		ibmvfc_complete_purge(&purge);
 		spin_unlock_irqrestore(vhost->host->host_lock, flags);
+		ibmvfc_complete_purge(&purge);
 		rc = ibmvfc_reenable_crq_queue(vhost);
 		spin_lock_irqsave(vhost->host->host_lock, flags);
 		if (rc || (rc = ibmvfc_send_crq_init(vhost))) {
@@ -5369,8 +5401,8 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	ibmvfc_purge_requests(vhost, DID_ERROR);
 	list_splice_init(&vhost->purge, &purge);
-	ibmvfc_complete_purge(&purge);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	ibmvfc_complete_purge(&purge);
 	ibmvfc_free_event_pool(vhost, &vhost->crq);
 
 	ibmvfc_free_mem(vhost);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index faf5b50d65b9..632e977449c5 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -733,7 +733,8 @@ struct ibmvfc_event {
 	struct scsi_cmnd *cmnd;
 	atomic_t free;
 	union ibmvfc_iu *xfer_iu;
-	void (*done) (struct ibmvfc_event *);
+	void (*done)(struct ibmvfc_event *evt);
+	void (*_done)(struct ibmvfc_event *evt);
 	struct ibmvfc_crq crq;
 	union ibmvfc_iu iu;
 	union ibmvfc_iu *sync_iu;
-- 
2.27.0

