Return-Path: <linuxppc-dev+bounces-377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE495B9B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXd0jSfz2ygy;
	Fri, 23 Aug 2024 01:13:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339585;
	cv=none; b=nmMYpqE4UMQX2r33lWLfIrlm+AQMGfrlSCvK1vIGKW0z7RVLJVpkZ6VQemjGzeV71K5oTM7JjRFH2aDvmrI9kztWoTSf9rFZBrhDY4pP9CxxiU8BxS4pIlSNh0g82ejF9/BkOTSbDaQAb/r4sO/Jg7ylnIKMkETI6HhrATZNyn9IjkXusjesJuhY7MN2OLaKLJ/4jduhoLLKG5B/2KRJ/XNWTpYWBRZaHqZp5o2pHO3m49DA7xlRq82UzoYsowRdYil3PWmnQO6UQmw93ZCC7GtNpo/GTz2wUvHTWBcDqBliYPJZD2dnvHuhdlTHGcECRZnaJbmn27K9iQh9XWkrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339585; c=relaxed/relaxed;
	bh=PmUc9IZ3QQaMGDGB6yp3qr7QaJz6BkaXbPPESjB5bJ4=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=btJfq9yrRw3Hp2hoeVe8JL+HXfEyvasvjjGzI5Uz/000MiUJQR7ogveBJqR994BaHE2v2iojiUYPfviFfRidHJelY8J0xvcm5bG3U40tWeUClNp3wZJf3JSIMAq6MEOlHIXu2jvjKWKkGMc1zXfwaGuFG+QC40lHH4sdUhGQNy0tdHmmi5CQvsaMp9+xH88tVpOGtitHlucgP+OoNME90V2GvnDN028t2PHsWyGN5CTF2hJmsGxS18kbSQr8ko9m+PTbEZ5oNX7iazphRnglhUVeuS/j4cn6My/WQ6rMe4QJJ7VofZFH9/x6jzAsbO/z/rDAR+ZNv9Ynw5Dhk6t64w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXc46lpz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D58515A1;
	Thu, 22 Aug 2024 08:12:59 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BB9A3F58B;
	Thu, 22 Aug 2024 08:12:29 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 16/30] arm64: handle PKEY/POE faults
Date: Thu, 22 Aug 2024 16:10:59 +0100
Message-Id: <20240822151113.1479789-17-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a memory fault occurs that is due to an overlay/pkey fault, report that to
userspace with a SEGV_PKUERR.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/traps.h |  1 +
 arch/arm64/kernel/traps.c      |  6 ++++
 arch/arm64/mm/fault.c          | 55 +++++++++++++++++++++++++++++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git arch/arm64/include/asm/traps.h arch/arm64/include/asm/traps.h
index eefe766d6161..d780d1bd2eac 100644
--- arch/arm64/include/asm/traps.h
+++ arch/arm64/include/asm/traps.h
@@ -25,6 +25,7 @@ try_emulate_armv8_deprecated(struct pt_regs *regs, u32 insn)
 void force_signal_inject(int signal, int code, unsigned long address, unsigned long err);
 void arm64_notify_segfault(unsigned long addr);
 void arm64_force_sig_fault(int signo, int code, unsigned long far, const char *str);
+void arm64_force_sig_fault_pkey(unsigned long far, const char *str, int pkey);
 void arm64_force_sig_mceerr(int code, unsigned long far, short lsb, const char *str);
 void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const char *str);
 
diff --git arch/arm64/kernel/traps.c arch/arm64/kernel/traps.c
index 9e22683aa921..9a11bb0db284 100644
--- arch/arm64/kernel/traps.c
+++ arch/arm64/kernel/traps.c
@@ -273,6 +273,12 @@ void arm64_force_sig_fault(int signo, int code, unsigned long far,
 		force_sig_fault(signo, code, (void __user *)far);
 }
 
+void arm64_force_sig_fault_pkey(unsigned long far, const char *str, int pkey)
+{
+	arm64_show_signal(SIGSEGV, str);
+	force_sig_pkuerr((void __user *)far, pkey);
+}
+
 void arm64_force_sig_mceerr(int code, unsigned long far, short lsb,
 			    const char *str)
 {
diff --git arch/arm64/mm/fault.c arch/arm64/mm/fault.c
index 451ba7cbd5ad..a68055150950 100644
--- arch/arm64/mm/fault.c
+++ arch/arm64/mm/fault.c
@@ -23,6 +23,7 @@
 #include <linux/sched/debug.h>
 #include <linux/highmem.h>
 #include <linux/perf_event.h>
+#include <linux/pkeys.h>
 #include <linux/preempt.h>
 #include <linux/hugetlb.h>
 
@@ -486,6 +487,23 @@ static void do_bad_area(unsigned long far, unsigned long esr,
 	}
 }
 
+static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
+			unsigned int mm_flags)
+{
+	unsigned long iss2 = ESR_ELx_ISS2(esr);
+
+	if (!system_supports_poe())
+		return false;
+
+	if (iss2 & ESR_ELx_Overlay)
+		return true;
+
+	return !arch_vma_access_permitted(vma,
+			mm_flags & FAULT_FLAG_WRITE,
+			mm_flags & FAULT_FLAG_INSTRUCTION,
+			false);
+}
+
 static bool is_el0_instruction_abort(unsigned long esr)
 {
 	return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
@@ -511,6 +529,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	unsigned long addr = untagged_addr(far);
 	struct vm_area_struct *vma;
 	int si_code;
+	int pkey = -1;
 
 	if (kprobe_page_fault(regs, esr))
 		return 0;
@@ -575,6 +594,16 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
 		goto bad_area;
 	}
+
+	if (fault_from_pkey(esr, vma, mm_flags)) {
+		pkey = vma_pkey(vma);
+		vma_end_read(vma);
+		fault = 0;
+		si_code = SEGV_PKUERR;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		goto bad_area;
+	}
+
 	fault = handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_LOCK, regs);
 	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
 		vma_end_read(vma);
@@ -610,7 +639,16 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto bad_area;
 	}
 
+	if (fault_from_pkey(esr, vma, mm_flags)) {
+		pkey = vma_pkey(vma);
+		mmap_read_unlock(mm);
+		fault = 0;
+		si_code = SEGV_PKUERR;
+		goto bad_area;
+	}
+
 	fault = handle_mm_fault(vma, addr, mm_flags, regs);
+
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
@@ -669,8 +707,23 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 		arm64_force_sig_mceerr(BUS_MCEERR_AR, far, lsb, inf->name);
 	} else {
+		/*
+		 * The pkey value that we return to userspace can be different
+		 * from the pkey that caused the fault.
+		 *
+		 * 1. T1   : mprotect_key(foo, PAGE_SIZE, pkey=4);
+		 * 2. T1   : set POR_EL0 to deny access to pkey=4, touches, page
+		 * 3. T1   : faults...
+		 * 4.    T2: mprotect_key(foo, PAGE_SIZE, pkey=5);
+		 * 5. T1   : enters fault handler, takes mmap_lock, etc...
+		 * 6. T1   : reaches here, sees vma_pkey(vma)=5, when we really
+		 *	     faulted on a pte with its pkey=4.
+		 */
 		/* Something tried to access memory that out of memory map */
-		arm64_force_sig_fault(SIGSEGV, si_code, far, inf->name);
+		if (si_code == SEGV_PKUERR)
+			arm64_force_sig_fault_pkey(far, inf->name, pkey);
+		else
+			arm64_force_sig_fault(SIGSEGV, si_code, far, inf->name);
 	}
 
 	return 0;
-- 
2.25.1


