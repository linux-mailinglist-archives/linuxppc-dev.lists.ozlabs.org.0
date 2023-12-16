Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F5815BAE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 21:24:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dex2sMcB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsyHb4JRrz3bjK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 07:24:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dex2sMcB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsyGk0Qj9z3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 07:23:57 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50dfac6c0beso2202844e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 12:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702758228; x=1703363028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X78ZMdhhJN3JWpvieTeot9+oGs2JdmyEnHsVumMXT3Q=;
        b=Dex2sMcBHrsVh8PodpxrKRxAFTXjjwYUkVQy0LfOEFB3/aZI0naeC/9Vc9Vwei77Ni
         x6f23Tdrsc9Bzcrbr86n2pLS1SlgROzr5DaCnUDdxulMXib153f3JNvgfYjI4QxPXr4m
         dmvFgqZ3ILW1xSaA77K/E74wAtjOUI6G2DlatYez87UvHs4WTUB+d2NcAsb+KvlnXIX+
         QLmIrLWRiZWCRGBlGkOcZQgBYPjhlgl5mEZRiBGFMy62Z3H3imdfS5CWFr4yj5CUEr1g
         I/I3IGKLP6l8Em5wBfwPKY9IhyQyiEwiRp6dKN8IeIV0lqKDSE/apIdSeWkBFyytB6pl
         Jp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702758228; x=1703363028;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X78ZMdhhJN3JWpvieTeot9+oGs2JdmyEnHsVumMXT3Q=;
        b=KF3zkfPijYFfSuKqmxm7uzZ13priluc6RUY41p1579Otr0wEfkA0UuAZqrQ1g6HsJx
         0kCSQQtBknDpZm5eEUupFpY+3+8flvZVZDWerHfkDpVk1nFLmqJD8ZymkNmUKaND92iF
         A5lwQWQeZmMm9WHUbpBf8gsheuXqC/lT1quFu/T9vhPKpmVG0F44lR7v9gfhOQD83nj2
         +EPokwykONIIu1wCzEZD5f1VT2OefMT3JezUp00/jEi6b+vZq5onwjdnU85lm7vsGCNs
         Xeglf6oOjwgqTIV7s/Xvxl4B/vDNpKY6voRQee27baiB3LMozaJZY7nvaBAw//efi6N/
         nSjA==
X-Gm-Message-State: AOJu0YyCxA+DoAOisy4M73tKDdTYfmDRUKFLFff4DYfoCDsoFSr7FQ6w
	J6ypsEf6EOyhTdsF4tWT99Q=
X-Google-Smtp-Source: AGHT+IENVxCq/MWAUwaWFwVw1NBBuQ99lFXbm4n4EZzX7Uw0VXV/iqkibbscxZaDoXeUTqcZsh2O8g==
X-Received: by 2002:a19:6559:0:b0:50b:efd3:7e3c with SMTP id c25-20020a196559000000b0050befd37e3cmr6015036lfj.31.1702758228277;
        Sat, 16 Dec 2023 12:23:48 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcb9:f800:bce0:dd9c:e9fe:4f11? (dynamic-2a01-0c23-bcb9-f800-bce0-dd9c-e9fe-4f11.c23.pool.telefonica.de. [2a01:c23:bcb9:f800:bce0:dd9c:e9fe:4f11])
        by smtp.googlemail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm12099727ejc.206.2023.12.16.12.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Dec 2023 12:23:47 -0800 (PST)
Message-ID: <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
Date: Sat, 16 Dec 2023 21:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD
 support if they support I2C_CLASS_HWMON
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.11.2023 11:16, Heiner Kallweit wrote:
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
> 
> Series was created supported by Coccinelle and its splitpatch.
> 
> v2:
> - fix style issue in patch 4
> - add ack in patch 2
> - set proper subject prefix for all patches
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> ---
> 
>  drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
>  drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
>  drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
>  drivers/i2c/busses/i2c-amd756.c                   |    2 +-
>  drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
>  drivers/i2c/busses/i2c-elektor.c                  |    2 +-
>  drivers/i2c/busses/i2c-gpio.c                     |    2 +-
>  drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
>  drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
>  drivers/i2c/busses/i2c-isch.c                     |    2 +-
>  drivers/i2c/busses/i2c-kempld.c                   |    3 +--
>  drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
>  drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
>  drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
>  drivers/i2c/busses/i2c-piix4.c                    |    2 +-
>  drivers/i2c/busses/i2c-scmi.c                     |    2 +-
>  drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
>  drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
>  drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
>  drivers/i2c/busses/i2c-sis630.c                   |    2 +-
>  drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
>  drivers/i2c/busses/i2c-via.c                      |    2 +-
>  drivers/i2c/busses/i2c-viapro.c                   |    2 +-
>  drivers/i2c/busses/scx200_acb.c                   |    2 +-
>  drivers/i2c/i2c-stub.c                            |    2 +-
>  drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
>  drivers/staging/greybus/i2c.c                     |    2 +-
>  27 files changed, 28 insertions(+), 29 deletions(-)

This series and my other series are sitting idle in patchwork
for 3 weeks now. AFAICS they have the needed ack's.
Anything missing before they can be applied?

