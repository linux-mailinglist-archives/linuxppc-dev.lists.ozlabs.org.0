Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65D16F5C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 03:46:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S0YH5DNKzDqL5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S0WG0NyGzDq9y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 13:44:25 +1100 (AEDT)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A7E0BFFE36A0D8364CC9;
 Wed, 26 Feb 2020 10:44:20 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 26 Feb 2020 10:44:10 +0800
Subject: Re: [PATCH v3 5/6] powerpc/fsl_booke/64: clear the original kernel if
 randomized
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <20200206025825.22934-6-yanaijie@huawei.com>
 <0f778e1c-5e29-e600-1cf0-aeb3e1a6fe08@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <f7b10cd6-d610-2ac6-e80d-97c0f347aff8@huawei.com>
Date: Wed, 26 Feb 2020 10:44:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0f778e1c-5e29-e600-1cf0-aeb3e1a6fe08@c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2020/2/20 21:49, Christophe Leroy 写道:
> 
> 
> Le 06/02/2020 à 03:58, Jason Yan a écrit :
>> The original kernel still exists in the memory, clear it now.
> 
> No such problem with PPC32 ? Or is that common ?
> 

PPC32 did this in relocate_init() in fsl_booke.c because PPC32 will not 
reach kaslr_early_init for the second pass after relocation.

Thanks,
Jason

> Christophe
> 
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Scott Wood <oss@buserror.net>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>   arch/powerpc/mm/nohash/kaslr_booke.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c 
>> b/arch/powerpc/mm/nohash/kaslr_booke.c
>> index c6f5c1db1394..ed1277059368 100644
>> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
>> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
>> @@ -378,8 +378,10 @@ notrace void __init kaslr_early_init(void 
>> *dt_ptr, phys_addr_t size)
>>       unsigned int *__kaslr_offset = (unsigned int *)(KERNELBASE + 0x58);
>>       unsigned int *__run_at_load = (unsigned int *)(KERNELBASE + 0x5c);
>> -    if (*__run_at_load == 1)
>> +    if (*__run_at_load == 1) {
>> +        kaslr_late_init();
>>           return;
>> +    }
>>       /* Setup flat device-tree pointer */
>>       initial_boot_params = dt_ptr;
>>
> 
> .

