Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E45932F231D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:36:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF98B5gNdzDqs3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:36:26 +1100 (AEDT)
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
 header.s=pp1 header.b=s05XxKIt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8cm4gRHzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:40 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BN1QnQ093660; Mon, 11 Jan 2021 18:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tRxjrYeZ9O21Nei950L0agvbsa0y2iWrGrLttEO7+gU=;
 b=s05XxKIty3kqsE9Bh4XGLX4AqENk1qPcoeYznAaOVHF2pYlgSxGEcXsZ2+/7HhILOW9x
 EV/JTQo5idHLzw1mJ/ImeFf6VoQnd4W8OCez7VHDSfOgz+5Q1dsjUeXxJk68Llb5XjsH
 Id6f8lMuuUdRWzGuGrCrcstn+c5Vs+jSFMtRJUVnqRj0EjL6dpBCUyaggKJVHPvVUtvY
 iSBF0f4hBL23z3Ft0m0Gpf5BDXiioi2ORnM1Uzi3LbDZn3tmlMZ5yaKJZtBnfu34Hca9
 aTD3dXmeLjHTVQroUrKyfiM1Grrt8TbOQew+vg4VCf1tZEiRz8LCHcEH8FsRHqDenLJJ BQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360wgfmeja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:37 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN81ms025543;
 Mon, 11 Jan 2021 23:12:37 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 35y4496e2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCZHC29360520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D9AA78063;
 Mon, 11 Jan 2021 23:12:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B05527805C;
 Mon, 11 Jan 2021 23:12:34 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:34 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 15/21] ibmvfc: send commands down HW Sub-CRQ when
 channelized
Date: Mon, 11 Jan 2021 17:12:19 -0600
Message-Id: <20210111231225.105347-16-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210111231225.105347-1-tyreld@linux.ibm.com>
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_32:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110126
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

When the client has negotiated the use of channels all vfcFrames are
required to go down a Sub-CRQ channel or it is a protocoal violation. If
the adapter state is channelized submit vfcFrames to the appropriate
Sub-CRQ via the h_send_sub_crq() helper.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 39 ++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 3f3cc37a263f..865b87881d86 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -704,6 +704,15 @@ static int ibmvfc_send_crq(struct ibmvfc_host *vhost, u64 word1, u64 word2)
 	return plpar_hcall_norets(H_SEND_CRQ, vdev->unit_address, word1, word2);
 }
 
+static int ibmvfc_send_sub_crq(struct ibmvfc_host *vhost, u64 cookie, u64 word1,
+			       u64 word2, u64 word3, u64 word4)
+{
+	struct vio_dev *vdev = to_vio_dev(vhost->dev);
+
+	return plpar_hcall_norets(H_SEND_SUB_CRQ, vdev->unit_address, cookie,
+				  word1, word2, word3, word4);
+}
+
 /**
  * ibmvfc_send_crq_init - Send a CRQ init message
  * @vhost:	ibmvfc host struct
@@ -1623,8 +1632,17 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 
 	mb();
 
-	if ((rc = ibmvfc_send_crq(vhost, be64_to_cpu(crq_as_u64[0]),
-				  be64_to_cpu(crq_as_u64[1])))) {
+	if (evt->queue->fmt == IBMVFC_SUB_CRQ_FMT)
+		rc = ibmvfc_send_sub_crq(vhost,
+					 evt->queue->vios_cookie,
+					 be64_to_cpu(crq_as_u64[0]),
+					 be64_to_cpu(crq_as_u64[1]),
+					 0, 0);
+	else
+		rc = ibmvfc_send_crq(vhost, be64_to_cpu(crq_as_u64[0]),
+				     be64_to_cpu(crq_as_u64[1]));
+
+	if (rc) {
 		list_del(&evt->queue_list);
 		spin_unlock_irqrestore(&evt->queue->l_lock, flags);
 		del_timer(&evt->timer);
@@ -1842,6 +1860,7 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	struct ibmvfc_event *evt;
 	u32 tag_and_hwq = blk_mq_unique_tag(cmnd->request);
 	u16 hwq = blk_mq_unique_tag_to_hwq(tag_and_hwq);
+	u16 scsi_channel;
 	int rc;
 
 	if (unlikely((rc = fc_remote_port_chkready(rport))) ||
@@ -1852,7 +1871,13 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	}
 
 	cmnd->result = (DID_OK << 16);
-	evt = ibmvfc_get_event(&vhost->crq);
+	if (vhost->using_channels) {
+		scsi_channel = hwq % vhost->scsi_scrqs.active_queues;
+		evt = ibmvfc_get_event(&vhost->scsi_scrqs.scrqs[scsi_channel]);
+		evt->hwq = hwq % vhost->scsi_scrqs.active_queues;
+	} else
+		evt = ibmvfc_get_event(&vhost->crq);
+
 	ibmvfc_init_event(evt, ibmvfc_scsi_done, IBMVFC_CMD_FORMAT);
 	evt->cmnd = cmnd;
 
@@ -1868,8 +1893,6 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	}
 
 	vfc_cmd->correlation = cpu_to_be64((u64)evt);
-	if (vhost->using_channels)
-		evt->hwq = hwq % vhost->scsi_scrqs.active_queues;
 
 	if (likely(!(rc = ibmvfc_map_sg_data(cmnd, evt, vfc_cmd, vhost->dev))))
 		return ibmvfc_send_event(evt, vhost, 0);
@@ -2200,7 +2223,11 @@ static int ibmvfc_reset_device(struct scsi_device *sdev, int type, char *desc)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	if (vhost->state == IBMVFC_ACTIVE) {
-		evt = ibmvfc_get_event(&vhost->crq);
+		if (vhost->using_channels)
+			evt = ibmvfc_get_event(&vhost->scsi_scrqs.scrqs[0]);
+		else
+			evt = ibmvfc_get_event(&vhost->crq);
+
 		ibmvfc_init_event(evt, ibmvfc_sync_completion, IBMVFC_CMD_FORMAT);
 		tmf = ibmvfc_init_vfc_cmd(evt, sdev);
 		iu = ibmvfc_get_fcp_iu(vhost, tmf);
-- 
2.27.0

