Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB0675BAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz6B61GZMz3fKZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a0EizrBV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a0EizrBV;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz69C5GPbz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:35:58 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id r2so5483473wrv.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtibDBYP4iMtkWCSC6UIrfEqP+79E1l1LSnhYmoZi84=;
        b=a0EizrBVJ51x9XMo0SmIYGujI1VE9IuQMAZSmgDPW3HPHFB6mYwi9BGrBxpjbkObek
         itKHvG8slnp/701yTvitXMlHAStQ4lI9mGrzl3SjhF9u0iQrTZxG95kMPUuh8uXghW6r
         pRu6wigR3XGbq2vfZcGagjR/wpGM9BxewkzOfmmuGjFMBkhB1yQihKjwKg6vXsj5e+Jj
         irk/A6di6OnFkhm9W+AXN6OnzD4sMdxfpGGGdcxM2C5VTa0JLQ8R/PHNY3GXxGQSrkNo
         Q8UdRjXv4/n1eEw53K8AUfaTgN69IBSSFcGgAEcicYplX/Rw0A8jpTfAeldp4L9u00Z4
         eCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtibDBYP4iMtkWCSC6UIrfEqP+79E1l1LSnhYmoZi84=;
        b=NA1Me/EHfZNVIb8sSfBIcvw6P74qsS4Yw5xytA63dDiLJdg6Tk7Ltx/ThSSbcqrA81
         APYs5AGbR2xHibZl9dl673PYy+UJBJ6CH0Znune1h1cEJDCB1aGGGJNWN+QZIURKPnXF
         PXgk90O1oWqewTgQ3jASDS3LLCz0oIlAzxAaWqc5VvIlyfumueObo5+iLrR1LwcTqAy/
         LzCILqs6adJKTfrlk8N8s9vYhn0m5j3PpSzKxvz4jKpluiU1SXrfXmGiAwTcniSXHw2U
         YHAT+psaqPdC32u0YB/WTuAEpratsUN+PyDBc9ML9QDdZyLupVKg5v0q2Tf3shwOSyxP
         aXSw==
X-Gm-Message-State: AFqh2kqgjXp9Y+0IMJx8/4AnWPa6D7qRbe7pgj6tWtnVdxJtJO22z1wJ
	BHMahRZg0PL8p9QDMeQbAGKK5A==
X-Google-Smtp-Source: AMrXdXt54pJEA64hU9pqLpjAzfF4EB4BwV1gaYq2BN8kjUL2tMAG73rGdCUL7ncRTIzQmMkHPYLxTw==
X-Received: by 2002:a5d:4cc8:0:b0:2bd:d779:c1b5 with SMTP id c8-20020a5d4cc8000000b002bdd779c1b5mr22020011wrt.27.1674236151289;
        Fri, 20 Jan 2023 09:35:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b002423dc3b1a9sm35871262wrm.52.2023.01.20.09.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 09:35:50 -0800 (PST)
Message-ID: <780f2669-7ef0-1a17-9e04-50eeba4c2cf7@linaro.org>
Date: Fri, 20 Jan 2023 18:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A
 board
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
 <20230120133455.3962413-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120133455.3962413-2-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Matthias Schiffer <matthias.schiffer@tq-group.com>, soc@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/01/2023 14:34, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> TQMLS102xA is a SOM family using NXP LS1021A CPU family.
> MBLS102xA is an evaluation mainboard for this SOM.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Improved the description mentioning this is a socketable module
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

