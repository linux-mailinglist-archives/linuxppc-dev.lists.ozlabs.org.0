Return-Path: <linuxppc-dev+bounces-14964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9CCDACF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW5B2N82z2yPR;
	Wed, 24 Dec 2025 10:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486926;
	cv=none; b=QIT2qlLqkI67CgxMe2q4Rw1Dk5CHzXvs+/LMIrzNwCaOH6vT3h5dhvlPTld/KVB78NUI7qaQxokVtUiPWmQ0WemFKCmBe9GsYlyvJli6hifFRNaiYECa1rf+Ao/8x4sZioNWnPQ6TBKJrWlJp5AYh/jfhDIoh53vAlgcNS1fh4oFBCMcKD54J75XnK64+YbyL9/aZtFVxUgzxUA3thbqjSWtLayh2Ns4dOjzXAUMEwtmWKWEEvIFKYymAotFKpfi0ig6k3mYoqf48P/j9JnKsJ7/tq+uUD1m9mWWGVEQCWnpOk+TvY9adMLrlZ8pXdK1S88u65LBoD8XGvOtBZBHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486926; c=relaxed/relaxed;
	bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muiEYOyPMsqA9DHnEMA9+DJvueFj34i/51+jMRjex4kXFe3XmKCseQ3wH/IyMT02VU/s+iE+t9aiiYLhea7Aut/29+B/lD7Re0tzMS1IpihHLpMf7+M4P+A85TRAw/yVBRUt4sbrm/QQkxcX2bxESmY45xR4oVjgJFwXGHWOR7W1WWLSEKhdCjNJFS2rNWJ6Nf/DTvZGzsTascDc9xO3s3TMF7n8ujADvtZK+u01rKnjrk2KOAFiZBuboJSkJx9qQJsKutGcbhJ1CyW8tXz6zrkl4z0vD6MlCvED5P1GMDCcqShBVB9JhaRdFyfpCMS45sfYOuM3y4pTjANrNUFuKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5cVDaNp; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7vDpSMp; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5cVDaNp;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7vDpSMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBZQ0rXCz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:48:45 +1100 (AEDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN34eGT1894808
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=g5cVDaNpMwXsImmJ
	gT/ZfS2PGwp+freHknl+WUVEuhaemAoe9mzv8tv9/oROdqOtSjsGfqMYpjgPG2NC
	7Yo/t3Uk06b8FEwDqwP0RjOph1mkPBn8SnN3ZHCWbGR+RfLkNQIglZ39gV5OVkgo
	8hZ2q4l/LHjQePZp34mfi1q8zoitHSYg8Zl4pgJsWoZFK3QrdRAcPfu3iAbdSXjm
	SKkxVi4Hujbk9GZkci0wHGH9iLVfvSheJnA7sd8Vb+qoYG2/f4O07d6CqhM1kV+G
	HTB2X3aNLuFpv7lKmdFWqGVbDHtRHq2n+MoXF8KJ6lPjzrKwImcOc6LkPfi8fj+T
	68KxkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takehu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a5dba954so113227091cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484172; x=1767088972; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=R7vDpSMpbTqWzGBrc79s/E/rCAdxNJsmre0ggYMiKW3zDjxyvj6u+SFyxVWz199KDd
         aIPiWOjim22Czw5I1dcSsjJDmtom4OTJFfSM+MQsOHo6lFXnukKAOjfZ94ZaMm3U2DFZ
         Y7Cv7wOXxPHmX3iyXJ0xQ+3nOlcDxF9iPrA0LVZkzfqgbe1GRX0gZHKuU4wUQdxjnjmn
         TA4RojDYMwF/Qyi5ARJ/5jGGYL8HCDxoUrddwhomsEWLPgCoSbrzWyS223tr8HExD7cY
         ffu4hbANH+5XSP3/r+fnkp+G2dzChHIePfbOuqQzmQ0Ecx1g3z6FPT8KdCrwNyH7u4Am
         tZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484172; x=1767088972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=v6UJM+Et7tr3hHVJEo/XUy9Aev4r5EsOumGZQ8Pp2kVKEuVSkASgkBbcGD3dxZoNA+
         cHoi+7EVWNfqxVi6UVkyo/+dDp+ARAjlLKsNBk9blDgtHDLq+/4nc/9K7lNaa8jJer8T
         H82ppruHLaPfyB/JgEaaantNN47Y3yXyrxIfhQqnSOpcKneKL1hD1eziInqpK+yR8n5z
         Vii7L/1X2ndYVS4KzU/2mPsIKT8Cv68T+V5hv+m4ZWge2GmuHrFtwXIv4RFrLbl7ZLIT
         V2BLrvcJZ6rewKgurle67rdKQsG3znhO2o6hMUPWkNLlG2Q5SvhLeXuzqVFEaKFzTC3G
         qvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV62+BNV7jqI4G+QzSaeRG0/nGyEqTKMFRYpVOwMTS1BbC/3SZZx6H0+3391rRkF3lWra5ZS2SAJXRdxMQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNV611dUx612nIg78h0UgvE7ru/G2gPj4g9x5vWWfDBG/T+6g8
	GPN/NL7sA5G04EVoUcs6Glpxp7UcZu8o+SXpq/4jph4sHuAKaeI3my3VhOy3kvdni0bcfrASviW
	sggTkzMes+xxWtGUnZuFJt6ZwuPWbY0sdpz2XAOP6OxPpgdTn+GzDlOtLmumlbAsWtxx2
X-Gm-Gg: AY/fxX4+TByeR46sY8gfCFWntgZGt7gMO31YPAP3IqsjfmnQKV/t/iiFS1brZnWD2Pz
	dG90VrjHo6afcaAQ8uTGPdHmFLr7PZsy7C+FMp2a55zF2592S5NT+Wh0H/Yg/jElHwMe6kTa+uK
	a/rCNIUYbRqSH6sVw95A3MN1X2lvYCXXArRmIecHtW5mfDPX4hhsZiv+a0yDF+R8AyesRKmaiK2
	Bp68tUxQpjUsPkbjb30H/hDEyUuBoCFRF3kXctj+R6KGM4Q4jPrLDcDs8t0rLmbVlZaQtMkKbdX
	Ive+Hk+4OKI7LYbGQm/stbTVmwFjNrDqfhBTTogEOk20yY5m4qxvhFIQpzsXE8JmF4zouWW3JL+
	jImAP55C+7JT98hC0+CO5C6jC5TF1fl01g4m4Wg==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr210916091cf.39.1766484171684;
        Tue, 23 Dec 2025 02:02:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2nrkfO76+qDOJ3k1gwHAAwaCG3ETkY5QEA1jJ//1LJTq/ZgfSqHuPJJDz32+uEXbZStF10Q==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr210915701cf.39.1766484171153;
        Tue, 23 Dec 2025 02:02:51 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:26 +0100
Subject: [PATCH 04/12] i2c: isch: use i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-4-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi6WTQILh3vDp8LqDDriRAq9W1Ef9GxiLPWF
 7dPi5v50q6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpougAKCRAFnS7L/zaE
 w1rXEACS0olMUbGK/4Yp3SSQETn8Vguzf1GV7NdR6FPf2hSdaFxGeutLyKpJl+R34UFzl3HIo16
 D5lvsdFTfAgGtO3OfJzRqJzvZiqKUv/RaZurI8wGPSvyM2wWpFRZtWYSM3x4yJ799xkM61vhiO3
 zCtFQX9FndLM4u3ArsvyRbokSficADUkzDEd/m5GB6DOK1UvgbgKFEVAHSsIthU9RLEdhjCwvrb
 Ooii5Z3b0haaGOKsDZgWYBvUl5X8PqWNqB4kVsV5X/Nps8sJJPl19O+rRow/9YSZRthPEd5W8YH
 1EKH+MSz9FoYqIBNvIHExKMy512VO/7h/987/ta0sQRcfGQv5MxS61Yxl53icjrbJ0e2pdrGTAP
 MQwnWQk4Ofkr3KB11kui0cRbFlJsEDcsTj7APhADj44YTHseEvx+YadnT/7rWrJscq0v0E72JuO
 LHzxIy8tS87lik4AXEhsmQQrjDWGlZb0/fx0V5IVRHSLLkjhnk1pX2+MtSuo/q5/zvrzHWGAbBR
 McWzobJevYOUQFVNqS7YiwfVAQOtduMCW9Wq55OKrnKp8PYI0IgH3ubSPg2qT+HbyEtuV+lgF6z
 ARUYr5FUkASy66qOcrG7IVFQzoMvR+0ckhdp5lig8EwJf+RgQ6HBs/LgJDIICAh3sy80zf3Lg86
 PD/zBN2HibFEgAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a68cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7nvlAvaXHceVFyMUCzIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Slwasg3SAmHIvKayaDuhM9JSM6fORzE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzaX2m5+WOC0r
 4cqjD0vFEJZQY7wUapr9axhasxavQPrypCGysqi5TqzdlOLtOlgnXIjBsEc19lvkNOZ/2KPmWqT
 zaSwfkwAG+2hDDCTMKvOaTUD/pJ7NOY1UvKV0g14q2/94S1pjllU05ods1xYnHfYUd5AE+v+YAe
 3tHINCaf7pug6s97CjuBNQGF0+ag5iC95Vjy+V+86fKMbOY3HqwM1sG0LwGaXVLQYeMvuFDIxzM
 pCZG6mq4In3W4chgAndl2umuFZmcCkw+HCjt0HqskJSwGaP0vNq3delv9oOtaFIOQ1AtfefQGYK
 5CPpvZmXiwr9cfHjkbZzFm/mDKmjYuBuqa5VIMfuw9XHns+Zw/th1ZDp2os6cu0970eoo2QxZv0
 5tQF44I+TSvq2A7Qmt2OBbpJySNN4UvFfhg0QQrKkGDQSJdM7BpYpULW91fc9HmcZyltIHCM79p
 BOO8J8LB0kM3ZcS5PMw==
X-Proofpoint-ORIG-GUID: Slwasg3SAmHIvKayaDuhM9JSM6fORzE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
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
 drivers/i2c/busses/i2c-isch.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index a2ac992f9cb0d2accfaa979b802b98c3b7fbe3af..6ff07ab12e30db6821cadea4de3a588b9023ea20 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -86,7 +86,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 	int temp;
 	int rc;
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
@@ -97,13 +97,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
-			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
+			i2c_dbg(adap, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
-			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
+			i2c_dbg(adap, "SMBus error (%02x). Resetting...\n", temp);
 		sch_io_wr8(priv, SMBHSTSTS, temp);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 		if (temp) {
-			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
+			i2c_err(adap, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
 		}
 	}
@@ -116,28 +116,28 @@ static int sch_transaction(struct i2c_adapter *adap)
 	rc = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true, priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
 	if (rc) {
-		dev_err(&adap->dev, "SMBus Timeout!\n");
+		i2c_err(adap, "SMBus Timeout!\n");
 	} else if (temp & 0x04) {
 		rc = -EIO;
-		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
+		i2c_dbg(adap, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		rc = -EIO;
-		dev_err(&adap->dev, "Error: no response!\n");
+		i2c_err(adap, "Error: no response!\n");
 	} else if (temp & 0x01) {
-		dev_dbg(&adap->dev, "Post complete!\n");
+		i2c_dbg(adap, "Post complete!\n");
 		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
 		rc = -ENXIO;
-		dev_dbg(&adap->dev, "No such address.\n");
+		i2c_dbg(adap, "No such address.\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+	i2c_dbg(adap, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
 		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
@@ -166,7 +166,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	/* Make sure the SMBus host is not busy */
 	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
-		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
+		i2c_dbg(adap, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
 	temp = sch_io_rd16(priv, SMBHSTCLK);
@@ -177,11 +177,11 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * 100 kHz. If we actually run at 25 MHz the bus will be
 		 * run ~75 kHz instead which should do no harm.
 		 */
-		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
+		i2c_notice(adap, "Clock divider uninitialized. Setting defaults\n");
 		sch_io_wr16(priv, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
+	i2c_dbg(adap, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
@@ -223,10 +223,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		size = SCH_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
-	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
+	i2c_dbg(adap, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 
 	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp = (temp & 0xb0) | (size & 0x7);

-- 
2.47.3


