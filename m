Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F446640DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 13:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrrGS4ZP1z3ch7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 23:48:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=goPppi8K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrrFY28Ytz3f9x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 23:48:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=goPppi8K;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NrrFX2kQvz4wgv;
	Tue, 10 Jan 2023 23:48:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673354880;
	bh=DZIr54sk8vMPKU0NEm0kQvoaqrMfDhxKc2Zt/F9Jgq0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=goPppi8KaX+PKGXA1bWiKr2SGRVcTaae3C2bzgReRcQZocLCuCk9EOOO6byR4AOKT
	 saCwgnv8b4l2FhML2ps1xnWT1hv4SNPf//sxoZe1S1EkJbyCLj7iQ0V+8JC9n4UbhR
	 Csg4S9kArhu7DYfAg2+yfSyz9+/NGbOTzNZHcHIzjpGD68LuJVynu+C0NduC3jjwBe
	 wRU+WlBzoYd+Hrec/oGl90ttCm6DaNCHO2grKwqGkkhPS/GYMOw53jPbqLakpilfVf
	 9LkAMnoGmhIYHgEv074Ge9IVjlySwIr/66oBRRYFFSkE25d7ZwlqdVzlZ47WYgGEMv
	 lNRiBoJAdmkxw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/64s/radix: Fix RWX mapping with relocated kernel
Date: Tue, 10 Jan 2023 23:47:53 +1100
Message-Id: <20230110124753.1325426-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110124753.1325426-1-mpe@ellerman.id.au>
References: <20230110124753.1325426-1-mpe@ellerman.id.au>
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

If a relocatable kernel is loaded at a non-zero address and told not to
relocate to zero (kdump or RELOCATABLE_TEST), the mapping of the
interrupt code at zero is left with RWX permissions.

That is a security weakness, and leads to a warning at boot if
CONFIG_DEBUG_WX is enabled:

  powerpc/mm: Found insecure W+X mapping at address 00000000056435bc/0xc000000000000000
  WARNING: CPU: 1 PID: 1 at arch/powerpc/mm/ptdump/ptdump.c:193 note_page+0x484/0x4c0
  CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc1-00001-g8ae8e98aea82-dirty #175
  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,git-dd0dca hv:linux,kvm pSeries
  NIP:  c0000000004a1c34 LR: c0000000004a1c30 CTR: 0000000000000000
  REGS: c000000003503770 TRAP: 0700   Not tainted  (6.2.0-rc1-00001-g8ae8e98aea82-dirty)
  MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24000220  XER: 00000000
  CFAR: c000000000545a58 IRQMASK: 0
  ...
  NIP note_page+0x484/0x4c0
  LR  note_page+0x480/0x4c0
  Call Trace:
    note_page+0x480/0x4c0 (unreliable)
    ptdump_pmd_entry+0xc8/0x100
    walk_pgd_range+0x618/0xab0
    walk_page_range_novma+0x74/0xc0
    ptdump_walk_pgd+0x98/0x170
    ptdump_check_wx+0x94/0x100
    mark_rodata_ro+0x30/0x70
    kernel_init+0x78/0x1a0
    ret_from_kernel_thread+0x5c/0x64

The fix has two parts. Firstly the pages from zero up to the end of
interrupts need to be marked read-only, so that they are left with R-X
permissions. Secondly the mapping logic needs to be taught to ensure
there is a page boundary at the end of the interrupt region, so that the
permission change only applies to the interrupt text, and not the region
following it.

Fixes: c55d7b5e6426 ("powerpc: Remove STRICT_KERNEL_RWX incompatibility with RELOCATABLE")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 5a2384ed1727..26245aaf12b8 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -234,6 +234,14 @@ void radix__mark_rodata_ro(void)
 	end = (unsigned long)__end_rodata;
 
 	radix__change_memory_range(start, end, _PAGE_WRITE);
+
+	for (start = PAGE_OFFSET; start < (unsigned long)_stext; start += PAGE_SIZE) {
+		end = start + PAGE_SIZE;
+		if (overlaps_interrupt_vector_text(start, end))
+			radix__change_memory_range(start, end, _PAGE_WRITE);
+		else
+			break;
+	}
 }
 
 void radix__mark_initmem_nx(void)
@@ -268,6 +276,11 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
 
 	// Relocatable kernel running at non-zero real address
 	if (stext_phys != 0) {
+		// The end of interrupts code at zero is a rodata boundary
+		unsigned long end_intr = __pa_symbol(__end_interrupts) - stext_phys;
+		if (addr < end_intr)
+			return end_intr;
+
 		// Start of relocated kernel text is a rodata boundary
 		if (addr < stext_phys)
 			return stext_phys;
-- 
2.39.0

