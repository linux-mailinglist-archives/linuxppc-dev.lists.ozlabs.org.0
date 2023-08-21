Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B0C78298A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 14:52:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTsnK1s0jz3d7t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 22:52:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTsmn4qtRz3bSx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 22:51:37 +1000 (AEST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsF81thwzNnKj;
	Mon, 21 Aug 2023 20:27:40 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:12 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
Subject: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault handler
Date: Mon, 21 Aug 2023 20:30:47 +0800
Message-ID: <20230821123056.2109942-2-wangkefeng.wang@huawei.com>
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

The ARCH_SUPPORTS_PER_VMA_LOCK are enabled by more and more architectures,
eg, x86, arm64, powerpc and s390, and riscv, those implementation are very
similar which results in some duplicated codes, let's add a generic VMA
lock-based page fault handler try_to_vma_locked_page_fault() to eliminate
them, and which also make us easy to support this on new architectures.

Since different architectures use different way to check vma whether is
accessable or not, the struct pt_regs, page fault error code and vma flags
are added into struct vm_fault, then, the architecture's page fault code
could re-use struct vm_fault to record and check vma accessable by each
own implementation.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/mm.h       | 17 +++++++++++++++++
 include/linux/mm_types.h |  2 ++
 mm/memory.c              | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3f764e84e567..22a6f4c56ff3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -512,9 +512,12 @@ struct vm_fault {
 		pgoff_t pgoff;			/* Logical page offset based on vma */
 		unsigned long address;		/* Faulting virtual address - masked */
 		unsigned long real_address;	/* Faulting virtual address - unmasked */
+		unsigned long fault_code;	/* Faulting error code during page fault */
+		struct pt_regs *regs;		/* The registers stored during page fault */
 	};
 	enum fault_flag flags;		/* FAULT_FLAG_xxx flags
 					 * XXX: should really be 'const' */
+	vm_flags_t vm_flags;		/* VMA flags to be used for access checking */
 	pmd_t *pmd;			/* Pointer to pmd entry matching
 					 * the 'address' */
 	pud_t *pud;			/* Pointer to pud entry matching
@@ -774,6 +777,9 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 					  unsigned long address);
 
+bool arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf);
+vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline bool vma_start_read(struct vm_area_struct *vma)
@@ -801,6 +807,17 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 	mmap_assert_locked(vmf->vma->vm_mm);
 }
 
+static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+		unsigned long address)
+{
+	return NULL;
+}
+
+static inline vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf)
+{
+	return VM_FAULT_NONE;
+}
+
 #endif /* CONFIG_PER_VMA_LOCK */
 
 extern const struct vm_operations_struct vma_dummy_vm_ops;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index f5ba5b0bc836..702820cea3f9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1119,6 +1119,7 @@ typedef __bitwise unsigned int vm_fault_t;
  * fault. Used to decide whether a process gets delivered SIGBUS or
  * just gets major/minor fault counters bumped up.
  *
+ * @VM_FAULT_NONE:		Special case, not starting to handle fault
  * @VM_FAULT_OOM:		Out Of Memory
  * @VM_FAULT_SIGBUS:		Bad access
  * @VM_FAULT_MAJOR:		Page read from storage
@@ -1139,6 +1140,7 @@ typedef __bitwise unsigned int vm_fault_t;
  *
  */
 enum vm_fault_reason {
+	VM_FAULT_NONE		= (__force vm_fault_t)0x000000,
 	VM_FAULT_OOM            = (__force vm_fault_t)0x000001,
 	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x000002,
 	VM_FAULT_MAJOR          = (__force vm_fault_t)0x000004,
diff --git a/mm/memory.c b/mm/memory.c
index 3b4aaa0d2fff..60fe35db5134 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5510,6 +5510,45 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	count_vm_vma_lock_event(VMA_LOCK_ABORT);
 	return NULL;
 }
+
+#ifdef CONFIG_PER_VMA_LOCK
+bool __weak arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	return (vma->vm_flags & vmf->vm_flags) == 0;
+}
+#endif
+
+vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf)
+{
+	vm_fault_t fault = VM_FAULT_NONE;
+	struct vm_area_struct *vma;
+
+	if (!(vmf->flags & FAULT_FLAG_USER))
+		return fault;
+
+	vma = lock_vma_under_rcu(current->mm, vmf->real_address);
+	if (!vma)
+		return fault;
+
+	if (arch_vma_access_error(vma, vmf)) {
+		vma_end_read(vma);
+		return fault;
+	}
+
+	fault = handle_mm_fault(vma, vmf->real_address,
+				vmf->flags | FAULT_FLAG_VMA_LOCK, vmf->regs);
+
+	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
+		vma_end_read(vma);
+
+	if (fault & VM_FAULT_RETRY)
+		count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	else
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+
+	return fault;
+}
+
 #endif /* CONFIG_PER_VMA_LOCK */
 
 #ifndef __PAGETABLE_P4D_FOLDED
-- 
2.27.0

