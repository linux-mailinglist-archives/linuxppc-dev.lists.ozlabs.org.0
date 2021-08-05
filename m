Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6143E0F28
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgKv547nsz3dcL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:27:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rjBxqSUN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rjBxqSUN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgKrT0NSmz3cT3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:25:12 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1757ArRc140705; Thu, 5 Aug 2021 03:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zWG0pHLszMGhSn12UZYrNCEJ4kEU5e+/nJEH1VtnCbY=;
 b=rjBxqSUNl1298zvP70DGBEcSvtZNiMRqLq7oxDmMzKjeLoenf2M0VfW5GCGjdMHtjoSw
 /Ee2QTnAb/6Rma1yfuGZJHwRNpi7z9oL8ETAdBogcqcQFXPqwhdyRCbH78BpmkDJXfiu
 hNBwcjLYBQddR+tpE7O+CHYZykhi07Iz+AucYCHeprDgVTDFcSPDJ+m76PrSL1PCk5g4
 +SFNvGLVuhut3zSZQ2O+75LB0pt68x1558BnfMdOKNgTqPKEtmmtCEGXv78DVO0vRqNQ
 KKvQvN/FzL7AiPydcJtVCbkEGrJNDe2LKOsxBAiy35IcWfok2V0VpfELChlXSlm/+Lv1 qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a89p12m8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:25:11 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1757BB8i142349;
 Thu, 5 Aug 2021 03:25:10 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a89p12m8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:25:10 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17576Z6O004876;
 Thu, 5 Aug 2021 07:25:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3a4x58sncp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:25:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1757P3WA44761538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:25:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9623EA4072;
 Thu,  5 Aug 2021 07:25:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9054CA4078;
 Thu,  5 Aug 2021 07:25:01 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 07:25:01 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 5/5] pseries: Asynchronous page fault support
Date: Thu,  5 Aug 2021 12:54:39 +0530
Message-Id: <20210805072439.501481-6-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805072439.501481-1-bharata@linux.ibm.com>
References: <20210805072439.501481-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7wOzeE0FsfaShdDy-z2XiZChE7Y6VxLl
X-Proofpoint-ORIG-GUID: -Kqv53yqYFxZ7tMee0W8_aVyrDNjzYCw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050041
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 kvm@vger.kernel.org, bharata.rao@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add asynchronous page fault support for pseries guests.

1. Setup the guest to handle async-pf
   - Issue H_REG_SNS hcall to register the SNS region.
   - Setup the subvention interrupt irq.
   - Enable async-pf by updating the byte_b9 of VPA for each
     CPU.
2. Check if the page fault is an expropriation notification
   (SRR1_PROGTRAP set in SRR1) and if so put the task on
   wait queue based on the expropriation correlation number
   read from the VPA.
3. Handle subvention interrupt to wake any waiting tasks.
   The wait and wakeup mechanism from x86 async-pf implementation
   is being reused here.

TODO:
- Check how to keep this feature together with other CMO features.
- The async-pf check in the page fault handler path is limited to
  guest with an #ifdef. This isn't sufficient and hence needs to
  be replaced by an appropriate check.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/async-pf.h       |  12 ++
 arch/powerpc/mm/fault.c                   |   7 +-
 arch/powerpc/platforms/pseries/Makefile   |   2 +-
 arch/powerpc/platforms/pseries/async-pf.c | 219 ++++++++++++++++++++++
 4 files changed, 238 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/async-pf.h
 create mode 100644 arch/powerpc/platforms/pseries/async-pf.c

diff --git a/arch/powerpc/include/asm/async-pf.h b/arch/powerpc/include/asm/async-pf.h
new file mode 100644
index 000000000000..95d6c3da9f50
--- /dev/null
+++ b/arch/powerpc/include/asm/async-pf.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Async page fault support via PAPR Expropriation/Subvention Notification
+ * option(ESN)
+ *
+ * Copyright 2020 Bharata B Rao, IBM Corp. <bharata@linux.ibm.com>
+ */
+
+#ifndef _ASM_POWERPC_ASYNC_PF_H
+int handle_async_page_fault(struct pt_regs *regs, unsigned long addr);
+#define _ASM_POWERPC_ASYNC_PF_H
+#endif
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index a8d0ce85d39a..bbdc61605885 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -44,7 +44,7 @@
 #include <asm/debug.h>
 #include <asm/kup.h>
 #include <asm/inst.h>
-
+#include <asm/async-pf.h>
 
 /*
  * do_page_fault error handling helpers
@@ -395,6 +395,11 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	vm_fault_t fault, major = 0;
 	bool kprobe_fault = kprobe_page_fault(regs, 11);
 
+#ifdef CONFIG_PPC_PSERIES
+	if (handle_async_page_fault(regs, address))
+		return 0;
+#endif
+
 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
 
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 4cda0ef87be0..e0ada605ef20 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -6,7 +6,7 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   of_helpers.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
-			   pci.o pci_dlpar.o eeh_pseries.o msi.o
+			   pci.o pci_dlpar.o eeh_pseries.o msi.o async-pf.o
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_SCANLOG)	+= scanlog.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec.o
diff --git a/arch/powerpc/platforms/pseries/async-pf.c b/arch/powerpc/platforms/pseries/async-pf.c
new file mode 100644
index 000000000000..c2f3bbc0d674
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/async-pf.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Async page fault support via PAPR Expropriation/Subvention Notification
+ * option(ESN)
+ *
+ * Copyright 2020 Bharata B Rao, IBM Corp. <bharata@linux.ibm.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/swait.h>
+#include <linux/irqdomain.h>
+#include <asm/machdep.h>
+#include <asm/hvcall.h>
+#include <asm/paca.h>
+
+static char sns_buffer[PAGE_SIZE] __aligned(4096);
+static uint16_t *esn_q = (uint16_t *)sns_buffer + 1;
+static unsigned long next_eq_entry, nr_eq_entries;
+
+#define ASYNC_PF_SLEEP_HASHBITS 8
+#define ASYNC_PF_SLEEP_HASHSIZE (1<<ASYNC_PF_SLEEP_HASHBITS)
+
+/* Controls access to SNS buffer */
+static DEFINE_RAW_SPINLOCK(async_sns_guest_lock);
+
+/* Wait queue handling is from x86 asyn-pf implementation */
+struct async_pf_sleep_node {
+	struct hlist_node link;
+	struct swait_queue_head wq;
+	u64 token;
+	int cpu;
+};
+
+static struct async_pf_sleep_head {
+	raw_spinlock_t lock;
+	struct hlist_head list;
+} async_pf_sleepers[ASYNC_PF_SLEEP_HASHSIZE];
+
+static struct async_pf_sleep_node *_find_apf_task(struct async_pf_sleep_head *b,
+						  u64 token)
+{
+	struct hlist_node *p;
+
+	hlist_for_each(p, &b->list) {
+		struct async_pf_sleep_node *n =
+			hlist_entry(p, typeof(*n), link);
+		if (n->token == token)
+			return n;
+	}
+
+	return NULL;
+}
+static int async_pf_queue_task(u64 token, struct async_pf_sleep_node *n)
+{
+	u64 key = hash_64(token, ASYNC_PF_SLEEP_HASHBITS);
+	struct async_pf_sleep_head *b = &async_pf_sleepers[key];
+	struct async_pf_sleep_node *e;
+
+	raw_spin_lock(&b->lock);
+	e = _find_apf_task(b, token);
+	if (e) {
+		/* dummy entry exist -> wake up was delivered ahead of PF */
+		hlist_del(&e->link);
+		raw_spin_unlock(&b->lock);
+		kfree(e);
+		return false;
+	}
+
+	n->token = token;
+	n->cpu = smp_processor_id();
+	init_swait_queue_head(&n->wq);
+	hlist_add_head(&n->link, &b->list);
+	raw_spin_unlock(&b->lock);
+	return true;
+}
+
+/*
+ * Handle Expropriation notification.
+ */
+int handle_async_page_fault(struct pt_regs *regs, unsigned long addr)
+{
+	struct async_pf_sleep_node n;
+	DECLARE_SWAITQUEUE(wait);
+	unsigned long exp_corr_nr;
+
+	/* Is this Expropriation notification? */
+	if (!(mfspr(SPRN_SRR1) & SRR1_PROGTRAP))
+		return 0;
+
+	if (unlikely(!user_mode(regs)))
+		panic("Host injected async PF in kernel mode\n");
+
+	exp_corr_nr = be16_to_cpu(get_lppaca()->exp_corr_nr);
+	if (!async_pf_queue_task(exp_corr_nr, &n))
+		return 0;
+
+	for (;;) {
+		prepare_to_swait_exclusive(&n.wq, &wait, TASK_UNINTERRUPTIBLE);
+		if (hlist_unhashed(&n.link))
+			break;
+
+		local_irq_enable();
+		schedule();
+		local_irq_disable();
+	}
+
+	finish_swait(&n.wq, &wait);
+	return 1;
+}
+
+static void apf_task_wake_one(struct async_pf_sleep_node *n)
+{
+	hlist_del_init(&n->link);
+	if (swq_has_sleeper(&n->wq))
+		swake_up_one(&n->wq);
+}
+
+static void async_pf_wake_task(u64 token)
+{
+	u64 key = hash_64(token, ASYNC_PF_SLEEP_HASHBITS);
+	struct async_pf_sleep_head *b = &async_pf_sleepers[key];
+	struct async_pf_sleep_node *n;
+
+again:
+	raw_spin_lock(&b->lock);
+	n = _find_apf_task(b, token);
+	if (!n) {
+		/*
+		 * async PF was not yet handled.
+		 * Add dummy entry for the token.
+		 */
+		n = kzalloc(sizeof(*n), GFP_ATOMIC);
+		if (!n) {
+			/*
+			 * Allocation failed! Busy wait while other cpu
+			 * handles async PF.
+			 */
+			raw_spin_unlock(&b->lock);
+			cpu_relax();
+			goto again;
+		}
+		n->token = token;
+		n->cpu = smp_processor_id();
+		init_swait_queue_head(&n->wq);
+		hlist_add_head(&n->link, &b->list);
+	} else {
+		apf_task_wake_one(n);
+	}
+	raw_spin_unlock(&b->lock);
+}
+
+/*
+ * Handle Subvention notification.
+ */
+static irqreturn_t async_pf_handler(int irq, void *dev_id)
+{
+	uint16_t exp_token, old;
+
+	raw_spin_lock(&async_sns_guest_lock);
+	do {
+		exp_token = *(esn_q + next_eq_entry);
+		if (!exp_token)
+			break;
+
+		old = arch_cmpxchg(esn_q + next_eq_entry, exp_token, 0);
+		BUG_ON(old != exp_token);
+
+		async_pf_wake_task(exp_token);
+		next_eq_entry = (next_eq_entry + 1) % nr_eq_entries;
+	} while (1);
+	raw_spin_unlock(&async_sns_guest_lock);
+	return IRQ_HANDLED;
+}
+
+static int __init pseries_async_pf_init(void)
+{
+	long rc;
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	unsigned int irq, cpu;
+	int i;
+
+	/* Register buffer via H_REG_SNS */
+	rc = plpar_hcall(H_REG_SNS, ret, __pa(sns_buffer), PAGE_SIZE);
+	if (rc != H_SUCCESS)
+		return -1;
+
+	nr_eq_entries = (PAGE_SIZE - 2) / sizeof(uint16_t);
+
+	/* Register irq handler */
+	irq = irq_create_mapping(NULL, ret[1]);
+	if (!irq) {
+		plpar_hcall(H_REG_SNS, ret, -1, PAGE_SIZE);
+		return -1;
+	}
+
+	rc = request_irq(irq, async_pf_handler, 0, "sns-interrupt", NULL);
+	if (rc < 0) {
+		plpar_hcall(H_REG_SNS, ret, -1, PAGE_SIZE);
+		return -1;
+	}
+
+	for (i = 0; i < ASYNC_PF_SLEEP_HASHSIZE; i++)
+		raw_spin_lock_init(&async_pf_sleepers[i].lock);
+
+	/*
+	 * Enable subvention notifications from the hypervisor
+	 * by setting bit 0, byte 0 of SNS buffer
+	 */
+	*sns_buffer |= 0x1;
+
+	/* Enable LPPACA_EXP_INT_ENABLED in VPA */
+	for_each_possible_cpu(cpu)
+		lppaca_of(cpu).byte_b9 |= LPPACA_EXP_INT_ENABLED;
+
+	pr_err("%s: Enabled Async PF\n", __func__);
+	return 0;
+}
+
+machine_arch_initcall(pseries, pseries_async_pf_init);
-- 
2.31.1

