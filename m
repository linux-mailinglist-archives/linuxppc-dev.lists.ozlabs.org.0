Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B7E33B310
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 13:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzbnx107Nz303v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzbnb6LTbz2yRh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 23:48:32 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzblG5sMDz8ybG;
 Mon, 15 Mar 2021 20:46:34 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 20:48:19 +0800
Subject: Re: [PATCH] powerpc: Fix missing prototype problems for
 "arch/powerpc/kernel/setup_64.c"
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <dja@axtens.net>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
 <aneesh.kumar@linux.ibm.com>, <clg@kaod.org>
References: <20210315120444.215905-1-heying24@huawei.com>
 <6eb1925c-a3a1-f062-29da-3a7fa946505c@csgroup.eu>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <ddd03e30-9e54-66cd-8917-6f620557b795@huawei.com>
Date: Mon, 15 Mar 2021 20:48:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6eb1925c-a3a1-f062-29da-3a7fa946505c@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/3/15 20:17, Christophe Leroy 写道:
> You subject doesn't match the content of the patch.
OK. I'll adapt that.
>
> Le 15/03/2021 à 13:04, He Ying a écrit :
>> The variables 'uaccess_fulsh' and 'entry_flush' are not referenced
>> outside the file. So define them as static to avoid the warnings.
>>
>> And add a prototype for the function 'panic_smp_self_stop' for the
>> same purpose.
>>
>> Sparse also warns that 'rfi_flush' should be static. However, it's
>> referenced outside the file.
>
> To clear that warning, you have to include asm/security_features.h, 
> rfi_flush is declared there.
Do you mean that I should include this header in 
arch/powerpc/kernel/setup_64.c?
>
>>
>> The warnings about the file reported by sparse are as follows:
>> arch/powerpc/kernel/setup_64.c:422:6: warning: symbol 
>> 'panic_smp_self_stop' was not declared. Should it be static?
>> arch/powerpc/kernel/setup_64.c:951:6: warning: symbol 'rfi_flush' was 
>> not declared. Should it be static?
>> arch/powerpc/kernel/setup_64.c:952:6: warning: symbol 'entry_flush' 
>> was not declared. Should it be static?
>> arch/powerpc/kernel/setup_64.c:953:6: warning: symbol 'uaccess_flush' 
>> was not declared. Should it be static?
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>>   arch/powerpc/kernel/setup_64.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup_64.c 
>> b/arch/powerpc/kernel/setup_64.c
>> index 560ed8b975e7..603aacd8527b 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -71,6 +71,8 @@
>>     #include "setup.h"
>>   +extern void panic_smp_self_stop(void);
>> +
>
> For function prototypes 'extern' is unneeded and deprecated.
>
> And function prototypes should go in an header file.
>
> panic_smp_self_stop() is called from kernel/panic.c , it should be 
> declared in one of the generic linux header files I think.
Yes, you're right. But I have no idea which header it should be declared 
in. May I have your suggestions?
>
>>   int spinning_secondaries;
>>   u64 ppc64_pft_size;
>>   @@ -949,8 +951,8 @@ static bool no_rfi_flush;
>>   static bool no_entry_flush;
>>   static bool no_uaccess_flush;
>>   bool rfi_flush;
>> -bool entry_flush;
>> -bool uaccess_flush;
>> +static bool entry_flush;
>> +static bool uaccess_flush;
>>   DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
>>   EXPORT_SYMBOL(uaccess_flush_key);
>>
> .
