Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08E1B9713
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 08:15:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499ZJB31YmzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 16:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499ZGF64DQzDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 16:13:25 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R647SF085738
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 02:13:22 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30metutv3h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 02:13:22 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Mon, 27 Apr 2020 07:12:53 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 Apr 2020 07:12:50 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R6DHxK65601728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 06:13:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 764B7AE04D;
 Mon, 27 Apr 2020 06:13:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2646FAE055;
 Mon, 27 Apr 2020 06:13:16 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.103.164])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 06:13:15 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/mce: Add helper functions to remove duplicate code
Date: Mon, 27 Apr 2020 11:43:07 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 20042706-0012-0000-0000-000003AB577D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042706-0013-0000-0000-000021E8B419
Message-Id: <20200427061308.26204-1-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_02:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004270050
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
Cc: mahesh@linux.vnet.ibm.com, Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mce_handle_ierror() and mce_handle_derror() has some duplicate
code to recover from the recoverable MCE errors and to get the
MCE error sub-type while generating MCE error info, Add helper
functions to remove it.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/mce_power.c | 136 +++++++++++++-------------------
 1 file changed, 56 insertions(+), 80 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 067b094bfeff..143e79450e93 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -391,6 +391,56 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	return -1;
 }
 
+static int mce_correct_err(unsigned int err_type)
+{
+	int handled = 0;
+
+	/* attempt to correct the error */
+	switch (err_type) {
+	case MCE_ERROR_TYPE_SLB:
+		if (local_paca->in_mce == 1)
+			slb_save_contents(local_paca->mce_faulty_slbs);
+		handled = mce_flush(MCE_FLUSH_SLB);
+		break;
+	case MCE_ERROR_TYPE_ERAT:
+		handled = mce_flush(MCE_FLUSH_ERAT);
+		break;
+	case MCE_ERROR_TYPE_TLB:
+		handled = mce_flush(MCE_FLUSH_TLB);
+		break;
+	}
+	return handled;
+}
+
+static void mce_err_get_sub_type(struct mce_error_info *mce_err,
+				 unsigned int err_type,
+				 unsigned int err_sub_type)
+{
+	switch (err_type) {
+	case MCE_ERROR_TYPE_UE:
+		mce_err->u.ue_error_type = err_sub_type;
+		break;
+	case MCE_ERROR_TYPE_SLB:
+		mce_err->u.slb_error_type = err_sub_type;
+		break;
+	case MCE_ERROR_TYPE_ERAT:
+		mce_err->u.erat_error_type = err_sub_type;
+		break;
+	case MCE_ERROR_TYPE_TLB:
+		mce_err->u.tlb_error_type = err_sub_type;
+		break;
+	case MCE_ERROR_TYPE_USER:
+		mce_err->u.user_error_type = err_sub_type;
+		break;
+	case MCE_ERROR_TYPE_RA:
+		mce_err->u.ra_error_type = err_sub_type;
+		break;
+	case MCE_ERROR_TYPE_LINK:
+		mce_err->u.link_error_type = err_sub_type;
+		break;
+	}
+}
+
 static int mce_handle_ierror(struct pt_regs *regs,
 		const struct mce_ierror_table table[],
 		struct mce_error_info *mce_err, uint64_t *addr,
@@ -405,48 +455,13 @@ static int mce_handle_ierror(struct pt_regs *regs,
 	for (i = 0; table[i].srr1_mask; i++) {
 		if ((srr1 & table[i].srr1_mask) != table[i].srr1_value)
 			continue;
-
-		/* attempt to correct the error */
-		switch (table[i].error_type) {
-		case MCE_ERROR_TYPE_SLB:
-			if (local_paca->in_mce == 1)
-				slb_save_contents(local_paca->mce_faulty_slbs);
-			handled = mce_flush(MCE_FLUSH_SLB);
-			break;
-		case MCE_ERROR_TYPE_ERAT:
-			handled = mce_flush(MCE_FLUSH_ERAT);
-			break;
-		case MCE_ERROR_TYPE_TLB:
-			handled = mce_flush(MCE_FLUSH_TLB);
-			break;
-		}
+		handled = mce_correct_err(table[i].error_type);
 
 		/* now fill in mce_error_info */
 		mce_err->error_type = table[i].error_type;
 		mce_err->error_class = table[i].error_class;
-		switch (table[i].error_type) {
-		case MCE_ERROR_TYPE_UE:
-			mce_err->u.ue_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_SLB:
-			mce_err->u.slb_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_ERAT:
-			mce_err->u.erat_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_TLB:
-			mce_err->u.tlb_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_USER:
-			mce_err->u.user_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_RA:
-			mce_err->u.ra_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_LINK:
-			mce_err->u.link_error_type = table[i].error_subtype;
-			break;
-		}
+		mce_err_get_sub_type(mce_err, table[i].error_type,
+				     table[i].error_subtype);
 		mce_err->sync_error = table[i].sync_error;
 		mce_err->severity = table[i].severity;
 		mce_err->initiator = table[i].initiator;
@@ -492,25 +507,7 @@ static int mce_handle_derror(struct pt_regs *regs,
 	for (i = 0; table[i].dsisr_value; i++) {
 		if (!(dsisr & table[i].dsisr_value))
 			continue;
-
-		/* attempt to correct the error */
-		switch (table[i].error_type) {
-		case MCE_ERROR_TYPE_SLB:
-			if (local_paca->in_mce == 1)
-				slb_save_contents(local_paca->mce_faulty_slbs);
-			if (mce_flush(MCE_FLUSH_SLB))
-				handled = 1;
-			break;
-		case MCE_ERROR_TYPE_ERAT:
-			if (mce_flush(MCE_FLUSH_ERAT))
-				handled = 1;
-			break;
-		case MCE_ERROR_TYPE_TLB:
-			if (mce_flush(MCE_FLUSH_TLB))
-				handled = 1;
-			break;
-		}
-
+		handled = mce_correct_err(table[i].error_type);
 		/*
 		 * Attempt to handle multiple conditions, but only return
 		 * one. Ensure uncorrectable errors are first in the table
@@ -522,29 +519,8 @@ static int mce_handle_derror(struct pt_regs *regs,
 		/* now fill in mce_error_info */
 		mce_err->error_type = table[i].error_type;
 		mce_err->error_class = table[i].error_class;
-		switch (table[i].error_type) {
-		case MCE_ERROR_TYPE_UE:
-			mce_err->u.ue_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_SLB:
-			mce_err->u.slb_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_ERAT:
-			mce_err->u.erat_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_TLB:
-			mce_err->u.tlb_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_USER:
-			mce_err->u.user_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_RA:
-			mce_err->u.ra_error_type = table[i].error_subtype;
-			break;
-		case MCE_ERROR_TYPE_LINK:
-			mce_err->u.link_error_type = table[i].error_subtype;
-			break;
-		}
+		mce_err_get_sub_type(mce_err, table[i].error_type,
+				     table[i].error_subtype);
 		mce_err->sync_error = table[i].sync_error;
 		mce_err->severity = table[i].severity;
 		mce_err->initiator = table[i].initiator;
-- 
2.17.2

