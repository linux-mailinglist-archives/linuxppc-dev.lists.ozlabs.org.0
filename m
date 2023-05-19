Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF119708F30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:09:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMvyr6BcQz3fN4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mOzE+4wY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mOzE+4wY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvqV6sFFz3f7F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:03:02 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4d8Be029965;
	Fri, 19 May 2023 05:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wtroBSNEMWJ8IZ9xhfoj1a3ty3juGKU+JCIzF2tQXQc=;
 b=mOzE+4wYgiDa3SoLzMsFGD3+ZD3kXyV5JE6pLTQFcMbxzWzcHt8PleF+AhtP2EncgVyL
 XfhIQ6K+beEQe7OV2vrq1MtyuKvHdxzKcUjuedfiIh/looONlkwauNstoRlkiD8RY2sv
 dtwESlN7G2ta4OjJrThBkV7fuyBYljWcmFLh0r1JS5YiK1AQrnzcZb/vap5SBdNhKvU1
 nMTTM1mzrve7B6UDQC6XzNZN4qYDRWcx7WX9qlhq0tdktlc4GkX3Nh5qDUp2VTL1A2nA
 saIHvZOB0RRTjiTmtVHPQyzlemh+awwtKXTHTLc05sq2hYB/+Gk+u95c7mx//GSSE/Ig 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp1ffsyxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:56 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J4xmrS004522;
	Fri, 19 May 2023 05:02:55 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp1ffsyvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:55 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4owuG026451;
	Fri, 19 May 2023 05:02:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qj1tdtfrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52p8c31719680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F12B12004D;
	Fri, 19 May 2023 05:02:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F146620043;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7EAA16061A;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/12] powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
Date: Fri, 19 May 2023 15:02:31 +1000
Message-Id: <20230519050236.144847-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519050236.144847-1-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YSHFQurvdQA93E92XdtMy7fHwV20mwSP
X-Proofpoint-GUID: hx1IwRGhGYQKSQxbRoAX7r_8pLeYukUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190038
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

The DEXCR register is of interest when ptracing processes. Currently it
is static, but eventually will be dynamically controllable by a process.
If a process can control its own, then it is useful for it to be
ptrace-able to (e.g., for checkpoint-restore functionality).

It is also relevant to core dumps (the NPHIE aspect in particular),
which use the ptrace mechanism (or is it the other way around?) to
decide what to dump. The HDEXCR is useful here too, as the NPHIE aspect
may be set in the HDEXCR without being set in the DEXCR. Although the
HDEXCR is per-cpu and we don't track it in the task struct (it's useless
in normal operation), it would be difficult to imagine why a hypervisor
would set it to different values within a guest. A hypervisor cannot
safely set NPHIE differently at least, as that would break programs.

Expose a read-only view of the userspace DEXCR and HDEXCR to ptrace.
The HDEXCR is always readonly, and is useful for diagnosing the core
dumps (as the HDEXCR may set NPHIE without the DEXCR setting it).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Add ruscur reviewed-by
v2:	* New in v2
---
 arch/powerpc/include/uapi/asm/elf.h      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  1 +
 arch/powerpc/kernel/ptrace/ptrace-view.c | 31 +++++++++++++++++++++++-
 include/uapi/linux/elf.h                 |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index dbc4a5b8d02d..e0d323c808dd 100644
--- a/arch/powerpc/include/uapi/asm/elf.h
+++ b/arch/powerpc/include/uapi/asm/elf.h
@@ -98,6 +98,7 @@
 #define ELF_NEBB	3	/* includes ebbrr, ebbhr, bescr */
 #define ELF_NPMU	5	/* includes siar, sdar, sier, mmcr2, mmcr0 */
 #define ELF_NPKEY	3	/* includes amr, iamr, uamor */
+#define ELF_NDEXCR	2	/* includes dexcr, hdexcr */
 
 typedef unsigned long elf_greg_t64;
 typedef elf_greg_t64 elf_gregset_t64[ELF_NGREG];
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 463a63eb8cc7..998a84f64804 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -57,6 +57,7 @@ enum powerpc_regset {
 	REGSET_TAR,		/* TAR register */
 	REGSET_EBB,		/* EBB registers */
 	REGSET_PMR,		/* Performance Monitor Registers */
+	REGSET_DEXCR,		/* DEXCR registers */
 #endif
 #ifdef CONFIG_PPC_MEM_KEYS
 	REGSET_PKEY,		/* AMR register */
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 5fff0d04b23f..d3304fb932fa 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -454,7 +454,31 @@ static int pmu_set(struct task_struct *target, const struct user_regset *regset,
 					 5 * sizeof(unsigned long));
 	return ret;
 }
-#endif
+
+static int dexcr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		return -ENODEV;
+
+	return regset->n;
+}
+
+static int dexcr_get(struct task_struct *target, const struct user_regset *regset,
+		     struct membuf to)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		return -ENODEV;
+
+	membuf_store(&to, (unsigned int)CONFIG_PPC_DEXCR_DEFAULT);
+
+	/*
+	 * Technically the HDEXCR is per-cpu, but a hypervisor can't reasonably
+	 * change it between CPUs of the same guest.
+	 */
+	return membuf_store(&to, (unsigned int)mfspr(SPRN_HDEXCR_RO));
+}
+
+#endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_MEM_KEYS
 static int pkey_active(struct task_struct *target, const struct user_regset *regset)
@@ -615,6 +639,11 @@ static const struct user_regset native_regsets[] = {
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = pmu_active, .regset_get = pmu_get, .set = pmu_set
 	},
+	[REGSET_DEXCR] = {
+		.core_note_type = NT_PPC_DEXCR, .n = ELF_NDEXCR,
+		.size = sizeof(u32), .align = sizeof(u32),
+		.active = dexcr_active, .regset_get = dexcr_get
+	},
 #endif
 #ifdef CONFIG_PPC_MEM_KEYS
 	[REGSET_PKEY] = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index ac3da855fb19..cfa31f1eb5d7 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -403,6 +403,7 @@ typedef struct elf64_shdr {
 #define NT_PPC_TM_CPPR	0x10e		/* TM checkpointed Program Priority Register */
 #define NT_PPC_TM_CDSCR	0x10f		/* TM checkpointed Data Stream Control Register */
 #define NT_PPC_PKEY	0x110		/* Memory Protection Keys registers */
+#define NT_PPC_DEXCR	0x111		/* PowerPC DEXCR registers */
 #define NT_386_TLS	0x200		/* i386 TLS slots (struct user_desc) */
 #define NT_386_IOPERM	0x201		/* x86 io permission bitmap (1=deny) */
 #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
-- 
2.40.1

