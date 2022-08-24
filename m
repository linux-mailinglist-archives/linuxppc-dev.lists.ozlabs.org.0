Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705B59FA5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 14:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCQr90s7sz3c69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 22:48:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ExdVABFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ExdVABFF;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCQqW2VgZz2xHk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:47:48 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id m5so13173817lfj.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=B0YHX1DxtYHmEtJGgAoy2E59Dxdr5pOaRwx+CNb8cXo=;
        b=ExdVABFFCg0YrICjQUHrRtJdAu9Mu2FYNhpTmNxI5Oii0WNEj5VBEnO51VbBoxw/E3
         Yp7qOO3VcJaosHeWvGY1Wu0hAIiwgBlDywDzFbUMx2CRh/E2mww94wSbXgDnlHQDPGqN
         iisSr1MMhf6gnNgkHqKjnrPsY6TxvRSPwdGcg64FOakvPZYTHGDDQUItixN3VB34s2dA
         HOZ/qbnzOUMatatsHAiuohCx+OW5MpYAsYd+wrDXAc0y/sfVSGA4+kFB+h+j0dMsVqm+
         p8rWyqRaKsrOqpf7LvOe3xzo9oiEwEYu5eR/PH9cHBBldStAdy7U+X7xrLdHR0B2FxM/
         vLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=B0YHX1DxtYHmEtJGgAoy2E59Dxdr5pOaRwx+CNb8cXo=;
        b=jZKaIoBUpkfFteQvEeanBOTdhcytFlNLLoTCJStrKpeftLUlx9nQdaYvChJ1abqMpp
         DcXc+avBTaJLrgeX7wVFIk1DFS0uXXbWsT0mo9qnHuz5l1eik8jIsGoViFsKBbnS7XZo
         zJ1JGETpvSM5/2KUw7/UVzmJehjihUY4facGH7aoQtt4wVqGrGIE/6stEuSsKYvULRL7
         Cwm8oDK62DV6a0FeU67BZocFYaBSScb53/2FCPlS4tv59M7zJO2+GGc/SGTK/kaklqe2
         ymW1yaDcn+1qCIwhkE1py7CY9Alkm+ic7U6S3HPShOmZ1zZYdWnAwUpaxUcbojadcteS
         fRYQ==
X-Gm-Message-State: ACgBeo0g+A1gnLOSKVrPICxmR1rLcmx2XdLNon8MWvRYOIo4w1RrdLfU
	1Uvno+weyHh/kscMGeAAD7Xw8A==
X-Google-Smtp-Source: AA6agR4bRuL+NaricpxNR8LYFD1ua/hvzMiXB1+ErOc5A92wdvDFMqS/1LCh1V/LIRKZsw0D53rQxw==
X-Received: by 2002:a05:6512:692:b0:492:ece0:32e5 with SMTP id t18-20020a056512069200b00492ece032e5mr4275032lfe.636.1661345261144;
        Wed, 24 Aug 2022 05:47:41 -0700 (PDT)
Received: from [10.243.4.185] ([194.204.13.210])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0048b05882c28sm3006728lfr.271.2022.08.24.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:47:40 -0700 (PDT)
Message-ID: <1c2685e9-1501-8815-2cf0-b545bb91ca5d@linaro.org>
Date: Wed, 24 Aug 2022 15:47:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] powerpc/82xx: remove spidev node from mgcoge
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-spi@vger.kernel.org
References: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
 <20220824082130.21934-3-wsa+renesas@sang-engineering.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824082130.21934-3-wsa+renesas@sang-engineering.com>
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
Cc: devicetree@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Holger Brunck <holger.brunck@keymile.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Schocher <hs@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/08/2022 11:21, Wolfram Sang wrote:
> Commit 956b200a846e ("spi: spidev: Warn loudly if instantiated from DT
> as "spidev"") states that there should not be spidev nodes in DTs.
> Remove this non-HW description. There won't be a regression because it
> won't bind since 2015 anyhow.
> 
> Fixes: 5d1d67e361ea ("powerpc/82xx: add SPI support for mgcoge")
> Cc: Heiko Schocher <hs@denx.de>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
