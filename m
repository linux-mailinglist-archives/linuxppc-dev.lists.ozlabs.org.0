Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B15614D46C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 13:23:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDp9y41QJz30J7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 23:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leemhuis.info (client-ip=2a01:488:42:1000:50ed:8234::;
 helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info;
 receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDp9V1Jvdz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 23:22:37 +1100 (AEDT)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nSHoO-0000Ms-7H; Thu, 10 Mar 2022 13:22:32 +0100
Message-ID: <09086ab6-10ff-6334-6148-2fab9df64f9a@leemhuis.info>
Date: Thu, 10 Mar 2022 13:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215658 - arch/powerpc/mm/mmu_context.o Assembler messages:
 Error: unrecognized opcode: `dssall' (PowerMac G4)
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman <mpe@ellerman.id.au>
References: <831731e2-6769-3d36-0cdf-721437452fcc@leemhuis.info>
 <1367d2de-bc44-fb96-c1ef-fd4cf0fb82f4@csgroup.eu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <1367d2de-bc44-fb96-c1ef-fd4cf0fb82f4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1646914958;
 d259ba8e; 
X-HE-SMSGID: 1nSHoO-0000Ms-7H
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10.03.22 12:22, Christophe Leroy wrote:
> Le 10/03/2022 à 11:39, Thorsten Leemhuis a écrit :
>> Hi, this is your Linux kernel regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org that afaics nobody
>> acted upon since it was reported about a week ago, that's why I decided
>> to forward it to the lists and a few relevant people to the CC. To quote
>> from the ticket:
> 
> I already looked at it when the ticket was opened and that's a bit puzzling.

Yeah, same here, but I decided I to pick it up, as that's what I'm here for.

> With v5.16.12 and the config file in the bug report I have no such problem:
> 
>    CC      arch/powerpc/mm/fault.o
>    CC      arch/powerpc/mm/mem.o
> [...]

Maybe it's one of those bugs related to the version of binutils?

> The bug is puzzling because it says the problem is introduced by commit 
> d51f86cfd8e3 ("powerpc/mm: Switch obsolete dssall to .long") whereas the 
> purpose of that commit is exactly to fix the issue you are reporting.
>
> And as far as I can see that commit is not in v5.16.12, so my feeling is 
> that somethings wrong with the bug report.
> 
> By the way I think that cherry-picking that commit into v5.16.12 should 
> fix it.

Maybe that's what he had meant to be writing? Maybe your comment in the
ticket will lead to some enlightenment.

Thx for looking into this.

Ciao, Thorsten

>>> 5.16.12 kernel build for my G4 DP on my Talos II fails with:
>>>
>>> [...]
>>>    CC      arch/powerpc/mm/init_32.o
>>>    CC      arch/powerpc/mm/pgtable_32.o
>>>    CC      arch/powerpc/mm/pgtable-frag.o
>>>    CC      arch/powerpc/mm/ioremap.o
>>>    CC      arch/powerpc/mm/ioremap_32.o
>>>    CC      arch/powerpc/mm/init-common.o
>>>    CC      arch/powerpc/mm/mmu_context.o
>>> {standard input}: Assembler messages:
>>> {standard input}:30: Error: unrecognized opcode: `dssall'
>>> make[2]: *** [scripts/Makefile.build:287: arch/powerpc/mm/mmu_context.o] Fehler 1
>>> make[1]: *** [scripts/Makefile.build:549: arch/powerpc/mm] Fehler 2
>>> make: *** [Makefile:1846: arch/powerpc] Error 2
>>>
>>> This seems to have been introduced by commit d51f86cfd8e378d4907958db77da3074f6dce3ba "powerpc/mm: Switch obsolete dssall to .long"
>>>
>>> Reverting this commit fixes the build for my G4.
>>
>> Could somebody take a look into this? Or was this discussed somewhere
>> else already? Or even fixed?
>>
>> Anyway, to get this tracked:
>>
>> #regzbot introduced: d51f86cfd8e378d4907958db77da3074f6dce3ba
>> #regzbot from: Erhard F <erhard_f@mailbox.org>
>> #regzbot title:  arch/powerpc/mm/mmu_context.o Assembler messages:
>> Error: unrecognized opcode: `dssall' (PowerMac G4)
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215658
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>
>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table. I can only look briefly into most of them and lack
>> knowledge about most of the areas they concern. I thus unfortunately
>> will sometimes get things wrong or miss something important. I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight.
