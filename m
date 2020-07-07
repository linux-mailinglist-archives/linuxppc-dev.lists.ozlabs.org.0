Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A76216C7A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 14:05:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1LjY1mh3zDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 22:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Lgw05tZzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 22:03:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B1Lgl5LJGz9v079;
 Tue,  7 Jul 2020 14:03:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rZngbyxiudWO; Tue,  7 Jul 2020 14:03:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B1Lgl4Wsfz9v06x;
 Tue,  7 Jul 2020 14:03:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A44B8B7DB;
 Tue,  7 Jul 2020 14:03:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I4P7InHUSaYZ; Tue,  7 Jul 2020 14:03:49 +0200 (CEST)
Received: from [10.25.210.22] (po15451.idsi0.si.c-s.fr [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A6668B7D7;
 Tue,  7 Jul 2020 14:03:49 +0200 (CEST)
Subject: Re: [PATCH] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20200706021822.1515189-1-npiggin@gmail.com>
 <cf10b0bc-de79-1b2b-8355-fc7bbeec47c3@csgroup.eu>
 <1594098302.nadnq2txti.astroid@bobo.none>
 <638683144.970.1594121101349.JavaMail.zimbra@efficios.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <23cf2781-104c-24ec-a53d-59e2a24d95c1@csgroup.eu>
Date: Tue, 7 Jul 2020 14:03:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <638683144.970.1594121101349.JavaMail.zimbra@efficios.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/07/2020 à 13:25, Mathieu Desnoyers a écrit :
> ----- On Jul 7, 2020, at 1:50 AM, Nicholas Piggin npiggin@gmail.com wrote:
> 
>> Excerpts from Christophe Leroy's message of July 6, 2020 7:53 pm:
>>>
>>>
>>> Le 06/07/2020 à 04:18, Nicholas Piggin a écrit :
>>>> diff --git a/arch/powerpc/include/asm/exception-64s.h
>>>> b/arch/powerpc/include/asm/exception-64s.h
>>>> index 47bd4ea0837d..b88cb3a989b6 100644
>>>> --- a/arch/powerpc/include/asm/exception-64s.h
>>>> +++ b/arch/powerpc/include/asm/exception-64s.h
>>>> @@ -68,6 +68,10 @@
>>>>     *
>>>>     * The nop instructions allow us to insert one or more instructions to flush the
>>>>     * L1-D cache when returning to userspace or a guest.
>>>> + *
>>>> + * powerpc relies on return from interrupt/syscall being context synchronising
>>>> + * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_SYNC_CORE
>>>> + * without additional additional synchronisation instructions.
>>>
>>> This file is dedicated to BOOK3S/64. What about other ones ?
>>>
>>> On 32 bits, this is also valid as 'rfi' is also context synchronising,
>>> but then why just add some comment in exception-64s.h and only there ?
>>
>> Yeah you're right, I basically wanted to keep a note there just in case,
>> because it's possible we would get a less synchronising return (maybe
>> unlikely with meltdown) or even return from a kernel interrupt using a
>> something faster (e.g., bctar if we don't use tar register in the kernel
>> anywhere).
>>
>> So I wonder where to add the note, entry_32.S and 64e.h as well?
>>
> 
> For 64-bit powerpc, I would be tempted to either place the comment in the header
> implementing the RFI_TO_USER and RFI_TO_USER_OR_KERNEL macros or the .S files
> using them, e.g. either:
> 
> arch/powerpc/include/asm/exception-64e.h
> arch/powerpc/include/asm/exception-64s.h
> 
> or
> 
> arch/powerpc/kernel/exceptions-64s.S
> arch/powerpc/kernel/entry_64.S
> 
> And for 32-bit powerpc, AFAIU
> 
> arch/powerpc/kernel/entry_32.S
> 
> uses SYNC + RFI to return to user-space. RFI is defined in
> 
> arch/powerpc/include/asm/ppc_asm.h
> 
> So a comment either near the RFI define and its uses should work.
> 


For 32-bit, RFI is likely to go away the day 40x goes away, so I 
wouldn't put it there.
Places like head_8xx.S use rfi not RFI.

And the SYNC is about to go when we decide to retire 601 SYNC FIX.

So it would be probably better to put it somewhere in entry_32.S

Christophe
