Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BA3642BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:14:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP6jK2JSMz30Ft
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:14:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OWdOkS/H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OWdOkS/H; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP6ht46Ztz2xYc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 23:14:04 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id q136so14683364qka.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vp6TRh47W+W8Mp4RUVmGra3Xea62bVyXoRWBVCyrngw=;
 b=OWdOkS/HxdWIdAcAnplJBZulDRfpQs/3ebfnlstIppBO0TKwzDRfP9d268sXVVtqPX
 u6DdYpA5lslZtVd0hnQW8Ud48GASG/TC3srqjNqAWqdg511BnXJGIpebrVpAVn9tcfmm
 zWQBVOXbQu8gH+hXSaNpc5HjM58Hd9EWdD1A9E54ot4+5tf5enPyF/jXrcro6tm141dY
 F22q9gKE0F+2NE3gGBYGUqpeT8qLHyqpvgMmk4pmUR5j9ooUbMaH2XxcDrSGPHxakQDi
 Zv6Nynob15Lu0LeXYx5izB5R0XejQsRxLlk8tyx/ZUGa89+7prwTS322KzjRvqBH0/0I
 oC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vp6TRh47W+W8Mp4RUVmGra3Xea62bVyXoRWBVCyrngw=;
 b=USnD1AWgtTWTos69oW8SoFUypzDCXsH2tvHC3jkaf1Ov8QGKXvnH6kaVfaeK8txRmN
 xKgFhOU9fuWzAYgwvdxhMxa8ZqwsZ4bxEwDwg84420ppYXtibIB8SERTq7/3vJXCDGW3
 5a/XDoF6+9QiaoZ2O8IE+4r/XYPsaf04N3H0pps+HS2+/ftmjgnKxHhekj7F2Vg+p8w+
 vLSnVJlKfZi1XdPv0f62rV54uVSJ7DEksmtv+HNhQIsDzrikPT0A4v4gKZyLgg7yIhBS
 MVTI6IzjMzh3NKg2oXtgSk/xN+GmCcslz/pjWMzIm3U9N9c311xkwbCdWYdfLVWZbbPD
 YDSg==
X-Gm-Message-State: AOAM531ZPJCe3SFUPTTOGfHHfKQicZ+IIMvDYTEusiel8PkhEP6yvc6b
 I90MpCXUoY3Xm8r+n0OQLGe4EurTKvrBqg==
X-Google-Smtp-Source: ABdhPJzXC8jO6NFtV4W8+dmSFiFBO4b1fRtJd5PJL0YKvS398+wPcYHdpe67KMPQknCjsa5/n+Yfbg==
X-Received: by 2002:a37:910:: with SMTP id 16mr11616698qkj.229.1618838040641; 
 Mon, 19 Apr 2021 06:14:00 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:8811:45c7:4abc:f19a:be81?
 ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id n6sm9054169qtx.22.2021.04.19.06.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 06:14:00 -0700 (PDT)
Subject: Re: [PATCH 2/2] hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove()
 failure
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210416210216.380291-1-danielhb413@gmail.com>
 <20210416210216.380291-3-danielhb413@gmail.com>
 <87v98icuek.fsf@mpe.ellerman.id.au>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <f4d65cf6-08d1-0bcc-cba2-845099a82aa4@gmail.com>
Date: Mon, 19 Apr 2021 10:13:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v98icuek.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/19/21 9:48 AM, Michael Ellerman wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is
>> already UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else
>> for both QEMU and phyp. This gives us an opportunity to use this
>> behavior to signal the hypervisor layer when an error during device
>> removal happens, allowing it to do a proper error handling, while not
>> breaking QEMU/phyp implementations that don't have this support.
>>
>> This patch introduces this idea by unisolating all CPU DRCs that failed
>> to be removed by dlpar_cpu_remove_by_index(), when handling the
>> PSERIES_HP_ELOG_ID_DRC_INDEX event. This is being done for this event
>> only because its the only CPU removal event QEMU uses, and there's no
>> need at this moment to add this mechanism for phyp only code.
> 
> Have you also confirmed that phyp is not bothered by it? ie. everything
> seems to continue working when you trigger this path on phyp.

Yes. Daniel Bueso (dbuesom@us.ibm.com) from the partition firmware team
helped me with that. We confirmed that phyp returns RTAS_OK under these
conditions (Unisolating an unisolated/configured DRC).


Thanks,


DHB

> 
> cheers
> 
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> index 12cbffd3c2e3..ed66895c2f51 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -802,8 +802,15 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
>>   	case PSERIES_HP_ELOG_ACTION_REMOVE:
>>   		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
>>   			rc = dlpar_cpu_remove_by_count(count);
>> -		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
>> +		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
>>   			rc = dlpar_cpu_remove_by_index(drc_index);
>> +			/* Setting the isolation state of an UNISOLATED/CONFIGURED
>> +			 * device to UNISOLATE is a no-op, but the hypervison can
>> +			 * use it as a hint that the cpu removal failed.
>> +			 */
>> +			if (rc)
>> +				dlpar_unisolate_drc(drc_index);
>> +		}
>>   		else
>>   			rc = -EINVAL;
>>   		break;
>> -- 
>> 2.30.2
