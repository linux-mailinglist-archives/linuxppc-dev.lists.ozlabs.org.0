Return-Path: <linuxppc-dev+bounces-628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166F961BA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 03:58:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtndL4LwQz2y7M;
	Wed, 28 Aug 2024 11:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724810326;
	cv=none; b=iZPzBq7AkJsVbSRpaScVaqHUMSMif7W3qoh3n6EKhALqgVaI2G17F9zK4hxwMs0Dh9ZApUo/hKqON+5+4U+4f2HyXW5k3iWbCKAxiGYryGA9Jqnc/itiG5KdFcdF9ijaVYMIVY81MSr/ab/VoCItxlGXs2Hzi/m56BoyBeX7MMYO463cPLLiqcByg/zYLfWNy3wcLvRnPcsfbpqrtKmoLKBym/4k1wKOVL5zkPfkPUMRZg7mDJ+jPxIk1Eq8VnE0lnN/vVSSAA+hXUrs0z/Adfi5aFWd8t5nLBlnvOI2buSHg2a30LxVJf5r+r1oTWFuJfgEYjWe1wfl1vPiFZr+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724810326; c=relaxed/relaxed;
	bh=5sc6J3Ui5qWEXcQEzNbj36Es+HY8dKW4MEYb+d4FCh4=;
	h=Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy; b=DIi/s4WRUIALj7FDtaa5R1QOKZvze8XrLBbjiUGibz7dOxS2jIgtMrelcoJcmYjfXdf2qf3FiOo6J0ljAIN/w/Kwv92XdGQjkTXr2vjJnszBbMfVEC0+tjndUrqGer4oXrW/RJdf5ufj+Ro8CPxN7Av27wmwvo1fWviL5BnlAwHTAXuQLntsVmVJprDgzREyUZlKw4iYr+uQGVhbeN//ZmpuVCEeyoV+a3GGPN8dHTUYpfaTnRdoidYBolH+Tjbp7zDXvjkT5/Uqh8MBtqdPRGGw4zTgmWaColazEbk7lGD43Fh6gbPwrnpFJ59UXawQ8MUIOahIQpaoX4oL81btvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtndK1FH6z2xHR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 11:58:40 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WtnZq5xBbz1xty0;
	Wed, 28 Aug 2024 09:56:35 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E261140135;
	Wed, 28 Aug 2024 09:58:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Aug 2024 09:58:32 +0800
Message-ID: <97ff8c02-1a97-7974-06fa-edb35437707d@huawei.com>
Date: Wed, 28 Aug 2024 09:58:13 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>, <andrew@lunn.ch>,
	<sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
	<herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <nm@ti.com>, <ssantosh@kernel.org>,
	<petlozup@nvidia.com>, <pshete@nvidia.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <jic23@kernel.org>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
 <20240827114607.4019972-3-ruanjinjie@huawei.com>
 <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/27 21:50, Krzysztof Kozlowski wrote:
> On 27/08/2024 13:46, Jinjie Ruan wrote:
>> Use the dev_err_probe() helper to simplify error handling during probe.
>> This also handle scenario, when EDEFER is returned and useless error
>> is printed.
> 
> ? Sorry, this cannot happen. Please point to below code which can defer.
> 

Thank you!

This is not referring to a specific one, but rather the benefits it
offers，simplify code is the main purpose, if necessary, it will be
removed in next version.

>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/soc/fsl/qe/tsa.c | 62 +++++++++++++++-------------------------
>>  1 file changed, 23 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
>> index 7fa399b7a47c..fc37d23b746d 100644
>> --- a/drivers/soc/fsl/qe/tsa.c
>> +++ b/drivers/soc/fsl/qe/tsa.c
>> @@ -453,10 +453,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>>  
>>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
>> -		if (ret) {
>> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>>  		switch (tdm_id) {
>>  		case 0:
>>  			tsa->tdms |= BIT(TSA_TDMA);
>> @@ -465,18 +463,15 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>>  			tsa->tdms |= BIT(TSA_TDMB);
>>  			break;
>>  		default:
>> -			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
>> -				tdm_id);
>> -			return -EINVAL;
>> +			return dev_err_probe(tsa->dev, -EINVAL, "%pOF: Invalid tdm_id (%u)\n",
>> +					     tdm_np, tdm_id);
>>  		}
>>  	}
>>  
>>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
>> -		if (ret) {
>> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>>  
>>  		tdm = &tsa->tdm[tdm_id];
>>  		tdm->simode_tdm = TSA_SIMODE_TDM_SDM_NORM;
>> @@ -484,35 +479,26 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>>  		val = 0;
>>  		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
>>  					   &val);
>> -		if (ret && ret != -EINVAL) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
>> -				tdm_np);
>> -			return ret;
>> -		}
>> -		if (val > 3) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
>> -				tdm_np, val);
>> -			return -EINVAL;
>> -		}
>> +		if (ret && ret != -EINVAL)
>> +			return dev_err_probe(tsa->dev, ret,
>> +					     "%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
>> +					     tdm_np);
>> +		if (val > 3)
>> +			return dev_err_probe(tsa->dev, -EINVAL,
>> +					     "%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
>> +					     tdm_np, val);
>>  		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
>>  
>>  		val = 0;
>>  		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
>>  					   &val);
>> -		if (ret && ret != -EINVAL) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
>> -				tdm_np);
>> -			return ret;
>> -		}
>> -		if (val > 3) {
>> -			dev_err(tsa->dev,
>> -				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
>> -				tdm_np, val);
>> -			return -EINVAL;
>> -		}
>> +		if (ret && ret != -EINVAL)
>> +			return dev_err_probe(tsa->dev, ret,
>> +				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n", tdm_np);
>> +		if (val > 3)
>> +			return dev_err_probe(tsa->dev, -EINVAL,
>> +					     "%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
>> +					     tdm_np, val);
>>  		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
>>  
>>  		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
>> @@ -645,10 +631,8 @@ static int tsa_probe(struct platform_device *pdev)
>>  		return PTR_ERR(tsa->si_regs);
>>  
>>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
>> -	if (!res) {
>> -		dev_err(tsa->dev, "si_ram resource missing\n");
>> -		return -EINVAL;
>> -	}
>> +	if (!res)
>> +		return dev_err_probe(tsa->dev, -EINVAL, "si_ram resource missing\n");
>>  	tsa->si_ram_sz = resource_size(res);
>>  	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
>>  	if (IS_ERR(tsa->si_ram))
> 
> Best regards,
> Krzysztof
> 

