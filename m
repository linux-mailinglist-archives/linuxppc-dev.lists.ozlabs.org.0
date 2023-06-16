Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3CA732609
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:55:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ryaCdn3P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj50l1Jqbz3bxS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ryaCdn3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4sz0PlHz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:42 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3lhkL012817;
	Fri, 16 Jun 2023 03:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2ymV2wIVmHTjn9pVbOS6Uqqg5Y6BX7ZdM4QeGaeaVKM=;
 b=ryaCdn3Preqcnn8zu54AAkJMrkY4Cfc9Oa/ipypnsFK4i6fZq+t5fgmCgBSV3mU1RSg1
 4ZCG7KeiBpKK8QqVMKfKirbAYdWEeDB1KDgC3mVcderroJbKyNYK+me5zp+s26PXp0hN
 0JEH8eAoDd60X3NhgFEdM3qfryy27XAIPu42YaoU90wqHT0OzvZsMtuILcnLyKGnKcar
 nHZRFG9uKNWGqwGK6dKFYnP2bhNZqdisSckBquxTj/wJLEKJN0TJlUPjDkd+EIZpu0v/
 ELPa1IK57Kn7x3IDL5XSdBU0S5Fx6S+mGW3rrp3h2OaOucEJquCijd01vKRlnTTN2X8W RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g5180rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:38 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3lhba012807;
	Fri, 16 Jun 2023 03:49:38 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g5180r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:37 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3fTu1016988;
	Fri, 16 Jun 2023 03:49:35 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4u0xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nXaC21955142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 281AF20040;
	Fri, 16 Jun 2023 03:49:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38B8820043;
	Fri, 16 Jun 2023 03:49:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:32 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 498B9603DA;
	Fri, 16 Jun 2023 13:49:28 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/11] powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
Date: Fri, 16 Jun 2023 13:48:41 +1000
Message-Id: <20230616034846.311705-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2SyZ3epcC9khi6QOTyrddFhtm6lats9e
X-Proofpoint-ORIG-GUID: tvadvuglNyHsCX3ggmkchd7nQF_cTcJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
	* Expose values as 64 bits
	* DEXCR is no longer a config
v2:	* New in v2
---
 arch/powerpc/include/uapi/asm/elf.h      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  1 +
 arch/powerpc/kernel/ptrace/ptrace-view.c | 36 +++++++++++++++++++++++-
 include/uapi/linux/elf.h                 |  1 +
 4 files changed, 38 insertions(+), 1 deletion(-)

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
index 5fff0d04b23f..87a46edb3efb 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -454,7 +454,36 @@ static int pmu_set(struct task_struct *target, const struct user_regset *regset,
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
+	/*
+	 * The DEXCR is currently static across all CPUs, so we don't
+	 * store the target's value anywhere, but the static value
+	 * will also be correct.
+	 */
+	membuf_store(&to, (unsigned long)(DEXCR_INIT & 0xFFFFFFFF));
+
+	/*
+	 * Technically the HDEXCR is per-cpu, but a hypervisor can't reasonably
+	 * change it between CPUs of the same guest.
+	 */
+	return membuf_store(&to, (unsigned long)(mfspr(SPRN_HDEXCR_RO) & 0xFFFFFFFF));
+}
+
+#endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_MEM_KEYS
 static int pkey_active(struct task_struct *target, const struct user_regset *regset)
@@ -615,6 +644,11 @@ static const struct user_regset native_regsets[] = {
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = pmu_active, .regset_get = pmu_get, .set = pmu_set
 	},
+	[REGSET_DEXCR] = {
+		.core_note_type = NT_PPC_DEXCR, .n = ELF_NDEXCR,
+		.size = sizeof(u64), .align = sizeof(u64),
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

