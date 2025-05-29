Return-Path: <linuxppc-dev+bounces-9012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F7AC7D29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PTm4s2sz2yNG;
	Thu, 29 May 2025 21:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511314;
	cv=none; b=mtToigTQHpJdcFweovmO4gWgMOzaTM4+X8TC4pBsmg8cTKR7eGxLJAmFQsX8TBrgNYLKo98J8pBIIUvzmfFyb01GpCDAoRT84ACmmZVWwVSbcvZRxvke95+SguZXtSy69Kbeya3d6TBrEOv3M3fAJBJuvP6DF8VRSFie/+MdAbSqEkAuqZlOQNCIJoMSGzgTYJoBntSK1uHHn+bN+gPnt/GeAzlEt5ZA8h3NLgNLIVdaTc8PtfpDxxICOiEvOVQwVzJ/ZXUZXhQujmYU1bk3eN4iUHgBHWNCb/1GmBztoE/GepKxAMKhMUNIBp0xBEkzVXMugNHcDyRdCQ80JbZ1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511314; c=relaxed/relaxed;
	bh=4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMkurtUouwIbvEQ/EVZm2eL4qYJQw41asZ27PRNktNRjsC+kuDYk37/iWUfw+LySr2tvJzdprC82tt3lAS4d5c9/+Mv0Ax9+cINaBCnVN1LyKIS/Z7wexOaU0Ua21rgUp7AGHg6TF1VjrWvZ1B/RVhSqUhvejWLrsPyXuo5JWQ2ntIMe6TODeLleHSsBSGXyrNehrXd9kh+XeO3sED91JHkNMLb5TcX6/Ik+sSd9i+YgJtq6ofk6BQhwI9+Je/Cc8ovHcGgMTU/okT3UcDNlpVkM3MCQo2cS9kQqunt4VuOsNlX3B7lTCN/ViJuxLKJ2G/s56SMzH/IxR3qf5rJNnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzxLIlnZ; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzxLIlnZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7LnZ0br8z2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:35:13 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7D8go006104
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=; b=FzxLIlnZDhQwevYm
	09rGmnA/fx3s0X0UI8ttCiJQ4w947F8HmT2FHRhBT57ka0D463PUd/x8wO0ecCoS
	WjTOEtFPc6QXmy/T17dHv1kaDocvDqzJX5+7JXgLGfOynTeQ7hWN3vomj/Jp/L7r
	IV4vuois2cBlQs3ApXFM5aASVCH+YqNg4Zgz8mtl5OLBblPWiNWMKx4w9w+pk+p2
	DX27OgneVX+4S+3P2uT4jj6zrXB+yPiUEWpUCXTKGCBXxPTmMyfM0x7frgLW+CZF
	3XSu3VLKPL6fO332qwV4R3l5/9yoXD7gcNKz4BokoxTRL2yN67iLhT6rfDBGQQYZ
	mXXQqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d79vj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:27:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31220ecc573so425691a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510876; x=1749115676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=;
        b=lCQMGsCmsGVYhUN4RRZvsCWlNj1EzMyaMu7BCZBFz47PWvB2EFf3J6lcDT4Nt3lbmh
         iM0MkjfP4n6mLNE0PPPLm7pPp10skzpBx7khTbHVaUxEG1twkAxxysjoyxnibHF2u4rG
         gky/2rQj8SuH9R+iY0tAXToxUSGBP2gG44JzPZFXp6fCiX1bfL+p2u/seqrH7cu8T0/0
         aZkeIPVa8ApHf6DJMV0QWYhafu6XV6lICqnsyifbkHvRiyk+g8yznZKeNOp9guNhcuhi
         Sb9/Y6alVU0sym/FQ9WEK6OBwtDkuEzagO2M+3KZzPPf4fjyo1o7oj1XXfzahlRH+GbD
         a1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVynFpzwfxc8Y51UVvpdFHSLgfQsRKB8g1RL3jNxBV+VPbLOtlwO5gJeQ0U3lgRWP7ZicBMaePg/Xk71e8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnCZPcL+u3kH4aCP7xlXmmUBkyl2xrFVaUGNf37KuHaXMw+scT
	xHiWYy8lOuXGfrnDQGMHvoxpcBMWhKwL3GTWItCJ/mMlcSv6xVsitQLxdFiQWArIhD0fjAi87Bc
	BhgrSBGBZSpKOjmEmse94fCSNg9slq6Wg8ZxxGudB4CxMr1kK2JwkISIBwtqoCG8boCaQquP2ja
	N5vIE=
X-Gm-Gg: ASbGncs8oOAF6Z/8WMUIQLu17nWQOHKvJ3d6oSXfWCILtEdvc3nSCVKryP7eqUTvWmJ
	67iOIwSzoseWJyUo7PLPW8A2X8UYfHEOaRxEvOAgPg3mDRKnDPxjv8mIZNzxdzfyxzs2QwiM/46
	vwnRRhTgX4t2qsa/yqvvM4kdExP2doKwbszkwIkKY4vOIgIUvyhbfn2cKhQGoxOvm7bzVFcgwkO
	jfSp/L6I4XyRHj0V1I1Uj4fi9zmaE1ElL/+WKkpXwG/i6JEbJE9qTq61omn+aj1DEWT2ddRyOim
	SPorK2VlHBCKbbdmqRg3LAu+1qTZll3BcZpHpg==
X-Received: by 2002:a17:90b:288f:b0:312:e9d:3ffa with SMTP id 98e67ed59e1d1-3120e9d46a7mr4179227a91.31.1748510875580;
        Thu, 29 May 2025 02:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVu8gsVIcc+j2x0F4CmddwNg9zAzw7EDQGOQrTCjISKQhs+iM8+1jN3A0gsZtkJaioa2g2hA==
X-Received: by 2002:a05:622a:550f:b0:47a:e1b1:c6c9 with SMTP id d75a77b69052e-49f4781eaeamr309670811cf.42.1748510864998;
        Thu, 29 May 2025 02:27:44 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm1386641f8f.49.2025.05.29.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:27:44 -0700 (PDT)
Message-ID: <6668e85d-c60d-42c2-8ada-fe68eb6a425c@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:27:43 +0100
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
Subject: Re: [PATCH 3/8] ASoC: codecs: wcd9335: Drop unused sido_input_src
 field
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AXHqSRG4O3_yWk-CLWyl0UVlcg2NoGh5
X-Proofpoint-ORIG-GUID: AXHqSRG4O3_yWk-CLWyl0UVlcg2NoGh5
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6838289d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_jUoxkvH9Ww3fLBRgmsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MCBTYWx0ZWRfX8yKa/7YGZs8s
 PVYSvjz6X0yb/WTOEEi3JiTsGUXnk/fbHIALmIUooMWU6rbF+BS3+UVnBWMYsEka6XAxy4YCdCx
 qWdC/DyTQfYnuug1yNdc5VL0VCCpYHk0FoYCZloW/NfDyR+ur8Rx7sbKqPk8bUYH2fEgl+ghEDB
 1qieDl8ycH7inYEfFlVa2wHaA7aWk2ef5dz/6EW/fwtUnoEwAUndpSJN9H8kK2o8hVHGA4gi3eL
 AxzhSNcWn/yr4BJN1vPVQofmJzTBorL3e056b+h1kRD5BAtBNglZkcdfShEchND7lG59KLNyt9y
 /aaXeOVTapd+JwCXEsvwJZDmYK2RyfPNu5mxVimHThRINuTSkB0+IpYS11Q3GrwRn60QaUUDwWU
 QUNaAE4Mgf6RomxfWLEl3Mhy7BwboQpv2u6EEHqzacGmoTlQgzzd7d641F3hoeE8yQ9Iw/Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=856 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290090
X-Spam-Status: No, score=2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Member wcd9335_codec.sido_input_src is not read anywhere after
> assignment, so it can be safely dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---



Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd9335.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 5e19e813748dfa0d065287494240007d60478dea..1c050b8c19de43cf494583d2c96f50f65aefe567 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -312,7 +312,6 @@ struct wcd9335_codec {
>  	u32 num_rx_port;
>  	u32 num_tx_port;
>  
> -	int sido_input_src;
>  	enum wcd9335_sido_voltage sido_voltage;
>  
>  	struct wcd_slim_codec_dai_data dai[NUM_CODEC_DAIS];
> @@ -4725,8 +4724,6 @@ static const struct snd_soc_dapm_widget wcd9335_dapm_widgets[] = {
>  
>  static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
>  {
> -	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
> -
>  	snd_soc_component_update_bits(component, WCD9335_ANA_RCO,
>  					WCD9335_ANA_RCO_BG_EN_MASK,
>  					WCD9335_ANA_RCO_BG_ENABLE);
> @@ -4740,7 +4737,6 @@ static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
>  					WCD9335_ANA_BUCK_CTL_VOUT_D_VREF_EXT);
>  	/* 100us sleep needed after VREF settings */
>  	usleep_range(100, 110);
> -	wcd->sido_input_src = SIDO_SOURCE_RCO_BG;
>  }
>  
>  static int wcd9335_enable_efuse_sensing(struct snd_soc_component *comp)
> @@ -4871,7 +4867,6 @@ static int wcd9335_probe(struct wcd9335_codec *wcd)
>  	memcpy(wcd->rx_chs, wcd9335_rx_chs, sizeof(wcd9335_rx_chs));
>  	memcpy(wcd->tx_chs, wcd9335_tx_chs, sizeof(wcd9335_tx_chs));
>  
> -	wcd->sido_input_src = SIDO_SOURCE_INTERNAL;
>  	wcd->sido_voltage = SIDO_VOLTAGE_NOMINAL_MV;
>  
>  	return devm_snd_soc_register_component(dev, &wcd9335_component_drv,
> 


