Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397CB189B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 09:05:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V69P5DN0zF54C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 17:05:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Lo9C+SEB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V67F6QrjzF5D9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 17:03:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46V6776BP6z9vKH5;
 Fri, 13 Sep 2019 09:03:47 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Lo9C+SEB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zWniB8M1cFKh; Fri, 13 Sep 2019 09:03:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46V6774QYRz9vKH2;
 Fri, 13 Sep 2019 09:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568358227; bh=AyuxYMR1Yo8syZCcIPlzcrvbLyPmuxun2LLiIZt5UxY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Lo9C+SEBqaduXoGOyBorDnpf+8JwISLneOlSFGcgJJY8qlWGaZzsb4C7dcuadXTZC
 e5yGHtqWF6SrMhGyiQ0R4zx8DT4H4ASM+Fu1/D2UfL9R3Mf34r4ji6F/P+voIkRuzO
 LAG9Ma5mTL5t0idPrnoCF8zSRDucaQop7Q6UvTR4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80E098B963;
 Fri, 13 Sep 2019 09:03:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9VHWBJ-wdCJw; Fri, 13 Sep 2019 09:03:48 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EBB1B8B958;
 Fri, 13 Sep 2019 09:03:47 +0200 (CEST)
Subject: Re: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <527dd29d-45fa-4d83-1899-6cbf268dd749@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e2b42446-7f91-83f1-ac12-08dff75c4d35@c-s.fr>
Date: Fri, 13 Sep 2019 09:03:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <527dd29d-45fa-4d83-1899-6cbf268dd749@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vlastimil Babka <vbabka@suse.cz>, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/09/2019 à 08:58, Anshuman Khandual a écrit :
> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
>> Fix build failure on powerpc.
>>
>> Fix preemption imbalance.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   mm/arch_pgtable_test.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
>> index 8b4a92756ad8..f2b3c9ec35fa 100644
>> --- a/mm/arch_pgtable_test.c
>> +++ b/mm/arch_pgtable_test.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/swap.h>
>>   #include <linux/swapops.h>
>>   #include <linux/sched/mm.h>
>> +#include <linux/highmem.h>
> 
> This is okay.
> 
>>   #include <asm/pgalloc.h>
>>   #include <asm/pgtable.h>
>>   
>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
>>   	p4d_clear_tests(p4dp);
>>   	pgd_clear_tests(mm, pgdp);
>>   
>> +	pte_unmap(ptep);
>> +
> 
> Now the preemption imbalance via pte_alloc_map() path i.e
> 
> pte_alloc_map() -> pte_offset_map() -> kmap_atomic()
> 
> Is not this very much powerpc 32 specific or this will be applicable
> for all platform which uses kmap_XXX() to map high memory ?
> 

See 
https://elixir.bootlin.com/linux/v5.3-rc8/source/include/linux/highmem.h#L91

I think it applies at least to all arches using the generic implementation.

Applies also to arm:
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/mm/highmem.c#L52

Applies also to mips:
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/mips/mm/highmem.c#L47

Same on sparc:
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/sparc/mm/highmem.c#L52

Same on x86:
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/mm/highmem_32.c#L34

I have not checked others, but I guess it is like that for all.

Christophe
