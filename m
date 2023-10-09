Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85B7BD2F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 08:00:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B+dnduR3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pKV40Tzz3dfg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 17:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B+dnduR3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBy08qtz3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:33 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995HOR9010465;
	Mon, 9 Oct 2023 05:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YWdSQueMt3pCSpr7X7HbwV3fvzN6iHdUbSNptS7dxsE=;
 b=B+dnduR37OXCwAr/rfgQMMO7vPtpnoZnrSy9TVs+dL91KYW8btsThVn6rwaRfoCEjEE5
 IjsgHDMs7N9TppP571SIAXeERFvgp6wzBornKzmbhafcL13RV5j2ygdnaMvMaFSHzjwP
 PqhD8F/DlnHv+xN2Iuv/eNpjY5IcahzJxRA4XruonJLBTAn8yL6P9eOB9XN5YshQ+0uD
 dKcH7iDfjmi62xDWQx0kgbwdhVAPPQ3g5uiuMiGb8Tu+9Ux6Hb2H2gEDECDX1aDqBjxm
 0lm6SdCEP+sWtcsQ+vvWgUOP7ITHyFopub8b3ff20l64QZKC8fFth2T83Ao+7HvxjmJ7 xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmb868q57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:29 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995jEvY026767;
	Mon, 9 Oct 2023 05:54:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmb868q50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:28 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3995RAv4028239;
	Mon, 9 Oct 2023 05:54:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1xq4jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sPZN42008844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F60820049;
	Mon,  9 Oct 2023 05:54:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD7B620040;
	Mon,  9 Oct 2023 05:54:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:24 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B075B60635;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/6] powerpc/dexcr: Add sysctl entry for SBHE system override
Date: Mon,  9 Oct 2023 16:54:05 +1100
Message-ID: <20231009055406.142940-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009055406.142940-1-bgray@linux.ibm.com>
References: <20231009055406.142940-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FplYl2RQXqwZUJKXdhqkGz3y9RoBb80S
X-Proofpoint-GUID: eW-YrMTydAIfISFL-Mg9wf7pZ6HTSq4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=809 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090051
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DEXCR Speculative Branch Hint Enable (SBHE) aspect controls whether
the hints provided by BO field of Branch instructions are obeyed during
speculative execution.

SBHE behaviour per ISA 3.1B:

0:	The hints provided by BO field of Branch instructions may be
	ignored during speculative execution

1:	The hints provided by BO field of Branch instructions are obeyed
	during speculative execution

Add a sysctl entry to allow changing this aspect globally in the system
at runtime:

	/proc/sys/kernel/speculative_branch_hint_enable

Three values are supported:

-1:	Disable DEXCR SBHE sysctl override
 0:	Override and set DEXCR[SBHE] aspect to 0
 1:	Override and set DEXCR[SBHE] aspect to 1

Internally, introduces a mechanism to apply arbitrary system wide
overrides on top of the prctl() config.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h |  8 +--
 arch/powerpc/kernel/dexcr.c          | 85 ++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9d83621dfad..e7b732efb968 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -461,14 +461,14 @@ int exit_vmx_usercopy(void);
 int enter_vmx_ops(void);
 void *exit_vmx_ops(void *dest);
 
-static inline unsigned long get_thread_dexcr(struct thread_struct const *thread)
-{
 #ifdef CONFIG_PPC_BOOK3S_64
-	return thread->dexcr_enabled;
+unsigned long get_thread_dexcr(struct thread_struct const *thread);
 #else
+static inline unsigned long get_thread_dexcr(struct thread_struct const *thread)
+{
 	return 0;
-#endif
 }
+#endif
 
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
index db663ce7b3ce..e790f76787db 100644
--- a/arch/powerpc/kernel/dexcr.c
+++ b/arch/powerpc/kernel/dexcr.c
@@ -1,7 +1,9 @@
 #include <linux/capability.h>
+#include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/prctl.h>
 #include <linux/sched.h>
+#include <linux/sysctl.h>
 
 #include <asm/cpu_has_feature.h>
 #include <asm/cputable.h>
@@ -16,6 +18,8 @@
 
 static unsigned long dexcr_supported __ro_after_init = 0;
 
+static int spec_branch_hint_enable = -1;
+
 static int __init dexcr_init(void)
 {
 	if (!early_cpu_has_feature(CPU_FTR_ARCH_31))
@@ -37,6 +41,35 @@ static int __init dexcr_init(void)
 }
 early_initcall(dexcr_init);
 
+unsigned long get_thread_dexcr(struct thread_struct const *thread)
+{
+	unsigned long dexcr = thread->dexcr_enabled;
+
+	/* 
+	 * spec_branch_hint_enable may be written to concurrently via sysctl.
+	 * The sysctl handler is careful to use WRITE_ONCE, so we avoid
+	 * tearing/different values with READ_ONCE 
+	 */
+	switch (READ_ONCE(spec_branch_hint_enable)) {
+	case 0:
+		dexcr &= ~DEXCR_PR_SBHE;
+		break;
+	case 1:
+		dexcr |= DEXCR_PR_SBHE;
+		break;
+	}
+
+	return dexcr;
+}
+
+static void update_dexcr_on_cpu(void *_info)
+{
+	/* ensure the spec_branch_hint_enable write propagated to this CPU */
+	smp_mb();
+
+	mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
+}
+
 static int prctl_to_aspect(unsigned long which, unsigned int *aspect)
 {
 	switch (which) {
@@ -126,3 +159,55 @@ int set_dexcr_prctl(struct task_struct *task, unsigned long which, unsigned long
 
 	return 0;
 }
+
+#ifdef CONFIG_SYSCTL
+
+static const int min_sysctl_val = -1;
+
+static int sysctl_dexcr_sbhe_handler(struct ctl_table *table, int write,
+				     void *buf, size_t *lenp, loff_t *ppos)
+{
+	int err = 0;
+	int prev;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!cpu_has_feature(CPU_FTR_DEXCR_SBHE))
+		return -ENODEV;
+
+	prev = READ_ONCE(spec_branch_hint_enable);
+	
+	err = proc_dointvec_minmax(table, write, buf, lenp, ppos);
+	if (err)
+		return err;
+
+	if (spec_branch_hint_enable != prev && write)
+		on_each_cpu(update_dexcr_on_cpu, NULL, 1);
+
+	return 0;
+}
+
+static struct ctl_table dexcr_sbhe_ctl_table[] = {
+	{
+		.procname	= "speculative_branch_hint_enable",
+		.data		= &spec_branch_hint_enable,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= sysctl_dexcr_sbhe_handler,
+		.extra1		= (void *)&min_sysctl_val,
+		.extra2		= SYSCTL_ONE,
+	}
+};
+
+static int __init register_dexcr_aspects_sysctl(void)
+{
+	if (!early_cpu_has_feature(CPU_FTR_DEXCR_SBHE))
+		return -ENODEV;
+
+	register_sysctl("kernel", dexcr_sbhe_ctl_table);
+	return 0;
+}
+device_initcall(register_dexcr_aspects_sysctl);
+
+#endif /* CONFIG_SYSCTL */
-- 
2.41.0

