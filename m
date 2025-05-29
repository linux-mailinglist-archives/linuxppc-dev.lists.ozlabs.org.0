Return-Path: <linuxppc-dev+bounces-9009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA90AC7D1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:35:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PSc34Xcz2y8t;
	Thu, 29 May 2025 21:35:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511075;
	cv=none; b=OzzvA8u0MugW8IGLjceHlcclpLrOamf+ASCaJfKTWDx5TFss2FJGawbPvoW0pmXfOyg3x3l3/djLEdpy45E5D1MKjnwZ1Tb2we0em8kXXHncjTFQ0M8/szGTlXi4RNbjPakDi3Op21M+lG/y/vaH8iNrzyNSA8bLNvR8VfTeXu0FLdjGhp/DFIrl7Vm/mVVGwQo6bWhSzs2jrih42tIPObFeArtpNzk9PS0gv1OXGzq8kNCp1lzchAlpOBr2cgG+ixZECKY/a1aVtcWipUFaZ98/FWBiU6d3tJQDMv5WyhwXecCoY21Rfk3O3Xjpd4Ku3DE8iuG6lmHfB39XUZhPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511075; c=relaxed/relaxed;
	bh=cgGha5/zNQyybd2qE+gxdZyIWTR5HQtp75D/abAxnHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWeFqMR09+1Qkw/7fNqLt3rVOUwhZ6FCMLDN0RfG0dwkI6U7n4pKAwK7QTUXd9vcPi3atxEJ4XdlCWMvdATW4cSSzfLcxiJWLxKiwhkOBMP3pzE/AUrxRvjbnWpkfZmbRgbobsy0yd7u2u6ArQD1a1qAjXVPHza1FCLfzL4uVSjou1E3TYLstHEzsFUlDPZmIy/LUrv+peFdVogsbWVsgDVLFV3hSX5PDhmakx+ax43pBeJwjYZ2kTs5tyWI9o+tO9+Lpw0PnqDqejpfYWqaJspSjFxpZ4o/JxpBYyxrIncNwPgHoVar9BBNu1nd/qrkCuyTwxkb9rNFJFkImIwPCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbe6UJ5z; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbe6UJ5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Thu, 29 May 2025 19:31:14 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Lhy6D6Nz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:31:14 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2F2l6028172
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgGha5/zNQyybd2qE+gxdZyIWTR5HQtp75D/abAxnHs=; b=fbe6UJ5zC1mnN+mY
	mfRo0gGSQDRrwZ4ppYqLz8Xvf5EWb5rZUA9Uns+cltHmiLyYqPekmfxcBbbps4T2
	DRDPOlb1XbdiXNWas8PzCYkqfwXVhTsTYdavVw1cfBp6AIYKi5jHVzf4IGMbGV0M
	3xS5cv9izb5tWo1Toe0KGcBU/mf+m88OriqE4zaQugcKCQ/qtwXL7oPuN3s53404
	yMAyYfA6pjqmERKVag6BTLhS66zGlij7XzRV15GDwX9SKLbKp3+Jtdi5C4cejP6H
	6kqGbE/XWzhy+GKVRJKw6uRbrnwhO/NgNAEjO8e36sg+xVdY4jm8afH7eXZ4x772
	IYj+RQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992q9kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:31:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c82c6d72so133815985a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511071; x=1749115871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgGha5/zNQyybd2qE+gxdZyIWTR5HQtp75D/abAxnHs=;
        b=Ue+LMjV0/vhvzvaqHGIohZNX/etDOp/d68SDBo6Lw1Td7ti0AKtvbR5SM2XIa4SZFG
         Cbrt5sHXcxMf0GV2lmEmmSwL7r13XF5k0+XAtzKv+kLWhNRx4fwmNXafWcBQ1ldrfi83
         x9XRY7RJGvrivJ0oAscgt04swO/y2s7SjsJz3yuQ9Pl1LEoolhfsuIt+458iG+lqSuWA
         4bOEcju8xmIn1uc12k+X2Bz8O4XmVgyg5FJ01uRr5hDKj7sOJdrvmMpIwvfHqk8kuhFM
         1yeV4WMUb4kImeDlnpCs/5XCCXL3z05/QlrMXgSD/k0iTRNLibYNWVP6NqIJpmgF4+8E
         yPzg==
X-Forwarded-Encrypted: i=1; AJvYcCXYzLiuecEm4roiWuUz5OK5MmmxxvbHA48QZVuyJMvlRLqHhJYdtjrfi0lSaL37+a7+QMPDZsnGALnNJvw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKkGrqsqVRG8g4gUSmDaVDheyG3srvtCwX39XYt033fbsgO1E2
	wbE6VyrhO0D8SnAWwyKv5pRigS9BMHaRQjNq4sws7M4wx71N9GFZZQKA8xA4uCAyNntQzKmHriw
	iEIhrLfbFJt2H49JCPzQ28mj+I0CUfvzKoX0jz0iZwVxYCmQS32FSBgUH74KAt4M/ny/F
X-Gm-Gg: ASbGnctiotscyBGaz/WhhpToM/YS2GaMpoYXtgnwrWFDFJWRSiWv+aalZzsce66Yo7w
	JLDuvkIiYuaUvzFUDFuy8Dy9XgdwmoClVPEYSw+szrkgTguK1tAU42I0BLJzJO78Tkf8BF4MlSm
	aWakquBYY8ZASe5mb8nl57K9U4CJ8dgiVmUcF/m7DwowF/+6+u76MVQ5lVTMl/El+YE9VLUlniC
	vno3e2HeUi66+FgxFJjQX5jVPnBE0dbNWLckGmSF+prEz3rCxVpXsgRGoxqNE7I24qvPg6cPhl8
	+NzRGvGEKEbwQu91xpGL7wFDQbxDvRUTdIMqUQ==
X-Received: by 2002:a05:620a:17a2:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7ceecc148e2mr2949958585a.23.1748511070988;
        Thu, 29 May 2025 02:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvgtz0k2cbgNg2ujuBOWlNX7eUienPe0dFgksnmKUQOUTS4hJwPI18fbq2O+AkxbITzVcGA==
X-Received: by 2002:a05:620a:17a2:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7ceecc148e2mr2949955385a.23.1748511070653;
        Thu, 29 May 2025 02:31:10 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0146sm1421757f8f.93.2025.05.29.02.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:31:10 -0700 (PDT)
Message-ID: <43528c55-a0ac-4854-8485-4db3ac1e7cf4@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:31:09 +0100
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
Subject: Re: [PATCH 7/8] ASoC: codecs: wcd938x: Drop unused variant field
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
 <20250528-asoc-const-unused-v1-7-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-7-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX8Qb4wSgrLclR
 MrM2trttsuJqEtdKmlmJIcbj3zmvSHjIo+eU40FcQVlnrnTvALI2weIF1bPEuenswbTdJtCBDh5
 uQe30+MdPD1GAzGBTcOt2OoYfGX+S7zTSR32gv2MDUK58cOVH9FqJfFj2jgicWTSaX2SJddLw2E
 ueWAuubnux23qiX1avKCZ7bM1kTCo7j7xcFGiktQFx9kA60Dfj3kPQaiVIJJV94csZN1htgpbEC
 DnKL1HBfmB+JV5O8nvgm2iPfR24i5omSgBFrhDJk3lHDBHshxziaDeC5wFOozFhyUBQRsSZ0ofK
 uPqSqklIGRLdvxQY0FCseflX3CRI+dKP49u4JQwPRXPXMZDHbZlnN0vIW3H7omeFsfsX3N57mi7
 w719rmErzhGRDlGxJTQTQvlfMlR5qX0iKFigcTkszCKRdhgdkl7rdKzEIf6dOdZ//5nCuJJT
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68382960 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=n-EO9A7QzvSfXDX3UpYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: V7QOLWZ85pLm_nW7i3wzcoOIHECEH-_r
X-Proofpoint-ORIG-GUID: V7QOLWZ85pLm_nW7i3wzcoOIHECEH-_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=896 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091
X-Spam-Status: No, score=2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> Member wcd938x_priv.variant is assigned in probe() function and used
> immediately thereafter, thus it can be just a local variable for less
> variables stored in 'struct wcd938x_priv' device-wide state.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd938x.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 43347c14070ca6dd8035b0c290f0dacb0326122b..5a751056a98a5d4cc5716aafc25af27e3ab22786 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -168,7 +168,6 @@ struct wcd938x_priv {
>  	u32 tx_mode[TX_ADC_MAX];
>  	int flyback_cur_det_disable;
>  	int ear_rx_path;
> -	int variant;
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *us_euro_gpio;
>  	struct mux_control *us_euro_mux;
> @@ -3044,6 +3043,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  	struct sdw_slave *tx_sdw_dev = wcd938x->tx_sdw_dev;
>  	struct device *dev = component->dev;
>  	unsigned long time_left;
> +	unsigned int variant;
>  	int ret, i;
>  
>  	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
> @@ -3059,9 +3059,9 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  	if (ret < 0)
>  		return ret;
>  
> -	wcd938x->variant = snd_soc_component_read_field(component,
> -						 WCD938X_DIGITAL_EFUSE_REG_0,
> -						 WCD938X_ID_MASK);
> +	variant = snd_soc_component_read_field(component,
> +					       WCD938X_DIGITAL_EFUSE_REG_0,
> +					       WCD938X_ID_MASK);
>  
>  	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
>  	if (IS_ERR(wcd938x->clsh_info)) {
> @@ -3115,14 +3115,14 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  	disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
>  	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
>  
> -	switch (wcd938x->variant) {
> +	switch (variant) {
>  	case WCD9380:
>  		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
>  					ARRAY_SIZE(wcd9380_snd_controls));
>  		if (ret < 0) {
>  			dev_err(component->dev,
>  				"%s: Failed to add snd ctrls for variant: %d\n",
> -				__func__, wcd938x->variant);
> +				__func__, variant);
>  			goto err_free_aux_pdm_wd_int;
>  		}
>  		break;
> @@ -3132,7 +3132,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  		if (ret < 0) {
>  			dev_err(component->dev,
>  				"%s: Failed to add snd ctrls for variant: %d\n",
> -				__func__, wcd938x->variant);
> +				__func__, variant);
>  			goto err_free_aux_pdm_wd_int;
>  		}
>  		break;
> 


