Return-Path: <linuxppc-dev+bounces-14965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF1CDACFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW5D26dXz2ySb;
	Wed, 24 Dec 2025 10:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486349;
	cv=none; b=aeW16BQuw94QwDpBEICHqQEv/3ze0acaBN6MaNW51TXQUGUXbBMItgj1QZXFPqvv1c1Ra155zmzMa68Cs827dzcGR50wKceC5BRmfVR2bBPehQl7x9CKyrGLuj9MlltQ6+o34i76JZ+1DbKnpTtuAmiyUtG9kiMt7Ur/UcHWQlLT9XJJo4dLsN+luZyWH302zDKBwK9wE7cEkkOfW3E0UGFt1aYgLeEaAldqOJdIgYd5wqAi/6LDJQP4SgTF1UqkJ2VPDcV+vGncgWRi2l4/QbtC+BCi7PP8ouZr3u+U56/3KiCVokyhYBrptgwA1p992ugjtmqYPQM6D+LdAReTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486349; c=relaxed/relaxed;
	bh=5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhCZ0cltfbLuJoKF29PB5JjG7UBMmfwvPQ74Apso5OXpuysx3V3kJsmL95xx9gIr7ZPF9OKBfYAwSOHzLSLxzmLSxIX2+1YylNTBhaS1x5rrXPQB03qqVS5l3EaVUlxZN9MKd3mtYuCFLmxtL4mjlD0LmsffJyKWdZMLPMDtKCbNJKMRL1BQal9e3Uaa8oh7orQw7DAVqBG34swLMQY3ud+UmECmSQXxxsMm0Ab9mkTK936s9cj0+F0BR7iLoiAjFxxFMVYDn0cYMD4ed3gKqzo8fP+LX/T3d4zzvH+MjyLUcgZFnYkOoWcmVOGtIaDsLQsUlEjYmkUvLimNH/WIDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqYaiNl8; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EuR9N155; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqYaiNl8;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EuR9N155;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBMJ3794z2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:39:07 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6goEe1632644
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=; b=hqYaiNl8YwobIyKg
	hxOkqvBAN3TxCSgKl9KJ8EULV4Sc4AkPYgpd0xL5bQRBiJf5L2ghq+DNA3JOFEZQ
	BkoD0TtYoTTfWbaXcOU/uvdbDX0ctBwJQjoZEFQG2t7eBztRdYc15wFdjc2lIj/a
	oYtf5orfZo6Keb0uC2E0vWSdrNCFXNZ/UKqWHqtMkSXc3bQXw24a+WvRhF1A3Fzn
	iwadGz/FS5TBIDEECrKIR1yYTjVw76Q0af4h+j+OcaencKYY8mlNaRDJW8llY8FV
	m0J9gq0Ibz8/fBHd/MUbc1i0nBlDnZJLoUA0gSY0FEvdEEzXqvv7i9xLE+VntaBm
	eQCkRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j9ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so136703561cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484170; x=1767088970; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=;
        b=EuR9N1555T43FuYmKAYAypbxzr8ZNMTyQaLeJCbl4Ey0wLH8XiCTE8kTvfZ3LPrmj+
         QWLHSrcHe9efaQrL4qcJ+4VmbxSo0pdP90ZoJJ4J+bS2AUaRk/yq6bq9/j1Zrvrcd+hL
         VBW90K4aWjM7/sZw95iotPyco/mZL58Y/8XlJRksbScBa/pQ+J1I4By+ZYI/5o6MgO0g
         rLMVWaZVrzpGIWxBEFe0eOfCkKGtdF53BkNpzCBSBfBXTysz8kREILz9GPvF5WJv+kIU
         n9IEjvbISkE789mlfsO13vNAQ7RZX0pVHw6gjG8AOh4SBttY2IDaW6YF+CvPPvqs6si7
         Nzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484170; x=1767088970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=;
        b=fbuONdal4c9Kqn9thIFOfFWTZrQr9lQz6UG492RVQsdx2EhWu9l1jvf4ZM+CcJisdp
         hdpGTAVCPJkTVsDrBUvIHs1PuYSYcgCwkg4IUAQkTR/JHfBntnh0UqzozX09Jcdkf7Bv
         IMoc3h/fjJuvCsq3lazDBUJkr4hh7sz85grJFd1BA0yivJCFmEH1Lu+em7JHkwOsN1G3
         /QnyBDMeMvNf3VHRjIgzuPJKHcMnK8JGQpSVCcPz6+QmixCMF4Aakf31nJ7ALfqpLTTv
         FO/Yy5OV7b0l5lWrAOvAhoMVV42Y6roWKAwDngYNY+nKeFXN+RThoIp2CEsW9qdV7bd8
         DNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzwf9iZ0BvJkQpYslrCu6WlqDesWgQ4Ynsyv5wmrKOwdl2zsS/oy2z4BGKDbeUzp1ITQUaxkCJaHRGzSs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuT0olOIxGJLNwpGdhxY9RKb5+N16W84xXbZCwYcaAN+cN1MNd
	hwVDW6/lIYXX5ex1xLwOFxRtwjc10H7ROKxLLRRwwvhTBZaTvXU6eYRXRs/EtG7cYs/6gIDApLD
	iazI5/utEw+mpRZrS8c3MgsZIRJtXd9B/aeQEI9srsLYbEYuP3JKjteNBImmBgSkUbHIv
X-Gm-Gg: AY/fxX7bIbBYrypmOQj+oua/DXiwPDRwDre1ARlBSuv5MF3MbEYRN1mqXgU5BTa3Xzd
	pLLC65Uk+rnmcewyKQ+L/YyWfysMVnUZRsFi1e73ZT+W93cO2qnYAIeTBEfZV+hKAgTxEUXwDDT
	ogdLQ7NACBTU72F0ZpqiWd4GK4UCyLa0B7kjNyegnhYHiTrDcUUTd1sLy4f+BHAidKtUndE/jYX
	HHz1yIbJM+XwLSgZhxXdM7OcSVcWJ4IxhV615VrhS6IjBVSTK+cFikLsovP5zD3KUyqGTJIitK/
	z933rG+8Z3P6jbn8LsOxN7KNlp2FbUsrprMwAcRClOnPT9QGLCLtthxhP5uPRK1+c9DTzHyiOmJ
	hPZsIqU1aETLvbON7xoYG77C463iCfTQDWHZf1g==
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr207150921cf.78.1766484169724;
        Tue, 23 Dec 2025 02:02:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGNQnUH8+q4d1X2aUWQFd69HHIxqQqX9kHW3GtQxbPYR1v8Q/zvrh4kSh1BGSGr6Az9NhDDA==
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr207150471cf.78.1766484169331;
        Tue, 23 Dec 2025 02:02:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:25 +0100
Subject: [PATCH 03/12] i2c: mlxbf: use i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-3-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FvmaFvmAIEhNHrLA6X7BowuLevjvRkQc3nvh8L7n9Pc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi5f2wnYAXfAuk0aHyw3LAU5NsFlEXThEG/C
 atkhJYHv/eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpouQAKCRAFnS7L/zaE
 wz94EACjJeVfRaVFSv1LgK0Lt6YodrriTrFRafP5jzPZ/SrKUxVMFOXhyVi2Qhg+3HnmUD/kfuK
 ca3QEJEKmm/MGJ8Z8kRF3ufvaLgbdcqVRQ2AA5ZBFisy9LiSvXpzc+eHRD1Cn4GpGoeqQZaZu7S
 uDearY1gWQ5M2fsQUb97Dkt++cogEtT9knhMt11iZFvvOIxGVmIQ92ntyA0n1nfIj9YjE6uL3GY
 GwnEbtTR2Sllx12Dc3z88/Tp1X36aEGndFhaEQOODNUYDo4Wuc/4N9AYKrJyw57Yz1aiGutrdJj
 /uS5mGo83GFnJTaHQBUNsdwfYSpIJUxanoW+BhH1uzTGoq4x3MJ9UBHS18HVPjDP3lloYPuZiwQ
 jXmynyUGKuQHaI05bO92NHUHSYRSFTdcXPcXnKbYu0geYPyVI52wWI9NeqOFWPEuaTK6UUEp+7g
 DP9Q0DxbVOLk5nBCWNQf6KTeWI3EanYSc9IMvbop2eSkNomC0piet9Yv4QkDVRrV6y73bDLzG3o
 rbguXoVy78noW6FG/N342Zdm+Kyp1DIfokMSmD/UlBPHzt67crGWQCGChAD6TKPshl5jRtAAjK7
 28/TD2Rv3M/CBXLPhcd2WTS+KAhPxA9rAj2d2GkR9+Z7pwu/cecDb7u+cGjWTj9LXiLYPqnraRG
 Sn5dm4jMAVF5crg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ULNZ3vB7Vpq1fZyKeEDk8AERHwgiQJGO
X-Proofpoint-GUID: ULNZ3vB7Vpq1fZyKeEDk8AERHwgiQJGO
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a68ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KSXH8CamUCXRpb75a7MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2VE4g6adGqy9
 kme6jJO0j3K2XAmllWHPL7t0kbljHjxLU/Hl0lBSiNi5A3ABVbapHq+OnlOZHb4i2hxkfjcjbIF
 /YzO+1TlzDiC4Sefhz5dCgsZgZU8Q32MuM2YofFfea51qPKbKmbCj7Al3/lgheIOXoVg6r/2YKE
 +ptZ7X34OSlKRFQo28X1A5WF7S0/vJ+omZ0wdero7mEHabvZ9XRkJgCorj8s5gJ8jATdNKGS86w
 55BQBDjTcXZx/RH73f8Vhj86qZGnhMR7jeqp/9/cUdTDCkbm14aPpwGVUOM4iNS+Miav8uHp+Fy
 82sL7GxMkTAJFWIE0IJ9uLf1RL74tGP3o3H8S24HVEvI/qmvZmYbvg1fur+i7ChYqUWBvzpj9HW
 A4mX5bA7kqHcr5Qf10EYWK6HhlCcwuzCHkSSlArDimw2KGT8Lv6PMmgBcuyJRyzm9pfPJtQWiKI
 2iyZukzff3ObqAyZ09A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
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
 drivers/i2c/busses/i2c-mlxbf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8345f7e6385df64bcd3a82021df3f1e04524c6c5..78a7e893b572a682133b3cea200f571f1977ca1e 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2045,28 +2045,28 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		mlxbf_i2c_smbus_quick_command(&request, read);
-		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		i2c_dbg(adap, "smbus quick, slave 0x%02x\n", addr);
 		break;
 
 	case I2C_SMBUS_BYTE:
 		mlxbf_i2c_smbus_byte_func(&request,
 					  read ? &data->byte : &command, read,
 					  pec);
-		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte, slave 0x%02x.\n",
 			str_read_write(read), addr);
 		break;
 
 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
-		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
-		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
@@ -2074,7 +2074,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
@@ -2082,14 +2082,14 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
 	case I2C_FUNC_SMBUS_PROC_CALL:
 		mlxbf_i2c_smbus_process_call_func(&request, &command,
 						  (u8 *)&data->word, pec);
-		dev_dbg(&adap->dev, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
 			command, addr);
 		break;
 
@@ -2098,13 +2098,12 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
 						      pec);
-		dev_dbg(&adap->dev, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
+		i2c_dbg(adap, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
 			byte_cnt, addr);
 		break;
 
 	default:
-		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
-			size);
+		i2c_dbg(adap, "Unsupported I2C/SMBus command %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


