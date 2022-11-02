Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1DC616429
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 14:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2T4D1sQXz3dsB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2T3Z1wDPz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 00:57:27 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N2T032D9hzJnCj;
	Wed,  2 Nov 2022 21:54:27 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:57:21 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:57:20 +0800
Subject: Re: [PATCH v2] powerpc/fsl_rio: add missing of_node_put() in
 fsl_rio_setup()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20221029122600.1514280-1-yangyingliang@huawei.com>
 <158f0d2c-9c05-7b38-693c-428bc7e77acf@csgroup.eu>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <8301341b-9c08-5db3-9445-9cee518f3f18@huawei.com>
Date: Wed, 2 Nov 2022 21:57:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158f0d2c-9c05-7b38-693c-428bc7e77acf@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: "b24347@freescale.com" <b24347@freescale.com>, yangyingliang@huawei.com, "npiggin@gmail.com" <npiggin@gmail.com>, "alexandre.bounine@idt.com" <alexandre.bounine@idt.com>, "Gang.Liu@freescale.com" <Gang.Liu@freescale.com>, "alak@kernel.crashing.org" <alak@kernel.crashing.org>, "leoli@freescale.com" <leoli@freescale.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/11/2 21:45, Christophe Leroy wrote:
>
> Le 29/10/2022 à 14:26, Yang Yingliang a écrit :
>> The of node returned by of_find_compatible_node() or for_each_child_of_node()
>> with refcount decremented, of_node_put() need be called after using it to avoid
>> refcount leak.
> Is that necessary to do of_node_put() so often ? Can't it be done
> exclusively on the error exit path ?
The 'np' is assigned by three different of nodes in this function, in 
its error and
normal path after using, it should be put, so it looks used so often. 
And I think
it's no better way to make it less used.

Thanks,
Yang
>
>> Fixes: abc3aeae3aaa ("fsl-rio: Add two ports and rapidio message units support")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>> v1 -> v2:
>>     Add fix tag.
>> v1 patch link:
>>     https://lore.kernel.org/lkml/20220615032137.1878219-1-yangyingliang@huawei.com/
>> ---
>>    arch/powerpc/sysdev/fsl_rio.c | 6 ++++++
>>    1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
>> index c8f044d62fe2..1b0be4931f18 100644
>> --- a/arch/powerpc/sysdev/fsl_rio.c
>> +++ b/arch/powerpc/sysdev/fsl_rio.c
>> @@ -553,6 +553,7 @@ int fsl_rio_setup(struct platform_device *dev)
>>    		rc = -ENOMEM;
>>    		goto err_pw;
>>    	}
>> +	of_node_put(np);
>>    	range_start = of_read_number(dt_range, aw);
>>    	dbell->dbell_regs = (struct rio_dbell_regs *)(rmu_regs_win +
>>    				(u32)range_start);
>> @@ -581,6 +582,7 @@ int fsl_rio_setup(struct platform_device *dev)
>>    		rc = -ENOMEM;
>>    		goto err;
>>    	}
>> +	of_node_put(np);
>>    	range_start = of_read_number(dt_range, aw);
>>    	pw->pw_regs = (struct rio_pw_regs *)(rmu_regs_win + (u32)range_start);
>>    
>> @@ -590,6 +592,7 @@ int fsl_rio_setup(struct platform_device *dev)
>>    		if (!port_index) {
>>    			dev_err(&dev->dev, "Can't get %pOF property 'cell-index'\n",
>>    					np);
>> +			of_node_put(np);
>>    			continue;
>>    		}
>>    
>> @@ -597,6 +600,7 @@ int fsl_rio_setup(struct platform_device *dev)
>>    		if (!dt_range) {
>>    			dev_err(&dev->dev, "Can't get %pOF property 'ranges'\n",
>>    					np);
>> +			of_node_put(np);
>>    			continue;
>>    		}
>>    
>> @@ -619,6 +623,7 @@ int fsl_rio_setup(struct platform_device *dev)
>>    
>>    		dev_info(&dev->dev, "%pOF: LAW start 0x%016llx, size 0x%016llx.\n",
>>    				np, range_start, range_size);
>> +		of_node_put(np);
>>    
>>    		port = kzalloc(sizeof(struct rio_mport), GFP_KERNEL);
>>    		if (!port)
>> @@ -763,6 +768,7 @@ int fsl_rio_setup(struct platform_device *dev)
>>    err_dbell:
>>    	iounmap(rmu_regs_win);
>>    	rmu_regs_win = NULL;
>> +	of_node_put(np);
>>    err_rmu:
>>    	kfree(ops);
>>    err_ops:
