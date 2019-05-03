Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DB125D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 02:54:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wDDp4cfszDqYn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:54:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wD8Y6HzbzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 10:51:09 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x430maLD112382
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 20:51:08 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s88sumjyt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 20:51:07 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.ibm.com>;
 Fri, 3 May 2019 01:51:06 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 May 2019 01:51:02 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x430p1da18808844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 May 2019 00:51:01 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF4F72805C;
 Fri,  3 May 2019 00:51:01 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3749F2805A;
 Fri,  3 May 2019 00:51:01 +0000 (GMT)
Received: from ltcalpine2-lp11.aus.stglabs.ibm.com (unknown [9.40.195.194])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  3 May 2019 00:51:01 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 2/3] ibmvscsi: redo driver work thread to use enum action
 states
Date: Thu,  2 May 2019 19:50:57 -0500
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190503005058.8768-1-tyreld@linux.ibm.com>
References: <20190503005058.8768-1-tyreld@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19050300-0072-0000-0000-0000042457A2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011038; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197740; UDB=6.00628232; IPR=6.00978597; 
 MB=3.00026706; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-03 00:51:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050300-0073-0000-0000-00004C0DCD8B
Message-Id: <20190503005058.8768-2-tyreld@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=934 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905030003
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
 linux-scsi@vger.kernel.org, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

The current implemenation relies on two flags in the drivers private host
structure to signal the need for a host reset or to reenable the CRQ after a
LPAR migration. This patch does away with those flags and introduces a single
action flag and defined enums for the supported kthread work actions. Lastly,
the if/else logic is replaced with a switch statement.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
Changes in v2:
	release/grab host_lock around reset/reenable calls

 drivers/scsi/ibmvscsi/ibmvscsi.c | 61 ++++++++++++++++++++++----------
 drivers/scsi/ibmvscsi/ibmvscsi.h |  9 +++--
 2 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 65fc8ca962c5..8df82c58e7b9 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -828,7 +828,7 @@ static void ibmvscsi_reset_host(struct ibmvscsi_host_data *hostdata)
 	atomic_set(&hostdata->request_limit, 0);
 
 	purge_requests(hostdata, DID_ERROR);
-	hostdata->reset_crq = 1;
+	hostdata->action = IBMVSCSI_HOST_ACTION_RESET;
 	wake_up(&hostdata->work_wait_q);
 }
 
@@ -1797,7 +1797,7 @@ static void ibmvscsi_handle_crq(struct viosrp_crq *crq,
 			/* We need to re-setup the interpartition connection */
 			dev_info(hostdata->dev, "Re-enabling adapter!\n");
 			hostdata->client_migrated = 1;
-			hostdata->reenable_crq = 1;
+			hostdata->action = IBMVSCSI_HOST_ACTION_REENABLE;
 			purge_requests(hostdata, DID_REQUEUE);
 			wake_up(&hostdata->work_wait_q);
 		} else {
@@ -2116,48 +2116,71 @@ static unsigned long ibmvscsi_get_desired_dma(struct vio_dev *vdev)
 
 static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 {
+	unsigned long flags;
 	int rc;
 	char *action = "reset";
 
-	if (hostdata->reset_crq) {
-		smp_rmb();
-		hostdata->reset_crq = 0;
-
+	spin_lock_irqsave(hostdata->host->host_lock, flags);
+	switch (hostdata->action) {
+	case IBMVSCSI_HOST_ACTION_NONE:
+		break;
+	case IBMVSCSI_HOST_ACTION_RESET:
+		spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 		rc = ibmvscsi_reset_crq_queue(&hostdata->queue, hostdata);
+		spin_lock_irqsave(hostdata->host->host_lock, flags);
 		if (!rc)
 			rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
 		vio_enable_interrupts(to_vio_dev(hostdata->dev));
-	} else if (hostdata->reenable_crq) {
-		smp_rmb();
+		break;
+	case IBMVSCSI_HOST_ACTION_REENABLE:
 		action = "enable";
+		spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 		rc = ibmvscsi_reenable_crq_queue(&hostdata->queue, hostdata);
-		hostdata->reenable_crq = 0;
+		spin_lock_irqsave(hostdata->host->host_lock, flags);
 		if (!rc)
 			rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
-	} else
-		return;
+		break;
+	default:
+		break;
+	}
+
+	hostdata->action = IBMVSCSI_HOST_ACTION_NONE;
 
 	if (rc) {
 		atomic_set(&hostdata->request_limit, -1);
 		dev_err(hostdata->dev, "error after %s\n", action);
 	}
+	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 
 	scsi_unblock_requests(hostdata->host);
 }
 
-static int ibmvscsi_work_to_do(struct ibmvscsi_host_data *hostdata)
+static int __ibmvscsi_work_to_do(struct ibmvscsi_host_data *hostdata)
 {
 	if (kthread_should_stop())
 		return 1;
-	else if (hostdata->reset_crq) {
-		smp_rmb();
-		return 1;
-	} else if (hostdata->reenable_crq) {
-		smp_rmb();
-		return 1;
+	switch (hostdata->action) {
+	case IBMVSCSI_HOST_ACTION_NONE:
+		return 0;
+	case IBMVSCSI_HOST_ACTION_RESET:
+	case IBMVSCSI_HOST_ACTION_REENABLE:
+	default:
+		break;
 	}
 
-	return 0;
+	return 1;
+}
+
+static int ibmvscsi_work_to_do(struct ibmvscsi_host_data *hostdata)
+{
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(hostdata->host->host_lock, flags);
+	rc = __ibmvscsi_work_to_do(hostdata);
+	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
+
+	return rc;
 }
 
 static int ibmvscsi_work(void *data)
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.h b/drivers/scsi/ibmvscsi/ibmvscsi.h
index 3a7875575616..04bcbc832dc9 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.h
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.h
@@ -88,13 +88,18 @@ struct event_pool {
 	dma_addr_t iu_token;
 };
 
+enum ibmvscsi_host_action {
+	IBMVSCSI_HOST_ACTION_NONE = 0,
+	IBMVSCSI_HOST_ACTION_RESET,
+	IBMVSCSI_HOST_ACTION_REENABLE,
+};
+
 /* all driver data associated with a host adapter */
 struct ibmvscsi_host_data {
 	struct list_head host_list;
 	atomic_t request_limit;
 	int client_migrated;
-	int reset_crq;
-	int reenable_crq;
+	enum ibmvscsi_host_action action;
 	struct device *dev;
 	struct event_pool pool;
 	struct crq_queue queue;
-- 
2.18.1

