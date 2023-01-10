Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 860166640DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 13:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrrHS32LBz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 23:49:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nBH+lYDM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrrFY2Fdtz3f9y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 23:48:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nBH+lYDM;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NrrFW6Q7nz4xwt;
	Tue, 10 Jan 2023 23:47:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673354880;
	bh=seHIFiz300ZoowfxLAP629QCTs9VXMifhahbL0/DywU=;
	h=From:To:Subject:Date:From;
	b=nBH+lYDMBlZ8o/ic1M80GAxxb+YGCF2LNjgqgZZ1hYemoynvTu/BePCkHexQ7h7Hx
	 ukR+f3gTFGhc+K6Tl3H0uae74CJ+qYudliWbdWXI8pmZeZ5pf4+5gC5PdHrKwoQfZh
	 4FP3y4qrjIuEORzFTskwRmkf+qmLUBdIlPbsuah8uIgmtYEU7CNAPD2hCYXTkjzgAo
	 vVLLjttRv6y8Xvu2SP1Jmees9EXZcx9IKhBX5v5z3Omo7S3isr/m8uWrse8yNv6HNS
	 e4N2gIu4k+ZvB3jBXebwKfp9WOXwlVs9Lts1GGZSXrvMvSNdztcO3Rp3RfO/O3H3A0
	 WHTGt74O/jSLA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/64s/radix: Fix crash with unaligned relocated kernel
Date: Tue, 10 Jan 2023 23:47:52 +1100
Message-Id: <20230110124753.1325426-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a relocatable kernel is loaded at an address that is not 2MB aligned
and told not to relocate to zero, the kernel can crash due to
mark_rodata_ro() incorrectly changing some read-write data to read-only.

Scenarios where the misalignment can occur are when the kernel is
loaded by kdump or using the RELOCATABLE_TEST config option.

Example crash with the kernel loaded at 5MB:

  Run /sbin/init as init process
  BUG: Unable to handle kernel data access on write at 0xc000000000452000
  Faulting instruction address: 0xc0000000005b6730
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
  CPU: 1 PID: 1 Comm: init Not tainted 6.2.0-rc1-00011-g349188be4841 #166
  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,git-5b4c5a hv:linux,kvm pSeries
  NIP:  c0000000005b6730 LR: c000000000ae9ab8 CTR: 0000000000000380
  REGS: c000000004503250 TRAP: 0300   Not tainted  (6.2.0-rc1-00011-g349188be4841)
  MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44288480  XER: 00000000
  CFAR: c0000000005b66ec DAR: c000000000452000 DSISR: 0a000000 IRQMASK: 0
  ...
  NIP memset+0x68/0x104
  LR  zero_user_segments.constprop.0+0xa8/0xf0
  Call Trace:
    ext4_mpage_readpages+0x7f8/0x830
    ext4_readahead+0x48/0x60
    read_pages+0xb8/0x380
    page_cache_ra_unbounded+0x19c/0x250
    filemap_fault+0x58c/0xae0
    __do_fault+0x60/0x100
    __handle_mm_fault+0x1230/0x1a40
    handle_mm_fault+0x120/0x300
    ___do_page_fault+0x20c/0xa80
    do_page_fault+0x30/0xc0
    data_access_common_virt+0x210/0x220

This happens because mark_rodata_ro() tries to change permissions on the
range _stext..__end_rodata, but _stext sits in the middle of the 2MB
page from 4MB to 6MB:

  radix-mmu: Mapped 0x0000000000000000-0x0000000000200000 with 2.00 MiB pages (exec)
  radix-mmu: Mapped 0x0000000000200000-0x0000000000400000 with 2.00 MiB pages
  radix-mmu: Mapped 0x0000000000400000-0x0000000002400000 with 2.00 MiB pages (exec)

The logic that changes the permissions assumes the linear mapping was
split correctly at boot, so it marks the entire 2MB page read-only. That
leads to the write fault above.

To fix it, the boot time mapping logic needs to consider that if the
kernel is running at a non-zero address then _stext is a boundary where
it must split the mapping.

That leads to the mapping being split correctly, allowing the rodata
permission change to take happen correctly, with no spillover:

  radix-mmu: Mapped 0x0000000000000000-0x0000000000200000 with 2.00 MiB pages (exec)
  radix-mmu: Mapped 0x0000000000200000-0x0000000000400000 with 2.00 MiB pages
  radix-mmu: Mapped 0x0000000000400000-0x0000000000500000 with 64.0 KiB pages
  radix-mmu: Mapped 0x0000000000500000-0x0000000000600000 with 64.0 KiB pages (exec)
  radix-mmu: Mapped 0x0000000000600000-0x0000000002400000 with 2.00 MiB pages (exec)

If the kernel is loaded at a 2MB aligned address, the mapping continues
to use 2MB pages as before:

  radix-mmu: Mapped 0x0000000000000000-0x0000000000200000 with 2.00 MiB pages (exec)
  radix-mmu: Mapped 0x0000000000200000-0x0000000000400000 with 2.00 MiB pages
  radix-mmu: Mapped 0x0000000000400000-0x0000000002c00000 with 2.00 MiB pages (exec)
  radix-mmu: Mapped 0x0000000002c00000-0x0000000100000000 with 2.00 MiB pages

Fixes: c55d7b5e6426 ("powerpc: Remove STRICT_KERNEL_RWX incompatibility with RELOCATABLE")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cac727b01799..5a2384ed1727 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -262,6 +262,17 @@ print_mapping(unsigned long start, unsigned long end, unsigned long size, bool e
 static unsigned long next_boundary(unsigned long addr, unsigned long end)
 {
 #ifdef CONFIG_STRICT_KERNEL_RWX
+	unsigned long stext_phys;
+
+	stext_phys = __pa_symbol(_stext);
+
+	// Relocatable kernel running at non-zero real address
+	if (stext_phys != 0) {
+		// Start of relocated kernel text is a rodata boundary
+		if (addr < stext_phys)
+			return stext_phys;
+	}
+
 	if (addr < __pa_symbol(__srwx_boundary))
 		return __pa_symbol(__srwx_boundary);
 #endif
-- 
2.39.0

