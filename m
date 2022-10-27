Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2E60FD58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 18:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mys5S6YdXz3cHX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 03:46:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z7vJkI3S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z7vJkI3S;
	dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mys4W2sPgz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 03:45:44 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id x13so1833388qvn.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8E7f+pbai6yNionn/RucFtJANfu+mS+MIa2K7Eho/8=;
        b=z7vJkI3Sc3woYN3W1CoV94ELnbBfBwnApLU5+2VLwFinpR5/nT4L711ilpekqYgNcC
         ukQAnfFpt0DZ3pNmN1snpxXrKx/mt0z/leChy5W2pSjYibqelOFNWafYk5FZW1EBdIBU
         ieAJUANrvOPu06uXKZewj3T4bfK/EJ4Wg+bHUO53SOr1dZkOa4n5/fh7iyqInnn0rw7A
         ZUPYTMp0iiMt3VQNO7I2KOboAamniF7cM4HtugId3udr0Bvog/ezITI2vEc30/djD6IM
         WOfg0HP9hne7Pc+0MsIyhW89Y1m1D9/7x5mRE0wsZHsJs6u7C8yHSTBzDTTHFQ5UYBSx
         Yw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8E7f+pbai6yNionn/RucFtJANfu+mS+MIa2K7Eho/8=;
        b=AGgQmrQaNg0CgdTfGvnHq9GMFbkz4ZxWt3bvnUx5Dki5hdFoLMStsQdWHy+W2LAVEx
         3bCuJj3nOXMLmj03QXiMmW9bUUoaA+lolrG2xyF8R4LjnbGddxrI7H07z9rH5ll8ePJH
         n/hPDmb7S6+AKVlnIzx65cDL02bVOe3tCeEmcsh7v6SgB6fK60b4usQpYx5XS7ymwVvI
         +2pdmXAEogGxxu7YkROFxwYBiGHFK+vVrzfDOaye7tp+OQLZ0yocomYCiyGeI7CGW1hu
         zQQafPkp4KeN1stiri6SxOgxD3a/Dq0K+vdPJV2b4I0fkhYo2RlYeCYNJRO5Sf2yojlR
         Gz3A==
X-Gm-Message-State: ACrzQf28sEFAMEjn95HInj/NAVDyqwfZMd27Ug5WxgbEv/9NZ440ayzE
	oEbewusT6nk7G0XXem+tCJjmoQ==
X-Google-Smtp-Source: AMsMyM57a6LQobl39EIHUvYv9F9ueqjvF0NgC33FdCUUNQFRFn6DRCQ8utqMeylgbUFbcEJxjucwNQ==
X-Received: by 2002:a05:6214:2aa4:b0:4b3:fcfb:6479 with SMTP id js4-20020a0562142aa400b004b3fcfb6479mr42265023qvb.127.1666889141013;
        Thu, 27 Oct 2022 09:45:41 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bq33-20020a05620a46a100b006bb366779a4sm1293337qkb.6.2022.10.27.09.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 09:45:40 -0700 (PDT)
Message-ID: <f1f514d3-cab5-9502-02f6-0a1b84067eab@linaro.org>
Date: Thu, 27 Oct 2022 12:45:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for
 i.MX93 platform
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
 <20221027060311.2549711-2-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027060311.2549711-2-chancel.liu@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/10/2022 02:03, Chancel Liu wrote:
> Add compatible string "fsl,imx93-sai" for i.MX93 platform
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

