Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA9C2B73B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:23:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbQ6n4ZmlzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 12:23:13 +1100 (AEDT)
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
 header.s=pp1 header.b=PUQLnZTG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbPry5XSTzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 12:11:14 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI114ZE143319; Tue, 17 Nov 2020 20:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8vQyreawr5HFwvS/2lVuo6/JG0EfLmlRUyvCJmkiAwA=;
 b=PUQLnZTGTdLZpM2JTrOI1o1e3gBh+BpcaDuDBVsJqpAQ6NY9WAyk3leTM5Ku1txt1c5d
 tcrDO0yhJvofHW6AZZ1P+yQiG0hKvB1R92S+4Qa36ocT5ZZgxaiEsPKlsc3ZFfM8ytzg
 0mibraLc8s2c4jHi+GN17hYYm2N5gw80DxRGOywa33yUWfLAUC8aC1nbEm/rtJ+95btU
 qxHpyJafZbzoLKAFA+k24c9FAZNDk9cwiVSllvXKHb1T89/Vdbim1ZR/I8oXVOoHYrYi
 m6nxjV5LCNYARCelrNZKOSDBpvP9my5FU5JWxyVUtWqYF+XaX0BJ/Sdbjc5yXAHhlc8N tQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34vd4qfkyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 20:11:11 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI188ok015321;
 Wed, 18 Nov 2020 01:11:10 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 34uyn19fqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 01:11:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI1B1EE8651230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 01:11:01 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D31CABE053;
 Wed, 18 Nov 2020 01:11:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E778BE04F;
 Wed, 18 Nov 2020 01:11:07 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 01:11:07 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 4/6] ibmvfc: add FC payload retrieval routines for
 versioned vfcFrames
Date: Tue, 17 Nov 2020 19:11:02 -0600
Message-Id: <20201118011104.296999-5-tyreld@linux.ibm.com>
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
 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
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

The FC iu and response payloads are located at different offsets
depending on the ibmvfc_cmd version. This is a result of the version 2
vfcFrame definition adding an extra 64bytes of reserved space to the
structure prior to the payloads.

Add helper routines to determine the current vfcFrame version and
return a pointer to the proper iu or response structure within that
ibmvfc_cmd.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 77 ++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 23 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index a68602cd1255..3427c686fb10 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -145,6 +145,24 @@ static int ibmvfc_check_caps(struct ibmvfc_host *vhost, unsigned long cap_flags)
 	return (host_caps & cap_flags) ? 1 : 0;
 }
 
+static struct ibmvfc_fcp_cmd_iu *ibmvfc_get_fcp_iu(struct ibmvfc_host *vhost,
+						   struct ibmvfc_cmd *vfc_cmd)
+{
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+		return &vfc_cmd->v2.iu;
+	else
+		return &vfc_cmd->v1.iu;
+}
+
+static struct ibmvfc_fcp_rsp *ibmvfc_get_fcp_rsp(struct ibmvfc_host *vhost,
+						 struct ibmvfc_cmd *vfc_cmd)
+{
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+		return &vfc_cmd->v2.rsp;
+	else
+		return &vfc_cmd->v1.rsp;
+}
+
 #ifdef CONFIG_SCSI_IBMVFC_TRACE
 /**
  * ibmvfc_trc_start - Log a start trace entry
@@ -156,7 +174,7 @@ static void ibmvfc_trc_start(struct ibmvfc_event *evt)
 	struct ibmvfc_host *vhost = evt->vhost;
 	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
 	struct ibmvfc_mad_common *mad = &evt->iu.mad_common;
-	struct ibmvfc_fcp_cmd_iu *iu = &vfc_cmd->v1.iu;
+	struct ibmvfc_fcp_cmd_iu *iu = ibmvfc_get_fcp_iu(vhost, vfc_cmd);
 	struct ibmvfc_trace_entry *entry;
 
 	entry = &vhost->trace[vhost->trace_index++];
@@ -191,8 +209,8 @@ static void ibmvfc_trc_end(struct ibmvfc_event *evt)
 	struct ibmvfc_host *vhost = evt->vhost;
 	struct ibmvfc_cmd *vfc_cmd = &evt->xfer_iu->cmd;
 	struct ibmvfc_mad_common *mad = &evt->xfer_iu->mad_common;
-	struct ibmvfc_fcp_cmd_iu *iu = &vfc_cmd->v1.iu;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
+	struct ibmvfc_fcp_cmd_iu *iu = ibmvfc_get_fcp_iu(vhost, vfc_cmd);
+	struct ibmvfc_fcp_rsp *rsp = ibmvfc_get_fcp_rsp(vhost, vfc_cmd);
 	struct ibmvfc_trace_entry *entry = &vhost->trace[vhost->trace_index++];
 
 	entry->evt = evt;
@@ -270,10 +288,10 @@ static const char *ibmvfc_get_cmd_error(u16 status, u16 error)
  * Return value:
  *	SCSI result value to return for completed command
  **/
-static int ibmvfc_get_err_result(struct ibmvfc_cmd *vfc_cmd)
+static int ibmvfc_get_err_result(struct ibmvfc_host *vhost, struct ibmvfc_cmd *vfc_cmd)
 {
 	int err;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
+	struct ibmvfc_fcp_rsp *rsp = ibmvfc_get_fcp_rsp(vhost, vfc_cmd);
 	int fc_rsp_len = be32_to_cpu(rsp->fcp_rsp_len);
 
 	if ((rsp->flags & FCP_RSP_LEN_VALID) &&
@@ -1388,7 +1406,7 @@ static int ibmvfc_map_sg_data(struct scsi_cmnd *scmd,
 	int sg_mapped;
 	struct srp_direct_buf *data = &vfc_cmd->ioba;
 	struct ibmvfc_host *vhost = dev_get_drvdata(dev);
-	struct ibmvfc_fcp_cmd_iu *iu = &vfc_cmd->v1.iu;
+	struct ibmvfc_fcp_cmd_iu *iu = ibmvfc_get_fcp_iu(evt->vhost, vfc_cmd);
 
 	if (cls3_error)
 		vfc_cmd->flags |= cpu_to_be16(IBMVFC_CLASS_3_ERR);
@@ -1527,7 +1545,7 @@ static void ibmvfc_log_error(struct ibmvfc_event *evt)
 {
 	struct ibmvfc_cmd *vfc_cmd = &evt->xfer_iu->cmd;
 	struct ibmvfc_host *vhost = evt->vhost;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
+	struct ibmvfc_fcp_rsp *rsp = ibmvfc_get_fcp_rsp(vhost, vfc_cmd);
 	struct scsi_cmnd *cmnd = evt->cmnd;
 	const char *err = unknown_error;
 	int index = ibmvfc_get_err_index(be16_to_cpu(vfc_cmd->status), be16_to_cpu(vfc_cmd->error));
@@ -1581,7 +1599,7 @@ static void ibmvfc_relogin(struct scsi_device *sdev)
 static void ibmvfc_scsi_done(struct ibmvfc_event *evt)
 {
 	struct ibmvfc_cmd *vfc_cmd = &evt->xfer_iu->cmd;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
+	struct ibmvfc_fcp_rsp *rsp = ibmvfc_get_fcp_rsp(evt->vhost, vfc_cmd);
 	struct scsi_cmnd *cmnd = evt->cmnd;
 	u32 rsp_len = 0;
 	u32 sense_len = be32_to_cpu(rsp->fcp_sense_len);
@@ -1595,7 +1613,7 @@ static void ibmvfc_scsi_done(struct ibmvfc_event *evt)
 			scsi_set_resid(cmnd, 0);
 
 		if (vfc_cmd->status) {
-			cmnd->result = ibmvfc_get_err_result(vfc_cmd);
+			cmnd->result = ibmvfc_get_err_result(evt->vhost, vfc_cmd);
 
 			if (rsp->flags & FCP_RSP_LEN_VALID)
 				rsp_len = be32_to_cpu(rsp->fcp_rsp_len);
@@ -1660,18 +1678,25 @@ static inline int ibmvfc_host_chkready(struct ibmvfc_host *vhost)
 static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct scsi_device *sdev)
 {
 	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
+	struct ibmvfc_host *vhost = evt->vhost;
 	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
-	size_t offset = offsetof(struct ibmvfc_cmd, v1.rsp);
+	struct ibmvfc_fcp_cmd_iu *iu = ibmvfc_get_fcp_iu(vhost, vfc_cmd);
+	struct ibmvfc_fcp_rsp *rsp = ibmvfc_get_fcp_rsp(vhost, vfc_cmd);
+	size_t offset;
 
 	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
+	if (ibmvfc_check_caps(vhost, IBMVFC_HANDLE_VF_WWPN))
+		offset = offsetof(struct ibmvfc_cmd, v2.rsp);
+	else
+		offset = offsetof(struct ibmvfc_cmd, v1.rsp);
 	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offset);
-	vfc_cmd->resp.len = cpu_to_be32(sizeof(vfc_cmd->v1.rsp));
+	vfc_cmd->resp.len = cpu_to_be32(sizeof(*rsp));
 	vfc_cmd->frame_type = cpu_to_be32(IBMVFC_SCSI_FCP_TYPE);
-	vfc_cmd->payload_len = cpu_to_be32(sizeof(vfc_cmd->v1.iu));
-	vfc_cmd->resp_len = cpu_to_be32(sizeof(vfc_cmd->v1.rsp));
+	vfc_cmd->payload_len = cpu_to_be32(sizeof(*iu));
+	vfc_cmd->resp_len = cpu_to_be32(sizeof(*rsp));
 	vfc_cmd->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
 	vfc_cmd->tgt_scsi_id = cpu_to_be64(rport->port_id);
-	int_to_scsilun(sdev->lun, &vfc_cmd->v1.iu.lun);
+	int_to_scsilun(sdev->lun, &iu->lun);
 
 	return vfc_cmd;
 }
@@ -1690,6 +1715,7 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	struct ibmvfc_host *vhost = shost_priv(cmnd->device->host);
 	struct fc_rport *rport = starget_to_rport(scsi_target(cmnd->device));
 	struct ibmvfc_cmd *vfc_cmd;
+	struct ibmvfc_fcp_cmd_iu *iu;
 	struct ibmvfc_event *evt;
 	int rc;
 
@@ -1707,13 +1733,14 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	cmnd->scsi_done = done;
 
 	vfc_cmd = ibmvfc_init_vfc_cmd(evt, cmnd->device);
+	iu = ibmvfc_get_fcp_iu(vhost, vfc_cmd);
 
-	vfc_cmd->v1.iu.xfer_len = cpu_to_be32(scsi_bufflen(cmnd));
-	memcpy(vfc_cmd->v1.iu.cdb, cmnd->cmnd, cmnd->cmd_len);
+	iu->xfer_len = cpu_to_be32(scsi_bufflen(cmnd));
+	memcpy(iu->cdb, cmnd->cmnd, cmnd->cmd_len);
 
 	if (cmnd->flags & SCMD_TAGGED) {
 		vfc_cmd->task_tag = cpu_to_be64(cmnd->tag);
-		vfc_cmd->v1.iu.pri_task_attr = IBMVFC_SIMPLE_TASK;
+		iu->pri_task_attr = IBMVFC_SIMPLE_TASK;
 	}
 
 	vfc_cmd->correlation = cpu_to_be64(evt);
@@ -2040,7 +2067,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
-	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.v1.rsp;
+	struct ibmvfc_fcp_cmd_iu *iu;
+	struct ibmvfc_fcp_rsp *fc_rsp = ibmvfc_get_fcp_rsp(vhost, &rsp_iu.cmd);
 	int rsp_rc = -EBUSY;
 	unsigned long flags;
 	int rsp_code = 0;
@@ -2050,9 +2078,10 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 		evt = ibmvfc_get_event(vhost);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
+		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
-		tmf->v1.iu.tmf_flags = type;
+		iu->tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
 
 		init_completion(&evt->comp);
@@ -2070,7 +2099,7 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 	wait_for_completion(&evt->comp);
 
 	if (rsp_iu.cmd.status)
-		rsp_code = ibmvfc_get_err_result(&rsp_iu.cmd);
+		rsp_code = ibmvfc_get_err_result(vhost, &rsp_iu.cmd);
 
 	if (rsp_code) {
 		if (fc_rsp->flags & FCP_RSP_LEN_VALID)
@@ -2345,7 +2374,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
-	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.v1.rsp;
+	struct ibmvfc_fcp_cmd_iu *iu;
+	struct ibmvfc_fcp_rsp *fc_rsp = ibmvfc_get_fcp_rsp(vhost, &rsp_iu.cmd);
 	int rc, rsp_rc = -EBUSY;
 	unsigned long flags, timeout = IBMVFC_ABORT_TIMEOUT;
 	int rsp_code = 0;
@@ -2370,9 +2400,10 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 		evt = ibmvfc_get_event(vhost);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
+		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
+		iu->tmf_flags = IBMVFC_ABORT_TASK_SET;
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
-		tmf->v1.iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
 		evt->sync_iu = &rsp_iu;
 
 		tmf->correlation = cpu_to_be64(evt);
@@ -2421,7 +2452,7 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	}
 
 	if (rsp_iu.cmd.status)
-		rsp_code = ibmvfc_get_err_result(&rsp_iu.cmd);
+		rsp_code = ibmvfc_get_err_result(vhost, &rsp_iu.cmd);
 
 	if (rsp_code) {
 		if (fc_rsp->flags & FCP_RSP_LEN_VALID)
-- 
2.27.0

