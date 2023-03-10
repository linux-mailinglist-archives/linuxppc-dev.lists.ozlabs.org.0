Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB26B3755
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 08:30:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXyPN72GVz3cjG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 18:30:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mypyJqnC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=srinivas.kandagatla@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mypyJqnC;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXyNT0ym9z3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 18:29:12 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso2746035wms.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Mar 2023 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678433346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=;
        b=mypyJqnC/F6lSavmkFjuNxCKPeRm25olFcbDuBbOsNUdgP5ZV1s0p+0BbdmQia3Nco
         eWD82VasDd0oGCDEKHhbnfPVkrOrJpT3f1RdWpJTlQ9FFHc8JoHhmHwOWxMA0+fH6UtJ
         5RnzxgtdCPBWoloVZpMX2hboHtHa6/ZkgrUh+vWSktIBlGqc4ZrFmPcCxkKAUI7h9WkK
         FqjdmcRRCl+OyDdE05M4VOz4/XwOMi9xUQjLahywyfgovNrTASKp3ts1ZdL9YTrjMBVX
         MCobRRHYDuKI5CshilPmv2tUYuHFRqIH/mMLjgOpNFDI0z8nmNRYTmaceloOm3TFnnFC
         kRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678433346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=;
        b=nAPYMkKDyXsydZx4105ob3mU/64H5W5lmCqAUpr5Y40I6jY1ZQJc3WrmyMyQdaOzZ0
         Z9I8cVKZVpzy15kb1NNns0VQjzjtW1Zu4Msm7teTF4NMMJ+mHUQLrfeu4jVwQ5wNedfb
         DBT3+W7Z0tUADdC9RUqfobG6yy90Uv4tkmeRJpawUaOoNSyR3TwR34XOCEmN9/8HkVFz
         B04gUZrKneIuz4jw8IrkuyHQXsyBDa9hubQVD0yN7TSWb33nlLQ0BAmx/6NTPsjDJwSg
         td3w31801MCeyTJ9ZyGn7JmduVysHUgxVCHNaW7jWF2FmLtk93mnoRgLjDgwkVUk3krL
         GNeA==
X-Gm-Message-State: AO0yUKX81QgS5L6K2pp3uaS3feBRizb2eROQVKVogoOOQZdQMKsaD+bC
	wNE3AfiwDEyWJHOuTjynoCI0tQ==
X-Google-Smtp-Source: AK7set92+cRtbKy+3ERr2ns8dFh7B2dy3XcYI3Bks9AgxAOC76oxIeXSLX+VzvC44JGh3SZrPpNXNg==
X-Received: by 2002:a05:600c:3ba5:b0:3eb:4501:6c60 with SMTP id n37-20020a05600c3ba500b003eb45016c60mr1132916wms.5.1678433346655;
        Thu, 09 Mar 2023 23:29:06 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id o1-20020a056000010100b002c71b4d476asm1393871wrx.106.2023.03.09.23.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 23:29:05 -0800 (PST)
Message-ID: <ef92dcac-cadd-b85e-d6ea-512684266e81@linaro.org>
Date: Fri, 10 Mar 2023 07:29:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 matthias.bgg@gmail.com, bgoswami@quicinc.com, vkoul@kernel.org,
 daniel.baluta@nxp.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jarkko.nikula@bitmer.com
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/03/2023 10:30, Claudiu Beznea wrote:
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 41db6617e2ed..dc892fac4baa 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -12,7 +12,6 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <dt-bindings/sound/sc7180-lpass.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
> index d43f480cbae3..ee4a4b553e74 100644
> --- a/sound/soc/qcom/lpass-sc7280.c
> +++ b/sound/soc/qcom/lpass-sc7280.c
> @@ -8,7 +8,6 @@
>   #include <linux/module.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> -#include <linux/pm_runtime.h>
>   
>   #include <dt-bindings/sound/sc7180-lpass.h>

Has these been compile tested? the reason I ask is because both these 
drivers need SET_SYSTEM_SLEEP_PM_OPS macro from pm.h which was getting 
included from pm_runtime.h, now that is removed, am guessing it will 
cause a compile errors.

can you atleast replace this with pm.h instead of removing it totally?

--srini
