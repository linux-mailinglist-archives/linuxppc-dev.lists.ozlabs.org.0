Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B47D3301
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 13:25:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aDM4xx7R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDXtk5ywwz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 22:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aDM4xx7R;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDXst2jDDz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 22:25:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698060306;
	bh=gOlR4G1l13aL+evjDnjeM9EgaAcwh5bo8mHaZqLDU4E=;
	h=From:To:Cc:Subject:Date:From;
	b=aDM4xx7RFEBYMGjoLylchBOM7TnhCz1NGLp3ddLQqj9OWM2iTxx1ZL6ShHiWP8p5J
	 IpFfHaNzYVYQQSnFFXLPRC465aL7KJHxRTOvNnnIHA592znI9E0HqVtllh+F4uhB1P
	 z5NrCfCaCDhWxhhqJKpo6SnBUwYKlZjVvjxyxQYSc/RNmy4caPwNQGz0jhszt9K7n6
	 2DcRk6FHbohJKGInmBvoPHENCWRCbRQ8yiPYxg/Y8n+bhFnKv1xCFMimd7R2pV3eUu
	 3aRfkKBCy1PzuvdzoxKM7n+RlxTXo0XZVuE94rC2BM0J4PX09ro83JYozxoAbw3q2s
	 T4CUve/z7IyxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SDXss5ZYjz4xWF;
	Mon, 23 Oct 2023 22:25:05 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/mm: Fix boot crash with FLATMEM
Date: Mon, 23 Oct 2023 22:25:00 +1100
Message-ID: <20231023112500.1550208-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: erhard_f@mailbox.org, willy@infradead.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard reported that his G5 was crashing with v6.6-rc kernels:

  mpic: Setting up HT PICs workarounds for U3/U4
  BUG: Unable to handle kernel data access at 0xfeffbb62ffec65fe
  Faulting instruction address: 0xc00000000005dc40
  Oops: Kernel access of bad area, sig: 11 [#1]
  BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T  6.6.0-rc3-PMacGS #1
  Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
  NIP:  c00000000005dc40 LR: c000000000066660 CTR: c000000000007730
  REGS: c0000000022bf510 TRAP: 0380   Tainted: G                T (6.6.0-rc3-PMacGS)
  MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 44004242  XER: 00000000
  IRQMASK: 3
  GPR00: 0000000000000000 c0000000022bf7b0 c0000000010c0b00 00000000000001ac
  GPR04: 0000000003c80000 0000000000000300 c0000000f20001ae 0000000000000300
  GPR08: 0000000000000006 feffbb62ffec65ff 0000000000000001 0000000000000000
  GPR12: 9000000000001032 c000000002362000 c000000000f76b80 000000000349ecd8
  GPR16: 0000000002367ba8 0000000002367f08 0000000000000006 0000000000000000
  GPR20: 00000000000001ac c000000000f6f920 c0000000022cd985 000000000000000c
  GPR24: 0000000000000300 00000003b0a3691d c0003e008030000e 0000000000000000
  GPR28: c00000000000000c c0000000f20001ee feffbb62ffec65fe 00000000000001ac
  NIP hash_page_do_lazy_icache+0x50/0x100
  LR  __hash_page_4K+0x420/0x590
  Call Trace:
    hash_page_mm+0x364/0x6f0
    do_hash_fault+0x114/0x2b0
    data_access_common_virt+0x198/0x1f0
  --- interrupt: 300 at mpic_init+0x4bc/0x10c4
  NIP:  c000000002020a5c LR: c000000002020a04 CTR: 0000000000000000
  REGS: c0000000022bf9f0 TRAP: 0300   Tainted: G                T (6.6.0-rc3-PMacGS)
  MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 24004248  XER: 00000000
  DAR: c0003e008030000e DSISR: 40000000 IRQMASK: 1
  ...
  NIP mpic_init+0x4bc/0x10c4
  LR  mpic_init+0x464/0x10c4
  --- interrupt: 300
    pmac_setup_one_mpic+0x258/0x2dc
    pmac_pic_init+0x28c/0x3d8
    init_IRQ+0x90/0x140
    start_kernel+0x57c/0x78c
    start_here_common+0x1c/0x20

A bisect pointed to the breakage beginning with commit 9fee28baa601 ("powerpc:
implement the new page table range API").

Analysis of the oops pointed to a struct page with a corrupted
compound_head being loaded via page_folio() -> _compound_head() in
hash_page_do_lazy_icache().

The access by the mpic code is to an MMIO address, so the expectation
is that the struct page for that address would be initialised by
init_unavailable_range(), as pointed out by Aneesh.

Instrumentation showed that was not the case, which eventually lead to
the realisation that pfn_valid() was returning false for that address,
causing the struct page to not be initialised.

Because the system is using FLATMEM, the version of pfn_valid() in
memory_model.h is used:

static inline int pfn_valid(unsigned long pfn)
{
	...
	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
}

Which relies on max_mapnr being initialised. Early in boot max_mapnr is
zero meaning no PFNs are valid.

max_mapnr is initialised in mem_init() called via:

  start_kernel()
    mm_core_init()  # init/main.c:928
      mem_init()

But that is too late for the usage in init_unavailable_range() called via:

  start_kernel()
    setup_arch()    # init/main.c:893
      paging_init()
        free_area_init()
          init_unavailable_range()

Although max_mapnr is currently set in mem_init(), the value is actually
already available much earlier, as soon as mem_topology_setup() has
completed, which is also before paging_init() is called. So move the
initialisation there, which causes paging_init() to correctly initialise
the struct page and fixes the bug.

This bug seems to have been lurking for years, but went unnoticed
because the pre-folio code was inspecting the uninitialised page->flags
but not dereferencing it.

Thanks to Erhard and Aneesh for help debugging.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/all/20230929132750.3cd98452@yea/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/setup-common.c | 2 ++
 arch/powerpc/mm/mem.c              | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 2f1026fba00d..20f72cd1d813 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -948,6 +948,8 @@ void __init setup_arch(char **cmdline_p)
 
 	/* Parse memory topology */
 	mem_topology_setup();
+	/* Set max_mapnr before paging_init() */
+	set_max_mapnr(max_pfn);
 
 	/*
 	 * Release secondary cpus out of their spinloops at 0x60 now that
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8b121df7b08f..07e8f4f1e07f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -288,7 +288,6 @@ void __init mem_init(void)
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-	set_max_mapnr(max_pfn);
 
 	kasan_late_init();
 
-- 
2.41.0

