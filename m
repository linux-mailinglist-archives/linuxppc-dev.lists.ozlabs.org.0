Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BB41E1CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 20:53:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL2T66XB5z3cT1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 04:53:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dXxprhJQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dXxprhJQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL2Q90ZRZz3bZM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 04:51:12 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A2FA613CD;
 Thu, 30 Sep 2021 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633027870;
 bh=t26przUqxCSGoBx41IMst/8wXJXoFwnOeTOXHswXAgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dXxprhJQZdZ6sk4rSn/rJZ0y8BsCGoLVOFNDP79gSG9bfzMuQ6Jj2iGJcEg84pkyp
 M6Ch/waR2QQadlfi7FqEJZBx/jculiE7ratgds8uDW/Hl+kI8vNSqGY+Bnfe1jSZJa
 bk55N5LaCDn5b7P2i2GzxYuHtQK/V6Lj6nQVhHYY3gwcoF1r53ooG6I5iCe7Q+3Fze
 qmq4xeJ2HVjQ8xQvxiVjVvdkL5t/CKmwoGH0d06XFqf35691Wg6/f2+5qy96xPVOHK
 nEt3pQk9SsCPQ7ksYP1gKGmSLs18lrKf5M2VN3dItzxzsbwE1uoM/EEg4NKM+HRtLx
 2Csut9P5pc//w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] memblock: stop aliasing __memblock_free_late with
 memblock_free_late
Date: Thu, 30 Sep 2021 21:50:29 +0300
Message-Id: <20210930185031.18648-5-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
References: <20210930185031.18648-1-rppt@kernel.org>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, xen-devel@lists.xenproject.org,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-um@lists.infradead.org, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

memblock_free_late() is a NOP wrapper for __memblock_free_late(), there is
no point to keep this indirection.

Drop the wrapper and rename __memblock_free_late() to memblock_free_late().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/memblock.h | 7 +------
 mm/memblock.c            | 8 ++++----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index fc8183be340c..e25f964fdd60 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -133,7 +133,7 @@ void __next_mem_range_rev(u64 *idx, int nid, enum memblock_flags flags,
 			  struct memblock_type *type_b, phys_addr_t *out_start,
 			  phys_addr_t *out_end, int *out_nid);
 
-void __memblock_free_late(phys_addr_t base, phys_addr_t size);
+void memblock_free_late(phys_addr_t base, phys_addr_t size);
 
 #ifdef CONFIG_HAVE_MEMBLOCK_PHYS_MAP
 static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
@@ -441,11 +441,6 @@ static inline void *memblock_alloc_node(phys_addr_t size,
 				      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
 }
 
-static inline void memblock_free_late(phys_addr_t base, phys_addr_t size)
-{
-	__memblock_free_late(base, size);
-}
-
 /*
  * Set the allocation direction to bottom-up or top-down.
  */
diff --git a/mm/memblock.c b/mm/memblock.c
index 184dcd2e5d99..603f4a02be9b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -366,14 +366,14 @@ void __init memblock_discard(void)
 		addr = __pa(memblock.reserved.regions);
 		size = PAGE_ALIGN(sizeof(struct memblock_region) *
 				  memblock.reserved.max);
-		__memblock_free_late(addr, size);
+		memblock_free_late(addr, size);
 	}
 
 	if (memblock.memory.regions != memblock_memory_init_regions) {
 		addr = __pa(memblock.memory.regions);
 		size = PAGE_ALIGN(sizeof(struct memblock_region) *
 				  memblock.memory.max);
-		__memblock_free_late(addr, size);
+		memblock_free_late(addr, size);
 	}
 
 	memblock_memory = NULL;
@@ -1586,7 +1586,7 @@ void * __init memblock_alloc_try_nid(
 }
 
 /**
- * __memblock_free_late - free pages directly to buddy allocator
+ * memblock_free_late - free pages directly to buddy allocator
  * @base: phys starting address of the  boot memory block
  * @size: size of the boot memory block in bytes
  *
@@ -1594,7 +1594,7 @@ void * __init memblock_alloc_try_nid(
  * down, but we are still initializing the system.  Pages are released directly
  * to the buddy allocator.
  */
-void __init __memblock_free_late(phys_addr_t base, phys_addr_t size)
+void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
 {
 	phys_addr_t cursor, end;
 
-- 
2.28.0

