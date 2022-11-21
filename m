Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A96256319EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 07:58:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFyrn3xFwz3cLR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 17:58:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFyrD5Pcgz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 17:57:32 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NFyl46XpYzqSYh;
	Mon, 21 Nov 2022 14:53:04 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 14:56:57 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 14:56:57 +0800
Subject: Re: [PATCH] ocxl: fix pci device refcount leak when calling
 get_function_0()
To: Andrew Donnellan <ajd@linux.ibm.com>, <fbarrat@linux.ibm.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>
References: <20221119144433.2454759-1-yangyingliang@huawei.com>
 <b37b30140cefea48e18a44106f53bb8057dec462.camel@linux.ibm.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <f4973a84-9438-7693-95ac-7ef735f126d3@huawei.com>
Date: Mon, 21 Nov 2022 14:56:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b37b30140cefea48e18a44106f53bb8057dec462.camel@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: linuxppc-dev@lists.ozlabs.org, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/11/21 14:31, Andrew Donnellan wrote:
> On Sat, 2022-11-19 at 22:44 +0800, Yang Yingliang wrote:
>> As comment of pci_get_domain_bus_and_slot() says, it returns
>> a pci device with refcount increment, so when finish using it,
>> pci_dev_put() needs be called.
>>
>> In get_dvsec_vendor0(), in normal path, the returned pci device
>> is passed to dev0, so after using dev0 in the callers, it need
>> be put, in error path, pci_dev_put() also needs be called.
>>
>> pci_get_domain_bus_and_slot() is called when PCI_FUNC() returns
>> non-zero, check this before put.
>>
>> Fixes: 87db7579ebd5 ("ocxl: control via sysfs whether the FPGA is
>> reloaded on a link reset")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> It might be neater to take an additional reference on dev in
> get_dvsec_vendor0() in the case where dev is function 0, which would
> mean you could call pci_dev_put() unconditionally in the callers?
Yes, I think it's a better way.
>
> Either way - I think there needs to be a comment above
> get_dvsec_vendor0() documenting when an additional reference needs to
> be released.
I will send a v2 with the above changing.

Thanks,
Yang
>
>> ---
>>   drivers/misc/ocxl/config.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
>> index e401a51596b9..4da5a2b8514c 100644
>> --- a/drivers/misc/ocxl/config.c
>> +++ b/drivers/misc/ocxl/config.c
>> @@ -196,16 +196,21 @@ static int read_dvsec_vendor(struct pci_dev
>> *dev)
>>   static int get_dvsec_vendor0(struct pci_dev *dev, struct pci_dev
>> **dev0,
>>                               int *out_pos)
>>   {
>> +       bool need_put;
>>          int pos;
>>   
>>          if (PCI_FUNC(dev->devfn) != 0) {
>>                  dev = get_function_0(dev);
>>                  if (!dev)
>>                          return -1;
>> +               need_put = true;
>>          }
>>          pos = find_dvsec(dev, OCXL_DVSEC_VENDOR_ID);
>> -       if (!pos)
>> +       if (!pos) {
>> +               if (need_put)
>> +                       pci_dev_put(dev);
>>                  return -1;
>> +       }
>>          *dev0 = dev;
>>          *out_pos = pos;
>>          return 0;
>> @@ -222,6 +227,8 @@ int ocxl_config_get_reset_reload(struct pci_dev
>> *dev, int *val)
>>   
>>          pci_read_config_dword(dev0, pos +
>> OCXL_DVSEC_VENDOR_RESET_RELOAD,
>>                                &reset_reload);
>> +       if (PCI_FUNC(dev->devfn) != 0)
>> +               pci_dev_put(dev0);
>>          *val = !!(reset_reload & BIT(0));
>>          return 0;
>>   }
>> @@ -243,6 +250,8 @@ int ocxl_config_set_reset_reload(struct pci_dev
>> *dev, int val)
>>                  reset_reload &= ~BIT(0);
>>          pci_write_config_dword(dev0, pos +
>> OCXL_DVSEC_VENDOR_RESET_RELOAD,
>>                                 reset_reload);
>> +       if (PCI_FUNC(dev->devfn) != 0)
>> +               pci_dev_put(dev0);
>>          return 0;
>>   }
>>   
