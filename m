Return-Path: <linuxppc-dev+bounces-15272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C8CF3D82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:34:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFdM03qDz2ypY;
	Tue, 06 Jan 2026 00:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620054;
	cv=none; b=lkpBSELVaHutwyqo1jV4VzWAR67rZ9oWypRQwbmTf4rQ1iKM60XnK76kwyAc65DZUm7GCv1AZmjfcfT9evqP4zVPocjsyO3oB/drFJY55F1kw5EatuKWyec2rBHf+HWNRv5t3o8I1eBJsDFaVOs4dxl8LlZF0OdI9DayEygJldAqL4+IrGuAj6pKDt1G4I/zgQLmOR3vIa4y1y7fEXg+/8xouKqP/6bQS2CdBwl4UXhjSXcmgAG8JuekxSYx1uXWIRORp6P10CfaLTqrXaUGM2VIsG6sTUoPXf2QOTkY11pKmqURtbnOfip2MCMbpoSjWBOUP0l8muA3Kwjv0mZSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620054; c=relaxed/relaxed;
	bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9OuH9Uq9WO/ttrjkSUzWXUff1WQaq2JN/A1NzHePjs06RppXk22HXtKwVvIMdlA5hxwh+w6tAqQnEBiuNCPCh0AE9gHQBojo7dI5eMhuUK1VOsEuSbGivHsc9CZ7bZHT+3WumBfoY3aeDfNclL9Lufj1xlN4ypLHJE8DwMV+vCyYJ+ks9m3URBXdDtbjO1J5SzhQ+hBaU/dWfkQZc1vYFRMkRl6TQpjzm1mqIdqmYtNsXTO7T0LEIPbSMLznGnP+QmIPxkcvdhy7/6NG0rvuSLr64sOrdUCbRpczq9RNgpOxS9Vuh1QbkBjMlyqKHU8ej4Ml/bNz+tPBfKLAejalw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSeJkiX; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NAzn5CyV; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSeJkiX;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NAzn5CyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFdL0C5Qz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:34:13 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cnpx610492
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=ZUSeJkiXhgraqhhp
	F9dBNlDU2NjJn3UYcir4XLIvDkfLIqXrqgJ770e0uuuD3xR1xmIrxRuxiT7ZeJzu
	zIq/lxvweyNV+PueM0rqT3bzxnqzHA6NMNB2l0a0205iiIeNgO7j9pvpT6N9XttR
	scrfVoTLyPxZaXSZJZvdRInISVIX+rGTIqDtRRNHfTWZzYMS+M3mNRvd1ntqtojx
	d82EKfzcpzT+YOJ4k5q8kZLPeGcJYhXp4b8IJ9pafjIUYq957UR9TSlxmodSjYtR
	kWhuTIa+ATVn01Z6oypoyskUU1kfupOx2KAOKGtFvKzmdgcp7PAvcBy3oh8TkUR8
	e2gXYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0jea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:34:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so523309021cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620051; x=1768224851; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=NAzn5CyVKZrYZxZpoJRPy2g4ENmoOE+50fZ0argc0seIPJaZuUl21sZgJg4+Ihjv62
         k48ZyLAe2oGXigNcR/WtE1BWcp6EC1DxiB8CJH5pXUA8EioJEj5wKCPqr8tTCZO0K4lk
         7lQg6oF+jVyiCJOFMHN1/CjAm/nDPXuD9wJANB5wageXHpmk5UwGzzcIeexKKTIuWW6I
         +QpTlHwk5AWBZH2bny2URAPsUGCwB8VBtRrod1Motio8nkNMcbVVaEY9fiqMLP6uoV18
         bEWVBThh2CebuYn/Mph//heuFmYTAbPxkMmPleTpEqrCti6MRAlZOKpbTtw5yVioc5QG
         eCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620051; x=1768224851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=v/JoJPnpGDvUEXdQjY0TKF3I1rEFKiM6GuCA2Dt52cupT4X8iXkqX1/zJRptwX/8e8
         2WVB5/TspE0IzWEQXcBRQVPgV3vw+H/2kjicnD/neS+7Cq8qlvHThqnvPnTS8Ze4RGXG
         YesGBFbKXIXU3U1fHmMdxc/mgYqR7PDU/TMBzDFqiihKE2QmzBypBUM6WM8l7pAmbKuo
         SqwKFFqA3FyUUAxhz09izdE7pGXVGD/UwJkuiz+acaF5bRWjdawCH6Vxfurw90vdPVIu
         jW8DQxp1RD7WhflOT8S7t62b5GUbNrFsyDWT4iJae69uOQxDYCCnNe26B4IfjXH1cGY1
         7AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJC5bEA3vdRbUB0BT51gGJq1WozVI9Xsb8bA8V8f9336LdTLyfcHlySGPT2Qs53kAfIdMU2iw9cjn0a5A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFWuS62vnSeas1Z6YathSVmpG3I8wIBryNB4rlKLfGD04/C78o
	YbGWu3YRHAXLP9ZCP9MPNnzPZ1vY7PPf8w4sb1+PVHosSzSLif8L50iZNRqpVJL9DSq1TO6RwHV
	e0bE+MaUcJZyYA8te6AGjzqlyr8qyTzrsp32/rJww2X18K+XoB8Yk0UhE6bEeZ2Z7Q7+JQnNz/E
	S1
X-Gm-Gg: AY/fxX5b35Ue76M3zp4RkjbuaVLTtXyrbbvfWqCixvTKgY+oQ0jfccmXglBTav7pPts
	Yyyg5rVvi6WLHg4pvPfqT/fBfHUi2mX1QFiNfhrKaLGBOtzjdPIEq/g5ysqYRht7008q1/Wf0av
	JR9ujza+drEfNzmPELwK75ezXD+csQaJPRr0G5LZkOY9zaQWsC0/WQNoUMPVvflIMDb/zwmdOP7
	5x7FBzw30nMKIr/hRoPyRquSlvSrKwUhhFSY4j2nrDMD5DmiyaULUGKwth7v3BlJRg+gPhJb9My
	iCMCXuDlKqe81Z2liTVKmWUQJd/7LTDUs3jHzjMK2zaPPRTOXpZI6xZXbLOkjEwPoW2uCaRK6hy
	GRuxCN77U2kACxuL1aKoHFnC4+i3Mww3uVw==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr707315881cf.65.1767620050738;
        Mon, 05 Jan 2026 05:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjkllDicKUX9VQMpUuwOZohyZvcZc3Sco6Qs7v09u/svEypj1zueiG6vlATp619yW0479jww==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr707315331cf.65.1767620050252;
        Mon, 05 Jan 2026 05:34:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:44 +0100
Subject: [PATCH 06/11] cdx: Simplify with scoped for each OF child loop
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
Message-Id: <20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW727J4D1GLQTEFCgq5popKtB8fHsHipG20NOw
 7z8v0h748+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uwAKCRDBN2bmhouD
 13ZID/9xu3/z1GcnP/fuqu4umSBmakzQTGc8DuW+gIfzqb7Gxzh8CxMkYlfQpNvAoCYycruPEvm
 GJML8j4hYrwgMmBh3ewue+/gteRx4hOxY8jH9FcaBDWmanCk4BuDOa7siP9b6EUHPNnR+4dTppW
 DXVyaIvSvf9LYx4+EtVrCOhTAJlSjeItLFi622QVjfN96g+AU000wgNYtqmCjk80iXT3gLQfHR1
 JUVhEXtB5GQWMBeCliK5ZJOpcdHOVCtwwoiTXIFR2NeivDwy0jLt/C9WCSK+DR85oGhmrfBrVQT
 tInXNSuUDB99YTyg5PeUAdPYIs2+TGDYUHsG/ndluq7GBcij2t62nWH5SyvSsOyntrEQAjGfzDi
 06x9RjniTGa1+TA6SvqVmgBb4DRScfnZYz2MMu1NA+W7O2i1bH6HDbtXwh+BSzJ7IbcbPjG6U+C
 ZFKQlPvYvUm4pXyQ4ZCQzuYYaRG3RbbFC4TrrkC0sshupoWEcyVIEz24MaTMyqS2tNYjLlXFZV0
 y1xadk4qsAVMWwkS+k6Rbzx7pmClj/inj6npgzu8JIgPOVY+u48VcjOI8LYtbvs7kVA+35hKguO
 RZUWcDvabzrQ0gLOcftg5KUN6+ZhzN0HT9aOdPs1AnA8wU7Nld1rSagbCVv4iEw3rUF8io22J0w
 Ll+Nq5ST0Zad7VA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: bwBRJONhoJNd30X80guWazl5FZDssvK8
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bbdd4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bwBRJONhoJNd30X80guWazl5FZDssvK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX18upXiIkkZmq
 2M3NXV4GUwVSMOONt/KipSFgPxdZovaxfDjo3/OlzXtE+hzEOKstvfD/qdvJeXvtZ972yG/68te
 ao9ay6IRyqJZgTygLh2BLj6ubi2vhnI5/7+985cqBGgznslaJe6z7x/Y2pN3+Tri9I34ymcH6qZ
 xwO0yID6DgkPMUjzXNHn4s/DvSE+qMWMjB7UqtOYsjGFENUkkRJDDVjV01OFdI8Cd77SwJtCHsO
 a3qNSltENDeAlJ73IveJBxHcHO6oadBBCQFOt+Fa9jfpmlEb94jRTH4153x52G8m8lVsrYJmyOX
 GI4sYkldue/6pvuIN6eBZS71bbeBSHSZEdH+MW+HnoRYames+91TZTx7zHXbMM7CHIIayDC1Nck
 rffb8VAny99R1U9VAAA2sEtIjZWlxWK2em/bzbFZu0sX5g3q69P4XSdoGVrN4R8n2sOrUqA1rvv
 s2D3xm3XHbIyYk1qTlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
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
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0


