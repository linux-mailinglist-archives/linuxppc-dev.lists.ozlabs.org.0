Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09364361E16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 12:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMCP14Zywz3c3y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 20:38:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMCNg5cFTz2yhs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 20:38:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMCNW3tv5z9v4WN;
 Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TGx8rBpOGfLa; Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMCNW2yYgz9v4WM;
 Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FD108B83B;
 Fri, 16 Apr 2021 12:38:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gxbf4EojfzU4; Fri, 16 Apr 2021 12:38:20 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CE338B83A;
 Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Steven Price <steven.price@arm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
Date: Fri, 16 Apr 2021 12:38:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
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



Le 16/04/2021 à 11:28, Steven Price a écrit :
> On 15/04/2021 18:18, Christophe Leroy wrote:
>> In order to support large pages on powerpc, notepage()
>> needs to know the page size of the page.
>>
>> Add a page_size argument to notepage().
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/arm64/mm/ptdump.c         |  2 +-
>>   arch/riscv/mm/ptdump.c         |  2 +-
>>   arch/s390/mm/dump_pagetables.c |  3 ++-
>>   arch/x86/mm/dump_pagetables.c  |  2 +-
>>   include/linux/ptdump.h         |  2 +-
>>   mm/ptdump.c                    | 16 ++++++++--------
>>   6 files changed, 14 insertions(+), 13 deletions(-)
>>
> [...]
>> diff --git a/mm/ptdump.c b/mm/ptdump.c
>> index da751448d0e4..61cd16afb1c8 100644
>> --- a/mm/ptdump.c
>> +++ b/mm/ptdump.c
>> @@ -17,7 +17,7 @@ static inline int note_kasan_page_table(struct mm_walk *walk,
>>   {
>>       struct ptdump_state *st = walk->private;
>> -    st->note_page(st, addr, 4, pte_val(kasan_early_shadow_pte[0]));
>> +    st->note_page(st, addr, 4, pte_val(kasan_early_shadow_pte[0]), PAGE_SIZE);
> 
> I'm not completely sure what the page_size is going to be used for, but note that KASAN presents an 
> interesting case here. We short-cut by detecting it's a KASAN region at a high level 
> (PGD/P4D/PUD/PMD) and instead of walking the tree down just call note_page() *once* but with 
> level==4 because we know KASAN sets up the page table like that.
> 
> However the one call actually covers a much larger region - so while PAGE_SIZE matches the level it 
> doesn't match the region covered. AFAICT this will lead to odd results if you enable KASAN on powerpc.

Hum .... I successfully tested it with KASAN, I now realise that I tested it with 
CONFIG_KASAN_VMALLOC selected. In this situation, since 
https://github.com/torvalds/linux/commit/af3d0a686 we don't have any common shadow page table anymore.

I'll test again without CONFIG_KASAN_VMALLOC.

> 
> To be honest I don't fully understand why powerpc requires the page_size - it appears to be using it 
> purely to find "holes" in the calls to note_page(), but I haven't worked out why such holes would 
> occur.

I was indeed introduced for KASAN. We have a first commit 
https://github.com/torvalds/linux/commit/cabe8138 which uses page size to detect whether it is a 
KASAN like stuff.

Then came https://github.com/torvalds/linux/commit/b00ff6d8c as a fix. I can't remember what the 
problem was exactly, something around the use of hugepages for kernel memory, came as part of the 
series 
https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1589866984.git.christophe.leroy@csgroup.eu/


Christophe
