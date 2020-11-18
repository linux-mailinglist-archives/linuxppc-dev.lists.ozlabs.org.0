Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F42B73AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:21:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbQ4G2y54zDqfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 12:21:02 +1100 (AEDT)
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
 header.s=pp1 header.b=mGPkoZWN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbPry1KqxzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 12:11:13 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI12CLq078666; Tue, 17 Nov 2020 20:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3DB0D4faj7+NR+DNa8Ta+S+mZudClIfGT0ghfDBmFeU=;
 b=mGPkoZWNSGEhCZb1VAYAIRLNoCl7oN14NeepPSvK71Ri1bTvCle30UWOGX7mDEaSGtQl
 wqv7TVYoVLNzbl259LqsP9hlyYxVbOoBFU5jh6sZe2jlDvTr+MaqhYF7uHDNXFIwdDuC
 JD/GBKAUm1ZcEgWXo6MFOux5WCc/vQJbsl2Kfg39FNI7YlQtjax2+NQr5FGtEWm+PqrT
 c4EFcBrGaoOG6oTjHJkaILgcW3sVYweFsPKuaNmEycJxO+rtDSBJsqWZ9H4izCTdeqW+
 2VSHKJUEZMc7bdY8iagqTvy+7JrHWBBu/3TB79C8LeM4h2o1vEIg2b5wDWM2gsYckMJd uQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34v3yfs3y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 20:11:10 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI11g2A010752;
 Wed, 18 Nov 2020 01:11:10 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34t6v9h3pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 01:11:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI1AxXR63439194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 01:10:59 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C34BE056;
 Wed, 18 Nov 2020 01:11:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7251BE04F;
 Wed, 18 Nov 2020 01:11:07 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 01:11:07 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 5/6] ibmvfc: add support for target_wwpn field in v2 MADs
 and vfcFrame
Date: Tue, 17 Nov 2020 19:11:03 -0600
Message-Id: <20201118011104.296999-6-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118011104.296999-1-tyreld@linux.ibm.com>
References: <20201118011104.296999-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_15:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 suspectscore=1 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180000
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

Several version 2 MADs and the version 2 vfcFrame structures introduced
a new targetWWPN field for better identification of a target over the
scsi_id.

Set this field and MAD versioning fields when the VIOS advertises the
IBMVFC_HANDLE_VF_WWPN capability.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 39 ++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 3427c686fb10..83627e11e85e 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1685,9 +1685,10 @@ static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct s
 	size_t offset;
 
 	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
-	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
 		offset = offsetof(struct ibmvfc_cmd, v2.rsp);
-	else
+		vfc_cmd->target_wwpn = cpu_to_be64(rport->port_name);
+	} else
 		offset = offsetof(struct ibmvfc_cmd, v1.rsp);
 	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offset);
 	vfc_cmd->resp.len = cpu_to_be32(sizeof(*rsp));
@@ -2064,6 +2065,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
@@ -2081,6 +2083,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
+		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+			tmf->target_wwpn = cpu_to_be64(rport->port_name);
 		iu->tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
 
@@ -2271,7 +2275,12 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 
 		tmf = &evt->iu.tmf;
 		memset(tmf, 0, sizeof(*tmf));
-		tmf->common.version = cpu_to_be32(1);
+		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+			tmf->common.version = cpu_to_be32(2);
+			tmf->target_wwpn = cpu_to_be64(rport->port_name);
+		} else {
+			tmf->common.version = cpu_to_be32(1);
+		}
 		tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
 		tmf->common.length = cpu_to_be16(sizeof(*tmf));
 		tmf->scsi_id = cpu_to_be64(rport->port_id);
@@ -2371,6 +2380,7 @@ static int ibmvfc_match_evt(struct ibmvfc_event *evt, void *match)
 static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
@@ -2402,6 +2412,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
+		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+			tmf->target_wwpn = cpu_to_be64(rport->port_name);
 		iu->tmf_flags = IBMVFC_ABORT_TASK_SET;
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
 		evt->sync_iu = &rsp_iu;
@@ -3483,7 +3495,12 @@ static void ibmvfc_tgt_send_prli(struct ibmvfc_target *tgt)
 	evt->tgt = tgt;
 	prli = &evt->iu.prli;
 	memset(prli, 0, sizeof(*prli));
-	prli->common.version = cpu_to_be32(1);
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+		prli->common.version = cpu_to_be32(2);
+		prli->target_wwpn = cpu_to_be64(tgt->wwpn);
+	} else {
+		prli->common.version = cpu_to_be32(1);
+	}
 	prli->common.opcode = cpu_to_be32(IBMVFC_PROCESS_LOGIN);
 	prli->common.length = cpu_to_be16(sizeof(*prli));
 	prli->scsi_id = cpu_to_be64(tgt->scsi_id);
@@ -3586,7 +3603,12 @@ static void ibmvfc_tgt_send_plogi(struct ibmvfc_target *tgt)
 	evt->tgt = tgt;
 	plogi = &evt->iu.plogi;
 	memset(plogi, 0, sizeof(*plogi));
-	plogi->common.version = cpu_to_be32(1);
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+		plogi->common.version = cpu_to_be32(2);
+		plogi->target_wwpn = cpu_to_be64(tgt->wwpn);
+	} else {
+		plogi->common.version = cpu_to_be32(1);
+	}
 	plogi->common.opcode = cpu_to_be32(IBMVFC_PORT_LOGIN);
 	plogi->common.length = cpu_to_be16(sizeof(*plogi));
 	plogi->scsi_id = cpu_to_be64(tgt->scsi_id);
@@ -3986,7 +4008,12 @@ static void ibmvfc_adisc_timeout(struct timer_list *t)
 	evt->tgt = tgt;
 	tmf = &evt->iu.tmf;
 	memset(tmf, 0, sizeof(*tmf));
-	tmf->common.version = cpu_to_be32(1);
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+		tmf->common.version = cpu_to_be32(2);
+		tmf->target_wwpn = cpu_to_be64(tgt->wwpn);
+	} else {
+		tmf->common.version = cpu_to_be32(1);
+	}
 	tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
 	tmf->common.length = cpu_to_be16(sizeof(*tmf));
 	tmf->scsi_id = cpu_to_be64(tgt->scsi_id);
-- 
2.27.0

