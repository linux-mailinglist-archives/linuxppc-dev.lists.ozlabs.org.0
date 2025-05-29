Return-Path: <linuxppc-dev+bounces-9008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA61AC7D18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:35:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PS9147jz2xDD;
	Thu, 29 May 2025 21:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511024;
	cv=none; b=gL7yXORc2Sv+myZMa/P7ibigGITYOA7LD93l23dGRD0OOs8/0uBAyldirqjDzIedp1F3vd12YNzXlMG6zhde1DOYVzESsknb2rZtRp8ZOEk5wWTCqlZcZrBrOp9t5xxQ881LAv8TiatO9NYb9nxYsV2asNLofz8OZ92N0woRCeV1dsF/ALgpUXlheIjHqsgpvXHw+4VBbAmPO4/C8tnVWzyVbfTL/HWmZ+X0F4PhrH+Ch4Mn89uHU37GOHrO1jtee9/g1EIfZInlzaly2jouoOy5gPWI+/CqqPuL+7qXXjGZhLEKzyEiQire+zUX4sOub34ePDo4qSYBPXmtFVwTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511024; c=relaxed/relaxed;
	bh=P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/1sDLuEFiukU/+xlWo9H53BDOCVaTDRQPTRE/5AOGtpL/bmU/FPRiK0+iN4vBknElJ6EULbT79tRmflvGlwY3+WlVTHlM2K7DCc60Ws5wXXeZ5HaOu0Dm58avlCBeoGA9scKXW5Y2hVgZzy0KCMZmdQdPd8LrZJfMcjlnnywdkTTA2CxklZ1A8rAyNTaF0MaNhe9mIIvOt9z1WtKZ6aesC6WPBHxhbvrZkWMCFcdp+xabb7nkzuxetADg2jzCoXGYFxdYylbdvTdcKauXKGIo37sG4KY24TQoJfFzz81rEU6uVUw3tHT+Hp6BZKcIEicYRE2OJm9JvtFzZfDZqH1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h1CyIVtc; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h1CyIVtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 140 seconds by postgrey-1.37 at boromir; Thu, 29 May 2025 19:30:23 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Lgz286hz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:30:23 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T6Rrex020171
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=; b=h1CyIVtc+vGV/xG2
	EpTVDD2N4Wink/i+fXnOTip+5nbsgLpaJLUdRMnjxlXFzoMwIi3bAOrk7wgdljwI
	xfVHPHyYtWjpoMBxprHsGaIjbsDIB+z4IRYOHdB4kQunPiWYnrHZ8pQMqIdII5Wv
	yqEtCbEBgVaIHtk2yzHo6H3laeCBwtomPCk9qU0wNCg88Lcjg8rTHvDL4pP5icq6
	8xWUSMzoNlaNfJ7ZX2qVMC7wwv84+e/VV5bYwLpTjxIU5t3/YWcWGlhpMpuCD2QC
	KinF1ZXejmH7qX9TjklM1YWXsZD/8n4jW2TLE1UjfP8UaaLVC75wSahLASZ5Dc1j
	8vU0nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqdcjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:30:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95e424b62so281724785a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511020; x=1749115820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=;
        b=tYLO03qY8AHwOM6ofYPiekoft/g+uwEsr4rCNbk9xqCsDpITALiAeS4UOqKJAaFdZz
         kAZFciyghlZeMy2Ri5Ejyfe8ybOnWpNDiwYzqMTFceI9qJQr9RqFddydOUA3A1TuPBbv
         8918CDpU7JEbfqAXkHh2+kuYENnNMYWxyuJBaRlLNOQT90tM86k5J87KBFsjRCAGEbhg
         EGPI4rOuydzP7gIZylrgoW3/MZLDkv9BqjP6paBouzoMHfjiJAhldT9Wi9uK8v/YIsGn
         y4UnxC08lF9cxY04sMqX6l7N+PAs7Fd4B/a9Izl6/O9cdpXAp2iioLDdp1fUIB3MBjCH
         E8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXewS24v/2A2Phb/s/FwNElX5Oa0kNAWf4aoAIXNc8k21HxOt+cKFxsok+XRkm4k03PZePPJN3L9uKFtdo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEzQt+9zcH698JzyyOzx8/cCEdowrI0iZDPGUXRYn+7cwttGOr
	TPOLf/Gqcs3rYkmW75/TQc9e6eAmpgAAd6BvHYrZcr7ZBK3r9+Jevgen0V9MYsUb48wVLOnlDRw
	FcTcEg1ZSc1RL7YnLGv88YtFj7jkzCC7D1liHgmzgFZqOeSUlPERH2s7p2sLR7ATsu7OD
X-Gm-Gg: ASbGncsoVuV6zS50YHxYdxMIL3agH3gAosWm9ZU0OmaUIwegxXFb84PlrlZRbHgY6f7
	hBQilsoKXTkVHccF8NZWuD376yMJd/kJ6SNL+OLlxatDxVRWQSMUizqpT+Xg132iBTZrLhEBMtD
	evPHnx48OVW8qkfv7Vi5LMWL2ALZLoGSoNQ2HMip7LRUYphYlZTUCT3fKOq9cCQpIdqTH3awJ3z
	WXvifHsLOVSj1ldLjBWpXUQCOZmX3Rq/J6KZGsSpGOeaehqm0+Vx6Vyn1qxwSJl+JuQGF5c0ZOG
	w0ai6pZMjdK+tXc9VcUSuDPmfjZeEu0fXDU/1Q==
X-Received: by 2002:a05:620a:31a4:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d0987e7ec8mr430403885a.28.1748511019861;
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWz2AvGO86BMuA7xGy7C7kufYtby3ybNxEI9G9NE+7JyBgPrSRhr6xuM6E7oQNmqcSWglyyw==
X-Received: by 2002:a05:620a:31a4:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d0987e7ec8mr430398585a.28.1748511019468;
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm1405830f8f.41.2025.05.29.02.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
Message-ID: <457c89b4-b491-4653-bc5c-d2bb4b448b86@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:30:18 +0100
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
Subject: Re: [PATCH 6/8] ASoC: codecs: wcd938x: Drop unused 'struct
 wcd938x_priv' fields
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
 <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6w0CppIDQ-ExcQsSyeL8u6WRPgkfotC9
X-Proofpoint-ORIG-GUID: 6w0CppIDQ-ExcQsSyeL8u6WRPgkfotC9
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6838292c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ta2c_YJw1Ga9Y8nrc5oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX+BSyn6nj5kgh
 YxsXfEQVOrCuXtJfNJMHZ4G7HCLz6xUM61hU16jP65Cmxg3tRFQbY/t7Tn0px9O4oYIdU2gtPBV
 Be5KX/zdkwN9bf0pd7/zwVGIBq/ioT68fjSXR0dQmgTyAInXbJUKfaAxRzVv15EBqtBirfevZ6M
 wT+j0gkEXATOumT6Qm0sSyBKbbvX3Y6DvXp0WUbVAKHTLY2rj6nt83JEm+zRoIpzphfl1JiIWnc
 HRa8U+6eXv7XYTbLKKHcJHYeHbruCglsiHYykdCmxvWbOLcUGeb7fqZZ97floxKVkc6CB6Sg3Ej
 hwDgyfvmLMUFttAcqUIxz9bvcUZpkaTMtYSEr1Sf46xQ68bG/cc5mTWsBC6RnksAD+EFrVTikDr
 99vZrv1XIfHQPSFSRdSB3MW9+CMiTyjZhxMGzn0LQWt+OFcKGJhPcLDtb+IAy9M5j63wHT8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=864
 mlxscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290091
X-Spam-Status: No, score=2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd938x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd938x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 342d1f7d5dee3ac2d703e5b5602aef9ca2987158..43347c14070ca6dd8035b0c290f0dacb0326122b 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -159,10 +159,8 @@ struct wcd938x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD938X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD938X_MAX_MICBIAS];
> 


