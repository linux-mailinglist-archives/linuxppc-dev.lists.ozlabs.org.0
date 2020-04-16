Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B51AB7C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:13:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492pmy39MTzDqx6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=O8oy2RFi; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492pXk5pW8zDrMX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 16:02:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492pXf3l6tz9tymJ;
 Thu, 16 Apr 2020 08:02:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=O8oy2RFi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g-FuaxY7oTtY; Thu, 16 Apr 2020 08:02:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492pXf1zxrz9tymG;
 Thu, 16 Apr 2020 08:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587016946; bh=hTy16bHLpfNFXF319tqIwS+sWuGHucopXVc/QbhW67s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O8oy2RFimIrYMQU6MOhSUDlpsJHr6m+uld+wQJw+BGfDvNaWMNnWU+tE2HxDT1tk1
 1ljd3fzGwO/8xVpaMoG2PvW+zrCn+JLLj60PI5Qlvlu9SS1pYu+IX+ZrGDva/4xAjI
 6lrUGp1uXE7zJW2a9klM0meDl1MZZMq4InFtJ2rc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A4388B778;
 Thu, 16 Apr 2020 08:02:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s9h0hRILTj-Q; Thu, 16 Apr 2020 08:02:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 87A7E8B756;
 Thu, 16 Apr 2020 08:02:26 +0200 (CEST)
Subject: Re: [PATCH v2,5/5] drivers: uio: new driver for fsl_85xx_cache_sram
To: Wang Wenhu <wenhu.wang@vivo.com>
References: <37b6b890-e537-7424-6b26-04565681f40a@c-s.fr>
 <20200416052247.112887-1-wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <99ae46c0-1160-6ad2-e426-6dcc9191ab41@c-s.fr>
Date: Thu, 16 Apr 2020 08:02:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416052247.112887-1-wenhu.wang@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, oss@buserror.net, kernel@vivo.com,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/04/2020 à 07:22, Wang Wenhu a écrit :
> Yes, kzalloc() would clean the allocated areas and the init of remaining array
> elements are redundant. I will remove the block in v3.
> 
>>>> +		dev_err(&pdev->dev, "error no valid uio-map configured\n");
>>>> +		ret = -EINVAL;
>>>> +		goto err_info_free_internel;
>>>> +	}
>>>> +
>>>> +	info->version = "0.1.0";
>>>
>>> Could you define some DRIVER_VERSION in the top of the file next to
>>> DRIVER_NAME instead of hard coding in the middle on a function ?
>>
>> That's what v1 had, and Greg KH said to remove it.  I'm guessing that he
>> thought it was the common-but-pointless practice of having the driver print a
>> version number that never gets updated, rather than something the UIO API
>> (unfortunately, compared to a feature query interface) expects.  That said,
>> I'm not sure what the value is of making it a macro since it should only be
>> used once, that use is self documenting, it isn't tunable, etc.  Though if
>> this isn't a macro, UIO_NAME also shouldn't be (and if it is made a macro
>> again, it should be UIO_VERSION, not DRIVER_VERSION).
>>
>> Does this really need a three-part version scheme?  What's wrong with a
>> version of "1", to be changed to "2" in the hopefully-unlikely event that the
>> userspace API changes?  Assuming UIO is used for this at all, which doesn't
>> seem like a great fit to me.
>>
>> -Scott
>>
> 
> As Scott mentioned, the version define as necessity by uio core but actually
> useless for us here(and for many other type of devices I guess). So maybe the better
> way is to set it optionally, but this belong first to uio core.
> 
> For the cache-sram uio driver, I will define an UIO_VERSION micro as a compromise
> fit all wonders, no confusing as Greg first mentioned.

Yes I like it.

> 
>>> +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
>>> +	{	.compatible = "uio,fsl,p2020-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p2010-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1020-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1011-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1013-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1022-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,mpc8548-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,mpc8544-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,mpc8572-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,mpc8536-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1021-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1012-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1025-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1016-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1024-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1015-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,p1010-l2-cache-controller",	},
>>> +	{	.compatible = "uio,fsl,bsc9131-l2-cache-controller",	},
>>> +	{},
>>> +};
>>
>> NACK
>>
>> The device tree describes the hardware, not what driver you want to bind the
>> hardware to, or how you want to allocate the resources.  And even if defining
>> nodes for sram allocation were the right way to go, why do you have a separate
>> compatible for each chip when you're just describing software configuration?
>>
>> Instead, have module parameters that take the sizes and alignments you'd like
>> to allocate and expose to userspace.  Better still would be some sort of
>> dynamic allocation (e.g. open a fd, ioctl to set the requested size/alignment,
>> if it succeeds you can mmap it, and when the fd is closed the region is
>> freed).
>>
>> -Scott
>>
> 
> Can not agree more. But what if I want to define more than one cache-sram uio devices?
> How about use the device tree for pseudo uio cache-sram driver?
> 
> static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> 	{	.compatible = "uio,cache-sram",	},
> 	{},
> };
> 

You can still give it a name in line with your driver, ie: 
"uio,mpc85xx-cache-sram"

After, it you have different behaviours depending on the compatible, 
then you have to add a .data field which will tell the driver which 
behaviour to implement.

Christophe
