Return-Path: <linuxppc-dev+bounces-14961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F295DCDACEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:12:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW4T4JL3z2yFW;
	Wed, 24 Dec 2025 10:12:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766487134;
	cv=none; b=GUtzOjRhKn8ROeZ4pdOZJvuqE/LO2liyAaPYVRv2gJGMv8Py2wa5zgjlqWcM8d/BFhsUk0e5rpUBHl6Zs+A+/SLz8OBxeqkXJqVu7G9xUDT9/aKwD6XKo//Fv0OEGJMZNE9ArjehsnwMHLjd4yO3hPOjMuyBIYvsTzpS+YHeno01Z6baOpYvbFiQG1QIK7/6Hx1GUo56WHPXAnBKJp/HusOtVFKzGWZybeeAYGbrNc60yNwrcJa8FDFDZ741BYaAfQDQmbz8zz3cskRcagxllxNE9aaaI+BFr8kRDMKOj1w3JMjjALFZ/mjEh9pH6xOL1M0XyALH40la4Xahu5M57w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766487134; c=relaxed/relaxed;
	bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAIc9qUTndq+wYitKBNSjcrc77OYAfivvI7FOEpTsRDLMS7p7TkAzA2fU/22ruQzCYDIC2ImYJyTKFpyn58Bg6tf/Zjo+M3drCUYOcrjzVjjj7MK2lsjJSgxz4dpgsE4aOrQStY7SEVffrJc0KYkBv6t1Y4P4dDtVYFjeLyOC59KiluWGqZNgloweRz0XHEFWbavloR45Jbv4fDle0SP/Fkt7rHY5sfmazVPLrimGEyfcF4GUbwjfBjsQUepnrvRTDMPrl+U1bJx5TjZbYhMqaxcdtsyqVaWKkzP8vhEeZjw0cyBEJtVGJUYz8zmhApGkGdOa0UC8BPr2ooQMfP2xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otwKbrxf; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMciE530; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otwKbrxf;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMciE530;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBfP4wjhz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:52:13 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8VE6f3062290
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=otwKbrxfnL1TdBVC
	6WV4xwy/B/sUn11hn2Mc7GzTZGP3XqRyJ5xnM73dU14UKE6XUzKF6qaOA7b8UEXK
	wSt9BHWtZNlMiMqr+qTAO3he9wMSD+YQNzdxZer8gA15KLv+c4456bAg/IZZfHnr
	Fq8YbT3WD3s5fO7LpO67NGCN5mpvRZwDQIXSjD0Z/B5cvp1Ygi2DcajaNNdPYoE7
	5nvRXV96tuFd5JVvItjtJQQkmzvkUIA2XJGDrN4a7u7Q/dHDPv6JpY7FcQALcT5B
	JPJ8jK7uAUGPWRb6dmtSPb3MEN2s3nBA0y9pYNYuInrMOwwsM2aK1Y+nLM+Pok7P
	IYkqmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkay9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so106910971cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484179; x=1767088979; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=QMciE530YuxUCJc47RXUARi4+sSAUyiILW6Vd7JcWcNUxwC27XxiqL26aci/dUAoem
         /L7aosWzH0lHHx9zIHry92NtD/FrmhcVfWl0XS/fTRCefWScASVU6HMjs2G+8lAO8wUl
         eMc5BbjSP+ffgFSc/YZ6l6lHHqpWfNWkCDGNigkFiEcEYKkF0VK6y0AXWgL/Pkuet5fb
         /7Y9x+7oeovXBIHMV8Uu1VJdvMZu9nIr2uBCiZw0aUOFKnKjpwt0otqTgPdZ1T3UlODC
         U8E3WaXCurBl7WBLc/V3iK0z3GYbkNKsCIMa/PvT5DK8BPHxmHYqG46qqb5qenQo2s/p
         m4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484179; x=1767088979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=JZym6kP93Md+PFM0iPYuVCkoFm6aQFtHxL4Ibn02GPYqtTNZu5vvZk6mJ4LdLLOvuM
         zeBhzfD0wRzpUQ0l+lakyexzLj3Gn8WfPIN1K1CMn/jnWhzaS4Up4gNz2OJjU+jQqhnI
         Ut3FEmSg3BRMaYWHponVy5mKSWOuWxc4p6sZLsSamES3qBHVArtL2n057YvEqkQ9G1qF
         n7g4bu4IUcq/oRcxY/C2woKrcvXs3K0HoKza0M4udFNZ5sLfo5dyl0djLpOKP6TXyxwz
         7MkED+O2EIj+kC5yrukDBzqICqM7FJcz5R6O3CUigjGZr1CIVjKkkdq42iMnoD37hVGc
         dW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPoYwkYd+fgYHeBVBHUv7YmYcLswYt7EUVxeWrtxlL9yPUoHAnyvuurAyFOay+G/9MPlec75bn5ymkK70=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyaOVojbA2fKelheVLfT89/6vIC6FU1YDakB8VwMoQcdeqVaPFd
	EOowbrIUaRL4JS8vYrN0F6zeBhW3g7CpO5o0JquHHV5qtCCOTrP1d8pm2WOnhK8dWHr0zIyppN9
	GZt5sTY+mnaRRSX3VJ1bs4CrlIm86Uby4RlBEb8abARxEM6bADFeUU5BVxrozwtjEbtLj
X-Gm-Gg: AY/fxX6DAXdjdQQTSpSZAUjeD1opd2ptbzkiIVX9ScusEKpEeLiG5aH4XLilkMTHPQr
	cKjrsNCZZX9mLksZ25P+0MvUd83xmmuNqWLl9Gw7dAoMwk5e+oK2NiYYXtPfPE/FiK2AzgPTgVu
	xM6vcdH3byWXrVRXphlGijnhXqDz2IB5/smP/nCtyoagdd7BiBVDCXlKWsVEzXYN+co9e/zb+yq
	zCUSEoOQw1lkpJJLPWkSS6X+tbaYLdwPPDbLNTlbxMZa0M9PuNrCoS8E996vBL/w9teWVVPWV8P
	MtvhiFQFGU3X3d4ntEIb+mGgBUdMMw7oegAS8PoY2qNfVd0yBZSKhw0ESnzMvsNr0Y01owgVh2y
	8LlwM8tsb7JoOQeNWgEqCfF0xqkNjeUU8NP5Meg==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266371cf.63.1766484178982;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYXi/jHhONsfaUYfyqVZi+bmTDlvcyn169B42+SyCfOiYjgT7JBB+81IGnemThpNA20OAzag==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266011cf.63.1766484178619;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:31 +0100
Subject: [PATCH 09/12] i2c: owl: use i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-9-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAhdbFloNWEKAbQOt2D2f5/84o4352KnQVG
 qC6sU/ezyyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 w7epD/9rDuuAuMrijZz+HznnGHSdCAeNvsyqHlql+M1L3UpFuJyrk4GpvYgN1asIGCxHuiIFf1f
 bXtwKF9d3aIJdQVpRiUqimlYz2hnFRxxS75WMWMzENRiho/uW/5Eqt+0cy2tDr/0s5hx0L/A0su
 +GlAUQJjYyIMHUuHqFGK5mnOcmufBxbSXsae+2b0qsOkJufCrsrrSJYqKOp1taATIiBemTJZBpU
 VxbKBW0hXg0LR1fhLovLl1CVuOgukNLNVQqMjcTwe7GqYQ978CIp9weEtETbxvuRelLQJynHcSZ
 KL/6FadBg1u2JjG6wfiUDTij0xfm+4hCrKIkVPrqlxOSOMGUpLzefUV0l/maqjvOgQ0LppSNR5X
 A934pNHJp/+0V5FSaHBftfwPWbxFQXdbRFgAwfkGkhposEp+iccTtfHyhJXgYcCvmoMLAn7/cfL
 NAZQ46Hi9rWpzZm5iYEHBL+Bf2/h9OLBSHlpbfWDLqxzMeGEI4hx1bLS7mba2o1qCM/5rln6Gj6
 mcT0wSiIUGkhRD8ScfYZWZDeU5m/ZMu7UdZko7fXjAuwqBiTEBJssvjkaKzVeh+47B/R5rCi5tX
 6RP3KTEzVW0U0Mrk/v1FkjrmB+jDbxnBnhc2dGQqllDFHvfAFCbO1KYYTpv+84WgRnGB1qad/uE
 eSV/XsXnlHU5OnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXy/2WFrBGN6n1
 QE60p9scmKaVcSFvpR50i70glqDEy0ZD036onzbrh8Tr6xYGQOO/ca+Bq6wwkiozxnYDe97zsrn
 WvcVjpxIhIqodfXDbfyJ2AmQaj7oqdGznYoFDuMwYtlTQBY7eFugUXm1YlE5zxAFOTby2JRXd4n
 RgL73DnihVqHQMklgEfvcqsmzaPCLTCkIJx+nRIytyd0f/YYnrlUx3y1jGmGkoP0lpUa0f4zKRI
 NsnQveQNkCefJDXIxJcw8MTyefEG85u6BQgOAicdZNMVwGsivTwWoPVDepOvugpvoeKdCqeoQyt
 N94aNkiI0njNwTxj9qwdMkcWqf4ZDlj3mWyWVOARNtkExtrIR1QXITyYLTdvY5ETCt4OAbHNaMs
 OQVeQO8pUpeu+OKt8le0DJJBx0J5njEbHgrvu4xZQER5hn7SIbG/hFZTw3oQTDNugDWp4z2UnFr
 O4Ae0JI2+kDMoQ6d5zQ==
X-Proofpoint-ORIG-GUID: V5GFLflAf2ndQWHxCDYa7NGxyltUAyVd
X-Proofpoint-GUID: V5GFLflAf2ndQWHxCDYa7NGxyltUAyVd
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a68d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
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
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3


