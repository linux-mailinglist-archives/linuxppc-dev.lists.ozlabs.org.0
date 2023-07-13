Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E1751D8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 11:42:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1qQJ24y8z3cY0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 19:42:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1qNN5WZXz3c8c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 19:40:36 +1000 (AEST)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R1qMc4wfvz18Lt7;
	Thu, 13 Jul 2023 17:39:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:31 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
Subject: [PATCH rfc -next 08/10] loongarch: mm: cleanup __do_page_fault()
Date: Thu, 13 Jul 2023 17:53:36 +0800
Message-ID: <20230713095339.189715-9-wangkefeng.wang@huawei.com>
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

Cleanup __do_page_fault() by reuse bad_area_nosemaphore and
bad_area label.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/loongarch/mm/fault.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index da5b6d518cdb..03d06ee184da 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -151,18 +151,15 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		if (!user_mode(regs))
 			no_context(regs, address);
 		else
-			do_sigsegv(regs, write, address, si_code);
-		return;
+			goto bad_area_nosemaphore;
 	}
 
 	/*
 	 * If we're in an interrupt or have no user
 	 * context, we must not take the fault..
 	 */
-	if (faulthandler_disabled() || !mm) {
-		do_sigsegv(regs, write, address, si_code);
-		return;
-	}
+	if (faulthandler_disabled() || !mm)
+		goto bad_area_nosemaphore;
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
@@ -172,23 +169,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	vma = lock_mm_and_find_vma(mm, address, regs);
 	if (unlikely(!vma))
 		goto bad_area_nosemaphore;
-	goto good_area;
-
-/*
- * Something tried to access memory that isn't in our memory map..
- * Fix it, but check if it's kernel or user first..
- */
-bad_area:
-	mmap_read_unlock(mm);
-bad_area_nosemaphore:
-	do_sigsegv(regs, write, address, si_code);
-	return;
 
-/*
- * Ok, we have a good vm_area for this memory access, so
- * we can handle it..
- */
-good_area:
 	si_code = SEGV_ACCERR;
 
 	if (write) {
@@ -229,14 +210,15 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		 */
 		goto retry;
 	}
+
+	mmap_read_unlock(mm);
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
-		mmap_read_unlock(mm);
 		if (fault & VM_FAULT_OOM) {
 			do_out_of_memory(regs, address);
 			return;
 		} else if (fault & VM_FAULT_SIGSEGV) {
-			do_sigsegv(regs, write, address, si_code);
-			return;
+			goto bad_area_nosemaphore;
 		} else if (fault & (VM_FAULT_SIGBUS|VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 			do_sigbus(regs, write, address, si_code);
 			return;
@@ -244,7 +226,11 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		BUG();
 	}
 
+	return;
+bad_area:
 	mmap_read_unlock(mm);
+bad_area_nosemaphore:
+	do_sigsegv(regs, write, address, si_code);
 }
 
 asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
-- 
2.27.0

