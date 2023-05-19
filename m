Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD4708F1E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMvsD2J7hz3fcK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:04:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HYQiXse5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HYQiXse5;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvqN63Xlz3bgV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:02:56 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4d2iE014502;
	Fri, 19 May 2023 05:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CqYPabRWhVe0vWVib4rF2O6sxJcGYk3xFPvWjPnUoJA=;
 b=HYQiXse5OvAJ4E/PgEUqr94n4pZrUXjLFrVBq+c88yH3JGlhXXoX6Sby7wDzYrPYkfTz
 OVS8Xs3NvdZyO+hzg+HFSCCMtaHXJMxNXSO7i+fcFd7N6ZrWwlqocq6JCV7ZM/APQCQw
 iJaTKH6hw8X737UxOC1Monom+SovwJnYDsixwfwQeeSGUZ0Pt6NdF5zqYvK1ImjTUj1U
 iSSgch5NjyOZVdZYFVpTc9gQo4hznx5FNCfGwMtcz20psmAU6x12ei9pXL5d9vJoy67H
 LRP0qIzAfrM3iKKx0YhRc2+Csq35M3LHyKdRNmmX3CAonljJ5RZbXqf/E+x2jpELqqKs vA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp0ke2shw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:53 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J4dS1R016718;
	Fri, 19 May 2023 05:02:52 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp0ke2sgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:52 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4bwMW020001;
	Fri, 19 May 2023 05:02:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qj264tg29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52mIN33489564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1331B2004B;
	Fri, 19 May 2023 05:02:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86D0F20043;
	Fri, 19 May 2023 05:02:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:47 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6AEF2605F3;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/12] powerpc/dexcr: Handle hashchk exception
Date: Fri, 19 May 2023 15:02:28 +1000
Message-Id: <20230519050236.144847-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519050236.144847-1-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M7a5Zci71vBrdFHXgjQmqgqJmi5NIXtM
X-Proofpoint-ORIG-GUID: EvDz7_sY42qz_EyQudh60kHnjNGMnCIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=560 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190038
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

