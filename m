Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEF2CB23E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:24:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm1TV5C28zDqXP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 12:24:14 +1100 (AEDT)
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
 header.s=pp1 header.b=N6C0w8bc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm0pM1x7DzDr3N
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 11:53:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B20XEZq032071; Tue, 1 Dec 2020 19:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d1EWFSrSa2+2hCKsZTrt1uJAbPwleZGxYSCTiOMuLJA=;
 b=N6C0w8bcxT+XDN4LP7K5TIVvXh0irPqNh1bIgxNKvbE1eT2lv5ulCWMKBonjEyyptFA+
 2XpZQuBquZOio5i6qB9EqNbxxqQ8gvMHqncmtcR01rCRl+NinbfnvP2hyhpo2+hoy+pK
 YlwEIFy7hJEgO0X2utVPZ0ARINxHSFjG81bv146kMpwm1WpupI8FjK0dBCoAwlf26h27
 DsJdPZn+vM6GwS/rVFGrEuQMubmJqamF1o65+RaqlIg9vXB1nS6RDRe1glYYSrgRPUGT
 0EmlmrvAqtE5CN5g9hQvTa/Flr9k9Df7PYcoA7/kgIqOHe4yVQ28XjjRiI/5ha0Vu3Rr mQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355j4fw281-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 19:53:40 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B20cBOW006733;
 Wed, 2 Dec 2020 00:53:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 353e694e5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:53:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B20rcgE21234152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 00:53:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDE3678060;
 Wed,  2 Dec 2020 00:53:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 714897805C;
 Wed,  2 Dec 2020 00:53:38 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 00:53:38 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 15/17] ibmvfc: send Cancel MAD down each hw scsi channel
Date: Tue,  1 Dec 2020 18:53:27 -0600
Message-Id: <20201202005329.4538-16-tyreld@linux.ibm.com>
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
 suspectscore=3 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010142
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

Allocate event pointers for each possible scsi channel and assign an
event for each channel that requires a cancel. Wait for completion each
submitted cancel.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 106 +++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 0b6284020f06..97e8eed04b01 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -2339,32 +2339,52 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
 	struct ibmvfc_event *evt, *found_evt;
-	union ibmvfc_iu rsp;
-	int rsp_rc = -EBUSY;
+	struct ibmvfc_event **evt_list;
+	union ibmvfc_iu *rsp;
+	int rsp_rc = 0;
 	unsigned long flags;
 	u16 status;
+	int num_hwq = 1;
+	int i;
+	int ret = 0;
 
 	ENTER;
 	spin_lock_irqsave(vhost->host->host_lock, flags);
-	found_evt = NULL;
-	list_for_each_entry(evt, &vhost->sent, queue) {
-		if (evt->cmnd && evt->cmnd->device == sdev) {
-			found_evt = evt;
-			break;
+	if (vhost->using_channels && vhost->scsi_scrqs.active_queues)
+		num_hwq = vhost->scsi_scrqs.active_queues;
+
+	evt_list = kcalloc(num_hwq, sizeof(*evt_list), GFP_KERNEL);
+	rsp = kcalloc(num_hwq, sizeof(*rsp), GFP_KERNEL);
+
+	for (i = 0; i < num_hwq; i++) {
+		sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands on queue %d.\n", i);
+
+		found_evt = NULL;
+		list_for_each_entry(evt, &vhost->sent, queue) {
+			if (evt->cmnd && evt->cmnd->device == sdev && evt->hwq == i) {
+				found_evt = evt;
+				break;
+			}
 		}
-	}
 
-	if (!found_evt) {
-		if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
-			sdev_printk(KERN_INFO, sdev, "No events found to cancel\n");
-		spin_unlock_irqrestore(vhost->host->host_lock, flags);
-		return 0;
-	}
+		if (!found_evt) {
+			if (vhost->log_level > IBMVFC_DEFAULT_LOG_LEVEL)
+				sdev_printk(KERN_INFO, sdev, "No events found to cancel on queue %d\n", i);
+			continue;
+		}
 
-	if (vhost->logged_in) {
-		evt = ibmvfc_init_tmf(vhost, sdev, type);
-		evt->sync_iu = &rsp;
-		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
+
+		if (vhost->logged_in) {
+			evt_list[i] = ibmvfc_init_tmf(vhost, sdev, type);
+			evt_list[i]->hwq = i;
+			evt_list[i]->sync_iu = &rsp[i];
+			rsp_rc = ibmvfc_send_event(evt_list[i], vhost, default_timeout);
+			if (rsp_rc)
+				break;
+		} else {
+			rsp_rc = -EBUSY;
+			break;
+		}
 	}
 
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
@@ -2374,32 +2394,42 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 		/* If failure is received, the host adapter is most likely going
 		 through reset, return success so the caller will wait for the command
 		 being cancelled to get returned */
-		return 0;
+		goto free_mem;
 	}
 
-	sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands.\n");
-
-	wait_for_completion(&evt->comp);
-	status = be16_to_cpu(rsp.mad_common.status);
-	spin_lock_irqsave(vhost->host->host_lock, flags);
-	ibmvfc_free_event(evt);
-	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	for (i = 0; i < num_hwq; i++) {
+		if (!evt_list[i])
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
+		wait_for_completion(&evt_list[i]->comp);
+		status = be16_to_cpu(rsp[i].mad_common.status);
+
+		if (status != IBMVFC_MAD_SUCCESS) {
+			sdev_printk(KERN_WARNING, sdev, "Cancel failed with rc=%x\n", status);
+			switch (status) {
+			case IBMVFC_MAD_DRIVER_FAILED:
+			case IBMVFC_MAD_CRQ_ERROR:
+				/* Host adapter most likely going through reset, return success to
+				 the caller will wait for the command being cancelled to get returned */
+				goto free_mem;
+			default:
+				ret = -EIO;
+				goto free_mem;
+			};
+		}
 	}
 
 	sdev_printk(KERN_INFO, sdev, "Successfully cancelled outstanding commands\n");
-	return 0;
+free_mem:
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+	for (i = 0; i < num_hwq; i++)
+		if (evt_list[i])
+			ibmvfc_free_event(evt_list[i]);
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	kfree(evt_list);
+	kfree(rsp);
+
+	return ret;
 }
 
 /**
-- 
2.27.0

