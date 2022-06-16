Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB354E066
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 14:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP13g4CXgz3bkB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 22:01:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YO2PFQuB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1347077z3bZc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 22:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YO2PFQuB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LP1315Bqbz4xXg;
	Thu, 16 Jun 2022 22:00:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655380846;
	bh=jo/dV6iysmKe/fZZWEHdT+d49Xg4lss23KkkOTxWzCw=;
	h=From:To:Cc:Subject:Date:From;
	b=YO2PFQuBET/GKK+gcvRFXux0H3oW8lIDa8SjW/7On3oGYGxWMdRz41N350W/+2oFc
	 VCbUig6C8RkJfy03vYNTzL37cLnIrxysRKNs7GgtjKlGmOtlqqHy/65M0bx8AHOUn1
	 5DPyoTalqdKyWkV8nqHIdQOaqOcPByZnncsOdG9JFxsHjnhcj4zzH+kFx0+J1MmFjD
	 TAupWYX5B6/cJPVEGuR8DrusZaM7viQwgR5fVKVTBaf5G46flnzvgdcoLF6H+EHCFY
	 Ic1lVs0wS7SdjjF/7LZ1DMYjIQZEB4FDBr/btXFrB4ShvXSpnySgGzE4pMwuBWHnI+
	 KA6d7YZXecrsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/mm: Move CMA reservations after initmem_init()
Date: Thu, 16 Jun 2022 22:00:33 +1000
Message-Id: <20220616120033.1976732-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: aneesh.kumar@linux.ibm.com, ziy@nvidia.com, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After commit 11ac3e87ce09 ("mm: cma: use pageblock_order as the single
alignment") there is an error at boot about the KVM CMA reservation
failing, eg:

  kvm_cma_reserve: reserving 6553 MiB for global area
  cma: Failed to reserve 6553 MiB

That makes it impossible to start KVM guests using the hash MMU with
more than 2G of memory, because the VM is unable to allocate a large
enough region for the hash page table, eg:

  $ qemu-system-ppc64 -enable-kvm -M pseries -m 4G ...
  qemu-system-ppc64: Failed to allocate KVM HPT of order 25: Cannot allocate memory

Aneesh pointed out that this happens because when kvm_cma_reserve() is
called, pageblock_order has not been initialised yet, and is still zero,
causing the checks in cma_init_reserved_mem() against
CMA_MIN_ALIGNMENT_PAGES to fail.

Fix it by moving the call to kvm_cma_reserve() after initmem_init(). The
pageblock_order is initialised in sparse_init() which is called from
initmem_init().

Also move the hugetlb CMA reservation.

Fixes: 11ac3e87ce09 ("mm: cma: use pageblock_order as the single alignment")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/setup-common.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index eb0077b302e2..1a02629ec70b 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -935,12 +935,6 @@ void __init setup_arch(char **cmdline_p)
 	/* Print various info about the machine that has been gathered so far. */
 	print_system_info();
 
-	/* Reserve large chunks of memory for use by CMA for KVM. */
-	kvm_cma_reserve();
-
-	/*  Reserve large chunks of memory for us by CMA for hugetlb */
-	gigantic_hugetlb_cma_reserve();
-
 	klp_init_thread_info(&init_task);
 
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
@@ -955,6 +949,13 @@ void __init setup_arch(char **cmdline_p)
 
 	initmem_init();
 
+	/*
+	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb. These must
+	 * be called after initmem_init(), so that pageblock_order is initialised.
+	 */
+	kvm_cma_reserve();
+	gigantic_hugetlb_cma_reserve();
+
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 
 	if (ppc_md.setup_arch)
-- 
2.35.3

