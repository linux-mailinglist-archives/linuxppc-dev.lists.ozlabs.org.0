Return-Path: <linuxppc-dev+bounces-14970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A4CDAD19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW7B0HSKz2ySV;
	Wed, 24 Dec 2025 10:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766484547;
	cv=none; b=Jao9eWpeMEBDvrc+yNV8MnTelTl31MKxUrUFqpGn97F/SIOb6Y+uIXrzbjjfQoeHM0NCto534CpokfdLYM6Ffi+VXYN6RTchhoP1AruHiCphuOsol7wowwZc63oi1z35jYN8DqvmIa+L0aK6NoRyKbBmlG7CZEHnAseJI4EzxrHWXzXL0z/ZUS/04Cx8kJ5FmGK7bAe8PzMdR7ge5rDUcT0PLfoAjyQDa3nEZme2ihqmYLZ4fOIJTyywe/7EPFk7UXbslHGyWaMV7M692IEF0O9NyRwGRgZ9YdS3wYO1AqRY5fHqza/kjUHSI8S9T0vi75V4RfGHt4I1tx2h4Qd6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766484547; c=relaxed/relaxed;
	bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ad3GudomaeyIMq/9h9P5GtHz+/6NiG79IT4gnGkAV7CsoRdCz4fS39zHmLVpU67hpDQyFizQEY1NsSsuVF++Ror/Zynv4R2V9B7tHexQ2c5oNGMH4L+v7J7HjZiv9DdGzkAJ5pFYE766x51Aws6q+a5u8kiQElsn1qnDLED3wUmnKVOcJ2CJCYy7K42ggVRgJPNwLPn9QLR+2kJ0fUnWbH5ujkgs2oUJ+AnB60qidipZ7slX4zta6BQWVUaTo2XvEPjw185+bgt5RcO9J0NkI6XQ+7mL/OniScLMkXFF/4+czu9bcJpJA/+kB0Qume3mnm/qKnUHtR1MKLTmzQ6vAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TH82n2RE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYVW4uRk; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TH82n2RE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYVW4uRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4db9hf5Ncsz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:09:06 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5N7lb1901938
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=; b=TH82n2REmZ2IrdP6
	aoMlqIC7IqTaux2aOxGZa/nehnemTyKBWoO/gusPvJ2i7kBV+sZ7BpNP52dT/BiT
	bV7249MTKpyxGvm4/W8xBHEIIcmu/cm1zPVrYCbIRLjMFDVzJcZfb651hTpYwTgA
	Dm+gPtTlM199hlN6zaqzsyLoc14I6hrs6QVqT4Ntb6CJ5Ww/S6VyuDy5cXqDf110
	Me9+p2Uz/ZYGIWv0ydKHbCOAHOWS3+k3+V78hz26BO1gAJ9Mirzxc9qQhZ1aKthb
	DWjgCiddrmF5NmVOpqsRTeBGjlkKSk1rBa/Bl4BDWHcBLjyuX5b4yGMvGcifXkpr
	Dcwyhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:03:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so130841891cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484183; x=1767088983; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=eYVW4uRkTf59d33ECk1KdMKrdVCiBQrJcSvKqxjJAnxw0I1FLD8oL5yjFF/K06sub/
         M5QUN/DUAQ4elZNrjDgQh/nqYw0kkoNtO/h0dQVc87kby3wWvJ62Ql+cS9f0ok4r0Qbn
         SVWn/MuprlpjZvU2NILPpKfLr1Y8E1ncflsf8l59yDCrpGtfAes5xnw9qGD8j2s5sw2K
         SOhrjTUEOJ8Bj7tDA9Pe2Z1IYb3oxbvCSQjclzqYlJlZy0GYMnldpZfz8aRC6048Q5S0
         CpjrF51OBITb+mwRRu++POjBmUlkdt72UOsSQBreB70qtuU+sjZoiCeqRFZsNHKjqOlD
         HlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484183; x=1767088983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=maExhoo5/ZQf2oMVFGRXHRd01Emgfr8KrNUeXirIgW2LQ5nYTwdfVlJLPYQNx0eaMg
         UIV1YYG0LsozUQEiC4sSojKWGhtryFkO/lXLNz9PTu6ak3TWPWmqBZV04egSFXffgAHv
         eJCqyGvkHRGAvv7tyiZ+45IqiR13ceL/dxxgVJL+fq6+/YmkBzFMte1oNu2lVOwSpKkg
         AMlhPsnIHw4FNXMJIY95OQ9P+2q9RZ+lko2e5iaY4Lk1DQA58v+eZdEfVlmY60HJVsSm
         GyojC0PJXDpxA4bo93ioQLuEn8Z7qAoN4PfQFbpb8qLSoGiVukZNIbO2bNpvYhR7ZcOv
         sGNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMclS9MCGgQuVO9KL21Hl4ptE2b14/sgZdPF08Uuy+HdVAAxFthn0JbFQHDXvDx6EnzgkC7rBjhTRY4X4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHq9CmLYZ6GYPCj24Og1tdDgXP572p/Gmv5/y4+eMQ1QGMVsw7
	aG9wUunSYDty6H0ox/h+urM+c5TEcPixPWqHjo4dKnC6zRhdKNio2fxCTuzOAcEQ3WXqoGoFYv4
	4lnNMeupL/YlOLKarqzQIKn9VvotDH2F8taOhDGPbzaM/xy9HRF+CpBlJw4vHpHZRL+M5
X-Gm-Gg: AY/fxX6ulYQc/Sd0J2lvd1LZhcve71n56i/F7pl1HLKSHRkqAL7kh7dprN7SG4PKML4
	zkx+DbbeHc1GVX63zRrnrk1YSM7/YDgkRQyl/5Y1n/Enu4K/D2sApT9ZfwvY8RsVC7eqaq05t5m
	Ncz5ueX0abFZp39inhnt2sohzhvu9OzjijBQYt6rPsm3QwhvR8NLBlUWmO5u6hItPqMCtO7XZM0
	cH8AoEyNoevJ7OuUvO1OgmQkDUE9cxuQszBYK8N6oDVIchKvzL/xnpayaq0o7QlGMSMSl41mGT6
	bvdwMIVH7VZuBNVBiuD7MNRi+q4RwjEjk8Uk+E/h8ZLT4VqEjSVKagsKyTbUBl0aRVn5kuKRX2s
	9aamItdVYjxH3je07gF7VGP6e055hsE0RiZyOOw==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216034281cf.27.1766484183610;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAMTJ8pU1YC3SohbnEGLHAGZHc0AA80x7fYb578qtWe2mL3hTCo/7Z/yMtAiRHdU8xQS7aHQ==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216033741cf.27.1766484183148;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:34 +0100
Subject: [PATCH 12/12] i2c: piix4: use i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-12-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4FwHimgg29jlntM6pAuTRFRVSUKHlsg/WMwTYloxTIE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGlKaMKjcyICb7c6UsCyrP1wlptqZ7FtRRqRMa9ynrsk3cOjk
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpSmjCAAoJEAWdLsv/NoTDTa8P/1PJ
 3J38Rsk8OVuFFOLjY8ZAaeAQBKgVC7sJzw7nbu3V+LQJH8+ifuhdooUdi0IlsXt97oMXa66FcQ9
 0gw2YiyNXkmud6rB3GC/x3c4uNK0wKq5spQJcT9aOUa8u/gZ4PPK4MfVSiy/Fo4YqRJURYxQM6s
 dAPbGdd7LynK69IU2Nl311cKRmBNscXNzM0Z1b4jOl1es4R/vbZA4pfJxJFdRoO2H8q0VEFbN0v
 zD+s3ZeRxYP5m6qWxnaTwRBrfeTH+Oos2g2inIEjSt7l4Xy6HZS5nefyfe8OWMEAxUeXjHs+bSa
 r8XLlsgEc9MVKOe2en8wvIZJfF/QZ6jd4xYcO+RJeORm0HzHdF8TgdU6oOgV8Xamhe8KsWMTV2h
 sNWtMM670n/wlBYz+kEBJ6YcWwL2Ecxu2HxRjvfDvCDpgXzBYBoV7ZREMO/10Ougp8Eplr3+wDs
 TCuxhaS8c3fh3rrA2IdE+z9h/IRc/F6os0IkJ2nAopuP+KVCoVz0X/pTy1kn84ukScDHqwKxT1s
 fSFx7xuLjep1ExXaYPvblmMmZYe1+UOQIDYK3cIhvYNaOUlyWNIBUQ+3Orngcn0vX/yUxGPAsNK
 lcfS+4siyLmNRv2Xhqgdtj4r2czS4tH0B4gH++Tezd68ywjNiXorRG5zcbWFFU+/8GTpHdiK0+O
 8TiEy
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXyYwO6RT2ExZH
 144KMjiRMTt1OlKKyzG/sT3L07z87qDPczj8kUqSAQFG/Ag+EQjCsU0alwg0ZN4tBF1gFk/9ZS2
 vev7kPsQPU3dKd2AReFM4/UyxWvSEN2T5fqC6ql8TxKrKNJ7r6/btZaYjbrd1CCxQN1Trq/BFQx
 Ba4Z3a5IuAzfiWtZdDXdTe0Dq5JiYFbZ5kXMwp/PAC71PQc8/Rgi9cULq4xa6GKoEq7nN46AX/K
 w9CFItdEfdd1xTf4G6D6U5aISLXAPuVZqH18N5kmvxYWJvVAA62FRtEFzhPJkEV66XDHjAIpmCt
 N+s7/CJc+qwSu4mKWkuMhVmOTSB2Ladt0U1EXWvq5pnvjE1GlA69daAmVXIDaeQXXWWlGSRGMnz
 opbBxFktLOV+LphadUhNNlJgU2zQb8gtouzytdmKf71Xcr/5T7ErOsEZGayrSxhv5ddGZ86Tqp8
 bhFTOAZOE8CdvCxLHyQ==
X-Proofpoint-GUID: t0oZheUKs1b59J9rJ67oTUaEnBjtM9DD
X-Proofpoint-ORIG-GUID: t0oZheUKs1b59J9rJ67oTUaEnBjtM9DD
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a68d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZTA4KjZG30Bk9MnLWp4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
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
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ac3bb550303fe5893822af50c385004c9292e695..bf6ce6b4bed3f4ae8aa392c68189a67636c01bf9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3


