Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C05924878BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 15:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVldW47pjz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 01:16:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fY5wuFCU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fY5wuFCU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVlbz0HgWz30Ml
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 01:15:10 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207BFFum014899; 
 Fri, 7 Jan 2022 14:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GpQOZQuy1ZT8C8LHHa0Qq7DX8wa6+/JtQgnL+BZK/gs=;
 b=fY5wuFCUk+MQCVASYVzzaWGDDyK1IbHq9Cqbb8BbsOyvtPpUNigyHXuL71wINa8RNxPk
 6235CMIcsxc6WRMYpDarqpxMEVP1qzum8e+Etn60hhAmKerSENDg5kHr59Lhk7BspIoA
 HPVTNorjWFumo7sUm1wf2cN8tiN3VLYM7VABFiikBTx+nMVON43Th1Ek+KZ4vsiB6MrN
 qnFkQ5pBwIBe0iUW4kRfz4lEaWvWQoJHYk8ivEUohGdtGwL1XQU5UglW+irat7+hZOt3
 N4Ob212Xpq7vNjKP/54VinXn3EqNHg4QoFyyC/7TWrR8kDlzK80W7lztOxUBJIL+z98T eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4y81tmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:02 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207EBEL5026772;
 Fri, 7 Jan 2022 14:15:02 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4y81tm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:01 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207E7Fig001867;
 Fri, 7 Jan 2022 14:15:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3de4xbefbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207EEuR628967242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 14:14:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8887511C064;
 Fri,  7 Jan 2022 14:14:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31ECD11C05E;
 Fri,  7 Jan 2022 14:14:54 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.110.164])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 14:14:53 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 RESEND 1/3] powerpc/pseries: Parse control memory access
 error
Date: Fri,  7 Jan 2022 19:44:26 +0530
Message-Id: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qqjB3Ds51tCIfH0PL0R4fFTCFoZbhEGU
X-Proofpoint-ORIG-GUID: UiN9_MqofcAoNhTWdJdBaIlGB6C4yXwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_05,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070097
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to parse and log control memory access
error for pseries. These changes are made according to
PAPR v2.11 10.3.2.2.12.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/ras.c | 36 ++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 56092dccfdb8..e62a0ca2611a 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -60,11 +60,17 @@ struct pseries_mc_errorlog {
 	 *      XX	2: Reserved.
 	 *        XXX	3: Type of UE error.
 	 *
-	 * For error_type != MC_ERROR_TYPE_UE
+	 * For error_type == MC_ERROR_TYPE_SLB/ERAT/TLB
 	 *   XXXXXXXX
 	 *   X		1: Effective address provided.
 	 *    XXXXX	5: Reserved.
 	 *         XX	2: Type of SLB/ERAT/TLB error.
+	 *
+	 * For error_type == MC_ERROR_TYPE_CTRL_MEM_ACCESS
+	 *   XXXXXXXX
+	 *   X		1: Error causing address provided.
+	 *    XXX	3: Type of error.
+	 *       XXXX	4: Reserved.
 	 */
 	u8	sub_err_type;
 	u8	reserved_1[6];
@@ -80,6 +86,7 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TYPE_TLB		0x04
 #define MC_ERROR_TYPE_D_CACHE		0x05
 #define MC_ERROR_TYPE_I_CACHE		0x07
+#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
 
 /* RTAS pseries MCE error sub types */
 #define MC_ERROR_UE_INDETERMINATE		0
@@ -90,6 +97,7 @@ struct pseries_mc_errorlog {
 
 #define UE_EFFECTIVE_ADDR_PROVIDED		0x40
 #define UE_LOGICAL_ADDR_PROVIDED		0x20
+#define MC_EFFECTIVE_ADDR_PROVIDED		0x80
 
 #define MC_ERROR_SLB_PARITY		0
 #define MC_ERROR_SLB_MULTIHIT		1
@@ -103,6 +111,9 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TLB_MULTIHIT		2
 #define MC_ERROR_TLB_INDETERMINATE	3
 
+#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
+#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
+
 static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 {
 	switch (mlog->error_type) {
@@ -112,6 +123,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 	case	MC_ERROR_TYPE_ERAT:
 	case	MC_ERROR_TYPE_TLB:
 		return (mlog->sub_err_type & 0x03);
+	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		return (mlog->sub_err_type & 0x70) >> 4;
 	default:
 		return 0;
 	}
@@ -656,7 +669,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 			mce_err.u.slb_error_type = MCE_SLB_ERROR_INDETERMINATE;
 			break;
 		}
-		if (mce_log->sub_err_type & 0x80)
+		if (mce_log->sub_err_type & MC_EFFECTIVE_ADDR_PROVIDED)
 			eaddr = be64_to_cpu(mce_log->effective_address);
 		break;
 	case MC_ERROR_TYPE_ERAT:
@@ -673,7 +686,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 			mce_err.u.erat_error_type = MCE_ERAT_ERROR_INDETERMINATE;
 			break;
 		}
-		if (mce_log->sub_err_type & 0x80)
+		if (mce_log->sub_err_type & MC_EFFECTIVE_ADDR_PROVIDED)
 			eaddr = be64_to_cpu(mce_log->effective_address);
 		break;
 	case MC_ERROR_TYPE_TLB:
@@ -690,7 +703,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 			mce_err.u.tlb_error_type = MCE_TLB_ERROR_INDETERMINATE;
 			break;
 		}
-		if (mce_log->sub_err_type & 0x80)
+		if (mce_log->sub_err_type & MC_EFFECTIVE_ADDR_PROVIDED)
 			eaddr = be64_to_cpu(mce_log->effective_address);
 		break;
 	case MC_ERROR_TYPE_D_CACHE:
@@ -699,6 +712,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 	case MC_ERROR_TYPE_I_CACHE:
 		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
 		break;
+	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		mce_err.error_type = MCE_ERROR_TYPE_RA;
+		switch (err_sub_type) {
+		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
+			break;
+		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
+			break;
+		}
+		if (mce_log->sub_err_type & MC_EFFECTIVE_ADDR_PROVIDED)
+			eaddr = be64_to_cpu(mce_log->effective_address);
+		break;
 	case MC_ERROR_TYPE_UNKNOWN:
 	default:
 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
-- 
2.31.1

