Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7425732607
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:53:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BrgAa55X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj4yk457mz3by2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:53:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BrgAa55X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4sr2ZB1z3bhk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:36 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3jF45001984;
	Fri, 16 Jun 2023 03:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CqYPabRWhVe0vWVib4rF2O6sxJcGYk3xFPvWjPnUoJA=;
 b=BrgAa55XukioxluKzyzkwj6+dvSmLP0iK+YpEsCUWnb1kUTSrOxswHfbJWQo4HKXL5tl
 6FutQOSw9UXZFOZi+AjWa2tD2omIdWvWsmS5i2BRCYOrtIFS6pJqnBQWsHx76hEM6umy
 CnhqBMqM9+3KQPZ+9MSjN+RWoDU+ESheSkSGvPTFenr+fFKv8iv6I0WeL/BGog64/3Vo
 m5XWOgfRope+HHceGR771kNXlaw5qxyaH1PZVDl2R15TMILxVoRCruAKFfXqlzj+Pc/M
 4jIqZlMJxVewb93F576DlhtcjCK1FUFBIOaRr4JtQK8IbIyuIcOMRjcfsMNDTRpekhwK BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fvbgbmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:32 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3aUhn008423;
	Fri, 16 Jun 2023 03:49:31 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fvbgbm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:31 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G2vv2v015696;
	Fri, 16 Jun 2023 03:49:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3r4gt531bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nQ8J11338408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 821932004B;
	Fri, 16 Jun 2023 03:49:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D3EC20043;
	Fri, 16 Jun 2023 03:49:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:26 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7348B60520;
	Fri, 16 Jun 2023 13:49:21 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/11] powerpc/dexcr: Handle hashchk exception
Date: Fri, 16 Jun 2023 13:48:39 +1000
Message-Id: <20230616034846.311705-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ocaEutyW4DyjwSg8wmnCG2hnT6Y1EFPH
X-Proofpoint-ORIG-GUID: 7TEv1-bSX6cH4nAvsVu4fPIwySf679QH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=481
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recognise and pass the appropriate signal to the user program when a
hashchk instruction triggers. This is independent of allowing
configuration of DEXCR[NPHIE], as a hypervisor can enforce this aspect
regardless of the kernel.

The signal mirrors how ARM reports their similar check failure. For
example, their FPAC handler in arch/arm64/kernel/traps.c do_el0_fpac()
does this. When we fail to read the instruction that caused the fault
we send a segfault, similar to how emulate_math() does it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v3:	* Inline hashchk detection, remove dexcr.c and associated files
v1:	* Refactor the hashchk check to return 0 on success, an error
	  code on failure. Determine what to do based on specific error
	  code.
	* Motivate signal and code
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/kernel/traps.c           | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ca5a0da7df4e..ef6972aa33b9 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -222,6 +222,7 @@
 #define OP_31_XOP_STFSX	    663
 #define OP_31_XOP_STFSUX    695
 #define OP_31_XOP_STFDX     727
+#define OP_31_XOP_HASHCHK   754
 #define OP_31_XOP_STFDUX    759
 #define OP_31_XOP_LHBRX     790
 #define OP_31_XOP_LFIWAX    855
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9bdd79aa51cf..e59ec6d32d37 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1516,6 +1516,22 @@ static void do_program_check(struct pt_regs *regs)
 				return;
 			}
 		}
+
+		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) && user_mode(regs)) {
+			ppc_inst_t insn;
+
+			if (get_user_instr(insn, (void __user *)regs->nip)) {
+				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
+				return;
+			}
+
+			if (ppc_inst_primary_opcode(insn) == 31 &&
+			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
+				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
+				return;
+			}
+		}
+
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
 		return;
 	}
-- 
2.40.1

