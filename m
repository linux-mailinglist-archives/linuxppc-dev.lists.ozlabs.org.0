Return-Path: <linuxppc-dev+bounces-15966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49FD3A55E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6d5z1lz3c95;
	Mon, 19 Jan 2026 21:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819241;
	cv=none; b=bnNn1Pcm7jGjGPBpLp9QjWnq7dHOhKsMK/eSZVyGhUJw+fZ9f6IzsnSNDkk57o2h1RJ8qvP7R4fb+rTGgqg+H/isFZCc1cVrLGO0XKLqrZTJ4hFPsDiIfBwAFkt/6Ae0uIT2SGg8+Ul0uG+kx19LY4cVPlop8O8fuyGZ+MNSJ4Ab/KDuAQ8zBN4+536s7jIZyay3X5jctEcXKHYSh3PVnC6S3qV1xMWYckbgF5dhXT2LcONZ+omhJ9hfYm4ynJvgCzbFCp2Rsr2UZH+Iy+r+gDRw1QiWB9tAf0hDLep9WOFC3UROqqA1YwFH4mMVJlwtloIzl0iY7fw+meGPK+rXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819241; c=relaxed/relaxed;
	bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYHlnp7auJdgP+/QlWxv/cdUChVtbNsujfPBYvtMYJqdf3sq8YXCRxYngRpYxW150tB9xH4FYd9jU527iP+PbzgkUnFo3AG5hVyAkwC1YX4nbAGZsjXg/mh8Ksvpib4+oSOX0LbRONj4ngKcK8YVxU9vozRKgOq2JcCsBhW90DDSQmcXIovBIAaphSxSLSz7FRY2XZD6obdY2++jDE2ZBR+SC3jfZi21dKb4pWPUg6IiHarghlx+/+qJLSlgeAdk6hCIJVxqypLBtIOSEuxsLGpqIWZp6mUh9onaYWqFtFnp9NinFqoLIY0p8Eu8jgdwDADL6LCCJyj5zLx4ThiPjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBPHvG+V; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUErKrrD; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBPHvG+V;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUErKrrD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6d0d7zz3c5j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:40 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90kcO227975
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=; b=pBPHvG+V+aldTdvm
	pilu6HfKXIj+geOWxbAR8Jg4hT2TC3v3SmvZh+4BnvnA+YlYsbTcXeoJMUC/xZtu
	FAlw8vIQHM6WbJQNSzV9TNb8LWZ1RMQ1bHkH3jeX/3GdI8Ssf3zwnzPnpP7LHef4
	k6Ov1j3Z5dqpiHT++AQKVR/o+L9m8fl4fjDIsaExLmsCAFVZh4/XgVejbSw4FCpG
	1p7xg1wWcDN3gOG4GrfRnttPczxBO/YEv/5kRF8dIyZr1UxuY5weLcDA8ZLsOVUl
	4BaiQhLjFwKMBThwM19nnTDOKwNd3zMpE23Sp701ZScL46/4kysNPjVQ3ODM8esL
	ev1iDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8m6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so1517782685a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819238; x=1769424038; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=NUErKrrDfu7YadbhA2zQjzSQNlmUlDO7TuHQc/yZRN265DkgTxuxd6ufDGLxzxdtyJ
         2bQzWwwwsbOIFV1KkBA8fqhlsl/N86lQ6G45Xyf0Z+G+rCxClYoilFtVAMttyHOgu9rt
         nE0q9Nt1XyGmWKkHoRLkha//SfzQaQE4hmw9guJ1KW0VO0fpc9Z8xEM67m+I4YwIwjC4
         k5tN8N6VWTTAv1Mkv3jiZQ3sIMNBBj0qY7nXkRfON4SNY2yg2xJwYUWCr4LY0CPJoNGT
         rQQC2LJs4F/2RCxoizLiwi1iNpIh3mMus446K29xirHA+90MBjI8wpUCO1lyPDNAhd9X
         67dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819238; x=1769424038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=uY9mPNeuiI3U+8zw9QqYgr8TSbdqOdX6qTA0upVd7H4OPYDIK56cRbGrckCrptNo+d
         LL0Ol24FcaeMNKbl80GlF06X7/bEIdRSq1daO7XemPZ0OnOw4ab2TlSemvtzglB6o32B
         1/1K5JG+TVzCfAzHsOIRQbxoqJ29MoI5qt7pAwmc3iXZ3qC8GJIEcZeUjz+23nxDBo5O
         adpj2DOsyyvzw1nauZFIYVjrSyvQsNApahE+ZpITDb7h+wShNQ4+8ztMX9fpE9sLlawu
         +TV+qt36IVCPTs3YbGdSJtsiuNr+6u/0+Z1XJ5c12mRFrBKomcC98gJ+fQHAovhVfobN
         MmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp4gGvIQod+e5ouQamRv2aMTWqkjFXXZuM/VgMHrqzhQP/I8tTlmDB5yQX7psBGNvPQ8FWknuvRfZFFhc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxERJEK1Z8qMLL2JcBUWbJB+Y3yrx1zjv/pncF1beaAACVV8XvN
	gpjgn61bWVoCA6c+y3CRVh39vW6A+QQT0N6Cd2j76E9UHgTat7g+pYMAQHyDWA2eiI7pPABjzSf
	S3OrjPneZNDrtpqbImTpfgWf218rHLp4QW6aIvSYdTc2WxW53h9fNlno6wkPRQUAM4tIS
X-Gm-Gg: AY/fxX6gG1nDRcBNNr7O8lfbHQgWfUhrbZlf0ngwDyV5bKRjYOWgdL11en4hLxeoi4W
	TkN+rUIOrgXe0IqsQiW7vm7mNfVmsJM60inRa3PBuYjtvt4PsVrJOA17v2/tddqXPP2odgxIfs6
	LZN3jFi05XFgvpTCfBkt9zBkOkbVLejOVaUa4f5zBDeseimLOylORYHWzZ+tywqCHhccgCVb7No
	vv5s0+ZMzQIaFQqOuv62k30lifVipURjrGP8rUHjguXa9aKA6CSoH/OBNHGLYLCwBKpZJsrloYx
	a9fpV9RWoGzIinqx6H8/YK8PJE2aMK+B6xpmUdaM4HorDWQCRZeDxAvKElw607XkEyz4CT6pWx9
	S89MsEFsxldEM2V/SOkBPZCCUuT/quaXBhUdr9SX/
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477512185a.32.1768819238240;
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477509285a.32.1768819237805;
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:15 +0100
Subject: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
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
Message-Id: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w0g7AInxJuR27u9srWJadHcDu30R8TLTmUaOMASFczk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoYwGcebs7TnQeHLScelsB33SEhUygDvo2R1
 Rz0CVrKa/OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGAAKCRAFnS7L/zaE
 w5J5D/9l3gjjfHn8oabJffDpUYkOaslm5iWFwsy3WllRD3GzaFol/CREVg/2njHPc8W6eROxsJT
 wxXIe8OowaGf9BENgeEaEfA8NUIlmtIFwmbtAqn1sxEgK9RG62GMxZGUDYZqiwiAQ1IhUCRBxIj
 YT88QAz10YAkhKSrY8oYfeZ9IU2FUWXWbZMGy6GURV2i4h8GRc5YDqiM+6STIp1RD4S4pRQGuMk
 LHP/fRSDznxefUp41kh61X5wU43AQ8FM1leLsCKG8y7WmQg8bhtr2DW+p4PtZjazDWXVf5GsAwb
 1n+fE/v5NLvuGKRZuLkw3nDyesXIDKy6Kiy3iUaqz5dcnOYnfFFRNFvgbLzpIPI9aDgokuOOg4w
 AXXSky8r+SmkmL6is7QCrmrDXnUhHaMdn7/V4oudwwiVN0xvAENYX5tWKikeT/HNJ7f6Y5EsHEe
 9KOKMdbzylzqjsas2M11HREQNgxrJXfnNDgqrKm0fUVmTgmYmlpC84SnHLwAFBzIZ9ZbA63CZTP
 GeMs85X3Gqv6T6o/VMovWvCYazRePcP9Hh6O+NEalOLNppUV68kCUS1lW6U6iC9uGII++8njXvo
 smph8uKv5reLDLaVa97fvnplAnD45eUsvXk1KmzUFINRupBTUl4tKJJRsz4mgQOE6nPFufkfwA2
 yUh05MLZIZsj/bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: n26VfoNDXH2BVRgVOBq8KPEkmwQwnsOJ
X-Proofpoint-GUID: n26VfoNDXH2BVRgVOBq8KPEkmwQwnsOJ
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e0a26 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfXwp6cdENZVLvB
 zVUwZSbl8jp7FzqR/dNABuNvM3x24CnJWJBSr2sN3P7HU/GZsmN07SiCz2yex5+hJWf4h3Keokc
 12lDRUXyAgeZw5Zfww7dgDnsmPO5BEYX133Mc/xUfdfC7Dh0nsDTndjN7AUSHDOF/GZYmPqz5Xu
 pIOyVwDqaYzH5c6WNJPWr8DOrRjFIfQXE7+7ci1xYJQAHIQtQuh+0jo57rELJ10ZEH90RonnMdD
 Oai+Xsx02VyZ4wC9tHEqY8bV8aKZtwNY3dOoxhL9hA8wazol0Qm+vcGbzQyF4RYsy/0GPxn8HZR
 FCJlCMgxVCUAXdbmpEcRwogiquEDN21cMMxo6krzvhwse1tCAdxWvGFub5Qh6f6ANw7hQt2itQU
 +sHZGd2Z8yq//DmlyGFXeWkf08aId1L0Ks4ZMyUAeYuER0tBf1uhxWvwfGCXikMyt46oK5dV6qt
 /wHFTHbiPk21DEx1IpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190086
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
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_device_get_machine(soc_dev_attr);
+	if (ret)
+		of_machine_get_compatible(&soc_dev_attr->machine);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3


