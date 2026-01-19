Return-Path: <linuxppc-dev+bounces-15964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58677D3A55B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6b3t2vz3blq;
	Mon, 19 Jan 2026 21:40:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819239;
	cv=none; b=NYZP6r58KM6CYIbSvqH+EDzGdbZeremJEzt1pdtJ63LNEqhP6FGRQ51KGLBLaux16bCCvRc4VIjgo7DFsNBckPj/aQ5Q8O4IDpNvWpB13GoMLAlZ2YY2h1eUfd/biQkwN9Fao6zZ5kW2RT9bNbyYrLomZoBBZkQfjez0IX7gz+egTWsZKSLRyB/NctTT2xy7SrFretwA842Bbv/7dTmZG2sdnumrYzbXWa7cprjt9jinteL/G1bDhNgosQHdLXcLiLn+tZ+cs7O7e0wZ+H5o11yS8yR0WySTGKS3FgcRm/CaBYJuTUGwLy2H1+viHbMOHqkj8zFGjPcbH/b9rqdYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819239; c=relaxed/relaxed;
	bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZB3JKDgY2K9A5IlS6Pa1WOyFsE3kYNI6eSKN1xbQ+hrLdd4w5JgKT3uQ/635CDAjrKDlElxe8XGjyUgFvwpsNJGLHtiu7Wsi/YaCMiytP4fjFla7BZacZl6plZe3NYsdf+7DvjR0DBgatInAdgvU0A7rPomEVDLrKVOhde/g2Am6J2oIdcOVggld+QZ75RvabPULLmBVRzmmxmOaqp820TNwLcf/GvlyrMtkRaOTupzkVKqbrEtTRQRXppDjkV38I2R36X6KO7xMQj5YH55gzd6D7m8C3Po0Jl21R3XBY59cWgcOphl6uqo1r+/zHRomBNuStBi2L0plkgnPDa1mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAQzRxvE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9tMV3i6; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAQzRxvE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9tMV3i6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6Z4337z3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:38 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J910q71044261
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=; b=FAQzRxvEmOkq4nwe
	6X908BdsC1UZgvdO3/qB+bGuI5yR1xBBxEiEQExUjqEMaEM8Jlxl3e1ibPb6qsKd
	mXEjmF/F5psoWQgO5tZXQi2phTwz+VlyzIMh0oMO35YGv4JXiAaoZGEKusEAnPiC
	f5MBTEfoWvsLIe4Sg1vzdQlW+s23AuxICYj2AUMxtSd5PxmJN9Z/ExawqgoiHq0K
	E+ux4kdd7FLsmVB9quWalT/U7JX2KVrmnDiCdcXakwkTr+96+BKqKNGL9uJsef4M
	5z7jP5VgC3pJQISC9gM57gVMbvJFY/r+Hndr7SwpMPcYJmrN5rX4OAqyFTdKaTMT
	zu6WgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehst5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a87029b6so707682985a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819235; x=1769424035; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=P9tMV3i6juSMcFinmb0sVEhTSK0kevIDfbG/oTZ7vYibDOUXsR+77acK1uze9ooAX2
         /l8/2URTDtWVGUlDVQ3bYmtRFNrjCffNdw1pfkOUJX+JOxSg6SfcB9GA7i+c+54p7vuA
         TxLzDw3wh9WflyPHHJyXSG644dY3wYgoG2TdCHIqOolbHiV/kFkcLs+D1PEKWIlGNDMX
         idfhuQSCh54ma1tOHzAPvoKcISYGT4l5ZBbm/LdvYpi8SA7zT4tmxxZ8UTBy8cD7gHms
         VJCrQMj6jdga/eRHgxX6IMGOmel4CjZHba71g+C20GhgiWl7W4ENewC1+mbQig5Zb/n/
         EwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819235; x=1769424035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=CoGp5RKlLbU5dIR6KbZBZVUtv65pVOlqOLtkfixfvSHqVwCSd3+q2ryARACblfyOTh
         FEFb2Wwn5B/YgyIdpjolcZIUkSceaMDrFachqBfW+HGToi+D9gTS7UrViQv/bggDHdU9
         wFblXgT7EFZbZPIGQi6J1N9VKOLlJZpq1ipvnxY4yzaeMLC3hAFxLOm2/i5FXpadYSO8
         Yrm7SXXHAYpABv5vsU8jba8WJSp6p7rkJD8smlUTXkA5DIW7iLYtNqrjNtKPdZ+s3PjZ
         Q8lDpHxzn4nUnunciN/a9cLLt/PfKMhuWBGLtYcWtZmKUKCv2oskTNidJRPLmaW3qgj4
         OTrw==
X-Forwarded-Encrypted: i=1; AJvYcCWHhvOh24rDhyVeL9D56p9SKaM61XBP4iKoOReP5fn6fxjHRfy3CdwA7iBFEaeQ/k098rtQVWHLb4BX8fE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YytIem3naVfB59lxtJh6PTQ8xS/zOYFvm7BWW3FUM20ecVZe19b
	8JExjge/zaQaD0S0PligRGiFu/+6PStiPBEJKB05RYUyYNzOCraANHakqaKqwOWqv5DaMa8gx08
	17WqlYvvgFewJtwDKdnoQVVQ1drke63ZwvwUNq81GXyqOcc6ppr+oSPVu+ktCsgXKIyKG
X-Gm-Gg: AY/fxX4KLajuum0Ct0gbCq2+3mPpvjNmCVVmTXNSWO5ZcN9Zj2Q0o+RtAcVPHICFTEy
	LRya6qylapVUU60XXEDpfF5xsEuysQiKs4qlzeZAnVTDUGamtsulFZZrrspbb72gdHWuz1jrzbM
	aTuDrJCdKCJNkKS5d1p3PkY1TICXoTtbUGhaYSvH1KRCwPBoMhdkw4F2FuzyTV8MQ/P4GbPy0Tf
	LPX0vuUwCCtc6kzhkZ3nXNeAHLma8xWCv37eD3w/Opwhi64uU1uF3h0Q93GZ/djF8q39MP/r05t
	fS/PQcZ2O/Pn+Gj6gsX+PPrVDN7y5qulzysR0Bx/gHg+6Pk6z9H0oBimVgnbnHD6ZEQUo+k2r8D
	l8HezATdovjLu/Tjp7LUt/9RG7bTTp98qxYsy6xMi
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549989585a.16.1768819235528;
        Mon, 19 Jan 2026 02:40:35 -0800 (PST)
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549984985a.16.1768819234996;
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:13 +0100
Subject: [PATCH 2/8] base: soc: order includes alphabetically
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
Message-Id: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WqigZ1i/Zqs+7y6icbBSDn53U4awykhgsyQ1e8C6gJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoW6Dw6clE1IffARf8COVJxpRB8cEAp2x9pG
 TvHKRUu6z6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFgAKCRAFnS7L/zaE
 w6xoD/4rWvH3uol8I2IuxI/o8//O6VGtI2Wbz5D5ZYLXz0QFVJIXy2WIu6Ah7+ZEr0Efsod56Kc
 n2bdeCvg0FKZ4aLOs0Z0MwUwBiM9dd4taI3YhDwKv9mYioJwJKuwQe/XO/b7XuA9ao0/7tBOaCn
 IuV6Scj50Yg21Nzr6GRDYnNwJ+uyE+tuwUd/M40ldOm2s5EwYhEp7FsDBBP/E+omcFWjPS6Nov+
 kX2I2V2/yIUGQQWeG29kziuKfleRHlV1bU5cUE9pA1HNciTqA+mnvyxzxVWIkDQrharJUgQRtMY
 DlviBwLuIHWnF2ovA1my1PVrtpVBHBnamhoCKE1b+Juw7Y9sAYgMn9XHTfUliEBSAMWkrz1dlqo
 +zuMqU8zOf3a/BuE522FyiFZzLic3mZQgMWObGa6fVltN2UmTUFtssDi/u5JGQ1frFckvuQfRmX
 vfdP9mV6kZWAM8JRdKRr6Z5JyxG6XfRwQGGSMCsIBWJPIhZ3zRERqGaccJJmDFmb+u5F4+Y5T9M
 Y92DHCIjyI+KaAozrJzVRFGDtOwa4JGy649HKu5mRvgXI5D0G8lz3pTIYj/cmQPBPZa8uajAHFH
 ggYVJLo6V4JR3841jPEdpWhak9LAKC8Zmznb9a7qT7A0Ch1sKfQ5iKSJVloQbXmUPWuZyO8A1+y
 A1GAbxKMfKxOKAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX5EaatNNhqFtt
 eMyk6TGfzU6WptoS4BKJT2qcrUtSf4Brele7thbK0FHJsCTFNwtGhC0SdFYndsw/UqDHDsFQk7U
 Bq270vO9dCx88Ctmk2VWWBpExiLebGj9XYaefC/p5OtRsDiZyN8EFU9QIUN4npIvqngdr/ntUpw
 QlACnZJuIuCZPqVBuGnQMUwRVvWG5OboQZbbq+oc3ZiQQQwu5IZopPH0OXbqeci6Ac8Ga0v8QVh
 UHtXbPDjYitLdui7Go8/XzQEUEpr+UfHkirAkRuTsEkU4qSbTxd6pYFDOw3i9zW9d/TCb4dsrlF
 CgYf9g5b0vx2l4rqaRsatV9VbkoStyKM6N7uwk6rrh6AUdKf2zd7s+NfU3njffKKp6pn9McvK2c
 U+ueWKUyf3insZluhDv/m86tr4xBJ2LjzFbyzyq2TCFhh/vBb/nj9Cx/WR97XxXn5i8zNtyCS3g
 Va0GqmJTT6lnTsoTYNQ==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e0a24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZFCmbahrWokcDKAChN0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rHl_aElswPuIYDD2vQ-uoQk6cmB28ZU-
X-Proofpoint-GUID: rHl_aElswPuIYDD2vQ-uoQk6cmB28ZU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For easier readability and maintenance, order the included headers
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3


