Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C9568CDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:32:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdNpG42gGz3f6x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 01:32:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A1PJKhD8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A1PJKhD8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdNnZ5l3sz3f5r
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 01:32:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 052BC61FDF;
	Wed,  6 Jul 2022 15:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F415C3411C;
	Wed,  6 Jul 2022 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657121520;
	bh=qxmioDZyujmnpHoNtR0DVNnhK2IOg2mO6CRoNr8v3fg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1PJKhD86Ysz6XYbJu9RoavpDN6qKjsohTdH+WtLsswpcJ0jcPFur30UuZN0dmRrB
	 0T2ry2rNkSxzk2DH3rbtNwsAGQdDq5BI3W6uij1q4K35BsO0Z3toQffHlKmxIJbvCJ
	 1yaXcvlTi3fUlzhl8JkGD96rIx7woRyS1absHi9z7g9GfhQKvn+wV4M7tkAnIcmA6D
	 omzKBgZYSK7GowbgKZsVRd9hf7X2zwzOOiUuAqMd54oMYLeCsgeF0opXfbDz+jYW0s
	 nV4LBedQw8Ix2AXjN3w4VD9l0DnesuKs6xNeQ2Ha6DapKt6vieWsaswkBZVcghfq+I
	 t8DY37Qe8Z7Sg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/18] powerpc/xive/spapr: correct bitmap allocation size
Date: Wed,  6 Jul 2022 11:31:37 -0400
Message-Id: <20220706153153.1598076-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706153153.1598076-1-sashal@kernel.org>
References: <20220706153153.1598076-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Sasha Levin <sashal@kernel.org>, linmq006@gmail.com, nick.child@ibm.com, ammarfaizi2@gmail.com, christophe.jaillet@wanadoo.fr, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit 19fc5bb93c6bbdce8292b4d7eed04e2fa118d2fe ]

kasan detects access beyond the end of the xibm->bitmap allocation:

BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0x40/0x140
Read of size 8 at addr c00000001d1d0118 by task swapper/0/1

CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc2-00001-g90df023b36dd #28
Call Trace:
[c00000001d98f770] [c0000000012baab8] dump_stack_lvl+0xac/0x108 (unreliable)
[c00000001d98f7b0] [c00000000068faac] print_report+0x37c/0x710
[c00000001d98f880] [c0000000006902c0] kasan_report+0x110/0x354
[c00000001d98f950] [c000000000692324] __asan_load8+0xa4/0xe0
[c00000001d98f970] [c0000000011c6ed0] _find_first_zero_bit+0x40/0x140
[c00000001d98f9b0] [c0000000000dbfbc] xive_spapr_get_ipi+0xcc/0x260
[c00000001d98fa70] [c0000000000d6d28] xive_setup_cpu_ipi+0x1e8/0x450
[c00000001d98fb30] [c000000004032a20] pSeries_smp_probe+0x5c/0x118
[c00000001d98fb60] [c000000004018b44] smp_prepare_cpus+0x944/0x9ac
[c00000001d98fc90] [c000000004009f9c] kernel_init_freeable+0x2d4/0x640
[c00000001d98fd90] [c0000000000131e8] kernel_init+0x28/0x1d0
[c00000001d98fe10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64

Allocated by task 0:
 kasan_save_stack+0x34/0x70
 __kasan_kmalloc+0xb4/0xf0
 __kmalloc+0x268/0x540
 xive_spapr_init+0x4d0/0x77c
 pseries_init_irq+0x40/0x27c
 init_IRQ+0x44/0x84
 start_kernel+0x2a4/0x538
 start_here_common+0x1c/0x20

The buggy address belongs to the object at c00000001d1d0118
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 8-byte region [c00000001d1d0118, c00000001d1d0120)

The buggy address belongs to the physical page:
page:c00c000000074740 refcount:1 mapcount:0 mapping:0000000000000000 index:0xc00000001d1d0558 pfn:0x1d1d
flags: 0x7ffff000000200(slab|node=0|zone=0|lastcpupid=0x7ffff)
raw: 007ffff000000200 c00000001d0003c8 c00000001d0003c8 c00000001d010480
raw: c00000001d1d0558 0000000001e1000a 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c00000001d1d0000: fc 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 c00000001d1d0080: fc fc 00 fc fc fc fc fc fc fc fc fc fc fc fc fc
>c00000001d1d0100: fc fc fc 02 fc fc fc fc fc fc fc fc fc fc fc fc
                            ^
 c00000001d1d0180: fc fc fc fc 04 fc fc fc fc fc fc fc fc fc fc fc
 c00000001d1d0200: fc fc fc fc fc 04 fc fc fc fc fc fc fc fc fc fc

This happens because the allocation uses the wrong unit (bits) when it
should pass (BITS_TO_LONGS(count) * sizeof(long)) or equivalent. With small
numbers of bits, the allocated object can be smaller than sizeof(long),
which results in invalid accesses.

Use bitmap_zalloc() to allocate and initialize the irq bitmap, paired with
bitmap_free() for consistency.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220623182509.3985625-1-nathanl@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/sysdev/xive/spapr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index a82f32fbe772..583b2c6df390 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/bitmap.h>
 #include <linux/cpumask.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
@@ -55,7 +56,7 @@ static int xive_irq_bitmap_add(int base, int count)
 	spin_lock_init(&xibm->lock);
 	xibm->base = base;
 	xibm->count = count;
-	xibm->bitmap = kzalloc(xibm->count, GFP_KERNEL);
+	xibm->bitmap = bitmap_zalloc(xibm->count, GFP_KERNEL);
 	if (!xibm->bitmap) {
 		kfree(xibm);
 		return -ENOMEM;
@@ -73,7 +74,7 @@ static void xive_irq_bitmap_remove_all(void)
 
 	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
 		list_del(&xibm->list);
-		kfree(xibm->bitmap);
+		bitmap_free(xibm->bitmap);
 		kfree(xibm);
 	}
 }
-- 
2.35.1

