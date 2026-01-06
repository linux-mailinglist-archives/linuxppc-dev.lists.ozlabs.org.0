Return-Path: <linuxppc-dev+bounces-15307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2196FCF771A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrg5bXHz2ynC;
	Tue, 06 Jan 2026 20:15:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690947;
	cv=none; b=ne0uLxNOVIJ5vVV0/N8F03FnY5InzA0GU7YQL5iCOQpiuv679kaFZl8TLGbgdpwIx84jXiO4qtRKkbAABP9OWQeBzblX6Wt+Eu1x6o1JExpGLFcspSk23fXM/1ErPFpxKX0fOhKejMS2Fgys1BRo6YF6R57yj6l4u+h70x3aKjecbSVWaeitZ5TQ6vs5jSdme6m3dyvvX7PFGqu2U0i9MOuEPYNG3MG7g1uXoBtO9e66p0XVefbcduHdyMPzkJyBr1T6DD5zzZ7AvANYi7WUDDcB03bCRpylthznk50RT//53CNMNDHbdIIX6wpALFv1g+tWkgWf0q7s7tzsfCS1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690947; c=relaxed/relaxed;
	bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dm3BEo0po2MScCF0oys4iTQDajHqGu/U8yJoz4bUHSArD2vV//wmTpp9SFiFS+B/sBxcPhuAQsTd+oI6hxQJ8RX5tMgdQ/9zSW5lZr7SR5r9Akk8QZj3LNgCXSlAyD3gceZngeAIYpVIGSjIaIMIJX+JKOtHxs698S7MPf48/djj1e+7MkkFmh2p8n/jOij4fGtZFa0oGvnyU6sN5qSQro3CNASx8f+6S2uO8jR7aoc6aTBgP2YBjqhfJyrURcnPjxo9adoWPgrGfyn8sxJQaVGFJbMni/3FqLL00klMZj2bEb9rGlhLh+3nH3f5gVMZ4AXArqFSjolDoiU/EL2HJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNssgyvH; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hH6Y7EeO; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNssgyvH;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hH6Y7EeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrg0KNGz2yMB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:46 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066tXjS3295997
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=; b=UNssgyvHFOsSoRhz
	hOzHNq2+BwVowQQTIUH3/4CGt1LOpBwuf2jIfcMKVipTU4rvfDxDeMCKH3Rt9ABW
	ijX6rFSRM3IESx2ytEd/9vo8eeL+cU6IhhNRYE12Y2cNq012BRnOBPEj2eXZqhkS
	5qFWVlUWtGUjOIxBCAbbZL1PLIFvwpre1KlwZI552q72amNuXpIL957aBowCCxEb
	1IHJKVQKN1XjLIMSZn+gtQaTyej1nMcO8w9Tzn4HDaO7yvvxdLSKqPmr4U0chZyz
	vW8i/4Xtc10bvN83JL15y3h0P4XERWPcxhEFGs+B0V00P/QeK/JbNJ4yz0OM8gVo
	EI8h5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso16588971cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690943; x=1768295743; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
        b=hH6Y7EeOR2UK2lzFD5M7oy1+6P5umdSStwYShQ8alBgvd9SETy94AKI40c3nxLO1C1
         wGPCuWEeraG8KiZWVRNZaKv1IvgTsc3uXjVccfQP2bpqsq8apYZs18HQoJbZ7OCdmRNF
         Y7QS4fiyKvLaI8WkZEhWSOAUv20X3BsLGu2Kq5MccwJ+6akrh3NPkbQYVJDt3z8ijJct
         u52H4MWXkoFU5NFiTaPsKKmQZzDS6rwd/Yuqh8PpnqDg1UNdXJz6cP4qi0RXLDAEGxG1
         wAfdev4KFLx9ZRclcVAnoxhBEBfS//UUIItdSnqVLmisrcr9y/XKHEkD2vXVFXr7R3N4
         FaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690943; x=1768295743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
        b=lQsugpMxXVs6DefX7INPCi7LESunjhmE6eBpG59AHHpzVMpmtN4xRmMxkLCgtteFGl
         7i4UzabbkE0ADORnjsT2UVKii+Jpebgn68bcEDkDiyi1E741d7IBphGNLrRQvpnrVVMV
         LixnVvncQ580yZCPnW84GclOAh9nKbv4EIgzgV34h8DW9WbJCodyzB0VrqSu88hhUmiy
         FlU4BkkRErqS6m+5njzZ0D3ezZOHr6AzSKYABJLNXmhcBKItWZBlUgol74eON2J5Z8vL
         4idSgRR7ffRH5Z06X7Nj79pjqKT0vPBuqF0jjPY1QYsjftUQZELas0C4wqEb8G0N+V5M
         YYnA==
X-Forwarded-Encrypted: i=1; AJvYcCU6KtQbSk8TOrrozbzdcgKcmFujpswEI5e+976b2S1CpuPQFSrEpKWqrKxX0rI35Kr5h6SWGYw0m+PfOFw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzl0OapkrwVgILgbWN6Co6bek5SXeXqmL6wWeSsSJQy6xJ9mwp4
	Q8yiJb5qB9yDmva1xJEJdErisfgJ5pK/0bvaeX8/2ceuuMGOCTufULLdXSLYsWgrT+eVUZMaHT4
	63Ftwu72CQBfvY5LIxgTs3hDgz5QTAaVrpaOUfIjZ/vAPzrKEhMUt4mr7Wy5QollSxIm3
X-Gm-Gg: AY/fxX5V77leafjgaNWwRp5HHa542vCiyF9bhVzLQDV8f3w7+6VmmhLuY9mkqM4mknR
	2lHAgFwWJO7J+rJAvFnOelfFPa1JBse9Extd+6JJc0+lj2AegziBcSSse/qOwu0T9pY5RAfqVj6
	0nbBMrfO9jyPCyCI05mRdGrkujhsVNL9Sgkde5GYsoIZh8b9eRlv+UPeEmRlbGYPhM2L8BPHRp/
	JVac/mztVUEwKFfiZXCl+WbdahqOmx0uxW2ZW4xNGfuQ08JIMelPz3VCMi44u+M/+nj+miCQ0Xi
	jfJFBIdpJnf2HNt713gzrGSibEZRDj62UpWrwVGFgpOMS/LTy8Qr2p931su6p2fz5jbQvP7jnnE
	Obzp2Ds3THjCe8QB7CBmlWLP1+sSx3EZGkA==
X-Received: by 2002:a05:622a:2b45:b0:4f1:e46b:9dc0 with SMTP id d75a77b69052e-4ffa781fd69mr24540161cf.76.1767690943139;
        Tue, 06 Jan 2026 01:15:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDeuNCrhajN4w2pa9axdtue2qax6nwJTvnc5Cls39nE/xZiXkUxIgLPcpsnvdWju8KVH6lSw==
X-Received: by 2002:a05:622a:2b45:b0:4f1:e46b:9dc0 with SMTP id d75a77b69052e-4ffa781fd69mr24539871cf.76.1767690942649;
        Tue, 06 Jan 2026 01:15:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:17 +0100
Subject: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each OF
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
Message-Id: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KN3KRjm/oDtXh/DCN2KUrl2ZPSM8F0ypALb9+d3CNrY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKmZXsuC2g+Xb1baVzgLGhhR7Rrcrdg1gFaJ
 ezTFD7yVUmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpgAKCRDBN2bmhouD
 1z7jD/9kNeKktB5dvv1Vao6f1rBEkvNEL+y0aGnFILkw+fFKcXIFMwxxYzzlQfUksNYfJyOdK8O
 BzBik3cMNTqxSDXOVNd8Ijzd3DEfi8jW+J5PLcEpz7riNnuqwBaJkXRAGKiaxYuEFhSTmp8ICqw
 IA3pRZc2+nUuNYEntoIyQa8N4540M6T9RloRrgx8KA/AcupxDC//I6Cnupv+Pd20xe5DweyVTkL
 rH2B84HPtNXAPqy213xQXzfSNeddPtb1NG64d1aT1mDRyu0GX5lvaZBfoaJd++RukRLmTaNjIXz
 n+mK/Udfsktb5JzVUCENVmlt2iBhLG3eXRTcxRyBYn6ela1urPy/DLLyJfRVAcKLGDB5hj7kR5i
 LM8pl9ZOC8Vy19Pvs0obJ2CD9NKLcL64c4V+ol/46prYOEIctwq0WflPChe5Z/BidWm/rfncPLc
 VyFnW86N5SwGO4QUL3MForM/G7H7qgy3Pwha0smSE3OGOxIbISUBhCw6k5YvVfWG3mbQS9ivvJb
 +dumTJQYrMdyXwOlfy3D1qzf8aomhc6kqmB395QwwcwOFVjxeR4gm9QgipV9wsvcA9aRwOq6cHo
 qEWskUhBBGlAzjTlSUE+Op/O0zRyKACK4ToDJ4MefQdIut8sKN/ADiSTOc8+wgCcD0DJBDVmCsD
 /+ZKdT0xUuqOBng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX9goaACKjNDIP
 WxNqnOv4DyfLyODggtIudV9C94ZRVI23wZZ5l1udTPGEcF1KBE6m0F6Rli8tPvCNloPCyiIenHP
 VYablH2BuhIqtbAd/U3/EWPHeR0F3+MvnpFFUkcWf0C+eqDegf50+ss0pjZJg970J/U7cZHi+yf
 0xfL87n1GtKf4x/hELaTaigJkwBjSGPq+aht+i9JPvBVJq3cQF3bTpA+dw4nVAJ5IedLxnsGkYf
 j66sDa/KmMOIxi6KGwzstpFhiWgVaij8tPF6tMCYhdMNOV5ySA1Dpg5Je77YcxQAXW3pzt2+q/I
 KfEgKNuwG4O6X6e0HGagkapDAc32YZ7hPtgq5gnS2dljVIVKUQkHd0Tukg+u+9EAEwovyDs+11W
 ncbN12XTd4F45X1Mi9QnthDPoNGU6+sQNB5bv53fOJ2yYZw6hXK6ZcOPOqKsE//ZeYPZIkyhikw
 3uehizrQaCv3v4nswTg==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=ZKLgdMRimQxpfTQYzWgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: s082o2QKNG_MoiZlVTLzSdXimJlbMuCz
X-Proofpoint-GUID: s082o2QKNG_MoiZlVTLzSdXimJlbMuCz
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
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
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


