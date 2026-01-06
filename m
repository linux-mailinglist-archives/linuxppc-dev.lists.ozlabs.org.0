Return-Path: <linuxppc-dev+bounces-15310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4616CF772C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrs21Ntz2yvK;
	Tue, 06 Jan 2026 20:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690957;
	cv=none; b=CylxyKySjw6i/l8zkkA6i2U24ep3guJ7Z9US3/W5woFBxiUP4EsVFpg1ziIhlzoAuPi/eXz4y+u/H5jTLSpzoeBC5W3ifeWIgccewsKDr/gUvQHTlGKHR42NCliUrT46sqvuLPuRpa0QtFT8McZFXQ/7YxRhVBu9d7Y1sxNWu2AdR3ytJtIZ9Al4sNAjGlH3myHW3PnQ56GuHtc6u2KoEVSyLY73R5yEpjKG9qdcP0CT4gyrlTeKt+Kld1o1sclFL5gBc++TjD4ryVjURb2SLy1zqIt+D5kK01Fg2F9MZalkQtro6MzQipjpOiraKveOB0cCZpU76KD5kKp4gc4utQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690957; c=relaxed/relaxed;
	bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsOqZ+mWenB7/wSTREUaL+hlnUSZNFkY0SnhmzFmJyfB5K9ajVNv3jKX3EFKbMihIbr3if8XRD3DmfNDviZeNjPxEK7XtxBcT/5KVoaNIp2xY6NsFwQdj+FKfYsic2rvll+yUoZFJeFj37yltZwF/HdtBz4SE6gkkD/MJ2m5PmNYn7qFC9wyhGdIJnUv4KSdl9JR61H+6EFPUFHx7t9veoNLciSvvEjvjmYhRzVpGvKHcFzxipq8SuqeuAkpmgYKlNxBh++vbisYrH6PYBjQfUk9qYS9M6ZVka3e6/euIwGpMpHW0idD7Ca3nU8pZubS7HvONDhVPINk/w5pu5Pucg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=md12x/t1; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ID+24c19; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=md12x/t1;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ID+24c19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrr3MVWz2ytx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:56 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QUWu3073766
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=; b=md12x/t1PN6YwCIq
	knSl5/ZirmGXUDUYxz9rwecf2vzC6ok/22z68zzrnIRO8d3CfREkMk8AHsjtTe16
	fm5zOZONNblnsUA3A6ClL/YYd/dlprpBmcJQWGMdebMCQKOfTxnPsPkw1WGtUtEn
	25Cy/Y0WM+5PSNM7gOqHM/68nq+/Ahq2uNHHpvNYVu1yRi1kJgIvaRlzByGIHNhI
	yWXymJJwkAZabe4PzOq3sK70kSyL/F4Yy9O+j45NDXwN9lfQDycZBNPs5EnF4cIy
	F/ggKd8Oy7Wlmbl1q+GtGhAT4S9Ba4CuOcVn1uaeu3uLqAhiQoFQZfslJR94fe83
	AnkqrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7h8cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so20733491cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690953; x=1768295753; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
        b=ID+24c19BfzOKOab29w3xzlGJl76W4dib0hG0YGVCLkhXQqHxYgVpLAPgUu8PGNU07
         MJ5nQWDn5NugguFg5PwsegNa2q2dA6PttqxIefVpSBaUQiUQ3j76XNLqdjSaAGy2Uesq
         luGuOlJTeoI1j+QMTlvsiDF4KCsQEZtcqsqAoPp1XAnexz2rmpjaDb0nmO/6jHACnUuR
         WpZP8cFtG2oJ2621yBk85sSzrtKSZvh87eqwOPspvtCQibF/GyaGOU4dma/5Bp+Ler7h
         LdJGtQwLcbh0oiYhdqpJxnCvDG8zeQbAPF9NhW6BAxYAVTpbhwzUMYSwxiOHuuqRy9Ly
         x1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690953; x=1768295753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
        b=Z/uG0g/RM9RsFScNpSOK4QRp163Pl2BnmSQ6uIX7/JUgFqGCsBk7WvHEz3hh7l/70W
         T5zXmFxkNwQvx3zGn2fakvOo1balAdudOxvBINOvJfRAxcVfa/ihj45zq8kBD4S0bZEL
         e93eXVCtLlpanMoSjYJznD89KqedaJE7w8Qvmt6iTE7akWRr4pGMadyt8yW4KWODt1jG
         Qg+TC0zS/HfeXnpEZfYToD4jSwAGbS81HQ/96ptCyf1E/+EHGPhdkR19RUHuJAONgkAK
         p3KA2cOONWLKUaje2M1blstpo6tjK2bk44yD8hMyhsbQZ8f1/NRVd2ceQaSjD6ghJQiS
         kagw==
X-Forwarded-Encrypted: i=1; AJvYcCU0yQiVF9homQdH579YlJo0nzlIyAiWyLWfn8tojNdoWNOUIIYdIKjukqgyYNhlEYTEQixSFxbiGZcSvkg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbkMUaCe+16p5LWKVmm86zWuky6aBBddhYnihn+RsBW8g3/apj
	lK00DyHMGvy+8DEkbPZDxC+4RY/tDx1LAYX3i12wGmYRxUqwt/CQr35rV2ObyKbrskFs7YKhsis
	uqFWZH8S1z9gfvyZe6Y5C+Lz236ZuTSkbpvDWVW6bFXs8Gyv0mXwb/8w3txAdKF70dmEu
X-Gm-Gg: AY/fxX6pMDBjZmRPA76/bXfaW0m0nEbJWE+8g2yRFYt38UkuE0lcWqFznEM9lbs+X8h
	XQ5XkIH0gqoyBDJzHeiPTxREdME1tlYQUJITaY07lXr8PkVglO5Uk3YUWQIq9aMG8sY9DyTOVB5
	66ezqEPfDXPWYDTADpcNlXENv58YtAJ6uyQ7FtobbdKoz/ZK241xTKQsgUNZJ0ghOemsLeW38Nk
	jHkI9wMyjrf3y/ETyKOAC9cZNZs572669iQrRugC4QV2EeFarLe23H6dfX8PpxdUpRJzopbqDKP
	j6iVi53NyfSjCWsC96tnlDbCJib16m4izLfXbYMf7aNKA3i5m9jbRlidDWpRH+f77l58aWhJg+K
	t96okdhwLAjpaHjWjkIw7CFgk3Esoib4rjA==
X-Received: by 2002:a05:622a:1352:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4ffa77a96dbmr27455671cf.40.1767690953243;
        Tue, 06 Jan 2026 01:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+8LYz510+kg3a8iGMOOOC+oA8oVcMMGxgamtnTMDOaG+Cvx0GMuVV1Mcl3rlOA02I51oLgw==
X-Received: by 2002:a05:622a:1352:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4ffa77a96dbmr27455491cf.40.1767690952811;
        Tue, 06 Jan 2026 01:15:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:21 +0100
Subject: [PATCH v2 11/11] media: samsung: exynos4-is: Simplify with scoped
 for each OF child loop
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
Message-Id: <20260106-of-for-each-compatible-scoped-v2-11-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OVCWQJWSot2eG/7wK3qMzP+a9sG5lzn0vIz1M3MguJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKpAxidBL7lQwtLhuqODev8GHN8RC2HoZMf7
 bdsRs21x4mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqQAKCRDBN2bmhouD
 1w91D/0Q67fTH34HvAuxFNouYtVjUOjzwae5nuoLVKTUCyZ5NtaDt+Kt7GT+3EHjDDAq6Bm3lCd
 mktwbSzzfw9O8z1xPht/F3yzxfANcfUp3JvwOwNmccxd3X5XKYmfqYEXcnvpLXbv81MaT0h0DSR
 QEC7BCiUBIGF7I7usfi8AUMzbseiuYuRzQ9d3eD0YOL95Z6t0xbzEhdgQetdK//xWSdHK8fRBdM
 huIpYTKQZKy8Ke7fUvdK32hEZXrxBo/xvLK+2WuIFdMdeP5blnwsg3y0ooSQHEchB6FAdGQTEyP
 nhRn731UqnNBPfHVJCDz4QVavmcz1Yehq09UFl1TeKBJ/ZFYe2Kl5OT9k9n07Q7jzoAnKsI52Sw
 DLRdbLO06m1Nl2ltYduOTOm7WrAehvSE7y+LEv6aEj/nrlOZ+hTeKhu1Kl3M4z47e8dp8FqaBDP
 UNBEzOM5t16efbCp5/aMX4LOTYqxP4kTKmIjqYWmMwdmWR1yEc5Zg4qGKTKvxCzwMc9s3tyGvD2
 wQnmyp/rDvRwRLesC88p8kq0d+6KDbnMhOYU3DfOdPwowVCASXXheCLLfSHXKdYCfL8aVV7LcUf
 bd2oqkBXH3wTG3RIeXY/1HrkAy557dlcaZJQGT33UbdvAuEkJJ/r6ygKb78s9/lIWsR95FzwD8w
 jKKFHaH0UjoJaJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JClgAd9pWWGmazYicbYcIqgVgGYsFPn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXy9Row2GTDFGY
 myY4I+4Pd+laX8olEITkz+l+TOWMwp1TNda0BSzVgvAqITpo5ldHNrRtP/ztgHJJaJsFEaqZLvk
 R8QvDHQyyUXoKY2cLhnRq2rYiGfnJ4GF1ht09B9CrsCumrtdHYLqngrBkzQ3UHMEs57GUjrCIrE
 CbPHb1dqoxACftoWwFqZhdxopLGvpQ2cyaAx6kNeFqNUydaMZD7PeN42SBY2XXerK6gov3LIslX
 r+2lqalDmpW06Foh6wVmTP6r4aYRBbJ7ru+9EqvBYDytkB54zU1XYMqx/MzG12jMy6iawYAnOJe
 x8NvIXoXS1p3KSR6gpc6FalVgXSITbBeMNqsXu6nZ3g3zVOLtED2hK9sJdLMHsZMFNIfeUcTjDq
 8EGDP16540usq1ird4ZQ2Ky28vqtKarvwT6VLp/JIceUwP85/7YWNTwcK5T90iu8HimXOIE84m8
 h4iZu4K9wacjSsYPzeg==
X-Proofpoint-GUID: JClgAd9pWWGmazYicbYcIqgVgGYsFPn7
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695cd2ca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2mm1MoeH4kfNTzOWiPUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for_each_compatible_node_scoped() loop when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch and on:
https://lore.kernel.org/all/20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 14d84cc96831..b7d9bfedd590 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,21 +200,19 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
 	if (ret < 0)
 		return ret;
 
-	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
+	for_each_compatible_node_scoped(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
 		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
-			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(i2c_bus);
+			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM)
 				return ret;
-			}
+
 			index++;
 		}
 	}

-- 
2.51.0


