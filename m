Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAEB25E444
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 01:39:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjvKR1tF7zDqbv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 09:39:39 +1000 (AEST)
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
 header.s=pp1 header.b=C8ViL/s7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjv632CM5zDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 09:29:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084N21Hj163406; Fri, 4 Sep 2020 19:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=54a2dzktp+EaHtCMf6qtkuWphngdICkTER0HUdbympk=;
 b=C8ViL/s7FNY8h8WhwaEB098tY71QdtO6ajR4dK8hOk9u5znLJdD2s/bzySznfSFLEVCh
 VM29V81lqCr7ZDQBFMkI3ZDigjQ8ieI7AVC+9ddDkjklpWamCnwwKwVjv9t0uNPZFH0l
 uhhlznvHKakKr8AgbmQNqm+rLqmnn/+pAkgAannk2FzPE10CWUbqvNq/T003WNJ5dZB2
 oqRgY0l/RrRiSE4NO/jE6fMFbXNok8P9Zagclp2O+vLkINaePckAyds0MsoRUrU/WBrO
 E9zVlpQZt0DyjCCoi55g9erVGMdFGB2yLhWPFt2VJVeQQBYM2ddrep+EQ5Ay2Vqmv9Lm nQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33bwga9x0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 19:29:40 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 084NRaOt017407;
 Fri, 4 Sep 2020 23:29:39 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 337enafmse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 23:29:39 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 084NTcea57213326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Sep 2020 23:29:38 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5C542805A;
 Fri,  4 Sep 2020 23:29:38 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 426CE28059;
 Fri,  4 Sep 2020 23:29:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Sep 2020 23:29:38 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 1/2] scsi: ibmvfc: use compiler attribute defines instead
 of __attribute__()
Date: Fri,  4 Sep 2020 18:29:35 -0500
Message-Id: <20200904232936.840193-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_15:2020-09-04,
 2020-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=999 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009040191
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

Update ibmvfc.h structs to use the preferred  __packed and __aligned()
attribute macros defined in include/linux/compiler_attributes.h in place
of __attribute__().

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.h | 56 +++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 907889f1fa9d..6da23666f5be 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -133,16 +133,16 @@ struct ibmvfc_mad_common {
 	__be16 status;
 	__be16 length;
 	__be64 tag;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_npiv_login_mad {
 	struct ibmvfc_mad_common common;
 	struct srp_direct_buf buffer;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_npiv_logout_mad {
 	struct ibmvfc_mad_common common;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 #define IBMVFC_MAX_NAME 256
 
@@ -168,7 +168,7 @@ struct ibmvfc_npiv_login {
 	u8 device_name[IBMVFC_MAX_NAME];
 	u8 drc_name[IBMVFC_MAX_NAME];
 	__be64 reserved2[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_common_svc_parms {
 	__be16 fcph_version;
@@ -177,7 +177,7 @@ struct ibmvfc_common_svc_parms {
 	__be16 bb_rcv_sz; /* upper nibble is BB_SC_N */
 	__be32 ratov;
 	__be32 edtov;
-}__attribute__((packed, aligned (4)));
+} __packed __aligned(4);
 
 struct ibmvfc_service_parms {
 	struct ibmvfc_common_svc_parms common;
@@ -192,7 +192,7 @@ struct ibmvfc_service_parms {
 	__be32 ext_len;
 	__be32 reserved[30];
 	__be32 clk_sync_qos[2];
-}__attribute__((packed, aligned (4)));
+} __packed __aligned(4);
 
 struct ibmvfc_npiv_login_resp {
 	__be32 version;
@@ -217,12 +217,12 @@ struct ibmvfc_npiv_login_resp {
 	u8 drc_name[IBMVFC_MAX_NAME];
 	struct ibmvfc_service_parms service_parms;
 	__be64 reserved2;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 union ibmvfc_npiv_login_data {
 	struct ibmvfc_npiv_login login;
 	struct ibmvfc_npiv_login_resp resp;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_discover_targets_buf {
 	__be32 scsi_id[1];
@@ -239,7 +239,7 @@ struct ibmvfc_discover_targets {
 	__be32 num_avail;
 	__be32 num_written;
 	__be64 reserved[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 enum ibmvfc_fc_reason {
 	IBMVFC_INVALID_ELS_CMD_CODE	= 0x01,
@@ -283,7 +283,7 @@ struct ibmvfc_port_login {
 	struct ibmvfc_service_parms service_parms;
 	struct ibmvfc_service_parms service_parms_change;
 	__be64 reserved3[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_prli_svc_parms {
 	u8 type;
@@ -303,7 +303,7 @@ struct ibmvfc_prli_svc_parms {
 #define IBMVFC_PRLI_TARGET_FUNC			0x00000010
 #define IBMVFC_PRLI_READ_FCP_XFER_RDY_DISABLED	0x00000002
 #define IBMVFC_PRLI_WR_FCP_XFER_RDY_DISABLED	0x00000001
-}__attribute__((packed, aligned (4)));
+} __packed __aligned(4);
 
 struct ibmvfc_process_login {
 	struct ibmvfc_mad_common common;
@@ -314,7 +314,7 @@ struct ibmvfc_process_login {
 	__be16 error;			/* also fc_reason */
 	__be32 reserved2;
 	__be64 reserved3[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_query_tgt {
 	struct ibmvfc_mad_common common;
@@ -325,13 +325,13 @@ struct ibmvfc_query_tgt {
 	__be16 fc_explain;
 	__be16 fc_type;
 	__be64 reserved[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_implicit_logout {
 	struct ibmvfc_mad_common common;
 	__be64 old_scsi_id;
 	__be64 reserved[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_tmf {
 	struct ibmvfc_mad_common common;
@@ -348,7 +348,7 @@ struct ibmvfc_tmf {
 	__be32 my_cancel_key;
 	__be32 pad;
 	__be64 reserved[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 enum ibmvfc_fcp_rsp_info_codes {
 	RSP_NO_FAILURE		= 0x00,
@@ -361,7 +361,7 @@ struct ibmvfc_fcp_rsp_info {
 	u8 reserved[3];
 	u8 rsp_code;
 	u8 reserved2[4];
-}__attribute__((packed, aligned (2)));
+} __packed __aligned(2);
 
 enum ibmvfc_fcp_rsp_flags {
 	FCP_BIDI_RSP			= 0x80,
@@ -377,7 +377,7 @@ enum ibmvfc_fcp_rsp_flags {
 union ibmvfc_fcp_rsp_data {
 	struct ibmvfc_fcp_rsp_info info;
 	u8 sense[SCSI_SENSE_BUFFERSIZE + sizeof(struct ibmvfc_fcp_rsp_info)];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_fcp_rsp {
 	__be64 reserved;
@@ -388,7 +388,7 @@ struct ibmvfc_fcp_rsp {
 	__be32 fcp_sense_len;
 	__be32 fcp_rsp_len;
 	union ibmvfc_fcp_rsp_data data;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 enum ibmvfc_cmd_flags {
 	IBMVFC_SCATTERLIST	= 0x0001,
@@ -422,7 +422,7 @@ struct ibmvfc_fcp_cmd_iu {
 #define IBMVFC_WRDATA		0x01
 	u8 cdb[IBMVFC_MAX_CDB_LEN];
 	__be32 xfer_len;
-}__attribute__((packed, aligned (4)));
+} __packed __aligned(4);
 
 struct ibmvfc_cmd {
 	__be64 task_tag;
@@ -446,7 +446,7 @@ struct ibmvfc_cmd {
 	__be64 reserved3[2];
 	struct ibmvfc_fcp_cmd_iu iu;
 	struct ibmvfc_fcp_rsp rsp;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_passthru_fc_iu {
 	__be32 payload[7];
@@ -473,18 +473,18 @@ struct ibmvfc_passthru_iu {
 	__be64 scsi_id;
 	__be64 tag;
 	__be64 reserved2[2];
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_passthru_mad {
 	struct ibmvfc_mad_common common;
 	struct srp_direct_buf cmd_ioba;
 	struct ibmvfc_passthru_iu iu;
 	struct ibmvfc_passthru_fc_iu fc_iu;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_trace_start_entry {
 	u32 xfer_len;
-}__attribute__((packed));
+} __packed;
 
 struct ibmvfc_trace_end_entry {
 	u16 status;
@@ -493,7 +493,7 @@ struct ibmvfc_trace_end_entry {
 	u8 rsp_code;
 	u8 scsi_status;
 	u8 reserved;
-}__attribute__((packed));
+} __packed;
 
 struct ibmvfc_trace_entry {
 	struct ibmvfc_event *evt;
@@ -510,7 +510,7 @@ struct ibmvfc_trace_entry {
 		struct ibmvfc_trace_start_entry start;
 		struct ibmvfc_trace_end_entry end;
 	} u;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 enum ibmvfc_crq_formats {
 	IBMVFC_CMD_FORMAT		= 0x01,
@@ -545,7 +545,7 @@ struct ibmvfc_crq {
 	volatile u8 format;
 	u8 reserved[6];
 	volatile __be64 ioba;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_crq_queue {
 	struct ibmvfc_crq *msgs;
@@ -570,7 +570,7 @@ struct ibmvfc_async_crq {
 	volatile __be64 wwpn;
 	volatile __be64 node_name;
 	__be64 reserved;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 struct ibmvfc_async_crq_queue {
 	struct ibmvfc_async_crq *msgs;
@@ -590,7 +590,7 @@ union ibmvfc_iu {
 	struct ibmvfc_tmf tmf;
 	struct ibmvfc_cmd cmd;
 	struct ibmvfc_passthru_mad passthru;
-}__attribute__((packed, aligned (8)));
+} __packed __aligned(8);
 
 enum ibmvfc_target_action {
 	IBMVFC_TGT_ACTION_NONE = 0,
-- 
2.27.0

