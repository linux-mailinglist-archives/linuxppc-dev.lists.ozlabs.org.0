Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0BC639FD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:58:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL9CJ5XNfz3fJG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:58:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jvy2YMP3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jvy2YMP3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wt3yS5z3cN5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:46:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2073Q031281;
	Mon, 28 Nov 2022 02:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=a/Rq0+U1+15sqcQSlIDpM91XzZeSDEDxu2YquRk1eAc=;
 b=Jvy2YMP3peJQ0kUDmfBAafuJknhNWEnKTEKRuU+TBgaO+oNQkpn4fSMmZnZL++vuQ8/g
 IPElYcVcjGlkXsrjWACVII+H8XXhSK3S3jTzPmQmMdCkmjGFJk6/DwLIsZjn057AsTYu
 VD6Iel173zUiGTCXCCYjOdpTrbFV2qyk5/QBQ0AkIvcnDqqgLoYEbQRUNsvI7aoGSopn
 F+IdPBDJLODz4p/6B60+q1uDJejhKOB4JynlbdYRm7yowl/tsInvCnSi+UBe/Uz4bU8g
 x5xuFrMjRVZfe8euKGKcuAzc5yodM+ouv9xL9cA5sK3lVrZOMHb5PJxEYnmtW2Jcwudl ww== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn6ups4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2ZSWq004979;
	Mon, 28 Nov 2022 02:45:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3m3ae91bb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jjO623724292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1C875204F;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 534115204E;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 538D36083B;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 07/13] powerpc/dexcr: Add sysctl entry for SBHE system override
Date: Mon, 28 Nov 2022 13:44:52 +1100
Message-Id: <20221128024458.46121-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _S9RuewqPl6ZVPFqKschrucwXbaaOpkr
X-Proofpoint-ORIG-GUID: _S9RuewqPl6ZVPFqKschrucwXbaaOpkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
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
 arch/powerpc/kernel/dexcr.c | 125 ++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
index 9290beed722a..8239bcc92026 100644
--- a/arch/powerpc/kernel/dexcr.c
+++ b/arch/powerpc/kernel/dexcr.c
@@ -1,8 +1,11 @@
 #include <linux/cache.h>
 #include <linux/capability.h>
+#include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/prctl.h>
 #include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/sysctl.h>
 
 #include <asm/cpu_has_feature.h>
 #include <asm/cputable.h>
@@ -18,6 +21,58 @@
 #define DEXCR_PRCTL_EDITABLE (DEXCR_PRO_SBHE | DEXCR_PRO_IBRTPD | \
 			      DEXCR_PRO_SRAPD | DEXCR_PRO_NPHIE)
 
+/*
+ * Lock to protect system DEXCR override from concurrent updates.
+ * RCU semantics: writers take lock, readers are unlocked.
+ * Writers ensure the memory update is atomic, readers read
+ * atomically.
+ */
+static DEFINE_SPINLOCK(dexcr_sys_enforced_write_lock);
+
+struct mask_override {
+	union {
+		struct {
+			unsigned int mask;
+			unsigned int override;
+		};
+
+		/* Raw access for atomic read/write */
+		unsigned long all;
+	};
+};
+
+static struct mask_override dexcr_sys_enforced;
+
+static int spec_branch_hint_enable = -1;
+
+static void update_userspace_system_dexcr(unsigned int pro_mask, int value)
+{
+	struct mask_override update = { .all = 0 };
+
+	switch (value) {
+	case -1:  /* Clear the mask bit, clear the override bit */
+		break;
+	case 0:  /* Set the mask bit, clear the override bit */
+		update.mask |= pro_mask;
+		break;
+	case 1:  /* Set the mask bit, set the override bit */
+		update.mask |= pro_mask;
+		update.override |= pro_mask;
+		break;
+	}
+
+	spin_lock(&dexcr_sys_enforced_write_lock);
+
+	/* Use the existing values for the non-updated bits */
+	update.mask |= dexcr_sys_enforced.mask & ~pro_mask;
+	update.override |= dexcr_sys_enforced.override & ~pro_mask;
+
+	/* Atomically update system enforced aspects */
+	WRITE_ONCE(dexcr_sys_enforced.all, update.all);
+
+	spin_unlock(&dexcr_sys_enforced_write_lock);
+}
+
 static int __init dexcr_init(void)
 {
 	if (!early_cpu_has_feature(CPU_FTR_ARCH_31))
@@ -25,6 +80,9 @@ static int __init dexcr_init(void)
 
 	mtspr(SPRN_DEXCR, DEFAULT_DEXCR);
 
+	if (early_cpu_has_feature(CPU_FTR_DEXCR_SBHE))
+		update_userspace_system_dexcr(DEXCR_PRO_SBHE, spec_branch_hint_enable);
+
 	return 0;
 }
 early_initcall(dexcr_init);
@@ -52,9 +110,15 @@ unsigned long get_thread_dexcr(struct thread_struct const *t)
 {
 	unsigned long dexcr = DEFAULT_DEXCR;
 
+	/* Atomically read enforced mask & override */
+	struct mask_override enforced = READ_ONCE(dexcr_sys_enforced);
+
 	/* Apply prctl overrides */
 	dexcr = (dexcr & ~t->dexcr_mask) | t->dexcr_override;
 
+	/* Apply system overrides */
+	dexcr = (dexcr & ~enforced.mask) | enforced.override;
+
 	return dexcr;
 }
 
@@ -176,3 +240,64 @@ int dexcr_prctl_set(struct task_struct *task, unsigned long which, unsigned long
 
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
+	int err;
+	int prev = spec_branch_hint_enable;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!cpu_has_feature(CPU_FTR_DEXCR_SBHE))
+		return -ENODEV;
+
+	err = proc_dointvec_minmax(table, write, buf, lenp, ppos);
+	if (err)
+		return err;
+
+	if (prev != spec_branch_hint_enable && write) {
+		update_userspace_system_dexcr(DEXCR_PRO_SBHE, spec_branch_hint_enable);
+		cpus_read_lock();
+		on_each_cpu(update_dexcr_on_cpu, NULL, 1);
+		cpus_read_unlock();
+	}
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
+	},
+	{}
+};
+
+static struct ctl_table dexcr_sbhe_ctl_root[] = {
+	{
+		.procname	= "kernel",
+		.mode		= 0555,
+		.child		= dexcr_sbhe_ctl_table,
+	},
+	{}
+};
+
+static int __init register_dexcr_aspects_sysctl(void)
+{
+	register_sysctl_table(dexcr_sbhe_ctl_root);
+	return 0;
+}
+device_initcall(register_dexcr_aspects_sysctl);
+
+#endif /* CONFIG_SYSCTL */
-- 
2.38.1

