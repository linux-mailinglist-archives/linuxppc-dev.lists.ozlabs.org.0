Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B712C7EB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 08:30:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckxj43NqlzDr28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=miaoqinglang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkxgB6K0dzDr1x
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 18:28:54 +1100 (AEDT)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CkxfW4GWzzhkS2;
 Mon, 30 Nov 2020 15:28:19 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 15:28:39 +0800
Subject: Re: [PATCH 2/3] powerpc/pseries/hotplug-cpu: fix memleak in
 dlpar_cpu_add_by_count
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
References: <20201128102001.95323-1-miaoqinglang@huawei.com>
 <871rgby5lb.fsf@mpe.ellerman.id.au>
From: Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <b74f479e-e68b-d8e6-d11c-2611bd4e8a20@huawei.com>
Date: Mon, 30 Nov 2020 15:28:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <871rgby5lb.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.149]
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



ÔÚ 2020/11/30 9:51, Michael Ellerman Ð´µÀ:
> Qinglang Miao <miaoqinglang@huawei.com> writes:
>> kfree(cpu_drcs) should be called when it fails to perform
>> of_find_node_by_path("/cpus") in dlpar_cpu_add_by_count,
>> otherwise there would be a memleak.
>>
>> In fact, the patch a0ff72f9f5a7 ought to remove kfree in
>> find_dlpar_cpus_to_add rather than dlpar_cpu_add_by_count.
>> I guess there might be a mistake when apply that one.
>>
>> Fixes: a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error path")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
>> ---
>>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> This is already fixed in my next by:
> 
>    a40fdaf1420d ("Revert "powerpc/pseries/hotplug-cpu: Remove double free in error path"")
> 
> cheers'Revert' sounds resonable to this one, glad to know that.
> 
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> index f2837e33b..4bb1c9f2b 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -743,6 +743,7 @@ static int dlpar_cpu_add_by_count(u32 cpus_to_add)
>>   	parent = of_find_node_by_path("/cpus");
>>   	if (!parent) {
>>   		pr_warn("Could not find CPU root node in device tree\n");
>> +		kfree(cpu_drcs);
>>   		return -1;
>>   	}
>>   
>> -- 
>> 2.23.0
> .
> 
