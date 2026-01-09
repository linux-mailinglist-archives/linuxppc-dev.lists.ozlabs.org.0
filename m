Return-Path: <linuxppc-dev+bounces-15468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8FD0B6D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:58:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnz1143Hz2yY1;
	Sat, 10 Jan 2026 03:58:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977901;
	cv=none; b=dkxpG5Euy010w4QGu+budDLI6t5Y3TdypojxRPzomvpWN7rx7heSIVRxLY4uxRlm7H4AnxQee659YhkGUoDEZKvmN2ziY7SnHsvoyb/ZLLiKKxpqScut50cQlk+GnK/MWUfCWswbliB7ixKX1O1BOGqxIDasJOfGbsi94wSaDTy763VW1CfZ6GsJiVoeIb+ZHLztUdssTnJJdF7H2wLdyne15hdoJ87WZftDxIfoWVikLIWMmYbUPOt4JaFkRYxDv5suYioa/LCkZyqQqcXOixX7LHGdBCCnE237OBr5QSyihCjLd3WY2TTIRCCFoKb+DaJEX0u8yVxof2oFzSBZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977901; c=relaxed/relaxed;
	bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FP3cUQqKigpVxZiNAmTtBtgEYMCc7+RqvZO4vIvpiQuChtnuVPNkgG7q1LQK9KQyJ3SA3pJs1XoDaT/sAsz2biuiTFeDAVuX9DyOdNtNdr0lTThaA3KGi9/mWOjLwMGCiGc8HxHRJ7EQpykQoULVGE8uQnbYYaC3ptOGRjQ5SgH3ofXgqzLu2xJQh1U+EiM1eb0OBSdN7PSmurXuJrwH8ByJg56T1W3SojAZ0+vq8AqJTBeFTO25xRKqXUx/BnoU2Bq8oA0bzI6SEhOVYG2HB76Z78AaH33Jby8lIB6TMCut/Ekp29fYKCPsa4J8bPQoFZWLvu1r5AqXWBKZhfFFJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TrKzJhB0; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQbW3DNQ; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TrKzJhB0;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQbW3DNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnz03F32z2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:20 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DIj8G1701852
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=; b=TrKzJhB0BPjVRZA5
	9HXeD+qqFANtO5FgzcPUflJJjsJPmL+iJaZopRqfyCmZ0dq0S/5iw14XtqHrOVgM
	4MO4vkkaBoarumcKSw5Se5ySi39PhjzujAkIjNf6M4uC/iH2NeGQWYZBPqgu5Axj
	6Jzyu6+djq56Q6do6Igt7/aNaLpBSvENldQireaPsTCDbDt4T+H0hHoB6jJt4Ucs
	CUn9EDyjfO7I0WpuJ3hezEvLPhB3lNfAGjRLsPX+bRz6/MoDRCWK3PYnff+6X4/s
	NZhrDeHnw4NdZhSkx595XpdxqPSfHy+/9h+vc0cnmB9eoTjX5fy12uMpe0V5g6o8
	wreOxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdac1xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9ff555d2dso1195364185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977897; x=1768582697; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=QQbW3DNQJCdpc1VDzPIbGCwbJBTWiIqJFDd+gQoxdgqVtvhZPBXaRPGvKD8VfrAQw4
         ivHB6adAnL+l0/jEgmz3qwpzw6Vb90Fd1FIRD073jqQ14rppTA5NnF51Tv7jZdfDGLXx
         UaunMyH81TrtpOmI+D98FqVDJl5r1PK47o+k5S5SrNJU+dsUlmvPIDpFrgy+lGTHdVeC
         M1q+gwV1kbjl/lRfmPXhGTO6q+zomCgIto0a22fyvVSxNlLuRzA9tmYhiH8zyLGL5g6k
         RnYjspHUtwrSIXuvYlKVDwlLwLo2qP+AVMl6LU3yUpex7Pe6of/cnLhV54Wob/ktoIV/
         cqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977897; x=1768582697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=hCX+O0SsN0KGwxCuprwyObKmaD7rJNGkQcYs3Q4T86UMYSZz+g6P9vwLzPNVSEMpfW
         o3Vb8z9bL7z8eClRgx3JiOKta4CN9WxWIzK1ChlVaV2glXsnzVa5dEUPZNABLrUYA1/7
         T3JYBV0BBGFtynIIOlZPv7g+kfgu8/8aEGgCavg2me7TQ0nKnetHRkT649zeqI2uZStV
         eBUuwYfnPmHvlppszBkmbQ6TmuXwklomPvZX/Ab6oC94QoMw+IBBIRrX7Fjmkl37hKx8
         R06LqWkGNll6zf+7XiWIRp8eOtcdBXzuCUojlwbFgNUCpWt3DpKqGPEa75TZ/oozYiRF
         mtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzllu2czxw1KVHv0cf2zA4vhJ+2wxV4FDmqmiSC0aDBR+RArmGh42xkI+CYOi1tmUnNlak/ZRYp+rIVSs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdzdGsL51MWi95p8O1hQMTmL5dZnomh6kDh3PugTQfDcGkz6xA
	Mq8OBjO0pakGYK2w3sqfZ/yr9SjTYEMvXffPIEyJ+YVqh55ny7qHmznV59mlciKyneqyROk6ii8
	GGAfc6SXcKU3nSFb8I2MCAdj30r3YXjSPJ0yeE39a+TaXDSdHacq7w4qYyhAvcCbz1r31
X-Gm-Gg: AY/fxX5BO5djawCEwxjL4kkiwxw5KK9J3dz+XT3dULlY1DlXjczLFaXwHUFZpcUJ+PH
	RJ3ZrXx1D1OnlRajqu/cxFjs7f8hcGGl/L/ivbziZ4AwFaqjWlotqNlcuouFWHnLfuZ4kfqiMNf
	lXzW+U9sxosh0qmksv92rKFuEbkqkj8CRKF2f7Ht7rO05rSNkoyV8zbceG269VMTJu7aycTTYAY
	FhxlP6Cv8pY/0Xs+Y7sfObOye5MfnPRwtwtaeiotczGPFP4zCesPj9CwQo14JHpo+v82S/riS7G
	NTX4xyoD0rbsA6MWiWjcOpx1wABLLioW2IikspE7+oq9NueOH0qj6BziwPvJ4NORIGV+JfFbxAO
	jCbbZW4M/vp76u5p/+YxCW7TEx5fki0j+7Q==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435772085a.40.1767977897590;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFg16z7KscX7Y9jM28Hrz2EGd5LC+7ZiK/jAqogZOUQ1S1l+udCeLhRKjK2FRyHwECsbjsA==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435769085a.40.1767977897126;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:48 +0100
Subject: [PATCH v3 04/12] powerpc/fsp2: Simplify with scoped for each OF
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
Message-Id: <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0iguywPlMIlSsxDnFb4fp3zFOJO07SWV8Pm8YIMsCU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOTq4JLeP1qeYnJbbJLJHoPa3XUUF+q1l3Qm
 yHiiBECvReJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkwAKCRDBN2bmhouD
 15CdD/9iKcwGZWr1TPTh1N8VgCg7pZ1MqIHopwRh10bIppgFfKknY9qqEgNJPMZtoa7VsQyBmMv
 oKYS4n2YHL3iPteJQF23gA4VqXj3G9RMN534g7OIvdOY1VJGEBQSl+S/zcv9CHL3/AM+Wgmr+GL
 SXGJvW8MORgp/6Fa4q/5EmRaJC7kuOFxfahl8sPf7WPKy8mPBpKzNEjyl6rH5IE3q8LDjHRMKie
 9pr788DrA4sTL3SEHINAg/agHf6qEM/IdmpIdrnGJMPbgQ/K48mKbcUFljA90vB9RbjDVdnQ+CB
 y4A+2bS9CVv/G8PivbgPctgYy7jtlcVbrNDTl9i9dKYHRchMdVRI7WiEIKPkbvC+v/9T32y9Yy4
 kYCl8DoUvqCJnfzIpCLnSy5EjuSlwV0LaR2d3KpFeQ6GcsUbpXWB4IeXGck635nvlBKutve/vVl
 Me/ZHK20+Or5+fP7foZ0RyVore8ucmE2QIScRBzh4+NBll1cn0luUyCMBl6u4UpbPf+EhK/D5nh
 y/wYpkFV76Bk1oPhj3d0HC5KQ5DX8TKVBFNz3PV5wq1PP2+qTXHFWjv0g3pn8lno5WN0520upkd
 vo0VjbpyCbLmimtcJE8uP+nLHpKnR5WjDlttXt/x0SfIUhk4GEeaUAgHStwNI/UeGDcgWnbYFF0
 L0NEdtwx5ztHplw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696133aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=bRA1xQHzFO3ZoMUYUbgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iZKNLJxaC3hyQJ0qt8TXY0XcwTmdVzm2
X-Proofpoint-GUID: iZKNLJxaC3hyQJ0qt8TXY0XcwTmdVzm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX3icR3fc3WUlc
 2w8ORcdi+hrb+y8+vjNMMOkqg8OcdTs55tL0bmqBi6X1GI9incPsSWuEkyedd5pyLDrIN8F7VCG
 LH09WXt0N+IgmK5vt04fFNia4xxXSgUF5M2SDq4nAnUaxaf9GgjXXDbh2xtVhbIocGFqED5uH7T
 3LqiWnl4MWsl+YQ9eY9UuOUCcSlUfbeXac3vuDF+oWnVsTH3ETGbg73iar/FzpR4b74ZWsmAI6I
 z+W7sOooLpjveGKiiZLBSpfThzrKHCYqYeVWDB9AmQdarOXZk2JJKJZ168TLEsQgwR8jHq6Q/Bw
 wuutaiVvR7Uf7VePGEOzAYupLUAHLXV+53vpTIknYkCxa9odfZ842ZF79R0P7At8hR2QjUkUAz2
 aHqLDMZXNnoqkY6WFkwO2ldpppJkUex4BZz58vI9ZLNYFM+D+CskDtns9tikTyuZNX1mOI3plx6
 5lctyuilU9do4SS+V1Q==
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/powerpc/platforms/44x/fsp2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index f6b8d02e08b0..b06d9220844c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 
 static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
-	struct device_node *np;
 	unsigned int irq;
 	int32_t rc;
 
-	for_each_compatible_node(np, NULL, compat) {
+	for_each_compatible_node_scoped(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
 		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
-			of_node_put(np);
 			return;
 		}
 
@@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
-			of_node_put(np);
 			return;
 		}
 	}

-- 
2.51.0


