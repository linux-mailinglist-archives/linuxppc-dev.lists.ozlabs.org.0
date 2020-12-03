Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B22CCC93
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:26:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmfpn6rzXzDrNY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 13:26:25 +1100 (AEDT)
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
 header.s=pp1 header.b=BwB6DiiY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmfPw4KyGzDr6v
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 13:08:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B322kkq095936; Wed, 2 Dec 2020 21:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PrWHp6v1nGVxzxhSWuM+ug2bmLfl1sSykYOEHPe8fKw=;
 b=BwB6DiiYiOKtkhZk1Pg9bSDFDJi11piMmCYzQD8bB8VNUhOG2SC94qXikRJxh9wdVbe9
 X2xOQ31p6jMil3VQ6DfEzjXdCJZUFTJh+YMumoZ7EycXRcwsWDJUV8KlPjst3X6BHcUt
 bHvDOWPYVyV6AO/03FiqxW2WyExSa6OAsMQeYx8eHAdlowZtpbdISsuJNOyVdn7F+zq6
 AcgqGcBV4tmvbcetqIFEy4saRIwCq1BSwb/Ztwxoj9ev4plDc8/BhbRqiS7KqtFFpgcF
 ElPBhXfBYZr9EWcHlR0kXdQN4y/YbXeHLZP0nyn1MrJ0crOsbTN5XseWd1z8pFfc7jBO RA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jfcxxfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 21:08:18 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B327Xcd010551;
 Thu, 3 Dec 2020 02:08:17 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 355rf7pxah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 02:08:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B3288JO36438716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 02:08:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C2178064;
 Thu,  3 Dec 2020 02:08:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC4C978060;
 Thu,  3 Dec 2020 02:08:14 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 02:08:14 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 09/18] ibmvfc: implement channel enquiry and setup commands
Date: Wed,  2 Dec 2020 20:07:57 -0600
Message-Id: <20201203020806.14747-10-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203020806.14747-1-tyreld@linux.ibm.com>
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_14:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=4
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030009
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
index 6b299df786fc..d584a4ce0682 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -806,6 +806,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	vhost->state = IBMVFC_NO_CRQ;
 	vhost->logged_in = 0;
+	vhost->do_enquiry = 1;
+	vhost->using_channels = 0;
 
 	/* Clean out the queue */
 	memset(crq->msgs, 0, PAGE_SIZE);
@@ -4476,6 +4478,118 @@ static void ibmvfc_discover_targets(struct ibmvfc_host *vhost)
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
@@ -4557,8 +4671,14 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
 
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
@@ -5331,9 +5451,20 @@ static int ibmvfc_alloc_mem(struct ibmvfc_host *vhost)
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
index 986ce4530382..dff26dbd912c 100644
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

