Return-Path: <linuxppc-dev+bounces-9011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A605AC7D25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PTb1mv7z2yFQ;
	Thu, 29 May 2025 21:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511200;
	cv=none; b=YezhZT4ttdKHCGpAMklhRNEoToh+iMvQj27Nk54TR3QudDC6x1jEhNK16BUQzsAg7wQIDnjTjd+Qw3MOaSIxXlf7E+fr3Mz5lIRW2hhr/bzolhA6wMYa/7yqgglVxs+tXWTA+P31WBOP8bnr39WoiLqtkBYz6watG/Gz2QTITJNlC/0Ds2rWgbP4md87sK77xmAq7kRxzP7DrCZALjea1cGMzjMHoqHsewDqwY09z8w1E+nu9Z38wUrGmj+oJbA8AFgaTbYAaZcydcV14bfPOHJxBkgtapphcPJnJEYgLCbPAklgsdWWo4hhVZbLkZURondFG+HTUEb2iMLGCG+cww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511200; c=relaxed/relaxed;
	bh=J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bm75Wx0DwU7ywMU7+zv5rlC/jv1v02OWQVtxq//IkwT45XJDzuIVhciRjEtQji/LVdV393gjlVUKiY0/Yh3sozijbzWIgTnUyy49u8ocr+XHauAhRNVSNOU7A5QDk5QuPBhsdNywuRrQHNa/2ar/4e/fAyARAf1a2x2lmbhvus/0QS/X+CplfvwC3NZBwuycJEMcxw7ecX0HeLRo7fQQ13iydGdDbYNwQ+IIl4kyDJcMf5ks8RjBAfvKxsEDmOpITef3hNEGOq21jdyNft5x4C4Yf5oKYhgQi0hAW2SIpuR1OtL7D9EhcyyCFMpdSRCvEwXQoGUGdX9oayLNTWtDFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G78IVkSj; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G78IVkSj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=srinivas.kandagatla@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7LlM6zSQz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:33:19 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T8YBW2012585
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=; b=G78IVkSjKa2cFUdG
	TQimbwKv8Sbzgk/GS0OyD9/a1LlaBbCdVjBWFXr8yM3OX5WigqO0oMsV+etu5rNX
	ens3zoETm/wB7RwxyKTIxhvivztq8I01kS3KqZT+snFp7srDPWorfR0va2ZokDKg
	mJMT8zgo9xx2YMmCTlkhUmrclZW1LA2x0Gfbrg6xTokzvgIRjMBW9ODBwhrPxNQy
	9pszzhrFoi4zyS6eIaWLsl7HMr9ZnVaDkJ5GEyKPgKRqX4b0O1tYxGQpV+1JBhCO
	IG02JIHj1Bkavgu3tpzrz+jA1y7XF8WpvpifHS3dKvZxXRCH8X4T6Mozc4w9wuQx
	pnqbDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691fr4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 09:33:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faa53cbc74so12255236d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511196; x=1749115996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=;
        b=tZmaFZUUcXUTlBAz8ZOLjY64XS4H5F7VFGt429JRUbYrwBsXAz1ShteRWHpR3HbZMv
         3r8SpYfZBhUL0lvGTw6m8l2GIcMz3NetUcKqIFDNDTely9pmanA81520xk9tbvDpqd0A
         jTBqY4+z+zBTiLPopEqnM5KhPVzvV3ucDBa4IljaoweWvcDOXyAmwaDlc84Sp5nr5emO
         Z303gOmior/kyJbnL9qhSyF3FaGBIId2wFpRQT+ztUyD3NPjc/dYD0xLrcVvRpDC66fv
         NpsRTGknPDMZMGe8fms6JHt4+WCpsXmV/UyV/cX9bROPs2GGdn7yd0vlE4HjCnswQwjM
         E6pA==
X-Forwarded-Encrypted: i=1; AJvYcCXgye83pnSdtBd6BdiHmBn2pkl3fMIbvPmPL5NWkWeA9VAf8pF6lachqoSu0bwnU3dN1ZMXs754FNR7SGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygwM3vTMPGzc4D6+5YAqtHzM4MmB6Ggu7KyjL4PrWWc5HyBdPd
	/3WruCgSWWUU1hcrckLEGe0/RczLG2C26T9AgIIkAi/3QpRqH0q9JGcnpXKNOROuK9lVYK/9IUa
	mqOZOnVJp4Xpr4S79t3elO1ldT8sW3dJUzeQSUs5JyFaqhLXqYHl5Vw4dFFnPzIGc1tZo
X-Gm-Gg: ASbGncuJq/I5N9hlvJeXyAq84Bd8zl4TWyGDxzRs7GD0mPKYqpwsfGd1KDPm9Z+mTJb
	KqDLDGAyCia32h8rt0UZ8jFxADugeDcalIoShJiwUkhZdYPMXG3GND0uyLZoEA6REWul7df1D6H
	73Eugt/cD6W23VL3c+YpyODLEBdrO4kOPPjaxeZBs9k03Gtt+zJLq3pcJnMczOjlMoDQzEGzZli
	LjcbB0qrmeZLfD03h4ri5/0SKAR/P1JURfoqXEzeUcrEHx+fYKXOkDaFMgwdK0KrkIDZraTu71b
	TfTyl5X78kAUVGOkw6FfIrAFJgq03MEMPuBZCQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528616d6.15.1748511195792;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA79GLpD3HZiK/IRAurUe6TU66mlX4HbtpUZm3DMIN5fjfS4J9m+gB7K+ZJszdXMACo2cUIQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528356d6.15.1748511195376;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450cfbf498bsm15179805e9.1.2025.05.29.02.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:33:14 -0700 (PDT)
Message-ID: <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:33:13 +0100
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
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=683829dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=b5hiRvTwp8EW11ydFUEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: MZus-X8MbEubq_V6-UtfIpxjYMh79Jzn
X-Proofpoint-ORIG-GUID: MZus-X8MbEubq_V6-UtfIpxjYMh79Jzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX9aBtR8lUWl3X
 6hGhNLXpDuCKGSjxwOVv8gLDP1oIS5CI8jvGSq9xQRfw2En4fJgr7Ogi4GwVe+WTF2+h2WsXa20
 fYB96DJpDR3dwicsgFlg41CO/yg2pIy5/ySMjzOFcS9rvLlTMBk/eWuD7cfxMHTMNZaZNzrbTgw
 JSTj9dJLCdP6gTc6mufKwwxH6xbEOTHXzaZ+LhqIzcL/dks35ENC8Dzk5RdMVEWPuH1LycJYGsj
 iJ0mvxw3A6N1x5hYckiOz+FRab0Z+bfSkYeUK0+uOuqP0ScMl1L/3wH4jtraRcfrp1zO/KI1UGb
 dmSMAfv5zc5J/CCi6LMlyVDDD1ayOAFugV+L4H+c691vae8HXMsA9Xd0gAbmOlRbqLB/C3OmNFE
 /pxVPJ3JsPZHVTpz3GnJt8I9AQMrj4dvTeO8Hmievq+0TRBXlkuIlwUGRetumSPnKbt+zvUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=983 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091
X-Spam-Status: No, score=2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Make static data const for code safety and drop some unused fields in
> structs.
> 
> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
> driver.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):
>       ASoC: codecs: Constify regmap configuration static variables
>       ASoC: fsl: Constify reg_default array
>       ASoC: codecs: wcd9335: Drop unused sido_input_src field
>       ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
>       ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused variant field
>       ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields


Thanks Krzysztof for the cleanups, its surprising to see so many unused
stuct members in qcom codecs. Did you use any static analysis tool to do
this or was this manually done?


--Srini
> 
>  sound/soc/codecs/cs35l36.c        |  2 +-
>  sound/soc/codecs/da7218.c         |  2 +-
>  sound/soc/codecs/da7219.c         |  4 ++--
>  sound/soc/codecs/es8375.c         |  2 +-
>  sound/soc/codecs/max98363.c       |  2 +-
>  sound/soc/codecs/max98373-i2c.c   |  2 +-
>  sound/soc/codecs/max98373-sdw.c   |  2 +-
>  sound/soc/codecs/max98388.c       |  2 +-
>  sound/soc/codecs/max98390.c       |  2 +-
>  sound/soc/codecs/max98396.c       |  4 ++--
>  sound/soc/codecs/max98504.c       |  2 +-
>  sound/soc/codecs/max98520.c       |  2 +-
>  sound/soc/codecs/max98927.c       |  2 +-
>  sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
>  sound/soc/codecs/wcd9335.c        |  5 -----
>  sound/soc/codecs/wcd934x.c        |  4 ----
>  sound/soc/codecs/wcd937x.c        |  2 --
>  sound/soc/codecs/wcd938x.c        | 18 ++++++++----------
>  sound/soc/codecs/wcd939x.c        |  2 --
>  sound/soc/codecs/wsa881x.c        |  4 ++--
>  sound/soc/codecs/wsa883x.c        |  2 +-
>  sound/soc/codecs/wsa884x.c        |  2 +-
>  sound/soc/fsl/fsl_asrc.c          |  2 +-
>  sound/soc/fsl/fsl_sai.c           |  4 ++--
>  24 files changed, 31 insertions(+), 46 deletions(-)
> ---
> base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
> change-id: 20250528-asoc-const-unused-1e39b434e427
> prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
> prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
> prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
> prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5
> 
> Best regards,


