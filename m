Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63541BC19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 03:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJz276NSHz307D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 11:15:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJz1f0l6mz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 11:14:41 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HJz0N3bb1z8tWb;
 Wed, 29 Sep 2021 09:13:40 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 09:14:32 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 09:14:31 +0800
Message-ID: <e4042e21-1952-582c-99a3-88742ed5f82a@huawei.com>
Date: Wed, 29 Sep 2021 09:14:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 9/9] powerpc/mm: Use is_kernel_text() and
 is_kernel_inittext() helper
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <rostedt@goodmis.org>, <mingo@redhat.com>,
 <davem@davemloft.net>, <ast@kernel.org>, <ryabinin.a.a@gmail.com>,
 <akpm@linux-foundation.org>
References: <20210926072048.190336-1-wangkefeng.wang@huawei.com>
 <20210926072048.190336-10-wangkefeng.wang@huawei.com>
 <c5895fa8-ed3d-74c7-1d71-4d90dee9ea4b@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <c5895fa8-ed3d-74c7-1d71-4d90dee9ea4b@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: bpf@vger.kernel.org, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/9/29 1:51, Christophe Leroy wrote:
> 
> 
> Le 26/09/2021 à 09:20, Kefeng Wang a écrit :
>> Use is_kernel_text() and is_kernel_inittext() helper to simplify code,
>> also drop etext, _stext, _sinittext, _einittext declaration which
>> already declared in section.h.
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/powerpc/mm/pgtable_32.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
>> index dcf5ecca19d9..13c798308c2e 100644
>> --- a/arch/powerpc/mm/pgtable_32.c
>> +++ b/arch/powerpc/mm/pgtable_32.c
>> @@ -33,8 +33,6 @@
>>   #include <mm/mmu_decl.h>
>> -extern char etext[], _stext[], _sinittext[], _einittext[];
>> -
>>   static u8 early_fixmap_pagetable[FIXMAP_PTE_SIZE] __page_aligned_data;
>>   notrace void __init early_ioremap_init(void)
>> @@ -104,14 +102,13 @@ static void __init __mapin_ram_chunk(unsigned 
>> long offset, unsigned long top)
>>   {
>>       unsigned long v, s;
>>       phys_addr_t p;
>> -    int ktext;
>> +    bool ktext;
>>       s = offset;
>>       v = PAGE_OFFSET + s;
>>       p = memstart_addr + s;
>>       for (; s < top; s += PAGE_SIZE) {
>> -        ktext = ((char *)v >= _stext && (char *)v < etext) ||
>> -            ((char *)v >= _sinittext && (char *)v < _einittext);
>> +        ktext = (is_kernel_text(v) || is_kernel_inittext(v));
> 
> I think we could use core_kernel_next() instead.
Indead. oops, sorry for the build error, will update, thanks.

> 
> Build failure on mpc885_ads_defconfig
> 
> arch/powerpc/mm/pgtable_32.c: In function '__mapin_ram_chunk':
> arch/powerpc/mm/pgtable_32.c:111:26: error: implicit declaration of 
> function 'is_kernel_text'; did you mean 'is_kernel_inittext'? 
> [-Werror=implicit-function-declaration]
>    111 |                 ktext = (is_kernel_text(v) || 
> is_kernel_inittext(v));
>        |                          ^~~~~~~~~~~~~~
>        |                          is_kernel_inittext
> cc1: all warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:277: arch/powerpc/mm/pgtable_32.o] 
> Error 1
> make[1]: *** [scripts/Makefile.build:540: arch/powerpc/mm] Error 2
> make: *** [Makefile:1868: arch/powerpc] Error 2
> 
> 
> .
