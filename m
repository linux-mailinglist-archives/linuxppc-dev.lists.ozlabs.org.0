Return-Path: <linuxppc-dev+bounces-15968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A205D3A564
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6h6rQxz3cGD;
	Mon, 19 Jan 2026 21:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819244;
	cv=none; b=bXeKEGIgESLr/SA8UJ9p2m/rre6MvgomjrAiPqANDagAMyA33UDeeAECoIxdFWygMUQJdnwPWjnWPu0J1Bxy0jGXkH4PUkqxWyMuv9ybj6aN2xZ1sFIQbMjoE2LF59dAon2xbmXVsV22LJwRlBkBQBn8d0vvBtYh6BLWUR/OgdL4VpX19nfHWXz+JgUDoP381nv39Bvs3jDv/aBUvsBrUI3lJiNAYxkxKleHVAu2dLk3pcZtlNmyL5znQ9hkJq8O9yGlNcZNQ9IweHZXe8t1Lo6gXIQwRpjNTKMMO2r5Y1oJju/CzmxFdmw+KwSF2gG8TaMM4Dzp8EBpRhzBpX/avg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819244; c=relaxed/relaxed;
	bh=b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZfdszqqA49I8Wc94hDwSYJbiwP4qtdh9fMEBRlNBV4Wxt+5VpGn4z6SzKZe/nuzJohBOMQS62CLdWGT+KW/gdkJaLaRGR9llzzBVDMRITVDrpyfjeXmhrbrX1toi8P1O0erM4ZgzTCS6D0Ve3xy8j00FXqpTRioWDYSdiapl309XrfLC+4Ed4IdEQ9xdjr9qVRTVqu64tMgkvoIxrl7UKsI/diJntNa0sUK19Nu3NgGcIJftZuWBsWGQgB84tTGchMRLQYcOYp82fQrjSeDRfDiEiprX+J18PVsJMw4uxnVaOS/nM8sJAOuMOOBy92013+6fDM+imF/XaGXGPM3bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTSZCYGY; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GLFBSLLU; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTSZCYGY;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GLFBSLLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6h1lhGz3cDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:44 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7kcD598432
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=; b=mTSZCYGYxAkevOo7
	gd8DhgvlCw2G+TF2YmU4ce2OqjAZgUp0h5R25s4At75ht5DXKZv+iD0ix6f7qJiQ
	hn8ilUHRcSTcU0kJIid2VO3wNM85z8XyXRBC0uLAychv0CYc99AFwGDEpOfAQsq6
	zFlZ1ZkBpP1hgsJCwDCESGtIspAXWq6IabqNX8wJMEvFaqs/Bu+ZqdQ/mRehwy40
	0DRW5dOdFJvWhyCDUhnlUKlnSMeCDpCFywyIyGchtzoUuJ4vFsFwiLYTYf1vkZEO
	sddrq+ni5yBTg5sz8+fix9mZQa9oZecG0nfR+yx40TVOCTiUDeU+WEO75A2s/Gkv
	JbXdFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7g3pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso1099354785a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819241; x=1769424041; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=;
        b=GLFBSLLUbHJf465EwaasUI7u2hfXh6K9va6U92J43U7o1JnJH1qX+Nm5bEOoncumEt
         m6Buq+5AilaxXPOOSPxMJcrmZEZWyvasyenwBYh9ze6TKaHNCZ9Dqe1I5Eue6AwH1foo
         A3kMjm2WAHvreSti9PkcXid10ZdDzy7lc2/jaQu5aPD3sTEvBbwDaeUrUprthYeAFdam
         77L/KnjaUOQSU87+zdjWcMc7IOYmBMPxrzEfKiHDO96ZVLenVIkbUG99D5SmpnUEX9wP
         FWTbob9aAJk+HoU4FAGMwmsn4CUBwWRshX3YBX9P/WNYVXS8H8303/I5WTLuBhGtVgEt
         bhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819241; x=1769424041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=;
        b=w50IpqlixvSn2HlRCScCBnj4MWcGpF6slGeEVdJpg9lzSRN3hElSx9+taylo7q5HyG
         wf0Axoxd3b9ymFpoVDDRtupNWeidynecZGFJG1K3PhocT70yzE7P0KBWKZOs1Wytaxbo
         XBmx3j5BkXllPbtnYZnduPttnsRAJdCvUwyqTbg+bk69i53iNr0pD1hYImGLkIyd1bRo
         6RamWC5rVUauaG47wHRp2RDqeZDkWshvAxhuiH1O+1me2Vl0v9OaSISylye9wSJ4+xGH
         rSrLe2A4YZ+5vBHyQvhAy83LPD28uuKnqz8AjT6dAUUxjim4LwbiV63/voItdcUunN80
         OKUw==
X-Forwarded-Encrypted: i=1; AJvYcCUTtcVFfhLXLm+bHtlX5tpy56nyPP81HHSxGzObgIWwMEGPM76aWeQsjf+8bDfcg682dmHKa/CeGpfi8v4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWHTN/oBqncgblKCTkiT3lYES/cZQer6ei1F8NLMFzpADNXPhL
	lZSRHXi+jwqpQm5X9J4GCaFiWRnIvSifxouChU/xGERA/hGnkIXTjvOm16+0BfCuGY6aNkePljc
	k+r81V6SnyZm7WFhJzNzJElL4quE0fJjxwpRQHpUswmw1nlmcvtyQBJpSm5U+6HLm9M5Y
X-Gm-Gg: AY/fxX5Lgvi7IdPK6NCif5162QLQ+5ND3OtoGLyh5ZB2/kix8uJD8gmayVwFdmy0HmD
	L9r2g0oJsfj9hi6V4G/kvDklDayLaBC7moBSz8nxPj0gZ36rgSaYs0xCcpTHZzefUkCaOXS/PXC
	XjvlP5DeOnioyaQotXzr6GOUrXxn69bHaplKwA8NcLNb1Sg4mTVs+JyEEf1LQ8DtODfHz/f4Gb/
	R0lMDKvCPViLhtvhZk2D2/biHjsT1ihiKDw3oYAVVN9JSlvDYXY4rjLht2Ij6XdPeh4DRCknWDy
	4aex75R8/kmrnXi6KcBv/bhXfeYpdrZIiD6b1bM0kciM43EcOW+iK7kRgTuawP7wywi7lyohhXV
	f7LcDIDhX+GmQL7uC0O8FExmfh23TWmpS5zlLkaar
X-Received: by 2002:a05:620a:f12:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c6a678a15fmr1447748685a.76.1768819241229;
        Mon, 19 Jan 2026 02:40:41 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c6a678a15fmr1447745785a.76.1768819240809;
        Mon, 19 Jan 2026 02:40:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:17 +0100
Subject: [PATCH 6/8] soc: imx9: don't access of_root directly
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
Message-Id: <20260119-soc-of-root-v1-6-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tmOinQMvmCibhbCwHvJ3zmzJO/881x0pFZ+yeG4eMow=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoaZOGeOF3pZEl3wpwrdehCCmMNVv6rHvvj2
 g07QncJEh2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGgAKCRAFnS7L/zaE
 wz8FEACDVYRrHBRKEwgRYeyUXqwuQGeHjxuvsicgXR5w4UxuqTDgb0S9TMOw1/OAzHqh5MnQ+uo
 SqYW14DnPr/qJhN380jD8sAf8m3c07rptk82vjB1r0jHMCs0UsC2gz3ktaurpass1/AEuTDdvab
 MExkeCuTIysQtYDTbg/2EfpqCQ9JYZQsh2cdTFKmpcvX9hVISz1qRZsR8IMGkpjw8KrLrCLoBIM
 hXvWYhNU1p9jDJyHH7FKxXN+Us8so79s6rOzbuF42lE9nkgxP18Lnxom9VX9k9Y0gkSYISww/ez
 ln4P/IFjl1XjnZEqPqgQxd4nfyIAQpDderdrJRGyn7MC01KY26tW9CBw4Ayt2M+d1JZcIFeQIzD
 u5uUSJwFdn+0NGon9ZP6E0sXrH8pj4I4lUmJ8AQuHuCbKdZqRyM0RUs+q1m/+Kp6i6frVvsSdrT
 3UlFqtsGaTy+i8THnuEBeU4z5v4tXOZgk+94+Pcy/mrrdP/KD/7ZXcGaZpqyKWiKdrt/jnbkTpi
 AgE3o52+zKsYE7rokrf+02gSJLlQ0zijKVDMy3XsghwGIuq6CweA1TeEIXUw5OnhjOP2hDvF3xv
 45rvFr/C6WMXDFx+cLMS8zPk7RktSKJvCzwdKo3eimTJgJRx+K+rrHK262ROsfP5hz7ckmP8pM4
 5oM+qWGXbSGvkjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX+wAjJfbPrzRA
 0A0j0rnhaCLxB52EWZ3kyXuU5GnIozBeaQvz6y4fNjGqtNNyPFAUnT0u4yJv2elYwvuOd2epHfn
 otYrLCeC8c4d5Nl4KWkgiTQUYip+I3bcIJbdsC5FDBqd+xpliNC0fOmkszNc9iaIl8LyQOQG+bz
 q3J5WsizpJn5mT6v1c9w3JU/meqYhDdd5DX+ovonx+zb064gP7uDFKep62Rqa4PsnVd4QKmm48v
 ZI5hObss6TiD9TAWzs08SZy4AumevyB1nPalt3EXgsjiGm/EvdlvQaCtzLYn2ZYOG+legyFy1+5
 Hrm6dMBeImjb3wnvamwHgXvFCq2/ZTUo94BsHAuV7pMOX8nmH3pcwJloqShEoE9m4LH1+wXuON4
 DRFMjfbVKUsgiEDSGMS6u4zIzvzy/XPyavHhn2fWUT+2L+ML8/QUwvnnp9YGdiNJdrlo6Ipxu46
 Zg7z1vyhcuOFIorDqew==
X-Proofpoint-ORIG-GUID: 55gnQx952YwVgYLarV_vXAebi0aGvIqX
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e0a29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PMAhrox8fQbXPR-8CfIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 55gnQx952YwVgYLarV_vXAebi0aGvIqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index b46d22cf0212c3f40f61ec5be85ca11e5d3207ac..0cea4307ac3923f416a63bca793a78835d868448 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -29,7 +29,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr)
 		return -ENOMEM;
 
-	err = of_property_read_string(of_root, "model", &attr->machine);
+	err = soc_device_get_machine(attr);
 	if (err) {
 		pr_err("%s: missing model property: %d\n", __func__, err);
 		goto attr;
@@ -103,7 +103,7 @@ static int __init imx9_soc_init(void)
 	struct platform_device *pdev;
 
 	/* No match means it is not an i.MX 9 series SoC, do nothing. */
-	if (!of_match_node(imx9_soc_match, of_root))
+	if (!of_machine_device_match(imx9_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx9_soc_driver);

-- 
2.47.3


