Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF97A158D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 07:41:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EbaqRRkM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn32y6D0Xz3dFr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:41:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EbaqRRkM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn3236ZnZz3c03
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:40:43 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-578d992c8efso583871eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694756440; x=1695361240; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4W9/G5aL/Wgi4GOf9IacY40VhRxR066lrHQZEMg5zA=;
        b=EbaqRRkML18U618qzGfrIsOoYsthJrb/j/VLXpiXyqSKmE5TdqqJEq/cBPSROd+E1C
         NLKVShczdxocbMozVwezfXy4DYzwitTyVxsQvJsrv+b/vrrkH2NFHBuSnrFSAC3jbouH
         MhGjQAn+BJcfrGVEIjm+VuAn/MSBkb17R7FHRWnk9kH/0NN2wZVbWKgT2jYrzbNa3xn3
         037Onw0hqX5ns7c5UqcMmn/75mlrsSjkvEGpjvzVonuzT+bhuZbqxU9vdNOjkAoXhRto
         s77oQmpoEcR1rNFMw41O/em9mUpk69uEVMbs0qDFlKJnyCWugKE1ryG2P55CuaoWocGL
         LGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694756440; x=1695361240;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4W9/G5aL/Wgi4GOf9IacY40VhRxR066lrHQZEMg5zA=;
        b=SBDiYHYH4AE0pPZAANrYotdUWKljHv82SsSHuY5I896zf5umr1os8xNCg7FD1D0/+v
         Dk0S7BubFYJjcU+cgHUEpCbp5CPXNsr0py2+mAtoH05G/QXVv1v5MGH020u0n4Ku6eo6
         hS7fRVOR//1g7dF4vo2AicHgZQ9ajXklBR0i+ODOvOa2Nbs0Bmq7oeaYuzZOOHFtPeI6
         xIDU8zr+1dRPcG2Y7ybAAociwBxjJwrXdkdP0PnNuEYHBS6ORKF13Ax36uYBmg41E0/s
         AKEcmUAxjYWmrBo4qq4KK6Rhgk69bzr/rMpnyBWsA+bwrho7J/7Xu/SFuAHfv7Lwi0MN
         NsMA==
X-Gm-Message-State: AOJu0YxJA6Dg9VTet9qsmkX6L7Am8SPYv/c42LEEyK6RGifaXc32zk8Y
	rrOVySl6/m+BfVujnkIpGQg=
X-Google-Smtp-Source: AGHT+IEG8UEvEp28b8+DTHwOJTny12gqBiHiLY4gWmnUqfwyXprN3AV2QabKyhkUgir7z6HVC8JKfA==
X-Received: by 2002:a05:6870:c214:b0:1b7:4655:2ac9 with SMTP id z20-20020a056870c21400b001b746552ac9mr923260oae.6.1694756440061;
        Thu, 14 Sep 2023 22:40:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x10-20020a63b34a000000b00553dcfc2179sm1762184pgt.52.2023.09.14.22.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 22:40:39 -0700 (PDT)
Message-ID: <4b490305-0ab7-403f-7bec-a08fb8f20b56@roeck-us.net>
Date: Thu, 14 Sep 2023 22:40:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
References: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
 <202309142223.D16446A30D@keescook>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ibmpowernv) refactor deprecated strncpy
In-Reply-To: <202309142223.D16446A30D@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/14/23 22:24, Kees Cook wrote:
> On Thu, Sep 14, 2023 at 11:21:06PM +0000, Justin Stitt wrote:
>> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>>
>> We should prefer more robust and less ambiguous string interfaces.
>>
>> A suitable replacement is `strscpy` [2] due to the fact that it
>> guarantees NUL-termination on the destination buffer without
>> unnecessarily NUL-padding since `buf` is already zero-initialized.
>>
>> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
>> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
>> Link: https://github.com/KSPP/linux/issues/90
>> Cc: linux-hardening@vger.kernel.org
>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>> ---
>>   drivers/hwmon/ibmpowernv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
>> index 594254d6a72d..57d829dbcda6 100644
>> --- a/drivers/hwmon/ibmpowernv.c
>> +++ b/drivers/hwmon/ibmpowernv.c
>> @@ -234,7 +234,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
>>   	if (copy_len >= sizeof(buf))
>>   		return -EINVAL;
>>   
>> -	strncpy(buf, hash_pos + 1, copy_len);
>> +	strscpy(buf, hash_pos + 1, copy_len);
> 
> This is another case of precise byte copying -- this just needs to be
> memcpy. Otherwise this truncates the trailing character. Imagine a name
> input of "fan#2-data". "buf" wants to get "2". copy_len is 1, and
> strscpy would eat it. :)
> 

It is really sad that the submitters of such "cleanup" patches can't be bothered
to check what they are doing. They can't even be bothered to write a coccinelle
script that would avoid pitfalls like this one, and they expect others to do their
homework for them.

And then people wonder why there is maintainer burnout. I am so tired of that.

Guenter

