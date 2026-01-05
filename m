Return-Path: <linuxppc-dev+bounces-15266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7DCF3D5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:34:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFd62D62z2yFW;
	Tue, 06 Jan 2026 00:34:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620042;
	cv=none; b=brMw24eYtaff5YOYprHsJMHNn8gX5wad7aIGzLd2YvbBG9QhdLqM807r1l4I8ec/WLjue8+I4QXq6LwwbB2sZtkonQPtMVljU6on2zpkhL4og8PXRc9py7RVDMD4eVf06PEx1YjYFzRtNK3v6OOCZCzhFDyUrigRqYUdxUhKWH6m7OlzYIIW/CdZWNca3+7pr2JZYDuaFA4VgCukSZspY7cdvfTHy4v6128SJUTNZx9+Y8ttmrV/jRSBxi7VsB0r86Kp+3bM+hE74AMxPkXnVd0GCw+Fe8p3d4if8i7OO+DuB/peAA8ZLofzhuT8ZTdjQoJBbORe06XUs8hCrXxICA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620042; c=relaxed/relaxed;
	bh=QRm9jmTww7VVgDoLVcF8mMh0LdpCo6QQ7D5Go7eNjzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z68LA9JWKcFPIYmJYIpY0cSWudr/DQ1gwdveMp0e4K+YL3izgB6p7X7CHd+egXUPrwfSLd87LVD7x3HmtzzdcVkoliNbaAcY/x0JLWYezrevTEwrTDOvdD08+U2AITBYXdicYTvt9j0HP1xlsmE7L1Af6XJZ5Mh6xWhpYL7Zk+GZVp6I0e3YZTIetuqWtuPc35pt1uZmJr9pX47PTdKeMJXAF87lJK2ZSbMWN48Owr7w6ICO4v2iEK4tBYqvWwwoMPD6MwqN9PG8E12hb7laPikYObaz1MORRjXqTbYmw8xeziX5pKiWGDlpq1LodLviJFkRZjPvwWQ0X1sO/C/NpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HpwB7a+i; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYACVXvo; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HpwB7a+i;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYACVXvo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFd52DFjz2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:34:01 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60588TLt3796636
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRm9jmTww7VVgDoLVcF8mMh0LdpCo6QQ7D5Go7eNjzA=; b=HpwB7a+iAZkL1k4x
	s3UZKic6MXZgtLDFjUUvN17XE+8wQX3uis3IILFluMqIJjirnkjq9KUIyCrDGFwJ
	w+lCivFopT9AAdAfMRbbpNhmoCetqaXH/KJ113RKYAJBAjaqaK+DMplCm6ocFC78
	SWTD9FZoub1NQBMw3rH03kIrWNG/bMVph0VJG5G+Ed+z47cykYtc+nhPYbql4LEW
	HbbtwlIqGxwwngxqe5DqyzoemN/xIjvVpbCVhk4S+eL8qBZK5g/F5ON192UUgNo9
	dvfnUiYcZ3RKSWb1diDxToCjUUWq+UGvflV8+vdBsMK7dHF6lXIMKnttSTsuyagQ
	m+t1wQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4k84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:33:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f35f31000cso193782021cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620038; x=1768224838; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRm9jmTww7VVgDoLVcF8mMh0LdpCo6QQ7D5Go7eNjzA=;
        b=hYACVXvoTFWe1flPij7/59yCeG4H3t9gXrqsJI+ow6SUKQ4rwlUMHkGOE0HP7rGxs6
         ycaOXScc5lc44k5iPKpeyIIF6kKBwe2CgcklUmBhJZ4xGO+PjGIX1FyVOFx5lugodtea
         cf8nAvYnfCBDrTBoIyhaKPrp16TfqlTogONCWhz9QmcRN/MrhyJs7LrJUvf6S48I8H1g
         pz+tHKvcpNQhDLvhDqPSU2Vc8+qp6nGzCQ8HNpo4IJ03wMGSWmyFFi0X05Rsnd3EO0Xh
         /HfWYahpAubkphDWAWLNIATo7b/u1Bv/ywCetm/d8auWWzN8sUND49L0zfRnyeBzD+1u
         KOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620038; x=1768224838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRm9jmTww7VVgDoLVcF8mMh0LdpCo6QQ7D5Go7eNjzA=;
        b=fjKv1HILvGVUxqf0IRywNoEERW2MUP76aJ72OGiT0oEp+RGCE6aeTlpTerIQMEe9jj
         7i3A84z7O8H5tfxpS9TFWRZI8Xo0TAFquqCKXI7kYcHxwrQuC53AUkKGiTCQivyc9a8b
         2ePAvanTk+pDdbH5fSstYDNzVzNMwKKeOh2fhM5pkh4noEw+d8KMtSBqsfv0vpuCXCBn
         s01v3bMi3qFANUWlMZooxWycoHiLWWGU/2lidGk6f1RzU9FWYnZrX7e86BvpmFWMCTFf
         eLYMpCg31gylpQGI0HW7ksGe2Kid6tCTxYsIMKmYLvKJCVLTUSFfzQq7tJWPK1vmIf4r
         wsHw==
X-Forwarded-Encrypted: i=1; AJvYcCWsS4935Xpf/Y4B8Og/3lSj3t1HK5pzGLjuaamYMNXqFpt9rHR74btE1EGoiF7qD1lDVXLLztGPmHWITcs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yynecd4mGRpb47NdXCuolXKZa1gxdaIqw/rkrAmB5nf17RkGJc/
	FSNAJ/4Fzhz+fLJf+0rMnhWZPltzOwaVKCIvrE+jD01k3TV0kXRvl0zXXDexJ439cZRTvlw4jYN
	RXBY/otZzUvoLQIJAkWFF7UZU6MdyKjaBb5OB3S4+tWhQsKY/oe1npFFjyE2TYS7SERmz
X-Gm-Gg: AY/fxX64V20yfe9pq6o3bAwIwlIyG42YYtPINqHlS4+SKZLNTIOdxEaHk0WhD/+kzjw
	FHTEttaUn73VcCVSM+WId4c4meSc1S6hCs86NVf7EnFhFhfZeZQGwnznXccAc/B9L3P/zc+v7qv
	p9aTmx94+JoNZ0/VIuq6RvToZwd6KGgmivbKACCC9Bcl8+oEOKndl7BSnnD421JcrUwD0uaQy9+
	b8g+Ts3rA+Ce3P5AyBmxenNJOeR/8jJ+a+OsGQJL4uXUbgk9IXH3fCow3iTPRWcVKtNoIulOZXc
	/xmGjbBSSKUdWvNAWmShhajsXaINNXn7xBmteKFaAE1jkwtEi8TjEQ8aMID/G1HlbKC3DF15FDo
	J1ANngZ0Lo2CPLOXIWGLrEHEMC+IEnxXimQ==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr763072511cf.65.1767620037886;
        Mon, 05 Jan 2026 05:33:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXQkdFy+C8VMCsuzSjjG/gB7L6UA8wdH00hVPMYjUK2EJpc3FaxCWzsUTPLbxXtEYVpT4NdQ==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr763072071cf.65.1767620037276;
        Mon, 05 Jan 2026 05:33:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:33:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:39 +0100
Subject: [PATCH 01/11] of: Add for_each_compatible_node_scoped() helper
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
Message-Id: <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
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
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GAS9AEe5svij+iU9HSZ0g+GWVfBCriapq27kDniovIo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW722LmpKz6ga22yVNigaxc6TbG9MFhD0lOLYz
 7KcR095lKmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9tgAKCRDBN2bmhouD
 1838D/93vCXd+UZrPicCNSlGq0pDKnZ06PbiU5ryxUc4AR5JcGFQz041BCQ5MQfeOzIBlHThKzE
 akOLKKjAfTtHE+UfhdJzn2EXuHduDj3kbSkhi9/HR+pPEyZDcH7uHCn7mcIEtryrN5z6MzTzQkc
 /AxXVgKCr2N33F/AY4eVdpVPIiCYHk7Rcb7xs69cEeFgkNFFzC8scDEayJq8Ijy43NeBkiHHL89
 hpmE/KT4gu/Fkl8QUkxldwLMP9SqvbfDrXsTkt4BWiGM40zzIWe2P+xYjqs3ckIhVNIIX8gO0XS
 hnMNRXTxZHe17ZJgVclUuGVZEmoWoEH0iVxOiUS8RIN0E38lj6LFICvgQESkxmBzVRlJvHNnNFJ
 1rNigrMb/Xrx0MgSu8+VcKRKB5IVpemev7bAmGMuZFYzP/nfdKsFXDRpUzl9mJkV9nzAtqrmN/S
 VcV6jhBDOq18cIxjBk/hr/95kstkCb8jld23pYvf2ebPDIdlkFXVNBNOerNtZWBbmGBFLidmpUV
 CHm7AgPKg8LscfMZrKZyl6FNKScZw0YkO5RIz19HyBrq0Gh1nvdsccqFlRVa5rk6YoUNrMKy3pG
 ygYnP7LfU1nqPXDEBnkl0AQnb9Se8tdpGrNjNtbff/7bOGrGHVAIBvJSI06DriCEf2ZpHh2RtLj
 SeI2gkRt4EdtVBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: SN1uNkcHw9VfC2fQboWEpsI09CO5gLV9
X-Proofpoint-GUID: SN1uNkcHw9VfC2fQboWEpsI09CO5gLV9
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdc6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=fqHlcV494ISa_mgYehwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX41PIdC4/iJjk
 7wj5SdZYygKB9RlxT2mzsZNwTfhd6E07spEL8QvURj6WbL61/cWP0ML51leFPT09fL/sHuBs69u
 iv5UOG/tF8INmziVmNrYxslXXdOPuqme4uVJNsF12KwKrraoezHe4eC+k51dWOok+1rNA74da68
 6TNvHA4f25JmYgpYgwgf03RbsL8sNCGUcejvaARyJ/GXnap6i2dh5ZmN7JiW0VgYheHuyG7EEAk
 Bv2cAY1Rt8vDS/YYRfqZOXxZxPeIcubHpC8wxGM+r/w73zUiCw/PZdSY1q4Z78d9mc68dCPXKNj
 XvDnVK5hV+0do9T9XPPjXoBJkfPvEeS4msxnvzRLDiVivf0sC84DYseO8A8r17CfhyXwuzerXTs
 oePHxjf4UslX0g9FQr0u35zFISS/HryT02iD7GsXEaeglxrXMrTJcEUFAr2tMyKormPO1RwH4rn
 kqMzaXGG+FopCvZbURw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Just like looping through children and available children, add a scoped
helper for for_each_compatible_node() so error paths can drop
of_node_put() leading to simpler code.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Prerequisite for all further patches.
---
 .clang-format      | 1 +
 include/linux/of.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/.clang-format b/.clang-format
index c7060124a47a..1cc151e2adcc 100644
--- a/.clang-format
+++ b/.clang-format
@@ -259,6 +259,7 @@ ForEachMacros:
   - 'for_each_collection'
   - 'for_each_comp_order'
   - 'for_each_compatible_node'
+  - 'for_each_compatible_node_scoped'
   - 'for_each_component_dais'
   - 'for_each_component_dais_safe'
   - 'for_each_conduit'
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b4..be6ec4916adf 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1485,6 +1485,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 #define for_each_compatible_node(dn, type, compatible) \
 	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
 	     dn = of_find_compatible_node(dn, type, compatible))
+
+#define for_each_compatible_node_scoped(dn, type, compatible) \
+	for (struct device_node *dn __free(device_node) =		\
+	     of_find_compatible_node(NULL, type, compatible);		\
+	     dn;							\
+	     dn = of_find_compatible_node(dn, type, compatible))
+
 #define for_each_matching_node(dn, matches) \
 	for (dn = of_find_matching_node(NULL, matches); dn; \
 	     dn = of_find_matching_node(dn, matches))

-- 
2.51.0


