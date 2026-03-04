Return-Path: <linuxppc-dev+bounces-17692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ORaGEf1p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FD1FD121
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmsZ3Prbz3c8s;
	Wed, 04 Mar 2026 20:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614978;
	cv=none; b=e0ZTc9rC4PIQsm9+gmR7Cn1pBna6fpSwz19RhEp434BQ/ECdlzPIrPXrL6uKYY1xJaH9y6WXmt+CKmWTAe8ddqGT0L1X+Iby/K4BwYd40xIp3rCHVYIdjh8TOQfQ4FiqalWip85mjrTxY4YAw3ylOCicAjUWkEEBkIMOFvnDJeQjZxtx0wDEq3mGzGvyPpJlLVlhA+NctrcV4FMhrdo3YKFwSkhNCCxnrnFT3lUbOTehF26uPaZIR8LL18+sKkuqljwEbRXGLv1wLg0iA57eNMCbbth+w59CpCHKAiMp4oZ42vd1EHEhA3G2blySPPlJGR4unE4VMvK9qlC/poZZow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614978; c=relaxed/relaxed;
	bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFCxHpW5WD0+rYXVSPnWDmq5evpOL6U7MgnE76kuMNHcFY9rANAX2e/58Sd1PJD5xr2+T46uTAGuEhau7pc4M/Q3hTKtMHKfDMa095B8aNdvsi3pJ8ctth6LWUyfBkoRioRD/S0LJpCw+W9aIi3pbhkbbXQR2Y0j924EA17S4XcfCUkpHs2fu481+4RQXPDswcYpuyQijqGoUYU6JL7dj/ST37qRV0Juzoukj//9R3z7DBE2Dw1YtSsSNiwOGYZmFw3gfXf9bNeWtA5P+fj7RClZkPUmWvLPeiDIxCFK/A4ilViQFsPOSAYb5Ia0IgjzUKfzIPNz6X8ws2ZSiOZ/MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etSmu2rr; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww2+WHpf; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etSmu2rr;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww2+WHpf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmsY24lRz3c7n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:02:57 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SPKr3110358
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2026 09:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=etSmu2rrizN+QK3x
	oG7GvtW+6Qa6phJi8triQQ2AQrl/vKvaOX7QkhxjDj+PgYK76eLlK0O7E6S9MNks
	ocnckIef5kk0uikiMLB+SwSLDjUl7dN+lgIAdcG8UZqEjo+Wy2/70jXjOgh6nwdJ
	ntxj+1KIps6UyUJZ4VfLS7suCNmvUjjQlppHRsqKp9ImDshNr7MtQMDRg2dJDCw3
	eJt6pf7Co9aKbhjX9iho+fIKxMGZlr7H7upL2BqnlPqlkhdSs522mDtZbX18LyUk
	porvDeHZKJb/YKz9hTqiBP6bjambYy3iQ+L//r4c89tqHMdrYo9vXU4rUWbYYksi
	M6CNFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2agrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 09:02:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so4094708585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614975; x=1773219775; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=Ww2+WHpf/SrrUaDlJe43sBMPHUHcA4miTTFoZoBw6RR8334LSqidT1/x1o261w2SxX
         2lHKM9Zc+rIui50DMm6dV0R7MZnv28Q6+lGroBeykwXNVqk5Xj3TrVzcFi6PpnCKCCDX
         16srxt/yu4buBW5E2WELvOuvj3+jm+wpM5fQVyCRlLfY/ygHFG0ry39nFeB3OZdpcz8s
         sgAhUOGmzWI7N5VHfrGAPFLbMIKZ5zl3PA957ddaTVyHYh1SMM3KsK9h7aHtzrvvOsBI
         09kkne2gfzr4rDH+/1snnWU61DIgB7e1aiGXAXw/YjZZwSlwinQtBNVurIE81m09UNMu
         or5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614975; x=1773219775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=lIV6cgLUO0SAOMXI7m6c935I3KxeL6F6RsJsqb8TDvlwtzosW736BptORZEmbhZc6q
         eylVvHTkYGm9xBmfCQoVsm0mJUnF1jvE7MEE58XCUulYN+vUG4txPvvoIHnY0u2Ib5si
         bbQXAMpALHFL0Ush2US6X1p/vNSSkLz+eO7fqWqS/di1OHIci8dxn85Wq2S9ReBl/M7S
         0YGfKrYyNcyp86C6X+gYrROIVSVArb95029c747VCQZIdoxz2o1Dw9woveDLVEc3xxle
         lwj2EKotE+HeiTTEdxCwwICcN0I6hxrSYFphKetV3p54FutOK5p3KK37E2yU1ohVOT68
         BhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcHNxMrEu6HFaBtPffYMWV1glatZW/IxrAju4V5RGMjEIEVQFsgLae2hI50zDPflNdNM4j9jdxIrNpjNQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHUhegmVC99euJa6pJ4uYHgJC7nTkFyO5rYj5WN3m3wR7BqnKb
	NnB7/wOS2c48DwU/LF7CQv3BNkUXh0SmsWhXjcv31eCdQ9BlaSsabGSlx6r4yJDAvKqTb+1uGwG
	0ARGE6zZfgZX5DidQDKF8s7R3OWNRAbm2aU22nu0appRlHH20ZLC1hN4+t9KNTr4sxL1/
X-Gm-Gg: ATEYQzwihHrE7oswJu5yKws2Sg4wowOyAQt/s5n3ZlNtUjUGSFzuXZZcJ/DmYsObphy
	JPj2dWzDjYwySLGaypj5bbBnJtgpvCJpjZtqeY5uMcw8F+R6Ru0AXV7gPyDo0ngXOej5dnsC+Or
	fVfmU/McvMNc++g9BjlpmYtWNB9PfwISETMKY3N/zum/7aOcM7Dy0RFUqEPTEuTha6tQ3wntK5H
	f7hLil51Tpmd7EvKlToZtUt8u4KSRfcVA1mSA7GHUZ3kavqZ+NgNSOGa2ZKXe9hlpbHkkevzLE/
	U4pEg0rVsRgbZFn0ps+EAF+vQ76mOcKMtp6HfwJjiUk0MUsumlnqv+On8jsrHRZzQyPofgKdQcc
	9Gc5rY/+lrwEbzcaHZpHKLefmOEuhPz+SHRkrPCZrCEgdls7AYhf8
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154594285a.38.1772614974698;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154589485a.38.1772614974225;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:22 +0100
Subject: [PATCH 01/14] arm64: Kconfig: drop unneeded dependency on OF_GPIO
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
Message-Id: <20260304-gpio-of-kconfig-v1-1-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UqST44JLf/6SC8h3if++ARk5Zk1RSnf/wtu
 ShX2ySz2bGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KgAKCRAFnS7L/zaE
 w04zEACcM3xXYrildZ9Wyvzi6zYaS/VDWOtU52ZMAJ4+Wh2B2hAS8Ih/mocnq33rCiXxhVnXn/3
 jnAWPg4G3R7DoGyEHeKDhMtmgbuf+jQVeAJqXqpmKhxp1YGO0zbO3obbcoiG5HbZFINoLT9orm9
 m2AhCFbVWQXR4UeFBxYhCgU5rVmawWHimujZPt1ZBuL1A15sbzij8JAQexq/MoxGo4aaPgAMDmY
 fw6cQs3xFFznZvVllt7nNUn2YxgcE3z78u9VVhIjIndc2R3WVBC6MuvUm32nZL5W9ClHj+Ex0K/
 UCWK2PKYjOpJUxgWz0CKq7UfXSpUtzkSEM+P/a2uVUbsRhCOhDeWpfbk9nG7SMDzJlB19hOVyc5
 Y8lZFm90Nm5za4kaqvWBqoJvNQe1rnfI+7adzD29qg1ZlSLV6UuR1A3hSVSisghrGZWDw5yPZ4P
 czcoRMGNqHkbYqZEOZIAvOOHwbxJPQYy458HZ1ql/esQ2Z0TQkznLVALIOmk93TkfN1QAOAkAgc
 ZBIdqoJF7fm6NacBK/5k4vBM1unmCOOYUr0KG4Jfz1FI5DaGBXyMhcJQhdPTUn82XhHarg1jcgd
 +KFeCTLnphuVcl6AsadJSAd7+sUhnviaLDXNK5MD3jGhJ6Wb1mvqIahEUMjDv/hPWDkvqwepwst
 CXWpZ6tcDATGOpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7f53f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nExzm2HfQztilrPChXAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0AF9TKpgK9PFs6nc9pFNB43anARXO0GD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX2DMdfFr0ZqU2
 zB94+zb0DAW5orL1wflEZmmb66aWD5pOpeyoa2ne6/Vuqgx3adwWgX0xt9fOYaQpBj9tOevYPf/
 wuhJi/N77FVRZ0c9kvJoIBOV5508E0c0emIxABZ/TYjutLFnC6WKUxhRc9UV4LxAlv/7fv3aNdQ
 xNBNaC+2KWO/OlRsMSFCrnC6tOx7pcbJr21cMvReG94j6hLHsGC9E/KIik3kAl3nDOZydNAbv4P
 JQcUqGE/gZ3bcCNYqYypTsxFggJbf9Sx4jl+caFTnctCPRVV8wMtVhh3d7KIF35X1NZzJ7Qo3D1
 FNiDHa3EGwapqr8t2pW4FMz5ONmcxfGmAzTATjIY3AZPWOiFyKXAe+YUocgmk2O992P2HI31JxT
 8v4jU23EYP2UTxJzphKaJn693JI1XKMP9+4zPSfyoxlL4ATUj5Of0VyQJTBtS3aSrFkAr/g4ueH
 +c4Xc7gp1SE1eydFByg==
X-Proofpoint-GUID: 0AF9TKpgK9PFs6nc9pFNB43anARXO0GD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B42FD1FD121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17692-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:abrodkin@synopsys.com,m:vgupta@kernel.org,m:oss@buserror.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:dvorkin@tibbo.com,m:wellslutw@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux@roeck-us.net,m:wim@linux-watchdog.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sre@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-leds@vger.kernel
 .org,m:linux-hwmon@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-pm@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419b4249a6860357da8b3dce2e2146d..9441ea827524df368f5aa1304b0122bebac3d245 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -245,7 +245,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806

-- 
2.47.3


