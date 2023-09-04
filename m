Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 776A97915E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 12:52:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D6OGya4V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfQSh2vZpz3by6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 20:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D6OGya4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfQRm3r7Wz30PY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 20:51:30 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bcfe28909so190375066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Sep 2023 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693824684; x=1694429484; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0k6kpnoserckYuHCVkNe+zAAW3vEA36IOzUTy2u6khE=;
        b=D6OGya4VyUVUqK7oKN7WLQyeKGku31ycdPJYz+CWpJi0zcMOiWMPdtCwnxUBhWCH0b
         0qiM0Agks4DI/vgoDPxt8sNTPnGF9FXlR3CSBzSLpe4c+/YelgmFoD9H7t/U9eLrPNvc
         51GMk/BmIeh3KngtJA/snRWIpL10G0FvXGuKNZndNzrYcrfOHpG69KyHyU4OOjT1MNDI
         lJgk0vlk8KevccBTwELMKrhLyQsgnH6KQBz0KU3m9Je1fTa+C74pVt4E6oo8G6pMwvVo
         Z3/NZm4LT0cL5H+9O7X6XBZYf4uEtWbJNen4/KwKzayhiLCRqNw8Kd2ApSNH90hLf3Yy
         eEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693824684; x=1694429484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k6kpnoserckYuHCVkNe+zAAW3vEA36IOzUTy2u6khE=;
        b=lIYkvX1xRBHp5cOH+GiG3DJLl3TKKtB6870213JyE97nMAmkNAgWh6QDPFAy0maMIW
         Nn2c4+WZli6XmJ2VhwlwS/bYFFmh1Pjd/cM9IqkF+61ABwu7zRfZu+Z7JMrlTA74bDyk
         2zTBZ5sw1acEUqgSm+GFq2VwSdYOAl67jGZ9LPzWSJO2Oc83ba69zh4LO3wp1/gcVifR
         ZJM6lols8CwDO7WThfSDaXVxzhC5elQSa7PVECw+G/D59YyVBNTUPY+rEzCe4Yd9cgWl
         3HecjsYIVlbLyRIknnVRt7jYqEFJwaOJtOeHSb59SwmIOG9MJjoa6xVi15flc4paX/xU
         1lGw==
X-Gm-Message-State: AOJu0YzmXGg3CVyrTX8wmbNbNWjaNPuwITmxdtVoA8eG/XMpbx8kYlQ9
	UrIYiLWIFQKLbxcvHt2o2N57Xw==
X-Google-Smtp-Source: AGHT+IHLxjjFNCyTlcsS0kQD510zndajm47ZwOZ93DZLzEmRrA9Ih7FEO70vfAaqUvHv81Md1l9q9A==
X-Received: by 2002:a17:907:762e:b0:9a5:9f3c:9615 with SMTP id jy14-20020a170907762e00b009a59f3c9615mr6535057ejc.63.1693824684574;
        Mon, 04 Sep 2023 03:51:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id jj17-20020a170907985100b009888aa1da11sm6010410ejc.188.2023.09.04.03.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 03:51:24 -0700 (PDT)
Message-ID: <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
Date: Mon, 4 Sep 2023 12:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips
 malta
Content-Language: en-US
To: Yuan Tan <tanyuan@tinylab.org>, mpe@ellerman.id.au,
 christophe.leroy@csgroup.eu, tglx@linutronix.de, mingo@redhat.com,
 tsbogend@alpha.franken.de, hdegoede@redhat.com
References: <cover.1693535514.git.tanyuan@tinylab.org>
 <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
 <915a9e2d-36ea-4a74-7b1b-9688f215b6f1@linaro.org>
 <55C9BDEDAB4E0B76+838dbd4f-425d-4f2e-94ee-f2bc3092ae13@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <55C9BDEDAB4E0B76+838dbd4f-425d-4f2e-94ee-f2bc3092ae13@tinylab.org>
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
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux@weissschuh.net, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/9/23 11:24, Yuan Tan wrote:
> Hi,
> 
> On 9/4/2023 3:40 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 1/9/23 04:42, Yuan Tan wrote:
>>> MIPS Malta's power off depends on PCI, PCI_QUIRKS, and
>>> POWER_RESET_PIIX4_POWEROFF to work. Enable them when POWER_RESET is set
>>> for convenience.
>>>
>>> Suggested-by: Zhangjin Wu <falcon@tinylab.org>
>>> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
>>> ---
>>>   arch/mips/Kconfig | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>> index bc8421859006..13bacbd05125 100644
>>> --- a/arch/mips/Kconfig
>>> +++ b/arch/mips/Kconfig
>>> @@ -547,6 +547,9 @@ config MIPS_MALTA
>>>       select MIPS_L1_CACHE_SHIFT_6
>>>       select MIPS_MSC
>>>       select PCI_GT64XXX_PCI0
>>> +    select PCI if POWER_RESET
>>> +    select PCI_QUIRKS if POWER_RESET
>>> +    select POWER_RESET_PIIX4_POWEROFF if POWER_RESET
>>>       select SMP_UP if SMP
>>>       select SWAP_IO_SPACE
>>>       select SYS_HAS_CPU_MIPS32_R1
>>
>> Shouldn't we also update the _defconfig files?
>>
> Sorry, in my last email, I forgot to reply to all. So I am now resending 
> this email.
> 
> In malta_defconfig, PCI and POWER_RESET_PIIX4_POWEROFF have already been 
> set and PCI_QUIRKS is also selected by FSL_PCI [=n].
> 
> So shutdown and reboot with malta_defconfig is working and there is no 
> need to update the malta_defconfig 🙂

Since the dependency is now enforced by Kconfig, the defconfig can
be simplified:

--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -306,3 +306,2 @@ CONFIG_SERIAL_8250_CONSOLE=y
  CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_PIIX4_POWEROFF=y
  CONFIG_POWER_RESET_SYSCON=y

But maybe we don't care, I don't know.
