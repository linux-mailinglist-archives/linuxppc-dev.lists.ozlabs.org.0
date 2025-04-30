Return-Path: <linuxppc-dev+bounces-8203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E0AA5694
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 23:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znqpv2HZ0z305S;
	Thu,  1 May 2025 07:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746048039;
	cv=none; b=HjtMJjgkFNPhXxy1HIgznGK6Aj7ljMFHlPH4gfkr9o73UW0PDUYPWAakAtXcWGFKRRO0lyCK3T35vozSJV4PBhUmg23GJIheUIzZ++ErPBzNFCk+MSq/0PNTfDOilbbsK0QEeKwG6XVmSrwE8LgSs9EamBBzSXttmbjwJd4apKmu1dtW4T2gu/Z/KPd6bNKIpodhxLX/p9o4oh4bgM91dEO2DeQTYKuYZy0CHyeDZIGJiuXK6KfxIrlIwYGuiSfpOuBZMqCYBE5kzO9mqTkEBRgKk/tB/r60N0lJXUIt1T1hnIzf9KGxSw/2aASO2yA+u+seXZX5FBzMpe14S1nTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746048039; c=relaxed/relaxed;
	bh=TalWKmTxW/47MmGWuXj/79mOLCIqFOH3o+/mD2CaJz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aW0KMIsI+Pl6HgReQJ0hhLdeJGg5Bxe4SNv0FWMd4NY/XpwxmVhha/ZZDJ+mCTdn3E6BFUv/AjZ/Xh1+QMTQPbNjTZ0GtZrDnHWwzQkqbe5025DoR4P/OhfeDPbWIP6SNIGKbql8vO0Cx/Mue3CBgokrvjEJe4w0Ci9Cc/SAEixrLtMHAAqHLnNt/zj9JPactPPhe+fnmVpLXS2qMqz6dYinXmp7WpNFQZ8LJDXBBxFcVBszpGMgu8RTlRSRpyk4JPdTyF/77bOLD0D6cf42JpY3yzPojL4yG60QCXu+IskxyBEof16/eTZDgUJG4FUh6E7TbrXTSusa/NS6yS7FEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znqps4smfz3020
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 07:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znl4k5gw7z9slR;
	Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRILqcdhiA9l; Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znl4k4hwwz9slF;
	Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 91A0F8B765;
	Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CGL3eL1v_ASl; Wed, 30 Apr 2025 19:47:18 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 765C98B763;
	Wed, 30 Apr 2025 19:47:17 +0200 (CEST)
Message-ID: <11e1a1e7-7bd3-4d48-804c-45b53b5e15d5@csgroup.eu>
Date: Wed, 30 Apr 2025 19:47:17 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
 <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
 <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/04/2025 à 19:37, Bartosz Golaszewski a écrit :
> On Wed, Apr 30, 2025 at 7:33 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 08/04/2025 à 09:21, Bartosz Golaszewski a écrit :
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> struct gpio_chip now has callbacks for setting line values that return
>>> an integer, allowing to indicate failures. Convert the driver to using
>>> them.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
>>> index 4d8fa9ed1a67..d4ba6dbb86b2 100644
>>> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
>>> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
>>> @@ -92,7 +92,7 @@ static void mcu_power_off(void)
>>>        mutex_unlock(&mcu->lock);
>>>    }
>>>
>>> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>>> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>>>    {
>>>        struct mcu *mcu = gpiochip_get_data(gc);
>>>        u8 bit = 1 << (4 + gpio);
>>> @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>>>
>>>        i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
>>>        mutex_unlock(&mcu->lock);
>>> +
>>> +     return 0;
>>
>> i2c_smbus_write_byte_data() can fail, why not return the value returned
>> by i2c_smbus_write_byte_data() ?
>>
> 
> The calls to i2c_smbus_write_byte_data() in this driver are
> universally not checked. I cannot test it and wasn't sure if that's on
> purpose so I decided to stay safe. Someone who has access to this
> platform could potentially fix it across the file.

As far as I can see this function is called three times in this file.

First time is in mcu_power_off(), which must return void.
Second time is inside a forever loop in shutdown_thread_fn(), and I 
can't see what could be done with the returned value.

Last time is in the function you are changing. Wouldn't it make sense to 
take the value into account here ? IIUC it is the purpose of the change, 
isn't it ?

Christophe


