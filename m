Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819C2B6E4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:18:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbG280XyczDqW8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:18:40 +1100 (AEDT)
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
 header.s=pp1 header.b=YzAGogtd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbFzw6KjjzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:16:44 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ46EU131792; Tue, 17 Nov 2020 14:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5XcJ05CAGkFq71RzTXs/KEH2powNALmDBsiZonG8fBg=;
 b=YzAGogtd77tWFBmNmXw7Ra6fLCPsSscprTGkI4kCz69k+TeLKGh4MxsOEzhj0IVqVwqZ
 UO6SpI3q4K2q9PnTgh7fo8mVZubCxejDZJaPuJT8h0JoO3o8F0vAvqUREx+h7o7MDbHv
 /rJKW33ZYIhpNsD6A534XH/2c3v51vPQgUZtQdL3JKbU8OYgikVBVODSam7rxjXvuZpv
 oy0Ro/difLFdK4WcwAyrsylWDuWm/bY0LjlrZkxR3GUNRb0Ot5fPwqxtfop+BNY0WiIB
 AO6YHJzfGia/K49q9qPVz0m6H/8FN1mFSpWao0IORSldtlwx0MtPxQw+9025rUUB1Q60 mA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v961y6xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:16:42 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJ7r3h009345;
 Tue, 17 Nov 2020 19:16:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 34t6v90v7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:16:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJGXF628639824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:16:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 702B7C6059;
 Tue, 17 Nov 2020 19:16:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C4B4C6057;
 Tue, 17 Nov 2020 19:16:38 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 19:16:38 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 1/6] ibmvfc: deduplicate common ibmvfc_cmd init code
Date: Tue, 17 Nov 2020 13:16:31 -0600
Message-Id: <20201117191636.131127-2-tyreld@linux.ibm.com>
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
 priorityscore=1501
 adultscore=0 suspectscore=1 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170137
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

The virtual FC frame command exchaned with the VIOS is used for device
reset and command abort TMF as well as normally queued commands. When
initializing the ibmvfc_cmd there several elements of the command that
are set the same way regardless of the command type.

Deduplicate code by moving these commonally set fields into a
initialization helper routine, namely ibmvfc_init_vfc_cmd().

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 56 +++++++++++++++-------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 3922441a117d..316902074abe 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1646,6 +1646,25 @@ static inline int ibmvfc_host_chkready(struct ibmvfc_host *vhost)
 	return result;
 }
 
+static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct scsi_device *sdev)
+{
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
+	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
+	size_t offset = offsetof(struct ibmvfc_cmd, rsp);
+
+	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
+	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offset);
+	vfc_cmd->resp.len = cpu_to_be32(sizeof(vfc_cmd->rsp));
+	vfc_cmd->frame_type = cpu_to_be32(IBMVFC_SCSI_FCP_TYPE);
+	vfc_cmd->payload_len = cpu_to_be32(sizeof(vfc_cmd->iu));
+	vfc_cmd->resp_len = cpu_to_be32(sizeof(vfc_cmd->rsp));
+	vfc_cmd->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
+	vfc_cmd->tgt_scsi_id = cpu_to_be64(rport->port_id);
+	int_to_scsilun(sdev->lun, &vfc_cmd->iu.lun);
+
+	return vfc_cmd;
+}
+
 /**
  * ibmvfc_queuecommand - The queuecommand function of the scsi template
  * @cmnd:	struct scsi_cmnd to be executed
@@ -1675,17 +1694,10 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	ibmvfc_init_event(evt, ibmvfc_scsi_done, IBMVFC_CMD_FORMAT);
 	evt->cmnd = cmnd;
 	cmnd->scsi_done = done;
-	vfc_cmd = &evt->iu.cmd;
-	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
-	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offsetof(struct ibmvfc_cmd, rsp));
-	vfc_cmd->resp.len = cpu_to_be32(sizeof(vfc_cmd->rsp));
-	vfc_cmd->frame_type = cpu_to_be32(IBMVFC_SCSI_FCP_TYPE);
-	vfc_cmd->payload_len = cpu_to_be32(sizeof(vfc_cmd->iu));
-	vfc_cmd->resp_len = cpu_to_be32(sizeof(vfc_cmd->rsp));
-	vfc_cmd->cancel_key = cpu_to_be32((unsigned long)cmnd->device->hostdata);
-	vfc_cmd->tgt_scsi_id = cpu_to_be64(rport->port_id);
+
+	vfc_cmd = ibmvfc_init_vfc_cmd(evt, cmnd->device);
+
 	vfc_cmd->iu.xfer_len = cpu_to_be32(scsi_bufflen(cmnd));
-	int_to_scsilun(cmnd->device->lun, &vfc_cmd->iu.lun);
 	memcpy(vfc_cmd->iu.cdb, cmnd->cmnd, cmnd->cmd_len);
 
 	if (cmnd->flags & SCMD_TAGGED) {
@@ -2014,7 +2026,6 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
-	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
@@ -2027,17 +2038,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 	if (vhost->state == IBMVFC_ACTIVE) {
 		evt = ibmvfc_get_event(vhost);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
+		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 
-		tmf = &evt->iu.cmd;
-		memset(tmf, 0, sizeof(*tmf));
-		tmf->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offsetof(struct ibmvfc_cmd, rsp));
-		tmf->resp.len = cpu_to_be32(sizeof(tmf->rsp));
-		tmf->frame_type = cpu_to_be32(IBMVFC_SCSI_FCP_TYPE);
-		tmf->payload_len = cpu_to_be32(sizeof(tmf->iu));
-		tmf->resp_len = cpu_to_be32(sizeof(tmf->rsp));
-		tmf->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
-		tmf->tgt_scsi_id = cpu_to_be64(rport->port_id);
-		int_to_scsilun(sdev->lun, &tmf->iu.lun);
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
 		tmf->iu.tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
@@ -2329,7 +2331,6 @@ static int ibmvfc_match_evt(struct ibmvfc_event *evt, void *match)
 static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
-	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
@@ -2357,17 +2358,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	if (vhost->state == IBMVFC_ACTIVE) {
 		evt = ibmvfc_get_event(vhost);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
+		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 
-		tmf = &evt->iu.cmd;
-		memset(tmf, 0, sizeof(*tmf));
-		tmf->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offsetof(struct ibmvfc_cmd, rsp));
-		tmf->resp.len = cpu_to_be32(sizeof(tmf->rsp));
-		tmf->frame_type = cpu_to_be32(IBMVFC_SCSI_FCP_TYPE);
-		tmf->payload_len = cpu_to_be32(sizeof(tmf->iu));
-		tmf->resp_len = cpu_to_be32(sizeof(tmf->rsp));
-		tmf->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
-		tmf->tgt_scsi_id = cpu_to_be64(rport->port_id);
-		int_to_scsilun(sdev->lun, &tmf->iu.lun);
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
 		tmf->iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
 		evt->sync_iu = &rsp_iu;
-- 
2.27.0

