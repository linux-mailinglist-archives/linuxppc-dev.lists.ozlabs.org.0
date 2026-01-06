Return-Path: <linuxppc-dev+bounces-15295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 178BFCF6FAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 08:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlj4j3FKfz2yKr;
	Tue, 06 Jan 2026 18:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767683461;
	cv=none; b=jC96gRtjfCIKXz9ozAwuv1oB2JRktQwmW54kqSg5JSao7UG+xoClfEI8vB68qeBTFvZ2wKB9l+/fRjzPifbg+cMUeymPWcnU3UQnhuxYS0FOzmjqMj90lEzA5BepDvM25PTUPrrncAB9Fu6KEfVAX3ehleX8YXhoLVxhTcbY1gUVjHkEEJMnIhlJFkMgJmeXCAtEqVq/TCZ0E3qAf+toVoBHhqizP7zWpfZE9Ykmqhcd25GaqPIufCNHUGaOlSncAYbuGB88VZR03Cb4QsVc1YgPxn4Cv4N7yJiehIiIWS/MGb8euuQCgoFi/jKwU/FtzmFPfFAnPG8XVNRqG6z3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767683461; c=relaxed/relaxed;
	bh=yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLwQhwxkywMX77LMorTRs/JQ2YET9Hxj4EIFkQjNtcUlyC5k39WB/TLc2prg+Vw6ZueqwfPqbf6PvQXSSE+rU592oDznBju6Lh4kxBKb+xLKVS4MX74ywwBmAjn+3lcwlcHqkSIYlsAoKoAmWKTMB9J4NPpFpANYrjwhpO4SZIvhtF4fmckD64ybyF3VYB6iUnEMQjglfDI1vPwtBWogaSjjgEv/Nv3xnT6ZTj7ojwbYE8jmmDxU/vbwxp1/JjgpGlI3xZq2M2rC00rV/ExIpN6ejdhTkvZQ9K5k0VHB0ryIdhgRDP0fAK+swIeTclwqTsMFKgEQDcPrRBLDKEGrcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X2rhLxsg; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtaqvN3e; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X2rhLxsg;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtaqvN3e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlj4g4P0qz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 18:10:58 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QFB52922792
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 07:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=; b=X2rhLxsgYoyoE5AY
	L4b4cQJTQ3YgIfJCOY2LOJVoBKGe5vLK1LpNNiDsUPfYPZFJrCvR5L6HKf8GR76o
	8Xem8H7csVtFQUIFSXCaZou94+irylPnnV29sMLXiknpFDdgHOFgL+jg3vNiCh+U
	u8uJoDzslcYsqpOZb8u3b16lzO2UczbNws/eJs15FDtstTOCjhv8bpMg7IBiBdsU
	zE7CqkcaOz/1l++v2Uo3JcN+XNUAHfVn3rtogIk4FRDqu1x5eiisquylcuSGquLf
	JjcY9vRoINW1D1IPJp/i+YibBXgIyJDSEo3kApXRCtijUJfeLCFyzeiGe3OegeMW
	i1Zuwg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy8rcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 07:10:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so20290821cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767683455; x=1768288255; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=;
        b=gtaqvN3ewpCUDzL+j71Ms+1bAZDd7n36siOt+jcwYGm6SXKqah0ada80SlDJuddoIx
         KU7XN9wbH6nhYT9P+xsI0PE5a4f3Kin+tTYjjt5K/eWwDCvDTFrOVBn+Su18Y9e5UHNC
         7Pt+80qdGk2tL1m1fmmh1guAgM4suUeelDIrCc67on9F3o/ASIkFJ7Kvtq68JwL1JT8A
         bFk3TZFqGMxIwI486gBaLZLuJxPnUY/RPawhqSSs489UwBixyadkHBSx/eP8zzKKeVPb
         2c7ZREujGAs9iWlfWLudBz9SFo3tuXzw1WdpKug72SJ+MAmas4Wi2ADMrOSsXfu9zbhF
         gT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767683455; x=1768288255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR+2kAsivE/Rvdu/9KWZ7We8zTZVWkvuerZ6CyrQIVY=;
        b=TUR8zioEafR/eakS7298jq6o3CsH85FHgxmxF5UjS0udWwjrfXyDuDhmMWD92vOHy7
         VLF7t9HdN0Z3oJw9EEAmKnbXt8VEWlo8GewnglL7LYx3M679+rHo8hoklOZ7+mQN/KYN
         k1JYCqYOxz1pd3X6Ln5rXz+JkKjbjjofX4bBdjdgrCffallnHMSFL7IJdnydH3CQI9Dd
         Dk4QijyX+vVj+jpsJH1xWDxFcLpxu5GxrawMhqEq8/j3LlCvrR381xPM7u4bTpe2nyJ8
         J3z18O/2veXIa04IVSrUtLkCegGAw358yxbypAphZ94cp27Itf89nd46lx+tVG6rsvVN
         pUqw==
X-Forwarded-Encrypted: i=1; AJvYcCVnOO1uMUKG9kS6B/wf/XOQlKKaLdpwVjxesrpsrohC+uX1DKM8klZLt+ZuaG31w8zlMOPt/kJns+U+Agw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzPSXcafGNshbD4to1pK+puyAASRjZbhMvhFtsuUQXKJxD4WhIh
	gJ9v7N+jugZ3FqXbv6+H7vyFmQseWEx0we6uYZSmhXbSCeoP/Q9bCs+SqAIGbEhgwjyVN/4GOkv
	UxBSgE/wTam8TcA0gFd5+eVv34lKa6HktAteGbTkIYDdDsx39gaNgB3WML7H2qADMm5/Y
X-Gm-Gg: AY/fxX5Pto3HZHOrE2wl/d7NyPon5l0Fzxg3IjUhvTq9dTs3Vwtd6S6FFX8t7okn9JT
	GULtZk3pwjvPNvOEF6k6ea1p0kPdB5KOG9+u1livW88OXH7kXT1dyEUO2lbDSdHMCw5czTpsEdw
	p73/0jBQewKVKVZGKU5Aqhtz5/+19nm0R+umXZcY9t+0BOGVD2/qNcDr8hxyfVSYtCrRlgk6l/a
	hC2FWrmriAwTxb1iZvc0vyHiaUIUKEXIKibE4ewyMV8xLmMpD4NJjjptC9OE/56NhoWwxZRs4G0
	MG1lLQ4CpoSRXX7S2/xm7fCziz3keMO22UqxRCyAZltSqZzJtgoxNd2Cm/omNHDtQNZz2ROJPpC
	hEWTHzZiomGaymr7HccYgBw6fY6ZhpSTJfTsTpw==
X-Received: by 2002:a05:622a:2449:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-4ffa76ccec7mr26847751cf.19.1767683455270;
        Mon, 05 Jan 2026 23:10:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8XFjy35zyxBfC3DOLW8LBR5cVdZzZlCAUK/f6DleVwXoBDQ8jjn4JwiDCBEIoRdJUfETm7w==
X-Received: by 2002:a05:622a:2449:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-4ffa76ccec7mr26847261cf.19.1767683454846;
        Mon, 05 Jan 2026 23:10:54 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm2690447f8f.36.2026.01.05.23.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:10:54 -0800 (PST)
Message-ID: <f8e6666c-86cc-4123-b1f5-681b656ccf9d@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 08:10:51 +0100
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
Subject: Re: [PATCH 01/11] of: Add for_each_compatible_node_scoped() helper
To: Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
 <20260105223644.GA3633916-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105223644.GA3633916-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IjaReVwCsyxznI6UFj3OlbrHsYsgRZJu
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cb580 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=o3VLu0Hs6I0nX9ffGz0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: IjaReVwCsyxznI6UFj3OlbrHsYsgRZJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA1OSBTYWx0ZWRfX7eXRSq8FQv6q
 08iJB2cmraT8nohEfIUt7/26k4/AD43+x84d4L0Be4ndjXEnn/b0/1oKD/vLI5MbnSaWwJWTAbr
 Hi2vrzNqSGN7AFMRqApWFFSHRlnXuFpJ+VhNm71C99XJwL5KvIHL998AfrH5jcwCtOwccFg1h2o
 rnW67F6EcNWQEvOPV92qyN7H6fJ5jstH3yZ4i0dY9MDWFMa7V4xG0jP1qriBw6ZGzjFXS9mLexM
 eMMv6E7mk3A1gs1Y8TS9Uu7ffsbne9kTvteorlAew79l506Vu9dWm/JBmoMuzTblaaqNkj0BGwG
 TN/DLkao91lRkHoCF3sA9cAq87+dBfAmlZIbpKjJeO/kOH8aoArnYJjAxY7DvxWHdRAvuvtgscZ
 tpObC0uwdUL1iZHTbG3F0iUXEvDTy2/dn6AI6Tzjt8PNRBp0ztmXt5B2cBM72lngkU+dGinJdsk
 UCuTUoA/2N85OwiSQrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060059
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/01/2026 23:36, Rob Herring wrote:
> On Mon, Jan 05, 2026 at 02:33:39PM +0100, Krzysztof Kozlowski wrote:
>> Just like looping through children and available children, add a scoped
>> helper for for_each_compatible_node() so error paths can drop
>> of_node_put() leading to simpler code.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Prerequisite for all further patches.
>> ---
>>  .clang-format      | 1 +
>>  include/linux/of.h | 7 +++++++
>>  2 files changed, 8 insertions(+)
> 
> You need to update scripts/dtc/dt-extract-compatibles

Right, ack.

Best regards,
Krzysztof

