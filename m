Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532507CED95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 03:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9qnR22DHz3vXF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 12:26:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yiyang13@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9qmt3c7Yz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 12:26:17 +1100 (AEDT)
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S9qh11GNJzNp24;
	Thu, 19 Oct 2023 09:22:09 +0800 (CST)
Received: from [10.67.110.164] (10.67.110.164) by
 kwepemm000014.china.huawei.com (7.193.23.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 19 Oct 2023 09:26:08 +0800
Subject: Re: [PATCH] mtd: powernv_flash: check return value of
 devm_kasprintf()
To: Michael Ellerman <mpe@ellerman.id.au>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <u.kleine-koenig@pengutronix.de>,
	<tudor.ambarus@linaro.org>, <robh@kernel.org>
References: <20231018092728.315071-1-yiyang13@huawei.com>
 <874jin76ou.fsf@mail.lhotse>
From: "yiyang (D)" <yiyang13@huawei.com>
Message-ID: <0aa58cef-182a-ba75-d362-822d434c67d3@huawei.com>
Date: Thu, 19 Oct 2023 09:26:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <874jin76ou.fsf@mail.lhotse>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.164]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000014.china.huawei.com (7.193.23.6)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/10/19 9:16, Michael Ellerman wrote:
> Yi Yang <yiyang13@huawei.com> writes:
>> The devm_kasprintf() returns a pointer to dynamically allocated memory.
>> that will return NULL when allocate failed.
>> Fix it by check return value of devm_kasprintf().
>>
>> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
>> ---
>>   drivers/mtd/devices/powernv_flash.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
>> index 66044f4f5bad..b305e555ddbf 100644
>> --- a/drivers/mtd/devices/powernv_flash.c
>> +++ b/drivers/mtd/devices/powernv_flash.c
>> @@ -207,6 +207,10 @@ static int powernv_flash_set_driver_info(struct device *dev,
>>   	 * get them
>>   	 */
>>   	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
>> +	if (mtd->name) {
> 
> That seems like the wrong check?
> 
> cheers
> 
You're right, I'm fixing this in v2 patch.

Thanks,
Yi Yang

>> +		dev_err(dev, "failed to allocate mtd->name\n");
>> +		return -ENOMEM;
>> +	}
>>   	mtd->type = MTD_NORFLASH;
>>   	mtd->flags = MTD_WRITEABLE;
>>   	mtd->size = size;
>> -- 
>> 2.25.1
> .
> 

