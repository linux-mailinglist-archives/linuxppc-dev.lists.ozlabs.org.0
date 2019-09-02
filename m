Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86021A5AEA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 18:00:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZY93v4dzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 02:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hq1SRxQN"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxV3Bs5zDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:46 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id bd8so398808plb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/7/J57NvJQGejvVVPaHGAI8/+uGQADgW3QxL0B4byM=;
 b=hq1SRxQNJGj3IsnR2duYh9+6JZc/t8nASLOt8kT/zBROCiE68qsb8HaV8RmyTx9dFZ
 wXxdwvGewCX4eQibEKVmnYOShVD5qCKky1LA8mjtpVUJkvhnycZFWOZAtJQeNTzMwWUb
 LM9oF1UBFwClE2jAYPk1+CMyKSQDVs2nsiKGse5mKV2SH8THA9cOsu2GxnvInyXjwGnC
 zwOThoL8dBGGBWbjE2sUJj9qkOywiILX7bo/RbPaSZgeCfAbioYVVwe9xRbk6FpGrLQm
 WvEoG2OXDQsjg/V7ez+4bEzZQiAQ8FZAdxewboJG6RuuCKB93KVWqc+zmZU624eLIBEK
 0Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/7/J57NvJQGejvVVPaHGAI8/+uGQADgW3QxL0B4byM=;
 b=sDMeANJQkbDXgESZ2fw7APqmmMMZ47lweatnxC3KONJUN1idXEfi9cUXd2wjuxYk19
 2g2EiNDco4nFKEtGihi+7ub+vNAmBnJZvN2u2M/hNK2M7pqSsQPsqm7Rcc4bkxXdJSUS
 4cAT3/+4Jh+ftlOou8ZRdKXTyDdcl+Y74ZmjG6nw87QemBILByaHJ524CgJEFbGdmmAE
 nYzyKIwFoLbi4MooTMjBpGBujluvBcd1eXWtox7yY3OXOXE3bJodoSgRcr71hUbZp+U7
 E6mWTWAUcwRBO4uCc+QvTPUcWP0HNKbdSPB5zkYixc/jZoXTP4CVXZtfbTq7zm3Lezwv
 F6Qg==
X-Gm-Message-State: APjAAAUKdiuvagIDdLFfv2BOzi5oTVOYONyEKbNxwHrfrsndZLI2UOB3
 2VQDjf1OvuIDijGfYj/rMz8y3Tk4TWg=
X-Google-Smtp-Source: APXvYqz7G2e7horDe1fAHBgbPFg2uj9fVuhCkFUNEH5V91ZjsW8y3tzjvm4gq2aUBVEJTZzszcBZkg==
X-Received: by 2002:a17:902:1027:: with SMTP id
 b36mr29438025pla.203.1567438363335; 
 Mon, 02 Sep 2019 08:32:43 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/64s/radix: introduce options to disable use of
 the tlbie instruction
Date: Tue,  3 Sep 2019 01:29:31 +1000
Message-Id: <20190902152931.17840-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902152931.17840-1-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce two options to control the use of the tlbie instruction. A
boot time option which completely disables the kernel using the
instruction, this is currently incompatible with HASH MMU, KVM, and
coherent accelerators.

And a debugfs option can be switched at runtime and avoids using tlbie
for invalidating CPU TLBs for normal process and kernel address
mappings. Coherent accelerators are still managed with tlbie, as will
KVM partition scope translations.

Cross-CPU TLB flushing is implemented with IPIs and tlbiel. This is a
basic implementation which does not attempt to make any optimisation
beyond the tlbie implementation.

This is useful for performance testing among other things. For example
in certain situations on large systems, using IPIs may be faster than
tlbie as they can be directed rather than broadcast. Later we may also
take advantage of the IPIs to do more interesting things such as trim
the mm cpumask more aggressively.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |   4 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   9 +
 arch/powerpc/kvm/book3s_hv.c                  |   6 +
 arch/powerpc/mm/book3s64/pgtable.c            |  47 +++++
 arch/powerpc/mm/book3s64/radix_tlb.c          | 190 ++++++++++++++++--
 drivers/misc/cxl/main.c                       |   4 +
 drivers/misc/ocxl/main.c                      |   4 +
 7 files changed, 246 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d3cbb3ae62b6..65ae16549aa3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -860,6 +860,10 @@
 	disable_radix	[PPC]
 			Disable RADIX MMU mode on POWER9
 
+	disable_tlbie	[PPC]
+			Disable TLBIE instruction. Currently does not work
+			with KVM, with HASH MMU, or with coherent accelerators.
+
 	disable_cpu_apicid= [X86,APIC,SMP]
 			Format: <int>
 			The number of initial APIC ID for the
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index ebf572ea621e..7aa8195b6cff 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -162,4 +162,13 @@ static inline void flush_tlb_pgtable(struct mmu_gather *tlb, unsigned long addre
 
 	radix__flush_tlb_pwc(tlb, address);
 }
+
+extern bool tlbie_capable;
+extern bool tlbie_enabled;
+
+static inline bool cputlb_use_tlbie(void)
+{
+	return tlbie_enabled;
+}
+
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_H */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cde3f5a4b3e4..3cdaa2a09a19 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5462,6 +5462,12 @@ static int kvmppc_radix_possible(void)
 static int kvmppc_book3s_init_hv(void)
 {
 	int r;
+
+	if (!tlbie_capable) {
+		pr_err("KVM-HV: Host does not support TLBIE\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * FIXME!! Do we need to check on all cpus ?
 	 */
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 351eb78eed55..75483b40fcb1 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -8,6 +8,7 @@
 #include <linux/memblock.h>
 #include <misc/cxl-base.h>
 
+#include <asm/debugfs.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/trace.h>
@@ -469,3 +470,49 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 
 	return true;
 }
+
+/*
+ * Does the CPU support tlbie?
+ */
+bool tlbie_capable __read_mostly = true;
+EXPORT_SYMBOL(tlbie_capable);
+
+/*
+ * Should tlbie be used for management of CPU TLBs, for kernel and process
+ * address spaces? tlbie may still be used for nMMU accelerators, and for KVM
+ * guest address spaces.
+ */
+bool tlbie_enabled __read_mostly = true;
+
+static int __init setup_disable_tlbie(char *str)
+{
+	if (!radix_enabled()) {
+		pr_err("disable_tlbie: Unable to disable TLBIE with Hash MMU.\n");
+		return 1;
+	}
+
+	tlbie_capable = false;
+	tlbie_enabled = false;
+
+        return 1;
+}
+__setup("disable_tlbie", setup_disable_tlbie);
+
+static int __init pgtable_debugfs_setup(void)
+{
+	if (!tlbie_capable)
+		return 0;
+
+	/*
+	 * There is no locking vs tlb flushing when changing this value.
+	 * The tlb flushers will see one value or another, and use either
+	 * tlbie or tlbiel with IPIs. In both cases the TLBs will be
+	 * invalidated as expected.
+	 */
+	debugfs_create_bool("tlbie_enabled", 0600,
+			powerpc_debugfs_root,
+			&tlbie_enabled);
+
+	return 0;
+}
+arch_initcall(pgtable_debugfs_setup);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index f9cf8ae59831..631be42abd33 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -270,6 +270,39 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
+struct tlbiel_pid {
+	unsigned long pid;
+	unsigned long ric;
+};
+
+static void do_tlbiel_pid(void *info)
+{
+	struct tlbiel_pid *t = info;
+
+	if (t->ric == RIC_FLUSH_TLB)
+		_tlbiel_pid(t->pid, RIC_FLUSH_TLB);
+	else if (t->ric == RIC_FLUSH_PWC)
+		_tlbiel_pid(t->pid, RIC_FLUSH_PWC);
+	else
+		_tlbiel_pid(t->pid, RIC_FLUSH_ALL);
+}
+
+static inline void _tlbiel_pid_multicast(struct mm_struct *mm,
+				unsigned long pid, unsigned long ric)
+{
+	struct cpumask *cpus = mm_cpumask(mm);
+	struct tlbiel_pid t = { .pid = pid, .ric = ric };
+
+	on_each_cpu_mask(cpus, do_tlbiel_pid, &t, 1);
+	/*
+	 * Always want the CPU translations to be invalidated with tlbiel in
+	 * these paths, so while coprocessors must use tlbie, we can not
+	 * optimise away the tlbiel component.
+	 */
+	if (atomic_read(&mm->context.copros) > 0)
+		_tlbie_pid(pid, RIC_FLUSH_ALL);
+}
+
 static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 {
 	asm volatile("ptesync": : :"memory");
@@ -370,6 +403,53 @@ static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
+struct tlbiel_va {
+	unsigned long pid;
+	unsigned long va;
+	unsigned long psize;
+	unsigned long ric;
+};
+
+static void do_tlbiel_va(void *info)
+{
+	struct tlbiel_va *t = info;
+
+	if (t->ric == RIC_FLUSH_TLB)
+		_tlbiel_va(t->va, t->pid, t->psize, RIC_FLUSH_TLB);
+	else if (t->ric == RIC_FLUSH_PWC)
+		_tlbiel_va(t->va, t->pid, t->psize, RIC_FLUSH_PWC);
+	else
+		_tlbiel_va(t->va, t->pid, t->psize, RIC_FLUSH_ALL);
+}
+
+static inline void _tlbiel_va_multicast(struct mm_struct *mm,
+				unsigned long va, unsigned long pid,
+				unsigned long psize, unsigned long ric)
+{
+	struct cpumask *cpus = mm_cpumask(mm);
+	struct tlbiel_va t = { .va = va, .pid = pid, .psize = psize, .ric = ric };
+	on_each_cpu_mask(cpus, do_tlbiel_va, &t, 1);
+	if (atomic_read(&mm->context.copros) > 0)
+		_tlbie_va(va, pid, psize, RIC_FLUSH_TLB);
+}
+
+struct tlbiel_va_range {
+	unsigned long pid;
+	unsigned long start;
+	unsigned long end;
+	unsigned long page_size;
+	unsigned long psize;
+	bool also_pwc;
+};
+
+static void do_tlbiel_va_range(void *info)
+{
+	struct tlbiel_va_range *t = info;
+
+	_tlbiel_va_range(t->start, t->end, t->pid, t->page_size,
+				    t->psize, t->also_pwc);
+}
+
 static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
 			      unsigned long psize, unsigned long ric)
 {
@@ -393,6 +473,21 @@ static inline void _tlbie_va_range(unsigned long start, unsigned long end,
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
+static inline void _tlbiel_va_range_multicast(struct mm_struct *mm,
+				unsigned long start, unsigned long end,
+				unsigned long pid, unsigned long page_size,
+				unsigned long psize, bool also_pwc)
+{
+	struct cpumask *cpus = mm_cpumask(mm);
+	struct tlbiel_va_range t = { .start = start, .end = end,
+				.pid = pid, .page_size = page_size,
+				.psize = psize, .also_pwc = also_pwc };
+
+	on_each_cpu_mask(cpus, do_tlbiel_va_range, &t, 1);
+	if (atomic_read(&mm->context.copros) > 0)
+		_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
+}
+
 /*
  * Base TLB flushing operations:
  *
@@ -530,10 +625,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 			goto local;
 		}
 
-		if (mm_needs_flush_escalation(mm))
-			_tlbie_pid(pid, RIC_FLUSH_ALL);
-		else
-			_tlbie_pid(pid, RIC_FLUSH_TLB);
+		if (cputlb_use_tlbie()) {
+			if (mm_needs_flush_escalation(mm))
+				_tlbie_pid(pid, RIC_FLUSH_ALL);
+			else
+				_tlbie_pid(pid, RIC_FLUSH_TLB);
+		} else {
+			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
+		}
 	} else {
 local:
 		_tlbiel_pid(pid, RIC_FLUSH_TLB);
@@ -559,7 +658,10 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 				goto local;
 			}
 		}
-		_tlbie_pid(pid, RIC_FLUSH_ALL);
+		if (cputlb_use_tlbie())
+			_tlbie_pid(pid, RIC_FLUSH_ALL);
+		else
+			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	} else {
 local:
 		_tlbiel_pid(pid, RIC_FLUSH_ALL);
@@ -594,7 +696,10 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+		if (cputlb_use_tlbie())
+			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+		else
+			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
 	} else {
 local:
 		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
@@ -616,6 +721,24 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
 #define radix__flush_all_mm radix__local_flush_all_mm
 #endif /* CONFIG_SMP */
 
+static void do_tlbiel_kernel(void *info)
+{
+	_tlbiel_pid(0, RIC_FLUSH_ALL);
+}
+
+static inline void _tlbiel_kernel_broadcast(void)
+{
+	on_each_cpu(do_tlbiel_kernel, NULL, 1);
+	if (tlbie_capable) {
+		/*
+		 * Coherent accelerators don't refcount kernel memory mappings,
+		 * so have to always issue a tlbie for them. This is quite a
+		 * slow path anyway.
+		 */
+		_tlbie_pid(0, RIC_FLUSH_ALL);
+	}
+}
+
 /*
  * If kernel TLBIs ever become local rather than global, then
  * drivers/misc/ocxl/link.c:ocxl_link_add_pe will need some work, as it
@@ -623,7 +746,10 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
  */
 void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	_tlbie_pid(0, RIC_FLUSH_ALL);
+	if (cputlb_use_tlbie())
+		_tlbie_pid(0, RIC_FLUSH_ALL);
+	else
+		_tlbiel_kernel_broadcast();
 }
 EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
 
@@ -679,10 +805,14 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 		if (local) {
 			_tlbiel_pid(pid, RIC_FLUSH_TLB);
 		} else {
-			if (mm_needs_flush_escalation(mm))
-				_tlbie_pid(pid, RIC_FLUSH_ALL);
-			else
-				_tlbie_pid(pid, RIC_FLUSH_TLB);
+			if (cputlb_use_tlbie()) {
+				if (mm_needs_flush_escalation(mm))
+					_tlbie_pid(pid, RIC_FLUSH_ALL);
+				else
+					_tlbie_pid(pid, RIC_FLUSH_TLB);
+			} else {
+				_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
+			}
 		}
 	} else {
 		bool hflush = flush_all_sizes;
@@ -707,8 +837,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				gflush = false;
 		}
 
-		asm volatile("ptesync": : :"memory");
 		if (local) {
+			asm volatile("ptesync": : :"memory");
 			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
@@ -717,7 +847,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				__tlbiel_va_range(gstart, gend, pid,
 						PUD_SIZE, MMU_PAGE_1G);
 			asm volatile("ptesync": : :"memory");
-		} else {
+		} else if (cputlb_use_tlbie()) {
+			asm volatile("ptesync": : :"memory");
 			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbie_va_range(hstart, hend, pid,
@@ -727,6 +858,15 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 						PUD_SIZE, MMU_PAGE_1G);
 			fixup_tlbie();
 			asm volatile("eieio; tlbsync; ptesync": : :"memory");
+		} else {
+			_tlbiel_va_range_multicast(mm,
+					start, end, pid, page_size, mmu_virtual_psize, false);
+			if (hflush)
+				_tlbiel_va_range_multicast(mm,
+					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, false);
+			if (gflush)
+				_tlbiel_va_range_multicast(mm,
+					gstart, gend, pid, PUD_SIZE, MMU_PAGE_1G, false);
 		}
 	}
 	preempt_enable();
@@ -903,16 +1043,26 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 		if (local) {
 			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		} else {
-			if (mm_needs_flush_escalation(mm))
-				also_pwc = true;
+			if (cputlb_use_tlbie()) {
+				if (mm_needs_flush_escalation(mm))
+					also_pwc = true;
+
+				_tlbie_pid(pid,
+					also_pwc ?  RIC_FLUSH_ALL : RIC_FLUSH_TLB);
+			} else {
+				_tlbiel_pid_multicast(mm, pid,
+					also_pwc ?  RIC_FLUSH_ALL : RIC_FLUSH_TLB);
+			}
 
-			_tlbie_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		}
 	} else {
 		if (local)
 			_tlbiel_va_range(start, end, pid, page_size, psize, also_pwc);
-		else
+		else if (cputlb_use_tlbie())
 			_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
+		else
+			_tlbiel_va_range_multicast(mm,
+					start, end, pid, page_size, psize, also_pwc);
 	}
 	preempt_enable();
 }
@@ -954,7 +1104,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
+		if (cputlb_use_tlbie())
+			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
+		else
+			_tlbiel_va_range_multicast(mm,
+					addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 	} else {
 local:
 		_tlbiel_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
diff --git a/drivers/misc/cxl/main.c b/drivers/misc/cxl/main.c
index 482a2c1b340a..43b312d06e3e 100644
--- a/drivers/misc/cxl/main.c
+++ b/drivers/misc/cxl/main.c
@@ -18,6 +18,7 @@
 #include <linux/sched/task.h>
 
 #include <asm/cputable.h>
+#include <asm/mmu.h>
 #include <misc/cxl-base.h>
 
 #include "cxl.h"
@@ -315,6 +316,9 @@ static int __init init_cxl(void)
 {
 	int rc = 0;
 
+	if (!tlbie_capable)
+		return -EINVAL;
+
 	if ((rc = cxl_file_init()))
 		return rc;
 
diff --git a/drivers/misc/ocxl/main.c b/drivers/misc/ocxl/main.c
index 7210d9e059be..ef73cf35dda2 100644
--- a/drivers/misc/ocxl/main.c
+++ b/drivers/misc/ocxl/main.c
@@ -2,12 +2,16 @@
 // Copyright 2017 IBM Corp.
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <asm/mmu.h>
 #include "ocxl_internal.h"
 
 static int __init init_ocxl(void)
 {
 	int rc = 0;
 
+	if (!tlbie_capable)
+		return -EINVAL;
+
 	rc = ocxl_file_init();
 	if (rc)
 		return rc;
-- 
2.22.0

