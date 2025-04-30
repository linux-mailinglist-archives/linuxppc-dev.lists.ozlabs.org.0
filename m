Return-Path: <linuxppc-dev+bounces-8202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35746AA54A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 21:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znn8Q6MSmz2yFK;
	Thu,  1 May 2025 05:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746040838;
	cv=none; b=hxGejjJuKMR3q1f2gE3vwjnoib945la/0oxfrcKnDJiFX8R6AjKMy6Gy0BxWyyTk4XUIaNe1hkLyYCN5V9Pe84FsD1rrex0hos3eg+e3P25b+cct0v7/1CAEpcYHmMDzReIn0Ubq/vyksuXjJ6qiIjHxI1tcSDGM2CJyyQkjI6jD/LJqVZoCnyQw6V1oEHY6+KhLb+PhacE5rQfG2tzA2wl+Gu0YXm1KSJIkgGjS/oUkwdPvNjvPHWwRHDxfzw4E+myP0ttSkuVdXBr4KhYT4PmzaLGlyeoWme+iVpQcbyVZfqqxdigRjapEaB+F0CvuwMT1qZe2j3tZ81fzhg87ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746040838; c=relaxed/relaxed;
	bh=ciziqV/6RjYm3GCjNztMM/oOb6GVlW9BdKmecDFVuLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvVq/gF9CBis2oLToXmOZYZDd6ftjgDXdUICId7rIMc9cfS8722PgayZUwNeaHloxalY/06yzvlbr+kWw1SXmx/SQ9rOx7lLlQK6GapJBNljYQgvFW0lfo2UIqyeeF+rWmkqvULeZzb4tmc4SHvkmmpDCAssLFTqoLa6K4smVp82GhIbdel8K0zxcHy5+qGcZBsF9WyddDsL7mJvLORRGPWebcSB8WI0gva3/k60RWIhhx6WQduR5eMz7/gYYifWWqY2xNaiMyifFx3TunzOfjB7n9/MIuYI0J5YDVe2VgGBtEXoLhXZY8ZYnlnrWjovvJQZH9GYdDuLPk7JH1w13g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znn8P5QSsz2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 05:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znkmp3X2Nz9sfF;
	Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKxf0jgrwP6Q; Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znkmp2jH5z9sd1;
	Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 576778B765;
	Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AMxxhowWQVYU; Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 554BC8B763;
	Wed, 30 Apr 2025 19:33:29 +0200 (CEST)
Message-ID: <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
Date: Wed, 30 Apr 2025 19:33:28 +0200
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
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 08/04/2025 à 09:21, Bartosz Golaszewski a écrit :
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> index 4d8fa9ed1a67..d4ba6dbb86b2 100644
> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> @@ -92,7 +92,7 @@ static void mcu_power_off(void)
>   	mutex_unlock(&mcu->lock);
>   }
>   
> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	struct mcu *mcu = gpiochip_get_data(gc);
>   	u8 bit = 1 << (4 + gpio);
> @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   
>   	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
>   	mutex_unlock(&mcu->lock);
> +
> +	return 0;

i2c_smbus_write_byte_data() can fail, why not return the value returned 
by i2c_smbus_write_byte_data() ?

>   }
>   
>   static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> @@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
>   	gc->can_sleep = 1;
>   	gc->ngpio = MCU_NUM_GPIO;
>   	gc->base = -1;
> -	gc->set = mcu_gpio_set;
> +	gc->set_rv = mcu_gpio_set;
>   	gc->direction_output = mcu_gpio_dir_out;
>   	gc->parent = dev;
>   
> 


