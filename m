Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521D25C10E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 14:33:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj0bT4B7gzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 22:33:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj0RB04DrzDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 22:26:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Bj0R95l96z9sTd; Thu,  3 Sep 2020 22:26:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20200902040122.136414-1-aneesh.kumar@linux.ibm.com>
References: <20200902040122.136414-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc
Message-Id: <159913592797.5893.5829441560236719450.b4-ty@ellerman.id.au>
Date: Thu,  3 Sep 2020 22:26:29 +1000 (AEST)
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Sep 2020 09:31:22 +0530, Aneesh Kumar K.V wrote:
> The test is broken w.r.t page table update rules and results in kernel
> crash as below. Disable the support until we get the tests updated.
> 
> [   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
> cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
>     pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
>     lr: c0000000005eeeec: pte_update+0x11c/0x190
>     sp: c000000c6d1e7950
>    msr: 8000000002029033
>   current = 0xc000000c6d172c80
>   paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 1, comm = swapper/0
> kernel BUG at arch/powerpc/mm/pgtable.c:304!
> [link register   ] c0000000005eeeec pte_update+0x11c/0x190
> [c000000c6d1e7950] 0000000000000001 (unreliable)
> [c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
> [c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
> [c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
> [c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> [c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
> [c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
> [c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc
      https://git.kernel.org/powerpc/c/675bceb097e6fb9769309093ec6f3d33a2fed9cc

cheers
