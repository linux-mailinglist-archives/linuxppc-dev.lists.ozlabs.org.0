Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D32F6C9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 21:54:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGxPp1BYhzDscY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 07:54:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HY4RpHhB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGww16LxDzDrQp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 07:32:01 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EKKnAP186082; Thu, 14 Jan 2021 15:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l431NZQBSk+btUL8OiC0lBjrprIvUfWPsnRrx67uZ3g=;
 b=HY4RpHhBJN2zRnZ7PE6O0aj4pvEqTQm0RnqzOUUa3EpuJRFMOiKtO53M5vPt28X9aiOt
 GTNUbdfvK38ZYYT8tcpCteyuJTbzzMbKzg4anyLyZdm9k5bW+0VPbRMPwNqP7mBGA2zK
 8ApYLN3f+kKg0MrjNQrC64yfylU1Lq8xp6AIW0rjWgEA9Dt8Dwkj4oBjbAYsrh3xtex+
 gDfYwUCoZ+QMwEqittul21WyCXFtNfla608IQfZ3c5nJhexy5XOFqegGC1UIGLwzRgYb
 TIldi0w9Pz8xruBYh7bK3gIkzhjg4dhckSr6/Kow/19xJpvdppBmtSa3zJwAFTyNSsfu 9Q== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362vwr07db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:31:58 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EKRSh4013849;
 Thu, 14 Jan 2021 20:31:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 35y449fsv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 20:31:56 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EKVtLN10158564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 20:31:55 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FF7D6E04C;
 Thu, 14 Jan 2021 20:31:55 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F07A16E050;
 Thu, 14 Jan 2021 20:31:54 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 20:31:54 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 12/21] ibmvfc: implement channel enquiry and setup commands
Date: Thu, 14 Jan 2021 14:31:39 -0600
Message-Id: <20210114203148.246656-13-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210114203148.246656-1-tyreld@linux.ibm.com>
References: <20210114203148.246656-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_07:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140115
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

New NPIV_ENQUIRY_CHANNEL and NPIV_SETUP_CHANNEL management datagrams
(MADs) were defined in a previous patchset. If the client advertises a
desire to use channels and the partner VIOS is channel capable then the
client must proceed with channel enquiry to determine the maximum number
of channels the VIOS is capable of providing, and registering SubCRQs
via channel setup with the VIOS immediately following NPIV Login. This
handshaking should not be performed for subsequent NPIV Logins unless
the CRQ connection has been reset.

Implement these two new MADs and issue them following a successful NPIV
login where the VIOS has set the SUPPORT_CHANNELS capability bit in the
NPIV Login response.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 135 ++++++++++++++++++++++++++++++++-
 drivers/scsi/ibmvscsi/ibmvfc.h |   3 +
 2 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d3d7c6b53d4f..a00f38558613 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -909,6 +909,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	spin_lock(vhost->crq.q_lock);
 	vhost->state = IBMVFC_NO_CRQ;
 	vhost->logged_in = 0;
+	vhost->do_enquiry = 1;
+	vhost->using_channels = 0;
 
 	/* Clean out the queue */
 	memset(crq->msgs.crq, 0, PAGE_SIZE);
@@ -4586,6 +4588,118 @@ static void ibmvfc_discover_targets(struct ibmvfc_host *vhost)
 		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
 }
 
+static void ibmvfc_channel_setup_done(struct ibmvfc_event *evt)
+{
+	struct ibmvfc_host *vhost = evt->vhost;
+	u32 mad_status = be16_to_cpu(evt->xfer_iu->channel_setup.common.status);
+	int level = IBMVFC_DEFAULT_LOG_LEVEL;
+
+	ibmvfc_free_event(evt);
+
+	switch (mad_status) {
+	case IBMVFC_MAD_SUCCESS:
+		ibmvfc_dbg(vhost, "Channel Setup succeded\n");
+		vhost->do_enquiry = 0;
+		break;
+	case IBMVFC_MAD_FAILED:
+		level += ibmvfc_retry_host_init(vhost);
+		ibmvfc_log(vhost, level, "Channel Setup failed\n");
+		fallthrough;
+	case IBMVFC_MAD_DRIVER_FAILED:
+		return;
+	default:
+		dev_err(vhost->dev, "Invalid Channel Setup response: 0x%x\n",
+			mad_status);
+		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
+		return;
+	}
+
+	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY);
+	wake_up(&vhost->work_wait_q);
+}
+
+static void ibmvfc_channel_setup(struct ibmvfc_host *vhost)
+{
+	struct ibmvfc_channel_setup_mad *mad;
+	struct ibmvfc_channel_setup *setup_buf = vhost->channel_setup_buf;
+	struct ibmvfc_event *evt = ibmvfc_get_event(&vhost->crq);
+
+	memset(setup_buf, 0, sizeof(*setup_buf));
+	setup_buf->flags = cpu_to_be32(IBMVFC_CANCEL_CHANNELS);
+
+	ibmvfc_init_event(evt, ibmvfc_channel_setup_done, IBMVFC_MAD_FORMAT);
+	mad = &evt->iu.channel_setup;
+	memset(mad, 0, sizeof(*mad));
+	mad->common.version = cpu_to_be32(1);
+	mad->common.opcode = cpu_to_be32(IBMVFC_CHANNEL_SETUP);
+	mad->common.length = cpu_to_be16(sizeof(*mad));
+	mad->buffer.va = cpu_to_be64(vhost->channel_setup_dma);
+	mad->buffer.len = cpu_to_be32(sizeof(*vhost->channel_setup_buf));
+
+	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_INIT_WAIT);
+
+	if (!ibmvfc_send_event(evt, vhost, default_timeout))
+		ibmvfc_dbg(vhost, "Sent channel setup\n");
+	else
+		ibmvfc_link_down(vhost, IBMVFC_LINK_DOWN);
+}
+
+static void ibmvfc_channel_enquiry_done(struct ibmvfc_event *evt)
+{
+	struct ibmvfc_host *vhost = evt->vhost;
+	struct ibmvfc_channel_enquiry *rsp = &evt->xfer_iu->channel_enquiry;
+	u32 mad_status = be16_to_cpu(rsp->common.status);
+	int level = IBMVFC_DEFAULT_LOG_LEVEL;
+
+	switch (mad_status) {
+	case IBMVFC_MAD_SUCCESS:
+		ibmvfc_dbg(vhost, "Channel Enquiry succeeded\n");
+		vhost->max_vios_scsi_channels = be32_to_cpu(rsp->num_scsi_subq_channels);
+		ibmvfc_free_event(evt);
+		break;
+	case IBMVFC_MAD_FAILED:
+		level += ibmvfc_retry_host_init(vhost);
+		ibmvfc_log(vhost, level, "Channel Enquiry failed\n");
+		fallthrough;
+	case IBMVFC_MAD_DRIVER_FAILED:
+		ibmvfc_free_event(evt);
+		return;
+	default:
+		dev_err(vhost->dev, "Invalid Channel Enquiry response: 0x%x\n",
+			mad_status);
+		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
+		ibmvfc_free_event(evt);
+		return;
+	}
+
+	ibmvfc_channel_setup(vhost);
+}
+
+static void ibmvfc_channel_enquiry(struct ibmvfc_host *vhost)
+{
+	struct ibmvfc_channel_enquiry *mad;
+	struct ibmvfc_event *evt = ibmvfc_get_event(&vhost->crq);
+
+	ibmvfc_init_event(evt, ibmvfc_channel_enquiry_done, IBMVFC_MAD_FORMAT);
+	mad = &evt->iu.channel_enquiry;
+	memset(mad, 0, sizeof(*mad));
+	mad->common.version = cpu_to_be32(1);
+	mad->common.opcode = cpu_to_be32(IBMVFC_CHANNEL_ENQUIRY);
+	mad->common.length = cpu_to_be16(sizeof(*mad));
+
+	if (IBMVFC_MIG_NO_SUB_TO_CRQ)
+		mad->flags |= cpu_to_be32(IBMVFC_NO_CHANNELS_TO_CRQ_SUPPORT);
+	if (IBMVFC_MIG_NO_N_TO_M)
+		mad->flags |= cpu_to_be32(IBMVFC_NO_N_TO_M_CHANNELS_SUPPORT);
+
+	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_INIT_WAIT);
+
+	if (!ibmvfc_send_event(evt, vhost, default_timeout))
+		ibmvfc_dbg(vhost, "Send channel enquiry\n");
+	else
+		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
+}
+
 /**
  * ibmvfc_npiv_login_done - Completion handler for NPIV Login
  * @evt:	ibmvfc event struct
@@ -4667,8 +4781,14 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
 
 	vhost->host->can_queue = be32_to_cpu(rsp->max_cmds) - IBMVFC_NUM_INTERNAL_REQ;
 	vhost->host->max_sectors = npiv_max_sectors;
-	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY);
-	wake_up(&vhost->work_wait_q);
+
+	if (ibmvfc_check_caps(vhost, IBMVFC_CAN_SUPPORT_CHANNELS) && vhost->do_enquiry) {
+		ibmvfc_channel_enquiry(vhost);
+	} else {
+		vhost->do_enquiry = 0;
+		ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY);
+		wake_up(&vhost->work_wait_q);
+	}
 }
 
 /**
@@ -5477,9 +5597,20 @@ static int ibmvfc_alloc_mem(struct ibmvfc_host *vhost)
 		goto free_trace;
 	}
 
+	vhost->channel_setup_buf = dma_alloc_coherent(dev, sizeof(*vhost->channel_setup_buf),
+						      &vhost->channel_setup_dma,
+						      GFP_KERNEL);
+
+	if (!vhost->channel_setup_buf) {
+		dev_err(dev, "Couldn't allocate Channel Setup buffer\n");
+		goto free_tgt_pool;
+	}
+
 	LEAVE;
 	return 0;
 
+free_tgt_pool:
+	mempool_destroy(vhost->tgt_pool);
 free_trace:
 	kfree(vhost->trace);
 free_disc_buffer:
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index bdafe9956649..3d76cd3c1fd9 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -854,10 +854,13 @@ struct ibmvfc_host {
 	struct ibmvfc_npiv_login login_info;
 	union ibmvfc_npiv_login_data *login_buf;
 	dma_addr_t login_buf_dma;
+	struct ibmvfc_channel_setup *channel_setup_buf;
+	dma_addr_t channel_setup_dma;
 	int disc_buf_sz;
 	int log_level;
 	struct ibmvfc_discover_targets_entry *disc_buf;
 	struct mutex passthru_mutex;
+	int max_vios_scsi_channels;
 	int task_set;
 	int init_retries;
 	int discovery_threads;
-- 
2.27.0

