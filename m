Return-Path: <linuxppc-dev+bounces-17700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCagOYr1p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:04:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B77A1FD1F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmtC5Yt6z3c8W;
	Wed, 04 Mar 2026 20:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772615011;
	cv=none; b=hl1ZYVchvG7+KCT+50mqZbYOoHqaePfZF4Lx+51e3JtJ/PHoA96U2GnfGlglzTYBkbjXYe4XB7of/19/vSDsUSK5n85M/8YZ9gsxYdh8pYzk/js98XSOrP7iifsxisG4bq1NKv+vwbTIJZX7Pt6F++liYoppEV0+CwUF/5JNAZMpoJdbZyqS3/6c9ov2m+kFWLGfWLpo2LzqtorlXo1AIrzBLkgh6B47PJl9ZDXLGvuPZi0hvsIfxZpOaiZ3zki7XDoziWlNVigZyYgcGdM8/u2wi+TZO4y98J3xkGP/IsnfBT3iKtoktrlGwx6myJpcxFhPWHfBrDytghe3e70xqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772615011; c=relaxed/relaxed;
	bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQXyIJN5GmN8YcFZoCzwSFe/ZlU/50yAuXQIUX9hRp63LzlSsfnZrupuTeQ9TACliU+5QRNLZzgkUGt4PtAVfMrbc3qGF6+fiPINXJR2q64wnXhzQMduvKFJM6mv3DRHXmDbl96EOrBH6nXu2xPHBU3/IJBo2NWGtzzOpfj3Al/dbx+tBk12Rk3l0xw5pc8pDVrBARch/WthrnWOe+18RQfJn+91pSLrAo+Jod5UHbQLlJ/Qm6EyGDvhg6n0xBL5ONOY7cIK4cu3h7P3deeXu+k7iKGa3snuyAGMWgX3NKnV9JnUGKEWBcXnjTKWePjv4X3NJjR/5fWmlvWZK7NVuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O8DhNi6i; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO6ctDTw; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O8DhNi6i;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO6ctDTw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmtB6VnJz3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:03:30 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQsY2275097
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=; b=O8DhNi6iiQ0wr6Qm
	XLgu0rlhFSuVWEQJkPbXZmZ9JD0AwZqTH8m46nANsRAK5ZixwpLI4VIEw8Za8BCw
	d4WiUqgPneaIhP+Ubju+TIK3gQ2rtr/xMZVAsMGU44w6cZ+kxjd4e/FlWaQiPO1H
	BR2NcuGvK08bm6aCDi8fbg9vt4ty/wRRgG3R3lMHBoVhwBQLmvzkLaw1B5gLozE9
	l58MB+oJBlSMflR1Uzzsa7vjJiRM7ipJrU/Bd9Wa0PWEfNFOuppvZiDZQZ43xps8
	qIS/mrDUT0yrBclJLPfzLA3bR++4OOCwfWGHZ+RjwPOufd0zashYK1qlwHOJ3UqD
	3ux1Vg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms5yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 09:03:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so828639785a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615008; x=1773219808; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=IO6ctDTwbr2SUrTgfAW/vAu/NehxwjKv6I/eHKvEDfxKz0eDT3QhQMG07n/GHd+cuf
         TRhseAgO321N+8fL+/WpGD7BlcdFU4fgwealJSdpLN4kYyM9wSnsKW+MTZDfdmE6VXSX
         qOtbDKRbLZUKxW614WY/yOAcLBus6m4IzuN5S1AuQmoSyzZP/s5JYNfG8nKq3AVaWA5l
         v3WccbGDUiNE1Punp87f+67jWTO3Y6+xu24ZItp1sJHg+E5hck4QU7O/wipMlSqWKhab
         Q4Xvjcb9cVJF1RMf8F6SdrdePv/7dTRyuqDV7feBdn+mq6PZJknWUnEiRzABPFzlZQ7c
         Sqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615008; x=1773219808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=Blwb5rVxMSMU15Eua5/4ac2YOfIR8rBbf3GejZ3hNFkGQhfEDXTqfD/OhoySewY2g2
         TkXGnQGVFD5kxFz8JU6e/7r/ig6syOG5gIIMQNsblhrvOQ3Hmrqw9n9FqRwzIoSR/ri9
         A9Ue1vpzXtu9QfPoHpvEejg+rw7i8zkiJsZkksgzPQIGE46PcjEjDOHQ1zdgoE1PUnHR
         qvomExU9YOtVnJ/xPjim2BUX/R2Jn/X49bBg+KBUOxnSyPTM6pBArw36+oPb6lBhcu8r
         DCn1DID7QrrQw0SFlEwxGlf46sfAR0ZFrlz3kPc9PzDYEcVkPcUuzvHoMNlQwLHU3bkq
         N/vA==
X-Forwarded-Encrypted: i=1; AJvYcCVa6GNw6CuC42ToK5381WlqTOZRd19Zw2XbSls6UJbmiJCfzKEVNTDDYH4C2RxMvUfih4xkknoMXgy5EEw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGqNF+RjaxZ9xctsgngeFMoiVQHcGYI6EV9AdKai69kvhhIh+b
	kNmGGYtjddFhOE8bB/4yB7z1yA/iQcnMxMM5WkCNX8L8wugn5YI98Rop0ewyj4jBH2ebykpN/Op
	XmwnuMbv0Cj0UAnJLfJNSzb9WGFrjX+raRCQWm32uEd3wHuE1Ia1IwpbFwylCcy8bi//U
X-Gm-Gg: ATEYQzxuA695jRf6Ur/PcdoGXe4VUPbm0ORFP8WkgC6Y/CI9WrMIblC37s3MPeK10zR
	KTmeL5dL6y4nezJFnbFJL5T4wefHGgQxaTNFxWFkjCL9Sm34pdnlph2nZPNtmEhQfw6++VeUYVa
	MWdWYFZnW5XTYhfj82FgMIozz56O19yqSBbmLckHzUjvx1C5l0oUOhxIaiIu/oLGKECrdKd47AB
	L6k3PIX7jPA+cRFOdL+xYJuUE3ooRSsBJ1cgk3LLy/fTKlklTpG6ESG1bOMlY5+JsTHBQ/MszqN
	JrzEfoYNu8YUiZirDVLkyb/c+nmj6/7pH8xwDHm3ziUeGl5PyfrlmRoSCsMsa2rf/hEf7e/1zLq
	lRPPT4b5cX+tPurBTWX3vNMI19c96I9PjeSWLJdU0mUmtiOVa6jG/
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148863885a.38.1772615008137;
        Wed, 04 Mar 2026 01:03:28 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148858285a.38.1772615007620;
        Wed, 04 Mar 2026 01:03:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:30 +0100
Subject: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
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
Message-Id: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ0gBX6ApkbfQGAvIdrTK0HNC5TATefci/BtaAEAScU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uz6yqxw+9I2xsnrbiXWkb1Q6qa6KwlYI8TK
 d9JejBIMTWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MwAKCRAFnS7L/zaE
 w/3aEACwVZCfqTwZVPWkHYhO8Qy3o0ruCZnb285a+Ylf7yiCsvgYQn0a+sJ2Arc7KxxU/aPIXGv
 0aCZMBstfCGSxehuCnwhBer6o8ip4bb7kyIIkx0dm62T4QqKQ5L5QA5G4ciTBJ8EuvjtnSMeGuJ
 95epXjl8sR026uh4KZEYZYxbOgIWvV2Ug4vquTWPnO7T7/frpn7ujJB7EUgTMG+EHBSM2FIE+0v
 HWjaX7Q/qKobdkdnrFIva7tNsWe8WCAiSmYSvQGlWmDU15f/4yihAn90zQLK14jwUIIvbqKCRxW
 bhf7+1haXr3TsZRioTZ5+sP9XAFSH7Urm6a1oEoHKB06fJnOPAEawTfp9MNx1DfqPO3gvgmONrV
 yrSwl3IpJ3ld2yUQuOFT9i2nmkedupRNvQtalNFEPOpJtbP0bakZqh+KnXuyhvNKScPwT4MVgHu
 Lr4cvrNkmt//CI9a0nV0Wx85nantYCCTBfgiWEr5WrWOVDtQIL0JTuP/KYxN6KWjgf2fXehFdib
 dWGeFHTIp/lY4HrTk+4tQ6oetpUDkdppOiusjNeG9zYX5WjnV48wsSXaXvsw9gkjpeLyJAf1lNV
 3dZw5ihRTGrkMUJYU/0S567LpMEIQZfQetG+3NuIzQOs4p3djYvv1xGRysT8SVHkZVcA3vjwKfu
 YphKNug3FwuWLkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: x-57dw4e8BBBgS4Xcjj8oGuROSOTFjBJ
X-Proofpoint-GUID: x-57dw4e8BBBgS4Xcjj8oGuROSOTFjBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXwkYibKVnwurg
 56IM5O0e8mxJqR3f/gPRdFI/MPIj/nWpOeLGyIkUdRVNmV8nLDk5CRDybFvnX5kMho5/BuZyX0J
 lVH+WCjhV8z4U3YwfG1nva3FVpR+XL2k5LnCfXzxGCbgwpGfUoFcvVysvnQpQlviCmdMqApR6/A
 77oFTed3aXZEw9PS3T7SP4/gmgf8pZsFl1DWwKxmrDpQYbsu+ufx+qwgfrdVtP0scZuIeqtM1Er
 DfjMH+Mgf0gp43y+b4lA07FsPOxmo2o5IsU4feifoz8cFBL/ZJQ6Rl6K6Jjq3FPw5860AQhdl/U
 2/N1BPVKXyiYqEFxKZTsCEHTIJ40f9UXV+kFt5Q6CANpRVgi809/+4cS7C5OTxAeppzX2o8C7YG
 drHFSi9uPSUSg5Ngq2tvWgmoneaLv/12ROuhzo+bZTQAOYRR7jdOZrfNF6CFfEJIbOobTBdYKVk
 CvueUnkmQMiQ8GhQ9GQ==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7f560 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DLk2I_icXWleI3Wn6BIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 4B77A1FD1F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17700-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
 drivers/hwmon/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8f7ce66ae3a258ebd439ed97441bb087dc01c76c..fb77baeeba27b9ec51142040beccc953df0a1e3e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -775,7 +775,6 @@ config SENSORS_G762
 
 config SENSORS_GPIO_FAN
 	tristate "GPIO fan"
-	depends on OF_GPIO
 	depends on GPIOLIB || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	help

-- 
2.47.3


