Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 491228A8208
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:26:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouh6cd9a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJWx0bW7z3vjM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouh6cd9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSr3fPjz3cZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:23:56 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBCGSs031047;
	Wed, 17 Apr 2024 11:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EQADGQJ9Fn3HOB6fx7xtUDrlYRMNVwFkFb4raHaP2pc=;
 b=ouh6cd9aNWYQB0Rje+mU1JvAdPJ9GgOkCXcXDTI6wiHYYzHWSEBV7z+/nQiyp8Poe56i
 qqz6WtHGylhUvw5xFsBFHIcLJPSFgMm13FaCFz7o04jtQT91FnUGANVHs3iWaKEwqm/b
 pUBPtOydU7ADf7dGWbNawtayr+d0Y4BWqggC0ggNQIL1MdRHkLlJgyO1c837uooNbhzd
 swTkv+7MJET6vrqzMRiP/ugm2LFZShV+EIcwooUwO0GGdiOJLCGc2/vgyuwgLX0VO7e+
 D/6ynG6Zm5QpPydZccoAWz2rHbGdL6sYiUWsei8TfW2oycLaw2OZwdcFewHGf+YuJD5V Kg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjdbag0uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:52 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43H8Hm7H018152;
	Wed, 17 Apr 2024 11:23:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg4ctc64q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNlUC54723036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D68872004E;
	Wed, 17 Apr 2024 11:23:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01BDA20043;
	Wed, 17 Apr 2024 11:23:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:46 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7C09C600D6;
	Wed, 17 Apr 2024 21:23:44 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 4/9] powerpc/dexcr: Add DEXCR prctl interface
Date: Wed, 17 Apr 2024 21:23:20 +1000
Message-ID: <20240417112325.728010-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9kAKuA8Cs2Qa_BrwgAffgPAAyRABKkhO
X-Proofpoint-ORIG-GUID: 9kAKuA8Cs2Qa_BrwgAffgPAAyRABKkhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170078
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we track a DEXCR on a per-task basis, individual tasks are free
to configure it as they like.

The interface is a pair of getter/setter prctl's that work on a single
aspect at a time (multiple aspects at once is more difficult if there
are different rules applied for each aspect, now or in future). The
getter shows the current state of the process config, and the setter
allows setting/clearing the aspect.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

I'm intentionally trying to avoid saying 'enabling' or 'disabling' the
aspect, as that could be confusing when the aspects themselves may
'enable' or 'disable' their feature when the aspect is set.
---
 arch/powerpc/include/asm/processor.h | 10 +++
 arch/powerpc/kernel/dexcr.c          | 99 ++++++++++++++++++++++++++++
 include/uapi/linux/prctl.h           | 16 +++++
 kernel/sys.c                         | 16 +++++
 4 files changed, 141 insertions(+)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index aad85a24134a..e44cac0da346 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -334,6 +334,16 @@ extern int set_endian(struct task_struct *tsk, unsigned int val);
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
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
index f65c359968cc..f50247b3daa1 100644
--- a/arch/powerpc/kernel/dexcr.c
+++ b/arch/powerpc/kernel/dexcr.c
@@ -19,3 +19,102 @@ static int __init init_task_dexcr(void)
 	return 0;
 }
 early_initcall(init_task_dexcr)
+
+/* Allow thread local configuration of these by default */
+#define DEXCR_PRCTL_EDITABLE ( \
+	DEXCR_PR_IBRTPD | \
+	DEXCR_PR_SRAPD | \
+	DEXCR_PR_NPHIE)
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
+	if (aspect & DEXCR_PRCTL_EDITABLE)
+		ret |= PR_PPC_DEXCR_CTRL_EDITABLE;
+
+	if (aspect & mfspr(SPRN_DEXCR))
+		ret |= PR_PPC_DEXCR_CTRL_SET;
+	else
+		ret |= PR_PPC_DEXCR_CTRL_CLEAR;
+
+	if (aspect & task->thread.dexcr_onexec)
+		ret |= PR_PPC_DEXCR_CTRL_SET_ONEXEC;
+	else
+		ret |= PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC;
+
+	return ret;
+}
+
+int set_dexcr_prctl(struct task_struct *task, unsigned long which, unsigned long ctrl)
+{
+	unsigned long dexcr;
+	unsigned int aspect;
+	int err = 0;
+
+	err = prctl_to_aspect(which, &aspect);
+	if (err)
+		return err;
+
+	if (!(aspect & DEXCR_PRCTL_EDITABLE))
+		return -EPERM;
+
+	if (ctrl & ~PR_PPC_DEXCR_CTRL_MASK)
+		return -EINVAL;
+
+	if (ctrl & PR_PPC_DEXCR_CTRL_SET && ctrl & PR_PPC_DEXCR_CTRL_CLEAR)
+		return -EINVAL;
+
+	if (ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC && ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC)
+		return -EINVAL;
+
+	/*
+	 * We do not want an unprivileged process being able to disable
+	 * a setuid process's hash check instructions
+	 */
+	if (aspect == DEXCR_PR_NPHIE && ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	dexcr = mfspr(SPRN_DEXCR);
+
+	if (ctrl & PR_PPC_DEXCR_CTRL_SET)
+		dexcr |= aspect;
+	else if (ctrl & PR_PPC_DEXCR_CTRL_CLEAR)
+		dexcr &= ~aspect;
+
+	if (ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC)
+		task->thread.dexcr_onexec |= aspect;
+	else if (ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC)
+		task->thread.dexcr_onexec &= ~aspect;
+
+	mtspr(SPRN_DEXCR, dexcr);
+
+	return 0;
+}
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..3ffd463ac8fe 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,20 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+/* PowerPC Dynamic Execution Control Register (DEXCR) controls */
+#define PR_PPC_GET_DEXCR		71
+#define PR_PPC_SET_DEXCR		72
+/* DEXCR aspect to act on */
+# define PR_PPC_DEXCR_SBHE		0 /* Speculative branch hint enable */
+# define PR_PPC_DEXCR_IBRTPD		1 /* Indirect branch recurrent target prediction disable */
+# define PR_PPC_DEXCR_SRAPD		2 /* Subroutine return address prediction disable */
+# define PR_PPC_DEXCR_NPHIE		3 /* Non-privileged hash instruction enable */
+/* Action to apply / return */
+# define PR_PPC_DEXCR_CTRL_EDITABLE		(1UL << 0) /* This aspect can be modified with PR_PPC_SET_DEXCR */
+# define PR_PPC_DEXCR_CTRL_SET			(1UL << 1) /* Set the aspect for this process */
+# define PR_PPC_DEXCR_CTRL_CLEAR		(1UL << 2) /* Clear the aspect for this process */
+# define PR_PPC_DEXCR_CTRL_SET_ONEXEC		(1UL << 3) /* Set the aspect on exec */
+# define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC		(1UL << 4) /* Clear the aspect on exec */
+# define PR_PPC_DEXCR_CTRL_MASK			0x1f
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 8bb106a56b3a..f9c95410278c 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -146,6 +146,12 @@
 #ifndef RISCV_V_GET_CONTROL
 # define RISCV_V_GET_CONTROL()		(-EINVAL)
 #endif
+#ifndef PPC_GET_DEXCR_ASPECT
+# define PPC_GET_DEXCR_ASPECT(a, b)	(-EINVAL)
+#endif
+#ifndef PPC_SET_DEXCR_ASPECT
+# define PPC_SET_DEXCR_ASPECT(a, b, c)	(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2726,6 +2732,16 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_GET_MDWE:
 		error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
 		break;
+	case PR_PPC_GET_DEXCR:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = PPC_GET_DEXCR_ASPECT(me, arg2);
+		break;
+	case PR_PPC_SET_DEXCR:
+		if (arg4 || arg5)
+			return -EINVAL;
+		error = PPC_SET_DEXCR_ASPECT(me, arg2, arg3);
+		break;
 	case PR_SET_VMA:
 		error = prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
-- 
2.44.0

