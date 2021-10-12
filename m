Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D686742AAB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 19:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTN1j3L0Mz2yp6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 04:28:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTN196VSgz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 04:28:27 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HTN103qCjz9sSN;
 Tue, 12 Oct 2021 19:28:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLNfPwSJXZSO; Tue, 12 Oct 2021 19:28:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HTN102rz4z9sSL;
 Tue, 12 Oct 2021 19:28:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C72D8B77A;
 Tue, 12 Oct 2021 19:28:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hSLIKLkcH9IS; Tue, 12 Oct 2021 19:28:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A690A8B763;
 Tue, 12 Oct 2021 19:28:19 +0200 (CEST)
Subject: Re: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
To: Michael Ellerman <mpe@ellerman.id.au>, Liu Shixin
 <liushixin2@huawei.com>, Marco Elver <elver@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <20210924063927.1341241-1-liushixin2@huawei.com>
 <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
 <87bl3u7oay.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9c1ee778-b38b-3d41-37f3-5ea22dca063b@csgroup.eu>
Date: Tue, 12 Oct 2021 19:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87bl3u7oay.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/10/2021 à 08:24, Michael Ellerman a écrit :
> Liu Shixin <liushixin2@huawei.com> writes:
>> kindly ping.
> 
> I was under the impression you were trying to debug why it wasn't
> working with Christophe.

The investigation was a bit dormant to be honest since Liu confirmed 
that neither KFENCE not DEBUG_PAGEALLOC works.

I now looked at the effort to make it work, and it is not trivial.
At the time being, all linear space is mapped with pinned TLBs and 
everything is setup for space 0, with space 1 being used temporarily 
when doing heavy changes to space 0.

We can't use standard pages for linear space on space 0 because we need 
memory mapped at all time for exceptions (on booke exception run with 
MMU on in space 0).

In order to use standard pages, we'd need to reorganise the kernel to 
have it run mostly in space 1 (for data at least) where we would map 
almost everything with standard pages, and keep pinned TLB to map linear 
space on space 0 for TLB miss exceptions. Then we'd do more or less like 
book3s/32 and switch back into space 1 into other exceptions prolog.

That could be good to do it as we could maybe have more code in common 
with non booke 32 bits, but it is not a trivial job.

So I suggest that for now, we just make KFENCE and DEBUG_PAGEALLOC 
unselectable for booke/32 (e500 and 44x).

Christophe

> 
> cheers
> 
>> On 2021/9/24 14:39, Liu Shixin wrote:
>>> On platform PPC_FSL_BOOK3E, all lowmem is managed by tlbcam. That means
>>> we didn't really map the kfence pool with page granularity. Therefore,
>>> if KFENCE is enabled, the system will hit the following panic:
>>>
>>>      BUG: Kernel NULL pointer dereference on read at 0x00000000
>>>      Faulting instruction address: 0xc01de598
>>>      Oops: Kernel access of bad area, sig: 11 [#1]
>>>      BE PAGE_SIZE=4K SMP NR_CPUS=4 MPC8544 DS
>>>      Dumping ftrace buffer:
>>>         (ftrace buffer empty)
>>>      Modules linked in:
>>>      CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3+ #298
>>>      NIP:  c01de598 LR: c08ae9c4 CTR: 00000000
>>>      REGS: c0b4bea0 TRAP: 0300   Not tainted  (5.12.0-rc3+)
>>>      MSR:  00021000 <CE,ME>  CR: 24000228  XER: 20000000
>>>      DEAR: 00000000 ESR: 00000000
>>>      GPR00: c08ae9c4 c0b4bf60 c0ad64e0 ef720000 00021000 00000000 00000000 00000200
>>>      GPR08: c0ad5000 00000000 00000000 00000004 00000000 008fbb30 00000000 00000000
>>>      GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 00000000 00000000
>>>      GPR24: c08ca004 c08ca004 c0b6a0e0 c0b60000 c0b58f00 c0850000 c08ca000 ef720000
>>>      NIP [c01de598] kfence_protect+0x44/0x6c
>>>      LR [c08ae9c4] kfence_init+0xfc/0x2a4
>>>      Call Trace:
>>>      [c0b4bf60] [efffe160] 0xefffe160 (unreliable)
>>>      [c0b4bf70] [c08ae9c4] kfence_init+0xfc/0x2a4
>>>      [c0b4bfb0] [c0894d3c] start_kernel+0x3bc/0x574
>>>      [c0b4bff0] [c0000470] set_ivor+0x14c/0x188
>>>      Instruction dump:
>>>      7c0802a6 8109d594 546a653a 90010014 54630026 39200000 7d48502e 2c0a0000
>>>      41820010 554a0026 5469b53a 7d295214 <81490000> 38831000 554a003c 91490000
>>>      random: get_random_bytes called from print_oops_end_marker+0x40/0x78 with crng_init=0
>>>      ---[ end trace 0000000000000000 ]---
>>>
>>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>>> ---
>>>   arch/powerpc/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index d46db0bfb998..cffd57bcb5e4 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -185,7 +185,7 @@ config PPC
>>>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>>>   	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>>>   	select HAVE_ARCH_KGDB
>>> -	select HAVE_ARCH_KFENCE			if PPC32
>>> +	select HAVE_ARCH_KFENCE			if PPC32 && !PPC_FSL_BOOK3E
>>>   	select HAVE_ARCH_MMAP_RND_BITS
>>>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>>>   	select HAVE_ARCH_NVRAM_OPS
