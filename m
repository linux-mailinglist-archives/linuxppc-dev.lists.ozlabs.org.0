Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 858626CFB15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 07:59:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnCS932Txz3fkh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 16:59:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdGq9BjG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdGq9BjG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnCG13p1Mz3f4v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:51:04 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U4casI017886;
	Thu, 30 Mar 2023 05:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8vcmXv8VkZG8zqWL8d6N+D1J2EjsZG8pc6GoZ80BBvo=;
 b=PdGq9BjGwj0l7n4+xdaOre75syd284PpARsR0S66sP3XCEQpOJGhkRbFGkAgaxInwFo3
 mo4rsQ5dbt3rnqP8yOWXw34kyjhuxM6RRYCPcRgdX3udS/a1TkViuto0K8Md7wY/2PzC
 lE9D/0eaC1dp3oVoW3heyo6mHn+ZDs3/pvMwOxrWk7KVYQVHcGbXlbk/s15g2MbubO8Y
 j3siLomcKI9MvgLhE5oHkbNpFVzvomP+8sHUfspigeLPh+XTneNoR5rTzS592GHOJIqk
 vojJc0w9BKe5h0WxKeEboED1SGL0oSY9TrzvirQBn9f9jpQtRs6pekEdd1Z4DPi3VVJI rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmn83ydjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:59 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U5CNkl009233;
	Thu, 30 Mar 2023 05:50:59 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmn83ydj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TKpntJ010293;
	Thu, 30 Mar 2023 05:50:57 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6nj1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:57 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U5osgt33948380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 05:50:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB96D20043;
	Thu, 30 Mar 2023 05:50:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB3012004E;
	Thu, 30 Mar 2023 05:50:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 05:50:53 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5042A606F4;
	Thu, 30 Mar 2023 16:50:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/12] powerpc/ptrace: Expose HASHKEYR register to ptrace
Date: Thu, 30 Mar 2023 16:50:36 +1100
Message-Id: <20230330055040.434133-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330055040.434133-1-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HlH50Bx9YsIsxkuDwTpJrTAvktPOqaes
X-Proofpoint-GUID: PcEMdttfOHZ1cbmutbAvd37vUdwZH746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_02,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=930
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

---

v2:	* New in v2
---
 arch/powerpc/include/uapi/asm/elf.h      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  3 ++
 arch/powerpc/kernel/ptrace/ptrace-view.c | 36 ++++++++++++++++++++++++
 include/uapi/linux/elf.h                 |  1 +
 4 files changed, 41 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index de13ed7f0972..d7b1778738ea 100644
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
2.39.2

