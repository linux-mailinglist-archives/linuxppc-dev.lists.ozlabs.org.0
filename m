Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E740A2B73A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:19:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbQ292J5qzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 12:19:13 +1100 (AEDT)
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
 header.s=pp1 header.b=bIvUWQXX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbPrx3NCYzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 12:11:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI13aN8118264; Tue, 17 Nov 2020 20:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P8gGOwh7TXuAOb1r1lHCU+bnwtu7EHwqe/9uSKvL5Fg=;
 b=bIvUWQXXkhzf/l4uuweGIIUJvogbRRuuhSYGFksoosVGABEu50YFmW0/51E8YtRU8GYI
 xMU43yHDQND9hXoKt9Tqw/NNulmkY/x7fHALnn9GI9maOiKzjUkZZtZrgYt8WMjLXEtC
 3SoV8DT/RjRjcOwMFoqqkVEmjRBUU2UzEDvWErT1Feh31l1tWdnGwYkUQNgOdBRXtUeY
 MN5g84/AMWZPwgX00QE1qL1ivJIyTRyklWZbvRBw4AP9/RgrPBVrjza7tW26o1pIZ94q
 r8MPlHxSAiRFBq6fM/ZCwdTPyGLYHFCHpmzTYjCRpZGCIejrvwLBE1TVmfLHaFeauhGH XQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v962758e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 20:11:10 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI188r2015324;
 Wed, 18 Nov 2020 01:11:09 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 34uyn19fqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 01:11:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI1B61Y5440214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 01:11:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9FB2BE053;
 Wed, 18 Nov 2020 01:11:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64A1BBE054;
 Wed, 18 Nov 2020 01:11:06 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 01:11:06 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 2/6] ibmvfc: add new fields for version 2 of several MADs
Date: Tue, 17 Nov 2020 19:11:00 -0600
Message-Id: <20201118011104.296999-3-tyreld@linux.ibm.com>
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
 priorityscore=1501
 adultscore=0 suspectscore=1 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180003
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

Introduce a target_wwpn field to several MADs. Its possible that a scsi
ID of a target can change due to some fabric changes. The WWPN of the
scsi target provides a better way to identify the target. Also, add
flags for receiving MAD versioning information and advertising client
support for targetWWPN with the VIOS. This latter capability flag will
be required for future clients capable of requesting multiple hardware
queues from the host adapter.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 58 ++++++++++++++++++----------------
 drivers/scsi/ibmvscsi/ibmvfc.h | 28 +++++++++++++---
 2 files changed, 55 insertions(+), 31 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 316902074abe..d33b24668367 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -149,6 +149,7 @@ static void ibmvfc_trc_start(struct ibmvfc_event *evt)
 	struct ibmvfc_host *vhost = evt->vhost;
 	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
 	struct ibmvfc_mad_common *mad = &evt->iu.mad_common;
+	struct ibmvfc_fcp_cmd_iu *iu = &vfc_cmd->v1.iu;
 	struct ibmvfc_trace_entry *entry;
 
 	entry = &vhost->trace[vhost->trace_index++];
@@ -159,11 +160,11 @@ static void ibmvfc_trc_start(struct ibmvfc_event *evt)
 
 	switch (entry->fmt) {
 	case IBMVFC_CMD_FORMAT:
-		entry->op_code = vfc_cmd->iu.cdb[0];
+		entry->op_code = iu->cdb[0];
 		entry->scsi_id = be64_to_cpu(vfc_cmd->tgt_scsi_id);
-		entry->lun = scsilun_to_int(&vfc_cmd->iu.lun);
-		entry->tmf_flags = vfc_cmd->iu.tmf_flags;
-		entry->u.start.xfer_len = be32_to_cpu(vfc_cmd->iu.xfer_len);
+		entry->lun = scsilun_to_int(&iu->lun);
+		entry->tmf_flags = iu->tmf_flags;
+		entry->u.start.xfer_len = be32_to_cpu(iu->xfer_len);
 		break;
 	case IBMVFC_MAD_FORMAT:
 		entry->op_code = be32_to_cpu(mad->opcode);
@@ -183,6 +184,8 @@ static void ibmvfc_trc_end(struct ibmvfc_event *evt)
 	struct ibmvfc_host *vhost = evt->vhost;
 	struct ibmvfc_cmd *vfc_cmd = &evt->xfer_iu->cmd;
 	struct ibmvfc_mad_common *mad = &evt->xfer_iu->mad_common;
+	struct ibmvfc_fcp_cmd_iu *iu = &vfc_cmd->v1.iu;
+	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
 	struct ibmvfc_trace_entry *entry = &vhost->trace[vhost->trace_index++];
 
 	entry->evt = evt;
@@ -192,15 +195,15 @@ static void ibmvfc_trc_end(struct ibmvfc_event *evt)
 
 	switch (entry->fmt) {
 	case IBMVFC_CMD_FORMAT:
-		entry->op_code = vfc_cmd->iu.cdb[0];
+		entry->op_code = iu->cdb[0];
 		entry->scsi_id = be64_to_cpu(vfc_cmd->tgt_scsi_id);
-		entry->lun = scsilun_to_int(&vfc_cmd->iu.lun);
-		entry->tmf_flags = vfc_cmd->iu.tmf_flags;
+		entry->lun = scsilun_to_int(&iu->lun);
+		entry->tmf_flags = iu->tmf_flags;
 		entry->u.end.status = be16_to_cpu(vfc_cmd->status);
 		entry->u.end.error = be16_to_cpu(vfc_cmd->error);
-		entry->u.end.fcp_rsp_flags = vfc_cmd->rsp.flags;
-		entry->u.end.rsp_code = vfc_cmd->rsp.data.info.rsp_code;
-		entry->u.end.scsi_status = vfc_cmd->rsp.scsi_status;
+		entry->u.end.fcp_rsp_flags = rsp->flags;
+		entry->u.end.rsp_code = rsp->data.info.rsp_code;
+		entry->u.end.scsi_status = rsp->scsi_status;
 		break;
 	case IBMVFC_MAD_FORMAT:
 		entry->op_code = be32_to_cpu(mad->opcode);
@@ -263,7 +266,7 @@ static const char *ibmvfc_get_cmd_error(u16 status, u16 error)
 static int ibmvfc_get_err_result(struct ibmvfc_cmd *vfc_cmd)
 {
 	int err;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->rsp;
+	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
 	int fc_rsp_len = be32_to_cpu(rsp->fcp_rsp_len);
 
 	if ((rsp->flags & FCP_RSP_LEN_VALID) &&
@@ -1378,6 +1381,7 @@ static int ibmvfc_map_sg_data(struct scsi_cmnd *scmd,
 	int sg_mapped;
 	struct srp_direct_buf *data = &vfc_cmd->ioba;
 	struct ibmvfc_host *vhost = dev_get_drvdata(dev);
+	struct ibmvfc_fcp_cmd_iu *iu = &vfc_cmd->v1.iu;
 
 	if (cls3_error)
 		vfc_cmd->flags |= cpu_to_be16(IBMVFC_CLASS_3_ERR);
@@ -1394,10 +1398,10 @@ static int ibmvfc_map_sg_data(struct scsi_cmnd *scmd,
 
 	if (scmd->sc_data_direction == DMA_TO_DEVICE) {
 		vfc_cmd->flags |= cpu_to_be16(IBMVFC_WRITE);
-		vfc_cmd->iu.add_cdb_len |= IBMVFC_WRDATA;
+		iu->add_cdb_len |= IBMVFC_WRDATA;
 	} else {
 		vfc_cmd->flags |= cpu_to_be16(IBMVFC_READ);
-		vfc_cmd->iu.add_cdb_len |= IBMVFC_RDDATA;
+		iu->add_cdb_len |= IBMVFC_RDDATA;
 	}
 
 	if (sg_mapped == 1) {
@@ -1516,7 +1520,7 @@ static void ibmvfc_log_error(struct ibmvfc_event *evt)
 {
 	struct ibmvfc_cmd *vfc_cmd = &evt->xfer_iu->cmd;
 	struct ibmvfc_host *vhost = evt->vhost;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->rsp;
+	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
 	struct scsi_cmnd *cmnd = evt->cmnd;
 	const char *err = unknown_error;
 	int index = ibmvfc_get_err_index(be16_to_cpu(vfc_cmd->status), be16_to_cpu(vfc_cmd->error));
@@ -1570,7 +1574,7 @@ static void ibmvfc_relogin(struct scsi_device *sdev)
 static void ibmvfc_scsi_done(struct ibmvfc_event *evt)
 {
 	struct ibmvfc_cmd *vfc_cmd = &evt->xfer_iu->cmd;
-	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->rsp;
+	struct ibmvfc_fcp_rsp *rsp = &vfc_cmd->v1.rsp;
 	struct scsi_cmnd *cmnd = evt->cmnd;
 	u32 rsp_len = 0;
 	u32 sense_len = be32_to_cpu(rsp->fcp_sense_len);
@@ -1650,17 +1654,17 @@ static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct s
 {
 	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
-	size_t offset = offsetof(struct ibmvfc_cmd, rsp);
+	size_t offset = offsetof(struct ibmvfc_cmd, v1.rsp);
 
 	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
 	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offset);
-	vfc_cmd->resp.len = cpu_to_be32(sizeof(vfc_cmd->rsp));
+	vfc_cmd->resp.len = cpu_to_be32(sizeof(vfc_cmd->v1.rsp));
 	vfc_cmd->frame_type = cpu_to_be32(IBMVFC_SCSI_FCP_TYPE);
-	vfc_cmd->payload_len = cpu_to_be32(sizeof(vfc_cmd->iu));
-	vfc_cmd->resp_len = cpu_to_be32(sizeof(vfc_cmd->rsp));
+	vfc_cmd->payload_len = cpu_to_be32(sizeof(vfc_cmd->v1.iu));
+	vfc_cmd->resp_len = cpu_to_be32(sizeof(vfc_cmd->v1.rsp));
 	vfc_cmd->cancel_key = cpu_to_be32((unsigned long)sdev->hostdata);
 	vfc_cmd->tgt_scsi_id = cpu_to_be64(rport->port_id);
-	int_to_scsilun(sdev->lun, &vfc_cmd->iu.lun);
+	int_to_scsilun(sdev->lun, &vfc_cmd->v1.iu.lun);
 
 	return vfc_cmd;
 }
@@ -1697,12 +1701,12 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 
 	vfc_cmd = ibmvfc_init_vfc_cmd(evt, cmnd->device);
 
-	vfc_cmd->iu.xfer_len = cpu_to_be32(scsi_bufflen(cmnd));
-	memcpy(vfc_cmd->iu.cdb, cmnd->cmnd, cmnd->cmd_len);
+	vfc_cmd->v1.iu.xfer_len = cpu_to_be32(scsi_bufflen(cmnd));
+	memcpy(vfc_cmd->v1.iu.cdb, cmnd->cmnd, cmnd->cmd_len);
 
 	if (cmnd->flags & SCMD_TAGGED) {
 		vfc_cmd->task_tag = cpu_to_be64(cmnd->tag);
-		vfc_cmd->iu.pri_task_attr = IBMVFC_SIMPLE_TASK;
+		vfc_cmd->v1.iu.pri_task_attr = IBMVFC_SIMPLE_TASK;
 	}
 
 	vfc_cmd->correlation = cpu_to_be64(evt);
@@ -2029,7 +2033,7 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
-	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.rsp;
+	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.v1.rsp;
 	int rsp_rc = -EBUSY;
 	unsigned long flags;
 	int rsp_code = 0;
@@ -2041,7 +2045,7 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
-		tmf->iu.tmf_flags = type;
+		tmf->v1.iu.tmf_flags = type;
 		evt->sync_iu = &rsp_iu;
 
 		init_completion(&evt->comp);
@@ -2334,7 +2338,7 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
-	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.rsp;
+	struct ibmvfc_fcp_rsp *fc_rsp = &rsp_iu.cmd.v1.rsp;
 	int rc, rsp_rc = -EBUSY;
 	unsigned long flags, timeout = IBMVFC_ABORT_TIMEOUT;
 	int rsp_code = 0;
@@ -2361,7 +2365,7 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 
 		tmf->flags = cpu_to_be16((IBMVFC_NO_MEM_DESC | IBMVFC_TMF));
-		tmf->iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
+		tmf->v1.iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
 		evt->sync_iu = &rsp_iu;
 
 		tmf->correlation = cpu_to_be64(evt);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 34debccfb142..9d58cfd774d3 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -54,6 +54,7 @@
 
 #define IBMVFC_MAD_SUCCESS		0x00
 #define IBMVFC_MAD_NOT_SUPPORTED	0xF1
+#define IBMVFC_MAD_VERSION_NOT_SUPP	0xF2
 #define IBMVFC_MAD_FAILED		0xF7
 #define IBMVFC_MAD_DRIVER_FAILED	0xEE
 #define IBMVFC_MAD_CRQ_ERROR		0xEF
@@ -168,6 +169,8 @@ struct ibmvfc_npiv_login {
 #define IBMVFC_CAN_MIGRATE		0x01
 #define IBMVFC_CAN_USE_CHANNELS		0x02
 #define IBMVFC_CAN_HANDLE_FPIN		0x04
+#define IBMVFC_CAN_USE_MAD_VERSION	0x08
+#define IBMVFC_CAN_SEND_VF_WWPN		0x10
 	__be64 node_name;
 	struct srp_direct_buf async;
 	u8 partition_name[IBMVFC_MAX_NAME];
@@ -211,7 +214,9 @@ struct ibmvfc_npiv_login_resp {
 	__be64 capabilities;
 #define IBMVFC_CAN_FLUSH_ON_HALT	0x08
 #define IBMVFC_CAN_SUPPRESS_ABTS	0x10
-#define IBMVFC_CAN_SUPPORT_CHANNELS	0x20
+#define IBMVFC_MAD_VERSION_CAP		0x20
+#define IBMVFC_HANDLE_VF_WWPN		0x40
+#define IBMVFC_CAN_SUPPORT_CHANNELS	0x80
 	__be32 max_cmds;
 	__be32 scsi_id_sz;
 	__be64 max_dma_len;
@@ -293,6 +298,7 @@ struct ibmvfc_port_login {
 	__be32 reserved2;
 	struct ibmvfc_service_parms service_parms;
 	struct ibmvfc_service_parms service_parms_change;
+	__be64 target_wwpn;
 	__be64 reserved3[2];
 } __packed __aligned(8);
 
@@ -344,6 +350,7 @@ struct ibmvfc_process_login {
 	__be16 status;
 	__be16 error;			/* also fc_reason */
 	__be32 reserved2;
+	__be64 target_wwpn;
 	__be64 reserved3[2];
 } __packed __aligned(8);
 
@@ -378,6 +385,8 @@ struct ibmvfc_tmf {
 	__be32 cancel_key;
 	__be32 my_cancel_key;
 	__be32 pad;
+	__be64 target_wwpn;
+	__be64 task_tag;
 	__be64 reserved[2];
 } __packed __aligned(8);
 
@@ -474,9 +483,19 @@ struct ibmvfc_cmd {
 	__be64 correlation;
 	__be64 tgt_scsi_id;
 	__be64 tag;
-	__be64 reserved3[2];
-	struct ibmvfc_fcp_cmd_iu iu;
-	struct ibmvfc_fcp_rsp rsp;
+	__be64 target_wwpn;
+	__be64 reserved3;
+	union {
+		struct {
+			struct ibmvfc_fcp_cmd_iu iu;
+			struct ibmvfc_fcp_rsp rsp;
+		} v1;
+		struct {
+			__be64 reserved4;
+			struct ibmvfc_fcp_cmd_iu iu;
+			struct ibmvfc_fcp_rsp rsp;
+		} v2;
+	};
 } __packed __aligned(8);
 
 struct ibmvfc_passthru_fc_iu {
@@ -503,6 +522,7 @@ struct ibmvfc_passthru_iu {
 	__be64 correlation;
 	__be64 scsi_id;
 	__be64 tag;
+	__be64 target_wwpn;
 	__be64 reserved2[2];
 } __packed __aligned(8);
 
-- 
2.27.0

