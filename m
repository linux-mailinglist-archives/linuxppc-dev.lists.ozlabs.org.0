Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34E791265
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 09:41:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f39Oktzz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfLD64rMFz3c1V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 17:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f39Oktzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfLCD0Y2Jz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 17:40:21 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so1483945a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Sep 2023 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693813217; x=1694418017; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQjKqdQjnv3PMe5OqcJ+jHGfcq2cLTpjtNSkHV3ltZw=;
        b=f39OktzzdkOQdjg55Zf/rOjEoHf6N6w5qfUiQbBrXdztd0972wCxhRq99aZv41KrUF
         y+8PE3kmtD5ejQ1IkkLNZ/Wqu009l8ajPUro/b9oSyAeks17abQ2C2p5rZ4Y3oqrCzAD
         n4EW+gu/MLXfb/RRGSLhAWJuUPMFQEkuE/Xsf2HdTSM2GB1A0wdRQVJsUc9u5j4NletG
         7OVPDjDQgIbZaFFh4e1j54dNp3ac4KBo7nNeKdXgqUau4aOYkd7bvAWtheDcBEUPRrFs
         5yuesNYNEOHf0ML27zUh1saum/VR2ZmxVcjTjptjbGHg7pWMHvJBXW6xn77BT/yPkeHl
         TYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813217; x=1694418017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQjKqdQjnv3PMe5OqcJ+jHGfcq2cLTpjtNSkHV3ltZw=;
        b=JLb7Eac8SL+dEd0x2H3MwdApPwQcTI+CNacFggIx1p+wDNsgCLdNdVHcOblaNijquv
         a56sFm5RfuzSa1rjkPA3QBv3qSWvSe3PkNUteVCoOpViTp9Zr+N5haSrvxEQOl4D54FG
         9Ss8BcsiJhCzY12/hjyeQ5XYI0HKe5V3evNhmy7jMj+AQ31yfGjlBgt92ae+DUNT557l
         RwRWsqmYMCZPVD8ypQ39YSOS51jPxMf1HlrVr+8ZbO2WI4mQLrgOiEvO74u53entQ92Q
         OSKGrskc6KwwW2bhC8+8ISa2xmP4LFTOdcwS2QbxxrDqS6dvf0r3z8S34EZ2395aqJ28
         Cj5A==
X-Gm-Message-State: AOJu0Ywh4TciIrkoOIjWcWf/sLM1qyaYNYkIdpD5ldZbbfPoh1q+xcPA
	hpZUJ7SS9Btfq918Di98cYASIA==
X-Google-Smtp-Source: AGHT+IF+iT/dkRg4acU9/UI6JfKKp3ZeC5AsmWMXEg5lVCySIqfHTR3Hxy8Ffc+kE8/6092Ro6zdzg==
X-Received: by 2002:a05:6402:124b:b0:523:100b:462b with SMTP id l11-20020a056402124b00b00523100b462bmr7068044edw.5.1693813217425;
        Mon, 04 Sep 2023 00:40:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id d3-20020a056402516300b005256771db39sm5480392ede.58.2023.09.04.00.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:40:16 -0700 (PDT)
Message-ID: <915a9e2d-36ea-4a74-7b1b-9688f215b6f1@linaro.org>
Date: Mon, 4 Sep 2023 09:40:14 +0200
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
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
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux@weissschuh.net, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 1/9/23 04:42, Yuan Tan wrote:
> MIPS Malta's power off depends on PCI, PCI_QUIRKS, and
> POWER_RESET_PIIX4_POWEROFF to work. Enable them when POWER_RESET is set
> for convenience.
> 
> Suggested-by: Zhangjin Wu <falcon@tinylab.org>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> ---
>   arch/mips/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index bc8421859006..13bacbd05125 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -547,6 +547,9 @@ config MIPS_MALTA
>   	select MIPS_L1_CACHE_SHIFT_6
>   	select MIPS_MSC
>   	select PCI_GT64XXX_PCI0
> +	select PCI if POWER_RESET
> +	select PCI_QUIRKS if POWER_RESET
> +	select POWER_RESET_PIIX4_POWEROFF if POWER_RESET
>   	select SMP_UP if SMP
>   	select SWAP_IO_SPACE
>   	select SYS_HAS_CPU_MIPS32_R1

Shouldn't we also update the _defconfig files?
