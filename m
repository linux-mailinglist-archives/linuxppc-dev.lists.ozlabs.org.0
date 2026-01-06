Return-Path: <linuxppc-dev+bounces-15304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDBCF76F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:16:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrW2q1mz2yj3;
	Tue, 06 Jan 2026 20:15:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690939;
	cv=none; b=RGIKLQVMcmTEQhQWW5iJmM735hcqIUQb01E73lJqq5Vf6spH4/qlQMXtOygnSEY4NlNUsV4tIxp7H2gnkxdxOwH1zJIEtidORWFT1E/biu7X0UuGOONHp7py1AkZ06zw9RkTZN2n2LfVIer+yjUOoRr62cDhEq0tUjhZNn7HE9ync268cq0Hmi5o12yCeyesLn5ywDXfS79JiGiLcnwU0zwDfPqEIRAkTi++whvpyWrn7UrEpYEThxczXQbFTKqBrp+ggvd8zAMXnMbWoY+qESky9AMGFi/hOyeubFcwOGEy+bddi6YEOXzakj4EIq3liTmEs/ecsEeHj5/l1uoTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690939; c=relaxed/relaxed;
	bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOCvhrKfzu9AwAbdgoNWcaod9EyL8pbBR0dKLMuOrJWgssjqdm7p8d6WMNFKnkc95hQ4AuFlXnf71pxs5CIEqU5mAQHjMZgq/HcBrApIZyOwK5A1mh5dwecde1Oul6Q/0c7H9rnJe1pVmD0CANEGLKtcw5HksR7boMdcDpO1Vy2r+GSKNBh2ffdZ5AY4OLu4KWZyuhtZnJ/BFW4BtLmaHIEFMeY0qDtCoi1n6IDb7+pBIk+1B2CZjGr2idFrVnbWDqRZDDaublPd6E+oi8wi++H5D/+ulGLLDO19k9tUzLhDsDRyCQDWXbegBEZrhXSPwLr3mOXowCY9cxe5vvNkMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzdlmuaF; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPdG4ITS; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzdlmuaF;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPdG4ITS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrV4f8xz2ySj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:38 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q1nm2429750
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=; b=AzdlmuaFqTDxLjwR
	lohgu46V+FUulxlb/1omdPCuQmuu7RqLlas8Etshz19artC/z6uv+dXK2JRYKQcX
	7HgPUw/LiSgZBfdQGZw1RSZBTHqHZJ2D6a0HhKa/4fXnE0y96Qf1h8vMgzoXtCGS
	Gq321I5RXI1D6J+M/ViyEYGaXnSxVGGfUC6thBoyAjA4mbnYaJ217F0lJuOwCug6
	d2HwfWpJOBXjws/GSKKkjQWlm4GfhKzYyZ1j4QO0QuGg20lLODZalEBtYszTnn3a
	nyYokqu4Mnx3NPYdmn1PyjW1dwSiZrWp9lvMntSgpzILBEc1n1xEmPeVTW0dqCow
	dRy6OQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7399u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f35f31000cso11693991cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690936; x=1768295736; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=PPdG4ITSIeGv0tW0OdPSeX5L6wF4H19IJ7dk/caiwM3kUJJUEcchne333x2+1Ps+Yn
         iFPE2S3xbJjadyFWV8F8n6PjGPnGx2CDNn4hO6Cp5gOik0boZnHX3RtANfvyPrMQtD/4
         drIXsUZscjI95b82pRI7Kr0jj9rHGMLY+TF/woYxidfcLsRe2X53Dq8xeW7emfg0C2ue
         aBzhYohxWQDeVhCwAR6bD1hMnCX8JqdXSzTCZGkllgbr0arGYbukB5irdSmNffISTz3W
         WFOokdLNpBel2pD8h7qrOhXbupdEGbxfNlu6CfoW141Zx5zE3wMm4Y1Yi5tjscTyxG3D
         8auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690936; x=1768295736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=RWHZRi5E8bNMRm1g95d9DlxOoj97i96OASVxbgTyCbYQY7xuVLI0zCt0bObSjPu4Wf
         XDSQDmk9PhU8dAA68808Fc4KSVIQn1jxyNlQm6TH6bJub3SJ6QuTbmeTu6CPB7Ur/bj+
         BaVScgq/jY/PWLkzgGoIAapF0o7NV4Z09mno9S78NQKENN8+6Je+litoGdLppaZSL0Rj
         V9E3vTKlyAJFRP52Zc1a+8luFmFvmuIPGQNAmO/5gzt553PlmfI9xB3phtvZLOXi3C5M
         8CKfTWD212FJkzdEespHAXxVQkY0TNt2FTlDc3QTkjzY65VoaQD7UYMfouJApOH7fD8N
         tU1A==
X-Forwarded-Encrypted: i=1; AJvYcCVrw0Ea345equGGJEpTN8gqFMIgClUxeJ4FJcgl1ZKPTyO5TLzxJo3o99TKZmJH0uJHxHKGae0iFUvxxWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpDW+IUkSpIWAvX4lgvnR2cNWWvmxCU1p5P/g7hgJSAF1AX5OC
	9i59x284WWL+K/eYr67XiGj5lGBR+BDkPn2zBQ9SDB2So6P8M28Swo5ILQq6UTHg5O5tTjVGbcW
	qfraKoCS1g2nemYBNLeiSGipfDOOXTVoo4goer3sjAonYrdG5oSBAjcrqKBcasd70UkpR
X-Gm-Gg: AY/fxX6VMbym+Ahw9rkC4E9unM7FMC2bXgsV55cW2iKcuEpWk/OiegyWOnM1/ASnlyo
	2jVlfATfY0FUxiX+4trjB3Ry+AQpIGTv+ASuENTkQqM4NCYkjHQxnRDwjfFYGN8GFIDwiHJgGQo
	J94GbkYSwJYraUeCZZKMGIELMTxPwbjkqQgw51945RxvP6zOE/PrksM74zjeyQCZq0WISnLD2QI
	88E4XJDEF9gbSmh1zuhbwlpj1jLibUjY0JQzuB9q9E0jH33ofUel3HlrQ09zk8ECXLrlY9rIKYu
	UdPOd4DKArGmnJH8P3PtlXCmFRfdIvx/KxNLcqHMN/eokYl6xc6LDrKvdYA4xQLO8/rTftySB2g
	CD+rLh0OWH0DQm4zITpEdxy6VibZAgACpig==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr33065481cf.13.1767690935601;
        Tue, 06 Jan 2026 01:15:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj9n34M+nvJtisn5mDYy5RePHoeuMJd4vqGss8fg8pD102xLm7ehjQZBfXUwHbXo0PbhYlFw==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr33065011cf.13.1767690935131;
        Tue, 06 Jan 2026 01:15:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:14 +0100
Subject: [PATCH v2 04/11] powerpc/fsp2: Simplify with scoped for each OF
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
Message-Id: <20260106-of-for-each-compatible-scoped-v2-4-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LVLzy0PUtWV8BS2tmtolxGrxYJ3Rutx30xWjiFUNeE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKjqMnHKZ6rh4xskjSorjbJanJtC5Td5QsTN
 mTpfCmhXxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSowAKCRDBN2bmhouD
 107BEACFykt16DYNP4MhZ9/yYnB06mL7kkZ7VawN7JLM4VGMbZZnQCVky8Sgq0r62VsJD7jf76u
 qQdVNf/zRIeD/kvN9orKScdeDbI/QjucKwW4mh/7f5YQqherhONZveQt0LkbZtiaGFFT6JHpkHR
 zsuoQFMOCWk/R7xs6w4VpqX0vdPQT4m6hAUXWffthiPETAIPGsF1iw7xGlbmtSSOW5mjZbLJ3Oy
 06ZGo/2BVMN119RDQ1dIJpY1nYxwtLZfbaw6M33xnCcfOuM/vxzuwdRCIyW0eiMTlx2+iZOsZlr
 J+Q6NXbGc3QflgeCXkWowuJJzY7ntyXDg/TQmawr65rpzUnCSt24pjKYW3/WMuwj7yZR92AIAk1
 aottxgCA2w0R6uE3O57KbXDZuLEmXQK4cQZksQCm9IYD3T74JGOqlM6ecCJXdrSexAi7nEWjFJQ
 AI9w7ljNyiUl7kE80EV+AX7c4lOx7VQAj8rPZA6QYFHWkkCjOG75QvJX95xOJwQ0iw/5ACcqeKc
 SmTVGMdug9kP9wgBvtuKVW2HQ2Ff3sYSB8cJYSk0djxI/1uBo88xMl+pixFyFzGIJ613VXDvt6H
 KG7HY0sbmwXgL3R6lyid/9TFFYZLCTfvKMG+4Br99v52e9mbxnkCTzR/x1pVmzsgLGquiz4dr8S
 40GfezA/xzLZtiQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd2b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bRA1xQHzFO3ZoMUYUbgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: qyQwknmuDSWfueJR_v0EMfAhZMHxTXdQ
X-Proofpoint-GUID: qyQwknmuDSWfueJR_v0EMfAhZMHxTXdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX3tx2L0FPF+u+
 kuBYBsFpIS55DSUHb7rBhnSz5I7IkIxyl1z2cJxZDEBhtky7kOsVszVw1t6UxEcBcBdsjvwFvhm
 1davahFOl6yOXQUtXXzs6U6tiHGeJOmTU0nO71wfZ1NflIATh0FX7CMyAzINdBLRMEtmT2ZSFJy
 UU+YffqxblL9IwCmfYpXaqZXuPTbu4xfPKl2GmKE1LpXRrJB5dLBdjHVhjX6n5N0EO02nIu8RWQ
 mHOEsNve6bvLlw/KSoNOelVgTj3mLOM31P0fn5pfr1V1u529TBOXI+mwi/Ewge6yMLNiRD8ohXe
 gsQiDmu7yi2DYEGTYSJnkssZHpubEB2tAPWxvYiiFkqvi/FMZeBQd3euR4mK6xtF4/BTYRLZy3o
 h9QWcEBnedewAF6Su2PfCKmjeiFAiQtPbcAeYA5IFUDl6+lvAEVXo/aLmnf8DKpQp0uEubYmc7P
 muXLA3uBUuMO10vloUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
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


