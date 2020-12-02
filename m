Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B25B2CB236
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:22:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm1RK4cFRzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 12:22:21 +1100 (AEDT)
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
 header.s=pp1 header.b=h4sNLZt0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm0pM1Ly1zDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 11:53:46 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B20WB3o073411; Tue, 1 Dec 2020 19:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vnaWLPvh2uX2HNmPNut2NCu7iZ/rSQKUqgs6bHioo7c=;
 b=h4sNLZt09ZanufZjHyDccaVatE/hEKV6Tn+gOTbvnOYQK+1xSm2bWM2R4dRVLLh53u14
 P7vYYGGoPiuYuCRWKPOaUXtV09lmDIW8npY0+5VZmXY0aQKZD5vsGW3uiy63Eldq5Hop
 Zy9IHuyxDwowcSHzI69dOmEHMEVJyJxENU0awAYmEmJSIrCeNtXDrm4sD/U1yWJGgTQg
 7so/giafXlaGKOz/kWXjhorbn4iUZKwFCz/RjSl7wN6ao6fYkALIDPPsB/oQZCvrZLm8
 V/380bjannLabO0GPt9sJcgR9lRtSuYumi3xYoUrPhDZSvXNAOSsdJQ1WSzWhKRsFjJf xw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355k52u1sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 19:53:40 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B20bNEg013453;
 Wed, 2 Dec 2020 00:53:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 353e69umef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:53:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B20rc3i21234150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 00:53:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E47F7805F;
 Wed,  2 Dec 2020 00:53:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01AE57805E;
 Wed,  2 Dec 2020 00:53:38 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 00:53:37 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 14/17] ibmvfc: add cancel mad initialization helper
Date: Tue,  1 Dec 2020 18:53:26 -0600
Message-Id: <20201202005329.4538-15-tyreld@linux.ibm.com>
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
 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012010142
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

Add a helper routine for initializing a Cancel MAD. This will be useful
for a channelized client that needs to send a Cancel commands down every
channel commands were sent for a particular LUN.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 67 ++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index c1ac2acba5fd..0b6284020f06 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -2286,6 +2286,44 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 	return SUCCESS;
 }
 
+static struct ibmvfc_event *ibmvfc_init_tmf(struct ibmvfc_host *vhost,
+				     struct scsi_device *sdev,
+				     int type)
+{
+	struct scsi_target *starget = scsi_target(sdev);
+	struct fc_rport *rport = starget_to_rport(starget);
+	struct ibmvfc_event *evt;
+	struct ibmvfc_tmf *tmf;
+
+	evt = ibmvfc_get_event(vhost);
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
@@ -2300,9 +2338,6 @@ static int ibmvfc_wait_for_ops(struct ibmvfc_host *vhost, void *device,
 static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
-	struct scsi_target *starget = scsi_target(sdev);
-	struct fc_rport *rport = starget_to_rport(starget);
-	struct ibmvfc_tmf *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp;
 	int rsp_rc = -EBUSY;
@@ -2327,32 +2362,8 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 	}
 
 	if (vhost->logged_in) {
-		evt = ibmvfc_get_event(vhost);
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
+		evt = ibmvfc_init_tmf(vhost, sdev, type);
 		evt->sync_iu = &rsp;
-		init_completion(&evt->comp);
 		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
 	}
 
-- 
2.27.0

