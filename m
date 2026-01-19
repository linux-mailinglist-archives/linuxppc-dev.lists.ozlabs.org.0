Return-Path: <linuxppc-dev+bounces-15967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BAD3A560
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6g6zxXz3bt7;
	Mon, 19 Jan 2026 21:40:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819243;
	cv=none; b=b0wH51300bkFygorijxi/+Xj/2Cx9DzxSvWcq3FFx8N0ovws4VLDb3Qho4fUBejeHk7WqH1wn3A7H5i4vJC3Wya3J5dkpGBheoOVeXEUIYrlJEd84piKJoM1JEoVj2US1FdkIsY0d56g99TYbxYJKQuEzOiJ4Flm+uru5jK+P1vJVii9fHOrHkqHNeBc3dbnlA7MJ5OKuqyfZJkjM6stgwfQa0jADmujJFgWTahI4J4ZS9iZ4BKi2+OjmONpHeDahKiA8OF4mhWLqPqigTLwWyj0WfOEQyBveKyvjCAZwM4KuI3fNjHflOPKANZsOFeaTLetyEjDTpR1WOzoOtMwig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819243; c=relaxed/relaxed;
	bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAfuTgCqxbYwvGyH8vYsmtWBWaHbvlyYCYTpnFY2QC3M2oh1w3uYWR+ogcg0QT6VZ1eyFcyiKcNvYitXVAtaXUEmF+eHzwDevIAAwiBCtdclOg5ZqvMU3BeahQZmaxmq1TODvZLCoHLObt6p/y0lPBc6tZFVegFk5Yg1dkjGnkAWXHHMHaLXlMsEK9k7wnhdi6bDZVqWzyYjzyBHeVRgQT5bvzJrEwPbV2Qbxbv+LYZcbz4uIL2J7wvuayMg9E/jPIVWuNtbmkRoSlsySpt5CTlENiyoZIsSiTZ5Jb3oWOu/5zJFgjAnuOKFA2ytGZQGJ/XmYtOKWcbYBwGWo4fViw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iE7LBSpE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYcbrMBo; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iE7LBSpE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYcbrMBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6g1hVMz3c5j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:43 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91EBf1150141
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=; b=iE7LBSpE6amQc8ar
	jiHLqt30gssaEF/bVw8IpwLRRv7qEAR91BTg9brjbk6dHDzjJfRtEF/D0AAiLtC2
	5hX2fPjPf5Q1ytEK5qTvKeVCfoMGt7SaXYBrqMdIH+ooQs1ChLVljYkQqG4VIGRO
	vH44x5S1QxdLtbHZ43SAnljrll0rrH7Y+xJMKpmh0+RHQnGqSL7SEoRsclvzBIxA
	k6jA9eBtwM95qqJoSh5hvRpBABZgqJTp9Fhvs/hRqGm/UB76LL0hBY87EDxe+K0z
	fYOD0onxyiouYRm5/hxXPAvH6zy89u4pse+n8AZo6QYWDdZ2JPm/bMC0N5ojxe03
	wCZcow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e545f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so1054126385a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819240; x=1769424040; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=hYcbrMBo74Zlbj1exKH1f3XcKHD22/D19+SQDmXm201onnPafd4i35RH9SlvLwpNtb
         blHemCCcpxi2Ro4YEvDb5XPhqACKtDPDtyLZnVBHapXD1jR0dZetylCAvxSfFrZsF2UE
         ycZ/dxZ+xyk0lP7cDRQFjDzz2IZYszi3J3q6zRXCjsxPcIxulCtSfcNOhpNAo+RsncNf
         jKQhicoRpZZehZAXMdYsqwgtPPNpGqLsMz5XVCUCvXYhTANkBUcheNkP33XeFVWnXs/w
         NxTzi99I3vfwiSqdcLXgT2URIv23Ynqh7cQSosegN4pKSfckKJ/XB4P77lPjnyCo2JP4
         z4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819240; x=1769424040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=DJ/jiT7EusOBKlqsBOcOgrbMJdFJisxDAdVYIsVeG+YTW4s7/9ADpb9KBXNl+IzSvT
         H+qfDzM+3tiZ2wi/ptBgWVk7x0Vv0EwVQr++zUlB3L5StJriff/ZMSF7OR4CwE073shq
         sdGDaTw8H4t0W7M5aUV7peBBdEiNwGdRNEj3BWfudrao+7J7CBOvO5/OD0ytbJ5JaZP/
         1F+Xq0bXvUHU/9fiH2voXzyoKeR41oElGIfkuKgvnsrPnvVmqIBvSwyC4lTpo+9GoPNg
         NSSDttwiMAdGEjUsZeJDrRKdVxt6YihRLljyso/bapocYTtlFleoy3ZbZy4YcrBnzb6o
         dV5w==
X-Forwarded-Encrypted: i=1; AJvYcCU9fOVe54Y8ag355EFVYMk+Z94ofk9lquJZ9ygKXG3v403SmXXQ0d6GRWXe7C7drhnCZoX/H3bDQuJ2j9o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBZepsTSHp3n4DFRjU9NL0iKuBfmDZH7qoHGfP9jB29yuI/tOy
	EDOKpX0O5Tu5mnyWGz//Pe+RckkAurewled2E2OtEdR49p446ClP0RWZF6o8h96OfYFrLzavqMv
	qD5/qyHccywKWG640UcMl8uhCw9JVHdd6qBTCsi1ynXebDgZ3+2EHMsl//tsGrb6OhN+2
X-Gm-Gg: AY/fxX6GSPs8NRzg2yjZzM/NMfrY5544AKTw+04Y7KuKxtF/q3KNwk3QWGrA9tN7zzV
	daioZHdsmpG8eeiQj76X4e+IaQu43mHpumLIj2NGQQWZ9PfybvLDOP0Th72ffJ/8eCU3wWZ0Wwb
	rVj8163RBGFCNKqdBE3t3FN5lKcwDKy3TxZt2+BBIHR+LynCrQKZ/ING8KVAyhAYYGh57TAOuI+
	W60tG3Wyu/UARl/KWa75g1IyeKxmXzFmy+g+5AvFrFan0tdAiv6yuVodyfGQ/Tq2bwvjP93/bMx
	TkBbv8bR6VEc/Hs6ZLB2mTlt6Mt6i2r3UDevcApJXvU8zf9nIJzGXTy89N2MBS/5zfoYrdceMe7
	nezcPcRQjNd9tP7xzGnIuKhPHq+9Mz3rK/+Jr64O1
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325090685a.55.1768819240503;
        Mon, 19 Jan 2026 02:40:40 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325084185a.55.1768819239288;
        Mon, 19 Jan 2026 02:40:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:16 +0100
Subject: [PATCH 5/8] soc: imx8m: don't access of_root directly
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
Message-Id: <20260119-soc-of-root-v1-5-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gSSXjbon2ZASCpjtfLFN1xl2k0rbvEgubK+ypiMfNAM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoZ6/tFfNkSY0GLr/XdLYcw2kMLXLPjKjRzP
 XZ+QTLLN2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGQAKCRAFnS7L/zaE
 w21vEACSpoI0dRf9LOVGg6WzmVElZik9pD0oSo8OINntnyjEajlS4xcMHsKFLGnOaJVjwTvCE0D
 WE7jKkM+kIJE9SAahNxJJW0sfe5PHeeJ8b8Y7t+h2+Ep6U8dWNQygw6zkqGZsZrTurg6e83TK/O
 Qdw/eB0T9g5Y9QHmAN0yY/SUG20XCb6qlZ07150Aj4ZisW/KeQEWVaxzkSoQ9OCferh0bcyLLLo
 SdUsxsAFRynk1/tuxNkSs6xc5Kr6zZCDauKYeqRdXAbZliKDlm3CQEar1q270fYfOnh/UZsz1kX
 K0atU01JTCgQgZpviyvgySSqyp2djHwmiFFlzBtVDoH0H89xw86RO7MfYTcJKdlIFxWpvo7AK8G
 lWrzbrNeZPZLR+Si5albdiXZtop4+OCuEEO/GcIP/8eihf2EUwTwk1/cS664OooHL2VXAbute6N
 nksZwcxs6FlW5e0l1Wy4KlSZMR9qB3QMnxpXrdvIiNOYSo00O9RHaZYDMAYb9I4f9tKZDGSEyBF
 QUeXR+BInkIvNqw5FagKBy4Mc+tktceDeHtC6aHPnjVgmLRzMDpqvaqBdPoUiWHyZWx+HJ+DF5A
 zb5Yx4jFe9IgxU7KA+l+14Ox5Q8OtuPJJCz3n9QBCpLQWHWqW6ZWfSpJbMN5Y6VgIhQC1mEgyzF
 /jfgYN6e4M/P2gA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q31YqNcWydnNWZc8Rm4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX7vNwT8hT3e0g
 jCNljg7/owhd8L7OHX8sfHJI2GANkQPs8qAl1uspRIEmXH/VhEYCISRlOhYFz1gBAE/T+fPialH
 oolLcgMRUMXB9IJCwXZvskMMHqJKqcnYpbu7/oU9sfEcXtZ4ZXfo2Peb43IEzGTrhLm3usn1xA8
 ADfJtR3+Qz7tXIMt655qwvjwPQ41xD0hoKgRC5LaYU8hjnbZjJ5Xbvqag6E3oi7h1pQurLcL4eb
 bUL2IYp8vTaf6RtOZw57n4QlgnWDm5DHgoLkQPvEbCAMk5DmFbr4s/zyofyeZXWJUrjCWxbYsZt
 ZP+8Qy/FC6iutP+vaFzAC/1snCoYgKzhBoHHUqdqjV3QGbVxgw/YZ/D58/1Xh7HlZdEMrggdVqw
 N1yW1bkUFg3h1pO83XbKP33IQscD70AzjwjWRDwskJ62MOwOENHeslltM9eRVajdnY0R3keYmOt
 k2EGVNJOUA3oy9uCtLw==
X-Proofpoint-GUID: cbH_c50QLvxSSf5_ZthGEuahAsETQIJD
X-Proofpoint-ORIG-GUID: cbH_c50QLvxSSf5_ZthGEuahAsETQIJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
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
 drivers/soc/imx/soc-imx8m.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 04a1b60f2f2b52cc374714f9a1205496c1762f39..925a9aed756103a5a74d5d840b54a2179cd78061 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -222,7 +222,6 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct imx8_soc_data *data;
 	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
 	u64 soc_uid[2] = {0, 0};
@@ -240,15 +239,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 
 	soc_dev_attr->family = "Freescale i.MX";
 
-	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	ret = soc_device_get_machine(soc_dev_attr);
 	if (ret)
 		return ret;
 
-	id = of_match_node(imx8_soc_match, of_root);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
+	data = device_get_match_data(dev);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
@@ -322,7 +317,7 @@ static int __init imx8_soc_init(void)
 	int ret;
 
 	/* No match means this is non-i.MX8M hardware, do nothing. */
-	if (!of_match_node(imx8_soc_match, of_root))
+	if (!of_machine_device_match(imx8_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx8m_soc_driver);

-- 
2.47.3


