Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091CC8F9A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:15:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468qjl2cWBzDqPP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U7izRjCv"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468qYC70jwzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:07:59 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m12so1900242plt.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nceq3lPnpyCwkXfQjbSf6men5Ro1Onh/ufpXjO/r47Y=;
 b=U7izRjCvfpqLD+pwU/2xNMGw7q1jh1NE4nTFSCL6aiGdyfWyIA5tIJD4kucVBzlG4P
 iPiziCe8h4jV162MhKiU7Wc6VezNkiRM1bHCxia4gaQC5N6hokI9vxvBVILtbMdmxsOR
 VWU6wjUbjFPSI7U2c61/xP2568M3kwEcx15FMr7hOgDvcY0EKQfnOB9To31eKniy81Pz
 1gXLy/bmh8VPQFOMpaklockNHhZzSvCCxUF+7Z+nfVdWqOmJnnLum9IIbKlZSivEdAOJ
 RnhmpSknVFxMu8Dtggq+PBSQq1JhZUgvi5UZlQLrjFDfxNFbqxYobm4Utwr4/dveHUlZ
 dYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nceq3lPnpyCwkXfQjbSf6men5Ro1Onh/ufpXjO/r47Y=;
 b=kTezfAIeKe/pOVpLQtgPtS4Jr9hkXvp4QTeXG7/ezgwCmFqjREeP2erhyvLsInqk+5
 BuFG50Emcnm4j53cFGlA6ueelvKUhbr9KepAJmsiO98dLe7LwmOEmiJctljkojx/TcFu
 pVcKEkkEcA5+PlWZbKczXFCGM1yNKOHzfG8TgjJBMQTNtTu12Jpi7yAB2NHT+ODEsGFE
 FlRa/kVmSYGaPAAzUB9SKUo36e/TFbWyNqOmEP1/M6WoVjGuQpC2dhOYf7inaVXk2Ren
 IGe7LaDVZsd/Y/+udyMF5e9AEEMHStwf9jU8Dnm8b04CiT53QmZZzyySRseP/VX04eTZ
 lJqQ==
X-Gm-Message-State: APjAAAVdr3hzhSmAmMDVH+8IGFgGI6YsfE8foFR8recOEXnavKsksuvc
 /aNH6DgIQAzRT/hOS2iGgY9ay5fD
X-Google-Smtp-Source: APXvYqy+AoYUWvRYtlFZWsCzMR5oP7XshlCngeib/SzXqyQDMZIgXp5kQttJjwkrxHmhcOa/tPaVuA==
X-Received: by 2002:a17:902:100a:: with SMTP id
 b10mr7189475pla.338.1565928477143; 
 Thu, 15 Aug 2019 21:07:57 -0700 (PDT)
Received: from bobo.local0.net (61-68-63-22.tpgi.com.au. [61.68.63.22])
 by smtp.gmail.com with ESMTPSA id j187sm4994850pfg.178.2019.08.15.21.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:07:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64s: introduce options to disable use of the
 tlbie instruction
Date: Fri, 16 Aug 2019 14:07:33 +1000
Message-Id: <20190816040733.5737-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816040733.5737-1-npiggin@gmail.com>
References: <20190816040733.5737-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/mm/book3s64/radix_tlb.c          | 182 ++++++++++++++++--
 drivers/misc/cxl/main.c                       |   4 +
 drivers/misc/ocxl/main.c                      |   4 +
 7 files changed, 238 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7ccd158b3894..5e5206acc64e 100644
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
index ebf572ea621e..4b4568b7d4f2 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -162,4 +162,13 @@ static inline void flush_tlb_pgtable(struct mmu_gather *tlb, unsigned long addre
 
 	radix__flush_tlb_pwc(tlb, address);
 }
+
+extern bool tlbie_capable;
+extern bool tlbie_enabled;
+
+static inline bool use_tlbie(void)
+{
+	return tlbie_enabled;
+}
+
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_H */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6ec2e4fe86d3..886d92639f1e 100644
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
index bbedd7f7ab3f..73ba67d6ca37 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -8,6 +8,7 @@
 #include <linux/memblock.h>
 #include <misc/cxl-base.h>
 
+#include <asm/debugfs.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/trace.h>
@@ -437,3 +438,49 @@ int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t
 
 	return 0;
 }
+
+/*
+ * Can tlbie be used.
+ */
+bool tlbie_capable __read_mostly = true;
+EXPORT_SYMBOL(tlbie_capable);
+
+/*
+ * Avoid using tlbie for management of CPU TLBs for kernel and process address
+ * spaces. tlbie may still be used for accelerators, and by KVM.
+ */
+bool tlbie_enabled __read_mostly = true;
+
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
index 71f7fede2fa4..7d17564f12c1 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -285,6 +285,39 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
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
 static inline void _tlbiel_lpid(unsigned long lpid, unsigned long ric)
 {
 	int set;
@@ -420,6 +453,53 @@ static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
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
@@ -443,6 +523,21 @@ static inline void _tlbie_va_range(unsigned long start, unsigned long end,
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
@@ -580,10 +675,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 			goto local;
 		}
 
-		if (mm_needs_flush_escalation(mm))
-			_tlbie_pid(pid, RIC_FLUSH_ALL);
-		else
-			_tlbie_pid(pid, RIC_FLUSH_TLB);
+		if (use_tlbie()) {
+			if (mm_needs_flush_escalation(mm))
+				_tlbie_pid(pid, RIC_FLUSH_ALL);
+			else if (use_tlbie())
+				_tlbie_pid(pid, RIC_FLUSH_TLB);
+		} else {
+			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
+		}
 	} else {
 local:
 		_tlbiel_pid(pid, RIC_FLUSH_TLB);
@@ -609,7 +708,10 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 				goto local;
 			}
 		}
-		_tlbie_pid(pid, RIC_FLUSH_ALL);
+		if (use_tlbie())
+			_tlbie_pid(pid, RIC_FLUSH_ALL);
+		else
+			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	} else {
 local:
 		_tlbiel_pid(pid, RIC_FLUSH_ALL);
@@ -644,7 +746,10 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+		if (use_tlbie())
+			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+		else
+			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
 	} else {
 local:
 		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
@@ -666,6 +771,16 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
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
+}
+
 /*
  * If kernel TLBIs ever become local rather than global, then
  * drivers/misc/ocxl/link.c:ocxl_link_add_pe will need some work, as it
@@ -673,7 +788,10 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
  */
 void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	_tlbie_pid(0, RIC_FLUSH_ALL);
+	if (tlbie_capable)
+		_tlbie_pid(0, RIC_FLUSH_ALL);
+	else
+		_tlbiel_kernel_broadcast();
 }
 EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
 
@@ -729,10 +847,14 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 		if (local) {
 			_tlbiel_pid(pid, RIC_FLUSH_TLB);
 		} else {
-			if (mm_needs_flush_escalation(mm))
-				_tlbie_pid(pid, RIC_FLUSH_ALL);
-			else
-				_tlbie_pid(pid, RIC_FLUSH_TLB);
+			if (use_tlbie()) {
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
@@ -757,8 +879,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				gflush = false;
 		}
 
-		asm volatile("ptesync": : :"memory");
 		if (local) {
+			asm volatile("ptesync": : :"memory");
 			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
@@ -767,7 +889,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				__tlbiel_va_range(gstart, gend, pid,
 						PUD_SIZE, MMU_PAGE_1G);
 			asm volatile("ptesync": : :"memory");
-		} else {
+		} else if (use_tlbie()) {
+			asm volatile("ptesync": : :"memory");
 			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbie_va_range(hstart, hend, pid,
@@ -777,6 +900,15 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
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
@@ -966,16 +1098,26 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 		if (local) {
 			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		} else {
-			if (mm_needs_flush_escalation(mm))
-				also_pwc = true;
+			if (use_tlbie()) {
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
+		else if (use_tlbie())
 			_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
+		else
+			_tlbiel_va_range_multicast(mm,
+					start, end, pid, page_size, psize, also_pwc);
 	}
 	preempt_enable();
 }
@@ -1017,7 +1159,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
+		if (use_tlbie())
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

