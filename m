Return-Path: <linuxppc-dev+bounces-9007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47066AC7D13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PRL1HPZz2xRw;
	Thu, 29 May 2025 21:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748510975;
	cv=none; b=oILH7U0x+SKVAXtzO3fR5Fd/H9RoKmLv7oIM5MaVL8uqSmAscx9AE44qPtKVLjNrQw2VVdYCXdUdDlWhCk1qAGDMpCJR+8c/7mCdvN2Lf8jtoQWoYxTdpW4Q4n012kYkUZDD6LyBbrdXYYEDpKslVQ1x/4a/2Xy+S7BeOVe0q8sLi+b1ovRsfJJcG2Tx/i0FfpahVt8NAsMbyPpLbWPcRcOoaIIdQtaoxGptQxDPhS4YVgRtG9gBw4PTNIKBt4l0l21wEqEYBwfIz/f2rNSfbL65LreiWd8P6y6UckSqpWa+SFvMVYKtRIIpplf3v9EXoKI7If0PcbITFisnleWD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748510975; c=relaxed/relaxed;
	bh=ukmwsK7wLoEmd7Mwc9Kn6d/asl3JL4qrg1VLtN/yAWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqddZnF05cIsxkNqdSdsl3cSB6tBumdL35WLDTdBTDt5MAVw1R7yAikhG35gkDVDCYBiiYd0uCl+wkDQpTrTt/1Lb9QihafCcmlqGMs8KdHdq2e1TAZ/EYixmjzi/lUtR5UBeF9Ud2bct2U+TjIZ7XrxiqdBCTmKPX5j+pKhavm9J4F1BVSyBediiKIADyLUA2xU8HNliyRwQmGgdmzrn/jON3CpIvW4EZbwfslq1AmnTBtRn2lKSQN2Kyl8BZ/HBsS6BDMfyoRMWAnf76zJkGDrEaacdeJ3TEn8UklUA6iRt6ZskCDqNYfqQw2lbCRVGPiwrt4vcTBT3VSBHrZPpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y79Uvzlc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=srini.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y79Uvzlc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=srini.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Lg222lJz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:29:34 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso478362f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748510971; x=1749115771; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukmwsK7wLoEmd7Mwc9Kn6d/asl3JL4qrg1VLtN/yAWY=;
        b=Y79UvzlcqBAfRCB4joMFmeadrOtsvoa6m5eKuQq1YYXIpu317h8PsREGyydWggiqmC
         xOPIS7ic1Hs9YWhsScL+uHMBCTnzrHkAuxWoeVO/t1MSeLQuPhKLyU4o3B7mgbOUr0m4
         BGiMorCW1IcwS0cxCAttJPm26DFbI+gRCXqh7a/A7B/DxthhQxVT+1cITKaXM7e9jCl6
         pdKfg8q67NL25mUel5In4glKhzNW8uLLHItw1fm/5VMAfpRzjKqCkxGc5kkLtpvkxksj
         v1CdeDmaArTZsptaHce6W08cxW/z78NBtqndZJa9LvA3fX6L8rTYYOfrjBhh4S8d4dhe
         ml3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510971; x=1749115771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukmwsK7wLoEmd7Mwc9Kn6d/asl3JL4qrg1VLtN/yAWY=;
        b=unXJf+jaEHDPRbFMFsB6ct7ZGMLc95UvSbGjtkO/iJ8UWqalqUvbbvV2WyKZu+W0Up
         iHsrVY4zRTeYUWoIM4kWn9m70WO/AwYD1FDRkhk8o8aF21n9K8tmmVNh5jo+dVAEvO3M
         1V0VGjocDa7GVfVZxAY8Nm47Nbu/hVEuohkQGF+WBndDuQWkyjSKSsJ27JXt6uDOkDhp
         zdCge4ZJESQMkWxKAw9RQZJyafzcAWGsVt4m6TrYjBnA8QzH2mf56+FbtrrVx5gjMfyW
         YWOAUyWQKBUkNyXXIvHcj1zuD5c6t4wfooDPHOVrBNEpc368opoTk2xZ0eWjvq1O3Q2+
         6jGg==
X-Forwarded-Encrypted: i=1; AJvYcCXuFUQrqaY7lH97enhhkmt4ENyEoA17DUTjfJeKPcZW5H2HWsTUM7DnYRyRnMXxOuBJTsKpWa0Dr/NL+kE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFsAIF9zfDQeFN6It3OAi5tOlP8aPKJdfUX+6rlS0OFZX5waeR
	gXqtAyVxFjz+s0eYkjfrkPYvgtRlrOv9FbkW8uBt85IXnFXJFWWtLUHp
X-Gm-Gg: ASbGncuBSMMRFAqSzvpMwkXIDk8slCgsEbnRGCMRrirx4zi3Y1K/inVxlZMt6cKFVsO
	aZvw3fed78rwRIUo7FtJZb40784iOKdVWtqbltkoH2XR5VEqVwbYu5Ij/bc94F5lv9ijhRyFuki
	lT+p1YbafV9vVxc9j4yPzDiaPCNvFXj9ZpS4mRxyamfSSf1VUGeIN8nQPggxMlnpZWbOdZJ8Apl
	AwqchrcO117t3kg+k7ADugqq3udWMNY1yxFIqIQFs2t7/uPXZBi5KCwR3weeTZj8K0TKsr6Yxj7
	hY35O7E0acypvr0gd7zGPuwOuFUdOSWfIYHTSYtb30MfQZElIIqY2XuGQLk=
X-Google-Smtp-Source: AGHT+IHmyQo7dsL5dPNTJ2TjaO6JEct4cSd+Aq2yaMATqNTe3OPulS7WP5rhQN0bA55QtDtTcdbAlg==
X-Received: by 2002:a05:6000:1a89:b0:3a4:db94:76f9 with SMTP id ffacd0b85a97d-3a4e957b9f7mr4850618f8f.38.1748510971118;
        Thu, 29 May 2025 02:29:31 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74072sm1457237f8f.52.2025.05.29.02.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:29:30 -0700 (PDT)
Message-ID: <a3ea3e51-2bd1-4155-906e-a39b35ec693b@gmail.com>
Date: Thu, 29 May 2025 10:29:29 +0100
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
Subject: Re: [PATCH 4/8] ASoC: codecs: wcd934x: Drop unused
 num_rx_port/num_tx_port fields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini.kernel@gmail.com>
In-Reply-To: <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [5.133.47.210 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2a00:1450:4864:20:0:0:0:42b listed in]
	[list.dnswl.org]
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [srini.kernel(at)gmail.com]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Members wcd934x_codec.num_rx_port and num_tx_port are not read anywhere
> after assignment, so they can be safely dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd934x.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index fa69817c97eaf1bf226b140f3a89095a50a128b2..1bb7e1dc7e6b0a5528cbdb7ada943a7d417fb684 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -537,8 +537,6 @@ struct wcd934x_codec {
>  	int rate;
>  	u32 version;
>  	u32 hph_mode;
> -	int num_rx_port;
> -	int num_tx_port;
>  	u32 tx_port_value[WCD934X_TX_MAX];
>  	u32 rx_port_value[WCD934X_RX_MAX];
>  	int sido_input_src;
> @@ -1928,13 +1926,11 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
>  		return -EINVAL;
>  	}
>  
> -	wcd->num_rx_port = rx_num;
>  	for (i = 0; i < rx_num; i++) {
>  		wcd->rx_chs[i].ch_num = rx_slot[i];
>  		INIT_LIST_HEAD(&wcd->rx_chs[i].list);
>  	}
>  
> -	wcd->num_tx_port = tx_num;
>  	for (i = 0; i < tx_num; i++) {
>  		wcd->tx_chs[i].ch_num = tx_slot[i];
>  		INIT_LIST_HEAD(&wcd->tx_chs[i].list);
> 


