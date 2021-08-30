Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F803FB6CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 15:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyrSL4G6Nz2yQ3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 23:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyrRs3lGwz2xYR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 23:16:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GyrRk0Shhz9sTS;
 Mon, 30 Aug 2021 15:16:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMCmx73LbZIa; Mon, 30 Aug 2021 15:16:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GyrRj6Vm0z9sTQ;
 Mon, 30 Aug 2021 15:16:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B864E8B798;
 Mon, 30 Aug 2021 15:16:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I8dfxxDy3IZ2; Mon, 30 Aug 2021 15:16:01 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7175C8B794;
 Mon, 30 Aug 2021 15:16:01 +0200 (CEST)
Subject: Re: [PATCH v4 4/4] powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>
References: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
 <03166d569526be70214fe9370a7bad219d2f41c8.1625762907.git.christophe.leroy@csgroup.eu>
 <YSvYFTSwP5EkXQZ0@Ryzen-9-3900X.localdomain>
 <5c479866-f31a-3579-9d71-357c85b777d0@csgroup.eu>
 <87tuj7e5e5.fsf@mpe.ellerman.id.au>
 <2bd9fa19-07b0-c187-c7dd-c6d544e34739@csgroup.eu>
 <87r1ebdu4t.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <55783e78-3159-9ab2-7955-fb5aa8aa0ddd@csgroup.eu>
Date: Mon, 30 Aug 2021 15:16:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87r1ebdu4t.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2021 à 13:55, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 30/08/2021 à 09:52, Michael Ellerman a écrit :
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> Le 29/08/2021 à 20:55, Nathan Chancellor a écrit :
>>>>> On Thu, Jul 08, 2021 at 04:49:43PM +0000, Christophe Leroy wrote:
>>>>>> This patch converts powerpc to the generic PTDUMP implementation.
>>>>>>
>>>>>
>>>>> This patch as commit e084728393a5 ("powerpc/ptdump: Convert powerpc to
>>>>> GENERIC_PTDUMP") in powerpc/next causes a panic with Fedora's ppc64le
>>>>> config [1] when booting up in QEMU with [2]:
>>>>>
>>>>> [    1.621864] BUG: Unable to handle kernel data access on read at 0xc0eeff7f00000000
>>>>> [    1.623058] Faulting instruction address: 0xc00000000045e5fc
>>>>> [    1.623832] Oops: Kernel access of bad area, sig: 11 [#1]
>>>>> [    1.624318] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>>>>> [    1.625015] Modules linked in:
>>>>> [    1.625463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc7-next-20210827 #16
>>>>> [    1.626237] NIP:  c00000000045e5fc LR: c00000000045e580 CTR: c000000000518220
>>>>> [    1.626839] REGS: c00000000752b820 TRAP: 0380   Not tainted  (5.14.0-rc7-next-20210827)
>>>>> [    1.627528] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84002482  XER: 20000000
>>>>> [    1.628449] CFAR: c000000000518300 IRQMASK: 0
>>>>> [    1.628449] GPR00: c00000000045e580 c00000000752bac0 c0000000028a9300 0000000000000000
>>>>> [    1.628449] GPR04: c200800000000000 ffffffffffffffff 000000000000000a 0000000000000001
>>>>> [    1.628449] GPR08: c0eeff7f00000000 0000000000000012 0000000000000000 0000000000000000
>>>>> [    1.628449] GPR12: 0000000000000000 c000000002b20000 fffffffffffffffe c000000002971a70
>>>>> [    1.628449] GPR16: c000000002960040 c0000000011a8f98 c00000000752bbf0 ffffffffffffffff
>>>>> [    1.628449] GPR20: c2008fffffffffff c0eeff7f00000000 c000000002971a68 c00a0003ff000000
>>>>> [    1.628449] GPR24: c000000002971a78 0000000000000002 0000000000000001 c0000000011a8f98
>>>>> [    1.628449] GPR28: c0000000011a8f98 c0000000028daef8 c200800000000000 c200900000000000
>>>>> [    1.634090] NIP [c00000000045e5fc] __walk_page_range+0x2bc/0xce0
>>>>> [    1.635117] LR [c00000000045e580] __walk_page_range+0x240/0xce0
>>>>> [    1.635755] Call Trace:
>>>>> [    1.636018] [c00000000752bac0] [c00000000045e580] __walk_page_range+0x240/0xce0 (unreliable)
>>>>> [    1.636811] [c00000000752bbd0] [c00000000045f234] walk_page_range_novma+0x74/0xb0
>>>>> [    1.637459] [c00000000752bc20] [c000000000518448] ptdump_walk_pgd+0x98/0x170
>>>>> [    1.638138] [c00000000752bc70] [c0000000000aa988] ptdump_check_wx+0x88/0xd0
>>>>> [    1.638738] [c00000000752bd50] [c00000000008d6d8] mark_rodata_ro+0x48/0x80
>>>>> [    1.639299] [c00000000752bdb0] [c000000000012a34] kernel_init+0x74/0x1a0
>>>>> [    1.639842] [c00000000752be10] [c00000000000cfd4] ret_from_kernel_thread+0x5c/0x64
>>>>> [    1.640597] Instruction dump:
>>>>> [    1.641021] 38e7ffff 39490010 7ce707b4 7fca5436 79081564 7d4a3838 7908f082 794a1f24
>>>>> [    1.641740] 78a8f00e 30e6ffff 7ea85214 7ce73110 <7d48502a> 78f90fa4 2c2a0000 39290010
>>>>> [    1.642771] ---[ end trace 6cf72b085097ad52 ]---
>>>>> [    1.643220]
>>>>> [    2.644228] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>>>> [    2.645523] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>>>>
>>>>> This is not compiler specific, I can reproduce it with GCC 11.2.0 and
>>>>> binutils 2.37. If there is any additional information I can provide,
>>>>> please let me know.
>>>>
>>>> Can you provide a dissassembly of __walk_page_range() ? Or provide your vmlinux binary.
>>>
>>> It seems to be walking of the end of the pgd.
>>>
>>> [    3.373800] walk_p4d_range: addr c00fff0000000000 end c00fff8000000000
>>> [    3.373852] walk_p4d_range: addr c00fff8000000000 end c010000000000000	<- end of pgd at PAGE_OFFSET + 4PB
>>> [    3.373905] walk_p4d_range: addr c010000000000000 end c010008000000000
>>
>> Yes, I want it to walk from TASK_SIZE_MAX up to 0xffffffffffffffff :)
> 
> But the page table doesn't span that far? 0_o
> 
>> static struct ptdump_range ptdump_range[] __ro_after_init = {
>> 	{TASK_SIZE_MAX, ~0UL},
>> 	{0, 0}
>> };
>>
>> Ok, well, ppc32 go up to 0xffffffff
>>
>> What's the top address to be used for ppc64 ?
> 
> It's different for (hash | radix) x page size.
> 
> The below works, and matches what we used to do.
> 
> Possibly we can come up with something cleaner, not sure.
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 2d80d775d15e..3d3778a74969 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -359,6 +359,8 @@ static int __init ptdump_init(void)
>   		ptdump_range[0].start = KERN_VIRT_START;
>   	else
>   		ptdump_range[0].start = PAGE_OFFSET;
> +
> +	ptdump_range[0].end = ptdump_range[0].start + (PGDIR_SIZE * PTRS_PER_PGD);

Hum ...

It was:

	for (i = pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr += PGDIR_SIZE) {

And there is

#define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))


Do we have the following ?

	pgd_index(KERN_VIRT_START) == 0


Shouldn't it be something like

	ptdump_range[0].end = PAGE_OFFSET + (PGDIR_SIZE * PTRS_PER_PGD);


Christophe
