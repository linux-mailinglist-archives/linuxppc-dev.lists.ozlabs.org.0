Return-Path: <linuxppc-dev+bounces-15275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA7CF3D8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:35:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFdV0vGWz2yvD;
	Tue, 06 Jan 2026 00:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620062;
	cv=none; b=jFsFMzllJ1HPEaD4+22ZFbKaFlyjSXUazG1yepIuLABbcv0aWNcfHTRjpyfbxaxdv1Et40iYLD5dG19dPXkqJdf1mDoM1L3XvQbBk3QCad45nDDyshWE6QSSjPf3iadshhjeWqPvCJMYnmCbuRZOIki9kdnqExVoEHElX6hEgEYOKWkd/jfB6PNollE0XGmIQm/RawAPMgxCGqHapNTWWsPNjPSWRCcyoEsKxBC0lTxb5jEG7AFKFyDtYFWu71KB2xTVHftTxJKjC0knJeSITCkHCPU0vezhYWB0aEDjpW3UX4ZLPyEjGQYa2Apqz/ax8LbAn/xlO11rImZUwyYe2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620062; c=relaxed/relaxed;
	bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGXHWjgMLdk9ZWu3kilAQD55ISm5VJUcVf+Yzct4EgA6UTctuKiCQfWoZfmBi+sikVbwmkvfX2F/wJ411g6Y8LRwQr5sGzg75Wnrr7nqmq0/tEXCouXpuOpqsdktZYtKpGP9IuTfzZ9uooS+CK3QYqChPqNkoDB22ZjC+M1Q+ueIbpqYug7MbBM49wA4Nqrws8m1tZ13VyiCSJEJSVteQQXLpQLfdvRys9JSbP5mdQF1ayo4fIj7kVguiEkI6GlhJpI+fWvFkMaYAoWVZgo4Gach/a1fZ6U3vq8v2twzbT6XtgjB12p5AeNKILGJjBJMbpuDCbUW4WX9bVZgPq5OqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0Ye+6s6; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZxCJhOL; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0Ye+6s6;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZxCJhOL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFdT3m6fz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:34:21 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058LrGs3738169
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=; b=Z0Ye+6s62/VTDHGd
	1G2Tca4dXxjio8BbLPvCE9P654VjAGl3cP1dTXZClo28KJtbz2iH5QCsPDNimUh6
	IzHTL5XqqkJB8JPVa2tKldM5WMaeEbNhEogSKeCIobffKGKKq5O2IBkBTEiRThkr
	S0iXna45ybILw8mq8Sh2r7uRQI489nf+rRFQiNQFVDiqKy318HHUV2VVbal6OsLw
	IwAa9y7CjWfdP81fsd1s21Fi8r4NcY0a5agJsdwnlDJdB1zEXR9WtARrIJp7fevB
	fPCAU0nshGwkVaR+o0nr70A1WqoGO+VX1P3RPOiYIUhwAQXRde+a+AZ4wlSfwfqh
	euFJdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvsxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:34:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c35a72a116so439899585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620058; x=1768224858; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=RZxCJhOLuO1QPmxxslc86L9rQCf2Znf4kGB+NKtc2ojHzV9PbHaizUv7TgsGneC6uO
         oukQI79DZsUZ5ZeFzJEpaYLdD7Zx9oYGEFSYc+Ma+dqwGn/Oph7GJSbi6tUa698QSf8G
         Ve2wQ6S4m8rKBUWs9w2pkUFXwihJ6nqeqxf+6OH5sNaMtDDr598yOSxzOlHIDLI+vBOn
         +JOt6eFQDY1o8lxkd+hwHuGUF3vVxNUHeAD/yXNG6a5dtEtiUrzvr6Lz/ouP5Rapttwr
         hQZgNOTt7yIMAeDsynljwWnnTpCwEXWrnmOMxaTa5iHm4Ah/+fAAQvxpHZMqpHyGPK2s
         1aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620058; x=1768224858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=T72cQPHVwqgpNtKteB9tqiOICDeJzFUQXjyGLfJ8IKNKIEsulKBUi5j7OS2eu8MtIB
         OIvq7vxDeRUuHVTz8MSQrg12OogXx+pOoU/qjNUCYWUfrP3TKLMfxqKI/LVtDWxKbJiS
         kBzLd12ArcvQ0Eltwc6JB+wyblFnbt19wUX8KgGU4ObUpypGT8Delizmpza0hfb6Mi+E
         JH8IUXHdIIYhnek+cI7t33jmAmMxQ4sjQB3VjhLFlVtNolIXFIHnaieekGzDtF4ESCn0
         AqFComeQoGo6NNWF8Hxjxd8Maedqu2WqUBI0yu+mjUnztcjqn+MbE7qz8+pY2P/kFHRB
         330g==
X-Forwarded-Encrypted: i=1; AJvYcCViw6miNLS5HxxUI3h7gVsWuaVaOj0HlLA/PCctBuR+QkgtQ9QknyvwXbXxryj5XRscwuyHOUFNuZplc14=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw17uZjfMWLzZ2b3QEB7uW/JDp0nhTp14582n+A8q+v6j0HWhww
	J58cYwO8nUpbIvvapaJgsUC8FgeIPR1KMTVj7WawZPf+/8RV5hXKgjI6oTWbryaZqwkPtEJ8dhv
	h8Bnv+oXz9Zxc7LVaQDVKmnA8DSA5bSHcDlg777kYrk3lUrNfp3bzMQurM4bfRhpn0gr8
X-Gm-Gg: AY/fxX4u/A3Vl/zH15WA77pOS/Mv0X4lOQin6MDaYwSNqCgqs4KsYYFN7Rgz0KfVwjp
	UzjH+67wyWmSL2qTLvjEddgHKXDuUE3skwEfps4qWc9+F/T30WFR51pMqUZUDDycEfjeMSaNxaJ
	MUG9sOHi+dS6la7BZSjUtpXSAIt4XkMR1nZGuvCGw1MZXfBUXQsME/fe1Q7xPU7yrnRQeQTRLmV
	2YGkvGVVbM+gPa57hc9IyDClkZZ4cADGFPMp/LmUVjhjGWQRKTsn0qgfUsaYQdkwwrSzRIopqaH
	C5V9lBDgfS7XPZSGTY4ODbgDt9sqhSA0DcpP7/gEiEtGjPldHAIXMcru5FochUWR7//YUTsfCx7
	Ab+ArZ7yE9nrycZt9ZhpFfoswwXQYPgamJg==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr721834761cf.21.1767620058379;
        Mon, 05 Jan 2026 05:34:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESw6Lz1B78B4ULuxi3VJYQUxXjiiRMNi4bRGaq2JIYI77z61n6T7SSooev3CjMW7TdHKjxOg==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr721834241cf.21.1767620057780;
        Mon, 05 Jan 2026 05:34:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:47 +0100
Subject: [PATCH 09/11] dmaengine: fsl_raid: Simplify with scoped for each
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
Message-Id: <20260105-of-for-each-compatible-scoped-v1-9-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7292bX6sV2klT8k73Gc27WnZClqHRYukVQ3s
 g0dt4LCeumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vQAKCRDBN2bmhouD
 11gKEACUJG62p3bBedXNXFAHMBRvdHh5SRxmskzIZSZ7YDiKWZ1xMuPSZ2UpCgiXYu+jzjQ3pSX
 J/tk4zTo9qz76qTrMt/5FIq6qSzht1As3D0B1eSZuwID8n/AFteLawtMhfHZAK7HNjpXJ5H9EBq
 62LoqS7xAsC0xCiZkpZvcZ9rfMTld2TxZl6XNo3RD0Htu0zWS1yAxP8K18X6I26IvXXjscdtexE
 iBVsA5MbEHfRq5ZKrC29z9sZb3tH62HK6tnmrwjs1SVWC+9e79+2kOb8gyuYuehYkOzBv629c1V
 tbLNukjURdIanxovvvQ0QNp8D409dDRHMp+XHeEcAAqq0XpNdixShlzGnTNVhHq0vF1gK2s6kqt
 VB4FxGFFb02+5YZBjeUN1h5/FR7WfVBSu+fR+LR0oeO49MWlmmCch4ELcHp7i8e9c1H1Mck5N9k
 dc20+3HAxiVbWgSi1z0IvynOLTkyQE2AkIcAjJXxMzpJ08ew0r02sNeagYcwLb1142buVZffbbh
 kwn19rttS0m5FcR0q8cRaTiTdaHPQhE5Vmf6NQvoghBrifIdxgzLmNDGMcmCXH39Lfgtr+qsayx
 noTsLExWWnq3y82IinF0+6fHFsfkb1/B4YQVykBXNubNjrxKqGilh7ZemeG2VmrX1owHSxo2BgD
 F96W9pTZJ8z6+kg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: A7UH9zQ7_RYE_EqsD8qyPUOoGvwC52FT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX96FNUKsecjwQ
 VKB9RAzVUahePF3QWuDZxTA8zRKizdaQfWFJtsYVO+vX1aZHgTbSOWNccXYN182+EqhUz7uUWsa
 b8i3E4lMa2IgKPd/J4XynCfmDhBto9NarB/N8bsbRcAbX0VA+PHXMNX2H+HHV5sbw0G0/+5G4Ly
 OWEUMDCIB9LFe+r3Cbjgx+T76353xSQfA9MGeBggzbPrBpNnkGamF00aQYsHJ8cihVXJDl0tpxf
 nDLVzkFXNU5zXeUG9SQ0Hz2Z9RBqrwRduq2g6blNOuTU0oGPkPRcTyszI5fmiovmqJ/j2l+WLkm
 scJeQgdrbCYl2fquS1fBrW0MfEVewwpZmMB5Tx+tiT13JDmcB7m6xw3pZ7O6KGDedpgoXa9yBYq
 yJBWJyZ/dl/XONn/9u4TXiLJ74oPGFlLlLvDCw58Rj9gitnIrgPbxsgJuAGy8acReN7SFrO6MIx
 4K4ym1Nk1/sl9gT5hYg==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbddb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A7UH9zQ7_RYE_EqsD8qyPUOoGvwC52FT
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
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0


