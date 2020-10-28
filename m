Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E829D0B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 16:29:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLstv4LfdzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 02:29:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Lxv4ttTo; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lxv4ttTo; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLss14RVSzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 02:27:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603898866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wn0Z2b/sXqhg3H37/VXFagrRrbv7yUzOhfS3vczwgWY=;
 b=Lxv4ttTov+eOfQKO2nOeAdx6401/pAqPz5kPQxNvdVHDiXv0ALlklyAZfyqVjfLoQBAl5C
 Ki7pflwjpjCTZUzl2ODzzTUYnHsw5gURWzWt5aMrdWeW5KjfSVcdCrLaQRpLlnebf4ASx9
 LwFtNAKxy2k1MLY12RzE3rKt5PIYuQM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603898866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wn0Z2b/sXqhg3H37/VXFagrRrbv7yUzOhfS3vczwgWY=;
 b=Lxv4ttTov+eOfQKO2nOeAdx6401/pAqPz5kPQxNvdVHDiXv0ALlklyAZfyqVjfLoQBAl5C
 Ki7pflwjpjCTZUzl2ODzzTUYnHsw5gURWzWt5aMrdWeW5KjfSVcdCrLaQRpLlnebf4ASx9
 LwFtNAKxy2k1MLY12RzE3rKt5PIYuQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-GY6_39BMMkWttzhIjBAwzw-1; Wed, 28 Oct 2020 11:27:43 -0400
X-MC-Unique: GY6_39BMMkWttzhIjBAwzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5514FE9008;
 Wed, 28 Oct 2020 15:27:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-66-92.rdu2.redhat.com
 [10.10.66.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F1810013C1;
 Wed, 28 Oct 2020 15:27:40 +0000 (UTC)
From: Qian Cai <cai@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/eeh_cache: Fix a possible debugfs deadlock
Date: Wed, 28 Oct 2020 11:27:17 -0400
Message-Id: <20201028152717.8967-1-cai@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lockdep complains that a possible deadlock below in
eeh_addr_cache_show() because it is acquiring a lock with IRQ enabled,
but eeh_addr_cache_insert_dev() needs to acquire the same lock with IRQ
disabled. Let's just make eeh_addr_cache_show() acquire the lock with
IRQ disabled as well.

        CPU0                    CPU1
        ----                    ----
   lock(&pci_io_addr_cache_root.piar_lock);
                                local_irq_disable();
                                lock(&tp->lock);
                                lock(&pci_io_addr_cache_root.piar_lock);
   <Interrupt>
     lock(&tp->lock);

  *** DEADLOCK ***

  lock_acquire+0x140/0x5f0
  _raw_spin_lock_irqsave+0x64/0xb0
  eeh_addr_cache_insert_dev+0x48/0x390
  eeh_probe_device+0xb8/0x1a0
  pnv_pcibios_bus_add_device+0x3c/0x80
  pcibios_bus_add_device+0x118/0x290
  pci_bus_add_device+0x28/0xe0
  pci_bus_add_devices+0x54/0xb0
  pcibios_init+0xc4/0x124
  do_one_initcall+0xac/0x528
  kernel_init_freeable+0x35c/0x3fc
  kernel_init+0x24/0x148
  ret_from_kernel_thread+0x5c/0x80

  lock_acquire+0x140/0x5f0
  _raw_spin_lock+0x4c/0x70
  eeh_addr_cache_show+0x38/0x110
  seq_read+0x1a0/0x660
  vfs_read+0xc8/0x1f0
  ksys_read+0x74/0x130
  system_call_exception+0xf8/0x1d0
  system_call_common+0xe8/0x218

Fixes: 5ca85ae6318d ("powerpc/eeh_cache: Add a way to dump the EEH address cache")
Signed-off-by: Qian Cai <cai@redhat.com>
---
 arch/powerpc/kernel/eeh_cache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 6b50bf15d8c1..bf3270426d82 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -264,8 +264,9 @@ static int eeh_addr_cache_show(struct seq_file *s, void *v)
 {
 	struct pci_io_addr_range *piar;
 	struct rb_node *n;
+	unsigned long flags;
 
-	spin_lock(&pci_io_addr_cache_root.piar_lock);
+	spin_lock_irqsave(&pci_io_addr_cache_root.piar_lock, flags);
 	for (n = rb_first(&pci_io_addr_cache_root.rb_root); n; n = rb_next(n)) {
 		piar = rb_entry(n, struct pci_io_addr_range, rb_node);
 
@@ -273,7 +274,7 @@ static int eeh_addr_cache_show(struct seq_file *s, void *v)
 		       (piar->flags & IORESOURCE_IO) ? "i/o" : "mem",
 		       &piar->addr_lo, &piar->addr_hi, pci_name(piar->pcidev));
 	}
-	spin_unlock(&pci_io_addr_cache_root.piar_lock);
+	spin_unlock_irqrestore(&pci_io_addr_cache_root.piar_lock, flags);
 
 	return 0;
 }
-- 
2.28.0

