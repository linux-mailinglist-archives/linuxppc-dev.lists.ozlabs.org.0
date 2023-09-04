Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E70791D7E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 21:09:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IMxvC8hN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfdVl05Skz3c5n
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 05:09:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IMxvC8hN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfdTq0wsYz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 05:09:00 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso2314134a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Sep 2023 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693854528; x=1694459328; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0CIESG2SuiZV7cHhLHCsdILQZtP8suwtO95xIEc+T0=;
        b=IMxvC8hN2NyAtSDmmIvRf7aQXGD1bXpNSIw4DbbA0Zy50meIQHiFqxt+Ujah4giOfY
         U3keB+joKg7LgvRYg7w4eh3ebep9bjWGibYYBOCLQm06IQxRbyhs48UOC+7xTa3Tpg86
         9bLPRqfGP9hG3hrQ8tmm0v9qPvqtNhU9RqwEKU91PtelPohfAnvYSVATs6C1fvYaZYM+
         mjASYMw5JOqQxgBNgOPfi9gm2WXh25SW9Z2kBbjZ4MfSjNNLLe1pRjBIQYuub2gnjsZ6
         TvgkSFGCBQYuRVIONANB8erIe0gIrFUX7tZqSzKeH5rwyW0v2qJKPGmhSo+iNkNpYJTF
         IiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693854528; x=1694459328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0CIESG2SuiZV7cHhLHCsdILQZtP8suwtO95xIEc+T0=;
        b=SMY77g6YW2UCzjJqWQGVCVAYsgxSVXa5MylzLrY8LTeFPsnGfxglSRn84Znas6kwgD
         Op9Ni8rc7M3uolQNbz6apYXXn/UiS3HEh6QaVsPx7FwJiJXsCQXVCtXOujhOvsqPG/4t
         NgHJTcD9989fHj4Req02czDMFB8BcCi5Z56/X6u8gpcs6WHV6rEsTkXg48ReBn2yODLl
         CXAk9qOBJDeoQYcti/simOZPaSp0+I8Z6mIgAdohYtzsZ8TVv561l+3Izr9kYwW8M3kX
         XyUY5gucPA4sWsSM6e7toTNcSDodelLwkGC8ZcphYqYKBmQhG7Xb+hdFiWxDUP+U/MtE
         kE/A==
X-Gm-Message-State: AOJu0YyR2CRiLekiIXZkXWWB4aq25M+WWp54cUfT3M7PDJf+0MQd1JzA
	kDQpuF/QbefoHXetaDaxK2G7RA==
X-Google-Smtp-Source: AGHT+IH0wh3Lx48yFyOqTEgnOEZkTX4ZndMzuwd1BqySt5vm/255sDxk6mqMYYjnwmcqT5deG8ldDw==
X-Received: by 2002:aa7:d64a:0:b0:527:3a95:3fa4 with SMTP id v10-20020aa7d64a000000b005273a953fa4mr7912602edr.20.1693854528590;
        Mon, 04 Sep 2023 12:08:48 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id j16-20020aa7ca50000000b0052a3ad836basm6153607edt.41.2023.09.04.12.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 12:08:47 -0700 (PDT)
Message-ID: <2841ec8c-f07b-307e-de03-6e8a4dd88775@linaro.org>
Date: Mon, 4 Sep 2023 21:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips
 malta
Content-Language: en-US
To: Yuan Tan <tanyuan@tinylab.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>
References: <cover.1693535514.git.tanyuan@tinylab.org>
 <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
 <915a9e2d-36ea-4a74-7b1b-9688f215b6f1@linaro.org>
 <55C9BDEDAB4E0B76+838dbd4f-425d-4f2e-94ee-f2bc3092ae13@tinylab.org>
 <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
 <54da2376-dc65-0a96-55df-7a5acfbb9bff@csgroup.eu>
 <8464A5F00EFC8C59+502c989a-3814-4686-8c6f-0a8f814e1c39@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8464A5F00EFC8C59+502c989a-3814-4686-8c6f-0a8f814e1c39@tinylab.org>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux@weissschuh.net" <linux@weissschuh.net>, "falcon@tinylab.org" <falcon@tinylab.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "w@1wt.eu" <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/9/23 19:40, Yuan Tan wrote:
> 
> On 9/4/2023 6:58 PM, Christophe Leroy wrote:
>>
>> Le 04/09/2023 à 12:51, Philippe Mathieu-Daudé a écrit :
>>> On 4/9/23 11:24, Yuan Tan wrote:
>>>> Hi,
>>>>
>>>> On 9/4/2023 3:40 PM, Philippe Mathieu-Daudé wrote:
>>>>> Hi,
>>>>>
>>>>> On 1/9/23 04:42, Yuan Tan wrote:
>>>>>> MIPS Malta's power off depends on PCI, PCI_QUIRKS, and
>>>>>> POWER_RESET_PIIX4_POWEROFF to work. Enable them when POWER_RESET 
>>>>>> is set
>>>>>> for convenience.
>>>>>>
>>>>>> Suggested-by: Zhangjin Wu <falcon@tinylab.org>
>>>>>> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
>>>>>> ---
>>>>>>    arch/mips/Kconfig | 3 +++
>>>>>>    1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>>>>> index bc8421859006..13bacbd05125 100644
>>>>>> --- a/arch/mips/Kconfig
>>>>>> +++ b/arch/mips/Kconfig
>>>>>> @@ -547,6 +547,9 @@ config MIPS_MALTA
>>>>>>        select MIPS_L1_CACHE_SHIFT_6
>>>>>>        select MIPS_MSC
>>>>>>        select PCI_GT64XXX_PCI0
>>>>>> +    select PCI if POWER_RESET
>>>>>> +    select PCI_QUIRKS if POWER_RESET
>>>>>> +    select POWER_RESET_PIIX4_POWEROFF if POWER_RESET
>>>>>>        select SMP_UP if SMP
>>>>>>        select SWAP_IO_SPACE
>>>>>>        select SYS_HAS_CPU_MIPS32_R1
>>>>> Shouldn't we also update the _defconfig files?
>>>>>
>>>> Sorry, in my last email, I forgot to reply to all. So I am now
>>>> resending this email.
>>>>
>>>> In malta_defconfig, PCI and POWER_RESET_PIIX4_POWEROFF have already
>>>> been set and PCI_QUIRKS is also selected by FSL_PCI [=n].
>>>>
>>>> So shutdown and reboot with malta_defconfig is working and there is no
>>>> need to update the malta_defconfig 🙂
>>> Since the dependency is now enforced by Kconfig, the defconfig can
>>> be simplified:
>>>
>>> --- a/arch/mips/configs/malta_defconfig
>>> +++ b/arch/mips/configs/malta_defconfig
>>> @@ -306,3 +306,2 @@ CONFIG_SERIAL_8250_CONSOLE=y
>>>    CONFIG_POWER_RESET=y
>>> -CONFIG_POWER_RESET_PIIX4_POWEROFF=y
>>>    CONFIG_POWER_RESET_SYSCON=y
>>>
>>> But maybe we don't care, I don't know.
>> I understand from what you say that you update malta_defconfig manually ?
>>
>> defconfigs shouldn't be updated manually.
>>
>> Once you have the new .config you should use "make savedefconfig" then
>> replace your file by the newly generated defconfig file.
>>
>> Christophe
> 
> To do so, I just unset CONFIG_POWER_RESET and set it again in 
> menuconfig, then "make savedefconfig". The POWER_RESET part is simplified.
> 
>   CONFIG_POWER_RESET=y
> -CONFIG_POWER_RESET_PIIX4_POWEROFF=y
> -CONFIG_POWER_RESET_SYSCON=y
> 
>   However, I found that there's other changes in this new 
> malta_defconfig, for example
> 
> CONFIG_NLS_KOI8_U=m CONFIG_CRYPTO_CRYPTD=m -CONFIG_CRYPTO_LRW=m 
> -CONFIG_CRYPTO_PCBC=m -CONFIG_CRYPTO_HMAC=y -CONFIG_CRYPTO_XCBC=m 
> -CONFIG_CRYPTO_MD4=m -CONFIG_CRYPTO_SHA512=m -CONFIG_CRYPTO_WP512=m 
> -CONFIG_CRYPTO_ANUBIS=m CONFIG_CRYPTO_BLOWFISH=m CONFIG_CRYPTO_CAMELLIA=m
> 
> Should I import all these changes in a commit? Or only POWER_RESET part.

I'd first update the defconfigs with mainline (as a cleanup)
then apply your series on top, re-running 'make savedefconfig'
you should get only the changes relevant to your work.

