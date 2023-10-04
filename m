Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D317B971F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 00:06:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=N3u5NnMP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S18083H9vz3dF9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 09:06:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=N3u5NnMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tuxon.dev (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=claudiu.beznea@tuxon.dev; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S10GZ6qdwz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 03:17:56 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-538575a38ffso3980540a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Oct 2023 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696436273; x=1697041073; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IboRMXWE799EUNN9JDL2Tv/P+eapXOiA7kGcWk1PU9o=;
        b=N3u5NnMPleEFCNAX87ya9ZE+TziBtUminlkhDsIQE8YUAgviHfsaPqreZU447Lqdmp
         brfWaRtap25BszlDJ3Dz7zeGlE6NAX2IfpyjhzGvaiqCbzcONBnvoXu6nse4cTRhlNyb
         6GWpHzmxhT6FDaSqYG7OM6iMdYbRtQsrQdbtFencYbtP17jfYVztB7IaUPtDoAVI8MNd
         wtLhNsnSAtia2yzpzxLBclV93QbDsJoYA8+70WjZQ1/oBHqessgUaA4KrrKAhm9MrY/l
         N0YMB0d8kTFKnw1mdMiwCK/CfStvE0fF6NHZnxqSbIEuomEcHio2Pxx2M2zRGJUbziq4
         cYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436273; x=1697041073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IboRMXWE799EUNN9JDL2Tv/P+eapXOiA7kGcWk1PU9o=;
        b=UcuR7/HCBiRqUuDhclJ7/yTt3oMVpiZ3WGlfTGFOMkHG/cp8JpY70XHeAtsDAf3w06
         ve5/7eWQADUPOhXAiasKvSQpDHtrjXUWQo916CTqMSoNXIwlHtTLG/o6oVJNx+pJiPt/
         LgbL3BXb3xCgSDx90pCpOPx5w82X7gG1jb2qcinSviUtOVrGku+6fhwm4QaV+mc8B5cS
         8eO7Gq7SQG/K9p3bxSqleEvKNyYSk2ZhuvBB4Lsz0BBONLAmjF7Ivopn790UwAhhy4Ko
         r0Rfr7hl00hzB2MwctiTWKb6Z/SFchqwZpojBGCAH6w4damTVBn/HklxSjm8Am6Vv6Pn
         ysDw==
X-Gm-Message-State: AOJu0Yw8u8CdfQjzlap/66droLqya4HtJF6GdzYLhcu23g7VB1oVbpTC
	hGw2HQoKVDxYjnNQIv18LLEzZg==
X-Google-Smtp-Source: AGHT+IGxOeqnR4/4kozPd8vGztjp/+DmdrVb7jcdZSkFUd46at+lIJgvhTUzH7MccQN+WduUqYwZjw==
X-Received: by 2002:aa7:c508:0:b0:523:100b:462b with SMTP id o8-20020aa7c508000000b00523100b462bmr2617775edq.5.1696436272722;
        Wed, 04 Oct 2023 09:17:52 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.24])
        by smtp.gmail.com with ESMTPSA id r17-20020aa7d151000000b005346bebc2a5sm76257edo.86.2023.10.04.09.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 09:17:52 -0700 (PDT)
Message-ID: <72fb244b-e4b8-4eb2-cb20-1d3d37f813ab@tuxon.dev>
Date: Wed, 4 Oct 2023 19:17:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/5] ASoC: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
 <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 05 Oct 2023 09:05:16 +1100
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
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04.10.2023 18:58, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  sound/soc/atmel/atmel_wm8904.c                             | 1 -
>  sound/soc/atmel/mchp-i2s-mcc.c                             | 2 +-
>  sound/soc/atmel/tse850-pcm5142.c                           | 1 -

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev> # for at91
