Return-Path: <linuxppc-dev+bounces-14973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DCCDAD22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW7z52yNz2yYq;
	Wed, 24 Dec 2025 10:15:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766484485;
	cv=none; b=c4kzwD95iDJ5ogLS7x8plalWFU27E6gIlsH9qsxLwo5A3kKPlak+itNuO9EZSeu+I44pIPzniZjRhszxZcw52V1Y2aus7tlNusONEDL8zENIJ5D5cKVAUrbz3q84WQnnf6UaRTD5gaeH7QWN2m1ZHBeTZYJtVpXM93fTIvNEoKZ4wCtdd88vgyivhJGD/bwMi4hDJ0n9hNG5kFiwLV2YZAm80NrQ+ZZilxJDkMCEKewntNpl9vB+zayG81w90Qcg+0gkLmef1/g18qbL9O3fw9DJkN9JSYnfHfyHD9LahUd1iLW1wuIGoOy183V0nty/KtairvweRjKFuYh/jlHr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766484485; c=relaxed/relaxed;
	bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYk9BqFTLe30dAc9CFDQRGbs0EXbZ8HndV/0je5v/g2X7s6fa7B39LcyfBrCewyvdDCwUx9QvRhnLPkXAhJcUK0HIKN336FlITQjL1r1JtHc7oNXsaRWEt4nkN7ibip44OSb4ounAwN+tcmHCBQKW1LK4uYetyGjFycDAl4iO3olGbyOw7QtR/8J5aqYGS8HyH9U4cf2RO9jcSLqUUiGmls289jJN/mCYvwxodMz/QTv4LSwpgQ2H4yZhTQdwatfPjZnq6FMTUYR7NLQB6ZVs4zPkQf1AgmpvLzb30UTqtYmuB6N9n6d8cw7swALg2ktrDL7nanFzkSc5EeasrVmLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgtVVrCR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IunXRRJI; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgtVVrCR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IunXRRJI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 313 seconds by postgrey-1.37 at boromir; Tue, 23 Dec 2025 21:08:03 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4db9gR6z0mz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:08:03 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9ijM12041152
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=; b=lgtVVrCRDEEhbVLA
	bu1fxLTBApMnXU4Io5Rs7UxlEpP4lv20AZm80EjrI6PAMZvpCBjCN/RrpU2aydOL
	g0vyT5gMOrqNJiYyX+5UjqmHbGn8dMJbc8BplkwFup1dzZnaRiKrxV9wmSjanO+5
	DAV8tqUDtGipXSWN/91KJm2nSQtUFCtkt+YZ4M8XDjdSA/Nrb8pwgRj3S1RPeblX
	O2ENydHSe6u8kcw6kNgqkiKc9x8rPElPzUPsxhK41Q0bMN0QMNciQW9HOdMdDHzq
	QZlmEU8TXuKRxRf76vttD6biAOOikTeEIAE5DoAFlKqjR/y8mG+ajwHT1pavw7Zi
	aYLMgw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkayh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:03:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b991976so115630346d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484180; x=1767088980; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=IunXRRJIhHQWjoiRyqW5dySydKS7amHCZsmvAyK/QDLiR8SRaS9iVV1Q1rRaadNDTe
         fIKRGSHS9G9FIaAkiG30Kofp4G9oKQq0cexi0nd4yZEJDw0i7287APMHDyi0atByclqa
         evdf3HRTSjQ2kdppmZ1V+9yK6qa3ftgGnsbC3N5tlr1YSJDyMYNbUAFAHGJLzx+IYt6b
         Hu/f1GD1kzPLLGZWdOcnDCu6pl0WBNCoSPft0A+LGIu+3BnvaZdSMq4rnRbA1qoBYegX
         FV+vbVnWFrilnO2OZSo3ipU6L37WraGifB+bRMsrQWKxMGjFizJwyjgvwRP5SK4hwdNq
         Qmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484180; x=1767088980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=jamxybiQ5R7gYJRCoe/emz5YCkXaTLE0QQJ4bwDqogBa8p7mnd08L0sR3KVdXE6cFa
         5X4WVtaMEZYr9cwqXlUYbUCgqDACEh8K5mS/wI3GhurNkcg0+whQ8nqD2F9meF+WOANS
         MZBJA9ka8figdLFBaAvX7bx7bM9jidhhcbTtOfLrPCznI9BosdmxCv9jZcspaMm83mpf
         44hpucmztBwetbvozoNxZPJ+0LJSSpqX0T3rTwthBYONOfGEqS+P8kf4Wn5eeE/jn6f4
         BRqeemhTSTs7KnLpgRiDsVSrpi5hNrxXRoe8ixstZgV5pfqHb3zLD1bkFbjRJD3wqicy
         +Dfg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSHOODQFMgKDMtWGAZ/0GAVEa5+u43dMLnxzOCWAXUMWx/K2ezZny5WBPOsA87J7NXIT8XoGbGKQk1tY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbfWinjgW4Z7vemtk8XtPcieynPN8jn7WEmfRXWC9HAXOc0Jqn
	cquZnbBUFmFYPNWKa5z6PRys+kyQHnoeG2mQq0WVbjyt0ZGA50WKigtZbO5VDgiR4i80OtgINcL
	Rd7hNQBRN648I5aD/oRBGT67kq+ZfXBNAbngznAKUbGRMlGrq6HtTb7z2gITS+PQQEYsk
X-Gm-Gg: AY/fxX7uIbKssY4min2cb8VzFTzk4ZVnfgm54w+nSLs+qf8qL+uBVkJaG1PAWCPbcF+
	2Yeg2fUFLmESr1jSsh/80CGufiCAFkbWoyvMhy0jCspRvlw25m3vxZTbspHIKTm/0kBa0vCi+Sy
	uOSnd2zhd2JJewDct/jzj23CRrFobxZqU+D5zMVkcvSeX0dhTHgDmon2U6SzduuP7U5UyTjdCdT
	bYybjb+jEYfriBPCQ04ZMWXL905aAkLiDIhKPr+5IIDuL5m0wgs0HmzILlXEJ4Yqsz29/srANRR
	30PUvxPSzMhQe30HWHRjm7B0tBFN0AAzb2MfCNy+dnUpAcPCm8XVi0SH26zAIdGSbXHWId7WDDp
	3R0UzaMeANO81JMNIn99u96Yw6iCwE/p5A+paqw==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055491cf.50.1766484180392;
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb/XwjqmlNu6biskXJYdXx7yRjIVunYQjmGPYAWmA2yv1ld3r5jkFpRaOKuHbmJJD/SAxQsA==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055071cf.50.1766484179952;
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:32 +0100
Subject: [PATCH 10/12] i2c: nforce2: use i2c_adapter-specific printk
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
Message-Id: <20251223-i2c-printk-helpers-v1-10-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1RcMgKhoVIDH/uvlkjR4k8BRDeSqy3Z1wqmJ/Zg7uPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAWS6dV2oSrIJN/8EGc+7W8i9AyzXFZaPPi
 mcV5IzVlFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 wy0dEAClg4CncFPQN0S3c+U7UOudBSZbQgLmP6HOhyUtZ3U9OLbCsKadAQFgEhSwX1jECTm5dNF
 0RdoIoG+fF0GCw60nKZXgiUzxNUalzHyZjn3MgzLiNqR/BAr3Fe55XuV4sKpYT6yU1xAZ1D0AS0
 WB+Cuxnns2XBnbCeu8KX2+jXTE4EspmlwPkIwNTPlrAlof76u8Fyj815z/OQA/0uApNYkRudhth
 8X0O57dlCLpgrWcFelojmLpkvLBhwA3ug9kSOZS5GlNWt9tC7n8yEBuUGnu8+MG+yfjadZSdiGY
 FI/2l6PvAgagfWA6020GUjaUrTrdzHQr57t80WmhjeCdzxZht4XNHlQGykb1O4pHcC9FQoSsK1/
 Ua5Ilo556Drv7i1I7H8wPdl3MyXIb2mphWJCjOR3kD/v2xvLIqwnApfjb1z+6ag9RZHTuZBzsch
 h700sSioPBCeNDSEl8K/MX2Q6LnXgJHDfoXh0dQWUt0WV2kziDw7ZQCFJMAL8MU11fniAfWtnLu
 0zkk4hjESymk+Muoy340vMIrgjGBzwhm/KxR9h3yN2OPcYeZBQ6RTKGDc0TXwrufHCZ3m2YcYPU
 zB8cbguyyVBO5QUmGddwtTBc2xiWqtP6i75lMrsX7aWcquTAWMGnXWUt2zTV+fbXqmMuyOwazC6
 QswEw5+ooZn9yfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxBhFXfWjmEZw
 19Rn56wMC0jUuo7Vo0GWm6kr+VXGahcZVzk4vYU27mQv6k/TxkJ09QoDrUfZYXdX07FREayesbk
 JPz4g7ExFFayw8rUQHrtA/CfiPNJDsbUzTZcfKi4lO8l+IcrphXxTygpcqbTpwgFNi1BodQjeN0
 3jWLvOh/C7bsA+QDLoxFuXT/41PeJv+z2OvXjmhjr28e4SyDDQ6qU1KBSCknNjjkWMSeZsthkfm
 s0dI27C/WrGrn2uUCj9CbclJ+zps3FWZ+iiIi2gI5PAnQ+BJC+vz7V5RGaV6zC/PSUGBy69jnr/
 47KUeYxRbePhfng8LHgAQQWIpDrBhLc0oqGZ6qh3xAZ1rhUO87+Gqbgf9HROVX14Frfs6MOPQft
 0pdpixLLmhZrNVNvcnlFg0XBj3gjeQqZd+eyVdo8nnfESC/RitcgH4rNi0yKGsKV+mjWgDMAn8f
 uv5OcZ+Ir1u7GJk0XHQ==
X-Proofpoint-ORIG-GUID: arzvVMTmLJ6uOCvo2ogWKXcOLe6BUeWF
X-Proofpoint-GUID: arzvVMTmLJ6uOCvo2ogWKXcOLe6BUeWF
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a68d5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ULAvDvZivfA9C-ZB8fsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
 drivers/i2c/busses/i2c-nforce2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index d58a308582e47650238312537d2d721261d3bca4..2fa6f1dbd27a92c2d67915775e588e4bab675d76 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -123,7 +123,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	int timeout = 0;
 	unsigned char temp;
 
-	dev_dbg(&adap->dev, "Aborting current transaction\n");
+	i2c_dbg(adap, "Aborting current transaction\n");
 
 	outb_p(NVIDIA_SMB_CTRL_ABORT, NVIDIA_SMB_CTRL);
 	do {
@@ -132,7 +132,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	} while (!(temp & NVIDIA_SMB_STATUS_ABRT_STS) &&
 			(timeout++ < MAX_TIMEOUT));
 	if (!(temp & NVIDIA_SMB_STATUS_ABRT_STS))
-		dev_err(&adap->dev, "Can't reset the smbus\n");
+		i2c_err(adap, "Can't reset the smbus\n");
 	outb_p(NVIDIA_SMB_STATUS_ABRT_STS, NVIDIA_SMB_STATUS_ABRT);
 }
 
@@ -148,13 +148,13 @@ static int nforce2_check_status(struct i2c_adapter *adap)
 	} while ((!temp) && (timeout++ < MAX_TIMEOUT));
 
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "SMBus Timeout!\n");
+		i2c_dbg(adap, "SMBus Timeout!\n");
 		if (smbus->can_abort)
 			nforce2_abort(adap);
 		return -ETIMEDOUT;
 	}
 	if (!(temp & NVIDIA_SMB_STS_DONE) || (temp & NVIDIA_SMB_STS_STATUS)) {
-		dev_dbg(&adap->dev, "Transaction failed (0x%02x)!\n", temp);
+		i2c_dbg(adap, "Transaction failed (0x%02x)!\n", temp);
 		return -EIO;
 	}
 	return 0;
@@ -207,7 +207,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-				dev_err(&adap->dev,
+				i2c_err(adap,
 					"Transaction failed (requested block size: %d)\n",
 					len);
 				return -EINVAL;
@@ -221,7 +221,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	default:
-		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_err(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -249,7 +249,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 	case I2C_SMBUS_BLOCK_DATA:
 		len = inb_p(NVIDIA_SMB_BCNT);
 		if ((len <= 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"Transaction failed (received block size: 0x%02x)\n",
 				len);
 			return -EPROTO;

-- 
2.47.3


