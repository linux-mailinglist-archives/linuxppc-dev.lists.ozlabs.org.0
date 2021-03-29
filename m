Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBB34D587
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 18:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8JXF5379z30Kw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 03:52:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8JWw4zm5z2yYZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 03:51:55 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F8JWs1brCz1qtd6;
 Mon, 29 Mar 2021 18:51:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F8JWs07P7z1r1MN;
 Mon, 29 Mar 2021 18:51:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MNq1pLoSM0u6; Mon, 29 Mar 2021 18:51:52 +0200 (CEST)
X-Auth-Info: 5/I5xbODmWC5+hbQN/k4J9zlsnkIZA28m3kRoxWTXIYD+G6Ld0StKhmD448nqGVa
Received: from igel.home (ppp-46-244-184-171.dynamic.mnet-online.de
 [46.244.184.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 29 Mar 2021 18:51:52 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id A1BF52C3258; Mon, 29 Mar 2021 18:51:51 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <a01d923737cb1d4a603dc5046b67787233051c12.camel@kernel.crashing.org>
 <236a67a4-1609-5fec-3c68-41db02cd1a4c__18973.8760514714$1617008745$gmane$org@csgroup.eu>
 <87czvikwb7.fsf__13924.9042653077$1617019017$gmane$org@igel.home>
X-Yow: ..  the HIGHWAY is made out of LIME JELLO and my HONDA
 is a barbequed OYSTER!  Yum!
Date: Mon, 29 Mar 2021 18:51:51 +0200
In-Reply-To: <87czvikwb7.fsf__13924.9042653077$1617019017$gmane$org@igel.home>
 (Andreas Schwab's message of "Mon, 29 Mar 2021 13:56:28 +0200")
Message-ID: <87mtulkimw.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mär 29 2021, Andreas Schwab wrote:

> On Mär 29 2021, Christophe Leroy wrote:
>
>> Le 29/03/2021 à 10:33, Benjamin Herrenschmidt a écrit :
>>> On Fri, 2021-03-12 at 11:20 +1000, Nicholas Piggin wrote:
>>>>
>>>> +static inline void nap_adjust_return(struct pt_regs *regs)
>>>>
>>>> +{
>>>>
>>>> +#ifdef CONFIG_PPC_970_NAP
>>>>
>>>> +       if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
>>>> +               /* Can avoid a test-and-clear because NMIs do not call this */
>>>> +               clear_thread_local_flags(_TLF_NAPPING);
>>>> +               regs->nip = (unsigned long)power4_idle_nap_return;
>>>> +       }
>>> Is this a pointer to a function descriptor or the actual code ?
>>> 
>>
>> --- a/arch/powerpc/kernel/idle_book3s.S
>> +++ b/arch/powerpc/kernel/idle_book3s.S
>> @@ -209,4 +209,8 @@ _GLOBAL(power4_idle_nap)
>>  	mtmsrd	r7
>>  	isync
>>  	b	1b
>> +
>> +	.globl power4_idle_nap_return
>> +power4_idle_nap_return:
>> +	blr
>>  #endif
>
> The problem is not the definition, it is the reference.  In C, a
> function symbol always resolves to the address of the descriptor.

Sorry, this is wrong, I have misremembered how function descriptors work
on ppc64.  The address is really pointing to the actual code.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
