Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF29366695
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 09:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQCZh5L4Sz30Gb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 17:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.56;
 helo=out30-56.freemail.mail.aliyun.com;
 envelope-from=jiapeng.chong@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQCZM4D0Rz2xZN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 17:57:12 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0UWHHbmP_1618991814; 
Received: from 30.0.161.206(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UWHHbmP_1618991814) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 21 Apr 2021 15:56:55 +0800
Subject: Re: [PATCH] soc: fsl: qe: remove unused function
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1618475663-100748-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <87blaeg1ig.fsf@linkitivity.dja.id.au>
 <76468b5b-0eb0-8772-b7b5-21bb708aa053@csgroup.eu>
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Message-ID: <fafbfcb2-e9d7-4992-a104-1523039807f9@linux.alibaba.com>
Date: Wed, 21 Apr 2021 15:56:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <76468b5b-0eb0-8772-b7b5-21bb708aa053@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/4/16 15:06, Christophe Leroy wrote:
> 
> 
> Le 16/04/2021 à 08:57, Daniel Axtens a écrit :
>> Hi Jiapeng,
>>
>>> Fix the following clang warning:
> 
> You are not fixing a warning, you are removing a function in order to 
> fix a warning ...
> 
>>>
>>> drivers/soc/fsl/qe/qe_ic.c:234:29: warning: unused function
>>> 'qe_ic_from_irq' [-Wunused-function].
> 
> Would be wise to tell that the last users of the function where removed 
> by commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* 
> functions")
> 
> https://github.com/torvalds/linux/commit/d7c2878cfcfa
> 
>>>
>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>>> ---
>>>   drivers/soc/fsl/qe/qe_ic.c | 5 -----
>>>   1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
>>> index 0390af9..b573712 100644
>>> --- a/drivers/soc/fsl/qe/qe_ic.c
>>> +++ b/drivers/soc/fsl/qe/qe_ic.c
>>> @@ -231,11 +231,6 @@ static inline void qe_ic_write(__be32  __iomem 
>>> *base, unsigned int reg,
>>>       qe_iowrite32be(value, base + (reg >> 2));
>>>   }
>>> -static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>>> -{
>>> -    return irq_get_chip_data(virq);
>>> -}
>>
>> This seems good to me.
>>
>>   * We know that this function can't be called directly from outside the
>>    file, because it is static.
>>
>>   * The function address isn't used as a function pointer anywhere, so
>>     that means it can't be called from outside the file that way (also
>>     it's inline, which would make using a function pointer unwise!)
>>
>>   * There's no obvious macros in that file that might construct the name
>>     of the function in a way that is hidden from grep.
>>
>> All in all, I am fairly confident that the function is indeed not used.
>>
>> Reviewed-by: Daniel Axtens <dja@axtens.net>
>>
>> Kind regards,
>> Daniel
>>
>>> -
>>>   static inline struct qe_ic *qe_ic_from_irq_data(struct irq_data *d)
>>>   {
>>>       return irq_data_get_irq_chip_data(d);
>>> -- 
>>> 1.8.3.1
Hi,
I will follow the advice and send V2 later.
