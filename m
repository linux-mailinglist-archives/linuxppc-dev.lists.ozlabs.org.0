Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0542584D4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 02:26:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgSYT60rjzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 10:26:37 +1000 (AEST)
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
 header.s=pp1 header.b=hWFQawWJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgSW305VjzDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 10:24:28 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0810I5di085973; Mon, 31 Aug 2020 20:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=deJxd9HqlqVaOwemxvY4Rdre3L6cKhhHSqsfzIjrEAk=;
 b=hWFQawWJDC8IITJQmvX/jX8I2xnYEA6Bo526vJCHijlDRY2pT1xPcQU2v78TSDXG8VJk
 oUJ7c9qOaR2+/Fqj3gwC3jDA0b/Om4b/VnbUp3tO20HCxxwlrjxAi9qsEOE+PjiCSBnX
 1vf22/xM0NdjlODzuxBFE8EUU+/rgET8l2DszIWGGQOkDr7w5kssSbGTkywAaaU82F+4
 7ssFI+Hk6ze0t+Ac2iBHxho6iWK4ho8yn3PfmOJRqTzUUMXFTvERTc1i7CyJcJwigtYE
 eMYI1YHD804V7YKRoefFtmgYNuUvNzHREsvPbHJcXr1G6FRcn1TbfpXpYHqdLDXXsBHV +Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339bmx02v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 20:24:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0810C5v1000785;
 Tue, 1 Sep 2020 00:24:22 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 337en9h0b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 00:24:22 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0810OMRF38207946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 00:24:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA42B28058;
 Tue,  1 Sep 2020 00:24:21 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7201528060;
 Tue,  1 Sep 2020 00:24:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 00:24:21 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2] scsi: ibmvfc: interface updates for future FPIN and MQ
 support
Date: Mon, 31 Aug 2020 19:24:20 -0500
Message-Id: <20200901002420.648532-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_10:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=962 suspectscore=1 mlxscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310145
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
v1 -> v2:
	Fixup complier errors from neglected commit --amend

---
 drivers/scsi/ibmvscsi/ibmvfc.h | 66 +++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 907889f1fa9d..fe55cfc79421 100644
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
+	__be32 num_nvmeof_vas_channels;
+}__attribute__((packed, aligned (8)));
+
+struct ibmvfc_channel_setup_mad {
+	struct ibmvfc_mad_common common;
+	struct srp_direct_buf buffer;
+}__attribute__((packed, aligned (8)));
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
+	struct ibmvfc_mad_common common;
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
+	u8 fpin_status;
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

