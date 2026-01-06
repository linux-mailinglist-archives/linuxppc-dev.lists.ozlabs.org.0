Return-Path: <linuxppc-dev+bounces-15311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F6CF772F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:17:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrs3lDWz2ywy;
	Tue, 06 Jan 2026 20:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690957;
	cv=none; b=ZoCPHW600dyZ1buCWF5M/JV97h8GY5BqH372XbZxp+NUaUUPdzSc5hyhDxdv/J15F33x70eQwLBBHSZjY4LK8ZSPRlU3pJWuA49uehCpAixwnWJRIp/EvsZj6ZViLOsp2JwPYtMUZQJd8CrHGeMr+j9X8K3zBLubp3XJjdKqpfMfwahl1FySKE4KskFcmRHSj5TRyrxsytiCMTBPMyRSpOmnDNGCvWnBHvAw9t866Sbz0f3WY60RHqglV6TL8e65gBoVYyOq8fHwdeRq3UvPLz6W8QFRM8B30mScFQYvEc1Ba8MD2oOriValS9woOn7gcbiHW521AvobYZjcf50aCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690957; c=relaxed/relaxed;
	bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1cLjJL8nUTvvBhO/n+T/7Dcl249SXRyXmKGW5x5ePhA0wOjFmmmRnOTYgWegXNMJ1EqG8+AuY7NRwYHGKCEym1G7ZMyNiZiJHFwcGsAKwJEGgmtqQsKUT6SP+poJygYqUUTH7G6WDOBlGe16ImCmeiVd337TueHDCn2/w3weT4JlsJ7LvFq0ya5ReKUJHdxYenQ8aTSowWz/UTscNVk2MCpTPhrc4Wde8ztDh8o5XteBigwp2bTjaP9u2dCcfYAEzm0mqT4TelheHhHqreNG6CnbKPbs89FdVD79hUvgvOybf5gBiseuWvSeNZvWqG4rhrkQXpeFo6HWB5koqiilA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBigHb7H; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cq24LWgi; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBigHb7H;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cq24LWgi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrr4Vwrz2yvH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:56 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t4sQ3295004
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=; b=TBigHb7HA0b+swLJ
	OxUCdr7MQEGhSL/eiW+KHB2Gwxt6Z7XFfaMKxdRs4m6fILI39Pe2EfmyxUj8SvzC
	mn0JWowm85b3wmMiYsEL/A73S5/npoav2ydHWAjDAUuLwF95xgEnRv32uu9K6HH1
	dYxhcMXcY/IH66LJV48tVrAtvQXecbSxEBM6GfOOWnF680HECm6ugyEeKbzo0k8u
	KKH9L5bTETMgZg9gQZQyF8kiftS7ktBPqiw/3Ckdz3994DuSscuvX15EAd0QMb+1
	gy1DnIBANUZdVQFMWsRje80AeGASDTNcB2IznoRH8/FbwP/m9+KRoqPaxc+oQBP+
	mfH31Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d2aa793fso24095931cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690951; x=1768295751; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
        b=cq24LWgiCU+UdYgn1uU2mAOAIOBTpcvhs7ds12Cbg+7oKJ01Z/ZF9Q5vi+9BUxOqxF
         s+xJ/sRMA12YnFW96VG/LGTtrGsSNIv++BbflBd1lykyP6tLwyOfUNwRRHc9gPQGCgAJ
         X/TYKHEMdi2TsFoaNK1Ti/642UOFH2bqav31DUGOESQJf3Yejo4FpfmsodBN1OEU08UM
         0hroMC4S6Cm2R771CwdKkueSZxmymBoA1o83IJynsu9y/Y5xgVW9IuikKQBdvFPDKtAk
         3hkmAiOQFvbWV7duzebGnQdYRIIqN/UAIApl85lqi9RHelVcWfJyxJLMTMu5RMf2pQUy
         R7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690951; x=1768295751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
        b=DBlFINf/zc93u5rGeTgBwc5/vvzuMvSxV6VQAaoNKsv9o+Gu+RWlmwkEr8nTZZgOlb
         PB8wM8f617akDUcKI92apu8UX+GmJJfXl8cPG3bTEwHE8dE3DBKofhVgXQW3qtKQ7Pnu
         fRnOnDYA0HQMtPM5c4NEvO8n+DVS7u9kyr+VFD2Euwo8x4zrKRVJkleqLIgpGNVAOEeS
         uEpTn8HPbOBpsqYCmZJj9QrAYBt2cnZskd9Y4NR8DIjdZUzlvFtKt9V5kyY2O03LSSpj
         D+3FK54XHiqzLwolkD6YESj7aCrvbdU1RtupRW06zK0Oh6mvdP31x5g3u8JaY7ZSziWe
         OS0w==
X-Forwarded-Encrypted: i=1; AJvYcCWT6PrXyyhCWshnVGdnbGfro4Z4YNkJvotxLENAPDOkTmM2htebJsfSPAb9NfT4efxL4tXdV5QyJ9Bz5QU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyaEqwhdYgGp9N2IZEeAttrZ7IE/Eo3+Ntj4h43bRbRKpXjWz5B
	XzcliKQIjLH0i0wwyjSvXyKyeq7fZAPs9621dMUT8PXRfVb60ovklTT4BM2iH14bHMyGjzX1n2V
	RKSzt0nqt4wUhN6cH38vCKkVeZLWDsDwr+D0wHPC5DLLwjKG7Xi1UC5wfqCyTA1y07qXQ
X-Gm-Gg: AY/fxX6SLSCje4SrLOUDoeD5gz832tfwBd6Js0B7K3x6QhAyeMayY6IRA+qAALsQdHT
	cqwbJ9e7U1y65NI6Lv3joYVfhvAvTD0WBDzbe2So55zAMbDNmPV629Iujlz63Qep9k1k0u6CwkB
	yqlv66U97thX9r0h8FWeTMLcjJYMCEKvLTLxx6lsT7pztPhv7/sQcqqw0ety+UxysjzF4EEuXaE
	sy132Lt4aaR+urSj3yxgoDWgD6KRyiMA244t2exssBLgyGTwpkVx4TepzX3p6Nf5WgpyA5DKX+q
	pTMXYVlmRM7MNhN5RZo5KYVXEq4tt8fVFJmIF+Fs/6hQ7sqIXyioAQEk5kTtidxnI6Gen2UOiJz
	LR2TYtb5TU3f/hwMhxb+WURuq2RfRIg5nAw==
X-Received: by 2002:a05:622a:19a9:b0:4f1:ccdd:ffde with SMTP id d75a77b69052e-4ffa76d781emr30075851cf.21.1767690950806;
        Tue, 06 Jan 2026 01:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED0yXdejrInhQWfg8U8+hux1ngnPj2hziLJwfqueQbki/e7O1IcaCCccjXHoHtCmrGoHBH/Q==
X-Received: by 2002:a05:622a:19a9:b0:4f1:ccdd:ffde with SMTP id d75a77b69052e-4ffa76d781emr30075331cf.21.1767690950323;
        Tue, 06 Jan 2026 01:15:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:20 +0100
Subject: [PATCH v2 10/11] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
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
Message-Id: <20260106-of-for-each-compatible-scoped-v2-10-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RWbJ5gkWN0OLPo1CmXSTtNWlFLnR+bKkf7s5Nqxc6fE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKp+sqAl0I7tpPvQ0QoODdWoHdFuCs4P/o2c
 XwCiIfJHRWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqQAKCRDBN2bmhouD
 19ItD/oCirgHS49BrQVuTANSy+USONC7WjMfttsLhr/qpAi+dABPoAbX7tiDE9BWLrCMNJWtXhr
 WUgR6AnMlgzm9F2/gkTT27iFuoZZEyMvLZO3NX2xVTVIomZOyv7t1GnS5lzdSDOXL32kzcCfLM7
 K0xRYFbcUCLfqU85D+h0b+hio3mdH5KlqTMMNmHS8mUiJ+GiJOllMUYGWnLoHvFU9XtsWZ/5yCw
 PI/k7qaWs0RYtNNNBV4TfwZo0lBw8EHhjjcxVCW53Xs2rlMDqnSVvMKsooBHf1y/LuVkkHeQEPv
 ihnLx2yuDDaESOfUHTIgMN6aSbfGYityfEi/Lcj9yDg/m4rZfmoJbDh/qOH6vPIXa2Nl7HOSENi
 TCylIT/IZ9uCFy56zMxiu9aJe0m9B5B/a3TW0WOCIIb1sKCjLEKkch2r4IElHv0lk64eu5DsQXq
 qmLiPtOPcaebkfdI5Vg20bIx5CJY6jNt/xz38MgQ1x7sCR33Nd4/6nDWRzWSuk3LT/MFQwoyDb7
 +MBy/+Dvpe6yy2VkApOWSgIm/l87ifREXwWQFJcBQLUBe04JTa3GKajCijaOdi5zBuIztTWUTs8
 n1wWmO5JmCNDvVxnwaaIuZCuYhskPTYuhPn3gUBUn0kzh8fkj88SW6etdR2OophLLX7k5AnTDiK
 +LN5YHgFW2T5bAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXzq4Noi47cd0B
 SL/+4lDAf8n4M7+U1I7sHptQOO4ClVZ35Xr27DKR8YnHrBOQIIdPaFPM9fNxbF+o97LHheC+EPe
 dzdc2BCydQ+Nsg/v52UBG1fPSzitQJ0wLWIguJZgWZZJA8tqHPsQw2eBUWFPCW0RgLwsahVusme
 0bkCcqaTPjMUjTlkFFyE9nPAtraR5aF4tt7T8GX7TOSWDLIpZEQPrW7nEzPl3IPlFu8SZ9sW0p5
 Pv8ofw8QmxXp03mwzWXcwdF4qMc4E8PP0uNJveh1NAZTz3n2CKoNTnkAf7uw3FuIrX5S4sGHShH
 si91II/aSviMr3ExBg6C37/LF7MF8A2iOonuG3M78+X6aVhAllv+fWx4waJOwQDRN29PoESB3rN
 ppwZyT8CnENrvXJxRMM+QkESSem9xpvS8CYyrN903YUrbtPmBI3jDPY5Sd7d2cKnuYBhycft5A3
 e9uuh5N7KZXB6J691UA==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8YWg2ve-cigzn2S1SOoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: szCdBMsGPHNaGMiUpHHLW0HfDQUwsQC0
X-Proofpoint-GUID: szCdBMsGPHNaGMiUpHHLW0HfDQUwsQC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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


