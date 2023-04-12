Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A79996DED32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 10:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxFcS4Gnqz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 18:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TG3HVhuv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TG3HVhuv;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxFbZ19SDz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 18:04:07 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id qa44so26332091ejc.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681286643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sCYQWmrIHjLodZCUEstj/wAUl8903bf+mCezIM9gIs=;
        b=TG3HVhuvb+yHg3+UCrQWVrPaZhnVggB+RTvB0Pk09hNmrC2AYQz++koo4E4+CDrAOU
         pPLu4b9mtg8xMwyxSv0ujdYIw/HzwYiN/TJeZLZD/8GKuGrL5i1+x166V2W1H0TqBPde
         Z+LyeS8tth4XhHd7jdXS2Gsu3+qgmtwuSo9ncvGkxin3QOIkBuAE1R6L9ANkI4lf8ZFU
         +3s4PCb0Xmk9+YoCb42tdD83/YeUZhzsDPybPBh13YPKEF7mXd08dRL9zdCh0ZDJNdV3
         tGQbkY93qCRDW3kpUUKV+OXW297TqIFpSKHBYQ4qxCnzZz1oS1tw0BQgVmev7RsazY7s
         VCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681286643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sCYQWmrIHjLodZCUEstj/wAUl8903bf+mCezIM9gIs=;
        b=xzWaoZqTqNKHx+yXHZ1AFi0UR6E9PqYzCefu1Ayp01zGTguKoWZ+Wtq/6RZt2OZpMb
         lqoNulFp4ECv30601l6Cf/uMfM1/mLw7cuDTGm+nFy525O75e4DOrzY3RRkQoXR3un6V
         T/KxAiB91htz/ZqOYqR48KS7zbjlW2nfxQpiXXbTRPnyVHQp0lXRgAvv3r9/h+szTcIM
         cbBn4CmU3jAJnyh5JKw8xZMRaKVsshAh8kFEFqmJP1RkYsCMSYTGzCyDbd24/MoANEf7
         kE+m0zViMF2YMjx6PbmADo5TmBtXg0Uwdifw2qp3+c8n/sirGsRpY86rfVz7HSq9+xpy
         BjLg==
X-Gm-Message-State: AAQBX9cmy5nEt9B9nSsSuTMLwSAGxzfkMbJFPvnRc9zAYF2OZMQJr2Dq
	2UVmlZO969Xl7wUc1ExFp1JmTQ==
X-Google-Smtp-Source: AKy350bqsn9FugkvkWfL/MPu3dTIMA0gp1RVfg+cMrbd9FUEsvEngyqRYlsTCIugeFcFo52sPdNCog==
X-Received: by 2002:a17:906:8601:b0:948:6e3d:a030 with SMTP id o1-20020a170906860100b009486e3da030mr14441369ejx.42.1681286643266;
        Wed, 12 Apr 2023 01:04:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id sc40-20020a1709078a2800b0094a84462e5fsm2998603ejc.37.2023.04.12.01.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:04:02 -0700 (PDT)
Message-ID: <848f5e3e-44ca-3648-2d6b-7e06ce7b5cda@linaro.org>
Date: Wed, 12 Apr 2023 10:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v13 03/15] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230411184313.3679145-1-sean.anderson@seco.com>
 <20230411184313.3679145-4-sean.anderson@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411184313.3679145-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/2023 20:43, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v13:
> - Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)

You got some of the same errors as last time.

Test your patches before sending.

Best regards,
Krzysztof

