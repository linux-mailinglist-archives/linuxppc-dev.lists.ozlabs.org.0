Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28D7BD2ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:57:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iNxBRqq2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pFj6lrqz3vYM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iNxBRqq2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBv68z1z2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:31 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995qVC2022856;
	Mon, 9 Oct 2023 05:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=llc8k/lSG79O1srVasIib2I0BfCSX9Tb3xvJLUp9nTc=;
 b=iNxBRqq25zYvPdmv5nRV4THv8ChqyujjZn5RWb3+3WHi1ZDjoEBOZIOyiqvD4i4UcHo6
 uFQkkKbQsLaANuwh0gwikpIJHnn3MBxhaoTHy20ufYvuqSH0htRRB/4oDjQY5BMHambE
 CwLvVaGtW+RboYEMtyezSvnSBfXF236VHD50xAO3O216juhJyl8IA4+NKBnw3IqJPnIp
 mzftrfdjU/alBfV64q93PZUZGSutnWaBfzjvGZuTS2athk/a3tHFITkLgUj/eNoiyCrr
 Dz1SN+zKfzU0ood3Vw0ykCZm5ZL1G2RbJf7qC1Z8GzslqJ7TjnP4z1qR/PAbKbjzrPTh sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbrg80yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:27 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995r4eb026670;
	Mon, 9 Oct 2023 05:54:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbrg80xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3992I1br026364;
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnmxxdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:25 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sNwc8585840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E9DC20043;
	Mon,  9 Oct 2023 05:54:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EAC220040;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AEB81600F5;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/6] powerpc/dexcr: Add prctl implementation
Date: Mon,  9 Oct 2023 16:54:04 +1100
Message-ID: <20231009055406.142940-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009055406.142940-1-bgray@linux.ibm.com>
References: <20231009055406.142940-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RUUvaayjnUXHqOkZHzyjqiFrKFgGfRFU
X-Proofpoint-ORIG-GUID: A-D6KcW4A9v0wjnzTex2bsuhjhTC-UHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=747 bulkscore=0
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

Adds an initial prctl interface implementation. Unprivileged processes
can query the current prctl setting, including whether an aspect is
implemented by the hardware or is permitted to be modified by a setter
prctl. Editable aspects can be changed by a CAP_SYS_ADMIN privileged
process.

The prctl setting represents what the process itself has requested, and
does not account for any overrides. Either the kernel or a hypervisor
may enforce a different setting for an aspect.

Userspace can access a readonly view of the current DEXCR via SPR 812,
and a readonly view of the aspects enforced by the hypervisor via
SPR 455. A bitwise OR of these two SPRs will give the effective
DEXCR aspect state of the process.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h |  10 +++
 arch/powerpc/kernel/Makefile         |   1 +
 arch/powerpc/kernel/dexcr.c          | 128 +++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 arch/powerpc/kernel/dexcr.c

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 28a72023f9bd..a9d83621dfad 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -336,6 +336,16 @@ extern int set_endian(struct task_struct *tsk, unsigned int val);
 extern int get_unalign_ctl(struct task_struct *tsk, unsigned long adr);
 extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+
+#define PPC_GET_DEXCR_ASPECT(tsk, asp) get_dexcr_prctl((tsk), (asp))
+#define PPC_SET_DEXCR_ASPECT(tsk, asp, val) set_dexcr_prctl((tsk), (asp), (val))
+
+int get_dexcr_prctl(struct task_struct *tsk, unsigned long asp);
+int set_dexcr_prctl(struct task_struct *tsk, unsigned long asp, unsigned long val);
+
+#endif
+
 extern void load_fp_state(struct thread_fp_state *fp);
 extern void store_fp_state(struct thread_fp_state *fp);
 extern void load_vr_state(struct thread_vr_state *vr);
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2919433be355..24f82b09246c 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_PPC_DAWR)		+= dawr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= dexcr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
 obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_64e.o
 obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
new file mode 100644
index 000000000000..db663ce7b3ce
--- /dev/null
+++ b/arch/powerpc/kernel/dexcr.c
@@ -0,0 +1,128 @@
+#include <linux/capability.h>
+#include <linux/init.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/cputable.h>
+#include <asm/processor.h>
+#include <asm/reg.h>
+
+/* Allow thread local configuration of these by default */
+#define DEXCR_PRCTL_EDITABLE ( \
+	DEXCR_PR_IBRTPD | \
+	DEXCR_PR_SRAPD | \
+	DEXCR_PR_NPHIE)
+
+static unsigned long dexcr_supported __ro_after_init = 0;
+
+static int __init dexcr_init(void)
+{
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_31))
+		return 0;
+
+	if (early_cpu_has_feature(CPU_FTR_DEXCR_SBHE))
+		dexcr_supported |= DEXCR_PR_SBHE;
+
+	if (early_cpu_has_feature(CPU_FTR_DEXCR_IBRTPD))
+		dexcr_supported |= DEXCR_PR_IBRTPD;
+
+	if (early_cpu_has_feature(CPU_FTR_DEXCR_SRAPD))
+		dexcr_supported |= DEXCR_PR_SRAPD;
+
+	if (early_cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		dexcr_supported |= DEXCR_PR_NPHIE;
+
+	return 0;
+}
+early_initcall(dexcr_init);
+
+static int prctl_to_aspect(unsigned long which, unsigned int *aspect)
+{
+	switch (which) {
+	case PR_PPC_DEXCR_SBHE:
+		*aspect = DEXCR_PR_SBHE;
+		break;
+	case PR_PPC_DEXCR_IBRTPD:
+		*aspect = DEXCR_PR_IBRTPD;
+		break;
+	case PR_PPC_DEXCR_SRAPD:
+		*aspect = DEXCR_PR_SRAPD;
+		break;
+	case PR_PPC_DEXCR_NPHIE:
+		*aspect = DEXCR_PR_NPHIE;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+int get_dexcr_prctl(struct task_struct *task, unsigned long which)
+{
+	unsigned int aspect;
+	int ret;
+
+	ret = prctl_to_aspect(which, &aspect);
+	if (ret)
+		return ret;
+	
+	if (!(aspect & dexcr_supported))
+		return -ENODEV;
+
+	if (aspect & task->thread.dexcr_enabled)
+		ret |= PR_PPC_DEXCR_CTRL_ON;
+	else
+		ret |= PR_PPC_DEXCR_CTRL_OFF;
+
+	if (aspect & task->thread.dexcr_inherit)
+		ret |= PR_PPC_DEXCR_CTRL_INHERIT;
+
+	return ret;
+}
+
+int set_dexcr_prctl(struct task_struct *task, unsigned long which, unsigned long ctrl)
+{
+	unsigned int aspect;
+	unsigned long enable;
+	unsigned long disable;
+	unsigned long inherit;
+	int err = 0;
+
+	/* We do not want an unprivileged process being able to set a value that a setuid process may inherit (particularly for NPHIE) */
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	err = prctl_to_aspect(which, &aspect);
+	if (err)
+		return err;
+
+	if (!(aspect & dexcr_supported))
+		return -ENODEV;
+
+	enable = ctrl & PR_PPC_DEXCR_CTRL_ON;
+	disable = ctrl & PR_PPC_DEXCR_CTRL_OFF;
+	inherit = ctrl & PR_PPC_DEXCR_CTRL_INHERIT;
+	ctrl &= ~(PR_PPC_DEXCR_CTRL_ON | PR_PPC_DEXCR_CTRL_OFF | PR_PPC_DEXCR_CTRL_INHERIT);
+
+	if (ctrl)
+		return -EINVAL;
+
+	if ((enable && disable) || !(enable || disable))
+		return -EINVAL;
+
+	if (enable)
+		task->thread.dexcr_enabled |= aspect;
+	else
+		task->thread.dexcr_enabled &= ~aspect;
+
+	if (inherit)
+		task->thread.dexcr_inherit |= aspect;
+	else
+		task->thread.dexcr_inherit &= ~aspect;
+
+	mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
+
+	return 0;
+}
-- 
2.41.0

