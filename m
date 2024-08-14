Return-Path: <linuxppc-dev+bounces-96-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B62952664
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 01:58:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xpootarp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wklb04Vn2z2yN8;
	Thu, 15 Aug 2024 09:58:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xpootarp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=ivan.orlov0322@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WklZz6PrNz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 09:58:50 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4280921baa2so542865e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 16:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723679927; x=1724284727; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Wde27BaNuCeYQgeYLVGyEd2OOxjIAQu82nJCOJqARM=;
        b=XpootarpFn/OSOlfUIggfaWiZL2AB8UBqbsdL2v0fBaPpgBnIfhGzMCN1eC/a7SHbA
         jyHsFy89w2uGXG/6TXhBIeXUoGvBkLWorXFziw2Blo7/Gkyc5136HrcivA/fTzHtqn4i
         hUE9xTaItCKgzss3XDLOg/cjjDzwNyXx7FWcBCly8DlV+lT+3N1pBhlKhw0Ju+lTkkH+
         IoX82baCxZ8yoCx80Bxm7CCkd6tGcS2V40VUjiyA5dYRLH5HT4yeqjmABOkjC640eiwA
         zxZUKHZjX6HuYNnaXRw0/vhqGCdLNz0ReEq5xnIQOJTrK0zmFXYsxV/KUMDcVCSAwC+U
         QuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723679927; x=1724284727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wde27BaNuCeYQgeYLVGyEd2OOxjIAQu82nJCOJqARM=;
        b=wT3wZ2AxHKhDDPiJN9fPZvtMPoXGGtsbo/Yle0RRRKZZiJ9XLQl4zNku8M1a7pzvmt
         hqA6lDYvlVLPBaBo2QqwoQO7uXKPq9RhlXzPZR7kzNn6hxY2iLnDcxYv6VC8ZSBGxZka
         BUJ5P4jXL5jAsa89OD35a85eGfaJZbuyBQP0IczrjyFyMOLW/IzrVgSuofQMXeBljFRA
         o/VedOsAcjdzj1nzrUUQoHRAjvGNkr46LKVQGyAQ8hvsg3L7BXu4uhBX3YJdgvp+O0tX
         CjU2jCMhpJq/uqjpDCDrmaXpapD65k4X11ZKWsdD70bTOi5EGSiRUr9/PAf1IxxXf04L
         UdSg==
X-Forwarded-Encrypted: i=1; AJvYcCUvhkLMgHapUEW5fQWPWhlN7V39YeGkkrHarEF/P50jUG86qPhOSXgZZkQHvee2TuBt/EaA/Y7kJc/aM8e4Up2V8T0MHwexXqwJCYDGWg==
X-Gm-Message-State: AOJu0Yyeke4Nzci+IZ6xu6yQQf4gSbYbwhSOzrOFQAqItrxolvCVNDK1
	Wz6EYkYru+LusFkOH8ysaqmaTeSsuSdEefRlm0jeVXA+lVewRGRAhBRhKw==
X-Google-Smtp-Source: AGHT+IHf3Ojp5u2lAHJ5M7BHfemYWQyGPpbVu1be3IWiLOE1I8s29P4UtVRqte6OTjLtEt21qHHyEw==
X-Received: by 2002:a05:600c:35c5:b0:426:5f08:542b with SMTP id 5b1f17b1804b1-429e63a22aamr3322245e9.0.1723679926800;
        Wed, 14 Aug 2024 16:58:46 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:d20e:7300:ce68:853e:d0e2:925f? ([2a01:4b00:d20e:7300:ce68:853e:d0e2:925f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7d5a9sm32669415e9.43.2024.08.14.16.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 16:58:46 -0700 (PDT)
Message-ID: <e40749be-5f0c-458f-8baa-c32f76491605@gmail.com>
Date: Thu, 15 Aug 2024 00:58:45 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OVERFLOW_KUNIT_TEST fails with BUG: KASAN: stack-out-of-bounds in
 string_nocheck+0x168/0x1c8 (kernel 6.11-rc2, PowerMac G4 DP)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: Erhard Furtner <erhard_f@mailbox.org>, Kees Cook <kees@kernel.org>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com
References: <20240809231537.7c9ee7ea@yea> <202408121146.1D02EB6E@keescook>
 <20240814223813.7b301ad4@yea>
 <81303aa9-40a4-42ec-8e48-4a460398d469@gmail.com>
Content-Language: en-US
In-Reply-To: <81303aa9-40a4-42ec-8e48-4a460398d469@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/15/24 00:26, Ivan Orlov wrote:
> 
> As you can see, the device name is defined as a local variable, which 
> means that it doesn't exist out of the 'overflow_allocation_test' 
> function scope. This patch:
> 
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index f314a0c15a6d..fa7ca8c94eee 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -668,7 +668,7 @@ DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);
> 
>   static void overflow_allocation_test(struct kunit *test)
>   {
> -    const char device_name[] = "overflow-test";
> +    static const char device_name[] = "overflow-test";
>       struct device *dev;
>       int count = 0;
> 
> 
> Seems to fix the problem and it is not reproducable anymore.
> 
> I will send the proper patch tomorrow.
> 
> Good night!
> 

Forgot to mention that the problem is intermittently reproducible on 
QEMU x86_64, and this is the only architecture I tested the solution on.

However, it looks like the initial report points us to 
'module_remove_driver' function, which presumably calls the following 
kasprintf as a part of 'make_driver_name' function which also operates 
on driver name. If driver name points to invalid memory range (because 
it is out of scope), it is going to cause a KASAN bug kernel panic.

-- 
Kind regards,
Ivan Orlov

