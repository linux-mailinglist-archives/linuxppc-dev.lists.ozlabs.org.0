Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9833E7B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 04:38:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0bTn57LBz30QZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 14:38:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0bTS5x3hz30GS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 14:38:00 +1100 (AEDT)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F0bR23lJ8z19GBh;
 Wed, 17 Mar 2021 11:35:58 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 11:37:45 +0800
Subject: Re: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
To: Daniel Axtens <dja@axtens.net>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <akpm@linux-foundation.org>, <aneesh.kumar@linux.ibm.com>, <rppt@kernel.org>, 
 <ardb@kernel.org>, <clg@kaod.org>, <christophe.leroy@csgroup.eu>
References: <20210316041148.29694-1-heying24@huawei.com>
 <87wnu6bhvi.fsf@dja-thinkpad.axtens.net>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <f0130916-a8f3-75ba-b5da-7d37d9139ff3@huawei.com>
Date: Wed, 17 Mar 2021 11:37:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnu6bhvi.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="gbk"; format=flowed
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank you for your reply.


ÔÚ 2021/3/17 11:04, Daniel Axtens Ð´µÀ:
> Hi He Ying,
>
> Thank you for this patch.
>
> I'm not sure what the precise rules for Fixes are, but I wonder if this
> should have:
>
> Fixes: 9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")
> Fixes: f79643787e0a ("powerpc/64s: flush L1D on kernel entry")

Is that necessary for warning cleanups? I thought 'Fixes' tags are 
needed only for

bugfix patches. Can someone tell me whether I am right?

>
> Those are the commits that added the entry_flush and uaccess_flush
> symbols. Perhaps one for rfi_flush too but I'm not sure what commit
> introduced that.
>
> Kind regards,
> Daniel
>
>> warning: symbol 'rfi_flush' was not declared.
>> warning: symbol 'entry_flush' was not declared.
>> warning: symbol 'uaccess_flush' was not declared.
>> We found warnings above in arch/powerpc/kernel/setup_64.c by using
>> sparse tool.
>>
>> Define 'entry_flush' and 'uaccess_flush' as static because they are not
>> referenced outside the file. Include asm/security_features.h in which
>> 'rfi_flush' is declared.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>>   arch/powerpc/kernel/setup_64.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>> index 560ed8b975e7..f92d72a7e7ce 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -68,6 +68,7 @@
>>   #include <asm/early_ioremap.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/asm-prototypes.h>
>> +#include <asm/security_features.h>
>>   
>>   #include "setup.h"
>>   
>> @@ -949,8 +950,8 @@ static bool no_rfi_flush;
>>   static bool no_entry_flush;
>>   static bool no_uaccess_flush;
>>   bool rfi_flush;
>> -bool entry_flush;
>> -bool uaccess_flush;
>> +static bool entry_flush;
>> +static bool uaccess_flush;
>>   DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
>>   EXPORT_SYMBOL(uaccess_flush_key);
>>   
>> -- 
>> 2.17.1
> .
