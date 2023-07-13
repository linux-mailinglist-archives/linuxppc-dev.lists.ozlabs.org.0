Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B2751D96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 11:43:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1qRM4Sj0z3cVD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 19:43:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1qNR1MCBz3cBY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 19:40:39 +1000 (AEST)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R1qMg1LkQz18Lnh;
	Thu, 13 Jul 2023 17:39:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:33 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
Subject: [PATCH rfc -next 10/10] loongarch: mm: try VMA lock-based page fault handling first
Date: Thu, 13 Jul 2023 17:53:38 +0800
Message-ID: <20230713095339.189715-11-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle
  <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Attempt VMA lock-based page fault handling first, and fall back
to the existing mmap_lock-based handling if that fails.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/loongarch/Kconfig    |  1 +
 arch/loongarch/mm/fault.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 397203e18800..afb0ccabab97 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -53,6 +53,7 @@ config LOONGARCH
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_QUEUED_RWLOCKS
diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index cde2ea0119fa..7e54bc48813e 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -136,6 +136,17 @@ static inline bool access_error(unsigned int flags, struct pt_regs *regs,
 	return false;
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+int arch_vma_check_access(struct vm_area_struct *vma,
+			  struct vm_locked_fault *vmlf)
+{
+	if (unlikely(access_error(vmlf->fault_flags, vmlf->regs, vmlf->address,
+		     vma)))
+		return -EINVAL;
+	return 0;
+}
+#endif
+
 /*
  * This routine handles page faults.  It determines the address,
  * and the problem, and then passes it off to one of the appropriate
@@ -149,6 +160,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
 	struct vm_area_struct *vma = NULL;
+	struct vm_locked_fault vmlf;
 	vm_fault_t fault;
 
 	if (kprobe_page_fault(regs, current->thread.trap_nr))
@@ -183,6 +195,19 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		flags |= FAULT_FLAG_WRITE;
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
+
+	VM_LOCKED_FAULT_INIT(vmlf, mm, address, flags, 0, regs, 0);
+	if (try_vma_locked_page_fault(&vmlf, &fault))
+		goto retry;
+	else if (!(fault | VM_FAULT_RETRY))
+		goto done;
+
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			no_context(regs, address);
+		return;
+	}
+
 retry:
 	vma = lock_mm_and_find_vma(mm, address, regs);
 	if (unlikely(!vma))
@@ -223,6 +248,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 
 	mmap_read_unlock(mm);
 
+done:
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM) {
 			do_out_of_memory(regs, address);
-- 
2.27.0

