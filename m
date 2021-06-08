Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B039F486
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:03:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznR60sSJz3bvm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:03:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FznQl2Ffpz2xYx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:03:10 +1000 (AEST)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FznL94nw5z6tlq;
 Tue,  8 Jun 2021 18:59:13 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 19:03:04 +0800
Subject: Re: [PATCH] powerpc: Fix kernel-jump address for ppc64 wrapper boot
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <nathan@kernel.org>, Oliver
 O'Halloran <oohall@gmail.com>
References: <20210604092228.199588-1-heying24@huawei.com>
 <c80f69d0-44b0-24a6-ce4f-ed5a40514597@csgroup.eu>
From: He Ying <heying24@huawei.com>
Message-ID: <c9495dc0-2a1f-8aed-1088-90e2d0baabe0@huawei.com>
Date: Tue, 8 Jun 2021 19:03:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c80f69d0-44b0-24a6-ce4f-ed5a40514597@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,


在 2021/6/8 12:55, Christophe Leroy 写道:
>
>
> Le 04/06/2021 à 11:22, He Ying a écrit :
>>  From "64-bit PowerPC ELF Application Binary Interface Supplement 1.9",
>> we know that the value of a function pointer in a language like C is
>> the address of the function descriptor and the first doubleword
>> of the function descriptor contains the address of the entry point
>> of the function.
>>
>> So, when we want to jump to an address (e.g. addr) to execute for
>> PPC-elf64abi, we should assign the address of addr *NOT* addr itself
>> to the function pointer or system will jump to the wrong address.
>>
>> Link: 
>> https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DES
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>>   arch/powerpc/boot/main.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
>> index cae31a6e8f02..50fd7f11b642 100644
>> --- a/arch/powerpc/boot/main.c
>> +++ b/arch/powerpc/boot/main.c
>> @@ -268,7 +268,16 @@ void start(void)
>>       if (console_ops.close)
>>           console_ops.close();
>>   +#ifdef CONFIG_PPC64_BOOT_WRAPPER
>
> This kind of need doesn't desserve a #ifdef, see 
> https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation
>
> You can do:
>
>
>     kentry = (kernel_entry_t)(IS_ENABLED(CONFIG_PPC64_BOOT_WRAPPER) ? 
> &vmlinux.addr : vmlinux.addr);
>
>
> Or, if you prefer something less compact:
>
>
>     if (IS_ENABLED(CONFIG_PPC64_BOOT_WRAPPER))
>         kentry = (kernel_entry_t) &vmlinux.addr;
>     else
>         kentry = (kernel_entry_t) vmlinux.addr;

Thanks for reviewing. But from Oliver's reply, this patch should be dropped.

Because all ppc platforms will not build wrapper to ppc64be ELF currently.

And ppc64le uses LE ABI (ABIv2) which doesn't use function descriptors.

So this may not be a problem for now.


Thanks again.

>
>
>> +    /*
>> +     * For PPC-elf64abi, the value of a function pointer is the address
>> +     * of the function descriptor. And the first doubleword of a 
>> function
>> +     * descriptor contains the address of the entry point of the 
>> function.
>> +     */
>> +    kentry = (kernel_entry_t) &vmlinux.addr;
>> +#else
>>       kentry = (kernel_entry_t) vmlinux.addr;
>> +#endif
>>       if (ft_addr) {
>>           if(platform_ops.kentry)
>>               platform_ops.kentry(ft_addr, vmlinux.addr);
>>
> .
