Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE35929EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 08:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5lSS6sP6z3bkb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 16:56:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f4H4AEBG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5lRs6YHzz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 16:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f4H4AEBG;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M5lRm4DZNz4xV3;
	Mon, 15 Aug 2022 16:56:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660546564;
	bh=4e1xX13sWePAAoDa7lNMiMoBGqBO22OeqsZWNRorB5Q=;
	h=From:To:Cc:Subject:Date:From;
	b=f4H4AEBG6BFqqvZkoVEmRLgp5K08PLH9Wcf8Y6SnG9hhl8TuYmwQS3FFo3L+YBQ4r
	 znxJUDXos3FaeAAZ/XkdzVt2v0Sen8jL8AWW6h2vJ0WNBRZyMa+kn8ngTPc5b/tczb
	 ZQ4eSSIRWj3nTvOAlCCbkmp9PkD1Pewc3Yjs+cGVWmApv22WOzV42jIWyyttGOZIsU
	 eue55i2qS3oauTuZlX+hBtQAzEeYoq5xW+x2CHpkUIoPuI5hcQh/sLdL6/fQ0LWjiP
	 FrV/S6KTLU4IxVBlAGoNLWuJzfV/Bp606jvUNXmDVkzGGV387tMXrL4QX+hY6A5+pL
	 b0c6sW1+yzMBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/pci: Fix get_phb_number() locking
Date: Mon, 15 Aug 2022 16:55:50 +1000
Message-Id: <20220815065550.1303620-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
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
Cc: pali@kernel.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent change to get_phb_number() causes a DEBUG_ATOMIC_SLEEP
warning on some systems:

  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper
  preempt_count: 1, expected: 0
  RCU nest depth: 0, expected: 0
  1 lock held by swapper/1:
   #0: c157efb0 (hose_spinlock){+.+.}-{2:2}, at: pcibios_alloc_controller+0x64/0x220
  Preemption disabled at:
  [<00000000>] 0x0
  CPU: 0 PID: 1 Comm: swapper Not tainted 5.19.0-yocto-standard+ #1
  Call Trace:
  [d101dc90] [c073b264] dump_stack_lvl+0x50/0x8c (unreliable)
  [d101dcb0] [c0093b70] __might_resched+0x258/0x2a8
  [d101dcd0] [c0d3e634] __mutex_lock+0x6c/0x6ec
  [d101dd50] [c0a84174] of_alias_get_id+0x50/0xf4
  [d101dd80] [c002ec78] pcibios_alloc_controller+0x1b8/0x220
  [d101ddd0] [c140c9dc] pmac_pci_init+0x198/0x784
  [d101de50] [c140852c] discover_phbs+0x30/0x4c
  [d101de60] [c0007fd4] do_one_initcall+0x94/0x344
  [d101ded0] [c1403b40] kernel_init_freeable+0x1a8/0x22c
  [d101df10] [c00086e0] kernel_init+0x34/0x160
  [d101df30] [c001b334] ret_from_kernel_thread+0x5c/0x64

This is because pcibios_alloc_controller() holds hose_spinlock but
of_alias_get_id() takes of_mutex which can sleep.

The hose_spinlock protects the phb_bitmap, and also the hose_list, but
it doesn't need to be held while get_phb_number() calls the OF routines,
because those are only looking up information in the device tree.

So fix it by having get_phb_number() take the hose_spinlock itself, only
where required, and then dropping the lock before returning.
pcibios_alloc_controller() then needs to take the lock again before the
list_add() but that's safe, the order of the list is not important.

Fixes: 0fe1e96fef0a ("powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/pci-common.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index bdd3332200c5..31de91c8359c 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -68,10 +68,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
 	pci_dma_ops = dma_ops;
 }
 
-/*
- * This function should run under locking protection, specifically
- * hose_spinlock.
- */
 static int get_phb_number(struct device_node *dn)
 {
 	int ret, phb_id = -1;
@@ -108,15 +104,20 @@ static int get_phb_number(struct device_node *dn)
 	if (!ret)
 		phb_id = (int)(prop & (MAX_PHBS - 1));
 
+	spin_lock(&hose_spinlock);
+
 	/* We need to be sure to not use the same PHB number twice. */
 	if ((phb_id >= 0) && !test_and_set_bit(phb_id, phb_bitmap))
-		return phb_id;
+		goto out_unlock;
 
 	/* If everything fails then fallback to dynamic PHB numbering. */
 	phb_id = find_first_zero_bit(phb_bitmap, MAX_PHBS);
 	BUG_ON(phb_id >= MAX_PHBS);
 	set_bit(phb_id, phb_bitmap);
 
+out_unlock:
+	spin_unlock(&hose_spinlock);
+
 	return phb_id;
 }
 
@@ -127,10 +128,13 @@ struct pci_controller *pcibios_alloc_controller(struct device_node *dev)
 	phb = zalloc_maybe_bootmem(sizeof(struct pci_controller), GFP_KERNEL);
 	if (phb == NULL)
 		return NULL;
-	spin_lock(&hose_spinlock);
+
 	phb->global_number = get_phb_number(dev);
+
+	spin_lock(&hose_spinlock);
 	list_add_tail(&phb->list_node, &hose_list);
 	spin_unlock(&hose_spinlock);
+
 	phb->dn = dev;
 	phb->is_dynamic = slab_is_available();
 #ifdef CONFIG_PPC64
-- 
2.37.1

