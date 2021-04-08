Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11315357F41
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 11:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGGLg6dwBz3bwm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 19:34:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGGLN3czgz30DN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 19:34:20 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGGHm43xxzyNkS;
 Thu,  8 Apr 2021 17:32:04 +0800 (CST)
Received: from [10.174.179.129] (10.174.179.129) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 17:34:09 +0800
Subject: Re: [PATCH 2/2] powerpc: make 'boot_text_mapped' static
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>
References: <20210408011801.557004-1-yukuai3@huawei.com>
 <20210408011801.557004-3-yukuai3@huawei.com>
 <5b91cd3f-d171-f510-7dae-8cbabb13b23c@csgroup.eu>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <5ea1644d-8b75-eafb-9ad5-d729f430d884@huawei.com>
Date: Thu, 8 Apr 2021 17:34:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5b91cd3f-d171-f510-7dae-8cbabb13b23c@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.129]
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/04/08 13:04, Christophe Leroy wrote:
> 
> 
> Le 08/04/2021 à 03:18, Yu Kuai a écrit :
>> The sparse tool complains as follow:
>>
>> arch/powerpc/kernel/btext.c:48:5: warning:
>>   symbol 'boot_text_mapped' was not declared. Should it be static?
>>
>> This symbol is not used outside of btext.c, so this commit make
>> it static.
>>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>>   arch/powerpc/kernel/btext.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
>> index 359d0f4ca532..8df9230be6fa 100644
>> --- a/arch/powerpc/kernel/btext.c
>> +++ b/arch/powerpc/kernel/btext.c
>> @@ -45,7 +45,7 @@ unsigned long disp_BAT[2] __initdata = {0, 0};
>>   static unsigned char vga_font[cmapsz];
>> -int boot_text_mapped __force_data = 0;
>> +static int boot_text_mapped __force_data;
> 
> Are you sure the initialisation to 0 can be removed ? Usually 
> initialisation to 0 is not needed because not initialised variables go 
> in the BSS section which is zeroed at startup. But here the variable is 
> flagged with __force_data so it is not going in the BSS section.

Hi,

I removed the initialisation to 0 because checkpatch complained about
it, I do not familiar with '__force_data', thanks for pointing it out.

Thanks,
Yu Kuai
> 
> 
>>   extern void rmci_on(void);
>>   extern void rmci_off(void);
>>
> .
> 
