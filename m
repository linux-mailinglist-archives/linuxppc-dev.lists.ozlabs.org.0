Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BDB58D6FE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 12:00:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M27qT3XY3z3c17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 20:00:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hlfs+ppM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hlfs+ppM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M27pl3kxLz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 19:59:58 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2799AGdS018331;
	Tue, 9 Aug 2022 09:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=A8bozjHr3yqsC2Dp/BQcPwvME2CwrFbox5vOuhfwRfg=;
 b=hlfs+ppMEnwC1ZN0JIgTqxtKXjMRfkZ2/3EbhFmbKewCyTyZ4F2UreRpkG7Yvag0i3PZ
 OjooWdFRnTO1zufymSmxklDMfDq9YN2LIbcP4nx9ddWTkNrG+aPzSENVVcR7CV47uPFt
 FJ55wFOF5/7kvJRweZFpAQWnl9KInP0unOX3c0xF0BQiiKk416z16GTNvPZG+Mvaygbq
 DsVKYKPce17rWy0n5JMVvyVwPadn0OtZlmBLnxgf9rDSyTYoQKyGybQh2rHjecELS4hX
 VeeW/7KLnvX1l2jmsn60pw39HKX0zFO0m/wGxusrgr7B1azWifcqfxUPY5TjZTPp7Ion NA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hukyead31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 09:59:40 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2799DtT5030353;
	Tue, 9 Aug 2022 09:59:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hukyead2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 09:59:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2799pMej017568;
	Tue, 9 Aug 2022 09:59:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3hu4rp8wdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 09:59:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2799v7F519661264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Aug 2022 09:57:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4274842045;
	Tue,  9 Aug 2022 09:59:35 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7358F4203F;
	Tue,  9 Aug 2022 09:59:33 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.41.164])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Aug 2022 09:59:33 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
Date: Tue,  9 Aug 2022 15:29:07 +0530
Message-Id: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jS4ov5WaXGjJrLTc7RdkWG3-KsQCZvu1
X-Proofpoint-GUID: QbZxPyp7-YKt7BuIPI_3i26laaMzAv2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=856 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208090041
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Ondrej Mosnacek <omosnacek@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang doesn't support -mprofile-kernel ABI, so guard the checks against
CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.

Fixes: 23b44fc248f420 ("powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and PPC64")
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reported-by: Ondrej Mosnacek <omosnacek@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index cb158c32b50b99..7b85c3b460a3c0 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -393,11 +393,11 @@ int ftrace_make_nop(struct module *mod,
  */
 static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
+	else
 		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) &&
 		       ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
-	else
-		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
 }
 
 static int
@@ -412,7 +412,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	if (copy_inst_from_kernel_nofault(op, ip))
 		return -EFAULT;
 
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1) &&
+	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) &&
 	    copy_inst_from_kernel_nofault(op + 1, ip + 4))
 		return -EFAULT;
 

base-commit: ff1ed171e05c971652a0ede3d716997de8ee41c9
-- 
2.37.1

