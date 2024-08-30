Return-Path: <linuxppc-dev+bounces-780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C529655A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3RM2rbFz2xdR;
	Fri, 30 Aug 2024 13:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724988271;
	cv=none; b=j5k9Cp3x3VSDFgjX2cpY36avyIuU26hpWzpyHJyn54jgJN7OQR8YTHNjam67epLzZjR+3G8WyCRPnLA6h7n20jLSz4XK8kIQl0Lm8a3IsES7zy9FjAy18wiqsYhg9wreKng4KioNJeEO7QzVirvLd5Tkr05Ab1S3JzDmcRlYwDacVQ2llE25MdPCp429xnh3jce1CVlfTAmHKKkP5oy8BcluN9G5TLrMk+ZpQ8bQljWV6t7Me4FI6YYMVON0XhPkruYYyRznHVo8DMgCL5BMqlT/3kRdjcwgCELam01j5RHXPAkTWoYdjUqylYwittlpqLuib3bDAR4t6RW3IYZaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724988271; c=relaxed/relaxed;
	bh=jskhEYFO4dWDo1eZB85w7KcqzQ+vXVwGLas81DDHsWk=;
	h=Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy; b=L8taoMB5kOD6Ob2T0MXah2nuQs5KoLB8UFkzIBqXLJunCUiRZ1Xy/bEPvxO/HliJDniGTNJMyL6zUEdDrlvPsgN6QCoffMzts8oQ4yUAyqTb44ScV3NXha8nCYvquQ+/k9uDsPkOyRXgkPwZAHP27ZUDeFkVIVOi/E2DEJzKrhc4Puyt0iYwvo+BlNR8KbXChv3J/Y2/laTpKYPVJg2rstZ9zDhIH+4jjoFtQWx4/gBTY9b26OEGEtGs1zUWZWpOMCaQ7gt8LirvOpODO8p0KM24tEMV2FYIXzv0J6qJrWkge86GaG5Oe+ieFDBxN9H+JWqudkZjVkQ/h5iyzm96mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3RL03qPz2xYq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:24:24 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ww3Ng2NFkzLqyG;
	Fri, 30 Aug 2024 11:22:11 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 09DCE140202;
	Fri, 30 Aug 2024 11:24:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 11:24:14 +0800
Message-ID: <598efadd-da27-0be3-6d1c-dee50e71c811@huawei.com>
Date: Fri, 30 Aug 2024 11:24:14 +0800
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
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with scoped
 for each OF child loop
Content-Language: en-US
To: Kousik Sanagavarapu <five231003@gmail.com>
CC: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<christophe.jaillet@wanadoo.fr>, <ulf.hansson@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
	<krzk@kernel.org>, <jic23@kernel.org>
References: <ZtCapIwWZolY7oMH@five231003>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZtCapIwWZolY7oMH@five231003>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/29 23:58, Kousik Sanagavarapu wrote:
> Jinjie Ruan <ruanjinjie@huawei.com> writes:
>> @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
>>  {
>>  	struct device *dev = kdev->dev;
>>  	struct knav_region *region;
>> -	struct device_node *child;
>>  	u32 temp[2];
>>  	int ret;
>>  
>> -	for_each_child_of_node(regions, child) {
>> +	for_each_child_of_node_scoped(regions, child) {
> 
> Are you sure using *_scoped() is better here?  Since it seems that we
> need the memory pointed to by "child" in cases where we don't go into an
> error path.

Hi, Jonathan, could you help review this code?

> 
>>  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
>> -		if (!region) {
>> -			of_node_put(child);
>> -			dev_err(dev, "out of memory allocating region\n");
>> -			return -ENOMEM;
>> -		}
>> +		if (!region)
>> +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
>>  
>>  		region->name = knav_queue_find_name(child);
>>  		of_property_read_u32(child, "id", &region->id);
> 
> Similarly in most of the other cases in this series where a similar
> change is done.
> 
> Also FYI, as for dev_err_probe(), I think I covered all of them in this
> file and a patch for it is currently sitting in ti-drivers-soc-next.
> 
> Thanks

