Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A56235F04DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:37:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf0sC4VRPz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf0rr1VDSz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:37:11 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mf0ls3Q74zVhk6;
	Fri, 30 Sep 2022 14:32:57 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 14:37:05 +0800
Message-ID: <2afc52b8-3e4d-c61e-95ed-885520b95a17@huawei.com>
Date: Fri, 30 Sep 2022 14:37:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] powerpc/mpic_msgr: fix cast removes address space
 of expression warnings
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"joel@jms.id.au" <joel@jms.id.au>, "Julia.Lawall@inria.fr"
	<Julia.Lawall@inria.fr>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20220901085416.204378-1-ruanjinjie@huawei.com>
 <4d3b7f83-498e-deb2-ce2a-c17d4b22a078@csgroup.eu>
Content-Language: en-US
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <4d3b7f83-498e-deb2-ce2a-c17d4b22a078@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2022/9/30 14:09, Christophe Leroy wrote:
> 
> 
> Le 01/09/2022 à 10:54, ruanjinjie a écrit :
>> [Vous ne recevez pas souvent de courriers de ruanjinjie@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> When build Linux kernel, encounter the following warnings:
>>
>> ./arch/powerpc/sysdev/mpic_msgr.c:230:38: warning: cast removes address space '__iomem' of expression
>> ./arch/powerpc/sysdev/mpic_msgr.c:230:27: warning: incorrect type in assignment (different address spaces)
>>
>> The data type of msgr->mer and msgr->base are 'u32 __iomem *', but
>> converted to 'u32 *' and 'u8 *' directly and cause above warnings, now
>> recover their data types to fix these warnings.
> 
> I think the best would be to change MPIC_MSGR_MER_OFFSET to 0x40 and 
> then drop the casts completely:
> 
> 	msgr->mer = msgr->base + MPIC_MSGR_MER_OFFSET;
> 
I think this is good to solve the warning.

>>
>> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
>> ---
>>   arch/powerpc/sysdev/mpic_msgr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
>> index 698fefaaa6dd..cbb0d24f15ba 100644
>> --- a/arch/powerpc/sysdev/mpic_msgr.c
>> +++ b/arch/powerpc/sysdev/mpic_msgr.c
>> @@ -227,7 +227,7 @@ static int mpic_msgr_probe(struct platform_device *dev)
>>
>>                  reg_number = block_number * MPIC_MSGR_REGISTERS_PER_BLOCK + i;
>>                  msgr->base = msgr_block_addr + i * MPIC_MSGR_STRIDE;
>> -               msgr->mer = (u32 *)((u8 *)msgr->base + MPIC_MSGR_MER_OFFSET);
>> +               msgr->mer = (u32 __iomem *)((u8 __iomem *)msgr->base + MPIC_MSGR_MER_OFFSET);
>>                  msgr->in_use = MSGR_FREE;
>>                  msgr->num = i;
>>                  raw_spin_lock_init(&msgr->lock);
>> --
>> 2.25.1
