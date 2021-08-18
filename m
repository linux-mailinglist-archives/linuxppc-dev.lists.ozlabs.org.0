Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5EE3F0342
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 14:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqRSQ3y05z3cVb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 22:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kzWDFZ84;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kzWDFZ84; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqRRp2ZTvz30C6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 22:05:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqRRp0fQDz9sWd; Wed, 18 Aug 2021 22:05:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629288326;
 bh=m40pZNRM71DRB7K+cpT55mEctUJlhzY2B9+nKP1AMNw=;
 h=From:To:Cc:Subject:Date:From;
 b=kzWDFZ84AIf0lDCmuyeH/Vj8sKvN7rrgrs6eo47sr3tY7oslS9SbTvxa2O0fCg1Rj
 vbIhk9av5NpM4Ms1gYlpq2YShoxC4HJu3NxeSThNotKZvOdUyN/SjCyMdQLL0BeZJN
 SRlvkP78N0Jf1HyqmBhddhRV2uhX0i4ooHl0O0wV0gUBuQIarGuAN0UaUIWjU0mm6m
 yqYuSl5BVRNqpp4rldJQzsB5LHaFD5UrUezEK2KQg1xCKWtRQT+5D85r3H5/JyKwcD
 qgMbDy/XcLMi9YqouNVPjYJCsrFFIQHzqcIng5zNINpTGk0HR3Xo8pwAw8+ExViZAU
 nBtSeJwd3d+9g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/mm: Fix set_memory_*() against concurrent accesses
Date: Wed, 18 Aug 2021 22:05:18 +1000
Message-Id: <20210818120518.3603172-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: lvivier@redhat.com, farosas@linux.ibm.com, jniethe5@gmail.com,
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent reported that STRICT_MODULE_RWX was causing intermittent crashes
on one of his systems:

  kernel tried to execute exec-protected page (c008000004073278) - exploit attempt? (uid: 0)
  BUG: Unable to handle kernel instruction fetch
  Faulting instruction address: 0xc008000004073278
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
  Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks ...
  CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
  Workqueue: events control_work_handler [virtio_console]
  NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
  REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
  MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822 XER: 200400cf
  ...
  NIP fill_queue+0xf0/0x210 [virtio_console]
  LR  fill_queue+0xf0/0x210 [virtio_console]
  Call Trace:
    fill_queue+0xb4/0x210 [virtio_console] (unreliable)
    add_port+0x1a8/0x470 [virtio_console]
    control_work_handler+0xbc/0x1e8 [virtio_console]
    process_one_work+0x290/0x590
    worker_thread+0x88/0x620
    kthread+0x194/0x1a0
    ret_from_kernel_thread+0x5c/0x64

Jordan, Fabiano & Murilo were able to reproduce and identify that the
problem is caused by the call to module_enable_ro() in do_init_module(),
which happens after the module's init function has already been called.

Our current implementation of change_page_attr() is not safe against
concurrent accesses, because it invalidates the PTE before flushing the
TLB and then installing the new PTE. That leaves a window in time where
there is no valid PTE for the page, if another CPU tries to access the
page at that time we see something like the fault above.

We can't simply switch to set_pte_at()/flush TLB, because our hash MMU
code doesn't handle a set_pte_at() of a valid PTE. See [1].

But we do have pte_update(), which replaces the old PTE with the new,
meaning there's no window where the PTE is invalid. And the hash MMU
version hash__pte_update() deals with synchronising the hash page table
correctly.

[1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/

Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
Reported-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/pageattr.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

v2: Use pte_update(..., ~0, pte_val(pte), ...) as suggested by Fabiano,
    and ptep_get() as suggested by Christophe.

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 0876216ceee6..edea388e9d3f 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -18,16 +18,12 @@
 /*
  * Updates the attributes of a page in three steps:
  *
- * 1. invalidate the page table entry
- * 2. flush the TLB
- * 3. install the new entry with the updated attributes
- *
- * Invalidating the pte means there are situations where this will not work
- * when in theory it should.
- * For example:
- * - removing write from page whilst it is being executed
- * - setting a page read-only whilst it is being read by another CPU
+ * 1. take the page_table_lock
+ * 2. install the new entry with the updated attributes
+ * 3. flush the TLB
  *
+ * This sequence is safe against concurrent updates, and also allows updating the
+ * attributes of a page currently being executed or accessed.
  */
 static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 {
@@ -36,9 +32,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 
 	spin_lock(&init_mm.page_table_lock);
 
-	/* invalidate the PTE so it's safe to modify */
-	pte = ptep_get_and_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	pte = ptep_get(ptep);
 
 	/* modify the PTE bits as desired, then apply */
 	switch (action) {
@@ -59,11 +53,14 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 		break;
 	}
 
-	set_pte_at(&init_mm, addr, ptep, pte);
+	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);
 
 	/* See ptesync comment in radix__set_pte_at() */
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
+
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
 	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;

base-commit: cbc06f051c524dcfe52ef0d1f30647828e226d30
-- 
2.25.1

