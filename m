Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799F25191C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 15:00:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbTcW604CzDqLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 23:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbTY63D7QzDqGx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 22:57:28 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0DE891BA80540EF3079A;
 Tue, 25 Aug 2020 20:57:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.103) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 25 Aug 2020 20:57:15 +0800
Subject: Re: [PATCH 1/2] ASoC: fsl: imx-es8328: add missing kfree() call in
 imx_es8328_probe()
To: Mark Brown <broonie@kernel.org>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
 <20200825120531.1479304-2-yukuai3@huawei.com>
 <20200825121102.GF5379@sirena.org.uk>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <4b0147df-b773-6c04-ff08-0bbc8b668f5f@huawei.com>
Date: Tue, 25 Aug 2020 20:57:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200825121102.GF5379@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.103]
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 yi.zhang@huawei.com, festevam@gmail.com, s.hauer@pengutronix.de,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 linux-imx@nxp.com, kernel@pengutronix.de, yukuai@huawei.com,
 shawnguo@kernel.org, xobs@kosagi.com, shengjiu.wang@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2020/08/25 20:11, Mark Brown wrote:
> On Tue, Aug 25, 2020 at 08:05:30PM +0800, Yu Kuai wrote:
>> If memory allocation for 'data' or 'comp' succeed, imx_es8328_probe()
>> doesn't have corresponding kfree() in exception handling. Thus add
>> kfree() for this function implementation.
> 
>> @@ -151,7 +151,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
>>   	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
>>   	if (!comp) {
> 
> The allocation is being done using devm_ which means no explicit kfree()
> is needed, the allocation will be automatically unwound when the device
> is unbound.

Hi,

Thanks for pointing it out, I'll remove this patch.

Best regards,
Yu Kuai

