Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE037A63B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 14:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffc5w0LV7z307k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 22:04:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b01Bs0dc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathvika@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b01Bs0dc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffc4t6Ndhz2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 22:03:10 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BBY5nY128879; Tue, 11 May 2021 08:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : in-reply-to : references;
 s=pp1; bh=QfMQp4pClrjYMnikAvPlLcZ8h/eM4m+VrmV2hutgYfw=;
 b=b01Bs0dcYU0wNBXUa7J313qNB/BmxM5WaCJY1E1yPInOsnKvkLCNvd+J+8XtH+bS0wUu
 3x18Uu2pi/gDL58sy81+cFuP4tes/3AcOrwie75AI6qJtY+9GMrA2Mlw6UPcppM7hAAk
 XKG0S7ooJLRJqGYljCBKUODBOV8BG9Xj2G5Un9Kv+mS+v8c9pKf0+8d96n7ijwcnepgc
 1JgjTHcAygnESiSkto3tc2bcl+RR6ecoOuBI541h9OP2MzHy5JFrzCIh+6LPxxO89Ujz
 XE0/V7//H69/4Ks3xdEkN3Y1Mumqcjb1IzkKbaTqRHDPR2MlRXWM1ipgdlTv2yvDWC/0 WA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38fnujf8ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 08:03:01 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14BC2xec000956;
 Tue, 11 May 2021 12:02:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 38dj988w3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 12:02:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14BC2UOt30015938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 12:02:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91224C05C;
 Tue, 11 May 2021 12:02:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9D1F4C04E;
 Tue, 11 May 2021 12:02:55 +0000 (GMT)
Received: from ltc-zz14-lp7.aus.stglabs.ibm.com (unknown [9.40.195.16])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 12:02:55 +0000 (GMT)
From: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/sstep: Add tests for setb instruction
Date: Tue, 11 May 2021 07:18:33 -0500
Message-Id: <b05b61ccb5f10279d46fed490796f32ea2ccc270.1620727160.git.sathvika@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T_yLWDqr9qlvEWPM2AoI8O6MtdsxwrtX
X-Proofpoint-ORIG-GUID: T_yLWDqr9qlvEWPM2AoI8O6MtdsxwrtX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_02:2021-05-11,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110090
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
Cc: sathvika@linux.vnet.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds selftests for setb instruction.

Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/lib/test_emulate_step.c  | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ac41776661e9..927551dd870b 100644
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
index 783d1b85ecfe..a0a52fe5e979 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -53,6 +53,8 @@
 	ppc_inst_prefix(PPC_PREFIX_MLS | __PPC_PRFX_R(pr) | IMM_H(i), \
 			PPC_RAW_ADDI(t, a, i))
 
+#define TEST_SETB(t, bfa)       ppc_inst(PPC_INST_SETB | ___PPC_RT(t) | ___PPC_RA((bfa & 0x7) << 2))
+
 
 static void __init init_pt_regs(struct pt_regs *regs)
 {
@@ -929,6 +931,33 @@ static struct compute_test compute_tests[] = {
 			}
 		}
 	},
+	{
+		.mnemonic = "setb",
+		.cpu_feature = CPU_FTR_ARCH_300,
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

