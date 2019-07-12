Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5A66A14
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 11:39:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lSYj5K3wzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 19:39:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="frv/pNxf"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lSWW4Rj9zDqtk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 19:37:27 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id i2so4521701plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujRqYBQxkT2Rt+tGbZXrv9adgkqY160eJFoMO4qa73g=;
 b=frv/pNxfU0LZBqNyqXX3ySNQ7MFW1Om2Lao1KvhT19yJOS9UVwmjn4c9tFqMGC5wkH
 KagrQmJm8SHowofMM3zVB1uFuIOfVnZPJdUbHINj1EvZsX9DDf3yocGeN1F94ydQ+E6t
 mEUl2CEgz2e/F7POdPqncLRqXVC94agGFzCqY/SDLiH9l+tPY7/O93iV2RCIqwS7fFnq
 4NmMuWsV4Uk0jU1oOolXbMLrMGtoAx55NLqSnzSXNpn9Cfs0T7iQfnkakTkFbzxT4cpS
 N5W52bDxbsWmW7+e7RrBI+0Bji3HG4U9+1dx+tMfyhAm/CcY1iw6YBOTPuFYrSbITS93
 reBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ujRqYBQxkT2Rt+tGbZXrv9adgkqY160eJFoMO4qa73g=;
 b=JFInOH/WLlCMd7R4xO5hY0GY7xjZeU9OUb++hh321DkVCZ48P9pXhGIbGExvY0TqMF
 Z+bxTUM9m175lam5ydpZXzDp8Uqc4M66FR50rN/Wiw6jcvBwMhrZ9AHoZIetwP1kHpho
 Lsj3KsVIgE+3vPxflQ4t+k56Ujdbct8j0Np+DNDzsd1h/nPMDEHWNkI5E0NO/4VvbEM6
 Na64I5gQVHiUZLtnt1R2jsxf5Qtt7QsQsni5kDtq+8vyFKdcY6gsqwJLcSt7JRUn7pVJ
 Go3E8J6jREGa70TNKo5ffOrRuqRcAIR/BMWMJc71AmAd0ve8acHatrQ9sfycw9vBNb8Z
 vHog==
X-Gm-Message-State: APjAAAUUSRnAzXwtuu4hEq3nIyj/tG7FUpcStFYFIKoc8rK/bnOrCYlP
 GftG07Y6uDz6823PqP3GUH4=
X-Google-Smtp-Source: APXvYqyzqvqv+ximCn+x0FOxTxr/3WSkijQuae9tlaoPQhWN1ORuASn1qwQoxmOrE0ARuMFqaGxBxA==
X-Received: by 2002:a17:902:ac1:: with SMTP id
 59mr10424332plp.168.1562924242998; 
 Fri, 12 Jul 2019 02:37:22 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id p13sm23158800pjb.30.2019.07.12.02.37.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 02:37:21 -0700 (PDT)
Subject: Re: [RFC PATCH kernel] powerpc/xive: Drop deregistered irqs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20190712082036.40440-1-aik@ozlabs.ru>
 <abbee9db2fa0abdaa2e01bb92bab920773a2ad8d.camel@kernel.crashing.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <3a34190f-560e-0b42-af38-0e39cef0beea@ozlabs.ru>
Date: Fri, 12 Jul 2019 19:37:16 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <abbee9db2fa0abdaa2e01bb92bab920773a2ad8d.camel@kernel.crashing.org>
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/07/2019 18:29, Benjamin Herrenschmidt wrote:
> On Fri, 2019-07-12 at 18:20 +1000, Alexey Kardashevskiy wrote:
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 082c7e1c20f0..65742e280337 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -148,8 +148,12 @@ static u32 xive_scan_interrupts(struct xive_cpu *xc, bool just_peek)
>>   		irq = xive_read_eq(&xc->queue[prio], just_peek);
>>   
>>   		/* Found something ? That's it */
>> -		if (irq)
>> -			break;
>> +		if (irq) {
>> +			/* Another CPU may have shut this irq down, check it */
>> +			if (irq_to_desc(irq))
> 
> What if it gets deregistered here .... ?

Yeah that is the problem.

> 
>> +				break;
>> +			irq = 0;
>> +		}
>>   
>>   		/* Clear pending bits */
>>   		xc->pending_prio &= ~(1 << prio);
> 
> Wouldn't it be better to check the return value from generic_handle_irq
> instead ?

Where exactly, here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/irq.c#n614

If so, then in order to do EOI, I'll need the desc which is gone, or I 
am missing the point?


-- 
Alexey
