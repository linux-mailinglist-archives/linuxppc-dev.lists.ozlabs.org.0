Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B222AFBDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:06:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWk263hL6zDqyf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 12:06:22 +1100 (AEDT)
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
 header.s=pp1 header.b=Ah1AfsvZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWk0M4JvkzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 12:04:51 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AC0XSFh066925; Wed, 11 Nov 2020 20:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EyVYVNtmcmDmwdOaopHTFUmt28HbKBD4z3fz8IlkTJg=;
 b=Ah1AfsvZXh+1ttlsHTNtB374cm5IrJJDrqRNFcBOjrXd53MzMtldZCr6PrUcWtTaC+d1
 /+Ky0v+aITeYNx8iHYNwiJQDjv52pyCQlLUoiF5Pk64nDyFZYScpmFmDPsUwZp08q3Pu
 WaqkkIHMTYSpDfUCMbKnka5oV1IF+btG1+LGzxhINhpPdOksUttwM/KhsdFFkKCqdla+
 Jn9QMOpsSr0d1i0URijOIGLeWAxIKiEQ/L5vBuKU9AstpdY+QWcibkoubYd+MyY2eh/o
 TiUuPcR40tgHg3p+JNQe1MvgafmkYdBYZrBHMfTI7t6hsAxHjIlZeg3NW3bRNBuALO+A Ng== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34rt69s84m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 20:04:49 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AC0wCWt031160;
 Thu, 12 Nov 2020 01:04:47 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 34q5nexpec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 01:04:47 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AC14luX9110052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 01:04:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13B3D2805A;
 Thu, 12 Nov 2020 01:04:47 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B6C428059;
 Thu, 12 Nov 2020 01:04:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Nov 2020 01:04:46 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 5/6] ibmvfc: add support for targetWWPN field in v2 MADs and
 vfcFrame
Date: Wed, 11 Nov 2020 19:04:41 -0600
Message-Id: <20201112010442.102589-5-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112010442.102589-1-tyreld@linux.ibm.com>
References: <20201112010442.102589-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_12:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120001
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
a new targetWWPN field for better identification of the target then
simply the scsi_id.

Set this field and MAD versioning fields when the VIOS advertises the
IBMVFC_HANDLE_VF_WWPN capability.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 39 ++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 5e666f7c9266..604bccebf7d2 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1676,9 +1676,10 @@ static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct s
 	size_t offset;
 
 	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
-	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN)
+	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN) {
 		offset = offsetof(struct ibmvfc_cmd, v2.rsp);
-	else
+		vfc_cmd->targetWWPN = cpu_to_be64(rport->port_name);
+	} else
 		offset = offsetof(struct ibmvfc_cmd, v1.rsp);
 	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offset);
 	vfc_cmd->resp.len = cpu_to_be32(sizeof(*rsp));
@@ -2053,6 +2054,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
@@ -2070,6 +2072,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
+		if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN)
+			tmf->targetWWPN = cpu_to_be64(rport->port_name);
 		iu->tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
 
@@ -2260,7 +2264,12 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 
 		tmf = &evt->iu.tmf;
 		memset(tmf, 0, sizeof(*tmf));
-		tmf->common.version = cpu_to_be32(1);
+		if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN) {
+			tmf->common.version = cpu_to_be32(2);
+			tmf->targetWWPN = cpu_to_be64(found_evt->tgt->wwpn);
+		} else {
+			tmf->common.version = cpu_to_be32(1);
+		}
 		tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
 		tmf->common.length = cpu_to_be16(sizeof(*tmf));
 		tmf->scsi_id = cpu_to_be64(rport->port_id);
@@ -2360,6 +2369,7 @@ static int ibmvfc_match_evt(struct ibmvfc_event *evt, void *match)
 static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
@@ -2391,6 +2401,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
+		if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN)
+			tmf->targetWWPN = cpu_to_be64(rport->port_name);
 		iu->tmf_flags = IBMVFC_ABORT_TASK_SET;
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
 		evt->sync_iu = &rsp_iu;
@@ -3470,7 +3482,12 @@ static void ibmvfc_tgt_send_prli(struct ibmvfc_target *tgt)
 	evt->tgt = tgt;
 	prli = &evt->iu.prli;
 	memset(prli, 0, sizeof(*prli));
-	prli->common.version = cpu_to_be32(1);
+	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN) {
+		prli->common.version = cpu_to_be32(2);
+		prli->targetWWPN = cpu_to_be64(tgt->wwpn);
+	} else {
+		prli->common.version = cpu_to_be32(1);
+	}
 	prli->common.opcode = cpu_to_be32(IBMVFC_PROCESS_LOGIN);
 	prli->common.length = cpu_to_be16(sizeof(*prli));
 	prli->scsi_id = cpu_to_be64(tgt->scsi_id);
@@ -3573,7 +3590,12 @@ static void ibmvfc_tgt_send_plogi(struct ibmvfc_target *tgt)
 	evt->tgt = tgt;
 	plogi = &evt->iu.plogi;
 	memset(plogi, 0, sizeof(*plogi));
-	plogi->common.version = cpu_to_be32(1);
+	if(be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN) {
+		plogi->common.version = cpu_to_be32(2);
+		plogi->targetWWPN = cpu_to_be64(tgt->wwpn);
+	} else {
+		plogi->common.version = cpu_to_be32(1);
+	}
 	plogi->common.opcode = cpu_to_be32(IBMVFC_PORT_LOGIN);
 	plogi->common.length = cpu_to_be16(sizeof(*plogi));
 	plogi->scsi_id = cpu_to_be64(tgt->scsi_id);
@@ -3973,7 +3995,12 @@ static void ibmvfc_adisc_timeout(struct timer_list *t)
 	evt->tgt = tgt;
 	tmf = &evt->iu.tmf;
 	memset(tmf, 0, sizeof(*tmf));
-	tmf->common.version = cpu_to_be32(1);
+	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN) {
+		tmf->common.version = cpu_to_be32(2);
+		tmf->targetWWPN = cpu_to_be64(tgt->wwpn);
+	} else {
+		tmf->common.version = cpu_to_be32(1);
+	}
 	tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
 	tmf->common.length = cpu_to_be16(sizeof(*tmf));
 	tmf->scsi_id = cpu_to_be64(tgt->scsi_id);
-- 
2.27.0

