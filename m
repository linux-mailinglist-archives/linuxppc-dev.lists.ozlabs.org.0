Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C052B5F5FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjdL46bC6z3cBV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 15:11:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pq8BZY87;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjdK70k5nz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 15:10:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pq8BZY87;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjdK66b6Sz4x1V;
	Thu,  6 Oct 2022 15:10:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665029451;
	bh=/zMv/f2W+qErMbx6Su+IgQfoerTx2hHlYs5thQEFakw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=pq8BZY87EmE5K/PsYe2GRAQaJm6grfZIqvnnn6gdeWIJuajbwgjn/RtJLMFxT1wwq
	 vs/iMDzGaMVaRALB3ClXYzkjyXIXIBZZTVMOSIf6uS+FbkT/spczlNmFMvDr18TlC+
	 yNt7U9N6R5DF3XRgPkGHfXpIDYkkWwJGVs0Gg8I+qP/7W8pheK03LlAPjvKHZXPBl4
	 yHrz1pF4DJVknz17C8LHl2p1kImLvBHwWoGRTdfnmwCRedIa6xnVpl6aqRHclybpW3
	 AAO5hWlyig3LWtI4qc2+CWF68V+Fk4UXqjXx8NvrOKufUmFXxUkvZO16nh8K9qESfu
	 GL8GehG+PVKbw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
In-Reply-To: <20221004223724.38707-1-nathanl@linux.ibm.com>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
Date: Thu, 06 Oct 2022 15:10:47 +1100
Message-ID: <874jwhpp6g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Nathan Lynch <nathanl@linux.ibm.com> writes:
> kasan is known to crash at boot on book3s_64 with non-radix MMU. As
> noted in commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only
> KASAN support"):
>
>   A kernel with CONFIG_KASAN=y will crash during boot on a machine
>   using HPT translation because not all the entry points to the
>   generic KASAN code are protected with a call to kasan_arch_is_ready().

I guess I thought there was some plan to fix that.

But maybe I'm misremembering. Looking now it's not entirely straight
forward with the way the headers are structured. So I guess I'm wrong
about that.

> Such crashes look like this:
>
>   BUG: Unable to handle kernel data access at 0xc00e00000308b100
>   Faulting instruction address: 0xc0000000006d0fcc
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc5-02183-g3ab165dea2a2 #13
>   [...regs...]
>   NIP [c0000000006d0fcc] kasan_byte_accessible+0xc/0x20
>   LR [c0000000006cd9cc] __kasan_check_byte+0x2c/0xa0
>   Call Trace:
>   [c00000001688f930] [c00000001688f970] 0xc00000001688f970 (unreliable)
>   [c00000001688f970] [c0000000005f6a74] ksize+0x34/0xa0
>   [c00000001688f9a0] [c0000000024c03a8] __alloc_skb+0xd8/0x2d0
>   [c00000001688fa00] [c0000000003c48c0] audit_log_start+0x260/0x660
>   [c00000001688fb30] [c0000000003c50ec] audit_log+0x3c/0x70
>   [c00000001688fb60] [c00000000404590c] audit_init+0x188/0x1ac
>   [c00000001688fbe0] [c0000000000127e0] do_one_initcall+0xe0/0x610
>   [c00000001688fcd0] [c00000000400a1f0] kernel_init_freeable+0x4c0/0x574
>   [c00000001688fda0] [c000000000013450] kernel_init+0x30/0x1d0
>   [c00000001688fe10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64
>
> If you look carefully enough at the full kernel output, you might
> notice this message, much earlier:
>
>   KASAN not enabled as it requires radix!
>
> But the eventual oops does not carry any indication that the real
> problem was detected early on and is a known limitation.
>
> Change init_book3s_64.c::kasan_init() to emit a warning backtrace and
> taint the kernel when not running on radix. When the kernel likely
> oopses later, the 'W' taint flag in the report should help minimize
> developer time spent trying to understand what's gone wrong.

Should we just panic() directly?

It's too earily in kasan_init(), nothing gets to the console.

But we have kasan_late_init() already, the patch below seems to work and
gives us:

  Booting Linux via __start() @ 0x0000000000400000 ...
  [    0.000000][    T0] hash-mmu: Page sizes from device-tree:
  [    0.000000][    T0] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
  [    0.000000][    T0] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
  [    0.000000][    T0] Using 1TB segments
  [    0.000000][    T0] hash-mmu: Initializing hash mmu with SLB
  [    0.000000][    T0] Linux version 6.0.0-rc2-00225-g8b68240ff7d7-dirty (michael@alpine1-p1) (gcc (Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #403 SMP Thu Oct 6 14:53:58 AEDT 2022
  [    0.000000][    T0] KASAN not enabled as it requires radix!
  ...
  [    0.000000][    T0] mem auto-init: stack:off, heap alloc:off, heap free:off
  [    0.000000][    T0] stackdepot hash table entries: 1048576 (order: 7, 8388608 bytes, linear)
  [    0.000000][    T0] Kernel panic - not syncing: KASAN enabled kernel can't boot with Hash MMU!
  [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc2-00225-g8b68240ff7d7-dirty #403
  [    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER8 (raw) 0x4d0200 0xf000004 of:SLOF,HEAD pSeries
  [    0.000000][    T0] Call Trace:
  [    0.000000][    T0] [c0000000031efd20] [c000000000bf5450] dump_stack_lvl+0x74/0xa8 (unreliable)
  [    0.000000][    T0] [c0000000031efd60] [c00000000017d160] panic+0x1b0/0x480
  [    0.000000][    T0] [c0000000031efe00] [c00000000201e028] kasan_late_init+0x30/0x34
  [    0.000000][    T0] [c0000000031efe60] [c000000002018c4c] mem_init+0xc8/0xec
  [    0.000000][    T0] [c0000000031efe90] [c000000002004538] mm_init+0x84/0xbc
  [    0.000000][    T0] [c0000000031eff00] [c0000000020047a0] start_kernel+0x1cc/0x4bc
  [    0.000000][    T0] [c0000000031eff90] [c00000000000d998] start_here_common+0x1c/0x84

cheers


diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 9300d641cf9a..cc1b4ee8be53 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -101,4 +101,8 @@ void __init kasan_init(void)
 
 void __init kasan_early_init(void) { }
 
-void __init kasan_late_init(void) { }
+void __init kasan_late_init(void)
+{
+	if (!radix_enabled())
+		panic("KASAN enabled kernel can't boot with Hash MMU!");
+}

