Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EC22F2327
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:44:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF9KV2pm8zDr2h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:44:30 +1100 (AEDT)
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
 header.s=pp1 header.b=Bm+EDDK5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8cn3k9hzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:41 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BN28GO093004; Mon, 11 Jan 2021 18:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cUd44LP3mhyibI01umpjv/0DBGZmG1N1SO7aI/f5DIo=;
 b=Bm+EDDK5KVDvyYUOtJDNwlSoVyDddzYP6GWx8Q1tqKGYl+SMiHsbknI9HLfLUWLzWZ11
 6h9TymthkxZFkMtYWUU5Dj+WUGYmsYpmOJ4FetDy9ju/MF5zftJsJfGFa9aVRSLTmmS9
 HN6+Mv2ADRRpFgSYTG98893i2qD0g/a5KOeaitcat+rGAEmKJ6hmt5Daw5+ZyDnNIT80
 b/EiOqf99jqGgNZArVl9V2N6/U+0fChejma5KtCvjwnuiskJZvznw+J4V6fIJsI7PB5z
 G98NVxYO5jxrDq9hDqgnmaz+tGMz4BHNb92EKCgq2aAeaPRh75j6NGWA9t2szPQJadYt Lw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360y91sb59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:39 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN78Gs004814;
 Mon, 11 Jan 2021 23:12:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 35y448syqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCa0N21430686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:36 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B30C7805E;
 Mon, 11 Jan 2021 23:12:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29DAB78060;
 Mon, 11 Jan 2021 23:12:36 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:36 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 18/21] ibmvfc: send Cancel MAD down each hw scsi channel
Date: Mon, 11 Jan 2021 17:12:22 -0600
Message-Id: <20210111231225.105347-19-tyreld@linux.ibm.com>
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
 adultscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110126
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

In general the client needs to send Cancel MADs and task management
commands down the same channel as the command(s) intended to cancel or
abort. The client assigns cancel keys per LUN and thus must send a
Cancel down each channel commands were submitted for that LUN. Further,
the client then must wait for those cancel completions prior to
submitting a LUN RESET or ABORT TASK SET.

Add a cancel rsp iu syncronization field to the ibmvfc_queue struct such
that the cancel routine can sync the cancel response to each queue that
requires a cancel command. Build a list of each cancel event sent and
wait for the completion of each submitted cancel.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 106 +++++++++++++++++++++++++++++----
 drivers/scsi/ibmvscsi/ibmvfc.h |   3 +
 2 files changed, 97 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index b0b0212344f3..24e1278acfeb 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -2418,18 +2418,79 @@ static struct ibmvfc_event *ibmvfc_init_tmf(struct ibmvfc_queue *queue,
 	return evt;
 }
 
-/**
- * ibmvfc_cancel_all - Cancel all outstanding commands to the device
- * @sdev:	scsi device to cancel commands
- * @type:	type of error recovery being performed
- *
- * This sends a cancel to the VIOS for the specified device. This does
- * NOT send any abort to the actual device. That must be done separately.
- *
- * Returns:
- *	0 on success / other on failure
- **/
-static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
+static int ibmvfc_cancel_all_mq(struct scsi_device *sdev, int type)
+{
+	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct ibmvfc_event *evt, *found_evt, *temp;
+	struct ibmvfc_queue *queues = vhost->scsi_scrqs.scrqs;
+	unsigned long flags;
+	int num_hwq, i;
+	LIST_HEAD(cancelq);
+	u16 status;
+
+	ENTER;
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+	num_hwq = vhost->scsi_scrqs.active_queues;
+	for (i = 0; i < num_hwq; i++) {
+		spin_lock(queues[i].q_lock);
+		spin_lock(&queues[i].l_lock);
+		found_evt = NULL;
+		list_for_each_entry(evt, &queues[i].sent, queue_list) {
+			if (evt->cmnd && evt->cmnd->device == sdev) {
+				found_evt = evt;
+				break;
+			}
+		}
+		spin_unlock(&queues[i].l_lock);
+
+		if (!found_evt)
+			continue;
+
+		if (vhost->logged_in) {
+			evt = ibmvfc_init_tmf(&queues[i], sdev, type);
+			evt->sync_iu = &queues[i].cancel_rsp;
+			ibmvfc_send_event(evt, vhost, default_timeout);
+			list_add_tail(&evt->cancel, &cancelq);
+		}
+	}
+
+	for (i = 0; i < num_hwq; i++)
+		spin_unlock(queues[i].q_lock);
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+
+	if (list_empty(&cancelq)) {
+		if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
+			sdev_printk(KERN_INFO, sdev, "No events found to cancel\n");
+		return 0;
+	}
+
+	sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands.\n");
+
+	list_for_each_entry_safe(evt, temp, &cancelq, cancel) {
+		wait_for_completion(&evt->comp);
+		status = be16_to_cpu(evt->queue->cancel_rsp.mad_common.status);
+		ibmvfc_free_event(evt);
+
+		if (status != IBMVFC_MAD_SUCCESS) {
+			sdev_printk(KERN_WARNING, sdev, "Cancel failed with rc=%x\n", status);
+			switch (status) {
+			case IBMVFC_MAD_DRIVER_FAILED:
+			case IBMVFC_MAD_CRQ_ERROR:
+			/* Host adapter most likely going through reset, return success to
+			 * the caller will wait for the command being cancelled to get returned
+			 */
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	sdev_printk(KERN_INFO, sdev, "Successfully cancelled outstanding commands\n");
+	return 0;
+}
+
+static int ibmvfc_cancel_all_sq(struct scsi_device *sdev, int type)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
 	struct ibmvfc_event *evt, *found_evt;
@@ -2498,6 +2559,27 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 	return 0;
 }
 
+/**
+ * ibmvfc_cancel_all - Cancel all outstanding commands to the device
+ * @sdev:	scsi device to cancel commands
+ * @type:	type of error recovery being performed
+ *
+ * This sends a cancel to the VIOS for the specified device. This does
+ * NOT send any abort to the actual device. That must be done separately.
+ *
+ * Returns:
+ *	0 on success / other on failure
+ **/
+static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
+{
+	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+
+	if (vhost->mq_enabled && vhost->using_channels)
+		return ibmvfc_cancel_all_mq(sdev, type);
+	else
+		return ibmvfc_cancel_all_sq(sdev, type);
+}
+
 /**
  * ibmvfc_match_key - Match function for specified cancel key
  * @evt:	ibmvfc event struct
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 2dbce7071409..c3bb83c9d8a6 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -737,6 +737,7 @@ struct ibmvfc_target {
 /* a unit of work for the hosting partition */
 struct ibmvfc_event {
 	struct list_head queue_list;
+	struct list_head cancel;
 	struct ibmvfc_host *vhost;
 	struct ibmvfc_queue *queue;
 	struct ibmvfc_target *tgt;
@@ -790,6 +791,8 @@ struct ibmvfc_queue {
 	struct list_head free;
 	spinlock_t l_lock;
 
+	union ibmvfc_iu cancel_rsp;
+
 	/* Sub-CRQ fields */
 	struct ibmvfc_host *vhost;
 	unsigned long cookie;
-- 
2.27.0

