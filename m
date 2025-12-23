Return-Path: <linuxppc-dev+bounces-14969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFAFCDAD10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:14:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW6t1z2Lz2yGb;
	Wed, 24 Dec 2025 10:14:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766485574;
	cv=none; b=Zs5+SxSPVP28hBg9II3P0joyD48fdeQkIGJOLuPq4YgP1XZLJmpo/wgJOCp4D1NCwc2DpN4samcqlrIk3Miw1EjwHL6WwNZWAGnO5cyh13Ds5EoMkXy2szrQ5q0BZHah+VpAKwV8Sk5g+6FKw+FoxYWRyf+0/ypZLbYp791qmOzmcyXR7C7wiXTr1bS1rHko1yr2vVxA7M9YTEd+9PDqcfkFeB4ThVUi1BmdymYIV40l79DCDnGfTHR/4WOZ6oqEQuOTWy7Ks7ywgTkio08N36U5zqk/iEybqM1m38UIR+2N0hQkYpraGcLmD/3sBS0eZOrcoYhOg+vfsuUvakEJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766485574; c=relaxed/relaxed;
	bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a22lvj/CG/9YORHA9bWdIk/jGRAz7UvpVnshk7i4Mb4Ng5TEuucWIdloz79t5LrXWwgQ+paHmFovYb81cI2D2RbZ4/ovGmGRTcVmw7Su/zK0Z1ySG7Gat9Osd1EE+bbV7tMNYUSYjU6w9ju5L+uzvBjXSAByMsN4oTLGwHRcEE5zWgv0FtzVlt1VR8a1w44vV33b0zG+0KI52YYqGNzIpLaLlLcibAWlqiD+TA7LgPOYt7Xm087STnh4l1e6oTgmI4nZ84INVdZGneJ9gimGn3G2r6N86GWiM7cfrQwjMpRGgF1vLN/C56Oq3S5wB7RAujP4EYmZlgmvQUQSk8XQMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXZPQwMV; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hyhtk7Y7; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXZPQwMV;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hyhtk7Y7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbB4P4lf8z2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:26:12 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5WQ3C1903861
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=NXZPQwMVokntHKv+
	fa6fgpAlsALdTn0FhVHe/OI0/RAIFpi2EQ58j0PO6zNyNNJW3dkpCjnpyNrjserh
	0SN0Q5/JAdL9cCtjSI6i/4w2C4hlJ7yQ+fChan94YkDrFXAGQoHib/7didgwTuF4
	OSQuTsubDEpoFEg0tMw9DJtVRzDg2TkTTRXbW8CpAvm/g2f81OlpsAqR/N/F0Y3F
	Xunn3GCHzcOoyAhkp0N4OUssKO4zl+U6PUa7fM/Wmd2FMAXFbgxpYpgWha9ZujNF
	bA1ERz0aVQvCCImvoWp+nrwJqnYphez/xoXSXQmkV819WcAWZNfP0n5o1tby7f+N
	UTSBKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so1144222185a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484166; x=1767088966; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=Hyhtk7Y7P8hcHOTcPxJHxWHqMxj81EH8PM6n07W3xv/PDkPvuURSLehiIBlJ8JroAE
         DhCAtYomttJKDOrP3Fh1cJQjc6CeHRz0oGyycYlM/5BTC9tXV0kC/9UdRhAWDxkTPaSo
         B0MLeItbl7kZ7AxUvXq+72IXtmmiLWQPbKU7jxf+nMWE+dhCvl5NdkMfjCUuHyeZ7X3Y
         nmotmvhX0dbbt3nXkB61K1aTmVc35tjhdZolqtSofDbf4Repp6yDqm0qpZgic4Mfalm7
         wSJ6uToDJuRKj9gfGLJ+pX+lboYu5GiIt8GjeekcC7qL3bQjT5Cvt2l9SWwgHfCiGW+k
         qbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484166; x=1767088966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=IUtfCxvIYq7rSo1P7zvBAXiUZpbil0GbaA8ElASLIvPW9rEPbsyHifUIPTsNctnbNW
         6tKRX4B315sQ44GKtpyo7r/oSlUdUDw2HOv+XoSLirQH+zipZ7qWfItvERmLkbBXFBKr
         AEU7MdHZtElla0mbtzv6bQ9tA0cwHXG1pEx+MArMyqN8fn8eTuldKBA8NnusrGyfHbz8
         gr7iUyf/f9SZYV5VCoAx3ZHsMjX6ovcDcA2uuU9X3Zxz3jng+gkPxx9d36OfRGjCtrJ/
         9AWRLgj9VggpNT1JuOpC4pUGPcl6l8fIBKK/Gx6zAIAaOyQxlGzlABtz9Wc1Ew+bgQV7
         jQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXRp0bqqLI4wwiSIEAwxsFbGWjXH0/jjMkMAjCDLjumavSaBhOeNw8hCX1xAVvOfoCGtxFlJijXHOCDiZY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2c8zPTG14QddwQ2VqsVlLIbYG5D5R4IykeMBWoJwIZExiaag6
	KDlcSYl/rrXGh1jWIZaAK2n1+vhnbtkWjmGFI+I3qjkgUMKrHAjoICS+RjDINOtwVfx64n+8SRq
	hOb7pZGG4kxgb93nq4DANoGXgtBb+UOecmlQ424ucCPf4CuSpfcqZJdUMmvRSi+FwXR+d
X-Gm-Gg: AY/fxX4fayVHFTBX0tyKu7ttZGB9WPLWxSwkTw/4T7QZlNUI93pSmlrhWIska0qqDm8
	t7/KqrM/7YyDzguLG/aDYDI+tF54TfgZh2RkRzC5k/cGlM8IENMYG8+Afk+LN6Slfbs24KvB2HB
	12wH+m2nrcRyXj+qoSbbXUWxVt7XFhi8k3ejZpTLmpjxgWhpK0swxA29Oibr47Nel+eo50lhCUh
	8VVVOu7apSeCzLbyXkB9QK2iN20Tmft3f6vyVuW89Fz6VYG8agCHQ4Mi9R3XbQ+WLBbLm2AS7Lq
	l/FIX9en8GZSHDowVmk3Bc4aKUn1dxqe5WmUu7TrMAsUUM+kR8KYnf2jVkK74uX7Kjm68Ier1gw
	ji46H4K375fNrNivi8ePGiLk/qH4Rg0xpCi3oMw==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222573161cf.18.1766484166160;
        Tue, 23 Dec 2025 02:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWaznzSTQAYQqKEgVN6mwd6iFax1OFCffRzJ59eXXh79VnM9WyrAcyYRh+zK9tRY8IGJfXzQ==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222572751cf.18.1766484165645;
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:23 +0100
Subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi3cNvVUsgYZCpEuC46abxeRT7pA49Xu64UD
 uziUkVt6sOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpotwAKCRAFnS7L/zaE
 w0ZoD/wM32Bmp3WE+s9el7ws2B8x4OdFoCdcSdX26uMDCnLnt8YtAI8LOsVEEMb6fazPKj6jB3A
 jMHY2S8MeFGIwey/wve2wcUUgB60vRFoCZY+E/dcCGlPQUVhOMO3PC2AhTxwmhkBmfkzDQIquqC
 YfNbf1IdKLBGn9WdVNJaTeo9B8YtMcnX0ZDUKzJuc60m7ulpEF9QqYjLU82JgKNWzllIdtiPLVX
 E684v0yaaD+u8JcHb4qv1yORIxoyhBVKX2DauwcCXPFMlnEN6UYvC+JQTE1mtGICrPrK/mTMyeK
 gxxc5Gj1ENA8Pr3SMUWoPnBF0AoKGWF3CJWRBGsjK1G5vdfyJp9fH8gvBxcdzNXKcAis4Ed3Hbn
 u6faKfE7YzPznFltsBGJGmWNTEdH3N+syfZQgnQr6AdM7NJkPtD91sNAk+g33YMN2lg4BbobqcU
 ++fSFCzby4D85+5WOfn6Am0AFpRgoXSmqqdQwvilG1fiDeXTAx5F86G8I3NKjn3+AmJ3fQFwQ93
 patNHd2OQStX1Jed6F6tfhajOxUvbvZkYwb9LRwX4WBzdiCEej9pxvmzMSDqs73urZJt2Z/41/E
 aAQ15tsTH1dl0aqGratG04wZFTAxiF6I7R3axfNL/mTIyehWRw7qi3fMW+IUk5V1RfiNArrrg8+
 z9zRlaDNDfxGWPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/vJ7rgCXSgCH
 ykpJGklbKWnZ8eYF5wnK9qxlcov/D/96HW4pAgvOXCXl0XV01vJuPB2PXRNQ38KXxe2X9CX+RQk
 z8ewvW3xog8MiMePPpkm3ZF91BMOJx+t/mOaLNJbu7WkvZ7MdJd2HtaF93cacXqmUdSZ0PSlhB6
 r6KXgAwKRKglsBfrZEAenO0HbREmT5SvCtlvzUW8JF95DHKJ2VtBRbxE6exlakZtg2KkZeMREwv
 7/TQJhcujPQH5TirQH2KDiddWBOwPPPP5+OqXDi1G/ulsIm6SPm5KhErhdXwpNj0t4xIHSjd9/+
 b9T6aUEzWODfYjy+xHT4dvmfCFsRpTA4dOgRU1UtBVb4C/EqCGZUw/2uwpgyts3mx9vepSbfz5w
 dK//O1C2YU+B6Q4fYfVJPZVqMFQeYri2QfIXQtw4BL0tHbmSvGDsOb7opmIQxIsWfpsUJ9/04Vs
 p2UO/CxmlRJaqSgXVqQ==
X-Proofpoint-GUID: BbA51q0RC5utW05NEMxlnU-3p5rafGEO
X-Proofpoint-ORIG-GUID: BbA51q0RC5utW05NEMxlnU-3p5rafGEO
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a68c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a set of i2c-specific printk helpers that wrap their device-level
counterparts and hide the dereferencing of struct device embedded in
struct i2c_adapter. This is done in order to allow moving this struct
device out of struct i2c_adapter into memory managed by i2c core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..2225696c859f617479be4d5c9d304bb32cbf5e9d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,12 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+#define i2c_err(adap, fmt, ...) dev_err(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_warn(adap, fmt, ...) dev_warn(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_notice(adap, fmt, ...) dev_notice(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_info(adap, fmt, ...) dev_info(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3


