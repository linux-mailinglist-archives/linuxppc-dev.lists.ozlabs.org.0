Return-Path: <linuxppc-dev+bounces-6116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6BA31F73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 07:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt88Y5l6Yz2yZ6;
	Wed, 12 Feb 2025 17:50:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739343037;
	cv=none; b=ALoyZv/WPyHh3SX4muBYijAZ5HIW0Qwogz/XMJWl45YrlUq1OojNwZpcu4DX/ysMNGW6t5Vc0dzyLS/4nM8ZjMor8ThlHh5fOM3waltYFpclwfR6WG3wdr+rb0VVc3UQdQo0c0xljvGgCGJMVcSrgZa+9pCkAnmbqaq8GQh8PFvWpF38P/HsPaZkGxRgR2mBT4Hwj+m76sbNOk7Iuyyry6c8N0frGWztSJ4mpKNSDIYOHsTxdZbaXcYG3QBG6T/7qPojyKsbRd5bpqHAAtlclFknd5eYBWM8O4ftZoFawdfq2Dp6tKc4HVj9t9lt0pkM02nDYQ1g57KQejH9fFjjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739343037; c=relaxed/relaxed;
	bh=PbupaWyuGqZE+3IXKhAB1BZ69VNF1rhGN9FRRXf03L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ICP2YU0OIJauqoXEr2INzKiRnYaI8jApenUa73vLuyIPJ6w1srWtvFWtwz/hzqL+TEn5K5iMxgn5VzSFRX3JBkJwhrPBvUr5JVeDvFU7fighB9fu9i0zO+dJgK+P3NDtVv8AHCtFaytCIVMG+G94lboycxIvtaeYKfZjKl/Liw9E5+Kzn2IZ5+GzlbCHms1o+8fCMY3aNT9Z0T9OkwXyLx987o/wY1H43jVKGuZR66bLHIf5yjyaYTdrmczMZlqG+WLuMA/evqCDzyf6v9E5ireG8tdDUwheZ9lKwBYYMmTU3dJvYIUJV8B7lOyDhwrEqugCBydAT6Uw+C/HK25m4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt88X4CGLz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 17:50:34 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Yt8522FTjzRmXD;
	Wed, 12 Feb 2025 14:47:34 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 27CF1140258;
	Wed, 12 Feb 2025 14:50:27 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Feb 2025 14:50:25 +0800
Message-ID: <0b195b8c-6c0c-4cf4-bcc4-ed9a5bd9c0ae@huawei.com>
Date: Wed, 12 Feb 2025 14:50:24 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] net: bcmasp: Add missing of_node_get() before
 of_find_node_by_name()
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>, <robh@kernel.org>,
	<saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-3-zhangzekun11@huawei.com>
 <cb2db0c4-6f3a-4d44-90e5-b37cbe5e66fb@kernel.org>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <cb2db0c4-6f3a-4d44-90e5-b37cbe5e66fb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.82]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/12 13:52, Krzysztof Kozlowski 写道:
> On 07/02/2025 02:31, Zhang Zekun wrote:
>> of_find_node_by_name() will decrease the refcount of the device_node.
>> So, get the device_node before passing to it.
>>
>> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
>> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
>> ---
>>   drivers/net/ethernet/broadcom/asp2/bcmasp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> index a68fab1b05f0..093c8ea72af9 100644
>> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> @@ -1367,7 +1367,7 @@ static int bcmasp_probe(struct platform_device *pdev)
>>   	bcmasp_core_init(priv);
>>   	bcmasp_core_init_filters(priv);
>>   
>> -	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
>> +	ports_node = of_find_node_by_name_balanced(dev->of_node, "ethernet-ports");
> 
> Why this cannot be of_get_child_by_name()?
> 
> Best regards,
> Krzysztof

Thanks for point out. After looking into 
Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml, it should be 
of_get_child_by_name().

Best regards,
Zekun

