Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671A639FAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:48:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL8zk3VFBz3dyW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:48:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qCrMro86;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qCrMro86;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wh5hXKz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:55 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2H5VZ025654;
	Mon, 28 Nov 2022 02:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+fBKAg+WmulB7ZeaiELLpnzDxsjF37sIrJC+a6vCqA4=;
 b=qCrMro86LDonVTzBgi+IP5ysiGoc5eNmFRCVer65h7BOE1+ax0ywmSkmpnsBxcKQUPnT
 2wzQcTGGY2jffVauS1ehIm+rSAC8K6wnanpyb7Jay7gT99smp1jTUFv8Ax3b3KXaDAoN
 B00IASnJuH1gFcw6tNc6M2jbYPElNxI5C8qZcBrbm/bakCHuOCM3cEbnf8jpC1RyskI6
 2LgC+A8uFBA5RRLU1pV+0BVMS7aR5j+YSEJ+myhMVNDOPt2sM1E+9QW63HFsFoY3Kxi4
 uQYFCQxHAGpoBA4BPOm9Qq/jBHHH/mK/sZKSFNfY4E/6YVqS62tVvkVJrzNJsGIA7tdp Dg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vnnumyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2ZJ03014933;
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 3m3ae99b6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jhDs38994236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A3D7A405C;
	Mon, 28 Nov 2022 02:45:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8749A405B;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4AEE360366;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/13] powerpc/dexcr: Handle hashchk exception
Date: Mon, 28 Nov 2022 13:44:48 +1100
Message-Id: <20221128024458.46121-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O04wau0dzEy9mLrEdUENrMRoTmQipoec
X-Proofpoint-GUID: O04wau0dzEy9mLrEdUENrMRoTmQipoec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=737 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recognise and pass the appropriate signal to the user program when a
hashchk instruction triggers. This is independent of allowing
configuration of DEXCR[NPHIE], as a hypervisor can enforce this aspect
regardless of the kernel.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/include/asm/processor.h  |  6 ++++++
 arch/powerpc/kernel/dexcr.c           | 22 ++++++++++++++++++++++
 arch/powerpc/kernel/traps.c           |  6 ++++++
 4 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 21e33e46f4b8..89b316466ed1 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -215,6 +215,7 @@
 #define OP_31_XOP_STFSX	    663
 #define OP_31_XOP_STFSUX    695
 #define OP_31_XOP_STFDX     727
+#define OP_31_XOP_HASHCHK   754
 #define OP_31_XOP_STFDUX    759
 #define OP_31_XOP_LHBRX     790
 #define OP_31_XOP_LFIWAX    855
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 0a8a793b8b8b..c17ec1e44c86 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -448,10 +448,16 @@ void *exit_vmx_ops(void *dest);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 
+bool is_hashchk_trap(struct pt_regs const *regs);
 unsigned long get_thread_dexcr(struct thread_struct const *t);
 
 #else
 
+static inline bool is_hashchk_trap(struct pt_regs const *regs)
+{
+	return false;
+}
+
 static inline unsigned long get_thread_dexcr(struct thread_struct const *t)
 {
 	return 0;
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
index 32a0a69ff638..11515e67afac 100644
--- a/arch/powerpc/kernel/dexcr.c
+++ b/arch/powerpc/kernel/dexcr.c
@@ -3,6 +3,9 @@
 
 #include <asm/cpu_has_feature.h>
 #include <asm/cputable.h>
+#include <asm/disassemble.h>
+#include <asm/inst.h>
+#include <asm/ppc-opcode.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
 
@@ -19,6 +22,25 @@ static int __init dexcr_init(void)
 }
 early_initcall(dexcr_init);
 
+bool is_hashchk_trap(struct pt_regs const *regs)
+{
+	ppc_inst_t insn;
+
+	if (!cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		return false;
+
+	if (get_user_instr(insn, (void __user *)regs->nip)) {
+		WARN_ON(1);
+		return false;
+	}
+
+	if (ppc_inst_primary_opcode(insn) == 31 &&
+	    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK)
+		return true;
+
+	return false;
+}
+
 unsigned long get_thread_dexcr(struct thread_struct const *t)
 {
 	return DEFAULT_DEXCR;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9bdd79aa51cf..b83f5b382f24 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1516,6 +1516,12 @@ static void do_program_check(struct pt_regs *regs)
 				return;
 			}
 		}
+
+		if (user_mode(regs) && is_hashchk_trap(regs)) {
+			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
+			return;
+		}
+
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
 		return;
 	}
-- 
2.38.1

