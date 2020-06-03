Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17E1EC8C6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 07:26:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cHTK2WGGzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.43;
 helo=h2.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cHH14FrNzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 15:17:49 +1000 (AEST)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com
 [198.54.127.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 2F42D80847
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 01:17:47 -0400 (EDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 08D5160059;
 Wed,  3 Jun 2020 01:17:37 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.239])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id B944060052;
 Wed,  3 Jun 2020 05:17:36 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@lists.ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [PATCH 5/5] powerpc: Add LKDTM test to hijack a patch mapping
Date: Wed,  3 Jun 2020 00:19:12 -0500
Message-Id: <20200603051912.23296-6-cmr@informatik.wtf>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603051912.23296-1-cmr@informatik.wtf>
References: <20200603051912.23296-1-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When live patching with STRICT_KERNEL_RWX, the CPU doing the patching
must use a temporary mapping which allows for writing to kernel text.
During the entire window of time when this temporary mapping is in use,
another CPU could write to the same mapping and maliciously alter kernel
text. Implement a LKDTM test to attempt to exploit such a openings when
a CPU is patching under STRICT_KERNEL_RWX. The test is only implemented
on powerpc for now.

The LKDTM "hijack" test works as follows:

	1. A CPU executes an infinite loop to patch an instruction.
	   This is the "patching" CPU.
	2. Another CPU attempts to write to the address of the temporary
	   mapping used by the "patching" CPU. This other CPU is the
	   "hijacker" CPU. The hijack either fails with a segfault or
	   succeeds, in which case some kernel text is now overwritten.

How to run the test:

	mount -t debugfs none /sys/kernel/debug
	(echo HIJACK_PATCH > /sys/kernel/debug/provoke-crash/DIRECT)

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 drivers/misc/lkdtm/core.c  |   1 +
 drivers/misc/lkdtm/lkdtm.h |   1 +
 drivers/misc/lkdtm/perms.c | 101 +++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index a5e344df9166..482e72f6a1e1 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -145,6 +145,7 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(WRITE_RO),
 	CRASHTYPE(WRITE_RO_AFTER_INIT),
 	CRASHTYPE(WRITE_KERN),
+	CRASHTYPE(HIJACK_PATCH),
 	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
 	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
 	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 601a2156a0d4..bfcf3542370d 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
 void lkdtm_EXEC_NULL(void);
 void lkdtm_ACCESS_USERSPACE(void);
 void lkdtm_ACCESS_NULL(void);
+void lkdtm_HIJACK_PATCH(void);
 
 /* lkdtm_refcount.c */
 void lkdtm_REFCOUNT_INC_OVERFLOW(void);
diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 62f76d506f04..8bda3b56bc78 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mman.h>
 #include <linux/uaccess.h>
+#include <linux/kthread.h>
 #include <asm/cacheflush.h>
 
 /* Whether or not to fill the target memory area with do_nothing(). */
@@ -213,6 +214,106 @@ void lkdtm_ACCESS_NULL(void)
 	*ptr = tmp;
 }
 
+#if defined(CONFIG_PPC) && defined(CONFIG_STRICT_KERNEL_RWX)
+#include <include/asm/code-patching.h>
+
+extern unsigned long read_cpu_patching_addr(unsigned int cpu);
+
+static struct ppc_inst * const patch_site = (struct ppc_inst *)&do_nothing;
+
+static int lkdtm_patching_cpu(void *data)
+{
+	int err = 0;
+	struct ppc_inst insn = ppc_inst(0xdeadbeef);
+
+	pr_info("starting patching_cpu=%d\n", smp_processor_id());
+	do {
+		err = patch_instruction(patch_site, insn);
+	} while (ppc_inst_equal(ppc_inst_read(READ_ONCE(patch_site)), insn) &&
+			!err && !kthread_should_stop());
+
+	if (err)
+		pr_warn("patch_instruction returned error: %d\n", err);
+
+	set_current_state(TASK_INTERRUPTIBLE);
+	while (!kthread_should_stop()) {
+		schedule();
+		set_current_state(TASK_INTERRUPTIBLE);
+	}
+
+	return err;
+}
+
+void lkdtm_HIJACK_PATCH(void)
+{
+	struct task_struct *patching_kthrd;
+	struct ppc_inst original_insn;
+	int patching_cpu, hijacker_cpu, attempts;
+	unsigned long addr;
+	bool hijacked;
+
+	if (num_online_cpus() < 2) {
+		pr_warn("need at least two cpus\n");
+		return;
+	}
+
+	original_insn = ppc_inst_read(READ_ONCE(patch_site));
+
+	hijacker_cpu = smp_processor_id();
+	patching_cpu = cpumask_any_but(cpu_online_mask, hijacker_cpu);
+
+	patching_kthrd = kthread_create_on_node(&lkdtm_patching_cpu, NULL,
+						cpu_to_node(patching_cpu),
+						"lkdtm_patching_cpu");
+	kthread_bind(patching_kthrd, patching_cpu);
+	wake_up_process(patching_kthrd);
+
+	addr = offset_in_page(patch_site) | read_cpu_patching_addr(patching_cpu);
+
+	pr_info("starting hijacker_cpu=%d\n", hijacker_cpu);
+	for (attempts = 0; attempts < 100000; ++attempts) {
+		/* Use __put_user to catch faults without an Oops */
+		hijacked = !__put_user(0xbad00bad, (unsigned int *)addr);
+
+		if (hijacked) {
+			if (kthread_stop(patching_kthrd))
+				goto out;
+			break;
+		}
+	}
+	pr_info("hijack attempts: %d\n", attempts);
+
+	if (hijacked) {
+		if (*(unsigned int *)READ_ONCE(patch_site) == 0xbad00bad)
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
+out:
+	/* Restore the original insn for any future lkdtm tests */
+	patch_instruction(patch_site, original_insn);
+}
+
+#else
+
+void lkdtm_HIJACK_PATCH(void)
+{
+	if (!IS_ENABLED(CONFIG_PPC))
+		pr_err("XFAIL: this test is powerpc-only\n");
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
+}
+
+#endif /* CONFIG_PPC && CONFIG_STRICT_KERNEL_RWX */
+
 void __init lkdtm_perms_init(void)
 {
 	/* Make sure we can write to __ro_after_init values during __init */
-- 
2.26.2

