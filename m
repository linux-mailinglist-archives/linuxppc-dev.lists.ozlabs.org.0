Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C5374E9B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:36:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLPf4Vqpz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:36:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ia8hfiU1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ia8hfiU1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLNL2RcYz2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:35:13 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464XgaK116881; Thu, 6 May 2021 00:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=A+e7EH9fOS++yCOamP/QunQj8h5agGbR+oXWQkP80UM=;
 b=ia8hfiU18mfH4mhWEa5n3DMJgZGiaWai2SJj7bHBDKh3xr9aC0SrWfdZxeLpPV8qOfKD
 jfRx0I6TmjXpkvZHS7czMqiJJ/wMT2eIKyrCVu0U6+IrHih4B01+5rra/bwwV/L6wtCO
 7wgZXpjEP9wvDmHhUFu1tLcHXjo3d+hdD7k0ONTcyyMBGBrLVmzD+KBTeC1ZBb8DWZet
 V6ecRKGZFqUrGFq+YoBhhT9TP8Y2WJjfnRiqX1va8CQzuqNkRlcdwS5OBbO7Ut+wbDT9
 w+srBsybyL/neU5h7IIM+DMIwwpuG1Dd2isz+bs92V/gH472EEUdRpRJMSmSCZEeZsRX pA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38c9b007gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:34:59 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464XlQf027969;
 Thu, 6 May 2021 04:34:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 38bedu15mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:34:58 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464Yw8F36438326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:34:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2388B28058;
 Thu,  6 May 2021 04:34:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D8F92805A;
 Thu,  6 May 2021 04:34:57 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b01ledav001.gho.pok.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:34:57 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 7C106BC0F81;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 02/11] lkdtm/powerpc: Add test to hijack a patch
 mapping
Date: Wed,  5 May 2021 23:34:43 -0500
Message-Id: <20210506043452.9674-3-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210506043452.9674-1-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CiBgINf1MmH8uvZbqQUNcff6Qc_L0WC6
X-Proofpoint-ORIG-GUID: CiBgINf1MmH8uvZbqQUNcff6Qc_L0WC6
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060029
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When live patching with STRICT_KERNEL_RWX the CPU doing the patching
must temporarily remap the page(s) containing the patch site with +W
permissions. While this temporary mapping is in use, another CPU could
write to the same mapping and maliciously alter kernel text. Implement a
LKDTM test to attempt to exploit such an opening during code patching.
The test is implemented on powerpc and requires LKDTM built into the
kernel (building LKDTM as a module is insufficient).

The LKDTM "hijack" test works as follows:

  1. A CPU executes an infinite loop to patch an instruction. This is
     the "patching" CPU.
  2. Another CPU attempts to write to the address of the temporary
     mapping used by the "patching" CPU. This other CPU is the
     "hijacker" CPU. The hijack either fails with a fault/error or
     succeeds, in which case some kernel text is now overwritten.

The virtual address of the temporary patch mapping is provided via an
LKDTM-specific accessor to the hijacker CPU. This test assumes a
hypothetical situation where this address was leaked previously.

How to run the test:

	mount -t debugfs none /sys/kernel/debug
	(echo HIJACK_PATCH > /sys/kernel/debug/provoke-crash/DIRECT)

A passing test indicates that it is not possible to overwrite kernel
text from another CPU by using the temporary mapping established by
a CPU for patching.

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v4:  * Separate the powerpc and x86_64 bits into individual patches.
     * Use __put_kernel_nofault() when attempting to hijack the mapping
     * Use raw_smp_processor_id() to avoid triggering the BUG() when
       calling smp_processor_id() in preemptible code - the only thing
       that matters is that one of the threads is bound to a different
       CPU - we are not using smp_processor_id() to access any per-cpu
       data or similar where preemption should be disabled.
     * Rework the patching_cpu() kthread stop condition to avoid:
       https://lwn.net/Articles/628628/
---
 drivers/misc/lkdtm/core.c  |   1 +
 drivers/misc/lkdtm/lkdtm.h |   1 +
 drivers/misc/lkdtm/perms.c | 135 +++++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index b2aff4d87c014..857d218840eb8 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -146,6 +146,7 @@ static const struct crashtype crashtypes[] =3D {
 	CRASHTYPE(WRITE_RO),
 	CRASHTYPE(WRITE_RO_AFTER_INIT),
 	CRASHTYPE(WRITE_KERN),
+	CRASHTYPE(HIJACK_PATCH),
 	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
 	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
 	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 5ae48c64df24d..c8de54d189c27 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -61,6 +61,7 @@ void lkdtm_EXEC_USERSPACE(void);
 void lkdtm_EXEC_NULL(void);
 void lkdtm_ACCESS_USERSPACE(void);
 void lkdtm_ACCESS_NULL(void);
+void lkdtm_HIJACK_PATCH(void);
=20
 /* refcount.c */
 void lkdtm_REFCOUNT_INC_OVERFLOW(void);
diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 2dede2ef658f3..c6f96ebffccfd 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mman.h>
 #include <linux/uaccess.h>
+#include <linux/kthread.h>
 #include <asm/cacheflush.h>
=20
 /* Whether or not to fill the target memory area with do_nothing(). */
@@ -222,6 +223,140 @@ void lkdtm_ACCESS_NULL(void)
 	pr_err("FAIL: survived bad write\n");
 }
=20
+#if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
+	defined(CONFIG_PPC))
+/*
+ * This is just a dummy location to patch-over.
+ */
+static void patching_target(void)
+{
+	return;
+}
+
+#include <asm/code-patching.h>
+struct ppc_inst * const patch_site =3D (struct ppc_inst *)&patching_target;
+
+static inline int lkdtm_do_patch(u32 data)
+{
+	return patch_instruction(patch_site, ppc_inst(data));
+}
+
+static inline u32 lkdtm_read_patch_site(void)
+{
+	struct ppc_inst inst =3D READ_ONCE(*patch_site);
+	return ppc_inst_val(ppc_inst_read(&inst));
+}
+
+/* Returns True if the write succeeds */
+static inline bool lkdtm_try_write(u32 data, u32 *addr)
+{
+	__put_kernel_nofault(addr, &data, u32, err);
+	return true;
+
+err:
+	return false;
+}
+
+static int lkdtm_patching_cpu(void *data)
+{
+	int err =3D 0;
+	u32 val =3D 0xdeadbeef;
+
+	pr_info("starting patching_cpu=3D%d\n", raw_smp_processor_id());
+
+	do {
+		err =3D lkdtm_do_patch(val);
+	} while (lkdtm_read_patch_site() =3D=3D val && !err && !kthread_should_st=
op());
+
+	if (err)
+		pr_warn("XFAIL: patch_instruction returned error: %d\n", err);
+
+	while (!kthread_should_stop()) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		schedule();
+	}
+
+	return err;
+}
+
+void lkdtm_HIJACK_PATCH(void)
+{
+	struct task_struct *patching_kthrd;
+	int patching_cpu, hijacker_cpu, attempts;
+	unsigned long addr;
+	bool hijacked;
+	const u32 bad_data =3D 0xbad00bad;
+	const u32 original_insn =3D lkdtm_read_patch_site();
+
+	if (!IS_ENABLED(CONFIG_SMP)) {
+		pr_err("XFAIL: this test requires CONFIG_SMP\n");
+		return;
+	}
+
+	if (num_online_cpus() < 2) {
+		pr_warn("XFAIL: this test requires at least two cpus\n");
+		return;
+	}
+
+	hijacker_cpu =3D raw_smp_processor_id();
+	patching_cpu =3D cpumask_any_but(cpu_online_mask, hijacker_cpu);
+
+	patching_kthrd =3D kthread_create_on_node(&lkdtm_patching_cpu, NULL,
+						cpu_to_node(patching_cpu),
+						"lkdtm_patching_cpu");
+	kthread_bind(patching_kthrd, patching_cpu);
+	wake_up_process(patching_kthrd);
+
+	addr =3D offset_in_page(patch_site) | read_cpu_patching_addr(patching_cpu=
);
+
+	pr_info("starting hijacker_cpu=3D%d\n", hijacker_cpu);
+	for (attempts =3D 0; attempts < 100000; ++attempts) {
+		/* Try to write to the other CPU's temp patch mapping */
+		hijacked =3D lkdtm_try_write(bad_data, (u32 *)addr);
+
+		if (hijacked) {
+			if (kthread_stop(patching_kthrd)) {
+				pr_info("hijack attempts: %d\n", attempts);
+				pr_err("XFAIL: error stopping patching cpu\n");
+				return;
+			}
+			break;
+		}
+	}
+	pr_info("hijack attempts: %d\n", attempts);
+
+	if (hijacked) {
+		if (lkdtm_read_patch_site() =3D=3D bad_data)
+			pr_err("overwrote kernel text\n");
+		/*
+		 * There are window conditions where the hijacker cpu manages to
+		 * write to the patch site but the site gets overwritten again by
+		 * the patching cpu. We still consider that a "successful" hijack
+		 * since the hijacker cpu did not fault on the write.
+		 */
+		pr_err("FAIL: wrote to another cpu's patching area\n");
+	} else {
+		kthread_stop(patching_kthrd);
+	}
+
+	/* Restore the original data to be able to run the test again */
+	lkdtm_do_patch(original_insn);
+}
+
+#else
+
+void lkdtm_HIJACK_PATCH(void)
+{
+	if (!IS_ENABLED(CONFIG_PPC))
+		pr_err("XFAIL: this test only runs on powerpc\n");
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
+	if (!IS_BUILTIN(CONFIG_LKDTM))
+		pr_err("XFAIL: this test requires CONFIG_LKDTM=3Dy (not =3Dm!)\n");
+}
+
+#endif
+
 void __init lkdtm_perms_init(void)
 {
 	/* Make sure we can write to __ro_after_init values during __init */
--=20
2.26.1

