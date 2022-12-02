Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E262C640371
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 10:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNnsH5zXvz3bh2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 20:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DduO9Ner;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNnrL5xdvz3bTq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 20:36:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DduO9Ner;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNnrK045yz4x2c;
	Fri,  2 Dec 2022 20:36:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669973777;
	bh=Nm1HRqZFK+owzgcR0yWNsnCBLzY5ME9lFmrn7VxV1I0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DduO9NerQke7ER7es/eZZZAx7mwSDT9dUdHskEeVwCpnzI9iqIHiNSZhUBgdGjEKi
	 bzwJnG7ArVj6xR1IUhIZylKYMgzibmJHy4D0u5/LL4xny1oZoOJP9ErTQH1U/BU0d0
	 Jh1l0gl7r2jmAl43RUSIVxcQkrWkLRSaOTCwTylv4F1AoHIFOgWdnt+MAG3ZPSBUfM
	 oiP2UfDllEKXLrA250Uaz6t8bKLIlbyT/A3zxtn6rGTFdVCuBK3dzgo8v/IKvjFk5m
	 PIg/2oFfXNO2lRnEiha/pKiWJwrySvbaqI4FoIpF45oZ9ZBB2y6/ioE2AOE+EJEUrK
	 jtCU10Z7bQwEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: boot failure after merge of the powerpc tree
In-Reply-To: <20221202143110.0f00c3e5@canb.auug.org.au>
References: <20221202143110.0f00c3e5@canb.auug.org.au>
Date: Fri, 02 Dec 2022 20:36:12 +1100
Message-ID: <87o7sm171v.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Christopher M. Riedl" <cmr@bluescreens.de>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging all the trees, today's linux-next qemu run (powerpc
> pseries_le_defconfig with kvm) crashed like this:
>
> Memory: 2029504K/2097152K available (14592K kernel code, 2944K rwdata, 18176K rodata, 5120K init, 1468K bss, 67648K reserved, 0K cma-reserved)
> SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> BUG: Kernel NULL pointer dereference on read at 0x0000001c
> Faulting instruction address: 0xc00000000047e9bc
> Oops: Kernel access of bad area, sig: 7 [#1]
> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 6.1.0-rc7 #1
> Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
> NIP:  c00000000047e9bc LR: c000000000e06718 CTR: c00000000047e970
> REGS: c000000002773770 TRAP: 0300   Not tainted  (6.1.0-rc7)
> MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 22004220  XER: 00000000
> CFAR: c000000000070508 DAR: 000000000000001c DSISR: 00080000 IRQMASK: 3 
> GPR00: c000000000e06718 c000000002773a10 c00000000116fc00 0000000000000000 
> GPR04: 0000000000002900 0000000000002800 0000000000000000 0000000000000000 
> GPR08: 000000000000000e c0000000027afc00 0000000000000000 0000000000004000 
> GPR12: c00000000047e970 c000000002950000 0000000000000000 00000000013c8ff0 
> GPR16: 000000000000000d 0000000002be00d0 0000000000000001 00000000013c8e60 
> GPR20: 00000000013c8fa8 00000000013c8d90 c0000000027b2160 0000000000000000 
> GPR24: 0000000000000005 c0000000027b3568 c000000000e06718 0000000000002900 
> GPR28: 0000000000002900 0000000007fff33f 0000000000000000 c000000002773bc8 
> NIP [c00000000047e9bc] kmem_cache_alloc+0x5c/0x610
> LR [c000000000e06718] mas_alloc_nodes+0xe8/0x350
> Call Trace:
> [c000000002773a10] [0040000000000000] 0x40000000000000 (unreliable)
> [c000000002773a70] [c000000000e06718] mas_alloc_nodes+0xe8/0x350
> [c000000002773ad0] [c000000000e0f7f4] mas_expected_entries+0x94/0x110
> [c000000002773b10] [c00000000012cc44] dup_mmap+0x194/0x730
> [c000000002773c80] [c00000000012d260] dup_mm+0x80/0x180
> [c000000002773cc0] [c00000000008e7c0] text_area_cpu_up_mm+0x20/0x1a0
> [c000000002773d20] [c00000000013367c] cpuhp_invoke_callback+0x15c/0x810
> [c000000002773db0] [c0000000001348dc] cpuhp_issue_call+0x28c/0x2a0
> [c000000002773e00] [c000000000134e44] __cpuhp_setup_state_cpuslocked+0x154/0x3e0
> [c000000002773eb0] [c000000000135180] __cpuhp_setup_state+0xb0/0x1d0
> [c000000002773f10] [c000000002016f9c] poking_init+0x40/0x9c
> [c000000002773f30] [c00000000200434c] start_kernel+0x598/0x914
> [c000000002773fe0] [c00000000000d990] start_here_common+0x1c/0x20
> Code: fb81ffe0 7c9b2378 3b293968 fbc1fff0 f8010010 7c7e1b78 fba1ffe8 fbe1fff8 91610008 f821ffa1 f8410018 83b90000 <83e3001c> 7fbd2038 7bbc0020 7f84e378 
> ---[ end trace 0000000000000000 ]---
>
> Kernel panic - not syncing: Attempted to kill the idle task!
>
> Reverting commits
>
>   55a02e6ea958 ("powerpc/code-patching: Use temporary mm for Radix MMU")

Looks like this is related to the conflict you got merging tip.

If I switch the powerpc code to use mm_alloc() then I don't see the
above crash.

I needed to rebase anyway so I've squashed that change in for Monday.

cheers
