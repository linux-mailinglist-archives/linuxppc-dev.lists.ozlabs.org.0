Return-Path: <linuxppc-dev+bounces-15463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A574AD0B3BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:28:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnJl083nz2xpt;
	Sat, 10 Jan 2026 03:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767976118;
	cv=none; b=KJoPC43MthnroNnpptBQjYJJjxATpqpBYjpPvQ31iQm2aakscrAgjNvvqr7vQyd6aJjrrfQfqJWgbv609tSCK1NUqR6oRgRxKfTb8SQiJwZpKs0msX9ip7rMW4dLj/Ctmwy6XtLq3vjCgynFif3HAyUVb+5LKcjzULTKlyreRVh3xQ7N/k5fuHGog5kwrs+MMw9IbanXHa5kFwkQY6mRApa775dVTwkv3gvUevjYBGJdRxBHaIt9ooUAa65jLEaqBGI+KAgnDQM1z6jR8v0bXKacgB66QkrzZBhCGum2uFvAmj+KlciBpjXvepKA2eva5khxkTJMKze2hjkz41fjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767976118; c=relaxed/relaxed;
	bh=t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOkHOGYU1EvOzp23x26lsmWA9+HgQgI6dcbM+q6AZLET7kQJMZKvmmtbWYvDYnQpnWQaLtmQ6UxJEZqM+/mbCGhlcHue37KMfXmxpwnuseFIrhXc27ToGmnZavhLG5z18MrXf+QoX0WWhIZZNQqsMH9yF09U5Bdr8yTPC2ynjKfVJ29NUFWr6jw8HxxzY6EWv2A64lVKbUCbA+fY5MS/PapFqBUoHuKmmnSTSxFJLbPEF6HV1lcaN5nKRQWnzOlh7z0T74djvVYZC4geaF2Ndd9SxMmk5QFrSr7Fa3+XfrVDhZM5ULEQyksqb7qZEU6tiguL/q4cWC4bxxYWRqf63A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=auDnmJVW; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PT2kZ7uo; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=auDnmJVW;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PT2kZ7uo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnJj75m1z2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:28:36 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GCR9H822844
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=; b=auDnmJVWhcQf3oJo
	JL8uymCSt392ezuBs0Va51CYfLzTl6z3nmOrLbaPNCD9V5fdp9uI9qEzkEbGPjNh
	MaGwhl3q7S20hU6QYuxJmTjplPXXWtCfnxBr6YdZhZPa1tDcjd3UXJm+bmBVa3TP
	ZM8Kvv04KvzfF4/M7lao8pCT5tYCBgT+eqmb32TXIC/aSB9ZH2T73VlzdnTs7e4D
	5CroGhjDBWNwddLxJn4Fq+xHJiFubZDrTFCVBTgGcUwWUjZH6uStAA/joNU858ll
	uR+QDtLW6Ez1/GIdI8+yrqOfGK4pxnxcqljH5DMgN2qFPORVl3ck7vK6VPaqBZUG
	s9wtPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94hdfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:28:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1cffa1f2dso870693785a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767976113; x=1768580913; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=;
        b=PT2kZ7uo4Reg8/KuNkwIIH6JcvEieUZAIEMV1WrnI57QXoTTm+iZHC1YhS9/lmhmyx
         gyVxGSrDIndq+EF3jnvsO2pMtJnGaCHFe1zNrLa2wbXeyFzSE+G+iagx8NHFi8Utyo05
         YmfC7vMYKGUyjv0YcsYMJX5SH3vs/Dl7DHSxq37NBUmh3zptHC3O1MR9xuOVr4cW9cK0
         7+5yMn/2sF891ujndEQ/lGSPDTF+U86W1QMGz6JcKlGJfughW4QuVL6h4y3c6xX0AcqJ
         ixBfD2ax/6/3OzI2xbz9DxkZw+kcOfeJGnv5teAGWZZsevn/JhhbeV3I2xz+zmddzTr+
         Q7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976113; x=1768580913;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3gsNK0n+kxqkO2O5Y6qJa7uNbEWU4OWP81Jtn3Gl6I=;
        b=WgncsTDSAuzb9B02dDnDfK7Xhu0J5GH+eh+fLnObA1dcBiIcf+nVdYuvtxUX/HXU/a
         0iLqV/xUChWj+hXfZVDQ8hSdfdZyFAf7uGLdXPCxoSeRSOiqklLF5Q6bWyqJYWXnvQbm
         t+ViccHFmKtQbov+wCVh9oS1ek7RKiy90b4G314foFs1qog6SgaRc/I6JDndN1lYzMUM
         rfxXYXtwdLeEl+2QAoniWhjcBCDk7cX2+NcBCcw4JK3ZYa0yE2IkvTUEVbGYWYzXzk2y
         6Cq8AsR2wx9M/8/2fJKFeshTea/v+oYORfd7oBl34ywq4lRXGga8oForUlQ4Piz6q6Hj
         FsBg==
X-Forwarded-Encrypted: i=1; AJvYcCWIpdV/mqgemg2h1cpGOrrTgVE4yV+mtqTo8GowrmRwagmBkZlRhIcSpiGz2xLsG2eDR2EaVpeNFSMKdUo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZyabMu3eeMlKkWzlGkfHy985mogQrm1jP21zyNKipmFsMJ4Wc
	GKkXPeil88cKDQIH4iV4CzJS+EEWu9P1T6gHJSuSWVB6J/IajQvRIgpylWGUt4dzVXwkFmL4iWx
	8dgcjDp6YueblmTtTKrrvV27DuMpU7mO00sZEHgoz3+UQcjDddfH2UJoav36xSpBRkpQx
X-Gm-Gg: AY/fxX4DDXgbLBV8qs7P88qEZUC7a/KTghg4dhcflFvfUBduTvXlSWJAAhyMFtNUGqi
	H7wcOUqI6Z3mqYiTb9PtHQ7Owxea05WdvR5qXWCU8/YSTUtRHeKzREWthvijHQNh2uMHJs3WJXS
	wVdM5cYbYrHgDQ9MfICMbAQGj9fQAXgg8nwXbzBN+xNdlw7xnlPMeKg829yXBYJfRF7Juc9rTOe
	X8AqTDU5O+45j96+CW1K6cNKQlvb9EQLuTIXGPaLkXIhVVXO2p82EZKAuPc8AkUzP9gwXEECiJv
	ooIHSV4XGxIvu+jhAg2r4GKUbe9d3ITG14e/JEzC6pyumg46wI3rs4y1GWuIntF1YZOi++1RlnP
	xVbddyyGOvyKqGfZSECvFLZ5g2lgEe81nuBqw3w==
X-Received: by 2002:a05:620a:4806:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c37f51e983mr2081063285a.28.1767976112625;
        Fri, 09 Jan 2026 08:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFjr6Hlo/f6CAeSmB5peKaZZkzcXVDt14M9nd92QHPuF7V/gxrWpBy4OmUEIvthc/Tse5YQw==
X-Received: by 2002:a05:620a:4806:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c37f51e983mr2081046485a.28.1767976110721;
        Fri, 09 Jan 2026 08:28:30 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm70896735e9.1.2026.01.09.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:28:30 -0800 (PST)
Message-ID: <c7007179-77af-44ee-ba8e-a16310fcc9ee@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 17:28:26 +0100
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
Subject: Re: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
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
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
 <20260106102146.00005bfb@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106102146.00005bfb@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=69612cb2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i0EeH86SAAAA:8
 a=TgEtEVTGrOTdQsgPiu4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kooSR_gcW_LDJFVy0MaVzmqNuhCW7rjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyNCBTYWx0ZWRfXyGVz1a8brff4
 hnj+eT7XoCzM2nPb60fL8P1GEr/pZsv1ewldxBflaI/woZzENBrkUriM/JIqp/8g24DVvit3fS2
 VwD55z2dwZWS/YdztCDpcEBCr0qdTvs3ABxIJ7uQdLefLCamihNxxOHvXXJ0OWF1KG2qvBgtliG
 PAXx8HDk2xWCq0W31sIJ4BmxguoUnx3Dp9GWGKKFYq/VUfVVCjAtgXNMv/jdn7nzfHYHbBtv7zj
 uWB15QO2anfg2sO+N6X41dOsYE/7KZB0tXsKRpgOtt2WmnsNo1eHtOoNVHEG9pCHuFgrLYhTG5Q
 BeGIyMJtxtyjc2rD2YKQa+l/cuy0M/wpfmPj2OPO/8oitvBKZout22XldUAcz1wierTcgT4DsQq
 DLkHNoqcLNVH+r0avYvjwzRMXNCKaRJlcyaYmUstHTLO7JXpEiIxsDLJJhFMJWE6JfvosxBE0Or
 6AbptDITBu7Oc96MRig==
X-Proofpoint-ORIG-GUID: kooSR_gcW_LDJFVy0MaVzmqNuhCW7rjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090124
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 06/01/2026 11:21, Jonathan Cameron wrote:
> On Mon, 05 Jan 2026 14:33:45 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> This is one that had me thinking for a (short) while about what pattern
> required this double match was there for.  A comment would have been useful!

If I only knew. Since day one, both DTS and driver have and check for
two compatibles, so this could have been simple:
for_each_compatible_node(..., "fsl,imx-osc26m")

> 
> Ah well, nothing to do with your patch which is good.
> 

Best regards,
Krzysztof

