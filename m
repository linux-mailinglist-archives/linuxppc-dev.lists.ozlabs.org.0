Return-Path: <linuxppc-dev+bounces-15277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1FCF3D94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFdb3CcYz2yLg;
	Tue, 06 Jan 2026 00:34:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620067;
	cv=none; b=CDzFrCDoeBZ1ajoI8RRaQ7UjTiydEXmA+34tSayn9YA1GjhKrYPc/fvSMywOwfFB/7Gk7CFh5IZuGLQRzrsyDiU7ON45Mq/KhmAxrLdCvETqTFSfLOlv9kR8NldMifdYbgqLaGz2d3SGx0HDagdVNtrQexHCEeTMXdQRrfWC4S02QccY8tytqx4JTVXd2+xaOzRDfw+kp/ktQYRhqdRxY5nwMuwltze1/G5f1JV/I/AGpuJlIYf1PhCYSeH2wi4APz9LUvOZd50A5cQIEC5U7D9SH6FAxv/sypwZ2QFvUM5l5QpaDa/tfTwHjUACyQkncnc8i6qG8pK4PM80OyxMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620067; c=relaxed/relaxed;
	bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNj3qSRholnhyWuiJ4GFPEZPRes4UBEfVJCn6/WtnYuk36Zq7XdnHr3ah9pcZyUVcGo99GWOg0R1KuBbeSzTaYtBJmt+qtAWZg1rOWYF3xzzRD/g/BOoLo6Y3wdYLVlqPV0qrUv2rGyT5FRoRnTNaUSOVaXeP4wEt0+/FpBx3JWr0YRSqMKS6VLwGBh2aNMtxRU8hGogApvIsoo2uSl6J3VMDepRDTOQLKHFg+ad0ORNbQQR80eBzSt6/A3Qbjbda2glpyeJzh6AzFNtziozIkcXzCMlps2dvFV7zdXtjv6tFNCeUlIpn8vW33gD5mVaO8Urntl9TsPSS/MWDnbeGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0LFytSm; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kxgby2Rl; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0LFytSm;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kxgby2Rl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFdZ2hMQz2yth
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:34:26 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058LrGv3738169
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=; b=i0LFytSmb8lkHp83
	dtwiy4k/HqZDJd/ezwdRDTgPfqIdxQoFFjiuYEMMWn6yHfuPpugBHmB7AgnOFrfy
	0mnTR+NQVJJRoIWNAa8eU+8jhFn6Tc5EHqfJA2qQueEyZ4IDHUl7rfaxVaFzcnLn
	7vsT3eF0QuDrcYPYCp7GOQYGTVkdQ/paqYtDxM+pdAZTbeEuoq+iWp3r2bMZZpeI
	0w7A30mPMK1AHLtlh847Ti4gbk6oqBvxlvUwlZhLHsC/XbskcjBcU6d4CTfcwX/u
	KhT+uZomlRkhhdgZ6c3hiyK2xenBKW5ll1Nc9YhVqKnrfBCd13tEL3viR2j+++3F
	jFq7hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvsy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:34:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso51126461cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620063; x=1768224863; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
        b=Kxgby2RlMbS+rKDVQoPTa6WEg9jtUspVxyYqr1Fmbi5x0aawf/3brKmU0/WEccp6xE
         C6RdZ2Q4ASmZepA3cEXqnwv4Ou/UVdOf/9qsEhcKbr0Ky1YojkbQkRBM/T4t7mJfo6As
         yZ1DrauiXkvqCOgXriUr/znVxbfXUnGn7wQfaUw7hVuivE6s0hBR/y3XswzKwLqHiAwD
         vyrMgmqh4VWWn4lpIkHwKEa+pK0INVWEVApbe+t5XCCtxRz8OpvBXhmCsR5UY5s9I/AO
         nq/4dQ/OC09eodiOfstyMjiRYmF72uyAbkFtvLgzDzJpT7evUIxXKC+SEeD8LxGS9s/S
         Wa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620063; x=1768224863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
        b=V08usF8yuT/rHacbk5UJEbjKci8h3B1F23PdCm7PgemTNCTzsJqcrvJn0DVpiRFIGk
         qtdKtOznpJ2OLCr3ZLjTdABkVqXY7X0lvMiNfQO2FRN3LMLckg0Lx8uhvQ5M/UpMHW8h
         BCdCfqYHDTztpNq2Z1RproXrSdWqoDpHtcAVSOWyJevdc7ecbhgHz1Wnqc5r3uOcEhg/
         kvubIalTOGg0Pq17Eb7yzhdv4ua3VD4l8WDV7ezWK8YdMoOzWAChiljSHoXxwZhqm0vt
         GSitKLmpPjewJgpT93I4QxxF5PIOcN+Ej4LBTi7sqBz0dBJ0V+fSqEHYOyjecnIKyAiW
         JaBA==
X-Forwarded-Encrypted: i=1; AJvYcCVNjfpKukzBYAap+bMtG+CoX9A4LRbL15jfFjZn0d5nWfjjdIVlh5CrJTVhkR9km7R9TPNv8LvquGyJAG4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEPnKOMzfPRt1VfH5EG4zS9IUugNgMIC8F79XfhXu8UygevK4D
	TakzwguqOpjjqQK8ObEQqujsF2m4tVxZrls3eC9H9KM/NLrBJjZO3wr/sxg4ecMCZ2MmoxfRQT/
	484JrlofHjBui+4uEEm0aZmuaRNAwqJYySlYOuoeUztOHZVLsfAtkoqE7DDjZzQbzvKRY
X-Gm-Gg: AY/fxX4OgFy/3HEdaFzzkAukff3MZfhppZEUh8zwWZba2vR9Nh25JQZBp7i+nimRoMJ
	gIsbB3nNjstwtEowrzeTeVEQXC9z4n9mhZ8iZ0fp3PVplxX/n1HsFFY4YiYFlQxEDT3ZBjFir8w
	pgbo1lK5DPL5n1MclqM9hnT+tl0kn2I48n5qdioX0zKA8S7L7x6k0LWaIeA6lbTmsdEKHXn9STw
	4p5WJgVHEj1THtTNC6T1UHa2e+SYCJZSUlBqlWhCqRW4kPjWCFuDZsclGTY+wbVR80qYIB/MOkq
	eyHRLy0jH4GkRPTCw4hjrx4t4cu1ZOLvSKMtw5vloQta3aHdZ17Dtz9tozAzdIgsPieOhi59te+
	bTPkDi7U9eUpYe2i0fOppCdWuwZc6XtuWNg==
X-Received: by 2002:a05:622a:244:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ff46bfa6a5mr90855271cf.24.1767620063363;
        Mon, 05 Jan 2026 05:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH22+wbC/8ocAPNid4zwKCPLpHyZ3rp4TFMtIubPKSch4hbyut4GTVmx04qGX7V0XRikuXA6w==
X-Received: by 2002:a05:622a:244:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ff46bfa6a5mr90854841cf.24.1767620062896;
        Mon, 05 Jan 2026 05:34:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:49 +0100
Subject: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each OF
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
Message-Id: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9xYA0AmVAhViPtU3dAaeClRgRl0bvu0O3AlHrFxfqFE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW72/y4CuyYTjdCordJY87DDcZCQImkSMPz5au
 +HhLxRd3cWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vwAKCRDBN2bmhouD
 13e0D/wKDkZR+oKRpnlwWONfu2Y2/SNHWR8KA7TqekRFYafhYbZkvcHqlge7N3lURLyM9PvTjwk
 zqjR+rondooIsMzxGjfU+iaQiN+jQpeqV/bWMs2T3BEY5zOlToLQpNrr1gOyMpu4MZvIEVU11/R
 ezB/P2yn3Ejt62QO08r4mKcEQSzjz/ncjSX+7y7kkqpx+02YnR4dlQmCZDlS1qPShxQYg2lqu0s
 hCxjDvW2sunRizv8gjInpk6FT9u/Mlg3FvmWKBfQmKDcYB09lYkvXRkUZzAGEuv0dhAZEuLZ9/H
 B22GVb/cxXtk6U6GPjEw7x+IrpIPbpq3Oo6Fe/xr+gAgDdbfYKkC0ltJ8W9NaJf/SOEzzNy5Wic
 YFVfKTzRWchTMRonhmvPXLoxwvQZ5kuEW1zj5aiIVRpgsADyNKpkFxV7nuFKs4mZlYxTuPtTWPy
 brKRg+KVLL3PyLr5ooNsLN7MZhpwVlV/QNogFw+fY3dphKjRo4qMbZqjW90dB7Rgu5BAF23NWq2
 o5Vg+Gsx8Yee//iPiZovGUYQZAF4+k3D2Yku7y8PmhNwvzovMT3WQ5L5MdQJjSsrAxZasbnJ+pi
 SWqICNkVItqpBHbl+hZ4mVYVIPNvroxc/QTm2/E79KJhE3397HEt5Y6oQeKvZFOFdesUKeV7mmf
 YPx3kGjETmm70cA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: wpSCvypIylI2c8ZdmjTj1CEILUI7-WPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX3rhyNjF1MLxF
 8xCL8JSwH1WEzOFZIila2RIxcx+g7QAAV2AEFHjpTpHOeCzjx4sUM14IznfI3CSNYjijnefUvaU
 hugcREUubZpEJJv4uGLQZntU7nOYL5fWTczhdXLZumV1OeqOynIa3P593wkwun1Xv6b8tWG4mnJ
 Wgv/DheR/2MJgvWan89OUU855++Tn22DlLQhvAeLpfdwfoLwUkshz4hLbKe3JAodISqbROtDYkb
 XspHvLuQ790B/gVsQNdJnCVHdwRfmYEPNTpYH48Yziji9tg5iVv77cRS7bq/uinO+MrbHutp8cv
 gige0HGV15VoE6KHHg+OwbYc0IJAzI0tn9khz4hbbQhjCLV1fzNCFo12TRHZupWXDR2IlP4mCF6
 0gnxS4IiZD8rpa0t1+NEw4lw+kg+ZXE/wgm2n9ymZRR9lB+v5fsgv2NZtCajVSiY3QkRWm8VcPR
 u1UCl/ZfIrNeY4Vfrcw==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbde0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8YWg2ve-cigzn2S1SOoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wpSCvypIylI2c8ZdmjTj1CEILUI7-WPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index ba8a1c96427a..e64e84e1ee79 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
-		id = of_alias_get_id(np, "dmc");
+	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
+		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
-			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
-			of_node_put(np);
+			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
 			goto err_clk_base;
 		}
 
-		dmc_base[id] = of_iomap(np, 0);
+		dmc_base[id] = of_iomap(dmc, 0);
 		if (!dmc_base[id]) {
 			dev_err(dev, "failed to map dmc%d registers\n", id);
-			of_node_put(np);
 			result = -EFAULT;
 			goto err_dmc;
 		}

-- 
2.51.0


