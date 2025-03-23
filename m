Return-Path: <linuxppc-dev+bounces-7297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74FA6CFFC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 17:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLLwT2sYbz2ydx;
	Mon, 24 Mar 2025 03:19:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742746745;
	cv=none; b=gpGa3oUyMyCiz7WWN3idyc53K2d3iDw+doUUkD/ipjVtdXNOBzEq7L4349E/VXyMLcFJRhW785IiwR7dIqz8ynKYUvAvWBhN0nI2Wop8MV/yqT4jgUuuNGZlfiGaTzZ4Rp7FSIsgAc9+c5VZdJHfglelWNmZrh3HK4G+S9/w6vbS2lzVYF3Ab/zBft0hlfemu24vospZtelF91Mm7RTyjrsHsm6zxBEe+F7eduWPI5D/tdQ5VJuoB/QhYIoqJ5pAFEip21lrhbTztzzJKJHUe0cz1JIyKUNd9AELFdfkA6BR4EX2WO32Xmg8rhhs6TVX+O55rTQOI7axKVNp4xJLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742746745; c=relaxed/relaxed;
	bh=W8RJ8Z/RHpnWc3LGsmd97JoZyFLCP+Pu3qjQfO7gn9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWCPkB1Bsj9UTh8+0+CEdzekjn5MHSjdeWEYaXl+m77N7Z0VJA8rWvvbwfrbiODzY7xPO2/AeXfMPgHHYSde5MaB4nk4iwIEi4DcStZdbY6srGzihNc+97p5BhvhjixjCjzh6usttB628gTLIq9PMRAfzlaDcAPpTP2tTu3o3oj7U9z7LvLKwvMHIPSKc74553ntRCtrfbNlrl3LnjwT2cHZ4RrBwe+qkTtEomqam+vUTihc+3Cz9x3Tr4QtiMc+Tfg2nt4IUSXs0+IPiSYphLkyB6GTfYyA1lySx9DMNovPtvTWDs34rRO8y4Hj2EyvhKBLg/I0YZRZIUle4BFk3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NjBgZxyH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NjBgZxyH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLLwR519Nz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 03:19:02 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22398e09e39so70216075ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742746741; x=1743351541; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=W8RJ8Z/RHpnWc3LGsmd97JoZyFLCP+Pu3qjQfO7gn9I=;
        b=NjBgZxyHxYqLyV/2OGqVCf2Ekmg4f2uwI3RdTwgeUv/G7TVd49WnyTkMvteK7amgyJ
         ejqKAkTtaCCUIb+lqUvoZ8Z4/HNtvzmkJ1RLnHxBglAMB/O/BZbAdscqeAZZ+gAeSihO
         bzJ8/K3jgQL5GpdiqYPTGYWQ2BjwNKPp1BpgjsADtXvGejAhypsvOixGrjW+oIX2q31C
         I3qFaJom1jY9j7J+/IWGhuhXCGY7jPLcZ4WA7lxqS3pMFyGFLdOlNgnJHxahPB8Gyqf1
         uB4pupSiFAmILFMghCWg6UdCzDP1seTKLIW0wUA02fqkwhWFv0/9iut5trbMFArXjRlO
         F4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742746741; x=1743351541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8RJ8Z/RHpnWc3LGsmd97JoZyFLCP+Pu3qjQfO7gn9I=;
        b=ZxvYqrVkPNZJjNth3vmOktGoQ+fOFTzifeDdHcQuuotJTi6DGOeeCzujuCz+cmwNz5
         m7u5rsDUPwOAN72LeVI70Xz0xAwRmR1WflZ5v7onSFtxdb4WBVG8SVZVm5sAwTQ4bDu5
         uxbuhDO6m3RQZrBfjhZqxhYABAyhj5ZLROjeFmQ3lTNyeaQxX6o537zr48E/300Zm9ZK
         HwssMIKQnkjeBPedZrnlrzBZVnrniG+rkIwmwlRsOUX3IjEZ4VuiBOGXZt4ZReUP+rH1
         cA/93CQmLA+FlpYFD4Ww0icbHBMgGyYkPMV4fZV37Ss08APMIUadUusCq9DzBI8aedh1
         AFPA==
X-Forwarded-Encrypted: i=1; AJvYcCWSuFWLztHvB+jK0/krWxlpdAJCexwkF1Z7VeHAetBKednuzcQ7tS3bNl3FTdCYgkFC5xGUmD0m1F9ubpk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwcbFsFJM8XpS3wt4zLBV3kBH3yiLC7Pc9rJLsuI+cIuKE0vAW2
	WF9RVcKakoY9Sm2kQN6f/Xx5mg/Hyc7mmWiMmNOAJS6E+7+zRCkQ
X-Gm-Gg: ASbGncuZRjSDXxjEouUeUBNDZvQm2EH1cpqyaxE2y/0rCoT/8UUA3IfrT1J8Oe6EQnb
	/5F3Qcv65R/jF52KeZCWv98i2b0b3c1pVK+EnB5GNNo7wr9s/usm1TdTjMX627252QiDQRwfbTE
	NvRIR0UwxK1WKjI+D4pXRIoZOeWZW7uEvouyUEvhvzYvaM4NeXBoLiXAlv+min+Vqm26D2BvZJa
	GlzEHzR2uv5oCvzGWfWfOE6K207+QlPlTB73EEinXt6og4NYLT6hv2iILq5rrm40ugFODztBVF7
	zBUlkyog3+ttN8+EiTenCC7nSKh2d0NVxNm9TuZI9388rMp9WOSUVVpB2TeoU/RMIHzpVs/7Dxz
	ulokWOhs2V0lbyTnePPdyTslri4MN
X-Google-Smtp-Source: AGHT+IHo250qwi/lpasJeLUVqvJ1a8Gc4OglOyLVqF0R9kKJhzrb9+w7mS4jN+yzknNmRSCbqAhcAw==
X-Received: by 2002:a17:903:46c5:b0:224:191d:8a87 with SMTP id d9443c01a7336-22780d88c6cmr175299435ad.26.1742746740495;
        Sun, 23 Mar 2025 09:19:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da38asm53584125ad.186.2025.03.23.09.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 09:18:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <22812c03-1b64-4e1c-b260-cddc14ea3e8f@roeck-us.net>
Date: Sun, 23 Mar 2025 09:18:58 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 Vinicius Peixoto <vpeixoto@lkcamp.dev>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20241202012056.209768-1-ebiggers@kernel.org>
 <20241202012056.209768-9-ebiggers@kernel.org>
 <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
 <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/23/25 08:35, Ard Biesheuvel wrote:
[ ... ]
>> kernel_neon_end() calls local_bh_enable() which apparently conflicts with
>> the local_irq_disable() in above code.
>>
> 
> This seems to be an oversight on my part. Can you try the below please?
> 
> diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
> index 82191dbd7e78..56ddbd3c4997 100644
> --- a/arch/arm/include/asm/simd.h
> +++ b/arch/arm/include/asm/simd.h
> @@ -4,5 +4,6 @@
> 
>   static __must_check inline bool may_use_simd(void)
>   {
> -       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq();
> +       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
> +              !in_hardirq() && !irqs_disabled();
>   }
> 
Yes, that fixes the problem.

Thanks,
Guenter


