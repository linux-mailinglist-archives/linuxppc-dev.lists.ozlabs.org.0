Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D843C1E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 06:56:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfGby6wL2z2ywH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:55:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfGbZ0gVKz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 15:55:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HfGbT2SPfz9sSp;
 Wed, 27 Oct 2021 06:55:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmrJJAbWIoSS; Wed, 27 Oct 2021 06:55:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HfGbT1Kr0z9sSX;
 Wed, 27 Oct 2021 06:55:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A3928B76D;
 Wed, 27 Oct 2021 06:55:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N2jP4ihRTbJH; Wed, 27 Oct 2021 06:55:33 +0200 (CEST)
Received: from [192.168.203.162] (unknown [192.168.203.162])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 74EB08B763;
 Wed, 27 Oct 2021 06:55:32 +0200 (CEST)
Message-ID: <063e72e1-fc05-7783-9f42-f681dd08a4b2@csgroup.eu>
Date: Wed, 27 Oct 2021 06:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] powerpc/book3e: Fix set_memory_x() and set_memory_nx()
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
 <c41100f9c144dc5b62e5a751b810190c6b5d42fd.1635226743.git.christophe.leroy@csgroup.eu>
 <1635309296.3vv9pb80wz.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1635309296.3vv9pb80wz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 27/10/2021 à 06:44, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of October 26, 2021 3:39 pm:
>> set_memory_x() calls pte_mkexec() which sets _PAGE_EXEC.
>> set_memory_nx() calls pte_exprotec() which clears _PAGE_EXEC.
>>
>> Book3e has 2 bits, UX and SX, which defines the exec rights
>> resp. for user (PR=1) and for kernel (PR=0).
>>
>> _PAGE_EXEC is defined as UX only.
>>
>> An executable kernel page is set with either _PAGE_KERNEL_RWX
>> or _PAGE_KERNEL_ROX, which both have SX set and UX cleared.
>>
>> So set_memory_nx() call for an executable kernel page does
>> nothing because UX is already cleared.
>>
>> And set_memory_x() on a non-executable kernel page makes it
>> executable for the user and keeps it non-executable for kernel.
>>
>> Also, pte_exec() always returns 'false' on kernel pages, because
>> it checks _PAGE_EXEC which doesn't include SX, so for instance
>> the W+X check doesn't work.
>>
>> To fix this:
>> - change tlb_low_64e.S to use _PAGE_BAP_UX instead of _PAGE_USER
>> - sets both UX and SX in _PAGE_EXEC so that pte_user() returns
>> true whenever one of the two bits is set
> 
> I don't understand this change. Which pte_user() returns true after
> this change? Or do you mean pte_exec()?

Oops, yes, I mean pte_exec()

Unless I have to re-spin, can Michael eventually fix that typo while 
applying ?

> 
> Does this filter through in some cases at least for kernel executable
> PTEs will get both bits set? Seems cleaner to distinguish user and
> kernel exec for that but maybe it's a lot of churn?

Didn't understand what you mean.

I did it like that to be able to continue using _PAGE_EXEC for checking 
executability regardless of whether this is user or kernel, and then 
continue using the generic nohash pte_exec() helper.

Other solution would be to get rid of _PAGE_EXEC completely for book3e 
and implement both pte_exec() and pte_mkexec() with _PAGE_BAP_UX and 
_PAGE_BAP_SX, but I'm not sure it is worth the churn as you say. It 
would also mean different helpers for book3s/32 when it is using 32 bits 
PTE (CONFIG_PTE_64BIT=n)

Christophe

> 
> Thanks,
> Nick
> 
>> and pte_exprotect()
>> clears both bits.
>> - Define a book3e specific version of pte_mkexec() which sets
>> either SX or UX based on UR.
>>
>> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v3: Removed pte_mkexec() from nohash/64/pgtable.h
>> v2: New
>> ---
