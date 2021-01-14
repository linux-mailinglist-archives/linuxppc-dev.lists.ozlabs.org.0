Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB742F6C29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 21:38:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGx2y68MwzDsTv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 07:38:02 +1100 (AEDT)
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
 header.s=pp1 header.b=V39VVUp6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGwvx6BlHzDrND
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 07:31:57 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EKVe2b081769; Thu, 14 Jan 2021 15:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ml8kfxsPhwNXqasmcOZfmEsQBI6122H+O2Q5MbHy7Hk=;
 b=V39VVUp6TPglLtq0ZAznOvkH4qqbUHcR+fYEDZQtq7u7Rz77rmhboBl1FdLzsER1N/2j
 D4DmGxglpggJk3XsOl/sZgUICgf4FXFI0EudxxujHMfmXbzNuuumsrH0qjQd1ugw8fxO
 JmFuWcBDfk3Z1r5rehUlMK+2i7HF67LsIVopooh9a+s7jY12rnF2/uVpbVOGxlIS2Njl
 yCDQhdDDfhNDXN0Y2X257YE8tg0e3G42syVFx340WAdKUGu5ljSYF1ULeUWdXlRfqCHn
 Fw7ds+TAAlx2X5gP1otUNsP1E9tEYQ/VTBuXNMqWVScvQ1ydE0LWklkN5eXVntMbmyvG LA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 362vcvh1fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:31:53 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EKSkTN012299;
 Thu, 14 Jan 2021 20:31:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 35y449ss3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 20:31:52 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EKVoMq33227176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 20:31:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7A6A6E04E;
 Thu, 14 Jan 2021 20:31:50 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 651796E04C;
 Thu, 14 Jan 2021 20:31:50 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 20:31:50 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 01/21] ibmvfc: add vhost fields and defaults for MQ
 enablement
Date: Thu, 14 Jan 2021 14:31:28 -0600
Message-Id: <20210114203148.246656-2-tyreld@linux.ibm.com>
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
 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140115
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

Introduce several new vhost fields for managing MQ state of the adapter
as well as initial defaults for MQ enablement.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 8 ++++++++
 drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index ba95438a8912..9200fe49c57e 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3302,6 +3302,7 @@ static struct scsi_host_template driver_template = {
 	.max_sectors = IBMVFC_MAX_SECTORS,
 	.shost_attrs = ibmvfc_attrs,
 	.track_queue_depth = 1,
+	.host_tagset = 1,
 };
 
 /**
@@ -5290,6 +5291,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	shost->max_sectors = IBMVFC_MAX_SECTORS;
 	shost->max_cmd_len = IBMVFC_MAX_CDB_LEN;
 	shost->unique_id = shost->host_no;
+	shost->nr_hw_queues = IBMVFC_MQ ? IBMVFC_SCSI_HW_QUEUES : 1;
 
 	vhost = shost_priv(shost);
 	INIT_LIST_HEAD(&vhost->targets);
@@ -5300,6 +5302,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	vhost->partition_number = -1;
 	vhost->log_level = log_level;
 	vhost->task_set = 1;
+
+	vhost->mq_enabled = IBMVFC_MQ;
+	vhost->client_scsi_channels = IBMVFC_SCSI_CHANNELS;
+	vhost->using_channels = 0;
+	vhost->do_enquiry = 1;
+
 	strcpy(vhost->partition_name, "UNKNOWN");
 	init_waitqueue_head(&vhost->work_wait_q);
 	init_waitqueue_head(&vhost->init_wait_q);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 632e977449c5..dd6d89292867 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -41,6 +41,11 @@
 #define IBMVFC_DEFAULT_LOG_LEVEL	2
 #define IBMVFC_MAX_CDB_LEN		16
 #define IBMVFC_CLS3_ERROR		0
+#define IBMVFC_MQ			0
+#define IBMVFC_SCSI_CHANNELS		0
+#define IBMVFC_SCSI_HW_QUEUES		1
+#define IBMVFC_MIG_NO_SUB_TO_CRQ	0
+#define IBMVFC_MIG_NO_N_TO_M		0
 
 /*
  * Ensure we have resources for ERP and initialization:
@@ -840,6 +845,10 @@ struct ibmvfc_host {
 	int delay_init;
 	int scan_complete;
 	int logged_in;
+	int mq_enabled;
+	int using_channels;
+	int do_enquiry;
+	int client_scsi_channels;
 	int aborting_passthru;
 	int events_to_log;
 #define IBMVFC_AE_LINKUP	0x0001
-- 
2.27.0

