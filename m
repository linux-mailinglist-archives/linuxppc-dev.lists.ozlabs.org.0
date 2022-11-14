Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED799627CC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 12:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9nbk5TvMz3f3V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 22:47:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9nbB0x9Dz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 22:46:45 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N9nWT3tCSzJnhw;
	Mon, 14 Nov 2022 19:43:33 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 19:46:40 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 19:46:39 +0800
Subject: Re: [PATCH] misc: ocxl: fix possible name leak in
 ocxl_file_register_afu()
To: Frederic Barrat <fbarrat@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20221111145929.2429271-1-yangyingliang@huawei.com>
 <78108ace-2bd5-5745-36e5-98f7294ae3f2@linux.ibm.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <1d06da75-e18c-8a0c-4900-f13adfa74a9f@huawei.com>
Date: Mon, 14 Nov 2022 19:46:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <78108ace-2bd5-5745-36e5-98f7294ae3f2@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Cc: gregkh@linuxfoundation.org, ajd@linux.ibm.com, arnd@arndb.de, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2022/11/14 19:23, Frederic Barrat wrote:
>
>
> On 11/11/2022 15:59, Yang Yingliang wrote:
>> If device_register() returns error in ocxl_file_register_afu(),
>> the name allocated by dev_set_name() need be freed. As comment
>> of device_register() says, it should use put_device() to give
>> up the reference in the error path. So fix this by calling
>> put_device(), then the name can be freed in kobject_cleanup(),
>> and info is freed in info_release().
>>
>> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl 
>> backend & frontend")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/misc/ocxl/file.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
>> index d46dba2df5a1..452d5777a0e4 100644
>> --- a/drivers/misc/ocxl/file.c
>> +++ b/drivers/misc/ocxl/file.c
>> @@ -541,8 +541,11 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>>           goto err_put;
>>         rc = device_register(&info->dev);
>> -    if (rc)
>> -        goto err_put;
>> +    if (rc) {
>> +        free_minor(info);
>> +        put_device(&info->dev);
>> +        return rc;
>> +    }
>
>
> While I agree that a put_device() is needed on that error path, the 
> fix above is not correct as it forgets to release the afu reference 
> and the memory allocated in info. That was taken care of by the jump 
> to the err_put label, so it should be kept. Something like:
>
> -    if (rc)
> +    if (rc) {
> +        put_device((&info->dev);
>          goto err_put;
> +    }
The 'info' and the reference is released in info_release().

Here is call chain:
put_device()
   kobject_release()
     kobject_cleanup()
       device_release()
         info_release()

static void info_release(struct device *dev)
{
         struct ocxl_file_info *info = container_of(dev, struct 
ocxl_file_info, dev);

         ocxl_afu_put(info->afu);
         kfree(info);
}
So it don't need jump to the error label in this case.

Thanks,
Yang
>
>
>   Fred
>
> .
