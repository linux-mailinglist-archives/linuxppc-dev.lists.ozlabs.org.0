Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25650695E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 13:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjLWP0Kzdz3bZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 21:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iNT0C27i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iNT0C27i; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjLVh2dcvz2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 21:02:35 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id i24so939767pfa.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HPfHlnZW/J0QTwj9E3rSjp2CIkBFwM3rHUP6G621yX8=;
 b=iNT0C27iILY9yMw5fp4m8wrEpS19RdildApUUoPCMPAggfUSWjI1IBVhyVlsj70CLT
 L6utqZiifJMNTICWPPPHkUgizjX90tPr2zB5nu5K+9NmjVyYf1isJUD4lltfeoMMH0ni
 w+2p5Mp7SlPaWD7g+dvinXp0qtpW1YfIqFjcf1yXGYxmiWV2pYuDgydI5EtEnxa/eTYn
 q6nBgoXFRO5EdNI3PRrAv9w8euU/aAOiB0cCwokJBoAn1jwn2eqjQ/RDHEQQaV22zeGM
 fcT4jHPZP0e7NSi2CDpJ9TgGVjAfzWAXYIanuvR8OIkbRlckhD5OhuGPXRrBV1fdNl1f
 KrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HPfHlnZW/J0QTwj9E3rSjp2CIkBFwM3rHUP6G621yX8=;
 b=wLd09OO4wUTROhbuiD5JoS5y1m3AmK1bSATqtF8Hkr7xPHW6mW1RQ9SNUrUcuU4W8r
 /QMc1Nj4e2wlOTZGJvY+Doj5y8/X3BUEzdCz0RF2PtdiX3pRY9+kYE0hoTlsqygJfXuX
 KZqiEJFeg4Zxee0dXoFwBoXHqe+6ytdrFFyhB5qus9tyS/eyz9XISuNbV3LTsL7GEDPv
 59u9+zweVRnaPxXtXJ+PlrfnoUEBMhOfpBoKcnMIwgF3Hmk4IGUWt2Jb8YtaB0/KMo2k
 tbjVGPVZOuHBFfaxbc1+/6W/tfA4dyp+w/K16olWOIlpeGAcESaJ6VUeOMsS4QUD4yv6
 cK/A==
X-Gm-Message-State: AOAM533/tGpHHF8jtcv/eczugzwnREA9LaQfmCZU8QdlFkrANlobrsTW
 GV40lj05POVPS4wm66i3F6U=
X-Google-Smtp-Source: ABdhPJw2iYD4KBeGw1t2OjioGfEiU3FCIpVJNOBj87m8tve6GdGwt06U40Bh5rLvaoS3a/5BfnkHrw==
X-Received: by 2002:a63:1510:0:b0:39d:7212:8500 with SMTP id
 v16-20020a631510000000b0039d72128500mr13534063pgl.377.1650366150920; 
 Tue, 19 Apr 2022 04:02:30 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 ch10-20020a056a00288a00b0050a51a95e91sm10386370pfb.201.2022.04.19.04.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 04:02:30 -0700 (PDT)
Message-ID: <0da7b5da-6fab-ab73-5748-ae270d77b4d0@gmail.com>
Date: Tue, 19 Apr 2022 19:02:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] misc: ocxl: fix possible double free in
 ocxl_file_register_afu
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, ajd@linux.ibm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, mpe@ellerman.id.au,
 alastair@d-silva.org
References: <20220418085758.38145-1-hbh25y@gmail.com>
 <e18a4b58-4551-aa68-ed52-baeeeaab56bb@linux.ibm.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <e18a4b58-4551-aa68-ed52-baeeeaab56bb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/4/19 17:09, Frederic Barrat wrote:
> 
> 
> On 18/04/2022 10:57, Hangyu Hua wrote:
>> info_release() will be called in device_unregister() when info->dev's
>> reference count is 0. So there is no need to call ocxl_afu_put() and
>> kfree() again.
>>
>> Fix this by adding free_minor() and return to err_unregister error path.
>>
>> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl 
>> backend & frontend")
>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>> ---
> 
> 
> Thanks for fixing that error path!
> I'm now thinking it would be cleaner to have the call to free_minor() in 
> the info_release() callback but that would be another patch.
> In any case:
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
>    Fred
> 

I think it is a good idea to use callbacks to handle all garbage 
collections. And free_minor is used only in ocxl_file_register_afu() 
andocxl_file_unregister_afu(). So this should only require minor changes.

Thanks.

> 
>>   drivers/misc/ocxl/file.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
>> index d881f5e40ad9..6777c419a8da 100644
>> --- a/drivers/misc/ocxl/file.c
>> +++ b/drivers/misc/ocxl/file.c
>> @@ -556,7 +556,9 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>>   err_unregister:
>>       ocxl_sysfs_unregister_afu(info); // safe to call even if 
>> register failed
>> +    free_minor(info);
>>       device_unregister(&info->dev);
>> +    return rc;
>>   err_put:
>>       ocxl_afu_put(afu);
>>       free_minor(info);
