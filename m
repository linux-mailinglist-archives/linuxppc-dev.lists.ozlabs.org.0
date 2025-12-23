Return-Path: <linuxppc-dev+bounces-14967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C5CDAD0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:13:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW5x2h6bz2yLg;
	Wed, 24 Dec 2025 10:13:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486280;
	cv=none; b=mzfhj+OQP77/mt/ULuy3JvzBjc+3fjWH77YMaGzsO1y8hI9elbNPGuYXztwfLlBJ/QExcSscaZ8YndFtbdGF3gtyAw0zsBb0gQNukkdswwaO2tl5NSoEHvQVyL+aDZkmeSvygvpvMuESiY6h+EpbgdDVQjdd0ubWDBpx4JrRrCoVDMrvwFlqpG2DVYtcOYNN7XmQPkYXKAObMCxm0ZuLGRSSW/2LydSwPI5kANORDepGWLZ40mNGwkWHCzA2t88MCU5c5G3CB/oNje+uklU4O3t2wvDppGuEeNq4jhd2RRDEro5jEO9uK7dJ2cdVNcvEA5Q7vSUsZTajQf7Mrp6bew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486280; c=relaxed/relaxed;
	bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLAmnP8Tf5BE+UYc16rOhynnxOjm3cCKcXIPXeEbRnaQgIYvdGKHjdahhhQEwVnUmQHKr2aItIiJqEyx4WWUFBQygHkQaaoSGeFQDgYI/5qz5YuLDS3pa/eEnxuFo/j33Yyyxv7+xDiTsq4Kp8tLhwlbjzcIWBGscCm76G/rf0pM1kwRvfnCoGvZ8NXSYnTtJ4FXTY5bhRoOJgql7e1MlnLewpZFGQpQSAGZMhGl+fDysze9WkndJfd73kTS1AHMn25Qe7b08e+GS1kpGkjX9nD7t4JNFPek0Bi6bzXcMwt3ISFCIuYAhaTzlDG/2mgO0DuX+0m8GilhqU6fS3oKmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0SHin7k; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMDOEkaH; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0SHin7k;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMDOEkaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2111 seconds by postgrey-1.37 at boromir; Tue, 23 Dec 2025 21:38:00 AEDT
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBL00lJPz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:37:59 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA0JI31570353
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=l0SHin7knMBp+W3F
	rjAdrwhhQChHbWtqrCAp+evLZYpItXs6dFbvxnWh/YJnN33zWOWoJwp16SxDMxiY
	I92683Sva9KMNIzsZviuWwwIV4/12Zh5Uc4Z/Uth9R68KYSi+Mse7r/w7UdbaufW
	j0nQkbwyAQYq3phTTtVkZkPZXrMAZ9nv2sEjq8Ig/tKz8rAteoZfLnYpB9vzy+7/
	wN8gjtoeyhCBWOtzoGbuldEjGceBcX9WF+FAPOWHfP2IeHXVLlwwoTnuHHmU78NW
	Vnc3Wdl8cePqRuy+tUZHeNwsBU40NKzSC2k4RPNjkFd4t0LzXuEe8vIjtXm7Nkzg
	zGUvtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy376p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso161431241cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484177; x=1767088977; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=GMDOEkaH/tA+kT8vT2FBYO04vD15QBt6wOE1Ow+Jafedq72Y2iXVRO9rYpoOMYvH6x
         rDHUJwEQRRKmkqw506KCBJM+LsFoTixaHOPBRJ/bh0iKzu4OyiO97e7xEArsPxP1ydzL
         //q4G7t3v1itK9CqBYjaP4H20HDojL3mOU/iqNZMKORXpDmkBxse7o8yQeM1JqoAqjn2
         bzH7CT00IdButGAA8PE7xQP9iDXKXpR3zBGwogJXQVX8MxAQayvacHzhy6Qz0aPf3I8D
         GOSblu0AawKCjlNSjO5nKbJCf2ORpVJVOrXNq4y7BGDz8Gix60jYLeDS213iazbKRj/Q
         tsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484177; x=1767088977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=NiriAVDJQ0YE5fjXtruhi69AG+n1NCJ6iHUiaGCfOk8nJacw1cfCK2Z8nWnBz2GSMi
         +lLrA54aQboQrb787d2La2dTT2osTd8XFJiqcCsC4IVe7rxBNqxAzOwOiwSIix8zdS99
         16qgNrxEDzhxBrC7ucGIZ3sudlvSEsfATLDrA82DJNXo5ulwDSR9QSlMxSEKchPs3Tdr
         ZZXjXKvnEPAEJvAR3cwTeIWulWu6kW0XWvzWJBvvOXdbZoi6lzFGsqDwEy4ujYI8vRl+
         X7K965UwNcX5U2M6rnAWr7sLygeYU8LoljTdVTA/kSSfSKQ9Jvs7rREJY6iTpQ+gRSoa
         LgnA==
X-Forwarded-Encrypted: i=1; AJvYcCW7uRwZu7qZ0CVTNNAlJ29QVV9BIEF+RY4vOq6m2/pR55HZb+evdrEATUaV6/Z3lDH9pbssP+3Gp4qoV7M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFthJTiA1bSKlUGFl1+GPcC//0BstWfZPHByZwSdnu0c7dcBi3
	ry+6nGne7U+uggs5DfsiRv6e5apZaX2HyXvFM3zKvquKpCyAKosjRr7DdYvs8BzIj2Bm8F38l99
	OamTAHHmQFX47PvaoOSA0gLdPqNOc8O2Fd6eYcpc+54R5kKjUNGkTnBrlhmCckGWxx6+0
X-Gm-Gg: AY/fxX4I15+h6eMwz5YGR66MHq02ePfNie2jv0kwt1gfrwK39xFFNtoAWkMobSRSmIb
	sol9QzOr6sRwJXtKpvQ2TANDhCDiH4TOSgjD8+ckzlan1C3wbaMYCFMmmQWfaxhV8LHHbqMkui6
	pxTlCuytd7amc0Dxr6/YMQSr235zMhDSwOHoY+UW4sxBxQsPbDM3Ie44M1RXASBQ/1YKhAY4RX6
	ohoP8xWQfWLURUY+MPKeGZuCDEQp9KhSjn6uJ3rD7byYrZ3OPOwUqWauYFoD8Auvx6yibd+G5Eo
	78ij5vUq2y1wS/fuA5+g8SyoW/tYcRb7v/ni96YC61wTLOjexWyT5i3pAKUsfzpYU0ZUoSJV4dt
	udqZBIfQFfwXWTSuMB54EcjiG+cli5oO4DH1Z5g==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr170484281cf.59.1766484177574;
        Tue, 23 Dec 2025 02:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqtT5y76xE8az8rWmZUAFSiMsbZmM7GNLUeqGPBNc8CbOBdHosyOf/hmpUH+aL2r9YccEblA==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr170483931cf.59.1766484177013;
        Tue, 23 Dec 2025 02:02:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:30 +0100
Subject: [PATCH 08/12] i2c: powermac: use i2c_adapter-specific printk
 helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-8-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi/bEQ1L9OUWygCY0o7CnHkaJ9YYNQdACOF+
 T2aISaVKZKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovwAKCRAFnS7L/zaE
 w+VoD/9tysA1McH2iqmTqnqT9TNdtCA2efLxLXzIh07p/GuadPXYPv0VYjpYgtS/mnYXnG5kuF7
 bqCL52zltH4UM+oeMdLZddKTJWnAYfzkJTnQAiiwEMWXdFstGKsWuGWKK07Ts9aVNyFVKai+EbG
 xXPXchfoaWgKDaulvUvaZOw6b2ZA8kN/cVPpdsAyV/nuP7IDz9KUsMmd52t/8J50HYV8T1cjhNd
 HgPKRQJjsApbEayChYhr1R5676oDuz7IdWJnCKatgAVzQTt094ci26dLCVJ3iS/ungYosrJtci/
 XWRH/D8P/yO17XK2v6b/GfY26/whonOZ0zLpAKZVz6mIouwgwdMTnM9zm4riWoF3A7QF+XtHps3
 sZKwAAgSl7tkOHHv1jrG6h700Z/rAy+IvVLBMGa/DzTW87vqQJeFJy0ssGFhY6+VHCFYkzk5vPs
 xaagyxWZ7dZeH5cp4jGzaD6m6/WYi3YkAd2J4ZMeYJsh4f8SGdzXQc60GqCb3AiVd4sqXBgJcuf
 YUfHp4volrryE9S++6+BNve8L8YRmvTU+oVH7lE8WFZ5UEf/F/W956xuTRE+kMy+j5fGOp3oK98
 dCtIPF4btL+WEy6jpoAwpp6vAPlyqcO9Xp9Nfp5/+2R4l2E4PI+cJ6Ax2E1xWd5PvNT0Gw1MBvl
 iOtdGmtZ89jEhYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwJbvSv0WsNDs
 WJHevIQqCDpB4HbVn9VM73sF0JHyQCdPV8OjtEWkWdp45G3b71jqJLxZJbgxTrJhw1NTK7vUFMx
 dfANW86Xccc1Rklz6kfNhKXjsoGMDAq3RE6TMbnYQn4RRiSra3RIbByqLnPtw8x46v1rvicjjB0
 q2j6Y32+53puIe9v+J9yi+dPmwPEKFEULtLycRab332snoDxnTsYLAK1Ua/2Ubhl3z2f3ufeNPd
 p1SSRrBuoluRNPNmi6NJGetPE7J1If0k3SxgqaaNpFOV/n6lLUXDT5hnUXTbBf4qWZEc86UIl/e
 wn7gec5vSMQ+kidOIa/V3flLzmXnkkrmyea/SBu2Non77cImg7R5Inqz8FnFyb3HuVXYWeURWYx
 9wjw+7G+luDI9uMl8ypwCvDTdl4Nxg/22AcomceybNYbYhwjLemJZcP3w7i+fZ30fWz664sQ5Qh
 zyKbpPsmjtDz+4/Pdig==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a68d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3Ru8qIInIP0A5ekXGvTOybhRJKmnN8wy
X-Proofpoint-GUID: 3Ru8qIInIP0A5ekXGvTOybhRJKmnN8wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3


