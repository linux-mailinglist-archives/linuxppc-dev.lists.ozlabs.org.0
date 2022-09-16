Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB1C5BADE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:15:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTZLL0J8Bz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:15:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hyzavTjj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZKm63PCz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 23:14:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hyzavTjj;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MTZKm4pmjz4x1V;
	Fri, 16 Sep 2022 23:14:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663334076;
	bh=tHHL9nsKWJ7VCFrdUUzOc9SPI7sODJQObbwiOKuxniw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hyzavTjjsrQMWer5s39is+m0KMOqpQPUVajYAfRTxocVFzR+d2SBz8m8AX7ARgkmi
	 gB1PUn9twHrm1etzQmnAap+RybFQiKeS6tYB2JAJzyD6wbB3y/aYNy464hrwElNRNG
	 4+RWCPB8MFnFUmhAoFLjEP9w/akvfb7LPewSmVcRoV8cnLQldcyszTa4OMoAe9k6D5
	 ILYhmfFLbYFug6PXEGhyJ+1QPX0UfNbVia62RflbCKkmAnOdgPQySmFBaw7nIRvh4W
	 9N/nYEwnFuCJZ5CcHPTzApecDTj2Hx1svaTPzkdx7x+Qu2WzeDj60xd8iP0j7aQI20
	 usT7dTaA/FcrA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/vmlinux.lds: Add an explicit symbol for the SRWX boundary
Date: Fri, 16 Sep 2022 23:14:22 +1000
Message-Id: <20220916131422.318752-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916131422.318752-1-mpe@ellerman.id.au>
References: <20220916131422.318752-1-mpe@ellerman.id.au>
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

Currently __init_begin is used as the boundary for strict RWX between
executable/read-only text and data, and non-executable (after boot) code
and data.

But that's a little subtle, so add an explicit symbol to document that
the SRWX boundary lies there, and add a comment making it clear that
__init_begin must also begin there.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/sections.h      | 1 +
 arch/powerpc/kernel/vmlinux.lds.S        | 9 +++++++--
 arch/powerpc/mm/book3s32/mmu.c           | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 183e6b8af392..7ed7273b7baf 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -13,6 +13,7 @@ typedef struct func_desc func_desc_t;
 #include <asm-generic/sections.h>
 
 extern char __head_end[];
+extern char __srwx_boundary[];
 
 /* Patch sites */
 extern s32 patch__call_flush_branch_caches1;
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 4e56fc0ee42a..24f037f517e0 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -214,11 +214,16 @@ SECTIONS
 	}
 #endif
 
+	/*
+	 * Various code relies on __init_begin being at the strict RWX boundary.
+	 */
+	. = ALIGN(STRICT_ALIGN_SIZE);
+	__srwx_boundary = .;
+	__init_begin = .;
+
 /*
  * Init sections discarded at runtime
  */
-	. = ALIGN(STRICT_ALIGN_SIZE);
-	__init_begin = .;
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
 		_sinittext = .;
 		INIT_TEXT
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index a96b73006dfb..250d174459d4 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -158,7 +158,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned long to
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
 	unsigned long done;
-	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
+	unsigned long border = (unsigned long)__srwx_boundary - PAGE_OFFSET;
 	unsigned long size;
 
 	size = roundup_pow_of_two((unsigned long)_einittext - PAGE_OFFSET);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 698274109c91..9f880f91f584 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -259,8 +259,8 @@ print_mapping(unsigned long start, unsigned long end, unsigned long size, bool e
 static unsigned long next_boundary(unsigned long addr, unsigned long end)
 {
 #ifdef CONFIG_STRICT_KERNEL_RWX
-	if (addr < __pa_symbol(__init_begin))
-		return __pa_symbol(__init_begin);
+	if (addr < __pa_symbol(__srwx_boundary))
+		return __pa_symbol(__srwx_boundary);
 #endif
 	return end;
 }
-- 
2.37.2

