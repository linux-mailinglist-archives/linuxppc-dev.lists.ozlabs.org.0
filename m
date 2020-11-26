Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B3A2C4D18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:04:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChLfx0yc8zDqvW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:04:41 +1100 (AEDT)
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
 header.s=pp1 header.b=chjvHdDl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChLJQ35pQzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 12:48:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ1W8Fd195497; Wed, 25 Nov 2020 20:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NDdYmJuc3BXFPD4AML0nHicyzL5GAWnQ7TMkIgkrLjs=;
 b=chjvHdDlbKgwCxkICxR527pUyzMRlkqPf8/PrjoaCb4K3yiEvmVDGaXrigvgedaLDXLU
 BVQZqM/KpnXMlQ52i0SQN3UOM7yX20gi/kM5Axpl1AH/QKZSDiGfWjOsPjFu6S0GjqQl
 ZTExHvImVajGRRVcdNnklq8AKuVXhY+UNOZ+agkYIfwb3VUPJl2MwV+N7TrDqQtIm2VZ
 Xd4jougOfbVAdHTbloaJJ165njaDNZWjWECooFbSqPm/YoXKfaqRslZ4H5vxTAl2yuQN
 flRl266C9r6lia8cCsVnegaGjvCQ547cIT3TJJA4zU2iV67BDu+bpYDWE/b9/BkzlA68 Dg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351q2uts90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 20:48:35 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ1lCFl010295;
 Thu, 26 Nov 2020 01:48:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 35133p438h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 01:48:34 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ1mXdL11403878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 01:48:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D5906E052;
 Thu, 26 Nov 2020 01:48:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAD0C6E04E;
 Thu, 26 Nov 2020 01:48:32 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 01:48:32 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 09/13] ibmvfc: implement channel enquiry and setup commands
Date: Wed, 25 Nov 2020 19:48:20 -0600
Message-Id: <20201126014824.123831-10-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126014824.123831-1-tyreld@linux.ibm.com>
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_14:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=4 impostorscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260005
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
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 135 ++++++++++++++++++++++++++++++++-
 drivers/scsi/ibmvscsi/ibmvfc.h |   3 +
 2 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 53db6da20923..40a945712bdb 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -804,6 +804,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	vhost->state = IBMVFC_NO_CRQ;
 	vhost->logged_in = 0;
+	vhost->do_enquiry = 1;
+	vhost->using_channels = 0;
 
 	/* Clean out the queue */
 	memset(crq->msgs, 0, PAGE_SIZE);
@@ -4462,6 +4464,118 @@ static void ibmvfc_discover_targets(struct ibmvfc_host *vhost)
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
+	struct ibmvfc_event *evt = ibmvfc_get_event(vhost);
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
+		break;
+	case IBMVFC_MAD_FAILED:
+		level += ibmvfc_retry_host_init(vhost);
+		ibmvfc_log(vhost, level, "Channel Enquiry failed\n");
+		ibmvfc_free_event(evt);
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
+	struct ibmvfc_event *evt = ibmvfc_get_event(vhost);
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
@@ -4543,8 +4657,14 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
 
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
@@ -5313,9 +5433,20 @@ static int ibmvfc_alloc_mem(struct ibmvfc_host *vhost)
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
index d80c7eeef409..04086ffbfca7 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -842,10 +842,13 @@ struct ibmvfc_host {
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

