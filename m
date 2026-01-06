Return-Path: <linuxppc-dev+bounces-15300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42333CF76CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:15:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrN2lsnz2yLg;
	Tue, 06 Jan 2026 20:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690932;
	cv=none; b=aLcJ+EMLRIx/oX+oVb8rLU3Dh77gt4j7/RknmlR8PyCn+/wuWJb7q8v1qEWN0xvaAhLTscvXgZ/W+tfPDwr3Zx+7kqQJu4UPwlmJDyDIW2uiE909Rz2h87u15ewOK9a4/sKLTYhZajn8/tcu4U+6j9JmKajNM8KsG/FYkyI1j1ymr84KpMyn0+ZvuY/AoxLJ+nOiofAk35+BzXmoy79RbvHJZSlXJVKK7xbLaYB7lOFq+59hm1hESTP+9S9i4iVB+9Z81QeowiHGmIJckUlsIO7HEsAwqebllzOWhe0QKdWImJpGT1qWAsQjropMB8OKB8vlPXMdcRtRM7bvz1b1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690932; c=relaxed/relaxed;
	bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T9xAVoTjsvWLg5L9wygs6bCXQV0kat/8jfy7eEbDGM/ZoGO+sAC6RFUaJiLMYJ7F9/uw4fqZb5W/TgKt3K1UgdU2Bbhgc94HYw1sdvJ4D2az/iu2fpOjQYcHT52LyYxfUdTNZAAqOELS3HSsJEA6w0DaSVR/uuGmUQGp+JpUcposBTIiZhr6bRUbkvJgoKjmkvMgSLJ52ORNW09++rG0mTwA6zKL0iLmZbdYrTHJa6pWMLVVvTg8lzvaKy1pPfIbYxVXsHCbEy5Unkt0WOBJTgybIey2ZGzBkZYnPWIz0BaXmCHqYy+2qsDxJsb8ocXHtxgoGZyP1gCVnHLr6FGXyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U1bI6WlT; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfYqU78C; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U1bI6WlT;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfYqU78C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrL7251z2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:29 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QopF3272323
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kSJ/eEbuN5yGHUMen9nJkB
	t0F9uVUPS6BNRUD76mvkI=; b=U1bI6WlTVDkpZM8Qhi/PtbYOEir+Rliawjr70l
	3tCpWrNpmA7Fqyn2fatvQsPJnKU3NTLpSOBFexHe7usoAbJs7zcjvxyNhkGjk4vQ
	T7LwPzSdfhTKaFPtZGyEzNbOBqX6zri7+JowmrKoNseH7B+336enRv8QjwbDEBKz
	k+LWUBRcrHU1mDfPLQxYePM6VkvhBT09T/ae30F1OEjayKc/YSWjN0tvHAUW48EB
	Jf9zlO4uelR3/hOxqd1Wm4/90DrRvmymrN7Xy+JpKX2JOX+T+HOb+H/NxJBvRwx7
	QzBb/y8lnroKKEvDqCjP1bFHxPUFKq2VvAP+LmgI5p1f/e5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso36371031cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690926; x=1768295726; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=kfYqU78CtgRXhhztCLQN6wmv8g1xXx8DbIKxZmUMUgYRUVsplVfKnEs6eBV3sI1bhE
         UsYcajckuKb3hMgehhsLhSNwCHbhTHU2dDgBCRL+gBd9Hpf+DN7eVh++2L4cg6GoEItS
         7mg0i1f4g+hDod8dHtsOtfQx2h3Hmo39pRA2CmvBRRzLJM/ITaOZUzZEfu2tvSRQ/loG
         UE/bWzflKe+hRCx+h+7KDM8A722E8nyUlB1T+uzvGijCOyB05+2yfprMavSThy7rTdvD
         6lshCKorudUSCWZQBezTWVNX08MN0/puVg09cr2R9b3iZbqMRROKxXCYDfPV+NC0raJK
         2gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690926; x=1768295726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=n6noce6zFgQaOnzRXJaFGPJq+wGzctSiUoSXBHy1RfEjGj8t4J5IL1Lcex+z7+pQik
         pVDoXoWl2VOPyksnCmsBVHBVdcIXi1ocP+SWdvJGRRz18h20/xhHZojf4LzrHiE/s0af
         GZtdfKxWKYn2gz1m3sUN/lxz6JiG5k5kKjw/BJbvdYe/4DEynOEqGm6cVHzZ08TkxMmE
         3JXIRUSOHknErngVYok/S9MHpNSFVzuGkyfl5W7utB4v3URDJtK21xZ5BsbHmydP11U/
         /0iiUSSVWpYJqJW9oQw1DNx5Z2KF6QY6Il1l4CFzIRbgVYilzPpVprD/60OA6NcjWAYJ
         VeCg==
X-Forwarded-Encrypted: i=1; AJvYcCUscgkGY++1Usx4H26Tqxean131f/ajwFPOTdyaKsogMkS00eKH4vZ6zXXVsQw2s6Z2cAixiNrQ+YBiuhU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2xXFPUgca57MjV4WFgzYE/VJccJoQSP1w4pPuIsb1Nw9MbV0K
	8Jn25PcM+b9nIzmPEo4quIhglSSli/b9t447h5U6ISMpRW7DbHrfOr0i+Yb43FRteXJ77asNjWJ
	V7Xa2O2/TDzcyW75IQxXAbvu4DO28YoL6HvT+yFnIVpqO54R/nKKMB6TJGE0B6XyfML9h
X-Gm-Gg: AY/fxX4O1bXIYeHA6NVXH3k13Mjt3Kj/VPr0dT6g5RsfVJpfu5lhNc3C1lUm/greA8b
	wKYOcQRixKQFlzBSAyOvHq2t7RoopBPBFBsZsKZLJP8k4RzL133fOF3z7Fag/dPAL1LxAu2F+px
	NjtHqQp08NRKyDOHAGyMIq5MqSpfFGzkvhBLg2lRS0vGAkk14GD4hwwNqz81We/FXVB9Y5wwx0Z
	jci1LYqNp2def0GCk+gpQvnCMapy3HtKYLSicQzUa9tZmKkEL6rWHs6k2t+bt7l9hL7AqHP+TXo
	i5dh0IjJQ9sJDz/iT1WDHyCKKEHoEj+bypOhNywNaM6mvoWOULXJsyql5eWEUebSCnVhZRpuN1g
	YMnUiNs+x3fP1LOm4sVr+cEoDzj4BqRF3oA==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813491cf.3.1767690925597;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYNJNT9XBZBlcoB2R09/O9ycRMo0pJbxtqm9oFSewi0KPlk1loubxpFadTbsB+xmiZjYXsw==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813161cf.3.1767690925163;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Tue, 06 Jan 2026 10:15:10 +0100
Message-Id: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ7SXGkC/42NTQ6CMBCFr0K6dkhb/oSV9zAsSjvIJECxg0RDu
 LuVE7h5yffy8r1dMAZCFk2yi4AbMfk5gr4kwg5mfiCQiyy01KVUsgDfQ+8DoLEDWD8tZqVuRGD
 rF3Sgr0WXuc4ZXWQiOpaAPb1P/72NPBCvPnzOu0392n/NmwIJOse6tqqqVJnfPHP6fJkxbqc0h
 miP4/gCVMO77tEAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKgWPkL/X9B0kG2wUAH/3eTCaq2qugcMredJ
 KKTScL1obSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSoAAKCRDBN2bmhouD
 1wgND/47Id9EUUTVq2uKIiVZPyo1yp8da485u5W3t4dAchT72VuXV9Y6vKdcBt/nC96bIHsBsrC
 sXK9AmkmkMXhNIEzVw7moTKJHjbihXpyx33M2PaS0Qba02uKGDR/1Z8DS/FsIX+HkXvS4dKFkMr
 M9U9SDZv4zLSbQYtRLWEwWaiphkQyNYMul+NQPQeQb2hahhJS08BCmUTmB0WHo5R2CaAe4VXSsZ
 4/IBx//VTb+nBHW19EZVjY10fCyoJIEs1bbfrdhj8ALft5yhYGyKh91733GlSrOAxYS4VMigtii
 4vwOBDNFUdhWomkQTAucVgvS/jyEYq1ZyDIEkPk73tw7exz3vxxg6MY/Voo/I30IqKvHHKX1my2
 tqpTA7AOCBxVY/w6GDN2yftDSDraeEI3f+5ch55tXZj1gj9PF6V49cXNOPTvzgJFyI142eq++ls
 J1wsXLhBOwMp6iAx6lqV/UcKyJWR3P87F4YaMAKJrkroGFnG/XMc6CKbTMPn1n5DdQbd6frM5po
 //0gqRnPSCROhzjiahO5n1S5KG/nINY2wRqYw+aEyUluPGejKRFfq4q0O6u3MLUpbdTJwKtm4ob
 am//Nbt/BaDCT3Xd9Iv6CF6Yc6Q/MFargCzfOUderUoTTJ9X63w2tyWVn9S7U58fyP7B5ZNfdLN
 /zK2P0SbCUJMIbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=d9g9ln5aRjr3gUnP3tUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 9sWv_vYERbN1x0WsRZA_l4NFyawbebmd
X-Proofpoint-ORIG-GUID: 9sWv_vYERbN1x0WsRZA_l4NFyawbebmd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX7L4E0V/zdqWT
 nJVZLaWSqH7SxmR3B8BYGKVDZvnk0FtXIC/y+0sDlE9G5K6+4JmDm6GLuCKq7qqLKhmNPfMT2zj
 vyAnHJPlWTLM+6oVcyqeQvc7kWSo256aEZZERRD8i53PAaa3bmkgFtdUm/00oLHlnjaaq/J9ymu
 tDwFAuoLcz7evNJBtLY2CzkyuwO+XQwZHCRQ0PsuEjcSaFOokxt8Tvtw4TNNhFoaBK6LQhO83gx
 JkU+mSnlE/sGiTZRZv0tiMuACkLCQpOwT1J6yNOEIkAf2Pi1AWUqnzg04pGrREtXOTFRZAlgCbn
 Ke6LxK9ycvFD7GivUdmvv4h3eiXprhaAt/ohodwbzY6NEnWMhTJ+GkiAaX3pDH20461X6gJpWao
 sM++qt6UyNfoxDChPVPrDQ9BsHEb3opy1zHJIICVpkJtYo7FfTfthM+k9QaIoh/FTvcweYYtYcK
 nG5rT3Lq9AcZHnDdPvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
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
      cpufreq: s5pv210: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

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
 scripts/dtc/dt-extract-compatibles                  |  1 +
 13 files changed, 28 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


