Return-Path: <linuxppc-dev+bounces-17698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNDALXr1p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6091FD1D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmt55r6gz3c55;
	Wed, 04 Mar 2026 20:03:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772615005;
	cv=none; b=VK5EcnOUJUtiBHxJ2d3pApMUc3ZIBNvzG0PHjSklx7yW71FUxkd7nYsuCNmcU6qDUNdo3lwiZrYK+Ew3vgIRGoIJK34zPpGHy2cuwUtaM1LzO44KnSDtd7azE1fYpaLoxV+ZUvFgg8co0wa6j2ls7Yr7IV/qA07+MLPwV/msFP54vk5HbSk6Psmj3YellUsgOhy29qKVUdymkmklhnlwfbxyHgA9inNpzfwgbYqA3V980+jA4Vn/qQXE/Gx0DN4qW0vjAaWoRqbgQxNeA4ouCQJgcbLgcMWKAhHfz3DfsrD+6dJ/PvFJjkI9X2qi7yrrAB2YpvfC8DWxsGvQpUCtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772615005; c=relaxed/relaxed;
	bh=5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fcWaFGxDYUVraUYq5Hl2E7397PPet5nSD5uu5cOQDLlG/tCUuGQDo4J95hEtXBGnWedc3GRaNlGnXZfwS9YDqfHo+CcA/HqxNortHsQFmS0utQ4/p4BY7beriyYtSuodA+Nv8INledtUKMJ4pJcT47JtqiJ/R5/OThpn9ja6POXc0O6JBILOfwIBPGF6Smxpl9/9aYO+yom5Q5k8G5yt2F34Yi6uGcwr7CJ2b0kNeQhlcOtVPTxn+jgddR1ICvg0x9xE09hsa0swAPafxCPr1RjHFRy7Ye8oWDcufBXtfACTAtaxa8CY+zk/64Gk6M6oZKVXfDP6FQgyAAc94faaWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O8hmrAag; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GJ/NAgSs; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O8hmrAag;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GJ/NAgSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmt50Cn5z3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:03:24 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SXrk3110522
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2026 09:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=; b=O8hmrAag09fqLr3q
	PrQi2quDvT98RuvxEuB1INubex8lFDUvQV6PW6VyT/IOoEWzsMg236hTDPPz36EZ
	oEt0n+qzIOmDr5S/0w55w2tdjibkqrtHd86R2y7ns9opQjaa1FvC3AZoMFoyHnyj
	35m33cs6aTBaSZT4Z3nGKvSYN2W/uO3arTryKVmdJvZ+9Q726sp3k8RpSAjzR/Yo
	qOeaASs+FQymTU7agJd6vuaynSuxh+fEc52MjMHVku3DfJlk8tOUAxKOD4YjcGbP
	+3nVFCkaehAzbFX2PfnTQJ6ynl8S2dgA5aqlw3FZSA/atl3PYOeLuJuWaV/EHIBn
	8tAhng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2aguc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 09:03:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso4197998585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615001; x=1773219801; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=;
        b=GJ/NAgSs7NvUCjFJT6QX1L7HAYaCO3xwBYCD8EN/V/MA6Gp2heII2jy90KnUEUGQiZ
         FMWBwzRtsR1Vckc3EomjuJTZG9RrqZiS5R1tin+k6VzlolvVDfhqVtXzmozUrHoejzFL
         FwzMcnTusM72f0DtnnPKtCKYXCr1ndrqugqPkfi2zcKMVCE3KiybNjg7AW7hvxhsS+fl
         NAfINJBwc5IRX4H1DLotUi3fjdR39XBkvHSk8bfMtRvdtP6ZhMrtXcHFQM4bJliOarH5
         q+p/szWAgtUTHiaAerTECMx5BqxqyG5wuu/MKTB2xswFEAZsNArO268BHrOEf0DLPUOB
         yrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615001; x=1773219801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Uu8Rc5MUkLbcfU9/lpDj1Gzj2w1uJa7a9HrTNNL9qg=;
        b=bRpzjqmoV56OOVcZQoTli8iHEzSyYg41xKs3Suvux+EPn4e6O+HTlaE27jTsqtt6dp
         NwlNQTwPPPEVVrmggkaWy0hYZWDRSjelTz5jKnRqOlGa/mRnUM3jTGs0bOlkP4G8YW1a
         TzFaYBY196CntmZwW17V257K1xcgv6sbLojC6Av0JExvEgtvGSnpQVE32USWOkkiT1yS
         R9s1v9oIc4Wv8slSYb6AZiWabOtkNikIDRWKVS6dTCtwzeYSPKN4vUbfrkG4LtXvI670
         uvHmrEvAlp90bmV5+nGdDiHB+5YKew2FH6yMb4mZtVu2dz+LNWuIHiXExTDt0svtK92h
         zbjw==
X-Forwarded-Encrypted: i=1; AJvYcCWEOnF9rRLSKxyysTulhY3igjOL4cfAnG1SwgTcyX7/ojl8eIlVasgrBBxrk0LIXzRf+vlAuKO3nz0XWN8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzfr7JbQoWhBo2ywsFilpQHbgGL8g40buO7X9tArJrlbgVFL63m
	5St7I46U1edWdyGyecShiF36Z27m+6UiF0CNcMWgqA/dOxw1ttGKueRI/+dvoHHm9/+7yklFqay
	qngEScI7+XTj1ZL8cLavrPfWCX68L3SSj/QLWA22YBsDhkOj+eVW+JmRMquUM0oXwdFas
X-Gm-Gg: ATEYQzxpijqn2pX1TuKkaA/0nHHGFU1Y7Agh7hlgq3cNQPIAZCdbuB+7kDeljLri654
	PPppMYs21kWQ2sPAWj0aTvs8GOcLs95ohE69msF6Kw9Vc0pU1QpCAuagXe1bQ3fJr3Q/uUS0E5G
	msiT0fgh8gA2SoPNC0Z5txYf1cIM30y1jNPgFlCwP6bQJ68UNrLETNbwn3AKvE4zNfrHqOUa/hB
	jgKEUEngEXkicmaA5aNZOZZ+CIZ0ohlNyo1Ar//AcMyJLvGEkM0yts2gxh4NrK2Om5B52+jX6Oc
	73LS1r5xRZkddh17hOCdEoSg/Q3qEocmhqtbN4ic5j3Jmcq7OI3G5xk9wI/oja2EfS+Xf82fETO
	Zt/1sHoNBzSzvALFrxzS+7lytQ0Y8w9+UUPVnVVS278424lhiXajY
X-Received: by 2002:a05:620a:290d:b0:8cb:4cce:e644 with SMTP id af79cd13be357-8cd5af0bcc9mr150437585a.31.1772615001096;
        Wed, 04 Mar 2026 01:03:21 -0800 (PST)
X-Received: by 2002:a05:620a:290d:b0:8cb:4cce:e644 with SMTP id af79cd13be357-8cd5af0bcc9mr150432985a.31.1772615000567;
        Wed, 04 Mar 2026 01:03:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:28 +0100
Subject: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on
 OF_GPIO
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
Message-Id: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNxn4ssJCq61+0YQndlULQe5RINmdH9u0N6CqwGb0P8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UxSO5nc8kZcTUF9RyXKUJmf6Of1AYtIHV0U
 6UACVndydKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MQAKCRAFnS7L/zaE
 w5i9EACQjyTPxi/a1QXOxfGfBGhdjzZUrgi7jiJL4MvvK8VXQiRQvaR2vGldWmrji0tQeSFZVH3
 Zz51abeGu/KvkaZdo4U/rXM4ZC+Km0Lds2jX1QQ8qCFhWgQ1iebcXeJiHNQWCh0wNnY2/meApzJ
 rvzFAhGZcvzdB8OUYP2lZ8dDAMSX8tKOCXynkJ6egYF7XKdJ/l5I6olmeYb6tcEndTOuE03j8tJ
 QbJLbwucLEN5fE3mu757a9l+JrDgLZA77UbCQXFgeRNsa3CxuBJXg5KLeKBXxI5b8W9dqtDWs+4
 CUvvivch/oaClYS87HV6xVwbsGtHD/qE4Dyg+LcqEDKG+dEa7HC9J7LeZNTVqkJUncN3ZAURtrX
 DcQ1t0Ny2sl8WGcfVA5d9DXSr+yjwdgdKdTyiWQrgS2SGU4SKApVGMT19N+juW/HuIYNN0lMJLe
 6GXfm4DUPPjdB7Z46C5uxrTzxEXdGy36eUclO3LQD5Dj67INf7uSR4VFicumGPkf2TRxY6hZ63v
 HCBjI+tS8cdFiPdkuPoT6+AeScisOZ+nTHhHbx4VHfRRNr23JTlWhlUR1uBeR0mQJwAhXqhUVnH
 I+9SsKxtSrdhRA4F5iojV2RWJCwI/ocUowc3fHpCopIkvmKDYE+51TQ3J7ICqF+6zRQFlRKUiV7
 NWCE+XrDTIp9bxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7f55a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vlgKDOFDcSGwYYau-yIA:9 a=XcN_yYmeaqUB91j7:21 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MvzfbCJHH4L8iI0kbgfWjTB2UuLrKu2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX025uTLgEtJip
 oxJOiAtwrDFdFcoowUi3JuTApN6WjGyGILdWyLR8WujvZXNDpHah9JivCmOjXDWUWni9MUl45Bk
 ls2DV8OCfNNs1RcuN/wJ1IeQKGI6D5WrIaYVcoOMfXONEQlnha0Lv95W57rNmByBnz9MKOkY6cW
 mjVOz6hpAsAZLceLxhh9SdbwMRFXnkulOjAeh5GekWo3SzumRlo8U3r3GvzABM5xDOnVDgQ8+2D
 4uUPUlsLRp1JRzIYX3qrOFf2JMzd4kiVHaBU4bLQBkiP+Dq/0W+jXjECYOdjoI6Pmz9YlTzMNzg
 EYuY03oX1ZBtYhPgmkERPBzvEnrK6B6NqNTtunr6djutIdPfdweQ9PRelFV2CmY52sWn4X2dDrK
 5SvFIotlVZJJpVStc1kPdsvJPias5/UdHQt27tznSVA2g9ioNuh2/QMN7JvLVd35mrRlvYraamT
 G1LxYNhrg2ba1xWnh/g==
X-Proofpoint-GUID: MvzfbCJHH4L8iI0kbgfWjTB2UuLrKu2s
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
X-Rspamd-Queue-Id: CE6091FD1D8
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
	TAGGED_FROM(0.00)[bounces-17698-lists,linuxppc-dev=lfdr.de];
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
 drivers/pinctrl/Kconfig          | 9 ---------
 drivers/pinctrl/bcm/Kconfig      | 4 ++--
 drivers/pinctrl/meson/Kconfig    | 1 -
 drivers/pinctrl/starfive/Kconfig | 2 --
 drivers/pinctrl/sunplus/Kconfig  | 1 -
 5 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4bafe1dff1951c470fe5a4131d0c06b497a4b575..03f2e3ee065f4268dbd2f94a0ffecbbc4d89df20 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -77,7 +77,6 @@ config PINCTRL_APPLE_GPIO
 	select GPIOLIB_IRQCHIP
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select OF_GPIO
 	help
 	  This is the driver for the GPIO controller found on Apple ARM SoCs,
 	  including M1.
@@ -126,7 +125,6 @@ config PINCTRL_AT91PIO4
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	help
 	  Say Y here to enable the at91 pinctrl/gpio driver for Atmel PIO4
 	  controller available on sama5d2 SoC.
@@ -293,7 +291,6 @@ config PINCTRL_K210
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select REGMAP_MMIO
 	default SOC_CANAAN_K210
 	help
@@ -419,7 +416,6 @@ config PINCTRL_MICROCHIP_SGPIO
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select OF_GPIO
 	help
 	  Support for the serial GPIO interface used on Microsemi and
 	  Microchip SoCs. By using a serial interface, the SIO
@@ -441,7 +437,6 @@ config PINCTRL_OCELOT
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-	select OF_GPIO
 	select REGMAP_MMIO
 	help
 	  Support for the internal GPIO interfaces on Microsemi Ocelot and
@@ -482,7 +477,6 @@ config PINCTRL_PIC32
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	help
 	  This is the pin controller and gpio driver for Microchip PIC32
 	  microcontrollers. This option is selected automatically when specific
@@ -499,7 +493,6 @@ config PINCTRL_PISTACHIO
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	help
 	  This support pinctrl and GPIO driver for IMG Pistachio SoC.
 
@@ -521,7 +514,6 @@ config PINCTRL_ROCKCHIP
 	select GENERIC_PINCONF
 	select GENERIC_IRQ_CHIP
 	select MFD_SYSCON
-	select OF_GPIO
 	default ARCH_ROCKCHIP
 	help
           This support pinctrl and GPIO driver for Rockchip SoCs.
@@ -557,7 +549,6 @@ config PINCTRL_ST
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
-	depends on OF_GPIO
 	depends on HAS_IOMEM
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 096d0778427e274d6532ffa872c87dfc9d155727..206f3f1249cf50c662c44043e6d2d910a5687bf1 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -120,7 +120,7 @@ source "drivers/pinctrl/bcm/Kconfig.stb"
 
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
-	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	depends on ARCH_BCM_IPROC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
@@ -185,7 +185,7 @@ config PINCTRL_NS
 
 config PINCTRL_NSP_GPIO
 	bool "Broadcom NSP GPIO (with PINCONF) driver"
-	depends on OF_GPIO && (ARCH_BCM_NSP || COMPILE_TEST)
+	depends on ARCH_BCM_NSP || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	select PINCONF
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index ce6aeec2fc791a067bbc33a0b518d8a15402f7a6..1af4fc320f42bb893ba9f42f4bb0b6d7e034e512 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -8,7 +8,6 @@ menuconfig PINCTRL_MESON
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select REGMAP_MMIO
 
 if PINCTRL_MESON
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 8192ac2087fc363900b0018bf9e348c030d7b7da..a9a7cb101684451e5897406c52ff955157639faf 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -9,7 +9,6 @@ config PINCTRL_STARFIVE_JH7100
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 	default SOC_STARFIVE
 	help
 	  Say yes here to support pin control on the StarFive JH7100 SoC.
@@ -24,7 +23,6 @@ config PINCTRL_STARFIVE_JH7110
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 
 config PINCTRL_STARFIVE_JH7110_SYS
 	tristate "System pinctrl and GPIO driver for the StarFive JH7110 SoC"
diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 4b5c47c193d970b2dc1e9517381936253610af28..69f82590f6d245ba42b773758c5a6955063ae606 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -13,7 +13,6 @@ config PINCTRL_SPPCTL
 	select PINCONF
 	select PINMUX
 	select GPIOLIB
-	select OF_GPIO
 	help
 	  Say Y here to support Sunplus SP7021 pinmux controller.
 	  This driver requires the pinctrl framework.

-- 
2.47.3


