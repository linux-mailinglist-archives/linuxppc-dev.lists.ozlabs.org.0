Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2EC3C69BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8Qw1Y9Lz3bms
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:32:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bEH/DsR8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bEH/DsR8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8Py3Bxjz2yNg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:31:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D53XHO119564; Tue, 13 Jul 2021 01:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=DtYP5XN1CsxXX7UBfgH6ySeCaEngl6vOJxB5xrPS5/E=;
 b=bEH/DsR8jMXbD7eXFsHS2/hh/hGdwB+FjciKFywvTshSjQO9WMTH3HR0dpW5ug8Z6X2j
 1V+iskjHhDV2bEcKV9gfZ/7Mf82pJ5E31BNBEGorlGJ9R1bwNvLASRv7VrSbw4VJINab
 FlqWW6y7QOQuR0p3cvGyh0kxxFVC/yJWIW8Crph/clwkBmgDNZtTxMGpH2DETRjZLmyg
 0bHKlAUZ3B5/0BXZ93PHIKjnhzvvJHvVPdQrG9F8Rg1bjcqKm9l61ICZUHgWY2uYrgFR
 XkchTXTdgdvYQFl5IdtImVzHdyGIkRaMz16vlzyYabAMSUI3W6qnkEYSiWl+euYkBHYR vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrud7rvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:20 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D53ZZV119725;
 Tue, 13 Jul 2021 01:31:19 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrud7rv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:19 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5SMTc005680;
 Tue, 13 Jul 2021 05:31:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 39q36aqrme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:31:18 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D5VIQv19399004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:31:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3336011206B;
 Tue, 13 Jul 2021 05:31:18 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 775F1112062;
 Tue, 13 Jul 2021 05:31:17 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.163.19.100])
 by b01ledav004.gho.pok.ibm.com (Postfix) with SMTP;
 Tue, 13 Jul 2021 05:31:17 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id EE361BC0B10;
 Tue, 13 Jul 2021 00:31:14 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/8] lkdtm/powerpc: Add test to hijack a patch mapping
Date: Tue, 13 Jul 2021 00:31:07 -0500
Message-Id: <20210713053113.4632-3-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210713053113.4632-1-cmr@linux.ibm.com>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jd6MifBtV9SwMGPc5Y040WowAE7piuio
X-Proofpoint-ORIG-GUID: 1WDkelcbjVrxgZebfw7E7PHsMiHhboTJ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130022
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
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

v5:  * Use `u32*` instead of `struct ppc_inst*` based on new series in
       upstream.

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
 drivers/misc/lkdtm/perms.c | 134 +++++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index 8024b6a5cc7fc..fbcb95eda337b 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -147,6 +147,7 @@ static const struct crashtype crashtypes[] =3D {
 	CRASHTYPE(WRITE_RO),
 	CRASHTYPE(WRITE_RO_AFTER_INIT),
 	CRASHTYPE(WRITE_KERN),
+	CRASHTYPE(HIJACK_PATCH),
 	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
 	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
 	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 99f90d3e5e9cb..87e7e6136d962 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
 void lkdtm_EXEC_NULL(void);
 void lkdtm_ACCESS_USERSPACE(void);
 void lkdtm_ACCESS_NULL(void);
+void lkdtm_HIJACK_PATCH(void);
=20
 /* refcount.c */
 void lkdtm_REFCOUNT_INC_OVERFLOW(void);
diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 2dede2ef658f3..39e7456852229 100644
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
@@ -222,6 +223,139 @@ void lkdtm_ACCESS_NULL(void)
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
+const u32 *patch_site =3D (const u32 *)&patching_target;
+
+static inline int lkdtm_do_patch(u32 data)
+{
+	return patch_instruction((u32 *)patch_site, ppc_inst(data));
+}
+
+static inline u32 lkdtm_read_patch_site(void)
+{
+	return READ_ONCE(*patch_site);
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

