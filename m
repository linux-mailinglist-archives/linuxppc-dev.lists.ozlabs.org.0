Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDFE242B5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 16:28:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRXBV46jKzDqCt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 00:28:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRX8450LRzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 00:26:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRX7v1MSWz9vCq1;
 Wed, 12 Aug 2020 16:26:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Sg8FJ2OvS-Ik; Wed, 12 Aug 2020 16:26:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRX7v0JSxz9vCq0;
 Wed, 12 Aug 2020 16:26:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BDFB8B82A;
 Wed, 12 Aug 2020 16:26:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4H8o1ZYhP17x; Wed, 12 Aug 2020 16:26:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 209A08B826;
 Wed, 12 Aug 2020 16:26:36 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200812012005.1919255-1-nathanl@linux.ibm.com>
 <c39976ce-a95c-a9cb-d119-d272b8de2f28@csgroup.eu>
 <878sekyo2l.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f5ff5bdd-a5d3-5194-8988-2826cd2da420@csgroup.eu>
Date: Wed, 12 Aug 2020 16:26:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <878sekyo2l.fsf@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/08/2020 à 15:46, Nathan Lynch a écrit :
> Hi Christophe,
> 
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
>>> +{
>>> +	const unsigned int resched_interval = 20;
>>> +
>>> +	BUG_ON(lmb < drmem_info->lmbs);
>>> +	BUG_ON(lmb >= drmem_info->lmbs + drmem_info->n_lmbs);
>>
>> BUG_ON() shall be avoided unless absolutely necessary.
>> Wouldn't WARN_ON() together with an early return be enough ?
> 
> Not sure what a sensible early return behavior would be. If the iterator
> doesn't advance the pointer the behavior will be a hang.

I was thinking about returning lmb++ without checking the cond_resched 
stuff.

> 
> BUG_ON a bounds-check failure is appropriate here; many users of this
> API will corrupt memory otherwise.

It looks really strange to me to do bounds-checks in an iterator like 
this. Should be checked before entering the loop.

> 
>>> +
>>> +	if ((lmb - drmem_info->lmbs) % resched_interval == 0)
>>> +		cond_resched();
>>
>> Do you need something that precise ? Can't you use 16 or 32 and use a
>> logical AND instead of a MODULO ?
> 
> Eh if you're executing in this code you've already lost with respect to
> performance considerations at this level, see the discussion on v1. I'll
> use 16 since I'm going to reroll the patch though.
> 
>> And what garanties that lmb is always an element of a table based at
>> drmem_info->lmbs ?
> 
> Well, that's its only intended use right now. There should not be any
> other arrays of drmem_lmb objects, and I hope we don't gain any.
> 
> 
>> What about:
>>
>> static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb,
>> struct drmem_lmb *start)
>> {
>> 	const unsigned int resched_interval = 16;
>>
>> 	if ((++lmb - start) & resched_interval == 0)
>                             ^^^
> Did you mean '%' here? The bitwise AND doesn't do what I want.

I meant '& (resched_interval - 1)' indeed. But yes we can leave the %, 
GCC will change a % 16 to an & 15.

> 
> Otherwise, making drmem_lmb_next() more general by adding a 'start'
> argument could ease refactoring to come, so I'll do that.

Yes, the main idea is to avoid the access to a global variable in such 
an helper.

> 

Christophe
