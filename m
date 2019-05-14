Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D01C5AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:07:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Bfd6XcSzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:07:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QEXAUooo"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453Bbf30PxzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 19:05:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453BbY47qqz9v0YZ;
 Tue, 14 May 2019 11:05:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QEXAUooo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b0W5i0t6Q68R; Tue, 14 May 2019 11:05:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453BbY301Rz9v0YY;
 Tue, 14 May 2019 11:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557824713; bh=v4bNhQOc7ZvxUNO59OYToxqsttx0pncVXMsK3CmHAi4=;
 h=From:Subject:To:Cc:Date:From;
 b=QEXAUoooJ0KRP4YbPD13py3w4zLXPhVu4CkmcJFYQi5j7hsZ0t4HmObK8oCaHfsda
 Rem60QOLsHg4ZpIuHXgUBxZAdBp5vl8zlNx0GZNilvjDfKxERLPKt8ZHwxVuNACHA3
 Ekz9EZFNrLrSZAuM0phNLlNx3MXmLmJdEZD1GaEI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 776788B8BE;
 Tue, 14 May 2019 11:05:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IJPs24qvg3OW; Tue, 14 May 2019 11:05:14 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 23C578B8BD;
 Tue, 14 May 2019 11:05:14 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B72316742D; Tue, 14 May 2019 09:05:13 +0000 (UTC)
Message-Id: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/4] powerpc/64: flush_inval_dcache_range() becomes
 flush_dcache_range()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Oliver O'Halloran <oohall@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
Date: Tue, 14 May 2019 09:05:13 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On most arches having function flush_dcache_range(), including PPC32,
this function does a writeback and invalidation of the cache bloc.

On PPC64, flush_dcache_range() only does a writeback while
flush_inval_dcache_range() does the invalidation in addition.

In addition it looks like within arch/powerpc/, there are no PPC64
platforms using flush_dcache_range()

This patch drops the existing 64 bits version of flush_dcache_range()
and renames flush_inval_dcache_range() into flush_dcache_range().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cacheflush.h |  1 -
 arch/powerpc/kernel/misc_64.S         | 27 ++-------------------------
 arch/powerpc/lib/pmem.c               |  8 ++++----
 arch/powerpc/mm/mem.c                 |  4 ++--
 arch/powerpc/sysdev/dart_iommu.c      |  2 +-
 drivers/macintosh/smu.c               |  4 ++--
 6 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index d5a8d7bf0759..e9a40b110f1d 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -109,7 +109,6 @@ static inline void invalidate_dcache_range(unsigned long start,
 #endif /* CONFIG_PPC32 */
 #ifdef CONFIG_PPC64
 extern void flush_dcache_range(unsigned long start, unsigned long stop);
-extern void flush_inval_dcache_range(unsigned long start, unsigned long stop);
 #endif
 
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 262ba9481781..a4fd536efb44 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -121,31 +121,8 @@ EXPORT_SYMBOL(flush_icache_range)
  *
  *    flush all bytes from start to stop-1 inclusive
  */
-_GLOBAL_TOC(flush_dcache_range)
 
-/*
- * Flush the data cache to memory 
- * 
- * Different systems have different cache line sizes
- */
- 	ld	r10,PPC64_CACHES@toc(r2)
-	lwz	r7,DCACHEL1BLOCKSIZE(r10)	/* Get dcache block size */
-	addi	r5,r7,-1
-	andc	r6,r3,r5		/* round low to line bdy */
-	subf	r8,r6,r4		/* compute length */
-	add	r8,r8,r5		/* ensure we get enough */
-	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of dcache block size */
-	srw.	r8,r8,r9		/* compute line count */
-	beqlr				/* nothing to do? */
-	mtctr	r8
-0:	dcbst	0,r6
-	add	r6,r6,r7
-	bdnz	0b
-	sync
-	blr
-EXPORT_SYMBOL(flush_dcache_range)
-
-_GLOBAL(flush_inval_dcache_range)
+_GLOBAL_TOC(flush_dcache_range)
  	ld	r10,PPC64_CACHES@toc(r2)
 	lwz	r7,DCACHEL1BLOCKSIZE(r10)	/* Get dcache block size */
 	addi	r5,r7,-1
@@ -164,7 +141,7 @@ _GLOBAL(flush_inval_dcache_range)
 	sync
 	isync
 	blr
-
+EXPORT_SYMBOL(flush_dcache_range)
 
 /*
  * Flush a particular page from the data cache to RAM.
diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 53c018762e1c..36e08bf850e0 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -23,14 +23,14 @@
 void arch_wb_cache_pmem(void *addr, size_t size)
 {
 	unsigned long start = (unsigned long) addr;
-	flush_inval_dcache_range(start, start + size);
+	flush_dcache_range(start, start + size);
 }
 EXPORT_SYMBOL(arch_wb_cache_pmem);
 
 void arch_invalidate_pmem(void *addr, size_t size)
 {
 	unsigned long start = (unsigned long) addr;
-	flush_inval_dcache_range(start, start + size);
+	flush_dcache_range(start, start + size);
 }
 EXPORT_SYMBOL(arch_invalidate_pmem);
 
@@ -43,7 +43,7 @@ long __copy_from_user_flushcache(void *dest, const void __user *src,
 	unsigned long copied, start = (unsigned long) dest;
 
 	copied = __copy_from_user(dest, src, size);
-	flush_inval_dcache_range(start, start + size);
+	flush_dcache_range(start, start + size);
 
 	return copied;
 }
@@ -53,7 +53,7 @@ void *memcpy_flushcache(void *dest, const void *src, size_t size)
 	unsigned long start = (unsigned long) dest;
 
 	memcpy(dest, src, size);
-	flush_inval_dcache_range(start, start + size);
+	flush_dcache_range(start, start + size);
 
 	return dest;
 }
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index cd525d709072..39e66f033995 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -125,7 +125,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size, struct vmem_altmap *altm
 			start, start + size, rc);
 		return -EFAULT;
 	}
-	flush_inval_dcache_range(start, start + size);
+	flush_dcache_range(start, start + size);
 
 	return __add_pages(nid, start_pfn, nr_pages, altmap, want_memblock);
 }
@@ -153,7 +153,7 @@ int __ref arch_remove_memory(int nid, u64 start, u64 size,
 
 	/* Remove htab bolted mappings for this section of memory */
 	start = (unsigned long)__va(start);
-	flush_inval_dcache_range(start, start + size);
+	flush_dcache_range(start, start + size);
 	ret = remove_section_mapping(start, start + size);
 
 	/* Ensure all vmalloc mappings are flushed in case they also
diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 2a751795ec1e..bc259a8d3f2d 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -158,7 +158,7 @@ static void dart_cache_sync(unsigned int *base, unsigned int count)
 	unsigned int tmp;
 
 	/* Perform a standard cache flush */
-	flush_inval_dcache_range(start, end);
+	flush_dcache_range(start, end);
 
 	/*
 	 * Perform the sequence described in the CPC925 manual to
diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 6a844125cf2d..97758eed03f2 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -133,7 +133,7 @@ static void smu_start_cmd(void)
 	/* Flush command and data to RAM */
 	faddr = (unsigned long)smu->cmd_buf;
 	fend = faddr + smu->cmd_buf->length + 2;
-	flush_inval_dcache_range(faddr, fend);
+	flush_dcache_range(faddr, fend);
 
 
 	/* We also disable NAP mode for the duration of the command
@@ -195,7 +195,7 @@ static irqreturn_t smu_db_intr(int irq, void *arg)
 		 * reply length (it's only 2 cache lines anyway)
 		 */
 		faddr = (unsigned long)smu->cmd_buf;
-		flush_inval_dcache_range(faddr, faddr + 256);
+		flush_dcache_range(faddr, faddr + 256);
 
 		/* Now check ack */
 		ack = (~cmd->cmd) & 0xff;
-- 
2.13.3

