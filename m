Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC717119A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:42:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sl4r5kdfzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:42:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=iP7IXZW4; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SkSZ1PNzzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 18:14:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SkSR0Q7qz9tyWC;
 Thu, 27 Feb 2020 08:14:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iP7IXZW4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JvTXY4MVbvMu; Thu, 27 Feb 2020 08:14:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SkSQ6SsLz9tyW9;
 Thu, 27 Feb 2020 08:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582787670; bh=WlxhJHwTIzj3rKL/n10fLkgc0wnDb/Ejybep7f/bhos=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iP7IXZW4Ilt01IDVXqHqwzG+QQpY16ICegGpPQn+EbDXcqTwP7b7PPyAEAe5QvFPo
 XTmX+f42J4rU4CfOtRivSbGL7/BbhmK8pzny+b3/1qnE1Zcw401h8rjJI5FJ6nXy0T
 kStgPJoa7QkbdEKf6+Nps6Cddsjozi5fnf4T/9QM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFC2D8B79A;
 Thu, 27 Feb 2020 08:14:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yRZA6ejfEZ10; Thu, 27 Feb 2020 08:14:31 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 069E48B799;
 Thu, 27 Feb 2020 08:14:30 +0100 (CET)
Subject: Re: [PATCH v3 09/14] powerpc/xmon: Add initial support for prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-10-jniethe5@gmail.com>
 <1582700457.bqyiezlzr9.astroid@bobo.none>
 <CACzsE9p4siTRgCnC6GPSn+89SnPr5CTTBk5+LOfS8BX+1OmMZg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f6db0844-bcd0-50af-5699-a89f10538ed0@c-s.fr>
Date: Thu, 27 Feb 2020 08:14:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9p4siTRgCnC6GPSn+89SnPr5CTTBk5+LOfS8BX+1OmMZg@mail.gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/02/2020 à 01:11, Jordan Niethe a écrit :
> On Wed, Feb 26, 2020 at 6:10 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> Jordan Niethe's on February 26, 2020 2:07 pm:
>>> A prefixed instruction is composed of a word prefix and a word suffix.
>>> It does not make sense to be able to have a breakpoint on the suffix of
>>> a prefixed instruction, so make this impossible.
>>>
>>> When leaving xmon_core() we check to see if we are currently at a
>>> breakpoint. If this is the case, the breakpoint needs to be proceeded
>>> from. Initially emulate_step() is tried, but if this fails then we need
>>> to execute the saved instruction out of line. The NIP is set to the
>>> address of bpt::instr[] for the current breakpoint.  bpt::instr[]
>>> contains the instruction replaced by the breakpoint, followed by a trap
>>> instruction.  After bpt::instr[0] is executed and we hit the trap we
>>> enter back into xmon_bpt(). We know that if we got here and the offset
>>> indicates we are at bpt::instr[1] then we have just executed out of line
>>> so we can put the NIP back to the instruction after the breakpoint
>>> location and continue on.
>>>
>>> Adding prefixed instructions complicates this as the bpt::instr[1] needs
>>> to be used to hold the suffix. To deal with this make bpt::instr[] big
>>> enough for three word instructions.  bpt::instr[2] contains the trap,
>>> and in the case of word instructions pad bpt::instr[1] with a noop.
>>>
>>> No support for disassembling prefixed instructions.
>>>
>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>> ---
>>> v2: Rename sufx to suffix
>>> v3: - Just directly use PPC_INST_NOP
>>>      - Typo: plac -> place
>>>      - Rename read_inst() to mread_inst(). Do not have it call mread().
>>> ---
>>>   arch/powerpc/xmon/xmon.c | 90 ++++++++++++++++++++++++++++++++++------
>>>   1 file changed, 78 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>>> index a673cf55641c..a73a35aa4a75 100644
>>> --- a/arch/powerpc/xmon/xmon.c
>>> +++ b/arch/powerpc/xmon/xmon.c
>>> @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
>>>   /* Breakpoint stuff */
>>>   struct bpt {
>>>        unsigned long   address;
>>> -     unsigned int    instr[2];
>>> +     /* Prefixed instructions can not cross 64-byte boundaries */
>>> +     unsigned int    instr[3] __aligned(64);
>>
>> This is pretty wild, I didn't realize xmon executes breakpoints out
>> of line like this.

Neither did I. That's problematic. Kernel data is mapped NX on some 
platforms.

>>
>> IMO the break point entries here should correspond with a range of
>> reserved bytes in .text so we patch instructions into normal executable
>> pages rather than .data.
> Would it make sense to use vmalloc_exec() and use that like we are
> going to do in kprobes()?

As we are (already) doing in kprobes() you mean ?

In fact kprobes uses module_alloc(), and it works because kprobe depends 
on module. On some platforms (i.e. book3s/32) vmalloc space is marked NX 
in segment registers when CONFIG_MODULES is not set, see 
mmu_mark_initmem_nx().  On other ones the Instruction TLB miss exception 
does not manage misses at kernel addresses when CONFIG_MODULES is not 
selected.

So if we want XMON to work at all time, we need to use some (linear) 
text address and use patch_instruction() to change it.

Christophe

>>
>> Anyway that's for patch.
>>
>> Thanks,
>> Nick
