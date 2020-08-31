Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79273257F80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 19:20:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgH5s1fVzzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 03:20:33 +1000 (AEST)
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
 header.s=pp1 header.b=S9JWYySm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgH402v1gzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 03:18:55 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VHA941062814; Mon, 31 Aug 2020 13:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/6LxVpGXmEiswOQu2YnKhevcXSNxsHH3pExsRb7kpGQ=;
 b=S9JWYySmXGjDjE7lINZmEFCidpz5SR+WvN9ihbB+y4K/1NfoDao9wBwt6c9j5+KmbTsP
 09kBieMreUPZ8cVHv8w43kskn+TV1IHKyciMDEsvyHooDEg/6rWRmqKY3PUhVnCpK2+h
 v/O0HeZ2A1fi7r/oibcS5RsA+94xioZ/5009h1sasz+5SxbjEdcRrzNcPNFVDAoZQX2G
 qYkQ8Dg0VSChaoT8jnyJUbZuR8UmJCrCPNaMxrAnafUIdyZeP1rd6GAdF9BFZWjncgnU
 5Bjf5cWNKBNTqySlDbxiQ3kQkICPDPcVe4LvusTP4fl0LE1UsrOR32QNubRabUvFjB/a vg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3395cb05hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 13:18:49 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VGwkoc001453;
 Mon, 31 Aug 2020 17:18:47 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 337en99m7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 17:18:47 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VHIlwM13828892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 17:18:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21E9128067;
 Mon, 31 Aug 2020 17:18:47 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4B2D28058;
 Mon, 31 Aug 2020 17:18:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 17:18:46 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] scsi: ibmvfc: interface updates for future FPIN and MQ support
Date: Mon, 31 Aug 2020 12:18:44 -0500
Message-Id: <20200831171844.635729-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_08:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=855 clxscore=1011
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=1
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310099
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

VIOS partitions with SLI-4 enabled Emulex adapters will be capable of
driving IO in parallel through mulitple work queues or channels, and
with new hyperviosr firmware that supports multiple interrupt sources
an ibmvfc NPIV single initiator can be modified to exploit end to end
channelization in a PowerVM environment.

VIOS hosts will also be able to expose fabric perfromance impact
notifications (FPIN) via a new asynchronous event to ibmvfc clients that
advertise support via IBMVFC_CAN_HANDLE_FPIN in their capabilities flag
during NPIV_LOGIN.

This patch introduces three new Managment Datagrams (MADs) for
channelization support negotiation as well as the FPIN asynchronous
event and FPIN status flags. Follow up work is required to plumb the
ibmvfc client driver to use these new interfaces.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.h | 66 +++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 907889f1fa9d..801681b63daa 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -124,6 +124,9 @@ enum ibmvfc_mad_types {
 	IBMVFC_PASSTHRU		= 0x0200,
 	IBMVFC_TMF_MAD		= 0x0100,
 	IBMVFC_NPIV_LOGOUT	= 0x0800,
+	IBMVFC_CHANNEL_ENQUIRY	= 0x1000,
+	IBMVFC_CHANNEL_SETUP	= 0x2000,
+	IBMVFC_CONNECTION_INFO	= 0x4000,
 };
 
 struct ibmvfc_mad_common {
@@ -162,6 +165,8 @@ struct ibmvfc_npiv_login {
 	__be32 max_cmds;
 	__be64 capabilities;
 #define IBMVFC_CAN_MIGRATE		0x01
+#define IBMVFC_CAN_USE_CHANNELS		0x02
+#define IBMVFC_CAN_HANDLE_FPIN		0x04
 	__be64 node_name;
 	struct srp_direct_buf async;
 	u8 partition_name[IBMVFC_MAX_NAME];
@@ -204,6 +209,7 @@ struct ibmvfc_npiv_login_resp {
 	__be64 capabilities;
 #define IBMVFC_CAN_FLUSH_ON_HALT	0x08
 #define IBMVFC_CAN_SUPPRESS_ABTS	0x10
+#define IBMVFC_CAN_SUPPORT_CHANNELS	0x20
 	__be32 max_cmds;
 	__be32 scsi_id_sz;
 	__be64 max_dma_len;
@@ -482,6 +488,52 @@ struct ibmvfc_passthru_mad {
 	struct ibmvfc_passthru_fc_iu fc_iu;
 }__attribute__((packed, aligned (8)));
 
+struct ibmvfc_channel_enquiry {
+	struct ibmvfc_mad_common common;
+	__be32 flags;
+#define IBMVFC_NO_CHANNELS_TO_CRQ_SUPPORT	0x01
+#define IBMVFC_SUPPORT_VARIABLE_SUBQ_MSG	0x02
+#define IBMVFC_NO_N_TO_M_CHANNELS_SUPPORT	0x04
+	__be32 num_scsi_subq_channels;
+	__be32 num_nvmeof_subq_channels;
+	__be32 num_scsi_vas_channels;
+	__be32 num nvmeof_vas_channels;
+}__attribute__((packed, aligned (8)));
+
+struct ibmvfc_channel_setup_mad {
+	struct ibmvfc_mad_common common;
+	struct srp_direct_buf buffer;
+}__attrribute__((packed, aligned (8)));
+
+#define IBMVFC_MAX_CHANNELS	502
+
+struct ibmvfc_channel_setup {
+	__be32 flags;
+#define IBMVFC_CANCEL_CHANNELS		0x01
+#define IBMVFC_USE_BUFFER		0x02
+#define IBMVFC_CHANNELS_CANCELED	0x04
+	__be32 reserved;
+	__be32 num_scsi_subq_channels;
+	__be32 num_nvmeof_subq_channels;
+	__be32 num_scsi_vas_channels;
+	__be32 num_nvmeof_vas_channels;
+	struct srp_direct_buf buffer;
+	__be64 reserved2[5];
+	__be64 channel_handles[IBMVFC_MAX_CHANNELS];
+}__attribute__((packed, aligned (8)));
+
+struct ibmvfc_connection_info {
+	struct ibmvfc_madd_common common;
+	__be64 information_bits;
+#define IBMVFC_NO_FC_IO_CHANNEL		0x01
+#define IBMVFC_NO_PHYP_VAS		0x02
+#define IBMVFC_NO_PHYP_SUBQ		0x04
+#define IBMVFC_PHYP_DEPRECATED_SUBQ	0x08
+#define IBMVFC_PHYP_PRESERVED_SUBQ	0x10
+#define IBMVFC_PHYP_FULL_SUBQ		0x20
+	__be64 reserved[16];
+}__attribute__((packed, aligned (8)));
+
 struct ibmvfc_trace_start_entry {
 	u32 xfer_len;
 }__attribute__((packed));
@@ -532,6 +584,7 @@ enum ibmvfc_async_event {
 	IBMVFC_AE_HALT			= 0x0400,
 	IBMVFC_AE_RESUME			= 0x0800,
 	IBMVFC_AE_ADAPTER_FAILED	= 0x1000,
+	IBMVFC_AE_FPIN			= 0x2000,
 };
 
 struct ibmvfc_async_desc {
@@ -560,10 +613,18 @@ enum ibmvfc_ae_link_state {
 	IBMVFC_AE_LS_LINK_DEAD		= 0x08,
 };
 
+enum ibmvfc_ae_fpin_status {
+	IBMVFC_AE_FPIN_LINK_CONGESTED	= 0x1,
+	IBMVFC_AE_FPIN_PORT_CONGESTED	= 0x2,
+	IBMVFC_AE_FPIN_PORT_CLEARED	= 0x3,
+	IBMVFC_AE_FPIN_PORT_DEGRADED	= 0x4,
+};
+
 struct ibmvfc_async_crq {
 	volatile u8 valid;
 	u8 link_state;
-	u8 pad[2];
+	u8 fpin_status
+	u8 pad;
 	__be32 pad2;
 	volatile __be64 event;
 	volatile __be64 scsi_id;
@@ -590,6 +651,9 @@ union ibmvfc_iu {
 	struct ibmvfc_tmf tmf;
 	struct ibmvfc_cmd cmd;
 	struct ibmvfc_passthru_mad passthru;
+	struct ibmvfc_channel_enquiry channel_enquiry;
+	struct ibmvfc_channel_setup_mad channel_setup;
+	struct ibmvfc_connection_info connection_info;
 }__attribute__((packed, aligned (8)));
 
 enum ibmvfc_target_action {
-- 
2.27.0

