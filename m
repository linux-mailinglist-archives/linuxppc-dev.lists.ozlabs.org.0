Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81063B9BE7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 07:10:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGNSr4PLyz3bXC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 15:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGNSQ03Kfz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 15:10:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GGNSH0h1GzB8bH;
 Fri,  2 Jul 2021 07:10:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DGnOvqCmCtc; Fri,  2 Jul 2021 07:10:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GGNSG6sV6zB8bG;
 Fri,  2 Jul 2021 07:10:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E09888B998;
 Fri,  2 Jul 2021 07:10:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 87cl5JyHGmEG; Fri,  2 Jul 2021 07:10:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 554E78B96E;
 Fri,  2 Jul 2021 07:10:06 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: Fix lockup on kernel exec fault
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <024bb05105050f704743a0083fe3548702be5706.1625138205.git.christophe.leroy@csgroup.eu>
 <1625188324.lt6lsizhsx.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <86e29e20-a8bb-8309-8ee3-ef1be4a73a37@csgroup.eu>
Date: Fri, 2 Jul 2021 07:10:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625188324.lt6lsizhsx.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/07/2021 à 03:25, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of July 1, 2021 9:17 pm:
>> The powerpc kernel is not prepared to handle exec faults from kernel.
>> Especially, the function is_exec_fault() will return 'false' when an
>> exec fault is taken by kernel, because the check is based on reading
>> current->thread.regs->trap which contains the trap from user.
>>
>> For instance, when provoking a LKDTM EXEC_USERSPACE test,
>> current->thread.regs->trap is set to SYSCALL trap (0xc00), and
>> the fault taken by the kernel is not seen as an exec fault by
>> set_access_flags_filter().
>>
>> Commit d7df2443cd5f ("powerpc/mm: Fix spurrious segfaults on radix
>> with autonuma") made it clear and handled it properly. But later on
>> commit d3ca587404b3 ("powerpc/mm: Fix reporting of kernel execute
>> faults") removed that handling, introducing test based on error_code.
>> And here is the problem, because on the 603 all upper bits of SRR1
>> get cleared when the TLB instruction miss handler bails out to ISI.
> 
> So the problem is 603 doesn't see the DSISR_NOEXEC_OR_G bit?

I a way yes. But the problem is also that the kernel doesn't see it as an exec fault in 
set_access_flags_filter() as explained above. If it could see it as an exec fault, it would set 
PAGE_EXEC and it would work (or maybe not because it seems it also checks for the dirtiness of the 
page, and here the page is also flagged as dirty).

603 will see DSISR_NOEXEC_OR_G if it's an access to a page which is in a segment flagged NX.

> 
> I don't see the problem with this for 64s, I don't think anything sane
> can be done for any 0x400 interrupt in the kernel so it's probably
> good to catch all here just in case. For 64s,
> 
> Acked-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Why is 32s clearing those top bits? And it seems to be setting DSISR
> that AFAIKS it does not use. Seems like it would be good to add a
> NOEXEC_OR_G bit into SRR1.

Probably for simplicity.

When taking the Instruction TLB Miss interrupt, SRR1 contains CR0 fields in bits 0-3 and some 
dedicated info in bits 12-15. That doesn't match SRR1 bits for ISI, so before falling back to the 
ISI handler, ITLB Miss handler error patch clears upper SRR1 bits.

Maybe it could instead try to set the right bits, but it would make it more complicated because the 
error patch can be taken for the following reasons:
- No page table
- Not PAGE_PRESENT
- Not PAGE_ACCESSED
- Not PAGE_EXEC
- Below TASK_SIZE and not PAGE_USER

At the time being the verification of the flags is done with a single 'andc' operation. If we wanted 
to set the proper bits, it would mean testing the flags separately, which would impact performance 
on the no-error path.

Or maybe it would be good enough to set the PROTFAULT bit in all cases but the lack of page table. 
The 8xx sets PROTFAULT when hitting non-exec pages, so the kernel is prepared for it anyway. Not 
sure about the lack of PAGE_PRESENT thought. The 8xx sets NOHPTE bit when PAGE_PRESENT is cleared.

But is it really worth doing ?

Christophe
