Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E47C3F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 15:49:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zFCk5TV2zDqYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 23:49:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kB8LlaQy"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zCXV1cxRzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 22:34:01 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id f17so27807011pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zORsfdUlMktkofJ88/D7HRg73v0nzGtcKw83fNGHqP4=;
 b=kB8LlaQyq0lB7Qd6HEHmE0pkXxdezzOD/pWvh1DDsRMzKu2hFEvE0OV/xbFIZi4Dxg
 wqs0qFIchHSPxM56b9iG1fZ7tpKPq1FcL5bzgmos/Is6njiyTxF/VLux1E3dQV+2Bv2s
 RUvDAQ/0LAN35dCMJfUA9JulWJjEU1a5z+J5MpNQ4/Qo+fFlqgJMJnKavgt2IUFcnrBm
 rhhp6GnXgiVfJ0tixWti88T8Q3N5pJe3JOFQyzjff0XZW2h/T3rx3AInAKJ4aY6O8AFR
 eSFxkaVgu5iptsdT3IKhXbpaceBdofkfcYk5QbIaEiz/QfH5jeYD9Q+MOddmIz1GjlYD
 327w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zORsfdUlMktkofJ88/D7HRg73v0nzGtcKw83fNGHqP4=;
 b=CEP1ntWLAGVY3egPCuig/WacZeSdr0hHl+llj6GE8+ZGuyPy9wFmTH50bJgu/WNGdf
 Gf7K/2gnnQoYhreWI5XJx1B69Wp6ZEK6K0xOU4VnfBt+mzpdA/pq5+ho0Dkd7SztAj+v
 XeCgXpFRs+Hcyign9Iaa9Q/7WW0KqVzUJGHz/n6Q2tzr2B0Q3VoWd4hrQb0vD9Hxmb5a
 TmK2EkztR8cX4z2RTuU/AMTVkHEOhvVHDDY2GQJ6R+34DlEqN3VtBGURwN88j98Ll/Zl
 4bHz5+gtPf47Uh1ZE5AvVV/qI5m8ESBOaum7c56a2/UB6wn/NhyT4S13vVVSOQS9DoZ3
 XCIg==
X-Gm-Message-State: APjAAAWUV9py1cv/x4hWgCMppjM4fGENIjFnJAdsUGkMj7YrR+i2OVNs
 iODiXvFM29ZbnbWq8VLRnX5w+n+0/QI=
X-Google-Smtp-Source: APXvYqxjh1riItgBrQqzyPgXd6r/SlxKRvZ3JGDUfhibBibnfAg0kpvNqAUTTdq7FQ2qLWOOVuDaBg==
X-Received: by 2002:a17:90a:8a15:: with SMTP id
 w21mr2812549pjn.134.1564576437887; 
 Wed, 31 Jul 2019 05:33:57 -0700 (PDT)
Received: from bobo.local0.net ([61.69.185.217])
 by smtp.gmail.com with ESMTPSA id a3sm71417457pfi.63.2019.07.31.05.33.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:33:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64s/radix: introduce option to disable broadcast
 tlbie
Date: Wed, 31 Jul 2019 22:32:03 +1000
Message-Id: <20190731123203.6370-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an initial hack of a quick option to disable use of the tlbie
instruction. This takes the simplest possible initial pass of just
replacing low level tlbie functions with IPIs. This means it's not as
performant as it could be if we spend some time optmizing it, but on
the other hand having a 1:1 replacement of tlbie is simple and can be
useful for comparisons so I think it's the right initial approach.

It's not entirely complete, doesn't deal with accelerators (reverts to
tlbie), not all the boot code is converted, kernel space invalidations
not converted, and KVM not converted, also radix only to start with. We
can start to add more cases if this will be useful.

Thanks,
Nick
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 149 +++++++++++++++++++++++++--
 1 file changed, 140 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 71f7fede2fa4..56ceecbd3d5c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -11,6 +11,7 @@
 #include <linux/mmu_context.h>
 #include <linux/sched/mm.h>
 
+#include <asm/debugfs.h>
 #include <asm/ppc-opcode.h>
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
@@ -285,6 +286,30 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
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
+static inline void _tlbiel_pid_broadcast(const struct cpumask *cpus,
+				unsigned long pid, unsigned long ric)
+{
+	struct tlbiel_pid t = { .pid = pid, .ric = ric };
+	on_each_cpu_mask(cpus, do_tlbiel_pid, &t, 1);
+}
+
 static inline void _tlbiel_lpid(unsigned long lpid, unsigned long ric)
 {
 	int set;
@@ -420,6 +445,61 @@ static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
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
+static inline void _tlbiel_va_broadcast(const struct cpumask *cpus,
+				unsigned long va, unsigned long pid,
+				unsigned long psize, unsigned long ric)
+{
+	struct tlbiel_va t = { .va = va, .pid = pid, .psize = psize, .ric = ric };
+	on_each_cpu_mask(cpus, do_tlbiel_va, &t, 1);
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
+static inline void _tlbiel_va_range_broadcast(const struct cpumask *cpus,
+				unsigned long start, unsigned long end,
+				unsigned long pid, unsigned long page_size,
+				unsigned long psize, bool also_pwc)
+{
+	struct tlbiel_va_range t = { .start = start, .end = end,
+				.pid = pid, .page_size = page_size,
+				.psize = psize, .also_pwc = also_pwc };
+	on_each_cpu_mask(cpus, do_tlbiel_va_range, &t, 1);
+}
+
 static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
 			      unsigned long psize, unsigned long ric)
 {
@@ -524,6 +604,12 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
 	return false;
 }
 
+static bool tlbie_enabled = true;
+static bool use_tlbie(void)
+{
+	return tlbie_enabled;
+}
+
 #ifdef CONFIG_SMP
 static void do_exit_flush_lazy_tlb(void *arg)
 {
@@ -582,8 +668,10 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 
 		if (mm_needs_flush_escalation(mm))
 			_tlbie_pid(pid, RIC_FLUSH_ALL);
-		else
+		else if (use_tlbie())
 			_tlbie_pid(pid, RIC_FLUSH_TLB);
+		else
+			_tlbiel_pid_broadcast(mm_cpumask(mm), pid, RIC_FLUSH_TLB);
 	} else {
 local:
 		_tlbiel_pid(pid, RIC_FLUSH_TLB);
@@ -609,7 +697,10 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 				goto local;
 			}
 		}
-		_tlbie_pid(pid, RIC_FLUSH_ALL);
+		if (mm_needs_flush_escalation(mm) || use_tlbie())
+			_tlbie_pid(pid, RIC_FLUSH_ALL);
+		else
+			_tlbiel_pid_broadcast(mm_cpumask(mm), pid, RIC_FLUSH_ALL);
 	} else {
 local:
 		_tlbiel_pid(pid, RIC_FLUSH_ALL);
@@ -644,7 +735,11 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+		if (mm_needs_flush_escalation(mm) || use_tlbie())
+			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+		else
+			_tlbiel_va_broadcast(mm_cpumask(mm),
+				       vmaddr, pid, psize, RIC_FLUSH_TLB);
 	} else {
 local:
 		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
@@ -731,8 +826,11 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 		} else {
 			if (mm_needs_flush_escalation(mm))
 				_tlbie_pid(pid, RIC_FLUSH_ALL);
-			else
+			else if (use_tlbie())
 				_tlbie_pid(pid, RIC_FLUSH_TLB);
+			else
+				_tlbiel_pid_broadcast(mm_cpumask(mm),
+						pid, RIC_FLUSH_TLB);
 		}
 	} else {
 		bool hflush = flush_all_sizes;
@@ -757,8 +855,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				gflush = false;
 		}
 
-		asm volatile("ptesync": : :"memory");
 		if (local) {
+			asm volatile("ptesync": : :"memory");
 			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
@@ -767,7 +865,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				__tlbiel_va_range(gstart, gend, pid,
 						PUD_SIZE, MMU_PAGE_1G);
 			asm volatile("ptesync": : :"memory");
-		} else {
+		} else if (use_tlbie()) {
+			asm volatile("ptesync": : :"memory");
 			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbie_va_range(hstart, hend, pid,
@@ -777,6 +876,15 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 						PUD_SIZE, MMU_PAGE_1G);
 			fixup_tlbie();
 			asm volatile("eieio; tlbsync; ptesync": : :"memory");
+		} else {
+			_tlbiel_va_range_broadcast(mm_cpumask(mm),
+					start, end, pid, page_size, mmu_virtual_psize, false);
+			if (hflush)
+				_tlbiel_va_range_broadcast(mm_cpumask(mm),
+					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, false);
+			if (gflush)
+				_tlbiel_va_range_broadcast(mm_cpumask(mm),
+					gstart, gend, pid, PUD_SIZE, MMU_PAGE_1G, false);
 		}
 	}
 	preempt_enable();
@@ -969,13 +1077,22 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 			if (mm_needs_flush_escalation(mm))
 				also_pwc = true;
 
-			_tlbie_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
+			if (use_tlbie())
+				_tlbie_pid(pid,
+					also_pwc ?  RIC_FLUSH_ALL : RIC_FLUSH_TLB);
+			else
+				_tlbiel_pid_broadcast(mm_cpumask(mm), pid,
+					also_pwc ?  RIC_FLUSH_ALL : RIC_FLUSH_TLB);
+
 		}
 	} else {
 		if (local)
 			_tlbiel_va_range(start, end, pid, page_size, psize, also_pwc);
-		else
+		else if (mm_needs_flush_escalation(mm) || use_tlbie())
 			_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
+		else
+			_tlbiel_va_range_broadcast(mm_cpumask(mm),
+					start, end, pid, page_size, psize, also_pwc);
 	}
 	preempt_enable();
 }
@@ -1017,7 +1134,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
+		if (mm_needs_flush_escalation(mm) || use_tlbie())
+			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
+		else
+			_tlbiel_va_range_broadcast(mm_cpumask(mm),
+					addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 	} else {
 local:
 		_tlbiel_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
@@ -1100,3 +1221,13 @@ extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
 }
 EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
+
+static int __init radix_tlb_setup(void)
+{
+	debugfs_create_bool("tlbie_enabled", 0600,
+			powerpc_debugfs_root,
+			&tlbie_enabled);
+
+	return 0;
+}
+arch_initcall(radix_tlb_setup);
-- 
2.22.0

