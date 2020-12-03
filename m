Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88E2CCCB5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:35:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmg1G6xDSzDrqC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 13:35:30 +1100 (AEDT)
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
 header.s=pp1 header.b=fUuY/exm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmfQ02BdGzDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 13:08:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B322lbr095985; Wed, 2 Dec 2020 21:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oKqIBsDi6ATCu+2VKWLOJBnqTvd96VekI27xyK9Lick=;
 b=fUuY/exmKzBjvFusj96QMozZRqgrDLswHUixlFlKkQ/Fi+ENYn/jpjRD7L24t719WySs
 O9P2sn9Jvg75rf/TmTt9tJ9VUhLZtPRNED1xR4+k9m9FAVTfAA9eYwZzAhHatbzfEYi6
 CKRippjkPc/im7V/b2ADgdcyRsRuNYRu5puNYSHNM3lopZZ9iGwRrEJJUjrzYlnFLNOY
 rALvTBoWyhjECTmMng8KX9NbQ08D5rWGcc8esL27vblAhF1HRAUYhjpw9QEhg6xRa+/Y
 vfQLNA0CZ8DeQsNxe724b5PQ1k3y/SBUfYeFlBQcEWKbQ35DnWvIS99V0JDDdjGuGPrh +Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jfcxxhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 21:08:22 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B31uL3W013325;
 Thu, 3 Dec 2020 02:08:21 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 355vrfvc8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 02:08:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B328JVt21102944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 02:08:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2B117805F;
 Thu,  3 Dec 2020 02:08:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A4457805E;
 Thu,  3 Dec 2020 02:08:19 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 02:08:19 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 15/18] ibmvfc: send Cancel MAD down each hw scsi channel
Date: Wed,  2 Dec 2020 20:08:03 -0600
Message-Id: <20201203020806.14747-16-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203020806.14747-1-tyreld@linux.ibm.com>
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_14:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=3
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030009
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

Add a cancel event pointer and cancel rsp iu storage to the
ibmvfc_sub_queue struct such that the cancel routine can assign a cancel
event to each applicable queue. When in legacy CRQ mode we fake treating
it as a subqueue by using a subqueue struct allocated on the stack. Wait
for completion of each submitted cancel.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 104 ++++++++++++++++++++++-----------
 drivers/scsi/ibmvscsi/ibmvfc.h |  38 ++++++------
 2 files changed, 90 insertions(+), 52 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index ec3db5a6baf3..e353b9e88104 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -2339,67 +2339,103 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
 	struct ibmvfc_event *evt, *found_evt;
-	union ibmvfc_iu rsp;
-	int rsp_rc = -EBUSY;
+	struct ibmvfc_sub_queue *scrqs;
+	struct ibmvfc_sub_queue legacy_crq;
+	int rsp_rc = 0;
 	unsigned long flags;
 	u16 status;
+	int cancel_cnt = 0;
+	int num_hwq;
+	int ret = 0;
+	int i;
 
 	ENTER;
 	spin_lock_irqsave(vhost->host->host_lock, flags);
-	found_evt = NULL;
-	list_for_each_entry(evt, &vhost->sent, queue) {
-		if (evt->cmnd && evt->cmnd->device == sdev) {
-			found_evt = evt;
+	if (vhost->using_channels && vhost->scsi_scrqs.active_queues) {
+		num_hwq = vhost->scsi_scrqs.active_queues;
+		scrqs = vhost->scsi_scrqs.scrqs;
+	} else {
+		/* Use ibmvfc_sub_queue on the stack to fake legacy CRQ as a subqueue */
+		num_hwq = 1;
+		scrqs = &legacy_crq;
+	}
+
+	for (i = 0; i < num_hwq; i++) {
+		scrqs[i].cancel_event = NULL;
+		found_evt = NULL;
+		list_for_each_entry(evt, &vhost->sent, queue) {
+			if (evt->cmnd && evt->cmnd->device == sdev && evt->hwq == i) {
+				found_evt = evt;
+				cancel_cnt++;
+				break;
+			}
+		}
+
+		if (!found_evt)
+			continue;
+
+		if (vhost->logged_in) {
+			scrqs[i].cancel_event = ibmvfc_init_tmf(vhost, sdev, type);
+			scrqs[i].cancel_event->hwq = i;
+			scrqs[i].cancel_event->sync_iu = &scrqs[i].cancel_rsp;
+			rsp_rc = ibmvfc_send_event(scrqs[i].cancel_event, vhost, default_timeout);
+			if (rsp_rc)
+				break;
+		} else {
+			rsp_rc = -EBUSY;
 			break;
 		}
 	}
 
-	if (!found_evt) {
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+
+	if (!cancel_cnt) {
 		if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
 			sdev_printk(KERN_INFO, sdev, "No events found to cancel\n");
-		spin_unlock_irqrestore(vhost->host->host_lock, flags);
 		return 0;
 	}
 
-	if (vhost->logged_in) {
-		evt = ibmvfc_init_tmf(vhost, sdev, type);
-		evt->sync_iu = &rsp;
-		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
-	}
-
-	spin_unlock_irqrestore(vhost->host->host_lock, flags);
-
 	if (rsp_rc != 0) {
 		sdev_printk(KERN_ERR, sdev, "Failed to send cancel event. rc=%d\n", rsp_rc);
 		/* If failure is received, the host adapter is most likely going
 		 through reset, return success so the caller will wait for the command
 		 being cancelled to get returned */
-		return 0;
+		goto free_events;
 	}
 
 	sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands.\n");
 
-	wait_for_completion(&evt->comp);
-	status = be16_to_cpu(rsp.mad_common.status);
-	spin_lock_irqsave(vhost->host->host_lock, flags);
-	ibmvfc_free_event(evt);
-	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	for (i = 0; i < num_hwq; i++) {
+		if (!scrqs[i].cancel_event)
+			continue;
 
-	if (status != IBMVFC_MAD_SUCCESS) {
-		sdev_printk(KERN_WARNING, sdev, "Cancel failed with rc=%x\n", status);
-		switch (status) {
-		case IBMVFC_MAD_DRIVER_FAILED:
-		case IBMVFC_MAD_CRQ_ERROR:
-			/* Host adapter most likely going through reset, return success to
-			 the caller will wait for the command being cancelled to get returned */
-			return 0;
-		default:
-			return -EIO;
-		};
+		wait_for_completion(&scrqs[i].cancel_event->comp);
+		status = be16_to_cpu(scrqs[i].cancel_rsp.mad_common.status);
+
+		if (status != IBMVFC_MAD_SUCCESS) {
+			sdev_printk(KERN_WARNING, sdev, "Cancel failed with rc=%x\n", status);
+			switch (status) {
+			case IBMVFC_MAD_DRIVER_FAILED:
+			case IBMVFC_MAD_CRQ_ERROR:
+				/* Host adapter most likely going through reset, return success to
+				 the caller will wait for the command being cancelled to get returned */
+				goto free_events;
+			default:
+				ret = -EIO;
+				goto free_events;
+			};
+		}
 	}
 
 	sdev_printk(KERN_INFO, sdev, "Successfully cancelled outstanding commands\n");
-	return 0;
+free_events:
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+	for (i = 0; i < num_hwq; i++)
+		if (scrqs[i].cancel_event)
+			ibmvfc_free_event(scrqs[i].cancel_event);
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+
+	return ret;
 }
 
 /**
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index e0ffb0416223..980eb9afe93a 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -584,6 +584,24 @@ struct ibmvfc_connection_info {
 	__be64 reserved[16];
 } __packed __aligned(8);
 
+union ibmvfc_iu {
+	struct ibmvfc_mad_common mad_common;
+	struct ibmvfc_npiv_login_mad npiv_login;
+	struct ibmvfc_npiv_logout_mad npiv_logout;
+	struct ibmvfc_discover_targets discover_targets;
+	struct ibmvfc_port_login plogi;
+	struct ibmvfc_process_login prli;
+	struct ibmvfc_move_login move_login;
+	struct ibmvfc_query_tgt query_tgt;
+	struct ibmvfc_implicit_logout implicit_logout;
+	struct ibmvfc_tmf tmf;
+	struct ibmvfc_cmd cmd;
+	struct ibmvfc_passthru_mad passthru;
+	struct ibmvfc_channel_enquiry channel_enquiry;
+	struct ibmvfc_channel_setup_mad channel_setup;
+	struct ibmvfc_connection_info connection_info;
+} __packed __aligned(8);
+
 struct ibmvfc_trace_start_entry {
 	u32 xfer_len;
 } __packed;
@@ -666,6 +684,8 @@ struct ibmvfc_sub_queue {
 	dma_addr_t msg_token;
 	int size, cur;
 	struct ibmvfc_host *vhost;
+	struct ibmvfc_event *cancel_event;
+	union ibmvfc_iu cancel_rsp;
 	unsigned long cookie;
 	unsigned long vios_cookie;
 	unsigned long hw_irq;
@@ -712,24 +732,6 @@ struct ibmvfc_async_crq_queue {
 	dma_addr_t msg_token;
 };
 
-union ibmvfc_iu {
-	struct ibmvfc_mad_common mad_common;
-	struct ibmvfc_npiv_login_mad npiv_login;
-	struct ibmvfc_npiv_logout_mad npiv_logout;
-	struct ibmvfc_discover_targets discover_targets;
-	struct ibmvfc_port_login plogi;
-	struct ibmvfc_process_login prli;
-	struct ibmvfc_move_login move_login;
-	struct ibmvfc_query_tgt query_tgt;
-	struct ibmvfc_implicit_logout implicit_logout;
-	struct ibmvfc_tmf tmf;
-	struct ibmvfc_cmd cmd;
-	struct ibmvfc_passthru_mad passthru;
-	struct ibmvfc_channel_enquiry channel_enquiry;
-	struct ibmvfc_channel_setup_mad channel_setup;
-	struct ibmvfc_connection_info connection_info;
-} __packed __aligned(8);
-
 enum ibmvfc_target_action {
 	IBMVFC_TGT_ACTION_NONE = 0,
 	IBMVFC_TGT_ACTION_INIT,
-- 
2.27.0

