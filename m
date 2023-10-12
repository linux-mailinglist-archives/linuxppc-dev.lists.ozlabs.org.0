Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4947C6C97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 13:42:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R0GTo2eX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5nnK0sxhz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 22:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R0GTo2eX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5nmR3LhPz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 22:41:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697110919;
	bh=iOsESke18g3RuubwM1/KV7QnX9w2UOpEn1GqnmACR+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R0GTo2eXFKMpSDkDNDOZZwVJfhQ3rdgn+OPXCnjqzgkAdRIJNPy7kZcopm/HhcHlA
	 J1rQhvGzxSBtvMgV7njyj8LOT3UMPrtAgaFSiK2kARRmjZBv8jd98vDBzli3gCCFtA
	 SXzJQhU261DwMPOAJzRWLJrobpQbsLw+qlz06NBmlOP09OLtEPlmqXAz2LtDVE9FWu
	 g6dhp7t50pwVACbNMQ50TfNTPqlmUu3ZfshFLhgCu9iySErio/M8WZN6O+awWozh/T
	 kIWjfYtiEZ2rP8Bm6JVC7i+vyXeORkfrxKnXL4CTf1irZwKSpH4Z0FQrRyIP4Xa0t7
	 ljLQm8TjR7+2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S5nmR1trdz4x5G;
	Thu, 12 Oct 2023 22:41:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
In-Reply-To: <20230929132750.3cd98452@yea>
References: <20230929132750.3cd98452@yea>
Date: Thu, 12 Oct 2023 22:41:56 +1100
Message-ID: <87lec8qd8b.fsf@mail.lhotse>
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
Cc: willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> Greetings!
>
> Kernel 6.5.5 boots fine on my PowerMac G5 11,2 but kernel 6.6-rc3 fails to boot with following dmesg shown on the OpenFirmware console (transcribed screenshot):
>
> [...]
> SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> rcu: Hierarchical RCU implementation.
>  Tracing variant of Tasks RCU enabled.
> rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
> NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> mpic: Setting up MPIC " MPIC 1   " version 1.2 at f8040000, max 2 CPUs
> mpic: ISU size: 124, shift: 7, mask: 7f
> mpic: Initializing for 124 sources
> mpic: Setting up HT PICs workarounds for U3/U4
> BUG: Unable to handle kernel data access at 0xfeffbb62ffec65fe
> Faulting instruction address: 0xc00000000005dc40
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T  6.6.0-rc3-PMacGS #1
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c00000000005dc40 LR: c000000000066660 CTR: c000000000007730
> REGS: c0000000022bf510 TRAP: 0380   Tainted: G                T (6.6.0-rc3-PMacGS)
> MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 44004242  XER: 00000000
> IRQMASK: 3
> GPR00: 0000000000000000 c0000000022bf7b0 c0000000010c0b00 00000000000001ac
> GPR04: 0000000003c80000 0000000000000300 c0000000f20001ae 0000000000000300
> GPR08: 0000000000000006 feffbb62ffec65ff 0000000000000001 0000000000000000
> GPR12: 9000000000001032 c000000002362000 c000000000f76b80 000000000349ecd8
> GPR16: 0000000002367ba8 0000000002367f08 0000000000000006 0000000000000000
> GPR20: 00000000000001ac c000000000f6f920 c0000000022cd985 000000000000000c
> GPR24: 0000000000000300 00000003b0a3691d c0003e008030000e 0000000000000000
> GPR28: c00000000000000c c0000000f20001ee feffbb62ffec65fe 00000000000001ac
> NIP [c00000000005dc40] hash_page_do_lazy_icache+0x50/0x100
> LR [c000000000066660] __hash_page_4K+0x420/0x590
> Call Trace:
> [c0000000022bf7e0] [ffffffffffffffff] 0xffffffffffffffff
> [c0000000022bf8c0] [c00000000005e164] hash_page_mm+0x364/0x6f0
> [c0000000022bf990] [c00000000005e684] do_hash_fault+0x114/0x2b0
> [c0000000022bf9c0] [c0000000000078e8] data_access_common_virt+0x198/0x1f0
> --- interrupt: 300 at mpic_init+0x4bc/0x10c4
> NIP:  c000000002020a5c LR: c000000002020a04 CTR: 0000000000000000
> REGS: c0000000022bf9f0 TRAP: 0300   Tainted: G                T (6.6.0-rc3-PMacGS)
> MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 24004248  XER: 00000000
> DAR: c0003e008030000e DSISR: 40000000 IRQMASK: 1
> GPR00: 0000000000000000 c0000000022bfc90 c0000000010c0b00 c0003e0080300000
> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR08: 0000000000000000 221b80894c06df2f 0000000000000000 0000000000000000
> GPR12: 0000000000000000 c000000002362000 c000000000f76b80 000000000349ecd8
> GPR16: 0000000002367ba8 0000000002367f08 0000000002367c70 0000000000000000
> GPR20: 567ce25e8c9202b7 c000000000f6f920 0000000000000001 c0003e0080300000
> GPR24: c00000000226f348 0000000000000004 c00000000404c640 0000000000000000
> GPR28: c0003e0080300000 c00000000404c000 45886d8559cb69b4 c0000000022bfc90
> NIP [c00000000005dc40] mpic_init+0x4bc/0x10c4
> LR [c000000000066660] mpic_init+0x464/0x10c4
> ~~~ interrupt: 300
> [c0000000022bfd90] [c000000002022ae4] pmac_setup_one_mpic+0x258/0x2dc
> [c0000000022bf2e0] [c000000002022df4] pmac_pic_init+0x28c/0x3d8
> [c0000000022bfef0] [c00000000200b750] init_IRQ+0x90/0x140
> [c0000000022bff30] [c0000000020053c0] start_kernel+0x57c/0x78c
> [c0000000022bffe0] [c00000000000cb48] start_here_common+0x1c/0x20
> Code: 09290000 7c292040 4081007c fbc10020 3d220127 78843664 3929d700 ebc90000 7fde2214 e93e0000 712a0001 40820064 <e93e0000> 71232000 40820048 e93e0000
> ---[ end trace 0000000000000000 ]---

Can you checkout the exact commit that crash is from and do:

 $ make arch/powerpc/mm/book3s64/hash_utils.lst

And paste/attach the content of that file.

cheers
