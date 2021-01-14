Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B245D2F6CED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 22:12:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGxps12dkzDvP7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 08:12:37 +1100 (AEDT)
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
 header.s=pp1 header.b=agpmYs3V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGwyW2wYwzDrRB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 07:34:11 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EKY0JU161229; Thu, 14 Jan 2021 15:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pF1kTWzRDvOqDI/b1vn9yhlfp+aMDWf1vIB0dT8+eMA=;
 b=agpmYs3VPjX1Ad+N5CNvVMC8g7YPaKwNOpMq1UMNZL/3ibSGwqctN2czRIEZJCyS1Uej
 Jre6KmHADjcdHZ585ksSfBU0mr2raKcYrnoM1jnQan63zdq2341xsaKt8We5+jca8oCc
 hxAr1I9JV9ePN5IVOtxeLjYHXw8Gmey3+VVu41CA0rgbdOW8cIzoEGalpmCBpAzp83t9
 t6o+6ywyJw4Q0pBcC36LzE3foZKAUH7l1kDjSzePiPAFSgQFuJ8CN7CJR8TAOEa66Qvt
 soKJmM2AbNJUPRYWHqY11GwVfncdsUnFm2eOgnnnRlnVg4JhRJMsYgi0sG+t64M9BqDX iw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 362vtb8c59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:34:04 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EKRQ1L013843;
 Thu, 14 Jan 2021 20:31:58 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 35y449fsv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 20:31:58 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EKVviO25756030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 20:31:57 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 512B86E056;
 Thu, 14 Jan 2021 20:31:57 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F28F86E052;
 Thu, 14 Jan 2021 20:31:56 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 20:31:56 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 17/21] ibmvfc: add cancel mad initialization helper
Date: Thu, 14 Jan 2021 14:31:44 -0600
Message-Id: <20210114203148.246656-18-tyreld@linux.ibm.com>
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
 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140115
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

Add a helper routine for initializing a Cancel MAD. This will be useful
for a channelized client that needs to send Cancel commands down every
channel commands were sent for a particular LUN.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 68 ++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 578e27180f10..b0b0212344f3 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -2379,6 +2379,45 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 	return SUCCESS;
 }
 
+static struct ibmvfc_event *ibmvfc_init_tmf(struct ibmvfc_queue *queue,
+					    struct scsi_device *sdev,
+					    int type)
+{
+	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct scsi_target *starget = scsi_target(sdev);
+	struct fc_rport *rport = starget_to_rport(starget);
+	struct ibmvfc_event *evt;
+	struct ibmvfc_tmf *tmf;
+
+	evt = ibmvfc_get_event(queue);
+	ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_MAD_FORMAT);
+
+	tmf = &evt->iu.tmf;
+	memset(tmf, 0, sizeof(*tmf));
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+		tmf->common.version = cpu_to_be32(2);
+		tmf->target_wwpn = cpu_to_be64(rport->port_name);
+	} else {
+		tmf->common.version = cpu_to_be32(1);
+	}
+	tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
+	tmf->common.length = cpu_to_be16(sizeof(*tmf));
+	tmf->scsi_id = cpu_to_be64(rport->port_id);
+	int_to_scsilun(sdev->lun, &tmf->lun);
+	if (!ibmvfc_check_caps(vhost, IBMVFC_CAN_SUPPRESS_ABTS))
+		type &= ~IBMVFC_TMF_SUPPRESS_ABTS;
+	if (vhost->state == IBMVFC_ACTIVE)
+		tmf->flags = cpu_to_be32((type | IBMVFC_TMF_LUA_VALID));
+	else
+		tmf->flags = cpu_to_be32(((type & IBMVFC_TMF_SUPPRESS_ABTS) | IBMVFC_TMF_LUA_VALID));
+	tmf->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
+	tmf->my_cancel_key = cpu_to_be32((unsigned long)starget->hostdata);
+
+	init_completion(&evt->comp);
+
+	return evt;
+}
+
 /**
  * ibmvfc_cancel_all - Cancel all outstanding commands to the device
  * @sdev:	scsi device to cancel commands
@@ -2393,9 +2432,6 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
-	struct scsi_target *starget = scsi_target(sdev);
-	struct fc_rport *rport = starget_to_rport(starget);
-	struct ibmvfc_tmf *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp;
 	int rsp_rc = -EBUSY;
@@ -2422,32 +2458,8 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 	}
 
 	if (vhost->logged_in) {
-		evt = ibmvfc_get_event(&vhost->crq);
-		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_MAD_FORMAT);
-
-		tmf = &evt->iu.tmf;
-		memset(tmf, 0, sizeof(*tmf));
-		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
-			tmf->common.version = cpu_to_be32(2);
-			tmf->target_wwpn = cpu_to_be64(rport->port_name);
-		} else {
-			tmf->common.version = cpu_to_be32(1);
-		}
-		tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
-		tmf->common.length = cpu_to_be16(sizeof(*tmf));
-		tmf->scsi_id = cpu_to_be64(rport->port_id);
-		int_to_scsilun(sdev->lun, &tmf->lun);
-		if (!ibmvfc_check_caps(vhost, IBMVFC_CAN_SUPPRESS_ABTS))
-			type &= ~IBMVFC_TMF_SUPPRESS_ABTS;
-		if (vhost->state == IBMVFC_ACTIVE)
-			tmf->flags = cpu_to_be32((type | IBMVFC_TMF_LUA_VALID));
-		else
-			tmf->flags = cpu_to_be32(((type & IBMVFC_TMF_SUPPRESS_ABTS) | IBMVFC_TMF_LUA_VALID));
-		tmf->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
-		tmf->my_cancel_key = cpu_to_be32((unsigned long)starget->hostdata);
-
+		evt = ibmvfc_init_tmf(&vhost->crq, sdev, type);
 		evt->sync_iu = &rsp;
-		init_completion(&evt->comp);
 		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
 	}
 
-- 
2.27.0

