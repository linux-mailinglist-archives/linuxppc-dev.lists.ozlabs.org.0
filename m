Return-Path: <linuxppc-dev+bounces-9013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511BAC7D2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PTy6St7z2yRD;
	Thu, 29 May 2025 21:36:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511597;
	cv=none; b=MDXN1A2dPdUYrKCWqj978H7HQE1zNTK/NBfZtQPNLWSt8R5z02SFVdVm3K/TIlOFvwiZqA1klR2falSyYfnXaeLpmHwiBOmXtTfaMWbkRnr/p0AQ5pEfvB8t/31s462k9MdSkBNjlNCfabbL6AEGp/C89fBHBOVO5CVVvSwwQsBne+837QL8kGQPHvj5/55hlkTDQPOLih3mt2yugBj5JWpYDHv0IYw1VoVnSq8yityjNubF9xRWBh1RRddrHAEdWrXNLI/9uWufbnNsjGYNC6EZua3s2NGOEty4onKj3fZdUZaf9tAci7hlO6Ns0wHeFujhOcTTr5ppRgswxUuxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511597; c=relaxed/relaxed;
	bh=XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/eJnNQV7aZyia8dyQ/pLt1LhyBeY/g5e9hjljTPhVMxuWUKbC50j/TLHvgBcNXIhlmnKWJ5hHiWJNzFPDnxEky7vPP25w96zqlXWF8befyZ4gXhjO7NdBgcg1t0sMJ/f7S9b+zOzzeQs12B7wj3VgkviJuCZRNzWrQkJk0cgMQ2fv7mEIG1mk1oyTpNiyHPu1reeNPBawb2NtwyJU0htGojWblpnv5w4y7NGGJ2AnsE6k8K03Xfhu7U+xvX3Y8fPu4xFrGpjKhBkWIrnvjzbd1IW6T1FwJgHnJoBvsCrs/2PQxvHGVX1xOJWyeSHLDv2AUzJ00MO9ItVhX9uHNIPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpM9dJyt; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpM9dJyt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Lv05YVvz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:39:56 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3RWMQ002109
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=; b=gpM9dJyt8bVrOwIe
	LpFoocQC/9ayLPKTKVr1ixHgkCO3/gh4FgJLOmviRgyljkYchTEaXfWcMA1e2Myf
	S+nGj7iHfRGQ5rAeZGvx9VF/wX9/Bi1fSnnzDEnFk+roiqwMHu7JFApoWZLbPOwB
	UcGU0hA25GrmSHpEnwj09HpkVrZenD8mzF1NRkzeeeWzcNKhLqoadMwaA7WdydfK
	GAQZHCVhG1Kf4BCfuBxJIthdwIFrDnOfY9lAikT11DS/dvkI1Fki/7/hZjaGtrHz
	5WH2fFiG/CNuPVode37PEOv+i9d3M8JNtCvwZD9ra4xWekIPC1BxaE2jg0UkQUI+
	tNnwkA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavky1xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:30:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faa33468f2so13814526d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511003; x=1749115803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=;
        b=Lsz9arJLDnu7MZRE3yKYiXhrh5LdeZWTWmh/dumcbVS0W7n0QNSPD3u+5bphYOgmar
         0+EU8BB0fOssRufu67lKdZHIr01kLYlG0rkZIGlkkFyc3qCvA1WSTpzJSyvbOfBejU96
         kB7zdPDFZUWrjk5u7A+pplUEoVFWRU+t1/yesHn0RQXtLR2Q7pUuS2KQSAp2MvFR2ei5
         QmB1dSPInYkFVutpYNxdwSEDUQmjBGNQRlO2IBXPYOnmy7VZefGjBS5jqYPzmBw1T9n9
         SyrXQ1SzTbN1YCt+9Lk41Ch+2YSEB6MAKzwmDPCYmrrSc9vik82uBsfURPq7FYwfysrA
         dcJg==
X-Forwarded-Encrypted: i=1; AJvYcCUSMbe65TyrhlDiQbz+5QLrhAJYV7nZx+NPaaBcUBLBPgBPF8/O2nOVv/ugkIrUDUXIH2AyZQudqfXSpZQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1okfWPlQZOj6W5QfPNe5G1hXh2X/eudP1TJUH/rR0VrFCeKck
	e+YX3St9Ovg67S4+OFBjOrJ2EsAlkqfllgaXmWAEyKTSyvrjt4GMAQVgeM7/qm29GAOyTTMAAo/
	tjoO1QMPJWHKAp7VVBH9i0wE7qL0hWC+H61ZsdJ4T9kx87nXSbIRRZpIxpHe5p6F1YVTu
X-Gm-Gg: ASbGnctSlW/94OmpyKrrifQgwNaRC+9w2vCHijg/OEoCSY7/+lxbeTDsbR1MA80Cnm3
	tf2U2kze1JsDaGhWzZnYTwEBYEUTyvl1jv6OO5uoZyjqiRicgjx3uCE8dlMIHcU1GGqrauCbh4p
	YOpk0AixAPCmUILYxGqSWNJ/bO33DTVrC68dxyHQ5qxXLF0OwNOTZgZjaMg9ARSnI1iYBvF9SEX
	CJ6e1CLz+7Ls255AisTmECpuR9rw7xWL1+AwEqDBajYkGabjnfxGBud3mHB82Jp60VPX0Ldh0n/
	6VFDBpNp16GD6PcMofZcVErmFzQ3EeX/Sm+vWw==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fac83d3e56mr19275526d6.2.1748511003005;
        Thu, 29 May 2025 02:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuhF0a9JamEH2xvLOnY3n8YKcLhz5fVLRzYE43PyF8jU1JcEPEDxsP9ZS8JS0YOd2Xcle+XQ==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fac83d3e56mr19275296d6.2.1748511002582;
        Thu, 29 May 2025 02:30:02 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm1411669f8f.75.2025.05.29.02.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:30:02 -0700 (PDT)
Message-ID: <89a1a6ea-3939-4d52-a8d4-478347b1867e@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:30:01 +0100
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
Subject: Re: [PATCH 5/8] ASoC: codecs: wcd937x: Drop unused 'struct
 wcd937x_priv' fields
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
 <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n1HcafxJ08n1x8caj7cwoQlFTyMU5UuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX0uQd77WhFo4I
 4xioo/A+PEJOT7fpwe7ZuILzgQwQ+OvvKB8NtZIhCn2YsD6AycT3cvDjj/XFCN/f1S54SzaAvrS
 E2Z9IoikNmJaRthbz+F42ybLbor7ySDTCvYBgKVCy7rm3Kb0nPF2hojEwmcfmF13yiMeGL/mg2W
 mxaJKov9/x5BV/0b7cavv+k8M99pzI+4zCRiTtlpyDJ909dDJ4QvuP11NTz580z3v+vq3DoSrNL
 zRTnrxDZtdZ/CpolmgtXKz57jtWb848FiLGh2V/QMR8cGRASUTivkRXHcZ3fwaomCBZ9P4S0RnN
 cPZ1HTxTw92ZLeVnnlH5dNx/xPZlazTZJHdj6Zi8rpLhT7BiOyZlZTHN6mXmheObjETHU+5gBK8
 t3oLU0fwbEd940Jrocp16Pq+pTZIOIYyTqKR2JFeON0kd6S2/BDyfAL8DA4BQo5pwJPzjhgs
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6838291c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pnj4R_TuY2SD5zWdqewA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: n1HcafxJ08n1x8caj7cwoQlFTyMU5UuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=864 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091
X-Spam-Status: No, score=2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd937x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd937x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index b9df58b86ce953427e01ffb8c7eb7e52f9c2392a..126a29e0b3ff96c12fdaba2b9344a3040b455e44 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -88,10 +88,8 @@ struct wcd937x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD937X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD937X_MAX_MICBIAS];
> 


