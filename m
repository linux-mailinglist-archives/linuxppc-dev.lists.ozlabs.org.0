Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630B33E968
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 06:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0fbg1Llpz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 16:58:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0fbK3nb0z302r
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 16:58:18 +1100 (AEDT)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F0fXm6M3nz17M4p;
 Wed, 17 Mar 2021 13:56:08 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 13:57:58 +0800
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
 <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <fef8ca3b-97ae-5c19-69ea-bb1dfe88cf9c@huawei.com>
Date: Wed, 17 Mar 2021 13:57:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/3/17 13:48, Christophe Leroy wrote:
>
>
> Le 17/03/2021 à 02:52, Kefeng Wang a écrit :
>> mem_init_print_info() is called in mem_init() on each architecture,
>> and pass NULL argument, so using void argument and move it into 
>> mm_init().
>>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> v2:
>> - Cleanup 'str' line suggested by Christophe and ACK
>>
>>   arch/alpha/mm/init.c             |  1 -
>>   arch/arc/mm/init.c               |  1 -
>>   arch/arm/mm/init.c               |  2 --
>>   arch/arm64/mm/init.c             |  2 --
>>   arch/csky/mm/init.c              |  1 -
>>   arch/h8300/mm/init.c             |  2 --
>>   arch/hexagon/mm/init.c           |  1 -
>>   arch/ia64/mm/init.c              |  1 -
>>   arch/m68k/mm/init.c              |  1 -
>>   arch/microblaze/mm/init.c        |  1 -
>>   arch/mips/loongson64/numa.c      |  1 -
>>   arch/mips/mm/init.c              |  1 -
>>   arch/mips/sgi-ip27/ip27-memory.c |  1 -
>>   arch/nds32/mm/init.c             |  1 -
>>   arch/nios2/mm/init.c             |  1 -
>>   arch/openrisc/mm/init.c          |  2 --
>>   arch/parisc/mm/init.c            |  2 --
>>   arch/powerpc/mm/mem.c            |  1 -
>>   arch/riscv/mm/init.c             |  1 -
>>   arch/s390/mm/init.c              |  2 --
>>   arch/sh/mm/init.c                |  1 -
>>   arch/sparc/mm/init_32.c          |  2 --
>>   arch/sparc/mm/init_64.c          |  1 -
>>   arch/um/kernel/mem.c             |  1 -
>>   arch/x86/mm/init_32.c            |  2 --
>>   arch/x86/mm/init_64.c            |  2 --
>>   arch/xtensa/mm/init.c            |  1 -
>>   include/linux/mm.h               |  2 +-
>>   init/main.c                      |  1 +
>>   mm/page_alloc.c                  | 10 +++++-----
>>   30 files changed, 7 insertions(+), 42 deletions(-)
>>
>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 89314651dd62..c2e0b3495c5a 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2373,7 +2373,7 @@ extern unsigned long free_reserved_area(void 
>> *start, void *end,
>>                       int poison, const char *s);
>>     extern void adjust_managed_page_count(struct page *page, long 
>> count);
>> -extern void mem_init_print_info(const char *str);
>> +extern void mem_init_print_info(void);
>
> Sorry I didn't see that in previous patch.
>
> 'extern' keyword is pointless for function prototypes and is 
> deprecated, you should remove it.
>
> That said,
>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr> # focussed on 
> powerpc
Thanks, let's wait for more feedback from other architectures, if 
necessary,  will send a new one.
>
>>     extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t 
>> end);
> .
>
