Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DE1FCFF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 16:47:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n7Fj375KzDqDK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 00:47:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n7Cm0m9PzDqpp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 00:45:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49n7CX6RNmz9tyTx;
 Wed, 17 Jun 2020 16:45:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id z61xwnB6Yi86; Wed, 17 Jun 2020 16:45:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49n7CX5PZhz9tyTv;
 Wed, 17 Jun 2020 16:45:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC4C08B80F;
 Wed, 17 Jun 2020 16:45:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JE3Mk_gI3482; Wed, 17 Jun 2020 16:45:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C00D8B781;
 Wed, 17 Jun 2020 16:45:30 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc/8xx: Provide ptep_get() with 16k pages
To: Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
 <341688399c1b102756046d19ea6ce39db1ae4742.1592225558.git.christophe.leroy@csgroup.eu>
 <20200615132244.GR2531@hirez.programming.kicks-ass.net>
 <87wo45db8d.fsf@mpe.ellerman.id.au>
 <20200617143826.GJ2531@hirez.programming.kicks-ass.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0bb024ce-11aa-80dc-c7d8-d5acc5329f25@csgroup.eu>
Date: Wed, 17 Jun 2020 16:45:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617143826.GJ2531@hirez.programming.kicks-ass.net>
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
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/06/2020 à 16:38, Peter Zijlstra a écrit :
> On Thu, Jun 18, 2020 at 12:21:22AM +1000, Michael Ellerman wrote:
>> Peter Zijlstra <peterz@infradead.org> writes:
>>> On Mon, Jun 15, 2020 at 12:57:59PM +0000, Christophe Leroy wrote:
> 
>>>> +#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
>>>> +#define __HAVE_ARCH_PTEP_GET
>>>> +static inline pte_t ptep_get(pte_t *ptep)
>>>> +{
>>>> +	pte_t pte = {READ_ONCE(ptep->pte), 0, 0, 0};
>>>> +
>>>> +	return pte;
>>>> +}
>>>> +#endif
>>>
>>> Would it make sense to have a comment with this magic? The casual reader
>>> might wonder WTH just happened when he stumbles on this :-)
>>
>> I tried writing a helpful comment but it's too late for my brain to form
>> sensible sentences.
>>
>> Christophe can you send a follow-up with a comment explaining it? In
>> particular the zero entries stand out, it's kind of subtle that those
>> entries are only populated with the right value when we write to the
>> page table.
> 
> static inline pte_t ptep_get(pte_t *ptep)
> {
> 	unsigned long val = READ_ONCE(ptep->pte);
> 	/* 16K pages have 4 identical value 4K entries */
> 	pte_t pte = {val, val, val, val);
> 	return pte;
> }
> 
> Maybe something like that?
> 

This should work as well. Indeed nobody cares about what's in the other 
three. They are only there to ensure that ptep++ increases the ptep 
pointer by 16 bytes. Only the HW require 4 identical values, that's 
taken care of in set_pte_at() and pte_update().
So we should use the most efficient. Thinking once more, maybe what you 
propose is the most efficient as there is no need to load another 
register with value 0 in order to write it in the stack.

Christophe
