Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88E106EF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 12:13:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KDMJ6ym7zDrJs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 22:13:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=chenwandun@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 925 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Nov 2019 22:09:07 AEDT
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KDFv2zw5zDrGG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 22:09:03 +1100 (AEDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8E4B590A9B10BA22F71E;
 Fri, 22 Nov 2019 18:53:30 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 22 Nov 2019 18:53:27 +0800
Subject: Re: [PATCH] powerpc/pseries: remove variable 'status' set but not used
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <mahesh@linux.vnet.ibm.com>,
 <paulus@samba.org>
References: <1573873650-62511-1-git-send-email-chenwandun@huawei.com>
 <87blt8csyx.fsf@mpe.ellerman.id.au>
 <b1591f1d-ddd6-1cd5-afd6-c42eb4671a03@linux.ibm.com>
From: Chen Wandun <chenwandun@huawei.com>
Message-ID: <dec2820f-dfb5-49a8-63fb-f75a3f469ba1@huawei.com>
Date: Fri, 22 Nov 2019 18:53:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b1591f1d-ddd6-1cd5-afd6-c42eb4671a03@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.225]
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

OK, I will make a modification and repost the patch.

Thanks
Chen Wandun

On 2019/11/21 5:34, Tyrel Datwyler wrote:
> On 11/18/19 9:53 PM, Michael Ellerman wrote:
>> Chen Wandun <chenwandun@huawei.com> writes:
>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>
>>> arch/powerpc/platforms/pseries/ras.c: In function ras_epow_interrupt:
>>> arch/powerpc/platforms/pseries/ras.c:319:6: warning: variable status set but not used [-Wunused-but-set-variable]
>>
>> Thanks for the patch.
>>
>> But it almost certainly is wrong to not check the status.
> 
> Agreed, I started drafting a NACK response, but got sidetracked.
> 
>>
>> It's calling firmware and just assuming that the call succeeded. It then
>> goes on to use the result that should have been written by firmware, but
>> is now potentially random junk.
>>
>> So I'd much rather a patch to change it to check the status.
> 
> +1
> 
>>
>>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>>> index 1d7f973..4a61d0f 100644
>>> --- a/arch/powerpc/platforms/pseries/ras.c
>>> +++ b/arch/powerpc/platforms/pseries/ras.c
>>> @@ -316,12 +316,11 @@ static irqreturn_t ras_hotplug_interrupt(int irq, void *dev_id)
>>>   /* Handle environmental and power warning (EPOW) interrupts. */
>>>   static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>>>   {
>>> -	int status;
>>>   	int state;
>>>   	int critical;
>>>   
>>> -	status = rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
>>> -				      &state);
>>> +	rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
>>> +			     &state);
>>
>> This is calling a helper which already does some translation of the
>> return value, any value < 0 indicates an error.
> 
> There are three possible architected failures here: Hardware, Non-existant
> sensor, and an DR isolation error which namely would be reported in the status
> as -EIO, -EINVAL, and -EFAULT. Further, the EPOW sensor is required, and is not
> a DR entity so we can never get an -EINVAL or -EFAULT (baring broken firmware).
> This leaves -EIO (HARDWARE_ERROR) and as I mention further down this will
> generate its own error log in response. So, I don't think we need to do any
> reporting here, and just return.
> 
>>
>>> @@ -330,12 +329,12 @@ static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>>>   
>>>   	spin_lock(&ras_log_buf_lock);
>>>   
>>> -	status = rtas_call(ras_check_exception_token, 6, 1, NULL,
>>> -			   RTAS_VECTOR_EXTERNAL_INTERRUPT,
>>> -			   virq_to_hw(irq),
>>> -			   RTAS_EPOW_WARNING,
>>> -			   critical, __pa(&ras_log_buf),
>>> -				rtas_get_error_log_max());
>>> +	rtas_call(ras_check_exception_token, 6, 1, NULL,
>>> +		  RTAS_VECTOR_EXTERNAL_INTERRUPT,
>>> +		  virq_to_hw(irq),
>>> +		  RTAS_EPOW_WARNING,
>>> +		  critical, __pa(&ras_log_buf),
>>> +		  rtas_get_error_log_max());
>>
>> This is directly calling firmware.
>>
>> As documented in LoPAPR, a negative status indicates an error, 0
>> indicates a new error log was found (ie. the function should continue),
>> or 1 there was no error log (ie. nothing to do).
> 
> It is highly unlikely that we will find no new error log since we are processing
> an interrupt that supposedly fired to tell us there is a new one. However, the
> ras_log_buf is never zeroed so in the unlikely case there is no new error log we
> will parse stale data from the previous log. Better safe than sorry and just return.
> 
> In the case of an error the only error code we supposedly can get here is -1
> (HARDWARE_ERROR), and the RTAS handling will generate an error log in response
> to that. So, I don't think we need to report anything here. I would suggest for
> the (status != 0) case that you just return.
> 
> -Tyrel
> 
>>
>> cheers
>>
>>>   	log_error(ras_log_buf, ERR_TYPE_RTAS_LOG, 0);
>>>   
>>> -- 
>>> 2.7.4
> 
> 
> .
> 

