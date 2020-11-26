Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A482C4D1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:07:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChLkb35hkzDrLw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:07:51 +1100 (AEDT)
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
 header.s=pp1 header.b=FBoOZTWq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChLJP5DqtzDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 12:48:37 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ1Uqh1064432; Wed, 25 Nov 2020 20:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TKnBpLJ5+YXJ/YhZDem56s+2z/8PFMMWM7rEI7ePUWQ=;
 b=FBoOZTWqBQBPvegEy2Xs3Np9/2Njy7qrEB5dfY9FVc+5kIGk84tRdhpzyIDv8bLlqRLj
 GmaNW8IYl7dtELL+mnrbxZgzPyrovBcw/IlMAgml6Ga5H+uTrbc0wfRYWxVGgxLN+ryl
 gdsSFzkxYe1Q0joi7px6rmJNdY71E3NZfX4ub5DuVI+VkmRSeawn9CzkmYMfmyxK0cYM
 QxkFTnOajIiDTQMJa2/Qx1tA6tG182KXP+KWf5hOuDQNs0C5yLPJ54C/I0hwFZza/o2g
 v9WJjOJLBGnHOFKfVQy1gXkADn++dFbnPbSzljPD7FdPJiP9/KBKR35HiQwUrBbsQ8+G NQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35228u0um2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 20:48:31 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ1g68L027420;
 Thu, 26 Nov 2020 01:48:31 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 34xth9bra0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 01:48:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ1mU7d11469218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 01:48:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 153456E04E;
 Thu, 26 Nov 2020 01:48:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1C466E054;
 Thu, 26 Nov 2020 01:48:29 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 01:48:29 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 01/13] ibmvfc: add vhost fields and defaults for MQ enablement
Date: Wed, 25 Nov 2020 19:48:12 -0600
Message-Id: <20201126014824.123831-2-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126014824.123831-1-tyreld@linux.ibm.com>
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_14:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=1 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260001
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

Introduce several new vhost fields for managing MQ state of the adapter
as well as initial defaults for MQ enablement.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 7 +++++++
 drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 42e4d35e0d35..cd609d19e6a1 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -5167,6 +5167,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	shost->max_sectors = IBMVFC_MAX_SECTORS;
 	shost->max_cmd_len = IBMVFC_MAX_CDB_LEN;
 	shost->unique_id = shost->host_no;
+	shost->nr_hw_queues = IBMVFC_SCSI_HW_QUEUES;
 
 	vhost = shost_priv(shost);
 	INIT_LIST_HEAD(&vhost->sent);
@@ -5178,6 +5179,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
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
index 9d58cfd774d3..8225bdbb127e 100644
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
@@ -826,6 +831,10 @@ struct ibmvfc_host {
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

