Return-Path: <linuxppc-dev+bounces-15274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07438CF3D88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:35:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFdR3Ml1z2ytj;
	Tue, 06 Jan 2026 00:34:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620059;
	cv=none; b=HXNvSY8qSTdIUuZMFIKtP/9l9yUlJEDTHgaK+t7UAx3BkyKmWqVb7MBlsawBtWjHPBezDVMYk0Gmc6QjZCLo++peXQfn1kt40ZEPGgSWrAbo/Xiid/zPEjbtyGvin2fftr9y4fn+VYvZ24mYmgb7x2xcA5JcCKPeBuJjj6bJrG0oU6YYKCOXejdJ+I7KkQLGZ7CgDT0Ab9ZNqBYOfNCw7WZi5Bby+KVnvtI4ul07mQHJvhNKhmdfSEAVAd27DwIOHzhVts1/4a3XYamHrNTeF7ib6jI101lGzhQ25sXd7QxKZdrYgbbxQfvZF4xQ+741KO3uWct+blq54+4p+417dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620059; c=relaxed/relaxed;
	bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0lcDp/3K75uEBaGJnwjT1Gc4UNb9Ej9NGChLUFrFLhQrVhkhildo8ceLazLrZp/HBumTtF5hcExPKQUjhYJMtbOnN3xAguNsP5lgd7K9nfkrSVneTCQjuZXx/8MZte8CJY3PfaMRAXpwiKbQho6zKhooKf5sFk1pSqp3vwShrTfLsqsn0PkHrPxv45IqG0VzjaZf7fidYyu7/0YwLuACTTYfMmXwlEy4mGwCKlVH6ERAqPv29rdMw04iBbBKWsVCTrhixIMkLv5HHaGOpvh5t+6Yy5xqJT+rowMEKxAkRd2H4pWjtAIm1WueyXqK3Lz+TTpwy7XvJ/q6MBoFOiSaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kTN5IPmH; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nm69xx2t; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kTN5IPmH;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nm69xx2t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFdQ689rz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:34:18 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KtdH3798232
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=; b=kTN5IPmHWAYwIMY6
	bTLm2FRvrzsWg0872uWjazo7CtUOthJGNScCOTLOWLSf6G7Xgbu68N72t5VmBtj8
	V1vy6UXeIQ0QcTmZ9mLevu5YGYBvojNHO8KM4IXlI5UqJ9axXuAP9wjiLzoUrRwG
	55sfv3mDCLAJYwKE7B20HFLQa9Ri0ZNQClVaA3MJ3WNngbl7yK7cZKQfIyxnj81n
	ggNcNLySHHq7qb17OzIvJo3zg6wg8sHNiClltJc/kYgue1GRnG2zYnbKO27Fdbub
	DAFZEg0Pt0XNzX8FPlx55KdHXpmPCiTaq5+p1Kk6wwMq8ZlJSBp+7iKz/Hv1Rbmk
	joMj9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4kbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:34:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso381978261cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620056; x=1768224856; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=Nm69xx2tPouD+J/cmzUPpP0UOJnDOp6G5lD/R507Qtid2Lgjqrk2s4loFaD8QCV7Hy
         CxMO3DjJcL2eFQwAG6q7aq+tAvpJW1KoTZUf7FpyMAFfArdRttGcsmuYfgisKCcewM7z
         7HjYS2Hfcb/1W6qAZ9W59QzappcF2JKonq6Npm2mpgLYWd+dPISB+sOlWUzfLtK623c7
         EUTogGQ0iB9XpYRvDDR4tahnbdo1Rj3xsvMd01d4DXW2VllZBgvFg2dkGbfA5XNpeZKp
         gLxrtWNVhJGoqX6QzwJOhtqr5JFJZD53Uhmh70HzKZXhp9yW/TgnHoolNmhc6F8um8v3
         OzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620056; x=1768224856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=MXQSVk9Dzx7ZoGdYh1K0vICy4K5WZV6Z3mgzLE+KToiAvRAryyFYN45f3ek9R8vvtL
         u49AFq6CcExCSizHSYLL7oi82p1ERZbGBeuD3kck1qwEvUe5cMyUuDSUSIkAOQOOafB3
         B1LSHe3FO6PC0fWR0upfqW3Lkuro4plmMTWVoRBDShu1EqGFf3Lq421T9e8QR90bVzUS
         IXBDY/cR15NltLvTzKwzsP1Xi2KqMSL1ZUa9maJOSwhHbBKZ8Ovb6qBYyjq9qc7Gd63e
         d8JRLaIG89c3WEJ410AJzbrWvL3W1YoD+x0IqLnN+FldTzTHsGkYTO9ZrzgF0aVEjyue
         C9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUExiVQEtOD9tOpK44ZNxa1Se22L6XPucmhJ6cxsrXrDugFGHnRlZwxgD1YsoYgvcp1f5XggNod8rZlzbY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHYS6aUgDxROaCahTPVrjkjDLx+2kZ8Le4UUhjzpk1B8GbM5Nn
	B1YJwnmEZkP8tB9/90Bmldk+tIXNlQP0apCWX6P3JEXVRBdw9mnAsbUx3JuPxLGJJ3wCRC2+XtX
	AnvNUx8z9u3aElF66eHM5FlmdameOf0gWRbAe5bEXGPsvDTlEk7r8qkFsc8KnMd2xnHky
X-Gm-Gg: AY/fxX5P7ixMyOUHjQeY1F440vfNGYAQjCD4U/W4v0ShEhXCQgB6L1WAT5m8P5pW9XD
	ndT0H17Jq/wJngIsRs3oTGdvVVVrEvLFlm+ArRRDSSKn1kS6o/AScQaYXWcANf4wNB3yPFp1scG
	J4p4LlYoAnGrzTZZWsFB4eR0B3liX9GVn28GClG23p+oEYmqkqQ3owZz/Vj6NpU5NbGjWpbU7x2
	OJvgoeq3UmXwYgZZKlA2wmUDrWQ5AeGTykbf90semElvn99F5EM6ci0hglALryxZZOyJenZtAXv
	KNIgIBCeP1OkZi6EwhQJPS7dQmaSAfrqUqjc2n7BlUfnoE++p1DkNKdYHSGQnf5Rq1/XSTMowGZ
	0721XxKh9/TFeeNT2M0uTonCIhdakLSh03Q==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849343491cf.37.1767620055832;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvCss19TuzHTSn4xc5KfwRsOoyqP2KDps/f1CJU56eHf9wA/2/5GRqU+YaxUO4C+nFYpkDnA==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849342761cf.37.1767620055259;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:46 +0100
Subject: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
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
Message-Id: <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wadaFrSSj2BDmJ3Y9ZwRT2wmM4bLw1N+eXfF5sF3PLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW728Erceuq7BAzG0tJPUBxSPGgMpB/EHmi/cc
 Q1ZyCkRLGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vAAKCRDBN2bmhouD
 1zE6D/wIyBX5G3Tz0OKc86+zlTFfb3sgWPJPG2/wE9P5S1QCt8BMPbgtOESBU4oTjXn66148vpl
 4XA433YmKdR7SjWdruBtZOqiX7mSmQX7D+8XZlzsjDmqMWDshv3n41mHz4BGlTPsmIVG80LeFfK
 STAvr/njh8HCX/m/zH+CrDN13GYwT3TzdmD7vqgN6mzGCpWHa03kWlTa0d2Bp5aB/1N2W6DB3XT
 acNWdBnPZ6dxvlZc3aqgTDyQw2qfuUOLW2oNPKKD6lzpwYhMDCapLOok42Gd6H1U0OOl++WqP9b
 KuYbkdEqhXte22rq3yX3IOCFTL88H2iTL+ucTcNvzbE2k5lnbidNefylPrbT54uegORpnd6cp+A
 wyr58AVOWkbYBUvOwHu0p2gjbvVMXCTvjRASpUORfyC+/eHriePowQyW4pSkRr6TKufiu/mSDxk
 BsG5gwL07OGLc4LaBJKhnFKbNcokTq5Lh7z9zSbhb2MISrgYXZjF01TISh3QIZ5XsrKILL4iKW7
 XhBXMbwi3s3zYmfJUxdLjtJJ/rMqYOkG+BD39Jowg8p5T5RstO/N3aqVr9AfjiMAKQzyr/njdXy
 dlH4tFltIR7kP3B3ceyM4jdNp6Mi/8elfSx3k5QjysshnK68eMtnAnlIA4lsOHWUIfFP9EFpEqC
 PaSRKa+5UVrrIBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: bESY5C_uk-NGhjP9TSb6or8ZIHuWlFNs
X-Proofpoint-GUID: bESY5C_uk-NGhjP9TSb6or8ZIHuWlFNs
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdd9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX8PWPfzHS2r/m
 5sW8hWbj9OsdWD18gbjyB94AC8eXORhNoBNBdVu+qjt5kCLsEavcfqjvyKrdXXzubQarT6+/pUs
 EF/0CNy8dAZvqlPcFxRoUtHzEBnRQF7xzmvN4f8sozMpzTx0X/E0QvLoYDHRosqh8lgS+pdHCHA
 SGi8zSdwbQydt9k1tdXCGln1rDODWjqMNz2KONHEVV3Bf7+NpgfbJUs+EZiyfQynqyvZVDdE8R2
 XIvtrLVjauTN+Izs9p+yhd8ETszZr5Y8zIAbr+aJ/wvaU6nfWY6aU91WAHw6LLBM8am+q6F77zp
 eNft2D4lUth/cEP5WjlEEGV/m+ukjbWlEjTcfDBng4MeITH52nFUSHfmNApq3DnpoB39UGB1rmj
 IAVQVH0hr/Pv1oUhrUsSP/MkGJATmb1CRCfUXEN0rJwOaV80RGu7ZGyqCd5p6VjQYNoiK63ahJN
 Bc1RxNFl9zl5zx1UOeA==
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


