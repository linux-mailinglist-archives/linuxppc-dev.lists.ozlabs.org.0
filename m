Return-Path: <linuxppc-dev+bounces-15268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF497CF3D67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:34:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFd80tJ7z2ySV;
	Tue, 06 Jan 2026 00:34:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620044;
	cv=none; b=CGmy4gBBJGP9JEznsWlCRTe61z4RPYH47fbDdIG6VkmQq9n2CjXpPILAn1mrZ7rAGnmoZ1Cn0eMY1cFOEMeEaNQiYdiKJwjv0qW4ex9VLoldyvQcCrehO+EqEbA4xg8/MlpFqlppza9cPuOcyG/QwnnD+YK8JcgiiRMjpOdHQxfr1F3YJ207SwGia/ix/+zUAySm4A4T50dJYM19N75tCotaFQhkPMGt5pIjKfkRnV/jZ4x4agrW6t/vNRLud+tvS9yYY2hlvPFlHo1J3UywAARUNe/pCXrfCioCQP6GuceHV62CiWEn/RU+KbUqsIdGz7YeIb7oqtNkXfDyIpsFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620044; c=relaxed/relaxed;
	bh=MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gce0DqHfd02RSwaHS+RUucHfG+aY+5DBSYZmM85xlXMm34FFG9KA6m5W/u3uVjkOpWnTh25eETBZ1IBaIV9KigO0DeCmA9mVRY/oGkdwvoM9MbKxzHxqbK1DuhhvXAsFAbLaWmvqe/RPK7NQv6k1iWv7Zd9Vf0XgMPYGvJR8Odw3tWzmkl0gKxBIQKreKdQ+y4Hzch93LftmcQaP+6gah+Nf1JITZEmvIfp8QxsmV1ifHJ6pXchJqoUtKQIIeXLMnDYX6qbJEcbucVPvuyg/dg5TbBJd3+IQhYHc0aKNSDvdJKUiRMc+Inn9TjD4fTVCuHmANJS2aF+IuQBxG+wtJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTmiAZ4f; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wmQP0q; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTmiAZ4f;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wmQP0q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFd731qMz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:34:03 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058Kr6L3655686
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=; b=KTmiAZ4f2+7mqquu
	nFT7z/6wpZyTaieeceeiYqcTm/vafkPAOsbuyKb4qia21luKq81Ho7RQGEok7ToH
	72uPhEAazvSCLCb1sfg0AyvDPph6FH+1qchOZqxmB+QTore6vep26fSWDonl7nE1
	jNx5/OxUU3h2/Qx8WFZkXu+fu0FrOgreOD7+HNVyUWjGvaoq0HGKRHVEqH7zx+D5
	RHVd52Hou2ENiHHmQW1cA6Pc+riIF73U24qKtwMr8zo2+0Z37MYadOvlnuAyzF7t
	0KZrYkvRZ424xtzlYxKCdM1EEgcl8HsCeUHyhdhx8tk9+dOSUWdOKNCx8Xm3BAp+
	LGOHeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvsue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:34:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee16731ceaso284714631cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620040; x=1768224840; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=;
        b=L3wmQP0qSBC1mZ51gvVfG76kQJvkQwLGl1sqYZwmmow2D8Mth+ZlbSgCPNNfm6ddIY
         CzlhiuQzxrhtXhpOlIpCc2Pbwy6A+byy97SXACcsm1pvox2ucx5gqRqb5KMrZMcKXb6C
         NrwMct6wJsGrG/FkafU8kwvX25G7Q2njA0HeXLxcrOQslyAI5mw579guwWYHaJOqSa7s
         xd0BY6l/4IMx1dW9H26EOK84XKmupnaSkiPUqpuUn8FXnyQbM5U5AxVA/PdKActuBaX5
         5TjPtys0BsVoPHy/2a7PNC5mQqutoD8TfiBZPvhqSjnqcbjTcYvqg60pLUzGwcDCs262
         sklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620040; x=1768224840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=;
        b=hrmZx2KTAGp7KwzIbZ0+gK2j8OmckUO0l66egkjsIxX9DPpw8OcrS30vTwr+7RNZN/
         uF/s4mXt1Odh7KJ9Csip0rdXfCDoToiQHXhUqgW7JEiG8lwMoip9qMBcSRTedxAQ+oKE
         pIf1Xo35MnIFzS1eGR6Zv8usjqSU4w7Q5qhdoz8DnpnjN5/KdD7M1Gl1pcIMGSfcpQQQ
         R71Prb/7bHHx5gHfdYx5lar0aV+SHGCsiiynMtNFoEQq+SB46PTAd/N3NBoGEoZXO3c2
         SXVl6U6SPqyBwWq+YD1vENadGRZ7oXRKriTYU3I6FfnqGjjmiZrynOVPQG2Oi+OTBpLG
         jzvw==
X-Forwarded-Encrypted: i=1; AJvYcCUf8/T2nNJpgNzTRXCJj6pl3NztFWx2NWeosMfKkT5sfmVKcct3cE27u5OOyMIUMbVfzzhajG+a0P/NYII=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyegs35i9NanATWP+pbgoowp15HAQYsrFi4MrEi20o3ZwbR23ZH
	zJ4swOqWy5o/G6z/VnnEqLAXePJOLQWGd43cgWoIQIoH1H4jHO/d715GoJmqOuNUbNFskKA8+Uu
	jnZGTQJs341xX5gA2CIUOrpsAxEl3vrmuL8ULagXzw076cCvWeoaMTsrhJXp/RXaVU87i
X-Gm-Gg: AY/fxX6DTBfYhxDjDeMya23S7510qhhg994xV0+/J+1olGGXzl1iSPft7NzmE2KCGhz
	cPOgO2AjRm/oudPRwHl+HL3yDs3sGhkwrK9J56suG6qmm08IrELm6cqMswhzi4kas8L9Aru69u0
	sjNoMQS/JIn2CDuMFzmMUsb++aQbq3uSFc+DOWaTN1cQKVfu9pB8CgDXCdqm7OJ/TOSi2jHMnKW
	km+yfQv2hFT5aKup0ntPBgPoPwPdfgYDe+vu/xWd3vWmgmZkU94+2qsTEzPqvQo78ibd/41/c1u
	NSsAzDm1umj/C04hRJnylbKVjHR6V8Ktovy7KtexTy/J6+3kcn2gUtaDFSFYSmKHfUz3Ps3E6Kp
	wmt5RteQXABFrsnHpR2b7JxDXwaUkFqMQpw==
X-Received: by 2002:a05:622a:1ba3:b0:4f1:e8d7:fda6 with SMTP id d75a77b69052e-4f4abcd0980mr678978181cf.8.1767620040159;
        Mon, 05 Jan 2026 05:34:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+2uQzUVm47u56oWac1o+unOum2Uh65uFLZk8whT4SPW8P78l+PPnQGzRG1E7obagWs5+I7g==
X-Received: by 2002:a05:622a:1ba3:b0:4f1:e8d7:fda6 with SMTP id d75a77b69052e-4f4abcd0980mr678977861cf.8.1767620039693;
        Mon, 05 Jan 2026 05:33:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:33:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:40 +0100
Subject: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
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
Message-Id: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bfaPWC73VDShQNH2kIqzuF1gw0VIYTXqr0RY6cBFgHk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW72343oLFYqnExfyIbIyofQ+4lJgORIRg4wIn
 LJNeUB+yP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9twAKCRDBN2bmhouD
 15wYD/95pyYOAVcfEa979jYh09zE3m4X+5flU84acBvxVqaTD34XXFcK9Kzv5oW8nj1++Dikv+i
 D+55T4nth83xvP5ehkxVAE802+nZQ8oWC11R895v5omyeDUzQFeK4vxzXsR50vDpdeMbfD3K5rT
 bANp+cMheGhrvVS2Qddqvv3oOd1n52J6VX/PgHuGZnJb29uxF06SGT6MZWtcrW1DSzydaOWn2iB
 ju02BP25NgclvWYlqsqO/FAXRaqdcmfQE9aesRx6QCN2NWD3oywpUzF275EvPga2Pt1AkhM/tFY
 kRRxaWgsJ9/P8Grzs9ArlIH1w1TXPLeoWJVgwPod4/CR0mchbMJmcrBjVGDOpftwFBP5WM14e/N
 Rnd5dwuJjOXCqk1ZMWgRYb8mX7gYqitraBfNVufk5WNZDlQcRTkUueo84o6EtegrsFI5M9IsiDz
 oM+aK0lQ6AaclAHqC3HksEPslZQOLIcSHt3d1TZqSJPtHwGWUXUlb0AGTCbp2RZNXW/AO1EJJ24
 bk0Syf4125/6q3f5G90w/08kVg4jd1FXEFNsd+/GH6A0njwtwml1WuT6rju927e5IezYtE1RnQG
 Lh5tLdIrb1WNMXyyQt91khSZ+ovCrQVfT2CdkjIHqM5e9N8AZTTMnXpmejqGoTPqAQ2Pcq6O4mT
 OpwyEuBAKtA5MAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: RC6PWXaiLzZD7ZjFXG2YQ8ljgqk4O8Ta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX4k1yZHtSoQCk
 +1aVkBnOdUEvcqWCfHFWRZ1+E6sD5JT0AhzA6+E9vUP0jDqLpMx+av14xvlvfGW2wJflEL/5URe
 7VYJfso2/K1LG+8eILwcBYkopLffbRnjZC8g5UagPNdLyfApk73u+hhasSqWyv7VdYAG8OydPdu
 k+Y/+jDakMCFeLLwxcSzbrENoApcB1u+HD9rU1amHAhtI8fYy55hipiGNqC+oU9Mph8kl33PUzC
 BQ6piFMNl6q+PYrfNNRTRW7hNeF0X7IN0zZ+Nx0UTkondYxKhX9w41EQxOXc8wwnRPvV2zaR2mR
 T1oAi4oCzjYIMd6ayyUWb5yYJ2jWwReNhlsbETGOV437xEw2E7N5H/SsX3LbGe9kiNvSD6jMyB1
 Wz3niBG23qKCsEtEAcgUH4krrjXe634QkTO9LE9twuA4LKSvOM+W98TqEmvWoieuKiRCHNaDEf5
 Ixdlr1RhjouerBdFUPA==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbdc9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TtkSn9LXl2vsqZFf_0EA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RC6PWXaiLzZD7ZjFXG2YQ8ljgqk4O8Ta
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
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/arm/mach-at91/pm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 35058b99069c..68bb4a86cd94 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
 	struct gen_pool *sram_pool;
 	phys_addr_t sram_pbase;
 	unsigned long sram_base;
-	struct device_node *node;
 	struct platform_device *pdev = NULL;
 
-	for_each_compatible_node(node, NULL, "mmio-sram") {
+	for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
 		pdev = of_find_device_by_node(node);
-		if (pdev) {
-			of_node_put(node);
+		if (pdev)
 			break;
-		}
 	}
 
 	if (!pdev) {

-- 
2.51.0


