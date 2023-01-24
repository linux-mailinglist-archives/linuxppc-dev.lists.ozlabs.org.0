Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73613679DCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:44:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1WV62W33z3cFK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 02:43:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yf89n9wH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yf89n9wH;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1WTC3DCBz3cH1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 02:43:10 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id j17so11793140wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 07:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/a+6+PTNK+EgdrHpwsWimSpIXxnD79ClgSYevcrnuE=;
        b=yf89n9wHbV/XnkigjdbRLaTnDYXsvazoQNIyN4X9VfmFm/yRnOxKuD2VSDfh5nnAp6
         j4iTCxnMuig5YSDyZo8Erw2bTT2twrR2zWWFhJy6JFPsnAcAcdTGVctCKCp9UWLgE4+m
         3Zi1q2MGqqELl250sQRxjmNJ0u7dcRA6gGRtqvEmswNkmgTPhecSFQp0Il/496oc8U0/
         YdfTzSMYOXEck4uhxPAIyQRXI+zoKOVzm9a5QSHHp61yj+d8NPyK6ZRiRzTixITkkm6w
         gciX8E0C3kDc17akCA4xh1Di4UAEoZQsJSGgqIo/e9jYsdup1v6zagNvDeIvivrAfAuw
         HUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/a+6+PTNK+EgdrHpwsWimSpIXxnD79ClgSYevcrnuE=;
        b=4MQjCed1b6xFqhRpoiKS0ORAz00NQCXcsF+EESpfDI5VdUWsZsmDGl3cg6dYJhF3O8
         xteB+sP9uqrfUuHISYRgPzaU+J+R96lvodSlvGSq61HKPF4kA9Wfybkgi6Q/DiS7+IBS
         8V+PSjBZruf9u40JLJgrm9YG80MJLYS3ohOzPosJvQmfr6buI9bWQ3/02paUV7+9o8fN
         cHUWZdINocFcyeE1VEvGIB4WqaVfVZQUFK/OaIHwObIWWSziodyT64zfBS9AVPftrEZv
         bVdyfnVEnbGsTycYLrDkyBLi3lqRdGaH4cfx+o6lrwDOHCt5Sc/Y+9q7CWl4w2gC8xC7
         rO1Q==
X-Gm-Message-State: AFqh2krwtS2PvLcbfZ4FDzGdIiniDfyQdPnGcA/2FIfdLXQ+E1e6uWrL
	foxCzz9emBSCcUegnlHIM94zlg==
X-Google-Smtp-Source: AMrXdXuYOE3dT+VE3oSwdKK67My+x+RmBaEi/JYTrdmPi+C9tVhvtgV7Z5YjOeHbO2Ewx7v3D/2lrg==
X-Received: by 2002:a05:600c:1d12:b0:3da:ff82:f627 with SMTP id l18-20020a05600c1d1200b003daff82f627mr29438313wms.25.1674574987235;
        Tue, 24 Jan 2023 07:43:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d49d0000000b002bfb0c5527esm1611046wrs.109.2023.01.24.07.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 07:43:06 -0800 (PST)
Message-ID: <e34dd560-1fb5-bd27-a659-eec465fe584a@linaro.org>
Date: Tue, 24 Jan 2023 16:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-6-herve.codina@bootlin.com>
 <316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
 <20230124104232.183cc9ff@bootlin.com>
 <37a95380-ee68-5c3a-3b96-48cc8b525f19@linaro.org>
 <20230124122347.1a531d0f@bootlin.com>
 <81f80190-a05c-5d0d-11b2-a80573b86e1c@linaro.org>
 <20230124151514.58d77765@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124151514.58d77765@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/01/2023 15:15, Herve Codina wrote:
>>> Is that what you were thinking about ?  
>>
>> Yes, except again, so third time, why calling this "cell"? Move it to
>> fsl,tsa.
>>
> 
> Why calling this "cell" ? Just because we reference a "cell" using the TSA
> cell ID inside TSA and not the TSA itself.
> 
> Maybe the problem is the term "cell" as it is not the DT definition of
> "cell" but the source/destination of the TSA routing.
> 
> TSA can route data from/to some "serial controller".
> These serial controllers are :
> - SCC (Serial Communication Controller)
> - SMC (Serial Management Controller)
> - UCC (Unified Communication Controller)
> 
> Only SCCs are handled here.
> 
> Maybe the term "serial" makes more sense which will lead to
>   fsl,tsa-serial = <&tsa, SCC4>;

Yes, that's better. Thanks.

Best regards,
Krzysztof

