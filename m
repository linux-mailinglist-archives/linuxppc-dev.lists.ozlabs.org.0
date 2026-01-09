Return-Path: <linuxppc-dev+bounces-15473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE7D0B6F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:59:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnzH09sVz2yrZ;
	Sat, 10 Jan 2026 03:58:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977914;
	cv=none; b=jFAh7CMvLZY9vPY3BXXiUcKXRd5POhfCaOG2yj8Etxng3uSYR8msihlAmQSOmt03UD0jbvo1dV3GYzGwew8HGE0i7hmjf1MY0zGR84vwblcNu8dk4AGEn0PZhxxmZJJl48hF2VRvQe3iUufI0afh+UFQCuIBNXcT+DC6MkqzCnA0E3pBGxjvLrZf85PowUN/tXHXGHN62jwjIczcQMWQVy1RH7R8hjFwun5MHWiizUtEh8nxN3SOzpXh0gSf9mrzafrAqVyHvh9J8SZn36WFcnPUGnLGljRz2cqShxSKMBiHRdJJV7PSv/k4aF8x5J6QSnsvPar6qQzWviQIz79lBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977914; c=relaxed/relaxed;
	bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSqZhiwHZdKC6qvis7oyVM06CWZbMYuyNwjVRYsdokfB6A+cXRrJKQd6+zEUmKyoUu2YYcU6AAT0eBJ8IonRz9JzM0DpFRy5wq560t0oKynjBd6xBuNS2U4mAHtAuofKoDl4EzixwRRui/bfCHd5MjThaESwXpxsnLqI1Htih541wK9CbZZXsUHoyZPmH5mHRtfYC3eQGbgitUm0zbuvB3tSUoyu1Bn9FJJPZw+iX37rV+AsUT7ojttPeTkfObAFGOhQsFN2VaQjlHl2GjHlBCtl7L3lCaHJw3kNcBHO+93T0gl39AZN+K3O0ZVZoUkGZS4jpiA0l6m9Gdi3zoUDpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bw2aC5Va; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MHMzFt2E; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bw2aC5Va;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MHMzFt2E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnzG1C6Yz2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:33 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GNkZQ2328431
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=; b=bw2aC5Vaevcd1ryh
	uLRScVJd87DWUmrA40LMCkcsxHs9m3waqPfan7pxpk6GgRcWkXgbZyKBBJewy4mc
	8hoQ1vxxohXNFijNlFrHk8OXGA/0eQAA4iVRKadwITNauTbs33ODpf72fxDuIdrc
	j96M9/kkJepyhfIrGr9+iDj277g3/eIxWIw7Uo5NFCnERiu9t+yC468YC8pXSltO
	BufnFUaYO6zxBsrLzGdz8GIRZhxHThIJ/GbLvxRHx4fUsRA/iL7QbKmAMCGOoBjs
	vlnVpQbNGySWSaUAqIyte7Glum03G3Ppot/BH0+1Nnoft90P7Mr6af8tRz/Wy4IW
	nkU2aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdac20n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so667345085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977911; x=1768582711; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=MHMzFt2EBKQMy+/D3IN0ixSCM+zl9W8wkprrHDlcywugRaaCUJD33/cK+5INIil/J4
         0xuEVhTPU5gxBIgqBqndk2qeOv91RFTQUcADB7qrnr/CF5hKD8acauHBhBep3LEvga0O
         VKRrfKPeGQrU1W1T8CCd/bcW99IaeaPykqKvzNRaEH/E/OSi6fQAR5AwD5kMPr13scyA
         Jol7/xOLKPaYgjSio8tQOCMuhgv6Whp0AxyDNMbN1pOOiWmEQVaIElbRqj2ug8izJ0Wb
         bcQjgr2HpLNfzHtXhXAdl9CM0MpYZ+LGfQ0qpuFo95ESXqQmA+5mJRpyaJ3v3yEWUzOI
         EAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977911; x=1768582711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=L0L/jJ7G4zGMZiVsFp/izWWgRge8a0DnL7yficc+qJzD/ByPLq3hMDiAEO9zh5G32i
         NLMJ6tyyNoHV6c5TVPuZWbj620340dm5KV5x5F4Sx+x0taSbKUyxfMgf6bdw2zXt57DB
         Esd33lM11CdVOaGKPixJBtXIkdCcEaM1fmZ5KJWojKkNebbvBLvpdDedvjJfUJ0sE/Te
         3VPDcgoXVitFuubfVWphLi9VbKPbL/0lTWitfBctx4lsFDIYPp607sewNYw9VT++1E5T
         yoBgzSzAucvCt4DVw/LBBqW1LaMNN37UA3vu0duTKpwXKq7HMiTXbs4mGFUIe13Xap+y
         3OvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyqypXLp6DBQZB+j5fazu22ZHkjcGjyEuyWWGvzr6Mt/M6X0vT8UHTRH2xfu/jLu2Ahmm+d2aSlnOuQxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywjj+LeEnEVOY9uIbzenOrN0CxhceHX8mMUE2Tux8Grze6GuC8d
	8KbU2g0OJ+vSXzUwfAFu22z+HjcJ2IcbTos95QvVVc1sSDsOojKKaNJy1ezZN6hwB3U0aOjVHdv
	aE3SSplEn3vp4VbFnqFbeRHFv0fngrnu2aj4zvzAo80dldDHuWihp201pm4YW7677GWGk
X-Gm-Gg: AY/fxX54wZGITMHSKBJiW3t3L5zAdjeXDRzpeLnklBdG7X1L8HIoifjLfwUdbN0IHhN
	MJLTyHVhFpW4w6DNQ1VvatGAmjIEHhTcm/GINPGAl4RTrl+SVJ/umq4UTAWDRrgycznze8NQcnE
	t4HV0FBHrCW5uWkVkZBZshQvuUfnEP0IjdavHZu/CNf/GUgcgZ1auolMts9S5nkChMesmlUpGpK
	2TEEPLOFDbawQVV3ybjUmhO6jB15BArM1cKPURp1UDKTwGv5wYWyc0oXxORd9PhYOEaUhweweZq
	+axcqbUc4ehuIz2MfgKIPROvg+6ImxiM1/q54rXgkMSMPWQd1MHIAlG4oxADLs3xz7KzCTzCYBE
	fITzqLobhtCcri69HTbAC2G/LtA7Nnu/nVw==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424668685a.73.1767977911266;
        Fri, 09 Jan 2026 08:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEagzIp+psjVuVk3GVMCLnSaVXjxxAaX3Szhc6w4avTMmKqAquuUCbyZR4B9aXL0lO+SjkmzA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424664785a.73.1767977910752;
        Fri, 09 Jan 2026 08:58:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:53 +0100
Subject: [PATCH v3 09/12] clk: imx: imx31: Simplify with scoped for each OF
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
Message-Id: <20260109-of-for-each-compatible-scoped-v3-9-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOYPsGxvbeXsQGj23rJ/C/cCYfiZObAB9ixz
 y53oRvcWfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmAAKCRDBN2bmhouD
 11quD/932ltOa1s5tv7DudKIHF/1ebbW/6MsuD85b7MWtuPg8Ls//bcv8pKK2ldqRl0TTVl8PkE
 ymOrPYPnkMOZ0U9NghNrj6KVF4exeUKx90kH9QNCtz+HIZj1nJxO0FP4sAeusOxe6LC0XrIZIgV
 t3AG7s68MxFbVkr5P5MZWLUEqHSyz9ZPyXHNFZ94LoQ7nkL0OsIZ/eFD2njaVT1fP3AysNNBx2X
 nCgqMQaEuqrrH0p1fZir1tlD31Jcd7sExD5GCAdljD6E0uZpm8xNDlJlWECzk2Dw5Ap3COM+KYn
 e3zK6tgBgEPPZ79RFbRXCQWkuIDeyGMDek+78gSufysu1DMds4kQXEFiPurkbSasHj8KuVA2KW9
 +nolYW3e2wYzPGG5gPHWoiE4CUFSKxy0t36hEQhgMQLZezOD3Cld6uvoW35Vd3m3ycLRErbjfs7
 0vTrDkBhUznPnLA3rEEGgGNBoT2i2rJ4Bsh+ilpoIs4vuaPh3wm24arsSyvlOSA93Gg5fvpEVQM
 zbhxmpeJHsu/YUcSjCtdx3PmTZodhUNm03jj+1Cm733yQFBZLh90bbahZL9OSE0bE96DdNCG7UV
 Uc6hfMZyGk02iLvd/M2xdswLxMksBmEDF0VsW9mDk1UbCL+lLFy8lbJGfwOECeeEF+4EZKw0VJG
 3miz2lZ0KOeMIoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696133b7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 5QbYu-qBGuWdKT1ZOEEvlu3yBj0zDnrJ
X-Proofpoint-GUID: 5QbYu-qBGuWdKT1ZOEEvlu3yBj0zDnrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX5CNKsGuz2t4R
 j9V8DFjJkXSDkfy6xYGI7wOnQqpZJO57YW0p3gvuUEdIb3u2S8bkw9vYtnI5YM+lHit6aVWTrm3
 z5Llv2igI4W1s8cqA8gUlJXSzLv4SAK9VRcgli2074Rw8lQUGvvmvbvZpHAXQVBdZU9Q6xrnV4N
 nxeZnZ0qnuqZ/eUn0xnGSDOX7E0ttqoBNdCYedHuwfooewknApaiewFajae3qYN4O5cQmAdWsU1
 Ff9zd1z39kaEcHmDi8tNvAvXPJs7avyQd6hPO6CjfW2CC1+5D8MPOVnVx0jnN9cH4sope3rhZKt
 NQ9KtGMyYTMfi5vKvRKM7WGBIhIWDgp4LHYYa2nYYnlMo/tP8z4uh9gw22H1zbPbHYq1soozkun
 opDgTRmGyv30Cz1TbiwW4XP7qbEwmFM6QQcwlgZJwj0XNYoBrNbsRmDilqcgJRL2IH9cDtPLLLa
 lHcvNA+wrsxk9+mIVRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128
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
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


