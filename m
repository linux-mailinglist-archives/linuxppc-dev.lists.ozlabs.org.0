Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8625F291
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 06:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlG6s3JQRzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 14:50:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlG521VBTzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 14:48:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlG4m4CZHz9twhX;
 Mon,  7 Sep 2020 06:48:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1_nfQxoIiaYq; Mon,  7 Sep 2020 06:48:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlG4m2qwLz9twhW;
 Mon,  7 Sep 2020 06:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 576698B779;
 Mon,  7 Sep 2020 06:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SjW8cKVnuXtG; Mon,  7 Sep 2020 06:48:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 546378B75B;
 Mon,  7 Sep 2020 06:48:25 +0200 (CEST)
Subject: Re: [RFC PATCH 12/12] powerpc/64s: power4 nap fixup in C
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-13-npiggin@gmail.com>
 <53f5fa9b-03d4-150e-199b-7ffa75d91666@csgroup.eu>
 <1599450777.weoux16jk2.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9a647445-a438-ae93-f8d5-c177b7fe9662@csgroup.eu>
Date: Mon, 7 Sep 2020 06:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599450777.weoux16jk2.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/09/2020 à 06:02, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of September 6, 2020 5:32 pm:
>>
>>
>> Le 05/09/2020 à 19:43, Nicholas Piggin a écrit :
>>> There is no need for this to be in asm, use the new intrrupt entry wrapper.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/include/asm/interrupt.h   | 14 ++++++++
>>>    arch/powerpc/include/asm/processor.h   |  1 +
>>>    arch/powerpc/include/asm/thread_info.h |  6 ++++
>>>    arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>>>    arch/powerpc/kernel/idle_book3s.S      |  4 +++
>>>    5 files changed, 25 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
>>> index ed0d633ab5aa..3da1dba91386 100644
>>> --- a/arch/powerpc/include/asm/processor.h
>>> +++ b/arch/powerpc/include/asm/processor.h
>>> @@ -424,6 +424,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
>>>    extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
>>>    #ifdef CONFIG_PPC_970_NAP
>>>    extern void power4_idle_nap(void);
>>> +extern void power4_idle_nap_return(void);
>>
>> Please please please, 'extern' keyword is pointless and deprecated for
>> function prototypes. Don't add new ones.
>>
>> Also, put it outside the #ifdef, so that you can use IS_ENABLED()
>> instead of #ifdef when using it.
> 
> I just copy paste and forget to remove it. I expect someone will do a
> "cleanup" patch to get rid of them in one go, I find a random assortment
> of extern and not extern to be even uglier :(

If we don't want to make fixes backporting a huge headache, some 
transition with random assortment is the price to pay.

One day, when 'extern' have become the minority, we can get rid of the 
few last ones.

But if someone believe it is not such a problem with backporting, I can 
provide a cleanup patch now.

Christophe
