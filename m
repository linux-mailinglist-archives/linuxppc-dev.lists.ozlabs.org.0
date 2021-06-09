Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D43A0F36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0Lgk2Km4z3bsL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 19:01:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTuRgOm3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hTuRgOm3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0Lg932Knz302H
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 19:00:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1598ZMRY030973; Wed, 9 Jun 2021 05:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=pRG1+oiGF18zBkD5Uf/4C/EBSB8HvJ5SXYJ9lZt8yi8=;
 b=hTuRgOm36o9U7vu/zaaYj7NQ4NX3fYZPlq51nrU0ozfjqB+YZmxHEaHLE0ZTbHmj4kO/
 seiQ1ySptibenJa6S9Bj1yDF9JYObxAONyzi2YPCeSiO08daNlDXKlSTGVwtSIo70T7K
 iBwRaEqDqzgI5HaS21d+jLc9bKLvaZIwBDNAa7IJytYABPeb4IYrUTOIB3ICJSaVPAC4
 exQZlykinEEPd1BNB2Bl2/zfQERoE6fJBBl/3i4tXA1tLXIpUU4mC6n3LufQ9gu+CvGh
 8wtrm3AJNKoWvNCOXt699/dASCuZldDJ5To5zMql8Qut3O4rGo6IRyDrsD6e6lQqBSgA tA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 392rv93ev2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jun 2021 05:00:45 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1598wOab007626;
 Wed, 9 Jun 2021 09:00:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3900w894q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jun 2021 09:00:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15990elN23265602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Jun 2021 09:00:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF0254203F;
 Wed,  9 Jun 2021 09:00:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A32842047;
 Wed,  9 Jun 2021 09:00:38 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.123.81])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Jun 2021 09:00:38 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>, <bpf@vger.kernel.org>
Subject: [PATCH] powerpc/bpf: Use bctrl for making function calls
Date: Wed,  9 Jun 2021 14:30:24 +0530
Message-Id: <20210609090024.1446800-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -ahUj4JcTWc0QUPZ9m-a6OgDcj7UTqL2
X-Proofpoint-GUID: -ahUj4JcTWc0QUPZ9m-a6OgDcj7UTqL2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-09_04:2021-06-04,
 2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090037
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

blrl corrupts the link stack. Instead use bctrl when making function
calls from BPF programs.

Reported-by: Anton Blanchard <anton@ozlabs.org>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/net/bpf_jit_comp32.c     |  4 ++--
 arch/powerpc/net/bpf_jit_comp64.c     | 12 ++++++------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ac41776661e963..1abacb8417d562 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -451,6 +451,7 @@
 #define PPC_RAW_MTLR(r)			(0x7c0803a6 | ___PPC_RT(r))
 #define PPC_RAW_MFLR(t)			(PPC_INST_MFLR | ___PPC_RT(t))
 #define PPC_RAW_BCTR()			(PPC_INST_BCTR)
+#define PPC_RAW_BCTRL()			(PPC_INST_BCTRL)
 #define PPC_RAW_MTCTR(r)		(PPC_INST_MTCTR | ___PPC_RT(r))
 #define PPC_RAW_ADDI(d, a, i)		(PPC_INST_ADDI | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_LI(r, i)		PPC_RAW_ADDI(r, 0, i)
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index bbb16099e8c7fa..40ab50bea61c02 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -195,8 +195,8 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 		/* Load function address into r0 */
 		EMIT(PPC_RAW_LIS(__REG_R0, IMM_H(func)));
 		EMIT(PPC_RAW_ORI(__REG_R0, __REG_R0, IMM_L(func)));
-		EMIT(PPC_RAW_MTLR(__REG_R0));
-		EMIT(PPC_RAW_BLRL());
+		EMIT(PPC_RAW_MTCTR(__REG_R0));
+		EMIT(PPC_RAW_BCTRL());
 	}
 }
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 57a8c1153851a0..ae9a6532be6ad4 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -153,8 +153,8 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
 	PPC_LI64(b2p[TMP_REG_2], func);
 	/* Load actual entry point from function descriptor */
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_2], 0);
-	/* ... and move it to LR */
-	EMIT(PPC_RAW_MTLR(b2p[TMP_REG_1]));
+	/* ... and move it to CTR */
+	EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
 	/*
 	 * Load TOC from function descriptor at offset 8.
 	 * We can clobber r2 since we get called through a
@@ -165,9 +165,9 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
 #else
 	/* We can clobber r12 */
 	PPC_FUNC_ADDR(12, func);
-	EMIT(PPC_RAW_MTLR(12));
+	EMIT(PPC_RAW_MTCTR(12));
 #endif
-	EMIT(PPC_RAW_BLRL());
+	EMIT(PPC_RAW_BCTRL());
 }
 
 void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
@@ -202,8 +202,8 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 	PPC_BPF_LL(12, 12, 0);
 #endif
 
-	EMIT(PPC_RAW_MTLR(12));
-	EMIT(PPC_RAW_BLRL());
+	EMIT(PPC_RAW_MTCTR(12));
+	EMIT(PPC_RAW_BCTRL());
 }
 
 static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)

base-commit: 112f47a1484ddca610b70cbe4a99f0d0f1701daf
-- 
2.31.1

