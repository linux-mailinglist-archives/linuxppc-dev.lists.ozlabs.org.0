Return-Path: <linuxppc-dev+bounces-9010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D5AC7D20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PT43f7Sz2xQD;
	Thu, 29 May 2025 21:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511092;
	cv=none; b=BVKtFPrqYx1OXzx11Dtblnl/3G5Kr0wiNRuftUW0Mycf8WWB3A84nrCbQm5DSGEWwHgz4wGkpqE5UJa+8JVjA+/52wR6OZKVmEVmqtbkgiokuFmCK2XN6cmPtIisQnkjRrZql6S8rxQfFuXtU25ZcyI5/4494mS2Zov+/sdjpLEz2pSxSLn6sb2Gvwaiscf/UimflbN7YGjB+f/XM5Bi2dWZL0FPKl9rSfuVvJrQhJ6RYHGef6GD1cF6EXek2/gsEIGE4naaIXwxH+1TcxiRw8NnD7/7xFNxPKm6Zbsjcgn3mgjL17IHBPA1IGuvvOvhN0nt9yiKA0UU+c/CNhctxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511092; c=relaxed/relaxed;
	bh=vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8CqYHGqed0tIOPYcZ4hgpdxrAsyZmbrtJ4kWpXT2ISyLZycRZBIlDUbxAnodjbYa7FPpoGW9BzOMQbXVnWOFRuJTV3V4BCPCiQ+qMY61/tZ98sJ0LC9QPhr5ZWJtMkNHN1l193VYGnScA5tkpNAPnEadtnvJ1DkSs6xyufXQxsTNeaUqq2yGv/Syywca90A+wdQqE/hq4a+PWrclA8xYk6X6TZmgXxZjudliLJHxciKzXs8f/dZYKFZyf07M5wS/JM/pGwBVVdnu+YmNMv6qpNQboaGK20kezHNo1ZlDHTUQfANRvxZcRSJOyYsab5iLcZIcymgbqF6NTGYQPxcYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n9H4KH6w; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n9H4KH6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7LjJ1Vn4z2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:31:32 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SNZs8S013539
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=; b=n9H4KH6wZFVqFKwC
	s7dv66wlnKp0VNBOw14X0mPYF74fu9KtGmg4Uv0OcejZc3yeAOMYTfEOwP8kTydW
	nFpx2A7/8MULdwqEZs8UDrrK18raxPg1BlEOKkGryJoIlfsYuL8bRcjnTHlP/bjL
	bqOCuMuGt32nsSjCQN2ar/xe59ABK8b866NYCftHyRKX+8x+X1d7sY9X9oq1oMiH
	YjDr8o2fUgnqNnqINFhdkAXhqOP64RVWPR8jvJbb1+pwtE9o51zkN/1J7wjiNsU4
	BV/+Jbsc2Nz1Flrhj51rZaUiAoxqlcBtS2vhdKdYoR9v4OYbF46W/eMjmBIGYCWV
	m241Kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691fqxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:31:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so129338185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511089; x=1749115889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=;
        b=UlkPDdlCKb9TMw70rHzG4kO255w9YAUm/HAEQ46sCP6HeOSekoJ1cN+4Vxe1CegRAf
         AISDSpjxZ4qE8Robz2hpSj4GXp3yXFuyOAw1RIeJ/bEnclsQ2xEDpM1inqHpMPX2u5Yh
         O++x3+jloyRLw1UotBz7LC/A3czDdOwcXzFCwV+aJ+sV3lNeXdogeQdEmtyWTHmhPgIZ
         VCY1syTWdvgwVDSiTtWPj91qawPHWjpPFQtKu7hBuZovKCq911cJG8F6f1PVFQ0fpjzI
         BvPMwUijhduBPOISNmv+cBd1izgBsgtbLQddrgBACeVY43saHqK+XNvls0jQI7dxhiBA
         rgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIQNh8NN7j9JZzNMfc1KlUnLWqjCQG1eAot2rB8Mjv5tXlYbEEgJZIma6N5f/XoiBlApPKYPNZvKncN1k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9dXsH0YmcngiDLCXR8K72SxAG3TotQHpt/P+0haAxTHRICLCx
	EgdfLOI/YMbXhZF3bOo7e0MHXjIz+Ynbttww+0tg/An0vMRPICyjZKLWzg8zgR9AeKg00X2wU2C
	ANO5qogQT0jnpZrx/Cd/eJJdj6r2odFV4d9nLCA3TlbefcZd39lKPuA4o2HA910PVEfae
X-Gm-Gg: ASbGncvamKqXcp5Nl1yWpRRY36jjbtFzqR97o0e4tkr1r9gcoy2V7qro2dbvlw2nhRu
	wbzVqJAHTS5cYLiOI+Z68HI8fYUQXhHRfaezYHmNVSrO4MQxJtrDP2mtbIGG430IKKyR6wbgR3l
	q6RDDkwHfyZoRqS1aA5uf+F4jUof7y1vjysWE6+XX1U9Jca5Z5WEdN4Epm4hrDEyoHTTPdpOpuO
	qeaiaqxAXtZCOGUmaU4nEzItt/prrXFasQogHUJXEzGf8tOHGe5mEtR9o/sPcv3265iQyLbVhJX
	PvLPifdJTaIYVn7t0fxOhPtpgoVZtlOPT7o59g==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847327885a.7.1748511088819;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBbOrTOd5S0R4NHuiIM3rmHA/A2xeyEaZjKpqahVp5pD1+DlUILFY2WUrOeiPk48+sME58JA==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847324685a.7.1748511088454;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm1414133f8f.26.2025.05.29.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Message-ID: <3cdda3df-a2ab-45e9-8e40-988310c759d7@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:31:27 +0100
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
Subject: Re: [PATCH 8/8] ASoC: codecs: wcd939x: Drop unused 'struct
 wcd939x_priv' fields
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
 <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68382972 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RFI1buZ0A4s98qjrA-8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: niM5j8SE-GnULth7V6SoErbp5v4kthYO
X-Proofpoint-ORIG-GUID: niM5j8SE-GnULth7V6SoErbp5v4kthYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX9wVyCXBRFssO
 YCOcXIU5MbCeSPu4xWOnobQuMmsqs+cXCChbvITMgcohB7uhGviVQ23LRQr7EizFtOFYx3n+tBP
 BW/W67ECfJGHli8XGVhJEBjF57/8Dcax13BMN8Q+9Jo+ETmquzkMitP1Jp5U4ClOBeJoHkKjG2Y
 i2tHlW8XXtMcLUHpt0tXehPWt2ERoMCPr5IYgsaCbEKe3JpEEWJv+lO7A5AmJtrEmx5ss5t+Gmv
 ecivamUFm0uP26twc3baQd9OFrNou+9dVOsHm1NrW8QBmHt53xmdSfBI/OUEhdIpDGUr5ktMtPc
 cJGHQ/byA+fHzvdTC39Ib55oPo/TM2LP04ir66aG4MWsSZZ1Mw4n9bcwigVyRc8I00JtdN3LMMc
 1cqJxsEU5MaF15PUfk75q4KHM8PEJrXu3vMn+E27BV273xKu/bXRBSD4LZmMctimnxFcY+DH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=864 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091
X-Spam-Status: No, score=2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd939x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd939x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..bfd4d2c8bdc9bcfcdbf673d20458f779922eb464 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -190,10 +190,8 @@ struct wcd939x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD939X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD939X_MAX_MICBIAS];
> 


