Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7780470682C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 14:31:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLssv2kBVz3fFP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 22:31:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FOMsJ12y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLss13Y2cz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 22:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FOMsJ12y;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QLsrx0tWxz4x41;
	Wed, 17 May 2023 22:30:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684326641;
	bh=Rhmhv0vLP07yzl1n/AQedp/eev/vmRMa3v8rjo92qzg=;
	h=From:To:Cc:Subject:Date:From;
	b=FOMsJ12yPKFPc10RSgN4uY0AaXtGmjF6uxdA1v3CHeRHEMowKLL5NduXp5VKTcRfw
	 Rx3vzBJJ2rKmzE7XSiqTiDEY4PdIY6SsAb7tLHJFCLwqnAka6mlscRlNF04Df9cRgB
	 GC2O6lhlZcePYB9gESPga6pyG3Aw5zv9pBDRf2N/S9UAQvkxrYaNf/aD/rU1v4QRv2
	 0hvWmj4K61e6l0KUTujoqmv2f8s6BuDuR2FwwDqGow680G0mfDMTJZnetCjYljmkUC
	 UeScyen+HqBMFTlFFFoSPZT+81BYQY8GLauFClF4ssupPmxier5oUL7/p07dhJhtxR
	 7ZYlUh+4IvtZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Fix native_hpte_remove() to be irq-safe
Date: Wed, 17 May 2023 22:30:33 +1000
Message-Id: <20230517123033.18430-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lockdep warns that the use of the hpte_lock in native_hpte_remove() is
not safe against an IRQ coming in:

  ================================
  WARNING: inconsistent lock state
  6.4.0-rc2-g0c54f4d30ecc #1 Not tainted
  --------------------------------
  inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
  qemu-system-ppc/93865 [HC0[0]:SC0[0]:HE1:SE1] takes:
  c0000000021f5180 (hpte_lock){+.?.}-{0:0}, at: native_lock_hpte+0x8/0xd0
  {IN-SOFTIRQ-W} state was registered at:
    lock_acquire+0x134/0x3f0
    native_lock_hpte+0x44/0xd0
    native_hpte_insert+0xd4/0x2a0
    __hash_page_64K+0x218/0x4f0
    hash_page_mm+0x464/0x840
    do_hash_fault+0x11c/0x260
    data_access_common_virt+0x210/0x220
    __ip_select_ident+0x140/0x150
    ...
    net_rx_action+0x3bc/0x440
    __do_softirq+0x180/0x534
    ...
    sys_sendmmsg+0x34/0x50
    system_call_exception+0x128/0x320
    system_call_common+0x160/0x2e4
  ...
   Possible unsafe locking scenario:

         CPU0
         ----
    lock(hpte_lock);
    <Interrupt>
      lock(hpte_lock);

   *** DEADLOCK ***
  ...
  Call Trace:
    dump_stack_lvl+0x98/0xe0 (unreliable)
    print_usage_bug.part.0+0x250/0x278
    mark_lock+0xc9c/0xd30
    __lock_acquire+0x440/0x1ca0
    lock_acquire+0x134/0x3f0
    native_lock_hpte+0x44/0xd0
    native_hpte_remove+0xb0/0x190
    kvmppc_mmu_map_page+0x650/0x698 [kvm_pr]
    kvmppc_handle_pagefault+0x534/0x6e8 [kvm_pr]
    kvmppc_handle_exit_pr+0x6d8/0xe90 [kvm_pr]
    after_sprg3_load+0x80/0x90 [kvm_pr]
    kvmppc_vcpu_run_pr+0x108/0x270 [kvm_pr]
    kvmppc_vcpu_run+0x34/0x48 [kvm]
    kvm_arch_vcpu_ioctl_run+0x340/0x470 [kvm]
    kvm_vcpu_ioctl+0x338/0x8b8 [kvm]
    sys_ioctl+0x7c4/0x13e0
    system_call_exception+0x128/0x320
    system_call_common+0x160/0x2e4

I suspect kvm_pr is the only caller that doesn't already have IRQs
disabled, which is why this hasn't been reported previously.

Fix it by disabling IRQs in native_hpte_remove().

Fixes: 35159b5717fa ("powerpc/64s: make HPTE lock and native_tlbie_lock irq-safe")
Cc: stable@vger.kernel.org # v6.1+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/hash_native.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 9342e79870df..430d1d935a7c 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -328,10 +328,12 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
 
 static long native_hpte_remove(unsigned long hpte_group)
 {
+	unsigned long hpte_v, flags;
 	struct hash_pte *hptep;
 	int i;
 	int slot_offset;
-	unsigned long hpte_v;
+
+	local_irq_save(flags);
 
 	DBG_LOW("    remove(group=%lx)\n", hpte_group);
 
@@ -356,13 +358,16 @@ static long native_hpte_remove(unsigned long hpte_group)
 		slot_offset &= 0x7;
 	}
 
-	if (i == HPTES_PER_GROUP)
-		return -1;
+	if (i == HPTES_PER_GROUP) {
+		i = -1;
+		goto out;
+	}
 
 	/* Invalidate the hpte. NOTE: this also unlocks it */
 	release_hpte_lock();
 	hptep->v = 0;
-
+out:
+	local_irq_restore(flags);
 	return i;
 }
 
-- 
2.40.1

