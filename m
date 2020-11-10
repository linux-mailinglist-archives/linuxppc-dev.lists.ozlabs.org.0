Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9C2AD55A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 12:35:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVm5D2klyzDqJR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 22:35:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVm0n1YLlzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 22:31:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CVm0V5TNPz9tyfr;
 Tue, 10 Nov 2020 12:31:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GLDHci3zbK_f; Tue, 10 Nov 2020 12:31:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CVm0V4YXHz9tyfl;
 Tue, 10 Nov 2020 12:31:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E91A18B7F0;
 Tue, 10 Nov 2020 12:31:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ywS02Q8deDx4; Tue, 10 Nov 2020 12:31:39 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 731F18B764;
 Tue, 10 Nov 2020 12:31:39 +0100 (CET)
Subject: Re: [RFC PATCH 0/9] powerpc/64s: fast interrupt exit
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201106155929.2246055-1-npiggin@gmail.com>
 <fdde16b8-2bb4-f6a2-3c29-61d0169453cf@csgroup.eu>
 <1604997971.w6spl33ij0.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8217782e-1668-7af0-be59-4027eb46b49f@csgroup.eu>
Date: Tue, 10 Nov 2020 12:31:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1604997971.w6spl33ij0.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/11/2020 à 09:49, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of November 7, 2020 8:35 pm:
>>
>>
>> Le 06/11/2020 à 16:59, Nicholas Piggin a écrit :
>>> This series attempts to improve the speed of interrupts and system calls
>>> in two major ways.
>>>
>>> Firstly, the SRR/HSRR registers do not need to be reloaded if they were
>>> not used or clobbered fur the duration of the interrupt.
>>>
>>> Secondly, an alternate return location facility is added for soft-masked
>>> asynchronous interrupts and then that's used to set everything up for
>>> return without having to disable MSR RI or EE.
>>>
>>> After this series, the entire system call / interrupt handler fast path
>>> executes no mtsprs and one mtmsrd to enable interrupts initially, and
>>> the system call vectored path doesn't even need to do that.
>>
>> Interesting series.
>>
>> Unfortunately, can't be done on PPC32 (at least on non bookE), because it would mean mapping kernel
>> at 0 instead of 0xC0000000. Not sure libc would like it, and anyway it would be an issue for
>> catching NULL pointer dereferencing, unless we use page tables instead of BATs to map kernel mem,
>> which would be serious performance cut.
> 
> Hmm, why would you have to map at 0?

In real mode, physical mem is at 0. If we want to switch from real to virtual mode by just writing 
to MSR, then we need virtuel addresses match with real addresses ?
We could play with chip selects to put RAM at 0xc0000000, but then we'd have a problem with 
exception as they have to be at 0. Or we could play with MSR[IP] and get the exceptions at 
0xfff00000, but that would not be so easy I guess.

> 
> PPC32 doesn't have soft mask interrupts, but you could still test all
> MSR[PR]=0 interrupts to see if they land inside some region to see if
> they hit in the restart table I think?

Yes and this is already what is done at exit for the ones that handle MSR[RI] I think.

> 
> Could PPC32 skip the SRR reload at least? That's simpler.

I think that would only be possible if real addresses where matching virtual addresses, or am I 
missing something ?

Christophe
