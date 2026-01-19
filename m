Return-Path: <linuxppc-dev+bounces-15965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D8D3A55D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:41:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6d45dlz3c7n;
	Mon, 19 Jan 2026 21:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819241;
	cv=none; b=eKl0UCLo7gq+Al7z3OAQM+iQO7+bxInLtw3ni5ocVoSfjDjv1LTz0VwgOQXi2lwqehVuTJJaCK72kl1zKxMoIa1IdARycUikkRqiY85jKZmGZ4Z4kPLnwVG+V9pPpzApeuIW+dxTS/VW0UP28JSiGOWiNwB3DTVBe3PQ8begUwXR8ZtYkA00HvZRfBPhqlD6MFuXUkhlXdoDJysKT00oPff1Jaq5McWGs2e1U9dfhRFOG/mOj6gK+DVhQYsdnPB14TY0OZRLAGOIdIE25K5m2ZPdBhh8+APSWam7u8Y32A33ZHOt+BsflP0LA9sydRk5xOiGh99NLzy62nxC770zdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819241; c=relaxed/relaxed;
	bh=igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zu2LROd9/rVWfbFsA9ejF7bAmwQuxulWTUlvn8MNgZQ7IbaUMxmvow3pxenBygtUNHrcF1kA5QTZQKa3R/aekVT5pospLzS+7sLY0Tv0CjuP+crAnMuC58l0kNH0JGJzZTTYK5MX62SIY3xVuvbL50ioYssJlIWUoh5HdfRNehheBMClEJY/F113VwjRpiCmXUiD9VoZY/i+yfHwx8kTRkmPV44n3XVtDzxAQyHL0n9D4jTlzsLk6BUVZ1MHWFH+Irg7tnhlWSuRjFxmVJd7dZ341K/wk9NT0/bjXFg+mjrZlmcS+kI+5eOwMZpmcDskgp/S/LwlDQI8QzaiwVaOFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WtUGhrbO; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhM3zoLl; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WtUGhrbO;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhM3zoLl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6c56nYz3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:40 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90moX1904964
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=; b=WtUGhrbOL3zGykR7
	r4/OlW1KGfz7xdKxgvWS0dDCsADMy3NZ4qVmPEK203fYSKO2zNCRKw8EPzt7nYeS
	dJ9LiPOykZNzsHxDxTQvjOID6ItOjmYDzUmOsFXCTr0Wizd5cUF053qxsDzgOOhy
	v9ARBQIMTjYM3nCBcpMLOBRuea8/XIv8QBNl8MQE3IRfuNIfdAXq9+BhKhSuj4eW
	G8n1YO6C4fzqUxXVqE3iz3mXV7IyMoRa0IE4y7vh06iQi1k/y/jY3d4oNxzavNAS
	ZoY83WfgRrLyaveYxpbT5cWLW3WpiBLh2QW6GUTURjN1cfkRhVz/mL1OaVgXYRwG
	SbB0PA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8k0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b4058909so404874085a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819237; x=1769424037; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=;
        b=FhM3zoLlD7kvrOnPK4mQrcgDp5yXn1+h7fcd/DuOpOvt6MTSTzXFVHC7BwKjakmYoU
         R8xfUF7Pbw3LSVtCYVkMjoY00n+ubESIQM5sDCsDS8+QUM8G7WM3CpXlS4upTB8QVPby
         wPV1lV4jzrj7xMQn6pfSk59hWIBiC5n/tiIr4W+9biP+ewOdAdXmO/r3pzP6WJlMmcsc
         6uwtGpsjeg3YQqh+yf/IEwSIeFW1UzwibtEdHllK5JIBG+Wsj6YJYtT3N8goobd1sSt/
         aRppYquFMBbmxXdZ3kQCm/3orgnUXquvDIxOvTqQ/0P1851lnero8jl53yoauTaB2s6Y
         K8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819237; x=1769424037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=;
        b=wkbh8v9hW7ELqLp9pPm4d9oET4k2PdDn7hVVOqrnlutG47UhKwJDKtm8xWWgx5qm0z
         0DgXG47xgYcBu0Vd4hKlDU5gm931X6ZEfbso6U9TpHx/aaM78Hbvy+nKyQZXYnUOC6Hh
         XUypXWeoAo3a6+M+jgV8+eZsk1e96wRk6iCJzTztrJWMU+JYCG2eiVeY6240Gy4B8NWP
         LQohaiznW6UslFaU1nno/y6mwLdzuIp6om/Lfsv7Cgqs+EoA4shnxYe75K1Ve4azsaAd
         bTM9EbX6tG+bQl8Wmtnzf1slQ5CCG2HNtQPotLmE1H9B+fbiGr3fK87AFOpzcDDQqttv
         k2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVAR8wzKDl+zEXZjmJg+xeCRtarMQ/XkQoeee8sMF0T22FmBciGOGPM3q8Ij+9b8g9p51nsKmfCxp81+G4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxI13S4vK80g6JcvTXVzb7Sn+T07DCp7zeEj63bMpCamDIFVOet
	yrGrnnTyHT18RW0ZY6LlU5vlYnryQGmcpdgGsP6ZXwaQfIKAsoqQPpaEtNcBiWNNpLHeYRZkmKL
	nA9i6alpaqP63VglisEuapoJCbFrE2+rcJ87x+FZi4N8BG2hy0h7j3Tt5L0IvUenZP+y8
X-Gm-Gg: AY/fxX5vRPFtB2ZN12UcuH2ZggmxCEJ9EUNERDv0DZ+efLETVQcgnkg6MXBFvg26c32
	PgX2TkAVmaI3mjrYmXrelQ8DVNyJ6ZHzVf9EDdZASRT1V2GwV00/4KdzJojPMc3Fv9rG4Wbes8p
	mXwGv+QcDgBftcL3dwi+GrI01KhP20DMk0aM5oqCa2w2iFR2J5gNqAAI/sSx0mBKOMFl77769oT
	oPmbWqLyNSwBYh2od49DvOk6R1IVJ8w7sU4jpIDy3BFRRn0dbYCLDxYPA1H/MaYIsNqQ3Kttwkn
	AksEe2gMOuFrNXsrXCiX5F5DHq1aaEAbjt3v0DsVVqUszVUtpPGiLk18t0bHRvAmb/1W4pVQBqc
	U1Ili8+LzU4Gwa8UOsR5hGgJfB2A483EcdgnhVisD
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1409465485a.66.1768819236981;
        Mon, 19 Jan 2026 02:40:36 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1409460985a.66.1768819236489;
        Mon, 19 Jan 2026 02:40:36 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:14 +0100
Subject: [PATCH 3/8] base: soc: export soc_device_get_machine()
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
Message-Id: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/FOsnl+0vWD/ZzcTEo1dF12opBcr7kB+UcsUPg1w+Ds=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoX3WZw5M4WHNvKkR821Z3quwcNTpVLMjbj6
 AN1sWnvF1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFwAKCRAFnS7L/zaE
 w0OsEAC7wjDs/oNX7OLNZrfQxWpth2eroBxR5f5YvRbchfyUdsKPsp/pGUq1bCzrx+aFpHxx5e+
 YGBS1c3ttUgKMaQd5jrKLaE3yeb32HPfOWs3abNpDkknl5BpNJGa5KmxarRXVPTwRznB/rW1WrQ
 ylY1lIYr2FWxe42W2R+vB612/3VwwbZ+mcYQDInqP60F34urScgzOClDXHdJuzfgW81Jo1l06Vo
 1JKeggoB1rOCAGSFsN8atiRIjo5Qqf3eX2CX0LMfn1esbyQEN35bfgJ8Pw0p0Aj3cNOE7RNxcFz
 nAKxdjSj5/8La7xLviBdOlLcE1F9hYO4UWEnlZEx8rhro+XbipEp4CixHHhjqjFb4LrwAto580s
 08lMsBqp/Djpu8FJlgvEJMsp4nf+D0Y+hKVJX12HiNC1J2+M2g/iOkl1Vrh9jRRMRPjIT+uPkE3
 jc8G2pdztcvlBzcvL2bLF6K5MpyT2ZJ5bSC/X8rJbiF2mpIU/ZV5KR9+wbgvvm2VfaE7t6CpoIr
 7qCTPf/VgJu/wCb8zjVU0J3rzNTH/JQjQI6eFfRc787kBMnyualHqCR8x7X9CTphC11xWFYCiJr
 3VrW6gEQx8bJYO8wLIvZrxKukEuCrle8mFyVNMRTGOzCRvHbKqQvajpz45u+G9rkctUxcAg72NC
 wK187rGA7W2Ay7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX2Hg+nIjE9sip
 r8OqPplCwV35wgdZI3T3UPEimQqoP1QR4pZeKFvCvfBzQH7BTnWieGLZRiaiLyw+QtNq/YK6Sb+
 Ih/wJdzV4Dl5xlLDfWz0R7iPwUz5+87x1k2KMM+uGxDRsAxLCqDBsJ6Xceahyo5C1qWHrMwucY6
 za0m3cyDhvD9Bn4e84UXj8NIX0Dj12KnJDwSYtbbqJg/3ocviv1lNmkwqkkAOM0RQSo6tV9/mE3
 IT/crv88UUMGb9RfBR9Fep78BLOd/iU+x3BVf4i5nWFOI5U/dj7EhLTSru6z7NatQzJ04isADt/
 f18kCxbppNZzxSlP45VOOMcBkByM6Y8vnq4fO+oDWYJAdPXqqqk8oqUjnL+8x8Q0kzeM0shoqvJ
 YjCKxj7+BrVXlVP2K6n/A+8KolRuUbFB6ZvVETO/gTWHxoFAeceR76st759O+YXNqI2yayHISWQ
 +coTDLIuZ1IveEW9KXg==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e0a25 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ErcRbpOxzCEhwLPJXT4v_icsUcomBHy7
X-Proofpoint-GUID: ErcRbpOxzCEhwLPJXT4v_icsUcomBHy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header. Rework it slightly to return a negative error number
on failure to read the machine string (SoC core can keep on ignoring
it). While at it: make it use the __free() helper from cleanup.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 16 +++++++++-------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b..bec8771d40f0590d4d7c3985c08fedfd4043a394 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,6 +5,7 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/glob.h>
 #include <linux/idr.h>
@@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
+
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
+	if (!np)
+		return -ENOENT;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_property_read_string(np, "model", &soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_device_get_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..2d2dbc18462a39ddee95e38826a769fab089026f 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_device_get_machine - retrieve the machine model and store it in
+ *                          the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3


