Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6765708F39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMw0x5Jf4z3frr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:11:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYbXWJng;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYbXWJng;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvxC36zWz3fsy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:07:59 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4gTsJ015206;
	Fri, 19 May 2023 05:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YD6m6L4EDSlAYDLmaLA27mDpnx+DweiPzE6P3i3bdiU=;
 b=SYbXWJngi58p1btNfseNiW+5uAQWH8atgo+NKz5n39q35xQWSxUKUPWYc2jMV/YOVBos
 aW+5qzHQN0E9/Gi7L0Rz/XgknDQX03m3zG9acjODoIqhi/8IRtEGFp9ALAHgE4Jzt3sW
 aHQIqIOalhsG2U+X7bG5pjj47R6+/e62dE7i9qXgz/ZbMrCAubCd2M+HAwgiPW8ikuSZ
 Z5tqM9MYe/dG3dmfMBb6UOFmsEbcR+XwD7miyDDzOcSEuad2eyicSAwzYB17PK4jQfRu
 VtjIIDRbvOT4T59BgkTVQlfbJP6LpfmnlyR1cmiM8Jxaclt3ZrQeis3whMNANs+Nxo81 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2ap0mr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:07:56 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J56WrD023568;
	Fri, 19 May 2023 05:07:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2ap0mn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:07:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J2Wu0V030128;
	Fri, 19 May 2023 05:02:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qj264u03u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52p2A28377518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F118C2004B;
	Fri, 19 May 2023 05:02:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F142720040;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 81DBE6060A;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/12] powerpc/ptrace: Expose HASHKEYR register to ptrace
Date: Fri, 19 May 2023 15:02:32 +1000
Message-Id: <20230519050236.144847-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519050236.144847-1-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VELWtUScQl9Ue63KM-2OUTMg0W6ku4LC
X-Proofpoint-ORIG-GUID: jH2NZp9H1KUOMbYSp80JYEFxcbTE1-or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxlogscore=957 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190043
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
index d3304fb932fa..acbb8ec11b1e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -478,6 +478,35 @@ static int dexcr_get(struct task_struct *target, const struct user_regset *regse
 	return membuf_store(&to, (unsigned int)mfspr(SPRN_HDEXCR_RO));
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
@@ -644,6 +673,13 @@ static const struct user_regset native_regsets[] = {
 		.size = sizeof(u32), .align = sizeof(u32),
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

