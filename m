Return-Path: <linuxppc-dev+bounces-14968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5DCDAD0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:13:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW6546qWz2yMJ;
	Wed, 24 Dec 2025 10:13:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486233;
	cv=none; b=cwBt/U4+wM+hSrwBhevgX2Ddo6ZRY1cpCdBzmrms5FJ7fPqWhSzgAIskRt9Tejl/xLx85LPrfSEcNs+jTspaIakA6XTNb9fCYVNWKPjdw8VClpDPaJYiJuIvTzuiSUn+aGaYTpfDPVHQAOZI0NuL1AIH4iGFG3yyFMKjNEKSDFQskhTwn2rJ6iN2lqGA216m9kSpIiyDCacC07le47SvIZm3GdyYx8awiqvNs48Po4umCriGb0LrILHDG3F6DjFZNoI2QlZc5hvg4e6MSNj0dyg8xW1tONE8ZKlf0jnMrDh7Rjvzper0i7+S2gbeaMaN8ZrbgugXJABoITyIcIUXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486233; c=relaxed/relaxed;
	bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erw1fU0G1SMJT9aPU3AVvbRMcLQdNRN8Z//4VnT9Witgv+tFPOHHEXjActmIvY9tXGEINibiaJwSlPDGexx+3ALjzGtx/vlFNu2g6CG8LcdWw38Dae64pRGxUAfrDVAzCutWWdoHPwW3b7eiBBCfKqDVVO/zxunk8y3TID7FclhIO6zqAaSC5a0VroX1HRjlxKTrfM+/+6OWIVa7og+6dnaar2MV16BT76S+wLJD0RkWCVeswTuWIFFxaJpDyLU09tfKV76ya8t2xxKdm3B+B6htF2ariu+w9OrZRk3FfRMbgg8Optm6YQA+BLr/wPiwdPTRZ7V3BWzHWH5TQav4uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PGtJqv01; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoxYW8pI; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PGtJqv01;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoxYW8pI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBK45glfz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:37:12 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3UdQQ1357349
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=; b=PGtJqv01xFkPDLF0
	9sSCKg1EzX/dfThiML4tQYD6RxzIc2D0GQHgc9E5woU7+Qa4ZD5BmxFTfDwom/Zp
	/dTHffSso6IFUu/pp+5jvKu7njf7FTstNTuN10HjgRc35k1yoFcgALIkB/1I8QMC
	QZCbZDN/YTk06R+RYffs75NYZgj+u5kftGGI3BgyL8qQ+MYuvyX71b+IxVB0u3IW
	CwtPIanv2tzUPcpsOm8L7bW29WfX/DVqFrGHi9cT4ZWsPFpXoQjXlkOONgsyHBol
	OisiQG69PHI+hDVSzmfJCWIjsuRO6dStKYjFiplI/ML283x011S2Tu2nlBLS7Ev+
	f8qGUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2skj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d7ac8339so158407451cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484175; x=1767088975; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=QoxYW8pItJhrBNRgS1aYkV2D16W89m5l/vyDM25G8adaUe23G5skhb6A/cnSPXG/ir
         ktl/ULcKaoyPHParzdgssZxQ1EWcNXWvymLs/wevGTaRL8S7qYmmF0Mu9xuAqMOtBJfM
         3UROH+MLv4M2OU4oZ4MRxcdhsGqef0U6Kp2LEJItYtCOPG70gbnaMp5CZ08YnaM9tm1P
         a2xEJtN73QJXgcbBNXa31kBQDvUvgPG0EDRAMgxhn70xydg9ZdZJQPjCPO6LNhD83yoa
         381UkeQy6nS5k0GOmUHmzYYQvFEigT533k4vEri5At8Uj4A9k42BxjweYnygJn679Khy
         YuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484175; x=1767088975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=tDVF5/JmHn73OZ/UfBTXV4mBg8706cHeTngYoz48hcfQ99D6/MRwMm7e7GONQZ208+
         uI3Pn7+Y0ohRYem2ZHiFSTUZ9ka0Ousk2/z5wnRrtbrEFNLubqcdby+ERtKnKaWWG+Y8
         XcixSVsIfUVZwwjv5xMYgvW50hO5stHblkxDUE3YO8NtoOXg+4bb1zw7pHLyUQs6yEVI
         tb6NB/G29QfeEV6pwDWZOBG53iRVgugJ3mrYIv28usRKXBirV4zILplfREd/NdlteLPn
         FfJDCuo+sr5N5tfPLUWlC1I1dhPfSMwf1owAEJHzBLghgR8H+LuJzxu4MRlHUm+rzTFC
         aheA==
X-Forwarded-Encrypted: i=1; AJvYcCWsbh292dO2O3t7uaKpdHvNkkL/nCufL+KD8k4x1VX2ubna29MVBtXypHPJnOJCOFygLVH5jFtM+D58EMU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzWa4g0IytslJXzWy0V4FDmg0wXV1SMVSxOZB30RIr7S5Z0zMv
	2oQdeCa4YHNaSE1Gqqjrto9wEZWEhAAPu/Ti7CGclThyBeohT+/HlTWLd55bThRWJaN5pfUSRyf
	yT2YHCmoa4ijjm/bsboOwLxaeaQzIcycZErTIRwZTDZiyigvSgsSlD3HfwG+EzZ0WwPXX
X-Gm-Gg: AY/fxX4Pr8uKjECrYTiO8M2VQKYVVxgdymCtPMAsDkarmhEU8Ub4l0BI923LdIqgeJx
	3trl3YOOZRaSXnjEV/2ZO1vfhW5rnFbYg3yCoG/MzSDqxDjShaYb8sWUV53F8vtWs+siFHvygPS
	NdMOjTMal0fOV2cvdWaXPBYcty4c6L1llVwkRmfllegKJ2Ckqqh/9+GIXg9LubBXri2ASk5E4X8
	+UdIktebGbPHmvvo4vwmUotz+n7kgtfiwUQcNXTLqdJe3UCR111e8chqEsefIO6H5+eUfrgwCbK
	yfev+CISrWGxcN7SxnPJrozrVfVs7LSeLmK+Dj7hcSbrtpKmoIjFZ7HNti98kalfJvDdHHkTvC8
	dneoC4upLtVJidrHx5rn247FV0XqdjgEWPqQqYQ==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216718141cf.48.1766484174575;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPzfEhfDLCN2KQRG3eXv3603/QIFTCQ3fgqRQI0wW6fh6MkpQmoObyB8JOHuhsUVXPreOj+A==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717531cf.48.1766484174005;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:28 +0100
Subject: [PATCH 06/12] i2c: scmi: use i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-6-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RIl62iCgn+geu7s6HZTdTxIYUTQdth8ibomSIberRJc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi9QpltbyrI7odMVS6fBVkmr9NkXuk8yrkL3
 XkWgXt4udWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovQAKCRAFnS7L/zaE
 w2S/EACN3KysLT+Ab5yj5K35LkC7LOd9tZrE/a0sLOrsKkOjkbjUa099UfaIId1GKtt1/aaAzQn
 bZtc/GClmaiNzCfR4bdnbVCOVXcvIMikDvr42Wf9iQqqnRCpoo8mUXDx+bNQlo7MjKwKVs0vSZC
 GKF+3X565kuPX31mKr96XKGHfsHSCWADBDiSR4kBX3h5vgQeN0zgFPq9S9MBTBDEMmSfHtiS2Eg
 R/O5ZJc+6Xa2eElqXm4De1R+zF85mV/Qu3xkpuSFXEWWFZhrCd/Ei64B1WJpo5pA0cc4Y+Lo8ey
 gIdKhh6SkCedu9ZLoJy+3fkDCRrmC+vvtlu/nb3ML0x8cJEfNehgmqTRuNBTuAujBvJ+PTc24V8
 PGfeAsHnI7pMMHFbjZXKht9/nQ/5DDPtWRMc3xAXdTmNetVRcZqeaplnBfr06ZJtCg/I36MZcUE
 QOyAsPM1E91bToi8GsL5jQlpfOusxgAozXWvj7l5DE7mo1AEXBsGthuECijJh44aKfymlGGRvK8
 z3cOUlq8lItD9ixk98dVGmGPYFvkhxl1WPKBNhZ7+wdB9GFywUHMR1SKCe18iO1LhrvpgzgYOSR
 4wdpgP+2B/dPen0U0hk+ZaNGKeQ9soQCtUpUwkr9ASGtDIF3vmVtCxkzoCIM2wyEnK8iAuQGW9M
 FJMCJ+lgq98p1vg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: arE9YSqHw6OzbuU4VhdEJwj8D4w1w3ih
X-Proofpoint-ORIG-GUID: arE9YSqHw6OzbuU4VhdEJwj8D4w1w3ih
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a68cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9lVwuTDPJJf/
 lzG6lkDrs22fCD8AC6mR4RJ9xMZ4VjSxXyGY3/myPh/Uqu9B0DLxkoks89zw96DXq/FGWfMl66g
 BsibpLVHqYJhtig6lpoKrdV8OA/9g8WqeDEtyfWcfBdLX2ka2nlDFHLPwm2NhpvUijwfGUT7Dg0
 jc89DZ4ft1M131doJ5egCUcM/acud4gBMNqEEthe/JKhDPE6mAQdX5esExuB3d5l3traalocEG7
 yUb3eY8AHaNgXhhH6iczgWRxAm8glMIhm+f/anFaSkKi3A6zo8XvwJJZ5BV4maKZ/mGJ0vm8oPD
 OIeMfG1ldTsa4QwudqI8Ry2vif8OQJOU9H6b6ncXEu20gUbDI+A0Aql8qXExEfaOK7xBXKwbg9b
 bFSE2lScrX8ns9bCLv/S+utr3INAZxMn0AIemJZsffFO8fiJn69R1k2a2N3LXmFI5H5LgxCtTgj
 rIobso3aG1Kuiz7myZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 10a5146b3aa5fc6edb4c2f3e1cc57750041b7087..96a2cd70d367f485d5f230be4eaf124398b0f239 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3


