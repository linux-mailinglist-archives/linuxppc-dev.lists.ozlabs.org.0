Return-Path: <linuxppc-dev+bounces-15465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE4D0B6C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnys5lL9z2yHD;
	Sat, 10 Jan 2026 03:58:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977893;
	cv=none; b=AVbI0ASKtK9aqKxXD3irmIzCCYMVtUcEo/VRufO0RCwMxE1xvObViLDmcfTHx1/11dh213Kaj2JSgeplmXhht/E0Bf9TzqN5gINc1QSMGuePqwc3McYLtcgHnhVylSLHudjj2JkGnE0GeDZ4LM0kLLVj/HQ74Cs3ZYG4xjfP/bgeT6fnH8+D+nfDrzq5f8gvoOZaddqXB4BK2Vpedkw9SbdiJfX0/pDIfytGkkQtMeBsDBIk0Rq9YHtdjQ3w1rnyS1ewd9D3ASsEAvYGzDygxqAjaQqIA5fdhqsqOGqevFE4yTKMWlWkX/crrJA7HK+454gkQ87JNdWatAbkIaX0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977893; c=relaxed/relaxed;
	bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzUcis+V5imvCGqLyFO7/Km8MUc2173+iOUsfmssGOze83HyoMlCvzT69VsULbIvlzUOc/2YwUJzUyJMENl+IrLFk4qV9c/6a9uhhkX5o0PPfXOXJ8Q6lkKh3diII3nSXa6W9r2GVeoDu3wgh7VQJ36VO8JBLG6NfSFSHPp6hSF6f0x1NThTZkRld5tbTN0EdsGStMayD47HdhIPdAbZDum5jpefYs2qXNjwAaJagr0mfkxaQVvlJeWcvc4w7smakZ6w2L9X1Vyl7NzIg1dy8We1SLG9ujF2exd4mx1oj2ZikSfbrKqtC3qMB1l80qVaHq7vSfuausBRRvYrxTfFnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/T1wnZq; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a9bMZ4+G; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/T1wnZq;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a9bMZ4+G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnyr6jnLz2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:12 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099Xhbt1048228
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=; b=T/T1wnZqVNpxiZp5
	hD+LFonCaQQAFUllDlTuU68BvCYFxaJ+DKJcdJ0VdJjZ9V0EulEXir1pbSlxoTQc
	PAK0TPhlKXzOONBBjHcXOGB2fazcViaO9itphbnlLfDKHxUaD9Ok79bMH2dmz1l9
	fsmIO/JUYI1gvZR4E6lWUN/TALDirKH6zoTGvKi47pvt7i6vF/3JdK/GNjXkpidC
	kSc8hpHnDBQL2GjIMYUHGIPZ6TND8NTY3H5W/MfPJP2uxhT6gmjXEy9ueF5U+8Wb
	SlBU8BfQ+tfnSnrMASPNhDP8b8FyMfvqGfp3KRNJSkEPmMFSMfladaeu1M0KS+nX
	dZXMNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b9787-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2de6600c0so1126099385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977890; x=1768582690; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
        b=a9bMZ4+G4yaNCrcFYhouubv3WvRACS1cZwIki0ruOPEy2RP0r4hWoZ+odjEC1d3mBf
         sw6v50a/FpLjqIvhdiR8LpSG8l71cz+b02Et4SYRxtDFFiRk+XIcCJBkUTgQ8mD4XsHl
         FOr7RUoMSKHUu12ZRR535GPbAG58UYCd2wnVKn2Dvu5AlmAbwSMmuSt25RMy4i7OCNh+
         TwPM2xVFpPn4kyhf9/Bgu8Pa/iruvwPBmbbe9BoZpcE7OTKkYEY/gGZhhX5evPRcQSSy
         Ag2w28IfmxV0oussrTqofDGAXs1+2N/urh+sf5ZIP0U/B7e8a6pSGgFxtQeSjtkHRN9W
         jN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977890; x=1768582690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
        b=j+aUjDP9EVVOqjDTX1PTjTJGtvVGqOyIVsXTbHlvEQwJjMGcs0TREHi7CII/ulNXsx
         m9uHN+lXTznysGPwFFqI7YZqrc9dBsHIVAUOaKn52C/1TdDiMDWeYlv+dUyeEd8dlMnr
         4VstYcRsOwo81/5auPfExHtHXMOjmr0BnKNakkmGAuNg6qV3H+id0dgX4IWFotUjVu3k
         djjUS5ohPLtqrt4tmG0ETOtPhD7rbYlGs4mJQO1hST+xRLIEougzkgCJRSsKTP8jiynR
         zq+7QTgRuBXgh9EcZ8pUQxVtcKbAedQkpH6KKWJpXRR9englH7Y/LliGUFxH6f401UHG
         VaJg==
X-Forwarded-Encrypted: i=1; AJvYcCWUcV5Rg949Aa0XIirw7RIdXEZNAOzcNGrM9FuEgXeyKsG0U8uf9rhqyZOssBmEfNrRXNOhpLkCWda9qyY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwesplfgXPLXJZEltg+CAMYE/yfBUgbiqW6BSXPwIjsOr9Lvwne
	A/voQ1aBvgN+XZmPcC/oI0CNTXYWdKtYwpFu7rWAnTGhFrUMMnxeyVzkRC2k7LFu8xK+Z1g4bn6
	HvY/DdIgRZoxPFWGwtPqrHa73PtvxpO3LRn2jxK1zxhlU1P89AV89Fa1UAo/9HdqkmYTw
X-Gm-Gg: AY/fxX4wVxcTwbR8R2e2zftLaV3bxf1t+WgWyMwMIx190sHCk+W5N1FLTll/1ycgkbO
	C0GDylf69LhNrut4hAR+yANTzyXqkgTnmcMfJmw8hSA1ZHLhTHv4/q8XsImr/xvwGMtG5RrCbVx
	qI9juHJqgqBhS+stNy6B/LO++KCEDZd9F2FOec6sqU7AUV+CUUD8igFyWb35jTE6ohhv5lKXN0x
	nBwnHTh0ZTQHZ1GuC+NU2NmttClilIY9II4OLAG3HUzNRf7F6J5VCuYoxHJpp+cKqXmQGQJNG+e
	Z6GudHZ3ofUYiYMlE/fb82RgE6RAuhSQuyroqqtnmZLspl/0UrmLQ5kaGxZ0dlD/mE5XytH540o
	7jIM2yXwVLoMPwkwBdokPiLII+UFTkYqV4w==
X-Received: by 2002:a05:620a:450d:b0:8c0:d16b:b09c with SMTP id af79cd13be357-8c3893f2882mr1251307585a.58.1767977889677;
        Fri, 09 Jan 2026 08:58:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfygeLKT4WxsJq2f59hRzHmtCZgHcvEaJnVArr1Jk26l50+rbiaa9DJq621bHoEVLD5i4iPg==
X-Received: by 2002:a05:620a:450d:b0:8c0:d16b:b09c with SMTP id af79cd13be357-8c3893f2882mr1251301585a.58.1767977889107;
        Fri, 09 Jan 2026 08:58:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:45 +0100
Subject: [PATCH v3 01/12] of: Add for_each_compatible_node_scoped() helper
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
Message-Id: <20260109-of-for-each-compatible-scoped-v3-1-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/vmRDAbY7uS1UoozvlR9f7hg8o56xUtijAL2sU3FXNw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTORfxtpTacTz6ZE5ouIOsI5kOFpz+cbr7zLD
 7GEBv5R2FiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkQAKCRDBN2bmhouD
 1/R9D/9awDSv9Skzn4Os8FgAZhOeF+IX6AxHTJvFa9IvTukIrYSoGBHRYpZ0E0boMZR+6wG+f3C
 TiIx/LQwD6zud4Q0JtXfs0AQ3WWBZBsmnclpVFTDzdqwnl0YEf+OI2xR2Q1eFsI+Kb61KWrRScQ
 7wD49DB6MdqQvzephOQSNS3tNRncHz22nL0/3YGj5I+JWwXp0CkH3jPFC12GoP2v9F7X5QYxnot
 rQpzcblFkV75PdYWX8Sm3qHfCSF3YNxO2twZNCEQmGIE3LKR5J91J6IgCfecO1mAVLVnIxKzz1S
 6znhWZcLim5uKCoXLjLVdEg3Fn41FkgH4E5iyn5QWGc6iV5Ghoy21ydJcsBc/6zS+ezS3zdsjaA
 d8TqL/6osDfqfRNQu1Pp+2/vaU/0gT6BYIwd+Dt/Mcmw6avWhUBZH1Z/kKepP92Y0W6JHFAOKbD
 4wC/PrnocUb4wMm+Q4Li5a+RA13hbJcI0/M7D9j8stwiBur/XhRU/QdQP5FEk5n2qi1FlsUd+ip
 NuqryOarJ+okJFf4pu7X8dAbBtYX1jeUBGbVSnoNZqFMTSfSZrjT9RC3S6zyMR2ZQiCgYwDvP7K
 57ueeO+ZSE0gHgCjXlATjeQqeniZpoq4FfRTULcgQ3P3FgdBSDAuLeegLPBdSmHFtWDgscg6Xcs
 Q/QoA7qPzEiiMxg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: kNTR-Io-KWf1HmEv5qc8k_u3tuZBIXkx
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696133a2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=onCjdZOYdOMVgCgPd3IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX7azbIP2HaS6V
 ft7681msRdkmxbSJtGL1EiREnjRdRVJMtG0ti7cIG5OP+RlN6D4D+/LVYVhPFEGFQjcMb3gWjzl
 o/VNvXJdGToDBasW0yauPh/Ii/xP72W3SJaAeqYqFGoa/oGpAJPeArp5fWXpfP4LcfvThh4mKHW
 cP+9R2AnfLywRDYn9c7+iHlGlgxpo6HILa97vjVVpOWTmAlrKE9BYUveP5cfd16AxkLsHeLtM1B
 hDRNyKaygHqVUYw8sfAdW/d6E+sBGAKFY5uwIZLNycnhLtlsZ9LXMjvDNVPQmG2/n0RaFoRBPPZ
 D41Whx/RmCKip5aXNF3VQhO9HNr9AiCTqNVMUJLUUXOw/FpjNEQTag36dcI3DoWdTOef8uPDUKp
 rsMTMd3h+Bo7L38uqJPViUNiPWI+mtuTpHT+K1ZthkzzKZzT1Uw7ijpQTKl6VrwIRbN4YKvo+D6
 gE1jrrP3+n0O5S/I4IA==
X-Proofpoint-GUID: kNTR-Io-KWf1HmEv5qc8k_u3tuZBIXkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Just like looping through children and available children, add a scoped
helper for for_each_compatible_node() so error paths can drop
of_node_put() leading to simpler code.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Prerequisite for all further patches.
---
 .clang-format                      | 1 +
 include/linux/of.h                 | 7 +++++++
 scripts/dtc/dt-extract-compatibles | 1 +
 3 files changed, 9 insertions(+)

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
diff --git a/scripts/dtc/dt-extract-compatibles b/scripts/dtc/dt-extract-compatibles
index 6570efabaa64..87999d707390 100755
--- a/scripts/dtc/dt-extract-compatibles
+++ b/scripts/dtc/dt-extract-compatibles
@@ -72,6 +72,7 @@ def parse_compatibles(file, compat_ignore_list):
 		compat_list += parse_of_functions(data, "_is_compatible")
 		compat_list += parse_of_functions(data, "of_find_compatible_node")
 		compat_list += parse_of_functions(data, "for_each_compatible_node")
+		compat_list += parse_of_functions(data, "for_each_compatible_node_scoped")
 		compat_list += parse_of_functions(data, "of_get_compatible_child")
 
 	return compat_list

-- 
2.51.0


