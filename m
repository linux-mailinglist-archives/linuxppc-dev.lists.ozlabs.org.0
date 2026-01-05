Return-Path: <linuxppc-dev+bounces-15267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E0CF3D61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:34:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFd62RSdz2yHD;
	Tue, 06 Jan 2026 00:34:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620042;
	cv=none; b=inXutcowlpZAwHWSOMKw2roJI0imCzkfVp6x77GS97lmAdoeYGwFbg0DAeqNoAIozlKTi5aqOFySJ2f5ma/12gmihWhPmIsNV9j3NUucN4iDmyHN9vauBx2LlwBkmyVPpCVCumgV1dLoFUyxEKeBnUhNzTlK90JIjc2cJWCW5X/HrvGPNy9QFAQPOLIoediWcscqX427jL+O4o6CdEg+4pTyh6YF/3n48fWQCxdFkPK3MPlex5HQp6y5Ha/YYwEGF1Bzh2bkgAPqDWxMNyqhgDoEV0nx1RfXy/za6XlAqvUuZZdppWY3JUXgcZYy2KI5qU/cXkyNGlpBMjgEBtiZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620042; c=relaxed/relaxed;
	bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VY/FBEfjjCQa/rNxB6Br+9jC3Xg0dIL9uTT9Dko9rC819oEAc7ofATb9MyTVtmycElQtsguzOArsSxkAji1GKfFSd4hKtL15mH0GeE/Js4mnnZi/zXND3QIsRnYp031f5x+qzFgsYiAtoMYxdoGSiIfMO0ZoX7CoW0YXfEpG0B+cIQ/yL+p0l4xBOmwJu5M+CZO2cN4xdpj3MEf9Gux58rGg/qn32a0JrZXTUxCthuJliQ0TW1KX3GcOYsAwpjKnUUM1ONrXiCP5ZBwxgaNELZItGQPqG0F8jkLKyfGmAYqgLRAhzvrfOQkGihipikTu41d56jyPgbHrmL5XjNA25g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIb4tc2o; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtwFISZX; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIb4tc2o;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtwFISZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFd46LdRz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:33:59 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KIjb1206487
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eBLWi/Kbuhx9TqF7mhxf1H
	8jWhbGxH4EXAW6f0Ac6FE=; b=MIb4tc2omLHC+vOEDy0doL7yPHZHY3nhgmuou4
	tYf+C7eylsOinYlUZQnPWRjlT4buir1bjJnhXin1wqH5aHgV88H5mYY8r8dv72xP
	q/F8xrIpvv8VwuMU0MtOQ7cGLH5qZ0qtXt55KUUW1lGFeqthcRgPUZfMMOwJWF3X
	rXJ0Bz8xQSaTbbDEEvB1oaxjA20tmKa2910eoYv53t1kCjospC0LPgy2U9e4kZCL
	OVzWgnhkwPtXTXcGKLui980aI6cvSzj8E0XktjoMwI5OiJQrm16siZNsBan9ekBk
	DQ1R0+DI7W+cR5JNb3nZffJHN82h/WNKN4SRT/AQKXKJKHoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hcj06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:33:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso574511551cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620035; x=1768224835; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
        b=UtwFISZXp77i+uiZwFB2OdzAPB5OMidy6UpzjdlFuyNNyMILkWExhxkOhG+bJ3YUSu
         c1D7KXTpaD/l2G4SZjJl7uJAqfG+OQ/iBQA3AlDV+LyM6itAq8jz1sdR2++9j8ToTIQl
         TEYxW9QIDfRqXpUyNOpCeqkG72BASfrHikjWlZTkZUKz6wuQW1vupaCEqZ+4x8Hz5TTb
         C8ZMUFZB7WzUfjoYPylabEkW5Z4DovcKS+elBl8M4p4uSE58+z22YYvnj8+umK4r0eAs
         TubHasDe/cXJkiFujA9MT3BcB74V1GToo7XN2QdZIvnWrf9Z8Ie/Uir/54yItKQsjSMv
         YWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620035; x=1768224835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
        b=t+oQhyp8t+5ney5pkwdmbTfFgPVAonWK27D8dG7Eh7WI+1BmoRk4CUyLZ9JwbIANhu
         yUlA2p7gJddNN5KloyAocB/R86uArPYMcG/sXP0iHFDbU8lKAUs07gobHw2Zmbb/tTIt
         u2Ifpp4dWvgS6aKVmgRvE0Y8nFRpdAuth5QkHXVCOzwJc0tEY5t3HJrwBdkdyJVENfJ7
         ykuvsfNI+WrmGhwftRJAsU2jstQ0UAGrCELMQiBzEGTMZER8DPneiHT6wVJyBmwlJHqm
         OzRiz2qPf+NhafleGHJjsnSs4CfSjZMHH4CE8KYt4JRmdmsG06/2ISj9Jr8u0ypeFN3u
         WdNg==
X-Forwarded-Encrypted: i=1; AJvYcCUgpi4AMedYPcGdjLWVRTwC6cMZQdqLyaUp25fst5GxCNsF/qwPvN3Z7TZiajShLUjeDNzT5LxVAntUgpI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRv7QqhWxRvuFdV5Mro886vm0Izo6GoV5REIpcNkXwtdqxsgNa
	rSkHXnRWK+RJMZXVSIo1iYLYiR1clh1aITqqE8vNKjdOaE7PecrD+DIvt/KZAxfVEPVBZFZdz5P
	JfT609kBm6xY51Z8ZTHdz0acpd0DO1jjHtpy0GxtyehwjJliKJx6v4UXfZuGqcXNllAIQ
X-Gm-Gg: AY/fxX5e0WkNLpBGp3B0W0b8W5Je8XlYXzyTWoDZnnrsNGYJx98eF+TLld+ZQoL1Ot5
	MGTCBOvB/QqclLM69dnIbCNyi2BhjaggExRBcGjHPQf7FpnOZeAq2Z3K2hstAoGt3kLutJEjQsI
	7YJJjr/3RG0cQhjwU3oLFaFpExgduYpWCcU1sl337xmJjxtDGCpAn9K9G7t018mbwlXXR/lJFJB
	tHxzDzOsXVu0lb50tyJxgn8NMi/kBsh5WwBscUNdE67zw2/7Vq3IS9aBeN05hxbPq6HCZ2sAeL9
	A1dbTb2AMKM9ubRb9RuhtGREiFjMqJ//ItJOOH+VMYhkyxhZF8vzgD2Sfce8n8uijYdvdkzWQ69
	zbP6HeK0mM9n11EeYdzVl8yHfS1wQOKQVcw==
X-Received: by 2002:ac8:6f0d:0:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4f4abcb8d23mr696751861cf.15.1767620035334;
        Mon, 05 Jan 2026 05:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJyENY1AnKxxs/GvCTILXx+88Wewnlpw6vtBkZZehwqeQb52jMZGVzw5b/PZHtR1M+E/dfEA==
X-Received: by 2002:ac8:6f0d:0:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4f4abcb8d23mr696751151cf.15.1767620034778;
        Mon, 05 Jan 2026 05:33:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:33:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Mon, 05 Jan 2026 14:33:38 +0100
Message-Id: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALK9W2kC/x3MSwqDMBAA0KvIrB2IkUjpVcRFPhMz0GZCIiKId
 2/o8m3eDY0qU4P3cEOlkxtL7pjGAXyyeSfk0A1a6UVNyqBEjFKRrE/o5Vvswe5D2LwUCqhfxs3
 BBavNDP0olSJf/3/dnucHfr4aQG8AAAA=
X-Change-ID: 20260105-of-for-each-compatible-scoped-285b3dbda253
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LOzUYd+dRmkv3oMmU7xQB3tIB1OpRm86ei1dR0EieQM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7212LDD9aWpmO2pXajLqrMXSfYpdw8+/wsif
 01n3q4kghCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9tQAKCRDBN2bmhouD
 1/fJD/9T1pJUb2ZATSYxfBTsBulhDfg4M2cKxMAn3j5J2ZUJ0IpQxNIT0HTjj1huRozwEiSTEz8
 jbTVcl4uwbM2MppZBpdsT7l0qa2DcDLLsicU2afLE40cOYHueRcPJ0yCOWOeVopVIZ0ooCjHwMQ
 IFQhnUiEIOjtB0CNSBe7uYU/43VB4uovE1YiNWZHBHuRQYShbjHtDQObKlx0H0wW+jxBmZLbjnZ
 uQNYKHFL5PGqilIwKhBt9yWAWSSse5KGau0nb9iBuI/OJCNaEEoGmv9ozbm/jkvLQ7tFZA5BTBR
 d13IEKUNKAbdek4MPdbypLIp8yag7xIgPxRGSnLnmHIS2+vtASaXW+CqNg2GdYAq0jQjo9PAeyh
 rS/S5zJ30SOZxVJTNuJC7lTcBOLv379N2H6pvnRejAzj690y8b+uJRDSMHpLeqqKZ/VoZgutyP6
 ZJqJy4SMwUqO+G0EuIFfAFXgxMF3NyEJ4XMZu6rTRncQxM8TbfHJiof8isywUEkxs/iCcDvlSXs
 2Dejv85c5Kqs93S9INZGOwQrv9mQp2rfKM4GC+VOT279jb/n4qFaJcOW6iiW/ipRYmtPvDgBqJA
 trjLF6akNFp8akjaJCMwOEw6cZOkvAqoK2RTjO5BkrsLl5ZmYP20XaNI237J0dPJhrDpUIm61s6
 10hjLcSwFVNVocw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXx5zZBM2ugJSm
 SjnbmMg4Swf8MvqKmfM5bI/rG55PY1+KJN04lqE+3ZnDeCOhm/auTJkxijk7+bY5kV2qRnMoN8a
 ErehPXyVZwottOT4PWQ4UNJTKtSy9WBLuJeNPhhyaQWnKzYiiXVEgOGz3Ebp1f6biDDPOq7ibcW
 0Kia/NMbsKpcBub2f9AUdkWUbBrIFxfoR5gE0I3wPatUhbqyM6NK967//JrCSyJQcb31SC/6jiH
 giAiLx0yGbqPTBMWGS6A10Qizm6cP7UicSacv9Ykw3ZZElxrQZezVx7sQm+eEfK2jijxLkK8uUg
 Dzc0/n2fjos5e50LFcpUzeTNTTyKI+V5Azkd6vbfBxI+KBuq0W+IE7+W4iAsUuXs6UxclcNyl5B
 Nz//+IszWtznTOeP8KZpytwooud8VWgde2K2Y7tw/W7yb9YC9KCteRLxocWNGfsgQ3BDHm4KeTw
 TEpEeFmIjFK1sQC5iTA==
X-Proofpoint-GUID: oaajlONTv2k96cVtKEtkxi2Apx-0BwY8
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bbdc4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d9g9ln5aRjr3gUnP3tUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oaajlONTv2k96cVtKEtkxi2Apx-0BwY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   |  4 +---
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 12 files changed, 27 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


