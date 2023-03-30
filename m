Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F796CFB11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 07:59:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnCRD4zY6z3fjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 16:59:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6bK/zOx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6bK/zOx;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnCG13Hjjz3f4T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:51:04 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U4PIec017941;
	Thu, 30 Mar 2023 05:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7+n+qctLy5rhvqTAH4KA0LaWr3UkuduAGHnX0dDFqd8=;
 b=q6bK/zOxO0AA97BZDTuE74BdXthH0NH0w3UTa8Z5+u3LbUrVKemTO0G5KTyjkIAI/d72
 X3gSmxl/hBIles7sGn5DM9eHfr4i/mSRLdYd4ONnxOSfssrfFJNePLd4UIKN+6bC9eac
 ddgQvA5i35QhP0P+Memb5VQDvD6lPSMlP4vV7zkVW6Oj7RzEwC/syZgJmFdkKxYGXD8g
 R1sHPpu6geXs6llGJC4CJmM1OjoHpXhWdJjQaJWILAAFXVFZ+BuEqWoeegKlGDCuEvTA
 T8ivi5cY+92u/dRam9/SHOJAgW6pnh3X2Cl6+y1aEic1kGxXiSx4N6YsR+bzn3PwR7AH og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmn83ydjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:59 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U5jY7u031868;
	Thu, 30 Mar 2023 05:50:59 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmn83ydj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TLWQnl019506;
	Thu, 30 Mar 2023 05:50:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6nkf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U5osRr26608196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 05:50:54 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A815720043;
	Thu, 30 Mar 2023 05:50:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7F202005A;
	Thu, 30 Mar 2023 05:50:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 05:50:53 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4E362606F0;
	Thu, 30 Mar 2023 16:50:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/12] powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
Date: Thu, 30 Mar 2023 16:50:35 +1100
Message-Id: <20230330055040.434133-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330055040.434133-1-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7vZbqX2PAiNxGHULMl3jwx_pdUzUB7KD
X-Proofpoint-GUID: rhLeKdQp4pQRvx2wD1U5_SVAdqNWXXmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_02,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300043
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
Cc: npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
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

---

v2:	* New in v2
---
 arch/powerpc/include/uapi/asm/elf.h      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  1 +
 arch/powerpc/kernel/ptrace/ptrace-view.c | 31 +++++++++++++++++++++++-
 include/uapi/linux/elf.h                 |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index 308857123a08..de13ed7f0972 100644
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
2.39.2

