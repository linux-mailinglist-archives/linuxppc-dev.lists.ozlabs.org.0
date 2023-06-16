Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D1473260B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:56:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxRiHx5K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj51t1tV8z3cP2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxRiHx5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4t14lwlz3bWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:45 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3HJ6t006436;
	Fri, 16 Jun 2023 03:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3Ak4STzkGuaEHyxKkVM9XEETZ1/OokrjgG4ea/l1cl0=;
 b=OxRiHx5K10Bi8g35YGZBW4KOMIZqJ+Ai9/TYQHxgkPoayDjvJQohunihbEjXeVikM8JQ
 PD9nRke5G65k86I1foXWTibCmumVQ4BY3a96c6Ual+o9iW2hpwQxWccHW2s3meX5zby7
 HDyqHPCmaFECMjdoud8pmsg86Dy0n3nUKIiZ360Uyo9mh5Aqaq4Jy6v+YocNoS4Dij46
 frhG2wETiQwc3A8gOVV6ssDk9rF2x/uPN+jYmCEAenqyliQMS/R+H8Fqy/CzWtwfzpxL
 M5Wmj2oPm1+qARlX4VEaYDXbWgL5BWrgY9JppHeaLlpusvDRt2YRnibrVvNl8hGaCO0W Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fpngfqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:41 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3JwkL013118;
	Fri, 16 Jun 2023 03:49:41 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fpngfpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:41 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3S5cs005602;
	Fri, 16 Jun 2023 03:49:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4u0xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3naNE21561952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2786220043;
	Fri, 16 Jun 2023 03:49:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BD5E20040;
	Fri, 16 Jun 2023 03:49:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:35 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4923E60125;
	Fri, 16 Jun 2023 13:49:30 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/11] powerpc/ptrace: Expose HASHKEYR register to ptrace
Date: Fri, 16 Jun 2023 13:48:42 +1000
Message-Id: <20230616034846.311705-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yuakic-HJbQonyzXIRUms3L0Kn6wEv3y
X-Proofpoint-ORIG-GUID: qp_9KbWqnzwyypPlNPd3Rum2-JN_4ens
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=847 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The HASHKEYR register contains a secret per-process key to enable unique
hashes per process. In general it should not be exposed to userspace
at all and a regular process has no need to know its key.

However, checkpoint restore in userspace (CRIU) functionality requires
that a process be able to set the HASHKEYR of another process, otherwise
existing hashes on the stack would be invalidated by a new random key.

Exposing HASHKEYR in this way also makes it appear in core dumps, which
is a security concern. Multiple threads may share a key, for example
just after a fork() call, where the kernel cannot know if the child is
going to return back along the parent's stack. If such a thread is
coerced into making a core dump, then the HASHKEYR value will be
readable and able to be used against all other threads sharing that key,
effectively undoing any protection offered by hashst/hashchk.

Therefore we expose HASHKEYR to ptrace when CONFIG_CHECKPOINT_RESTORE is
enabled, providing a choice of increased security or migratable ROP
protected processes. This is similar to how ARM exposes its PAC keys.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Add ruscur reviewed-by
v2:	* New in v2
---
 arch/powerpc/include/uapi/asm/elf.h      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  3 ++
 arch/powerpc/kernel/ptrace/ptrace-view.c | 36 ++++++++++++++++++++++++
 include/uapi/linux/elf.h                 |  1 +
 4 files changed, 41 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index e0d323c808dd..a5377f494fa3 100644
--- a/arch/powerpc/include/uapi/asm/elf.h
+++ b/arch/powerpc/include/uapi/asm/elf.h
@@ -99,6 +99,7 @@
 #define ELF_NPMU	5	/* includes siar, sdar, sier, mmcr2, mmcr0 */
 #define ELF_NPKEY	3	/* includes amr, iamr, uamor */
 #define ELF_NDEXCR	2	/* includes dexcr, hdexcr */
+#define ELF_NHASHKEYR	1	/* includes hashkeyr */
 
 typedef unsigned long elf_greg_t64;
 typedef elf_greg_t64 elf_gregset_t64[ELF_NGREG];
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 998a84f64804..4171a5727197 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -58,6 +58,9 @@ enum powerpc_regset {
 	REGSET_EBB,		/* EBB registers */
 	REGSET_PMR,		/* Performance Monitor Registers */
 	REGSET_DEXCR,		/* DEXCR registers */
+#ifdef CONFIG_CHECKPOINT_RESTORE
+	REGSET_HASHKEYR,	/* HASHKEYR register */
+#endif
 #endif
 #ifdef CONFIG_PPC_MEM_KEYS
 	REGSET_PKEY,		/* AMR register */
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 87a46edb3efb..600fa72c2934 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -483,6 +483,35 @@ static int dexcr_get(struct task_struct *target, const struct user_regset *regse
 	return membuf_store(&to, (unsigned long)(mfspr(SPRN_HDEXCR_RO) & 0xFFFFFFFF));
 }
 
+#ifdef CONFIG_CHECKPOINT_RESTORE
+static int hashkeyr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		return -ENODEV;
+
+	return regset->n;
+}
+
+static int hashkeyr_get(struct task_struct *target, const struct user_regset *regset,
+			struct membuf to)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		return -ENODEV;
+
+	return membuf_store(&to, target->thread.hashkeyr);
+}
+
+static int hashkeyr_set(struct task_struct *target, const struct user_regset *regset,
+			unsigned int pos, unsigned int count, const void *kbuf,
+			const void __user *ubuf)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		return -ENODEV;
+
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf, &target->thread.hashkeyr,
+				  0, sizeof(unsigned long));
+}
+#endif /* CONFIG_CHECKPOINT_RESTORE */
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_MEM_KEYS
@@ -649,6 +678,13 @@ static const struct user_regset native_regsets[] = {
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = dexcr_active, .regset_get = dexcr_get
 	},
+#ifdef CONFIG_CHECKPOINT_RESTORE
+	[REGSET_HASHKEYR] = {
+		.core_note_type = NT_PPC_HASHKEYR, .n = ELF_NHASHKEYR,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = hashkeyr_active, .regset_get = hashkeyr_get, .set = hashkeyr_set
+	},
+#endif
 #endif
 #ifdef CONFIG_PPC_MEM_KEYS
 	[REGSET_PKEY] = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index cfa31f1eb5d7..b705b301d88f 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -404,6 +404,7 @@ typedef struct elf64_shdr {
 #define NT_PPC_TM_CDSCR	0x10f		/* TM checkpointed Data Stream Control Register */
 #define NT_PPC_PKEY	0x110		/* Memory Protection Keys registers */
 #define NT_PPC_DEXCR	0x111		/* PowerPC DEXCR registers */
+#define NT_PPC_HASHKEYR	0x112		/* PowerPC HASHKEYR register */
 #define NT_386_TLS	0x200		/* i386 TLS slots (struct user_desc) */
 #define NT_386_IOPERM	0x201		/* x86 io permission bitmap (1=deny) */
 #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
-- 
2.40.1

