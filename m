Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDAF751D9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 11:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1qSZ726Pz3dJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 19:44:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1qNn4msxz3cHf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 19:40:57 +1000 (AEST)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1qMR24J5zrRlb;
	Thu, 13 Jul 2023 17:39:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:22 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
Subject: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page fault handler
Date: Thu, 13 Jul 2023 17:53:29 +0800
Message-ID: <20230713095339.189715-2-wangkefeng.wang@huawei.com>
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

There are more and more architectures enabled ARCH_SUPPORTS_PER_VMA_LOCK,
eg, x86, arm64, powerpc and s390, and riscv, those implementation are very
similar which results in some duplicated codes, let's add a generic VMA
lock-based page fault handler to eliminate them, and which also make it
easy to support this feature on new architectures.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/mm.h | 28 ++++++++++++++++++++++++++++
 mm/memory.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c7886784832b..cba1b7b19c9d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -633,6 +633,15 @@ static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
 static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
 #endif /* CONFIG_NUMA_BALANCING */
 
+struct vm_locked_fault {
+	struct mm_struct *mm;
+	unsigned long address;
+	unsigned int fault_flags;
+	unsigned long vm_flags;
+	struct pt_regs *regs;
+	unsigned long fault_code;
+};
+
 #ifdef CONFIG_PER_VMA_LOCK
 /*
  * Try to read-lock a vma. The function is allowed to occasionally yield false
@@ -733,6 +742,19 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 					  unsigned long address);
 
+#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_flags, _regs, _fault_code) \
+	_name.mm		= _mm;			\
+	_name.address		= _address;		\
+	_name.fault_flags	= _fault_flags;		\
+	_name.vm_flags		= _vm_flags;		\
+	_name.regs		= _regs;		\
+	_name.fault_code	= _fault_code
+
+int __weak arch_vma_check_access(struct vm_area_struct *vma,
+				 struct vm_locked_fault *vmlf);
+
+int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline bool vma_start_read(struct vm_area_struct *vma)
@@ -742,6 +764,12 @@ static inline void vma_start_write(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma,
 				     bool detached) {}
+#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_flags, _regs, _fault_code)
+static inline int try_vma_locked_page_fault(struct vm_locked_fault *vmlf,
+					    vm_fault_t *ret)
+{
+	return -EINVAL;
+}
 
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
diff --git a/mm/memory.c b/mm/memory.c
index ad790394963a..d3f5d1270e7a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5449,6 +5449,48 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	count_vm_vma_lock_event(VMA_LOCK_ABORT);
 	return NULL;
 }
+
+int __weak arch_vma_check_access(struct vm_area_struct *vma,
+				 struct vm_locked_fault *vmlf)
+{
+	if (!(vma->vm_flags & vmlf->vm_flags))
+		return -EINVAL;
+	return 0;
+}
+
+int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret)
+{
+	struct vm_area_struct *vma;
+	vm_fault_t fault;
+
+	if (!(vmlf->fault_flags & FAULT_FLAG_USER))
+		return -EINVAL;
+
+	vma = lock_vma_under_rcu(vmlf->mm, vmlf->address);
+	if (!vma)
+		return -EINVAL;
+
+	if (arch_vma_check_access(vma, vmlf)) {
+		vma_end_read(vma);
+		return -EINVAL;
+	}
+
+	fault = handle_mm_fault(vma, vmlf->address,
+				vmlf->fault_flags | FAULT_FLAG_VMA_LOCK,
+				vmlf->regs);
+	*ret = fault;
+
+	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
+		vma_end_read(vma);
+
+	if ((fault & VM_FAULT_RETRY))
+		count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	else
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+
+	return 0;
+}
+
 #endif /* CONFIG_PER_VMA_LOCK */
 
 #ifndef __PAGETABLE_P4D_FOLDED
-- 
2.27.0

