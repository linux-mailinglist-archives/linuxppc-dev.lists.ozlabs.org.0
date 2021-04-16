Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B435A361930
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 07:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM4KX54dDz3c1b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 15:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM4K76zHKz309s
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 15:19:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FM4K01LdRzB09bJ;
 Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id n0Rd_tp0QaYj; Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FM4Jz6gV6zB09b1;
 Fri, 16 Apr 2021 07:19:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B55238B81C;
 Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3r3x5D8gtbOn; Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3F818B81A;
 Fri, 16 Apr 2021 07:19:47 +0200 (CEST)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <8735vr16sd.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ce7773ea-80d0-14c8-3547-d53424682469@csgroup.eu>
Date: Fri, 16 Apr 2021 07:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <8735vr16sd.fsf@dja-thinkpad.axtens.net>
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



Le 16/04/2021 à 01:12, Daniel Axtens a écrit :
> Hi Christophe,
> 
>>   static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>> -		      u64 val)
>> +		      u64 val, unsigned long page_size)
> 
> Compilers can warn about unused parameters at -Wextra level.  However,
> reading scripts/Makefile.extrawarn it looks like the warning is
> explicitly _disabled_ in the kernel at W=1 and not reenabled at W=2 or
> W=3. So I guess this is fine...

There are a lot lot lot functions having unused parameters in the kernel , especially the ones that 
are re-implemented by each architecture.

> 
>> @@ -126,7 +126,7 @@ static int ptdump_hole(unsigned long addr, unsigned long next,
>>   {
>>   	struct ptdump_state *st = walk->private;
>>   
>> -	st->note_page(st, addr, depth, 0);
>> +	st->note_page(st, addr, depth, 0, 0);
> 
> I know it doesn't matter at this point, but I'm not really thrilled by
> the idea of passing 0 as the size here. Doesn't the hole have a known
> page size?

The hole has a size for sure, I don't think we can call it a page size:

On powerpc 8xx, we have 4 page sizes: 8M, 512k, 16k and 4k.
A page table will cover 4M areas and will contain pages of size 512k, 16k and 4k.
A PGD table contains either entries which points to a page table (covering 4M), or two identical 
consecutive entries pointing to the same hugepd which contains a single PTE for an 8M page.

So, if a PGD entry is empty, the hole is 4M, it corresponds to none of the page sizes the 
architecture supports.


But looking at what is done with that size, it can make sense to pass it to notepage() anyway. Let's 
do that.

> 
>>   
>>   	return 0;
>>   }
>> @@ -153,5 +153,5 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>>   	mmap_read_unlock(mm);
>>   
>>   	/* Flush out the last page */
>> -	st->note_page(st, 0, -1, 0);
>> +	st->note_page(st, 0, -1, 0, 0);
> 
> I'm more OK with the idea of passing 0 as the size when the depth is -1
> (don't know): if we don't know the depth we conceptually can't know the
> page size.
> 
> Regards,
> Daniel
> 
