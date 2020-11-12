Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38B2AFBE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:12:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWk9V21dpzDr39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 12:12:46 +1100 (AEDT)
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
 header.s=pp1 header.b=Udxk8Q0f; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWk0M2ZpfzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 12:04:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AC13MOW109336; Wed, 11 Nov 2020 20:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=G0iUeWUSv+l3qY+84qZqXm6078tBggePEKffOnOZW0M=;
 b=Udxk8Q0f/xwsmdz35hOWIjiJg8uL88zI437AKddJrPOJe0v5H3gaHHeBDvpJ4lwZmL7L
 P1SAdKwmNvQlYPcOBfa3BnOjKxF5PFGTIBN+SoQSSaEGyQZpU5lQq/ioC66NzuG8xJU6
 oAPM8gIUu7MbL2R9GNvhEwmuhjU0hnT2LFpuZKyNCjEjmHpimfDP9/ygyTWevJ2gvGL7
 Vj9mA12dndroTJgiBXO1j/lffyRi0YTz0BLECFj9Ql+IWeEAgKV35LkgVF2lm8dgiYes
 GfhT9xXMx+LeB0N4WtlQZ1RuajdKLtIlZMS0il/jxrGhbqXfN0YonX11uyVyvgeBZMz9 mA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34rcxf96cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 20:04:47 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AC0v5Lu014705;
 Thu, 12 Nov 2020 01:04:45 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 34nk79dq5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 01:04:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AC14jqY9241324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 01:04:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BFCE28058;
 Thu, 12 Nov 2020 01:04:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9AD92805A;
 Thu, 12 Nov 2020 01:04:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Nov 2020 01:04:44 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 2/6] ibmvfc: deduplicate common ibmvfc_cmd init code
Date: Wed, 11 Nov 2020 19:04:38 -0600
Message-Id: <20201112010442.102589-2-tyreld@linux.ibm.com>
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
 suspectscore=1 clxscore=1015
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120002
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
 drivers/scsi/ibmvscsi/ibmvfc.c | 55 ++++++++++++++--------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 01fe65de9086..7b25789dba9a 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1646,6 +1646,24 @@ static inline int ibmvfc_host_chkready(struct ibmvfc_host *vhost)
 	return result;
 }
 
+static struct ibmvfc_cmd *ibmvfc_init_vfc_cmd(struct ibmvfc_event *evt, struct scsi_device *sdev)
+{
+	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
+	struct ibmvfc_cmd *vfc_cmd = &evt->iu.cmd;
+
+	memset(vfc_cmd, 0, sizeof(*vfc_cmd));
+	vfc_cmd->resp.va = cpu_to_be64(be64_to_cpu(evt->crq.ioba) + offsetof(struct ibmvfc_cmd, rsp));
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
@@ -1675,17 +1693,10 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
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
@@ -2012,7 +2023,6 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
-	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt = NULL;
 	union ibmvfc_iu rsp_iu;
@@ -2025,17 +2035,8 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
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
@@ -2327,7 +2328,6 @@ static int ibmvfc_match_evt(struct ibmvfc_event *evt, void *match)
 static int ibmvfc_abort_task_set(struct scsi_device *sdev)
 {
 	struct ibmvfc_host *vhost = shost_priv(sdev->host);
-	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
 	struct ibmvfc_cmd *tmf;
 	struct ibmvfc_event *evt, *found_evt;
 	union ibmvfc_iu rsp_iu;
@@ -2355,17 +2355,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
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

