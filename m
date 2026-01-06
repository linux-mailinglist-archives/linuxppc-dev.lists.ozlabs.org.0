Return-Path: <linuxppc-dev+bounces-15309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912BCF7726
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrm1Phmz2yvL;
	Tue, 06 Jan 2026 20:15:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690952;
	cv=none; b=kJOhAEJ4TgOppkZx9rGlCwFstdYGrQeTaQF61Sq1nNoSKr4dEneXaVTSsFF44WYW2hfPO2LfQBwsadixkatl/ZB1aY5T7Iy83e+YIm+mYQumuN8qSFQBHowTQ1tF+0aT/6VBLCnm9rhTo4AJ9VoJosNfcr4Gr7j5uilGf333odefC77TX11Hjc4fIcLL52WX7vRwHxOTek+/bJv9o0GBa2O2PkeMD07BdE/zuV52oD+vSNvZ/oWqL0LVZap34MOiYkVA0SyjMu0zah2TpkbhKmEZ4fJoA40ZLIPw/pmtXkW1re5iMArqXIbz5Mt2Zs3fmUg1Z2+OFy1uA4HQeVM9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690952; c=relaxed/relaxed;
	bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIiaF5C03IHnbharAbRcIgoLKn4lPpM9jopv/L4ErF+0Q9lijIaQW9kGnBndUxwJHxJ+rvlGq3EYKw5FWhT8/Z6ESEQqIZpATHQ49MzONIU7oIFTHqU10Zh7O9mnI+OLIkiIkt8ljr5S50yIV7YShNA66Xg3tuI/2qBPRbqsMMAQUXN4TxlKsifw4PtNoInqcThvwOSYYRR/L7ThlpflDMdb2x4ex5GTuO8/YYNkFSCbPPL1oE9XLo2RaUvs8JLAGWaRw8tW6xx17z2ACRsg+3MP3dPkTxUPeiI9JFKRRS6XUga1LAQ0Fxv4+k9cZJDNQyoxewosN7pdc2iBMNsbIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2y2OUhF; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrLjzV5Z; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2y2OUhF;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrLjzV5Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrl2Yf5z2yvK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:51 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063wGQm2684065
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=; b=K2y2OUhFOKBTeAtq
	0u3zoFdkyq4eSfwn01b61VxjwIpsk8g7AtXa3/k74ZPY6EZPoSZsi4cKkD2i3QOT
	vDh1SZqJ4Zx3seDvUjM91DML6YuJjIugh3lC0Bl01rL32fUPu1QWlXVOULAGSzJ5
	wI735DOof3sDJ9L9n05wfTrhAdsr1E42NWlVeRE0h0CHNegkr722qKG/ej9/TydZ
	5oevEigT2LrTmQSq35sMNSUpi1IqH+li99Lu29RrjfsDs5bTMHwG0RmBQJokrY+q
	7FgIQI7FVfEULJD9NMGXqhL/2gBnMN1FnxITSuIm6OLnRrQQFi0zV/Nb+0qKnpEI
	Ym/P/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5gv28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so106778385a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690948; x=1768295748; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=TrLjzV5ZIKiHxXRRKa5Lb6xVfdIfJqsO9JaBhgwjhZKmjWCtQ7lMedcJwYK7vIAQCM
         /Z/CM/mJUdNoGJ3giumADvRj+HXNdWVqE9v60eH3DZg3/9goOfFgYPbaQnzLzaibaOdL
         /yVDAIlBJLi6vvdt/W0t5WVSTKnWdcemdCyFBi71H4bZuRI/97EbdhWHMcMBfOXm0Kyg
         zma+LlDW2g9hmzuYI6InOtGpaBtes4jDee53iZJE+ZJf9lvFDGeHDceh8a5KgYLjJYRh
         8+ymGcJWK2tMgDEWH62Mba4H6x3YMqQWczwKp+OJ2DMKVt34zOcxm8CUbMjWOzzgvVqe
         Jqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690948; x=1768295748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=krcU6/drvNqV7mvjLprunJQ7a5gcVX36yH5/S9MBU228yGRaV3zsZZi2QSHwNKOvaQ
         7D05zQil021tf7ADr59yVWlm3qdzGiqos3+P16SmXSJd92fz93OhY5ndA8mw4MrIsm5J
         a/nqMKMVrjyDm/Rt1L47M1lHMX318IYqDXAoAAFHw6+ApoDAB2xgnf1fKmXxbObB56sQ
         vhZyFF9MOwL2ndFixwKoqSgI2DWog3JtiT5mSoJ7mFFjqqXNyH+acRaUfMOqJCp5TiiY
         4GDqTB7trmIJygHUPFO/H6WMc0Rfnhr2b5EF1YkIwwskz0/2AxwLcb7GLuPAi5Hk+l/8
         eBQA==
X-Forwarded-Encrypted: i=1; AJvYcCVu4XkoDZotlvevPwQzgsdrR2BMIW2+Ne6c5vHgBvWvRRAPeLKba1TOpbLvokRczHL+ZxG9Gv2nXKanhlo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9UUsJ2HXZ46MNMjScGlMLizyUwo/fSInDQ7gpYowRYUjL8Y6z
	r4BMb70NVkcI6JcmW5nc/GMqjN0eY5YjcVpmK4qtxzZ79AcZ8j9lrpBOJTCqO8m0/4k3B+OxqfO
	fvoI3c4DVIo+Jjr4T9T8z6M/rDCMgH4aJhFISXGCFjqlLwr6FzhVgDekZ0cgbNeX7a4aF
X-Gm-Gg: AY/fxX4hzRRukFpWwFpERQyn3sD5s+mULXrAcPv5+kSrrDmHyu1XQy+a6WwQoDqocLZ
	DOkni5nxAL3bCnHU5NG4xxWHpZqXaZkA7Cp06aTuFHHLNSqfvMZx9jgRqmhOrkdQTDNqxvHEBc4
	elIUPRhWgDZEg0LptP8cTFqA5PtTVNn7kk4DbsevqXzEt62XsAoXwqVouthnFnmq2C4uWO++wkE
	CNvCXADvT5HbQRzEbVkfDBUvQKSpts9ryeb3S6R8wmVu9uTdt4ksNoYPEavqsw3RagR2VZwxqVk
	sltwxl/0svmxkbvRzUdMqK9hWe4qQxoMY7gM7XfZXwFJleAUe2RNMtOq2HS5G2D6ZHETE+N3HJn
	YPs35UVtNzJr942N+R2p7FqlH6FKJnlVl7Q==
X-Received: by 2002:a05:622a:34f:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4ffa77aa653mr26990951cf.47.1767690948205;
        Tue, 06 Jan 2026 01:15:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHlsqdZImWyZR63WwFSMPpAOaqhhQOEY6qsvs8J2TYEGoLxgoyQ+tQ2SIrX93DUzAU0HOBJw==
X-Received: by 2002:a05:622a:34f:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4ffa77aa653mr26990431cf.47.1767690947749;
        Tue, 06 Jan 2026 01:15:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:19 +0100
Subject: [PATCH v2 09/11] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
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
Message-Id: <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKoTrzxQuj34DrlmfL4gkQkEqmVwpmfV966k
 v59U9aryviJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqAAKCRDBN2bmhouD
 1xq5D/wLkQTsn/q86zmdnRKEfkOqoz59r5ZsIs4UkOT6p3gUQrAkGQMknuX75jZWDumDlMMzr4m
 wm31zU7SZgxaiwsfheFrSVHIGnXEldOci2nKTq3QVc713Rj8YZXHTqSQmTgeS7pDi5ZcDDDxrEJ
 +/brmshxXLsTtWWuSapoo40bEXBBUxscI8K3embILPzkizJQtfBb1t2m+bONrtO00as6BuPRVhQ
 IShnvdBTOwbCDRpo0WZ3twrbajEdLMOq+QIZlaEZuyMI4Qu7bU6s+SMXevITYOOlfgO2vZWSQ4Z
 S4STHxsPHVZunvspOch+78go59+OZtMYWhMrl4XYpUGeHRuP2qou5RsrZ8OnYEDw+uUL2FoHljs
 dT8P2D0dXjqMiT6Omgq3mZJudvmLAn6UqUODK/GvT/+iphjlu4qToc7iBShU/pwQ9z0NAS6H8sa
 D1AhlzYysND44RVmdQtX4txfFqs0/c4tR7ucfYjneGkWIgcxDrq8WBHZO5jwL6j/WirnUX/+jxG
 KcU81Km4LTP+iTvv9zqqCOXweuoC0Pv3RpavjT8c+5tY1U71Z00azyzpP+ibdlrx2bzIqD2xiW9
 0kIO857qBHsEIIbcdpU+pgch9fb2zFg6dT0l5ZLAdQHGvChNJsgtzfWml3v7QtVFu2RdKCrnn/o
 lRzC6hj6dWUEK5g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX3PawvxZ8ATBE
 eJaFYatT4MrRv9afTrw3AGskRn+4VO4tgcoFDhGcCP4m22jplrvjUNqOw5hAj5wAiNiE1E8con0
 xO7p5+7yA+JbDqXSIW2TlTthOQtGrhxwJ3xEoZtvUYX4lz1jMe2WxfwKCk5kjRqTkbO4uAKTzgL
 PdVcRK5lDRnD7Cu084Hu32g87CxWmAB3EZE4L7SMylXWSg7po3D7/wk1R1nZOM9K1x2C2L+MYqt
 XI4q7dJa4/HtxMECjsUyIm93o+//1kA33z4sf6xGuQPLruXBufZOEzTebjUi/qnxiyprpf0cIkW
 5fiDRIl/Eu4fPMhu0FxX+mQvDj5BfhLjp4BOlDK41YAZEqjGPXuqNIreE9ZiCAXesdOtkQx3Cnl
 SE3DGN+p8Z5tNI8SKJwB8k/GcfwK2vFWsFiSPFx07IXi1nTpGMn9OJvW7bU55t8yty5iXSE/wvU
 ys3IL8VvuQfnKhiQ4Uw==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695cd2c4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4ZmuIOEST15uoiE0Sotno93nJyceiPFB
X-Proofpoint-ORIG-GUID: 4ZmuIOEST15uoiE0Sotno93nJyceiPFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060077
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
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0


