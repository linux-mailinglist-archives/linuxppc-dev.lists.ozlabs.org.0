Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7333361A04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM6Hc4gTFz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i5swIETK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathvika@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i5swIETK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM6GH15GYz3bTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:47:34 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G6YPQf001511
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 02:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : in-reply-to : references;
 s=pp1; bh=eGHVuWQ9BVzjgZWfDEGn5brGeVFBCMYOy/5Rj7FgJ/g=;
 b=i5swIETKILQjvxpXF1skzApOFf2AMR2UYKtvRLgvidXAHIfByYKf/IqO9ApuJFS91p76
 X38EKwfMPbig6U1fub7V7psV2M2LL9KB6/uCxoHXpdF/8eNBblxTZ64LCYktcLQfqvC9
 t0FyfrFYfP0i+0WkoPe6PLs+ts6bH6O7C5W2fiYXZi0ahJ6y0SYdJeqM3g8wfDcTI9+y
 W5+ZFPZG6ZIINWVCYSw/zo2/dIYsOIG0FuYvEaUMYWunCuBVubsygYLEtzeyVw/XcREd
 +spmKbYs180RYgUMCqojVuEeC9X7WR91YzyDUFraM2Opo3tyl8+IgYJJo8lPn6wmbPVD Rg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xsvafxf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 02:47:33 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G6XbBF010962
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:47:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37u3n8ja5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:47:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13G6lRwR17039742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 06:47:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5D1D4204D;
 Fri, 16 Apr 2021 06:47:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2590142042;
 Fri, 16 Apr 2021 06:47:27 +0000 (GMT)
Received: from ltc-zz14-lp7.aus.stglabs.ibm.com (unknown [9.40.195.16])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 06:47:26 +0000 (GMT)
From: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/sstep: Add tests for setb instruction
Date: Fri, 16 Apr 2021 02:02:49 -0500
Message-Id: <ab1756406a5c39c32b809a0699a22c10425030ae.1618469454.git.sathvika@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ipyooARZr9B85WhidDbJG9rBavlDgSW
X-Proofpoint-GUID: 2ipyooARZr9B85WhidDbJG9rBavlDgSW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160049
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
Cc: naveen.n.rao@linux.ibm.com,
 Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds selftests for setb instruction.

Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/lib/test_emulate_step.c  | 28 +++++++++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ed161ef2b3ca..32bf53260737 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -245,6 +245,7 @@
 #define PPC_INST_STRING			0x7c00042a
 #define PPC_INST_STRING_MASK		0xfc0007fe
 #define PPC_INST_STRING_GEN_MASK	0xfc00067e
+#define PPC_INST_SETB			0x7c000100
 #define PPC_INST_STSWI			0x7c0005aa
 #define PPC_INST_STSWX			0x7c00052a
 #define PPC_INST_TRECHKPT		0x7c0007dd
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 783d1b85ecfe..c338e35b627c 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -53,6 +53,8 @@
 	ppc_inst_prefix(PPC_PREFIX_MLS | __PPC_PRFX_R(pr) | IMM_H(i), \
 			PPC_RAW_ADDI(t, a, i))
 
+#define TEST_SETB(t, bfa)       ppc_inst(PPC_INST_SETB | ___PPC_RT(t) | ___PPC_RA((bfa & 0x7) << 2))
+
 
 static void __init init_pt_regs(struct pt_regs *regs)
 {
@@ -929,6 +931,67 @@ static struct compute_test compute_tests[] = {
 			}
 		}
 	},
+	{
+		.mnemonic = "setb",
+		.subtests = {
+			{
+				.descr = "BFA = 1, CR = GT",
+				.instr = TEST_SETB(20, 1),
+				.regs = {
+					.ccr = 0x4000000,
+				}
+			},
+			{
+				.descr = "BFA = 4, CR = LT",
+				.instr = TEST_SETB(20, 4),
+				.regs = {
+					.ccr = 0x8000,
+				}
+			},
+			{
+				.descr = "BFA = 5, CR = EQ",
+				.instr = TEST_SETB(20, 5),
+				.regs = {
+					.ccr = 0x200,
+				}
+			}
+		}
+	},
 	{
 		.mnemonic = "add",
 		.subtests = {
-- 
2.16.4

