Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 995992B6E94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:25:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGB33m37zDqSN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:25:31 +1100 (AEDT)
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
 header.s=pp1 header.b=O+cmqdFb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbFzy61sqzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:16:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ2UPG142139; Tue, 17 Nov 2020 14:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wfTh43yo6tR8KKm47aaimz3ojUmx2IDDWAJTc7aRuK0=;
 b=O+cmqdFbaP8vw1lDVj82WQMxPmFZWiXLrQ9FOlU5hjL+j8yzqudxbw5PXAZs2zLZ/g4w
 JplnpbsCuuGo5y8vUAxCd5qDP9QUNfjrJLqIUAhy98CNpu9ygdA2l9N59PlKWuUL+5Wj
 xrMHPR06Hv0L9AQlBDvJEkCQEVGqjLXnddJgmWAy004HzeaKWwSbCa+DaNWPcF+4AnnY
 rSpz+xQxi4U2Rl19HwbfOZcio2rUr6hhIJwvo+NazYoAbMJnljW/vboxAuLMPgMSFLFm
 nX/sMMtXu/ClE6Xc9nmbeY/ExrgkiC75DIWbewoZ+OIqlwTmociAx3pseU9MbCn5yhsT Yw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34vevtc8vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:16:43 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJ8LpD004754;
 Tue, 17 Nov 2020 19:16:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 34t6v90qmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:16:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJGfXq66781582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:16:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E293C6057;
 Tue, 17 Nov 2020 19:16:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DC88C6055;
 Tue, 17 Nov 2020 19:16:40 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 19:16:40 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 4/6] ibmvfc: add FC payload retrieval routines for
 versioned vfcFrames
Date: Tue, 17 Nov 2020 13:16:34 -0600
Message-Id: <20201117191636.131127-5-tyreld@linux.ibm.com>
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
 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=1 clxscore=1015
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170133
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
returning pointers to the proper iu or response structures within that
ibmvfc_cmd.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 75 +++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index a68602cd1255..4549cdee2cc0 100644
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
@@ -1660,18 +1678,23 @@ static inline int ibmvfc_host_chkready(struct ibmvfc_host *vhost)
 static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct scsi_device *sdev)
 {
 	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
+	struct ibmvfc_host *vhost = evt->vhost;
 	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
-	size_t offset = offsetof(struct ibmvfc_cmd, v1.rsp);
+	size_t offset;
 
 	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
+	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN)
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
@@ -1690,6 +1713,7 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	struct ibmvfc_host *vhost = shost_priv(cmnd->device->host);
 	struct fc_rport *rport = starget_to_rport(scsi_target(cmnd->device));
 	struct ibmvfc_cmd *vfc_cmd;
+	struct ibmvfc_fcp_cmd_iu *iu;
 	struct ibmvfc_event *evt;
 	int rc;
 
@@ -1707,13 +1731,14 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
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
@@ -2040,7 +2065,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
-	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.v1.rsp;
+	struct ibmvfc_fcp_cmd_iu *iu;
+	struct ibmvfc_fcp_rsp *fc_rsp = ibmvfc_get_fcp_rsp(vhost, &rsp_iu.cmd);
 	int rsp_rc = -EBUSY;
 	unsigned long flags;
 	int rsp_code = 0;
@@ -2050,9 +2076,10 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 		evt = ibmvfc_get_event(vhost);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
+		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
-		tmf->v1.iu.tmf_flags = type;
+		iu->tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
 
 		init_completion(&evt->comp);
@@ -2070,7 +2097,7 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 	wait_for_completion(&evt->comp);
 
 	if (rsp_iu.cmd.status)
-		rsp_code = ibmvfc_get_err_result(&rsp_iu.cmd);
+		rsp_code = ibmvfc_get_err_result(vhost, &rsp_iu.cmd);
 
 	if (rsp_code) {
 		if (fc_rsp->flags & FCP_RSP_LEN_VALID)
@@ -2345,7 +2372,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
-	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.v1.rsp;
+	struct ibmvfc_fcp_cmd_iu *iu;
+	struct ibmvfc_fcp_rsp *fc_rsp = ibmvfc_get_fcp_rsp(vhost, &rsp_iu.cmd);
 	int rc, rsp_rc = -EBUSY;
 	unsigned long flags, timeout = IBMVFC_ABORT_TIMEOUT;
 	int rsp_code = 0;
@@ -2370,9 +2398,10 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 		evt = ibmvfc_get_event(vhost);
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
+		iu = ibmvfc_get_fcp_iu(vhost, tmf);
 
+		iu->tmf_flags = IBMVFC_ABORT_TASK_SET;
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
-		tmf->v1.iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
 		evt->sync_iu = &rsp_iu;
 
 		tmf->correlation = cpu_to_be64(evt);
@@ -2421,7 +2450,7 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	}
 
 	if (rsp_iu.cmd.status)
-		rsp_code = ibmvfc_get_err_result(&rsp_iu.cmd);
+		rsp_code = ibmvfc_get_err_result(vhost, &rsp_iu.cmd);
 
 	if (rsp_code) {
 		if (fc_rsp->flags & FCP_RSP_LEN_VALID)
-- 
2.27.0

