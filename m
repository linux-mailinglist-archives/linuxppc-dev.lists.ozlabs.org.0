Return-Path: <linuxppc-dev+bounces-15467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EE9D0B6D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnnyy6Gq0z2ySC;
	Sat, 10 Jan 2026 03:58:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767977898;
	cv=none; b=m42e4tIEGcLBv96qo3iip9ftrjox0goSl3NgXjVK1mzZ+UZ3zOY2TlM6VDlCZTHel2J3HoKBjD4+NW9OzBTQ6kXeVtN3O8aqecyYwfzLOSxNkpJMnjhp5reXB9YJMRTzsTjSzH5NdToCchhhw9vTRggHtItuRoUnYzR52rXtjDlebKwdZN2BRinRHzWmlUjOVDXxcKWN6X3EoDrUXeq8PGu5SWAa6AUBXUiRdqBkUbhaHhFCTFQ6r1+pmrsghHbMdISv1mawMYD4IuZWvAaIbmPKTRGnsNiIbQO4UbPZs5RiUfLOabVXpcIlp/ntXmZdF+qofVjdpBXAMtgi6jIVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767977898; c=relaxed/relaxed;
	bh=ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6U1gKSYJctB8x7BpxeVb2vzh7MRFvQKhylXfajpTLebkpfzOaCBWApQiLKwKTlLsEm2sHaSEW66/E+sQEuZvu4tYBtp7XP5529PbQvsCvbg+wz9GzEEPd6lA6fCY76k0WKw2r9jDFtp0ckuOh294josJO1VZB+6hA7kRh7R4bscYZyzTYLjtmV1/FD7S+zXRJCNlbmEK1eGtGpDgB6VF54rJ0/vzoBjkjE46/b+xd+oyq/voKoc8/zZwT1g3EQAvudTTWhOpvM/jvuyOl6Q4xZjejwJ9pSsHB6Q7aNsDNRmSSs5xJOyDaZhYPxWRCCZCMNffP1zJZTSHZABBCMGHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vykohv77; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6aN4Hqt; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vykohv77;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6aN4Hqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnnyy0ChNz2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:58:17 +1100 (AEDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jEKE007860
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=; b=Vykohv77h7z1Of4A
	xXh/fqXuzRIH/PbRRIxfYdGGnxwMQUo8igi1aNjeeV6K6Q7c8bVeyJadWeXzYDU6
	PhWQfwMWtVpVsacS9iASx7ISQoQ6f4Zk+kNh9kzbQHxtqTQ7aFYv61QhOwwFgrUX
	+LZXegAPJkQj0Oq8Mfw2PT7WnMjosGX3u3ZObRY7IgEfWIRGR2aID4S7cBNnKbBa
	k5QH24HY9KzH3SwS+g2rxk0NyQn4q9ICWkZOvPDJfnLfFXO4E3fB1a29bB2te7VN
	kWMOMNx7rjBp7HvW8utlT0nd3BRy3gK10OCnA+E0Kdlhr4z4IKVYCRhyf8bKXKaz
	rdfaYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqh749-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:58:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b6963d163eso1060730785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977895; x=1768582695; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=;
        b=G6aN4HqtLGqkBkMIY5JwwVF9vA74BGY5BcHs2k+Ynat6Xp0MTs0Ky0CBuaWsOfMhWX
         E/jJz8TDGF9iO3ELrzGVtvKA6EOSx8H8tped3PSwWvT1IK+IGUvTXZaRbLraxtRRnshx
         IUwkQ90OYrRIj+AhV9+ZSmLATCF0M4VYsF+XDT+niwl7/wR23UyUEu78SEbaLnQXKDB9
         nUm2m2vVJFEq/WuoySB8ALYfnhHHrbNV8Uo+41KieprANB8A2C7jkcJre3bnVr7zfndj
         zXRQaoC4BgLP01Nw7S++yNhgqJ7htoy2+SiLgypY6GBRUgPJ4Uj73pAGYfe6QngiYFcd
         rtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977895; x=1768582695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=;
        b=B+OYAei7F/Ts+fYFILqBFeRrOIHVmHvJa+lUpTT4LHZiPK25dXO7DaHHF6srYosQhi
         TSsIzGDnyFBfehm10XACcETn30W+ufX/uLuYhf0v1Vc+ipgO5eiVrN0KN7cwdiqt8W+e
         QzYrBOSAhPVZMnnY+foSUgi4aJ3r5L5bANkQw4t4VxK/2TVSJrMwuDrZQjbBHXnjPcaT
         IbBaRXchVBd0KJ/3Aibxu6sqkTWbAdRoT9VkiSOrf4H+869pDAkqxwPEEdospEYr+rYt
         kD8pH05R/n38VJ4VlpI0DuA+NQfVJCrOVRLTtcUsCyoY8uOYwC6dM6tJ9n0eJSuqJEb9
         kmhA==
X-Forwarded-Encrypted: i=1; AJvYcCXsXr0t8JESyz0neOtky6FoH+KiQtNUcWJ762t9FG4yEkyTR3ZrD6HfeSKUM+ZOzlxJsUVlA01FFwJo5dA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxeR+xy2Ak7dZD8yT5VhTZsHUfVV7X6wcbMEtScZK2khouYukPF
	mboIYKDQZwrQ1Tz0NS2KHz96j9/NR8kuHo+5NYbwRzR7VCPZol/g6aH35ZfxA0E2oMsTPdpJmpG
	VRU08qbQzzPxBj+HUqjDeidaXFjGLRF09CtMgRMfwaGTceds6tP40RR+980P7z/7qIt9T
X-Gm-Gg: AY/fxX6WNKx2TbHZUif4A/V08x5mBJM9F6xE3Qyr/WVt+V2T1n5rWB6MDNew4TmIYH5
	JtNcRI5cBaXJpJq4EBwC0cdHIQwaiC50NG6K8nXCjrfPdpP52VsRI2tLCQQYNHDJ4TKyjWVq/wh
	W8+8FXgypcRUxPkZbpL+QIqiqiJrMhYT15+gzVXZ8n9BvJSvQ6rHYeh6fXlE4EeC+YhXnkvGAxg
	c2n+aDTfIsQsFVgKLPHxQ5VPez1JRmhGHb+OVIs7+IhHhSpH1DCwjSYogfCtGV7QzzhjqBWngfH
	vnJQnyao4jP37w4D/BSlEqgePf7QP/FoWuGqVKfYKUmvmnkYkN2GFQmfgxQAXD8lGfM5/ZH2oiF
	owb2YeuMkmqVIBRXf/ammD0X7m20M+oUfgA==
X-Received: by 2002:a05:620a:17a4:b0:85e:b7b6:81e2 with SMTP id af79cd13be357-8c3893eb55fmr1410580985a.50.1767977895037;
        Fri, 09 Jan 2026 08:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrBq7Oj9urWGrpAyGkXDWzVgxkYyRBhfKrUthko6Zes9haa8dRS5mYm1yWfIN6yIJkyYVWUA==
X-Received: by 2002:a05:620a:17a4:b0:85e:b7b6:81e2 with SMTP id af79cd13be357-8c3893eb55fmr1410575885a.50.1767977894515;
        Fri, 09 Jan 2026 08:58:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:47 +0100
Subject: [PATCH v3 03/12] ARM: exynos: Simplify with scoped for each OF
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
Message-Id: <20260109-of-for-each-compatible-scoped-v3-3-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWij0Cx2nUsE3a6sV+TeED1rlFEQMwzrQCGei407aGw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOTQudL3FhN/34Bx16jwi5rezq66og3KX2Uf
 nRZnoW0HkqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkwAKCRDBN2bmhouD
 14y3D/4nRgbqVx8NtVKmBEK82/3qTuU14fmyZPVMKAzr3vodo9z/CnsYeX4Qs1/H+v0LL4bLIx0
 KAKUSyyY9ODpBcUTAjJN4/BIOegFdaaC7IjIAwyELLeBRd/3om/oSeas8xuNpggHee/nl+w/MSU
 xFz+iDuuEfBIiVSCW+YXK3KrfzQ4Xn4QuR4njXOrnNOSP8JMAQK+sDYahJYSjkFPhKFcDDbvm97
 R0VcxMpp3lbC+UDz3noSUjgLmlPlQOInreZDxRuumLEV0zvDzRuM/wJRD42VLh7gWw/NBBGu0z3
 kgjnZeMxSp+g+b+fPw/ec7Yv7MnK+qs9Wq+kGlESUXzmSB+Fsjo2dNVhyUCLcWgtG73zmT1MRgJ
 xefiuNEHNpvmWTKQK16hRQK2NL1qFwaz1JayxTJkQm3qAcOuzgGaczahlz7IXO53lQ6PVLDTVmQ
 EBFoOhQfNtnN6D3MfQ++8WB1kHf2Mwyx/RypZZ4jwz1yJ3qqmJEQQnfoGjprZ0G0ssDE7wGcabu
 hntZ1KDKHv9vqVhxYpRcY5WUvvajcC5cCbbVCzq/u9BdlVm3yum0xkaTKKIr8+EPGC/5gcJq6B9
 Hi+WNrkX7nZ9NkWFQSY3iXfuuSG1OcdSKgjIZjRnXw++nfWCpe/oMSiC3zukGykDljEPv8/QmQi
 gLVKlFqabwawcPA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX8PoTMoK2jdpQ
 z07yh9qgE6O8Bcea+jpR6iaavjhvk0xC6k+QgATm56eG2TEM4zDs/0FCrdhshzYrfPGK5ezowyg
 XqxsnUhpJBTP0e3vSeiEp7VGfWiYIi7AtN3BrSuvGhlZ1rr35N2XZy09UC1axfAMstkMtBeiJLE
 AvbhbkW/snQ2BHUapr6jijnN4vRYsM2g1d2YCoojWOBC7HepseiFOhrnhOF/14ZrqBAVp+Vckp2
 xarYTeLo7qw0jWdKPJevp15a3yG2so/Uv5kO6bKm7H9khg17U+I3aw4RllpFIqYYRUgfLBcgame
 TeQjb2HG0YmTl4+8SP3QSuLkx98oqOm9hzqlWIMuk5R5xBP+L6KHAkh+t0OLI2tgqkKs0HWpj9z
 tp2aCdR+zFTUJyfQOwl+xlhffTchWpYF8c7MQHgXs2y8Ai/6rHLBOEIX8tnbB1jTX0lRXX2MdRY
 W8vMZBLRYk3SG2ykd4g==
X-Proofpoint-GUID: 8RDdp-HMm3LJwOn2VYTB1kethBytRuoJ
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=696133a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=75aRx82TGYjwQxWndmAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8RDdp-HMm3LJwOn2VYTB1kethBytRuoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2e8099479ffa..18695076c34e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
 
 void __init exynos_sysram_init(void)
 {
-	struct device_node *node;
-
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
 		struct resource res;
 		if (!of_device_is_available(node))
 			continue;
@@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
 		of_address_to_resource(node, 0, &res);
 		sysram_base_addr = ioremap(res.start, resource_size(&res));
 		sysram_base_phys = res.start;
-		of_node_put(node);
 		break;
 	}
 
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
-		of_node_put(node);
 		break;
 	}
 }

-- 
2.51.0


