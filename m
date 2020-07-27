Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7D22E5BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 08:11:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFTw75jBqzDrf7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 16:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T7GLfwNd; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFTtH4QPNzDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 16:09:58 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id il6so2817132pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 23:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3C3dH3g0i+PYHCu53DcHZ4OHn3ongl0uaPAVQV0o7s=;
 b=T7GLfwNdvcmv0xOUq3kRgP714Ixb0kEZTOPIIpt0/I4Fg3yJ0bxpTXRTp0noTAJcp/
 9aUFyBc7fBREt44tDvdRwRBIC/lR8MM0kMxE4dQ1Mj3/XaY0iGxXN+6UJJ+1xTE3oSWK
 KbIkYtJruCljcoz+aCwjAyqwjqq2KmojssdjH/RSEoa4a7J/S/5gUTaF5VFvMOmnEJZn
 hnz5NcMSPUr1IwvRnO8pIGSk+GipmOXCh76sLFnjqoPtJ89PkohVijdzd3RehVdQslSR
 QSYl4W8a2ubw9QVh+YvdNX2MfFWRrnIWataJDGYX0VK4rmHoN0OtgmTto8tUG3sQFiwV
 +TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3C3dH3g0i+PYHCu53DcHZ4OHn3ongl0uaPAVQV0o7s=;
 b=jq6NUXb/5yus5bGIrcREYQlhDbXenOXdW6CXWW/BPEN/jO/keX+auX77+/GAcPunl6
 hh6F0Z1i0E5M1uVSSlQW/KTOssEODNh/CuzYW0u3IujRbhB73Y8vxALYA2uekqeb8PSR
 Zbm18f0o4jzzg9FTpkoSoaGFYlbkxvdQN+R38WVfpqEHcxoxsEdwCT0/GnbdGIRpbPOD
 VKW/ZZwUg4mBhzS2vbtiwmaLXlSO8FTfNuxdkpbRKWzTM17Z2ZBW0p+wPkW4Nc29AoUG
 U2uHDNy8/97L2gEkRF38DfbYBsILArjM3dcrdMCcr64g7Oj2vDkJK04WQhbdTxnyVH+m
 fqcw==
X-Gm-Message-State: AOAM532P+G0eesyOPu9qeaFN9EwE1ZK0oh63tk9i9ZTUUlDK7M2YsCaw
 2A1QzYM4dvrXHqJWJAA/Jovv8Pfp
X-Google-Smtp-Source: ABdhPJxqaNBfV9S1pFuhpqXlzDuh94g35clsYMd7UsJZeN5UWMrOwC8qMvNLFu8v6bpfAMLE+jUNww==
X-Received: by 2002:a17:90b:3508:: with SMTP id
 ls8mr1508459pjb.68.1595830195512; 
 Sun, 26 Jul 2020 23:09:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id z11sm13479949pfk.46.2020.07.26.23.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 23:09:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/hash: Fix hash_preload running with interrupts
 enabled
Date: Mon, 27 Jul 2020 16:09:47 +1000
Message-Id: <20200727060947.10060-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address from the
caller") removed the local_irq_disable from hash_preload, but it was
required for more than just the page table walk: the hash pte busy bit is
effectively a lock which may be taken in interrupt context, and the local
update flag test must not be preempted before it's used.

This solves apparent lockups with perf interrupting __hash_page_64K. If
get_perf_callchain then also takes a hash fault on the same page while it
is already locked, it will loop forever taking hash faults, which looks like
this:

  cpu 0x49e: Vector: 100 (System Reset) at [c00000001a4f7d70]
      pc: c000000000072dc8: hash_page_mm+0x8/0x800
      lr: c00000000000c5a4: do_hash_page+0x24/0x38
      sp: c0002ac1cc69ac70
     msr: 8000000000081033
    current = 0xc0002ac1cc602e00
    paca    = 0xc00000001de1f280   irqmask: 0x03   irq_happened: 0x01
      pid   = 20118, comm = pread2_processe
  Linux version 5.8.0-rc6-00345-g1fad14f18bc6
  49e:mon> t
  [c0002ac1cc69ac70] c00000000000c5a4 do_hash_page+0x24/0x38 (unreliable)
  --- Exception: 300 (Data Access) at c00000000008fa60 __copy_tofrom_user_power7+0x20c/0x7ac
  [link register   ] c000000000335d10 copy_from_user_nofault+0xf0/0x150
  [c0002ac1cc69af70] c00032bf9fa3c880 (unreliable)
  [c0002ac1cc69afa0] c000000000109df0 read_user_stack_64+0x70/0xf0
  [c0002ac1cc69afd0] c000000000109fcc perf_callchain_user_64+0x15c/0x410
  [c0002ac1cc69b060] c000000000109c00 perf_callchain_user+0x20/0x40
  [c0002ac1cc69b080] c00000000031c6cc get_perf_callchain+0x25c/0x360
  [c0002ac1cc69b120] c000000000316b50 perf_callchain+0x70/0xa0
  [c0002ac1cc69b140] c000000000316ddc perf_prepare_sample+0x25c/0x790
  [c0002ac1cc69b1a0] c000000000317350 perf_event_output_forward+0x40/0xb0
  [c0002ac1cc69b220] c000000000306138 __perf_event_overflow+0x88/0x1a0
  [c0002ac1cc69b270] c00000000010cf70 record_and_restart+0x230/0x750
  [c0002ac1cc69b620] c00000000010d69c perf_event_interrupt+0x20c/0x510
  [c0002ac1cc69b730] c000000000027d9c performance_monitor_exception+0x4c/0x60
  [c0002ac1cc69b750] c00000000000b2f8 performance_monitor_common_virt+0x1b8/0x1c0
  --- Exception: f00 (Performance Monitor) at c0000000000cb5b0 pSeries_lpar_hpte_insert+0x0/0x160
  [link register   ] c0000000000846f0 __hash_page_64K+0x210/0x540
  [c0002ac1cc69ba50] 0000000000000000 (unreliable)
  [c0002ac1cc69bb00] c000000000073ae0 update_mmu_cache+0x390/0x3a0
  [c0002ac1cc69bb70] c00000000037f024 wp_page_copy+0x364/0xce0
  [c0002ac1cc69bc20] c00000000038272c do_wp_page+0xdc/0xa60
  [c0002ac1cc69bc70] c0000000003857bc handle_mm_fault+0xb9c/0x1b60
  [c0002ac1cc69bd50] c00000000006c434 __do_page_fault+0x314/0xc90
  [c0002ac1cc69be20] c00000000000c5c8 handle_page_fault+0x10/0x2c
  --- Exception: 300 (Data Access) at 00007fff8c861fe8
  SP (7ffff6b19660) is in userspace

Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Anton Blanchard <anton@ozlabs.org>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Fixes: 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address from the
caller")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S  | 14 +++++++++++---
 arch/powerpc/mm/book3s64/hash_utils.c | 25 +++++++++++++++++++++++++
 arch/powerpc/perf/core-book3s.c       |  6 ++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0fc8bad878b2..446e54c3f71e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3072,10 +3072,18 @@ do_hash_page:
 	ori	r0,r0,DSISR_BAD_FAULT_64S@l
 	and.	r0,r5,r0		/* weird error? */
 	bne-	handle_page_fault	/* if not, try to insert a HPTE */
+
+	/*
+	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
+	 * don't call hash_page, just fail the fault. This is required to
+	 * prevent re-entrancy problems in the hash code, namely perf
+	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
+	 * hash fault. See the comment in hash_preload().
+	 */
 	ld	r11, PACA_THREAD_INFO(r13)
-	lwz	r0,TI_PREEMPT(r11)	/* If we're in an "NMI" */
-	andis.	r0,r0,NMI_MASK@h	/* (i.e. an irq when soft-disabled) */
-	bne	77f			/* then don't call hash_page now */
+	lwz	r0,TI_PREEMPT(r11)
+	andis.	r0,r0,NMI_MASK@h
+	bne	77f
 
 	/*
 	 * r3 contains the trap number
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 468169e33c86..9b9f92ad0e7a 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1559,6 +1559,7 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 	pgd_t *pgdir;
 	int rc, ssize, update_flags = 0;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ | (is_exec ? _PAGE_EXEC : 0);
+	unsigned long flags;
 
 	BUG_ON(get_region_id(ea) != USER_REGION_ID);
 
@@ -1592,6 +1593,28 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 		return;
 #endif /* CONFIG_PPC_64K_PAGES */
 
+	/*
+	 * __hash_page_* must run with interrupts off, as it sets the
+	 * H_PAGE_BUSY bit. It's possible for perf interrupts to hit at any
+	 * time and may take a hash fault reading the user stack, see
+	 * read_user_stack_slow() in the powerpc/perf code.
+	 *
+	 * If that takes a hash fault on the same page as we lock here, it
+	 * will bail out when seeing H_PAGE_BUSY set, and retry the access
+	 * leading to an infinite loop.
+	 *
+	 * Disabling interrupts here does not prevent perf interrupts, but it
+	 * will prevent them taking hash faults (see the NMI test in
+	 * do_hash_page), then read_user_stack's copy_from_user_nofault will
+	 * fail and perf will fall back to read_user_stack_slow(), which
+	 * walks the Linux page tables.
+	 *
+	 * Interrupts must also be off for the duration of the
+	 * mm_is_thread_local test and update, to prevent preempt running the
+	 * mm on another CPU (XXX: this may be racy vs kthread_use_mm).
+	 */
+	local_irq_save(flags);
+
 	/* Is that local to this CPU ? */
 	if (mm_is_thread_local(mm))
 		update_flags |= HPTE_LOCAL_UPDATE;
@@ -1614,6 +1637,8 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 				   mm_ctx_user_psize(&mm->context),
 				   mm_ctx_user_psize(&mm->context),
 				   pte_val(*ptep));
+
+	local_irq_restore(flags);
 }
 
 /*
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index cd6a742ac6ef..01d70280d287 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2179,6 +2179,12 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 
 	perf_read_regs(regs);
 
+	/*
+	 * If perf interrupts hit in a local_irq_disable (soft-masked) region,
+	 * we consider them as NMIs. This is required to prevent hash faults on
+	 * user addresses when reading callchains. See the NMI test in
+	 * do_hash_page.
+	 */
 	nmi = perf_intr_is_nmi(regs);
 	if (nmi)
 		nmi_enter();
-- 
2.23.0

