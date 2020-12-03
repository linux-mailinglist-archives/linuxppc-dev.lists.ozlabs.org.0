Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74C2CCCAA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:32:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmfxr3BktzDqBM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 13:32:32 +1100 (AEDT)
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
 header.s=pp1 header.b=OgYJIKRv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmfPz2tt9zDr9Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 13:08:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B326XRT065425; Wed, 2 Dec 2020 21:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6PX7ikJAOSRj9lPSw5dbkhWeYbfqM4LI5jXxaMrblW8=;
 b=OgYJIKRvY8Kzwrlx9DeysQ263bPNkdDciqRComXAlYlQ3a9Yys688KDPod712xt/lLk2
 +j8zZV8zlxfbr2ZglgpblYoj9//3gC85NWvToYif4b+Wyt6TP8s5IoC19aFPkGXnSZ8+
 Ofah0EeyzmDh5iCMEodsnPU/IXKoe+XwVA5Of80IIZsb2+5WgFYtzP222YEr8Xa6bnjo
 c6D27rSEqTZs7TuqB/B8uZWkM9ueaeUqwpuPz2wXgPH05tbD+oklZSB2J2NiExA0Dwfy
 Y9EZ/5UVoS8IBsFon+uf9/7th70U3bGEkV3odLuqazYiXJcG46lHiSSGtuDxXglGRweg Kw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jg86ukr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 21:08:21 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B31xjDt013051;
 Thu, 3 Dec 2020 02:08:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 356cbem9qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 02:08:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B328JLC22675906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 02:08:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3D527805F;
 Thu,  3 Dec 2020 02:08:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6734B7805E;
 Thu,  3 Dec 2020 02:08:18 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 02:08:18 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 14/18] ibmvfc: add cancel mad initialization helper
Date: Wed,  2 Dec 2020 20:08:02 -0600
Message-Id: <20201203020806.14747-15-tyreld@linux.ibm.com>
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
 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
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
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian King <brking@linux.vnet.ibm.com>, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a helper routine for initializing a Cancel MAD. This will be useful
for a channelized client that needs to send a Cancel commands down every
channel commands were sent for a particular LUN.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 67 ++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d65de320252e..ec3db5a6baf3 100644
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

