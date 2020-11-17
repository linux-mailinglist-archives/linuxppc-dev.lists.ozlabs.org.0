Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 618312B6E9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:29:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGG82wsbzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:29:04 +1100 (AEDT)
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
 header.s=pp1 header.b=igpmA0Mq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbFzz4q4kzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:16:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ2SBH178715; Tue, 17 Nov 2020 14:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KIJRvQZClUrvt9F15nmnYfnaeSH8coD/pxK1uH68LEk=;
 b=igpmA0MqKRhau8cfVnX+ChdmX6BDyr5AnnUWUdR4JrkP/ID8yRwLmQWBUwVhlyNIyQPj
 R/u4AiJa7HjzH5I+DkgZoOqHGFJ9PqaQjBxD73KwUPYcF6G3Ux1FVIY6QY8WD5zjfT7x
 DA1xSC6yF6ZshLfl9Q+X/BZ8xTwXUyoXZ9P1V20OB3mBRY5rZFGreuSeYFidGTKTISBq
 7NANiyQWAl4o3U4kR8KFK8MIp82z5pH+C21kUVZtLhjYsp6vVpaJcDwUt0FvCEjwRvnH
 BOQ5Y94Ne0qJckpjPzIiFDyoZtRY4rKzHGaP5YcmmEdV0HfOhmp3lSTnTpiXBYb8II9v 9A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ve31nusv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:16:43 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJBRBH030440;
 Tue, 17 Nov 2020 19:16:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 34vfj9syn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:16:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJGfMk8979108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:16:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86EEAC6059;
 Tue, 17 Nov 2020 19:16:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22DBFC6055;
 Tue, 17 Nov 2020 19:16:41 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 19:16:41 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 5/6] ibmvfc: add support for targetWWPN field in v2 MADs
 and vfcFrame
Date: Tue, 17 Nov 2020 13:16:35 -0600
Message-Id: <20201117191636.131127-6-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117191636.131127-1-tyreld@linux.ibm.com>
References: <20201117191636.131127-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_07:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=1 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011170133
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
index 4549cdee2cc0..9efc39b60cf7 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1683,9 +1683,10 @@ static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct s
 	size_t offset;
 
 	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
-	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN)
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
 		offset = offsetof(struct ibmvfc_cmd, v2.rsp);
-	else
+		vfc_cmd->targetWWPN = cpu_to_be64(rport->port_name);
+	} else
 		offset = offsetof(struct ibmvfc_cmd, v1.rsp);
 	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offset);
 	vfc_cmd->resp.len = cpu_to_be32(sizeof(*rsp));
@@ -2062,6 +2063,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
@@ -2079,6 +2081,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
+		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+			tmf->targetWWPN = cpu_to_be64(rport->port_name);
 		iu->tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
 
@@ -2269,7 +2273,12 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 
 		tmf = &evt->iu.tmf;
 		memset(tmf, 0, sizeof(*tmf));
-		tmf->common.version = cpu_to_be32(1);
+		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+			tmf->common.version = cpu_to_be32(2);
+			tmf->targetWWPN = cpu_to_be64(rport->port_name);
+		} else {
+			tmf->common.version = cpu_to_be32(1);
+		}
 		tmf->common.opcode = cpu_to_be32(IBMVFC_TMF_MAD);
 		tmf->common.length = cpu_to_be16(sizeof(*tmf));
 		tmf->scsi_id = cpu_to_be64(rport->port_id);
@@ -2369,6 +2378,7 @@ static int ibmvfc_match_evt(struct ibmvfc_event *evt, void *match)
 static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
@@ -2400,6 +2410,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
+		if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+			tmf->targetWWPN = cpu_to_be64(rport->port_name);
 		iu->tmf_flags = IBMVFC_ABORT_TASK_SET;
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
 		evt->sync_iu = &rsp_iu;
@@ -3481,7 +3493,12 @@ static void ibmvfc_tgt_send_prli(struct ibmvfc_target *tgt)
 	evt->tgt = tgt;
 	prli = &evt->iu.prli;
 	memset(prli, 0, sizeof(*prli));
-	prli->common.version = cpu_to_be32(1);
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+		prli->common.version = cpu_to_be32(2);
+		prli->targetWWPN = cpu_to_be64(tgt->wwpn);
+	} else {
+		prli->common.version = cpu_to_be32(1);
+	}
 	prli->common.opcode = cpu_to_be32(IBMVFC_PROCESS_LOGIN);
 	prli->common.length = cpu_to_be16(sizeof(*prli));
 	prli->scsi_id = cpu_to_be64(tgt->scsi_id);
@@ -3584,7 +3601,12 @@ static void ibmvfc_tgt_send_plogi(struct ibmvfc_target *tgt)
 	evt->tgt = tgt;
 	plogi = &evt->iu.plogi;
 	memset(plogi, 0, sizeof(*plogi));
-	plogi->common.version = cpu_to_be32(1);
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
+		plogi->common.version = cpu_to_be32(2);
+		plogi->targetWWPN = cpu_to_be64(tgt->wwpn);
+	} else {
+		plogi->common.version = cpu_to_be32(1);
+	}
 	plogi->common.opcode = cpu_to_be32(IBMVFC_PORT_LOGIN);
 	plogi->common.length = cpu_to_be16(sizeof(*plogi));
 	plogi->scsi_id = cpu_to_be64(tgt->scsi_id);
@@ -3984,7 +4006,12 @@ static void ibmvfc_adisc_timeout(struct timer_list *t)
 	evt->tgt = tgt;
 	tmf = &evt->iu.tmf;
 	memset(tmf, 0, sizeof(*tmf));
-	tmf->common.version = cpu_to_be32(1);
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN)) {
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

