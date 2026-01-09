Return-Path: <linuxppc-dev+bounces-15464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCBD0B6BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:58:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnyr5FN4z2xpt;
	Sat, 10 Jan 2026 03:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977892;
	cv=none; b=nSEpQ1Vs+seDJ6lc1mqHJ8CMczXvBmdtLuDiO0wO4sm+2VsERNWcm6JD7PLA9y5I/BP5rCROHaBcF6sfiNj+CF5i+4TfWUsTslV7tBj1iEMRUouxUhXfcSCmHCIzgEt0hy873D12V3qskRlq2YV9MDCTNIRj76y8tuhBYotJyRD8tBaODkJufc0aKVUjrPD1Z/2Y0DAZNzlDa91z02lT6t0sVBbC1jQQQP8c+YrW4Euo5WEk4TylqtNPB+t5SCfZmm5bWnWx7ZnuSERKVP6DoGz2gzeVSdFUkecAHUi29JpzpAaOyeEInLaj8fijL7nzY29ohCD4PXHwPq1yvWTxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977892; c=relaxed/relaxed;
	bh=wAHqNGApK8nOk2tnjvfw0gWpAzGP571Z7ygNRBnfXzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Czo6b1WaffOA1UjOQMrNFfo1xvBRilb/E3RiKBRBMKgfTRERHoXgk3F6HQfNbneq++ggbiGBPiKHltbsDXEb6XNjIcBfayqE3ThlWliYsyN7mi409qX45JIJDl+cSRF6rfGwE+t/Bf8YDbe5SQB2cKkPj35uhiCYuRNkhRmu513VbS4AP9eE52nVCKDI+E38NWnjhlDtSI20/nRB4nj1Mooa5sTjVh2+Foa0tMhRg5ipDDzr9C1h68N5+5yj138d3uUMKC4VeV31Ohe/0xMFmEv69ldBItZip3n49ovpUQF9cF3iGlmB4Clbmu5ufi2ti8cJEcBVkwRwduLA7uDFkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONvLCqmR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chpw/VTj; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONvLCqmR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chpw/VTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnyq0TQqz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:10 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2pQn1062707
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wAHqNGApK8nOk2tnjvfw0g
	WpAzGP571Z7ygNRBnfXzI=; b=ONvLCqmRXGSaeOef5BaOlWEM18ej9r+EBwqVA+
	GlqLoANpxuvdRdkZl3HbO7lIO2w8NNeaKelD12WKkSK+SRoG8KdrQHO3NB5GcbyB
	a7X2cDzOUmU/3/asaUoHfvX/wktz9cm6ndf1KkeKDeOknJ5Ra9tdKxWiqvlpkht5
	LbOeHJ6ejQoeQI67vxJMNqpituJmeaBrkXzRWz1NP/9oz496k4LfhslWaz+0gd53
	ufJJ5gnKKU6zIaV9betREELfdtqM4yWKVYeTRqCVLnHDedaFdysrO2Fv/bswzavG
	VBkjL/RuCuc+iPFSsNhmP6r5F3b5G6EuJfPg2nPJxuXK0Uyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f6908j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2194e266aso1091268985a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977887; x=1768582687; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHqNGApK8nOk2tnjvfw0gWpAzGP571Z7ygNRBnfXzI=;
        b=chpw/VTjXvddVzfmVIvBXasiDKkPYxGjbzO2v7HFaxnRX2uEzJi1SWoVM8y2vV1xnz
         xQHjh/LMGfwTAosDqmIIK6o52wVpJU/r1WA0cEbt7kBKeb7yuzPyI76UiijQl/qSr+md
         YmMbiQqMNIW5UuD2vmvN40BfAl4km2OddMLLBoNAWstsSoiz5MhmcCBT95o9Kf0t2JtT
         fg/oW4PPB8JxtFU4GySPz5nNOb3Rl7nq1d4qhRPl72jt1x44kFptn8AABpb+6qdLiqNy
         r1+0nvCXXlRph8q47IxF2LQDZoHaOHByn+FJBpw40xAreqiQ1q7hv3gH2rYVxBQFi58y
         i/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977887; x=1768582687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAHqNGApK8nOk2tnjvfw0gWpAzGP571Z7ygNRBnfXzI=;
        b=bx0CGXkfmDGur64WxM0RJ5jm/0zR5IpMGQnsvoaS7LBGGa+BYp8cMSUWQQhTRIUD6C
         AWofLpigaMI8G6BtXsOGoT942QkzC1KHZP3jj+EtSOPODje0Z0vIJq0XUp6/C44mmfQ+
         DBUnLFzqXEgsZD+REgik6uHEE3LjeX1p/cW50M3nnztZYGnqBsbnM5MWt87l/ZX2Xj0g
         6stvlI9i4UmJrXvgt2JnZFhEJp5FaKTWIUN/RV9qxHYKybN7l6ulC5ZhyYbQ/joSwUVc
         SoqbRfNnrAgNMLsBZdqGcpvo3JLbUIF4FCMe9kXkhKhMtZZD0S7NG24/f3Rb+dk8Xt4m
         8yzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+rnLE4EjSMuuLUISyShgyl4qRePxPZEuPWrY+i5PLKUKKx2f9Enlk8WKivtm0K8aFrDReIOLVOJbAbJc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyxqj3fc5J32GWUfOcEDhhCpzRiGnKd2T/jb3IHquALfncLwrhP
	x328FY7gngHREUmoK3b7v9YACb+58nqFvLgZsoEGPfhLk2RsKrW2Km3TlMimlDOvGw4y0iETgGP
	+gIX8HfUnFINgF8mNkloRecM9kBbLf9SSge93zNGwdTfGhZZUkR/PJw4E6HTGPGXcswsC
X-Gm-Gg: AY/fxX5LeX1rik5KDtMdMoLOTFDog6wydGPRLSv8XwloCwhjTM+jrx026lfIsQdbEMG
	hRTU1MD5EFFtSj84sYoWsHB6+9fOzGwP2Vl+6eQBaYFqPurlwMx0yADSHkTrbV9qzv+xlRfxcxJ
	IGMe5WfLBN3hdmZnn0nscOJ1ImIqkKs0JcslEIPyZWDbdF6pZ5ZUA68v6q6qfIWi7htG7GXFwLL
	qsPDcwGwczt/sQQvbH6ANG/KlwX8BYWbO376yRaihnVHaM/4C3AAiB5BZ7WQj7ir6IN/cY4OqBl
	69/oiRJq6zcaSEUsWu8CYuzmtV7IE9ViMGve5nMi32VCHY9wZQGuoka8iYUfM1bLimpfPLYj1YF
	YiWn2BxfcGE+2TY6cvHtanrhGhIZln+9ycg==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr1398268185a.18.1767977887034;
        Fri, 09 Jan 2026 08:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNPfSLTF57nLz+6LXqzYYSsKZOpJyv6JlKR0v7EDkSl6w34TqTKkwxqafir8nDSQZDMHCUyg==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr1398264485a.18.1767977886512;
        Fri, 09 Jan 2026 08:58:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 00/12] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Fri, 09 Jan 2026 17:57:44 +0100
Message-Id: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIgzYWkC/43NywrCMBAF0F8pWTslSZ9x5X+IizwmNtCamtSil
 P67aVcuBN0M3OFy7kIiBoeRHLOFBJxddP6WQnHIiO7k7YrgTMqEU15TRivwFqwPgFJ3oP0wysm
 pHiFqP6IB3laqMMpIXhUkGWNA6567f76k3Lk4+fDa52a2ff+VZwYUeIlCaNY0rC5PPsb8/pB96
 g55OmQbmPknWv9CeUJphUqUrRHM8i/ouq5vUWOo+CYBAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JN26wjrJYvXdAxtZ0bB816CXz0c9ThpfVWU5rfltyeQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTONgHItTP0IOHoke9/I0Oflg/ErlVdydJVdc
 rcybYkuDHiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzjQAKCRDBN2bmhouD
 186LD/923xyt5jSAANUPJr0DkfC0IFkCUjkwy7vW4g/lIjDDdTVlxCH4ZAEUfcejksjLVGtq385
 vpbtpjl+6EPGxbyWPt3Pwb6lzt0ktHB7BRZgpTWGZlh81OXdhlb7OMZAfVVRDcBWv59nnM55pMv
 e59QdyPIXetiGqvHAhD3Wl8xdOdiFBwodfcTfZmUSLX1ZyqeLeUYTS56FVWhIV5Yvd3XeRfGMa2
 U00RCzBkHuC1EL8wMgrm2vp6ysSeUI71Bj4hXm3iFdI534CaJfhvOcofEfo4qu3ldkPKXBmwviN
 ODLxbGgoAOSKGZpUaGhiUp1AN3CYQJ3D0NS9fLmmtbqtGcre8VGsTidTZNakmNmVYEE6sdFe0h/
 Jgit8sFCPF3Yfco3ovLxcWYetHgtdbTFK7CtnaELQjxLrn0KYos7BKHajZ1TVB3QWkveUqtZn9r
 h8ZSoUw4w8NFhxLEjzMdczcQIil9/js/40efGMKkIVAbq4amZR8Veg9PnUMuYsMZFeKNnWEZT94
 rs31WlzGsuvnMAq+tsstXjMOVCONmaXGa9ESHvGZqkorjoRTU6dZr7mFZFDmlfp/dp123jbvHJX
 pMBPQitRrKqpkR113badiHPtNCwW5sYYeeyeLZTghwveUxQn9Dt3XZpPExNBYHyktu+7rodtkES
 1DmaqvH9C1QgoZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=6961339f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=d9g9ln5aRjr3gUnP3tUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXxRGN458ycFVs
 BwKBn7gqSoN25LmCob1CcRMW41JzEkeMelt6J4KoeRnAjOTuQbupSlxbpJDDb3+7++wm6alQXub
 K6e2Zem199L3hO3QnNRboQyrb/NdoUDyXuUwlzy/yZU7G2LVYOzqoU7vi34cDSswZN75EPrN2hS
 LfIlQtRErKkJsVIw8uRSJyL7Kp+QpKH+pDlkJHV0uSDtBUDMh5NtdaIOZKDmVSgT/eMD2lnUISH
 KCuWA8j5Gos+ZERnmFuSTjgoGFJ1OjG9hiS6ttYBoAtqrwG4m/7bBZWiggoGhJhZuRm9cBBjHs8
 64aYduQMfe3BffpT8X2S9KtTO7lObTm/85wZ/RFxSzlNG4BTZYJfljhDCKPX2Y7BIIazXyHoGIk
 3WxQrrbMiU4RwektVhoVnAhhDh7X8XPiBfXqTE/P6dEaFvUkebjBDStCdAfUwKWICSJNf82Sziw
 H3Zw0Hiw1GCjzAFNFUg==
X-Proofpoint-GUID: CClWol7lzKYdhIAGRpmyxsI6j6v1jgeP
X-Proofpoint-ORIG-GUID: CClWol7lzKYdhIAGRpmyxsI6j6v1jgeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
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

Changes in v3:
- New patch: cdx: Use mutex guard to simplify error handling
- Collect tags
- Link to v2: https://patch.msgid.link/20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com

Changes in v2:
- Update also scripts/dtc/dt-extract-compatibles (Rob)
- Collect tags
- Link to v1: https://patch.msgid.link/20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      cdx: Use mutex guard to simplify error handling
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   | 15 ++++-----------
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 scripts/dtc/dt-extract-compatibles                  |  1 +
 13 files changed, 31 insertions(+), 53 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


