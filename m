Return-Path: <linuxppc-dev+bounces-15475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB20D0B70C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnzN3CTTz2yvM;
	Sat, 10 Jan 2026 03:58:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977920;
	cv=none; b=QPkjLjGJFB6dK4i2VAykBeaLTFGx3sW3XkUxyLa9eAW3m0Kupva4aQr1LSq16blQvoSlTBLVOP9opPl7YghETtBy4q8XEm7Ecmrh+q9T1Mt7xbbm75e6MDGMfn7BfBO4Xb6Yni1LYLq3Hy37BGtKNyEwjZ9KYmcg6U+0QdRuw16WvylwvsBEuzSOBlQbyRpRoyiZPEaczNlZaVHODIThO4YksrXjN8v6OyT8uRGlryTAT3i8Jz9Nj3XG+hxCLQQVbfQq2Ib71JD9B29wOyanhSZ5YarRd8BBrL13wuo0XoXFHp5D5DZg8tctNARosRIuaEu0z9M0XiQD7hcD8CGWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977920; c=relaxed/relaxed;
	bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jN8lf+kCwVVYihHXN5kElHLGnhDOuGyvFyLiEoOLCG2wzYZLBXHYT/FhmvLblLkPM9gWwDraKE08CBav9Ppgh3B2q4UPYpe/Me9L/4hI+3QwvS7xubkadqRGENw/D+aKqdosCPZ/tzT85TlsXXD/LChX+uCXW8ImT/KYQeV2wP5epXLPzCvBizdKeF6lGc0L6aLEYkb9Ma66KleuHbMBJjHtYuAK3r/RZuIQ7kXyF7eeUOLsWfVEytCAyWFmkm9N5SCadXhBZG5I0f3tnJ4puTnA+Wsd4YBfsN7GelCmwJgpliPzHZyvr3RXIea+bB3d6J9QFFYhqcIAIXZi597JPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dQn7M62x; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4G1rrfx; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dQn7M62x;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4G1rrfx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnzM4Q5kz2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:39 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DwmuW3141617
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=; b=dQn7M62xwk8e+vNJ
	km3ZDzKgeMpElhOQ7VlCfu1EkC3EZlWesVsRt8YvavaRiK2Oh4uehTIytdz2xppJ
	Iyy+s9spONZ9DYOyEkoY66e7PiFmlpU1CXUnddzZGY1RjfELy/UHuRFMAEJgsPgP
	P/EdQsCM4nKf/S4jDfkO57/Vs7hVo8Ntry6c+wnUBoLLSMk3UZHWj7HLBE+6SuRR
	wFtL4KLvVB9g+QdPfjeZnqGlwG9KjbUqB7yLq/oUimvXre2cvxIdBg7YO/Sn4FYa
	DU305n0KJGTQ4/sI9gSI8Qrio2VOpXIj0RT8i3A4YmYEvOeoBnJh/2J8lH9SK/J7
	DKuwrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3dat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb0ae16a63so513533185a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977917; x=1768582717; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
        b=P4G1rrfxOFeV3/wDtX6f7NCORvywTy0BUWtA7ZI0wF0xi2akFD/QyPLsZpyEJKScMl
         XMCI+q+8ZpDxyJUi/SFiaEcOnXv5QZnt+hIxDRo4KZzJMQ52F4KmQEUGyh5rULERM3mI
         raBfcAJEMsNKE55qyeXgEAcF0o/4XxTa8e5HowvfMKBzhVpxuMW7OEPew72uwhc+UoWg
         yh0uuxKzzJPXBC1yC3FMwgCmDA4IhcEIpIt9Y/kqFACOIxekH9ilpUEKsSIzWgMAdkK/
         cP1VUQ4TiOaT2uTwFCfNBAeymnXIyOQNYtfhS3UJJbidS/MCa3U/djfJt6Yj7ImryhhN
         wkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977917; x=1768582717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
        b=PPNNY6CQDmvPqt2NL2HnMZoULusmx/SCvE1mSG+489NaxF3Q8pAnxlhRHtF3hJyhbl
         erWOC6H1cR7CAFuRsw/ZmoOYGdqI+E03qIyvNpjcmsmu6LCLvshTR94zDS7r0W/RVH3E
         9grCAxFF1erCmzDpikTK1A8mxAQXH+SwF17D4cRT4GeWbrFm0Uyf8YQt8bhoTyvAn3Fk
         r/T7d8bdEzpCD/FZx4fs1MhlPSsDd8MLZynLOWadAEwo7b0sQldDy3u87eMxSe0p2lAK
         2AQ+GLGh/zHkZpaefDcUFDrt4ZMHAR0a2hhq5USiDBhCb/XW6TnYCvuuyTRfeRN7Hn/b
         vjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsEGBK7xtK7Kv7FHeqA4VPhf5NC0metmGAsXecBIOKAuvmA8bEJBjrdpSRdvlIzld7YRZauqwpZoV0Zhg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPHmQX2jdjcU2ID+HsVk6WuFPqCa0hBTbqsbaWyyDXFWbvwKkG
	xgnGKmakAjElphuSVpYJBE/RVF54W6jM0nlOyQ0b06erpIR9g7XzjHhZSNJzc5bXJ1+YBXfeC06
	ONNpUgt6G8dMUzXGEC5T6n9RBn9kxaHTsv/HXp2Fi7vnisyIGpPqRm+ZlNq+v7OtPUDGr
X-Gm-Gg: AY/fxX68+PRIijvPtZ9kBPqK5n2147KAqrPHuntJr8G8N3dlSKMsDzJID4TyPUwCOxg
	DPTMpVmIRYKbtpDHwLR7EwNP8ybjbPOoViQlJocE/iUn2SpFQ8WYFUdkr7VnLR/arSk1eIhe31b
	ZeAX92wCXiRI+EhakUFvIVoKzwtPQIDassLWlPakSJiCe8kH/lFc8x+Ux+4BA73XnWsNRCZMv4M
	BVksS9Sn14Dux3QS9Y4TsLQkz0sWcz09Bhn37brbnG6T8T9ThKr/+KTN+jkX05SJOYhKwUMcULs
	DYRO7dDorJG8Qp5UEW1dtW5NRJBZoodTedMdSsl9kuAJYsDzTN9bPI8NmBRrxQtIDss4ISDnJMd
	+Thmm/ZGiFqtcJo9TrmnryCNeFQVGxH3gXw==
X-Received: by 2002:a05:620a:31a5:b0:8b2:dd7b:cc9a with SMTP id af79cd13be357-8c389356fa4mr1505593985a.15.1767977916539;
        Fri, 09 Jan 2026 08:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd4P+5i2nj0W/9D5U3nva30jkEMvCOqGEW0JV4KjhLClEVL20MybHymtF7r1Ior1sMlVhTjg==
X-Received: by 2002:a05:620a:31a5:b0:8b2:dd7b:cc9a with SMTP id af79cd13be357-8c389356fa4mr1505586785a.15.1767977915936;
        Fri, 09 Jan 2026 08:58:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:55 +0100
Subject: [PATCH v3 11/12] cpufreq: s5pv210: Simplify with scoped for each
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
Message-Id: <20260109-of-for-each-compatible-scoped-v3-11-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZI+U3HmKVnYXK5v86o6BF2VX3RPpNT6lnizYwOme37Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOaHPCFJwqx8kUNMe9/c9hODDZ118FgBLWzN
 4NPPXItbLKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmgAKCRDBN2bmhouD
 1x5UD/wIUofhuCPuz6KtYqBTpPHzfpb3k9H0kKP02mFOxVsmacf2tW4ugehZIzMEOAFrRCg69/T
 bpBYb5nzmtE4qoUsuEWplgSxGZTDB4Gdn95AMnaweOKPn1iS5Jxq2nTOllLZgk2GBhZMfLBaN6A
 UP6JIiWtRHck6Z0zeI+y0dYY85j8pPkIe1eGxLXOkEt1OH+w2XfpLcyND7AS3ebn5EKQkhRDuuM
 UNbnryClXYpJvCWN14v7GeJWGOEIoiYuPA/IHFDR1QXJktpvcrarhz/RV7XX7vQRn6bpMcoz7Ns
 oUmEU8RZxVnKJgQnbFVSo3O19t66Gat5ptNkHsCHSlgctdvYmdbbA8089qF0bUcJt1fhSfH/nrg
 PFf0GrMkkU9gKyQkya+XtRumPmR5ILU4hlSzr08U7zvVsXbXDFzrQQD/wYiNCsqboDFYRd1yMCN
 nI2rfHPDynmX9I5crfgivb5TocSSs/z3DOfFipO2C0BKy677q/yqv32s/HMLZsQ+pQ0kiQbXDPQ
 i0WZFOEyvAtB5Omv0zwdgjtz/+91q+VEPF/stD3F/vxR+WlKR6Qik32yBohmUgP49IXOIckAC6I
 Kck558AnhkygKMsybi2gIqSFH+tTfYSY0MLZZeTK8SiqwkkLj/jWtG0+kInNZiIbvNyDmPpOUIl
 Hv88Jx2/oaTAUSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX6m4SM1GLs0IK
 pLrKgUDisTgId9XrcTmlYNw8uGVLD6yrffJqnBvr5hrw6DJ0qtnLXmTUughxFbRBrBa5AH8LDl1
 +pI/nrrFMnHt0Td4dZaPGzEesbDy1kbNq4Pw+GJvuGpvBRpAC1qvkl4zTwD01b29USkxG4s23gA
 76iv2zLWdYRUV8Gb3bM7cC7l/NN1fTHyn3TzEHTGBXeDCJ1MptpWmqMxJOVbcksKQ7MzmMFbJWC
 3guMYy80fAm6+OpXtARRCi0ewcOi1exd9wK6+nMtdi10sevtDqwMgYn/rlS5CGtYep84SahvzI5
 vXOO/VcWqICIXBnxitkUQpN9DHuKg4eeSxUOCOM7pxb+v7COtSFjD8UVAAOigOCaumRg/7npBRQ
 WPLgKRitzDYweEK+U0gPHDiz6ARvlRPzGeWOHEzUEhmx663bzODwJ76tG8hIcqcaKh8KnMSyvct
 dkp+hZY+gAZ2gmaXPnQ==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=8YWg2ve-cigzn2S1SOoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: x_EIFuq-OIG_dpbm7Ctaj7igm9ReArK_
X-Proofpoint-ORIG-GUID: x_EIFuq-OIG_dpbm7Ctaj7igm9ReArK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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


