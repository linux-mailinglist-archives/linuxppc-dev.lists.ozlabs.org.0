Return-Path: <linuxppc-dev+bounces-8876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E059BAC15F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 23:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3MCc1N82z2yrL;
	Fri, 23 May 2025 07:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747919957;
	cv=none; b=B267fdqyZAnfOCZeHgTAnD2F7f33iSsuRFPYisInlNdb1aymgitOQPbIW3D/+llAipdIiWXd2iyPHqxRvmhoFFR1A8lYhWPcAIZW8aTphWCRHXN0AnGkgGkXSIlDAFy63A3rBfjvLo9+v95gAv+6aVIv2lQ+wNht5Notg1FpPPXytks+m/5y7NEq442JzDTI29xw53fQloUasYEbHuJT2ElI/zW6lUy6CiLVOSXYj0T9rY3E++ruZfnav3AUu4J+B/Miu/XTXITCYCEd5hT+DxSWMMA5tR8CKbz3pdE3eaiSd4HiQbjIIfMTVf+eyX0oWPRE8pDxbRP3M56nT6+aXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747919957; c=relaxed/relaxed;
	bh=RgX9Aci2OKy/LHgxiHnopthswLGl49EW6vrJhQF5Sd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DChln+fDL9/6sVv47dmy0fitIxhaPW7sUSBdFvUrjYd1EUXIPwwaEz3bBSYLHy9OGUIeAFHlocDkxTAAE8O/RGKIVaJsqzSpdaafzyP7pat9xU5FsEOCvyZd0PBH4AKUkf3eNK10oQopLNyZ2jKW1w0TjZWnw9MnorOfNAzFJm1orbsjiG4F+ZjMBK+Ri1DWUYp9OUoNn2Csd5XPvu37BvGk2Gb1AUlBABqPGelYSk1PXgKWnEgfxW0D5Gl3fKyaUqayAH8H9O63LhbWjbXxme2XTHU8rFAeG6EF+dOEplbCI/2isx2vZ6mFSVke8XJXddPIVa9ffJ2wk2oOAw2Q1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puIi8/YX; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puIi8/YX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2486 seconds by postgrey-1.37 at boromir; Thu, 22 May 2025 23:19:15 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b385H750Tz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 23:19:14 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7Oxlv021020
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 12:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RgX9Aci2OKy/LHgxiHnopths
	wLGl49EW6vrJhQF5Sd4=; b=puIi8/YXySjnaRhqdPF6arFGXrN64CFKlgec9+hh
	yazluQo/TWc0lbpIj5odU7MUowdsNeEbFfK5csRrlO3C0EEFxId7eNo2CawsvJnZ
	PTIOa8jzHsTkAenPYyRBUnBPsa7pvvNLyvf7T6hWxZCFzVqh/eKEEgepS0VGDcna
	G8U2mZR0m3OYEZFrFk78u0L+N7rS1Jpb6elMICfZ1AdRzNVMlKr5tA9RT+E4VNtX
	Srz+XlZbxjppxFXyMzBSpx029AEjLf5t/3+r1XP/SXtTmp2gjk84m6fTsazCuRMt
	Y5npPMV2il3EgMdInXJaV/+Yz9ulQ52+xwmoyVDXNrZcEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb4nsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 12:37:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so1410788885a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 05:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917464; x=1748522264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgX9Aci2OKy/LHgxiHnopthswLGl49EW6vrJhQF5Sd4=;
        b=bs0zW5LGoIw9jZf1rqCF4USdJsxHgKkrxUwvBogeI4sU/IaOOev4WqGsx4BHOzIry7
         WwdaJYnDRldOFRBfpFebenDZbRs4pSYiLit8H1cV+vX4JDWrkfRgroyYvnXU7vnBPcGz
         Gv4k2rnmkdpK+MuxASRD+q9asS9oqTuX54REVP8Yz4a74C5BRWOz/L4abl1GE2YO2i/h
         QmNoaq9pQ3nWVSoOkNA2IuCY++2ZeudJ8wsMME1pXUdk4yxArcDxo3zchVhnDLExeEwI
         DYKC9CKoSHsTdzbxfhIKCPD3hs9JpedERoMzyNVRViNANjuBbZrXjTA7e2XqMppDE5FQ
         4Dog==
X-Forwarded-Encrypted: i=1; AJvYcCWkzTyEQ+yvbge3wzHqhFqVQEI6MGz1/P3GSCrVtnfSTExlDlQ/u/7Z1SrpJwiJDJuxGnKol0YpLsEWSN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTAHbg9mbREVSsZzmIyPdQI56DYI18BnfbkAi7S9WbVB4rde9o
	SJAE04UemEWiK8/Uncl3lPEeRrsmFp3Xoi7vzPaIQVrMVxp2Zf97jKe7Ftv6+3gugrlE1hC/hHL
	6vCWwCeOrfbVa7o9azjcvKaItHDk+te+2FLmJq2cKWxXYP2bL8g+0b/vDPtx1qF13gNLC
X-Gm-Gg: ASbGnctNejb+9DqYwixmNA38+C3osQU6unXM54+1CAh/Xe4Ji2MRgWUS2H2zVQfYagv
	seNmbXi1+KI2vQnj3stRLJIge8gFZd/3X1bPebe5KMqX6Q/5b9uWf3zrpUM2ExMXFPgD6rFNgL3
	lpDFPCKQHtG5B/X33YCnAOU/g5phYuQTPC2LPFTnR+mNYG7IXCZVeC5UiFqvIk2nj8JtrkhJzvD
	WBXKk9MJCUin0W+opIDmYzkbxy2JZx+krEcT5UyICN8U0WmqqyMiqg4bcq2NrM0MjCXxSnYr0DR
	IDl0FamWKuAv/fgVhYRKnhE3GmdqiWrup3XVPy4UfiUBeHSubzhjC9Q/1MwPQWrm9CluY/JZsEg
	=
X-Received: by 2002:a05:620a:4013:b0:7ca:f447:c676 with SMTP id af79cd13be357-7cd467a017dmr3460590685a.43.1747917463767;
        Thu, 22 May 2025 05:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuK9ZYaNS9i+Q5elNYnjF85wlG4E7W2PQcAkgZfLcHHNu2rPiTZal61BKORpuvgC6jlMqV/w==
X-Received: by 2002:a05:620a:4013:b0:7ca:f447:c676 with SMTP id af79cd13be357-7cd467a017dmr3460586985a.43.1747917463368;
        Thu, 22 May 2025 05:37:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702a289sm3392445e87.163.2025.05.22.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:37:42 -0700 (PDT)
Date: Thu, 22 May 2025 15:37:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <jp6lxxm3httbz7ygu7bj3xju4l7jnnhvbpaicb36ju4hyxpb2o@4lhl7xzif6qo>
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-7-aichao@kylinos.cn>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522050300.519244-7-aichao@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f1a99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=rlxKSa1xbkCyiMC8iTsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Nl3nAFtlmbENlwxh8-bvVePCndq9gf9v
X-Proofpoint-GUID: Nl3nAFtlmbENlwxh8-bvVePCndq9gf9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNyBTYWx0ZWRfX1f9beOf0CTaX
 lpsFFjbl3dmnECPLWCr/d6/axFSjd4nPRV4SHBEWLbUITF+bnXA7AThIrAAlfqEeRFsqggyId4x
 lsSuXaZH3wOh06QjMgtPFes2XAr4dIA7P/L7FLJv7pbMamTFAX9lWUP8ZvFN1rQ6g9b8k1ouOez
 +nl7NGSsOlCcyGeDo0nJ//tXFsqObAKqJE/kUw3bIwKtbmTh4KW1jvg7wD9EuPBWRq8WTRum6SB
 zyMs7jIglsSMiGodaUXY8N/UR9wPYcrrR3i+NBJKLLK7pvKZiXvq43l5Qoms9RS86oFbQSvd6pG
 ATNinAUUwuWA93KeL3Y2T+1hc/MFBNzfv8KfZ5kb5OAjpwECDPxScUbP6B9hvHUpmkwj6OaeYg9
 wb6Gi1ji9fY8Y9+kLZQvDJiCzND5O20lLdolgqBMmRmy8rqFigH+oOC4EN7B8Uw8wZB5Vp+V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=928 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220127
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 22, 2025 at 01:02:59PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.

There are no calls to of_node_put() in the commit. So the commit message
is incorrect / not-applicable.

> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36d..62f49fe46273 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1046,7 +1046,6 @@ static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>  static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  					struct lpass_data *data)
>  {
> -	struct device_node *node;
>  	int ret, i, id;
>  
>  	/* Allow all channels by default for backwards compatibility */
> @@ -1056,7 +1055,7 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  		data->mi2s_capture_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
>  	}
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		ret = of_property_read_u32(node, "reg", &id);
>  		if (ret || id < 0) {
>  			dev_err(dev, "valid dai id not found: %d\n", ret);
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index 7d9628cda875..64735f2adf8f 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -962,10 +962,9 @@ static const struct snd_soc_component_driver q6afe_dai_component = {
>  static void of_q6afe_parse_dai_data(struct device *dev,
>  				    struct q6afe_dai_data *data)
>  {
> -	struct device_node *node;
>  	int ret;
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		unsigned int lines[Q6AFE_MAX_MI2S_LINES];
>  		struct q6afe_dai_priv_data *priv;
>  		int id, i, num_lines;
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index a400c9a31fea..d7680dd3a3bb 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -1236,10 +1236,8 @@ static int of_q6asm_parse_dai_data(struct device *dev,
>  {
>  	struct snd_soc_dai_driver *dai_drv;
>  	struct snd_soc_pcm_stream empty_stream;
> -	struct device_node *node;
>  	int ret, id, dir, idx = 0;
>  
> -
>  	pdata->num_dais = of_get_child_count(dev->of_node);
>  	if (!pdata->num_dais) {
>  		dev_err(dev, "No dais found in DT\n");
> @@ -1253,7 +1251,7 @@ static int of_q6asm_parse_dai_data(struct device *dev,
>  
>  	memset(&empty_stream, 0, sizeof(empty_stream));
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		ret = of_property_read_u32(node, "reg", &id);
>  		if (ret || id >= MAX_SESSIONS || id < 0) {
>  			dev_err(dev, "valid dai id not found:%d\n", ret);
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry

