Return-Path: <linuxppc-dev+bounces-15472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8C3D0B6EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:59:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnzD1JgHz2yqc;
	Sat, 10 Jan 2026 03:58:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977912;
	cv=none; b=GQiyt0YPiOUZZKBPvcIgvZp5zcxYV8ERJiovH6BDIyhqp0SOODxrx+ciyif7MzvlZl3jwdrFPMgTCHA4ycRJJixtFfkJ/dH2Jf181B4wBK1+HHh6XpAhMikfLAZ5reY1zaCu0zZaoA5dYaX0h+teVH5y8lkJFQX7wEsaqmKd4aT3SkKMjvFZK0OZm3YwMBOfKG7xXJEwMCyvnntfisuljFzDmlip/cSQ7iqTxb2NRMu8FArGjFGwlWB2jW/pF1oIAZJPeyv/ME341dP6MS2XiyJKLYGb3MI3AWM+dbd3QcxrBtA+PxAahwy14xi0P7R9PbIp96SEj0ifaASdkiFe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977912; c=relaxed/relaxed;
	bh=52esIL2ucnGVPUBCl6apqalrw+3CaurVcR5VdpYCYsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQjLIIafrBcWNpSZJwANHAjEzdt78DKDTYidq/xW/jY7/8N2KelkEq30AmzSe1xAcfBvdlhMRXAlZ9owh+FlPI9DS83giBSKeJLiAwyPS+FBdF2fH5coA3rt5SsqpFWzXV8qIq69sN/cphHDFK4KpapfHKkDW7h3u126wrGDnU/sIo5je6Q6rOuUbslK1k9IKmWFg4q5nGJJh52MudT4xChTn69CpG9picq7nZi/YYrWK4rI29mZhTH84+f7S5ysj8tWjXM1RY2kiMkBGBr/stLGD0AVEHJgZY2o9BFIELMKXesDlHhzVKg2REID9ZrBrhcHQMZKcYMaR+Bh0lkHEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDejZZEq; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GAFBW4nd; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDejZZEq;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GAFBW4nd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnzC3F75z2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:31 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609D4ZuI3542109
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52esIL2ucnGVPUBCl6apqalrw+3CaurVcR5VdpYCYsQ=; b=BDejZZEqdgQLTInS
	KroDPvkMPu72OlNPQ52qCdnZBYB+ZhZlbDvgTHriSrXYqOTO259Jq8xa455VGk45
	SVuKQEFw6PEsnXPU6P9SxiaUgkx5TY1q8cvOgsWXY+yL0Ub2SzKL3qRHn+4sSjNp
	0dvsNguDmHwtvosvjDA3EWdR/yzOItD4EryNa9F/+ZpRWSZTAy4mJblRWobe4j4K
	7Vdh5obXuX+6PdfP7A3mOCGM1/shKRD0z1ZB9xPt/PxP1l/FHAinh8F85+vMY42q
	8XfuAVf6eZy2gp1+GYtrrSAOxPOfDsIEzJy8H88V0+pOM3SXgub50jw5lOsli44O
	5u5hsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b211q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so550132785a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977908; x=1768582708; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52esIL2ucnGVPUBCl6apqalrw+3CaurVcR5VdpYCYsQ=;
        b=GAFBW4ndlpMNitdpNgaLOWrBSbcICtSuEFjgyAKquZzCjsNMRLcLCLk0qiWiFihu53
         lstks/ChgU3YLMlpl7qFz4l7dhfkfYiw8yZWYXAQ6YUNdie9wjnx8Cfz4wXhEd6J0ht2
         LMyumyEOw3H1y8CmhaMvr6winDsPoJMP72/36cSMF+oeB2GW6pT9lmSd2GPi6LTAJk4N
         Lv0op0VS2HRhX4V98Zv/yK6GqAKyfrbq2satTObJwGg60nMxbd41SJT5t0jCUN4YvzBN
         JNs9e3EocBNbhilitdTDYVsh9atRrHNPFmw8CGdDxUDLSR5q6CnFWbFAfTltXojjzyVS
         lATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977908; x=1768582708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52esIL2ucnGVPUBCl6apqalrw+3CaurVcR5VdpYCYsQ=;
        b=q1Pm5aWd4FujhFrurrf+SxI7A5Kfc1XMakkJ9yM20IFXRBiyY+Mf9PRlRC3LFOAEqa
         HaykGiR/TaEcRu7/LyQPXHiMJplhxrd3rx74Q0mktsaPDw2aUqHE3pETbJrDnMcLktk8
         BTyVcEclpIH0K8q/nvsKSTdcc2qK0FeNyWGoa6uOxFlUtlZjY4/cybijczt7FjJeqMjU
         2K5t+dtv/qJtq8zzIjOi1u4BEJ3HLCzUYHzymjSP/VjE6INrd8MBNqjhMUP1pQMKAf/6
         Na1DuuhgPkd6H+0V4eyJbtm1p0rtaBq5ewtpOyD6P17GNqhsvUZm9EbygHov7/JQvKs7
         z73g==
X-Forwarded-Encrypted: i=1; AJvYcCVTN6TwD6H0Df+/v8MViJmDO6YzHHATwPbnjciNjR/NqfFe2hxJbqcBxvEvGfWRVCXraGk62kSJhDJT4aI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4M8/JFIyZsUTIcSj/p6m24iEWR8ostZg/JMPmYn0syh5xRXPG
	myWkVmz9hJQ2xXlujoDZjyxvJh+EbHUUuJjTLVArB9NoTnGKMWFW/8+TZEcF/9n1Lg15rM3hUdJ
	S22cOg81srqDvWINt/qJ4HbBu4KvwYzOdrOCuT+vdjCRYI4nMIL2ZySOB8g/QO9A4d/4a
X-Gm-Gg: AY/fxX4qiytsoyCDFoOFK1gL90Xt8dqoclP3RZdWSvcul5ZuSUrYyeWd1uuqV89APA+
	a5i3wClzG4EddfcH/FWqOF49rm+UXV38gLUieeC1zWEPDdxsWpgD3T67Th29AtzRPZRa5Ed2aGw
	DnkcKT2uoj2MiEMQqzrE7cFAoUBqgSJVXxZoFeGnM7X1VQRXlzweIAsHayZ8gBHeKvONF8m0zbX
	0mEpZ51KyHiyOjOovBlpL8PJSPwBXOH5dNZ1TvoPHNzwJMcjHyZkRbSrockCd02rZZy2ns4hhYw
	YXrb52yxuS1WWg3itlwo5/PRx0KjyN6TPR1Qolxec5iKUxqpxrTw701y1HlsS/uWH2MNGSEw0Iu
	/x2kfHxf8AWvF7gDzBIwMO80lUIFkMvuAhA==
X-Received: by 2002:a05:620a:7087:b0:8c0:cdbd:e09c with SMTP id af79cd13be357-8c3893cd9dbmr1340624585a.45.1767977908518;
        Fri, 09 Jan 2026 08:58:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMbrCPEDW/gDRkMomtSmQ/ccO5PqCMMr3MSo9Tk3+E6JheH1AjT7zmuRjVtv2Aa/bfG1NR1w==
X-Received: by 2002:a05:620a:7087:b0:8c0:cdbd:e09c with SMTP id af79cd13be357-8c3893cd9dbmr1340618485a.45.1767977907891;
        Fri, 09 Jan 2026 08:58:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:52 +0100
Subject: [PATCH v3 08/12] clk: imx: imx27: Simplify with scoped for each OF
 child loop
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-8-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Frank Li <Frank.Li@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1iu6MNvbVEoRTI7JygnS7ijPqFY49qevKSe1ouy8Rv8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOXziE2GDkuuIF6EGlGGzxkIyEdrM4juybcV
 MZ1Pl6iph+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzlwAKCRDBN2bmhouD
 16RLD/9Bs2DV32C3cRtjI1vXFRSea24Y2aVmtYMHDgYOu79Jt2cq46IeeilIr2S2ootiThXa3lL
 tzwrtBZsYC62ADGCAUklN5b0Yy1CFN40LrXNOX8N2EFzhAcdzxMdXvvqpRQ9LJDoS9cSY6gQdKZ
 JsopQCuyds8GHSp/Borf2T51wFML9VGGxP/4XCfkXDmAHqgZ9yHpX8on7FMYG1RKA3XJlpVxuX0
 Al90LDs9V9oEI231z/vU1HMOm58AgKp7Nj+a3+8YL0ZPhPczivfbPkmDz6RYGLL9hgYUnOJx79a
 MZb/ES4HJ8cKfOU2UoP+FuQLb67UA2ZMn9UDADo4CqaYQPzwhYDva/UAcPxsGKvl9UuzKv8ltsJ
 b+ySzmiIfC4+YvxPWpDE6+oQcO5DtRLNVIJoDV+Qo6X5oAbF0fC35ab0VXZSLsaANUMn6y/iHL+
 RBBGI6EVNL20l7KhT8CsWlSZleDoLstMff2HUmwkDP45DryYEpIfdsRwMyTKwYd8IOAQkkve/we
 aeWgZhVggXZ69FDQ1oCXMsBtGPXJIPTgDAV77HfT3HzXYIoPnUMUOnGPlxWdVGRguYZw35GO7zi
 Yv6tgTTqllF9V8bBSNB7vs0tXyXMe7aJ7JqCcF3KYzqKOSRWI/nGgHnFND0Foh7MuknQcNOMhuR
 pZy37qRG78PrWYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXzpncs5Vhkk8i
 P68h7URKXUryZwQfbkPcM3pVsJ7mUcQa7ALztrNUDajamjyYX3o0aA7DHqLaZYdpSeARiWWusdi
 CYcBpJKKVnWCP2BzB/qPVlbpW8vSW2JrQV9gjeWmaSgdrzx61puqFRybJ/a6SCl8Y0QPcGmcMAj
 eAO4OhfoZ5mpXmd6YLnYL/rgPDHWU9WzZQa9Kw98FUifIsBv3K/dipJJq4Pnb2Z9dQnZlJ79sRh
 7d9RoxgjWh6l3t66g1/x3p0H+msyPMzwwG03i29O3B/nGgPKPyYKlpH1wOmCbqe22QuEf6GFUgH
 Hi4T8knvsU6dq9jH2izeYeaGlaqX7hrsepj4SEjj3IazMGvfWJ+k1pZ9nu1EiFOQuggo0PJHt29
 B2tQNRtL5dptaUW5uHclaOFrwBRjItrz81V+Pss7+qkn1tG6jkvqJ8yx4+kJZpjb4VmDsxsSK16
 eJDGjc46cvBl3WczoZQ==
X-Proofpoint-ORIG-GUID: EYH9KT6qnTQ4HkwNUJFmEZcqjxNNQcdn
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=696133b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: EYH9KT6qnTQ4HkwNUJFmEZcqjxNNQcdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Abel Vesa <abelvesa@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx27.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..f2f0d3fe5c52 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 static void __init mx27_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *refnp;
 	u32 fref = 26000000; /* default */
 
-	for_each_compatible_node(refnp, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
-			of_node_put(refnp);
+		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


