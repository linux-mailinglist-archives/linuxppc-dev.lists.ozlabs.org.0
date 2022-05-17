Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E3552A072
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 13:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Yr72Hb5z3cJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 21:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Yqk1QH5z3bdB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 21:31:59 +1000 (AEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L2Yjx0jCkzCskY;
 Tue, 17 May 2022 19:27:01 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 19:31:54 +0800
Subject: Re: [PATCH -next] powerpc/book3e: Fix build error
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>
References: <20220517094830.27560-1-yuehaibing@huawei.com>
 <0e8b7931-9bfb-1948-c141-c4e612ba0fe6@csgroup.eu>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <8b169642-5d32-4135-93a7-4969515d1ab0@huawei.com>
Date: Tue, 17 May 2022 19:31:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0e8b7931-9bfb-1948-c141-c4e612ba0fe6@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/5/17 18:45, Christophe Leroy wrote:
> 
> 
> Le 17/05/2022 à 11:48, YueHaibing a écrit :
>> arch/powerpc/mm/nohash/fsl_book3e.c: In function ‘relocate_init’:
>> arch/powerpc/mm/nohash/fsl_book3e.c:348:2: error: implicit declaration of function ‘early_get_first_memblock_info’ [-Werror=implicit-function-declaration]
>>    early_get_first_memblock_info(__va(dt_ptr), &size);
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Add missing include file linux/of_fdt.h to fix this.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Thats for fixing that.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> It means we don't have any defconfig for 32 bits booke with 
> CONFIG_RELOCATABLE ?

Indeed, there is no defconfig with CONFIG_RELOCATABLE under arch/powerpc/configs
> 
>> ---
>>   arch/powerpc/mm/nohash/fsl_book3e.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
>> index 08a984e29433..093da4dbdee1 100644
>> --- a/arch/powerpc/mm/nohash/fsl_book3e.c
>> +++ b/arch/powerpc/mm/nohash/fsl_book3e.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/highmem.h>
>>   #include <linux/memblock.h>
>> +#include <linux/of_fdt.h>
>>   
>>   #include <asm/io.h>
>>   #include <asm/mmu_context.h>
