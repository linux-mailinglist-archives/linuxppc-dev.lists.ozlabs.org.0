Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9878299E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 14:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTssS3bMLz3dK9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 22:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTsrw64SPz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 22:55:12 +1000 (AEST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTsF23D6sztShV;
	Mon, 21 Aug 2023 20:27:34 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:15 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
Subject: [PATCH rfc v2 03/10] x86: mm: use try_vma_locked_page_fault()
Date: Mon, 21 Aug 2023 20:30:49 +0800
Message-ID: <20230821123056.2109942-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ri
 scv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use new try_vma_locked_page_fault() helper to simplify code.
No functional change intended.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/x86/mm/fault.c | 55 +++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index ab778eac1952..3edc9edc0b28 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1227,6 +1227,13 @@ do_kern_addr_fault(struct pt_regs *regs, unsigned long hw_error_code,
 }
 NOKPROBE_SYMBOL(do_kern_addr_fault);
 
+#ifdef CONFIG_PER_VMA_LOCK
+bool arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	return access_error(vmf->fault_code, vma);
+}
+#endif
+
 /*
  * Handle faults in the user portion of the address space.  Nothing in here
  * should check X86_PF_USER without a specific justification: for almost
@@ -1241,13 +1248,13 @@ void do_user_addr_fault(struct pt_regs *regs,
 			unsigned long address)
 {
 	struct vm_area_struct *vma;
-	struct task_struct *tsk;
-	struct mm_struct *mm;
+	struct mm_struct *mm = current->mm;
 	vm_fault_t fault;
-	unsigned int flags = FAULT_FLAG_DEFAULT;
-
-	tsk = current;
-	mm = tsk->mm;
+	struct vm_fault vmf = {
+		.real_address = address,
+		.fault_code = error_code,
+		.flags = FAULT_FLAG_DEFAULT
+	};
 
 	if (unlikely((error_code & (X86_PF_USER | X86_PF_INSTR)) == X86_PF_INSTR)) {
 		/*
@@ -1311,7 +1318,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	 */
 	if (user_mode(regs)) {
 		local_irq_enable();
-		flags |= FAULT_FLAG_USER;
+		vmf.flags |= FAULT_FLAG_USER;
 	} else {
 		if (regs->flags & X86_EFLAGS_IF)
 			local_irq_enable();
@@ -1326,11 +1333,11 @@ void do_user_addr_fault(struct pt_regs *regs,
 	 * maybe_mkwrite() can create a proper shadow stack PTE.
 	 */
 	if (error_code & X86_PF_SHSTK)
-		flags |= FAULT_FLAG_WRITE;
+		vmf.flags |= FAULT_FLAG_WRITE;
 	if (error_code & X86_PF_WRITE)
-		flags |= FAULT_FLAG_WRITE;
+		vmf.flags |= FAULT_FLAG_WRITE;
 	if (error_code & X86_PF_INSTR)
-		flags |= FAULT_FLAG_INSTRUCTION;
+		vmf.flags |= FAULT_FLAG_INSTRUCTION;
 
 #ifdef CONFIG_X86_64
 	/*
@@ -1350,26 +1357,11 @@ void do_user_addr_fault(struct pt_regs *regs,
 	}
 #endif
 
-	if (!(flags & FAULT_FLAG_USER))
-		goto lock_mmap;
-
-	vma = lock_vma_under_rcu(mm, address);
-	if (!vma)
-		goto lock_mmap;
-
-	if (unlikely(access_error(error_code, vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
-	}
-	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
-	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
-		vma_end_read(vma);
-
-	if (!(fault & VM_FAULT_RETRY)) {
-		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+	fault = try_vma_locked_page_fault(&vmf);
+	if (fault == VM_FAULT_NONE)
+		goto retry;
+	if (!(fault & VM_FAULT_RETRY))
 		goto done;
-	}
-	count_vm_vma_lock_event(VMA_LOCK_RETRY);
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
@@ -1379,7 +1371,6 @@ void do_user_addr_fault(struct pt_regs *regs,
 						 ARCH_DEFAULT_PKEY);
 		return;
 	}
-lock_mmap:
 
 retry:
 	vma = lock_mm_and_find_vma(mm, address, regs);
@@ -1410,7 +1401,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	 * userland). The return to userland is identified whenever
 	 * FAULT_FLAG_USER|FAULT_FLAG_KILLABLE are both set in flags.
 	 */
-	fault = handle_mm_fault(vma, address, flags, regs);
+	fault = handle_mm_fault(vma, address, vmf.flags, regs);
 
 	if (fault_signal_pending(fault, regs)) {
 		/*
@@ -1434,7 +1425,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	 * that we made any progress. Handle this case first.
 	 */
 	if (unlikely(fault & VM_FAULT_RETRY)) {
-		flags |= FAULT_FLAG_TRIED;
+		vmf.flags |= FAULT_FLAG_TRIED;
 		goto retry;
 	}
 
-- 
2.27.0

