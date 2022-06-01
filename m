Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A70EB53AA61
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCtlf3prrz3byL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 01:45:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aJ0SNzCG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aJ0SNzCG;
	dkim-atps=neutral
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCtky6L8Dz3bY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 01:45:13 +1000 (AEST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-f33f0f5b1dso3218076fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jun 2022 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=CxGPdJ+d3VmCiVOx15dnO86NTnzcGQYc9otHCDK4uKA=;
        b=aJ0SNzCGXtaMFOHq+yCghe0IeO4G9Elty0yPxLB77/+1ujGlHW0sINLxyIjdo63SA3
         JfhoO9EqTsoZDYPbneUjYMp0cnQGRFF8P45SHLX4QE2fsodSq3ZpCnmdKd1lXLEHZqMd
         hN8DY10MGvZPLx8FLIWCoo45PlKN8B6CHw+Gp+MtjjyLT0mPxQOO1W63diVqH6G0WzUY
         +i5unjChkPo5khqc9kxy7PC4Wv83cvrbD3FEahAC0xXDjN7Jie1eRHCE4F//t89AspvD
         Kvq5VNdjEDZm+2duCyA6ViAyDPmdjVC2AUUVWkDiq4piP7gK1O0X0QkaFR8PSJ2NGBNI
         i6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=CxGPdJ+d3VmCiVOx15dnO86NTnzcGQYc9otHCDK4uKA=;
        b=Dwr9jss3Ixs08uwIMPpUULym8VZxku2Chn56jnxYN/Ohs15yl3WfscjiCluZqYOIRV
         SsFwSENBvxmSi+GXIpxuO5W4kjUEnbUpePz1iMv/UfVHejXYbivjodrHech8RUYZzbke
         kQIj40aFNlfq61mE9o6WZo7cnQasV1fHzyFV2s1PS4Koek8vFu/7Wp7rBVwsUrgBD20h
         gH5P2nDiv2mP1JErhs49SNWKmYcevfAzz6f1Xdl0bvHF93Xc3wjHfXbaWsqIrRnZsMjz
         MSYy787VHRPvvjxdud7h1jCW8A4QkEPukmp5bgrnoHgVzsuIoDUGbXub3kE5lfIUo3EY
         CKlg==
X-Gm-Message-State: AOAM532uiyQo35UJ40YvW1zaHahnmwkxUKq+lmN86rkFIzsAk2qm8aO/
	xa2XYuiE/8SvrVK1PbXgwFs=
X-Google-Smtp-Source: ABdhPJz6xXrJ8vF6Af+LhH1lpt9jxSDQvqzDv4qVriyQtAWfN/GaC3ZxdDeWydFQdNcUBQ5XUiKldA==
X-Received: by 2002:a05:6870:65a9:b0:f5:da7a:17d with SMTP id fp41-20020a05687065a900b000f5da7a017dmr39512oab.218.1654098306012;
        Wed, 01 Jun 2022 08:45:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q16-20020a056870e89000b000f337992dfbsm779712oan.53.2022.06.01.08.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 08:45:05 -0700 (PDT)
Message-ID: <a6090ef3-f597-e10b-010b-cc32bff08c93@roeck-us.net>
Date: Wed, 1 Jun 2022 08:45:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Scott Cheloha <cheloha@linux.ibm.com>
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
 <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
 <1f007ad5-8367-9593-bb80-d3564f3cf997@roeck-us.net>
 <YpeArFvOWtk6TQ5r@rascal-austin-ibm-com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
In-Reply-To: <YpeArFvOWtk6TQ5r@rascal-austin-ibm-com>
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/22 08:07, Scott Cheloha wrote:
[ ... ]
>>>> +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
>>>> +
>>>> +static int action_get(char *buf, const struct kernel_param *kp)
>>>> +{
>>>> +    int val;
>>>> +
>>>> +    switch (action) {
>>>> +    case PSERIES_WDTF_ACTION_HARD_POWEROFF:
>>>> +        val = 1;
>>>> +        break;
>>>> +    case PSERIES_WDTF_ACTION_HARD_RESTART:
>>>> +        val = 2;
>>>> +        break;
>>>> +    case PSERIES_WDTF_ACTION_DUMP_RESTART:
>>>> +        val = 3;
>>>> +        break;
>>>> +    default:
>>>> +        return -EINVAL;
>>>> +    }
>>>> +    return sprintf(buf, "%d\n", val);
>>>> +}
>>>> +
>>>> +static int action_set(const char *val, const struct kernel_param *kp)
>>>> +{
>>>> +    int choice;
>>>> +
>>>> +    if (kstrtoint(val, 10, &choice))
>>>> +        return -EINVAL;
>>>> +    switch (choice) {
>>>> +    case 1:
>>>> +        action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
>>>> +        return 0;
>>>> +    case 2:
>>>> +        action = PSERIES_WDTF_ACTION_HARD_RESTART;
>>>> +        return 0;
>>>> +    case 3:
>>>> +        action = PSERIES_WDTF_ACTION_DUMP_RESTART;
>>>> +        return 0;
>>>> +    }
>>>> +    return -EINVAL;
>>>> +}
>>>> +
>>>> +static const struct kernel_param_ops action_ops = {
>>>> +    .get = action_get,
>>>> +    .set = action_set,
>>>> +};
>>>> +module_param_cb(action, &action_ops, NULL, 0444);
>>>
>>>
>>> 0644 here and below?
>>>
>>
>> That would make the module parameters have to be runtime
>> configurable, which does not make sense at least for
>> the two parameters below.
> 
> Agreed.
> 
>> I don't know though if it is really valuable to have all the
>> above code instead of just
>> storing the action numbers and doing the conversion to action
>> once in the probe function. The above code really only
>> makes sense if the action is changeable during runtime and more
>> is done that just converting it to another value.
> 
> Having a setter that runs exactly once during module attach is
> obvious.  We need a corresponding .get() method to convert on the way
> out anyway.
> 

Why would a get method be needed if the module parameter is just kept as-is ?

> I don't see any upside to moving the action_set() code into
> pseries_wdt_probe() aside from maybe shaving a few SLOC.  The module
> is already very compact.
> 

I disagree. The get method is unnecessary. The module parameter values (1..3)
add unnecessary complexity. It could as well be 0..2, making it easier to convert.
The actual action could be stored in struct pseries_wdt, or converted using something
like

u8 pseries_actions[] = {
	PSERIES_WDTF_ACTION_HARD_POWEROFF,
	PSERIES_WDTF_ACTION_HARD_RESTART,
	PSERIES_WDTF_ACTION_DUMP_RESTART
};

	flags = pseries_actions[action] | PSERIES_WDTF_OP_START;

or, alternatively, in probe

	if (action > 2)
		return -EINVAL;
	pw->action = pseries_actions[action];
and, in the start function,
	flags = pw->action | PSERIES_WDTF_OP_START;

That not only reduces code size but also improves readability.
get/set methods are useful, but should be limited to cases where they
are really needed, ie do something besides converting values. You could argue
that you want to be able to change the reboot method on the fly, by making
the module parameter writeable, but then the .set method should actually
change the method accordingly and not just convert values. And even then
I'd argue that it would be better not to convert the 'action' value itself
but to keep it at 0, 1, 2 (or 1, 2, 3 if you prefer) and use param_get_uint
(or param_get_ulong) for the get method.

Regarding max_timeout, we have calculations such as

	unsigned int t = wdd->timeout * 1000;

in the assumption that timeouts larger than UINT_MAX/1000 seconds (or ~50 days)
don't really make much sense. watchdog_timeout_invalid() will also return -EINVAL
if the provided timeout value is larger than UINT_MAX / 1000.

Guenter
