Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8E362379
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 17:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMKJk0RFgz3c6h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 01:05:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMKJL4H8Dz2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 01:05:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMKJB6MPwz9v3LN;
 Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nfnIuGVT2LDV; Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMKJB4wVtz9v3LK;
 Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F4968B851;
 Fri, 16 Apr 2021 17:05:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gM_a9XKodz3W; Fri, 16 Apr 2021 17:04:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EF558B84C;
 Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Price <steven.price@arm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
 <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
 <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
 <6ff4816b-8ff6-19de-73a2-3fcadc003ccd@csgroup.eu>
 <e39d500a-2154-3c5d-9393-8bf53a567fad@arm.com>
 <b6b5300d-35a0-3bc0-ad1d-f2af433ef27e@csgroup.eu>
Message-ID: <b245cf06-f2e5-87a5-9a5e-64efc39d415a@csgroup.eu>
Date: Fri, 16 Apr 2021 17:04:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b6b5300d-35a0-3bc0-ad1d-f2af433ef27e@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/04/2021 à 16:40, Christophe Leroy a écrit :
> 
> 
> Le 16/04/2021 à 15:00, Steven Price a écrit :
>> On 16/04/2021 12:08, Christophe Leroy wrote:
>>>
>>>
>>> Le 16/04/2021 à 12:51, Steven Price a écrit :
>>>> On 16/04/2021 11:38, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 16/04/2021 à 11:28, Steven Price a écrit :
>>>>>> To be honest I don't fully understand why powerpc requires the page_size - it appears to be 
>>>>>> using it purely to find "holes" in the calls to note_page(), but I haven't worked out why such 
>>>>>> holes would occur.
>>>>>
>>>>> I was indeed introduced for KASAN. We have a first commit 
>>>>> https://github.com/torvalds/linux/commit/cabe8138 which uses page size to detect whether it is 
>>>>> a KASAN like stuff.
>>>>>
>>>>> Then came https://github.com/torvalds/linux/commit/b00ff6d8c as a fix. I can't remember what 
>>>>> the problem was exactly, something around the use of hugepages for kernel memory, came as part 
>>>>> of the series 
>>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1589866984.git.christophe.leroy@csgroup.eu/ 
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> Ah, that's useful context. So it looks like powerpc took a different route to reducing the KASAN 
>>>> output to x86.
>>>>
>>>> Given the generic ptdump code has handling for KASAN already it should be possible to drop that 
>>>> from the powerpc arch code, which I think means we don't actually need to provide page size to 
>>>> notepage(). Hopefully that means more code to delete ;)
>>>>
>>>
>>> Yes ... and no.
>>>
>>> It looks like the generic ptdump handles the case when several pgdir entries points to the same 
>>> kasan_early_shadow_pte. But it doesn't take into account the powerpc case where we have regular 
>>> page tables where several (if not all) PTEs are pointing to the kasan_early_shadow_page .
>>
>> I'm not sure I follow quite how powerpc is different here. But could you have a similar check for 
>> PTEs against kasan_early_shadow_pte as the other levels already have?
>>
>> I'm just worried that page_size isn't well defined in this interface and it's going to cause 
>> problems in the future.
>>
> 
> I'm trying. I reverted the two commits b00ff6d8c and cabe8138.
> 
> At the moment, I don't get exactly what I expect: For linear memory I get one line for each 8M page 
> whereas before reverting the patches I got one 16M line and one 112M line.
> 
> And for KASAN shadow area I get two lines for the 2x 8M pages shadowing linear mem then I get one 4M 
> line for each PGDIR entry pointing to kasan_early_shadow_pte.
> 
> 0xf8000000-0xf87fffff 0x07000000         8M   huge        rw       present
> 0xf8800000-0xf8ffffff 0x07800000         8M   huge        rw       present
> 0xf9000000-0xf93fffff 0x01430000         4M               r        present
...
> 0xfec00000-0xfeffffff 0x01430000         4M               r        present
> 
> Any idea ?
> 


I think the different with other architectures is here:

	} else if (flag != st->current_flags || level != st->level ||
		   addr >= st->marker[1].start_address ||
		   pa != st->last_pa + PAGE_SIZE) {


In addition to the checks everyone do, powerpc also checks "pa != st->last_pa + PAGE_SIZE".
And it is definitely for that test that page_size argument add been added.

I see that other architectures except RISCV don't dump the physical address. But even RISCV doesn't 
include that check.

That physical address dump was added by commit aaa229529244 ("powerpc/mm: Add physical address to 
Linux page table dump") [https://github.com/torvalds/linux/commit/aaa2295]

How do other architectures deal with the problem described by the commit log of that patch ?

Christophe
