Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3E770D5A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 04:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHn7L6Nfzz3cWd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 12:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHn6l0M5zz2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 12:47:06 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHn202v2RztRsw;
	Sat,  5 Aug 2023 10:43:04 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 5 Aug 2023 10:46:28 +0800
Message-ID: <d510a9be-e026-0ff5-ca69-c03226d46bd9@huawei.com>
Date: Sat, 5 Aug 2023 10:46:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 5/5] USB: usbip: Remove an unnecessary NULL value
Content-Language: en-US
To: shuah <shuah@kernel.org>, <peter.chen@kernel.org>,
	<gregkh@linuxfoundation.org>, <leoyang.li@nxp.com>, <b-liu@ti.com>,
	<valentina.manea.m@gmail.com>, <i@zenithal.me>, <stern@rowland.harvard.edu>,
	<u.kleine-koenig@pengutronix.de>, <aaro.koskinen@iki.fi>,
	<void0red@gmail.com>, <linux-usb@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20230804093253.91647-1-ruanjinjie@huawei.com>
 <20230804093253.91647-6-ruanjinjie@huawei.com>
 <18553400-87e5-831f-322b-57b2e93244a7@kernel.org>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <18553400-87e5-831f-322b-57b2e93244a7@kernel.org>
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



On 2023/8/5 4:09, shuah wrote:
> On 8/4/23 03:32, Ruan Jinjie wrote:
>> The NULL initialization of the pointers assigned by kzalloc() first is
>> not necessary, because if the kzalloc() failed, the pointers will be
>> assigned NULL, otherwise it works as usual. so remove it.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>   drivers/usb/usbip/vudc_dev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
>> index 2bc428f2e261..8e42839e6060 100644
>> --- a/drivers/usb/usbip/vudc_dev.c
>> +++ b/drivers/usb/usbip/vudc_dev.c
>> @@ -489,7 +489,7 @@ static void vudc_device_unusable(struct
>> usbip_device *ud)
>>     struct vudc_device *alloc_vudc_device(int devid)
>>   {
>> -    struct vudc_device *udc_dev = NULL;
>> +    struct vudc_device *udc_dev;
>>         udc_dev = kzalloc(sizeof(*udc_dev), GFP_KERNEL);
>>       if (!udc_dev)
> 
> In addition to this, make a change to return NULL instead
> of going to out.
> 
> if (!udc_dev)
>                 goto out;

Thank you! I'll research it and fix sooner.

> 
> thanks,
> -- Shuah
> 
