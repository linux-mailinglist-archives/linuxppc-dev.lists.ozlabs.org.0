Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE6B606712
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 19:33:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtZSH2kjZz3dw5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 04:33:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nKxqKPoy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nKxqKPoy;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtZNW1GDPz3dry
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 04:29:46 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KH9hg1025569;
	Thu, 20 Oct 2022 17:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e//+Guwkwdaxt0jKcD4zpbDEl/D+HzTVPO6JHOoovFE=;
 b=nKxqKPoyzmjDOhFFxEwOmeNQ2CFugX2zMgtKHPHYFTHGpuFpVGLJi2i4+ho825hs61ce
 rk67IgVLVE2n4jwv8F0fvlCr/KgLOQIq0OUdw0MGk2Jo36soaMZnniFDZvz1cAiatpMK
 Y5vO9Vb6zjXboMOXLEeBggZj6Dv1Qku5au915eZSDPZJqsh/Y7wFSX5HjgpD9y+ShVr3
 nGMeJ1t820BFWwoE6sAMtCGFXxtRPPCsuvNcttrF+HQJ7Y2+OmY/ezmEdTrf6J3UMW7j
 hsWQSQOHuG1TBu0WwjAgWpGDZpLpZ7fQrAjni/RnGCNaQSruPM4kLluZpb7jb8+3+dHC IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbafyrsr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:37 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KHBAQk005728;
	Thu, 20 Oct 2022 17:29:37 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbafyrsqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:37 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KHQ5RV015280;
	Thu, 20 Oct 2022 17:29:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma05fra.de.ibm.com with ESMTP id 3k7mg8xyd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29KHTWF158655226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 17:29:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2E0642041;
	Thu, 20 Oct 2022 17:29:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01EF74203F;
	Thu, 20 Oct 2022 17:29:31 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.39.233])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 17:29:30 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 4/5] powerpc/kprobes: Setup consistent pt_regs across kprobes, optprobes and KPROBES_ON_FTRACE
Date: Thu, 20 Oct 2022 22:59:00 +0530
Message-Id: <1d0cb183f48c4179646c0c5e183fd296da58f4ca.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UjJp-15Bn7Pu6-lEY8As8lOMZ3AHzDpe
X-Proofpoint-ORIG-GUID: V3RK3kVMiHTbz_jzFH76lqZ92RaIYcbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_07,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=836 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210200101
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ensure a more consistent pt_regs across kprobes, optprobes and
KPROBES_ON_FTRACE:
- Drop setting trap to 0x700 under optprobes. This is not accurate and
  is unnecessary. Instead, zero it out for both optprobes and
  KPROBES_ON_FTRACE.
- Save irq soft mask in the ftrace handler, similar to what we do in
  optprobes and trap-based kprobes.
- Drop setting orig_gpr3 and result to zero in optprobes. These are not
  relevant under kprobes and should not be used by the handlers.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/optprobes_head.S        | 5 +----
 arch/powerpc/kernel/trace/ftrace_mprofile.S | 6 ++++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index cd4e7bc32609d3..06df09b4e8b155 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -49,11 +49,8 @@ optprobe_template_entry:
 	/* Save SPRS */
 	mfmsr	r5
 	PPC_STL	r5,_MSR(r1)
-	li	r5,0x700
-	PPC_STL	r5,_TRAP(r1)
 	li	r5,0
-	PPC_STL	r5,ORIG_GPR3(r1)
-	PPC_STL	r5,RESULT(r1)
+	PPC_STL	r5,_TRAP(r1)
 	mfctr	r5
 	PPC_STL	r5,_CTR(r1)
 	mflr	r5
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index d031093bc43671..f82004089426e6 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -107,6 +107,12 @@
 	PPC_STL	r9, _CTR(r1)
 	PPC_STL	r10, _XER(r1)
 	PPC_STL	r11, _CCR(r1)
+#ifdef CONFIG_PPC64
+	lbz     r7, PACAIRQSOFTMASK(r13)
+	std     r7, SOFTE(r1)
+#endif
+	li	r8, 0
+	PPC_STL	r8, _TRAP(r1)
 	.endif
 
 	/* Load &pt_regs in r6 for call below */
-- 
2.38.0

