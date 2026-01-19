Return-Path: <linuxppc-dev+bounces-15969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBA9D3A567
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:41:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6k3RpKz3cJF;
	Mon, 19 Jan 2026 21:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819246;
	cv=none; b=WmCkSEZFxbCxfGn6D7AqLBRl9x5Q8YfDb5JSG1sFXhMW+CwXsQmsIv5gE0vrcN+5bZYAZRW1m4pZJaMb+nrfZvpjkhOU6Pl4ouS/zMi9X8eWZDD5IX9nmIEByH51sx0R6fWvDopylNXmVS/L446q8Ud+Q64Uee5tvVlBbjMTs/OYWrP3pZkw7Qjo/77IPiTz/QU7Y7+qYHK53HXm/OfHwaZ+YOQKA7rdW9gMHGUdLiylKxSWleRb+TtWWFGQl//sWblMaG7dX6o6SngRB3iPF5l7s+MS7kbrubUNpyvBufwdHqF+Hr5Nnn0mTrLPGeRLXjXSU6DhscMFQr8McwG82A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819246; c=relaxed/relaxed;
	bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Se+/ZxpGUGpRH5KZtZUTu+p5z41elWfMD84ltjpkSWdVBqjMH5Vgw6LLhF3TqTCM/5OsVWLFh4qyuDebNnF3ZyrVwOZkNFNBk8pQ4wEWCftibFILukMV5YV9wgtBrwM+Fei+TsDTeHWf4hMAknBw0FBvcir9z8N2Cex2OkBaQlEHlm+eubQiXvsFKQUWwSYwOH5b0aFMExKbWEJE4+ZuJyLTNNuQB4a1FG+uF/Qbqd+JlP/P8amBTEspuiKa5HjgdjffDe7jb/rH1OGjpWJpclCRnn9jedZru+dEe9QiWdarW8jrcVGW+ZtYTuaO+6M/0OGG4Gmuj5S7vpMnhkKazg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OBEHAtrA; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlN1CQ5Y; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OBEHAtrA;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlN1CQ5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6j53vFz3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:45 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91CuG1150053
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=; b=OBEHAtrAlu8HDwbs
	RkoTd5c3ZdYVwQQf28rXKoUCGjoutZoyT5rSP5WNXNaIxk115uqtEcji2V9fT7D4
	rBbcQ121Fkpg44TcweaCVCJzPC6t1e/MFAe31hRY8tWAhM8qj/bpY6KRaVw+x2za
	GgJnbqbGSqfJOcOv5WWzSFVonvqlSBqu/nFUb3T/H68rhbsmYdhVlH2hiWhw4hzC
	h09m2f5LmaXuKfjIgCh6xicgSlxg6MbzJ9ZRpgXiX4KpJqBOvuigtUJpqKwm92kG
	UEeWM2N6oNGeQ7nX1dcmowJqXxAQF27TbAwZBdSdqSANxpuxhN8IYqhmcHV2m1fQ
	MiCLvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e545m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50145222233so115400911cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819243; x=1769424043; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=QlN1CQ5YLz1Q0Nx+o8P7bWnelanfdR5Py5fEKj8gIIVQL/zENbU9OVblZlP2/kjCD1
         yaJOW1J0xHpaVpMPo774hmpKKkY8TwU/ZwnB1f9jPdsiNBrmmiPnJ0wAnwF+IuqX/jdA
         eZyTQM8F02R7qf6TNTM53cIuKqYUeH1pEFfQLJBqCvxfS6NgOS6MRuWpxzP1NW67BVuZ
         DuoxEveDTb3gHRvnLMJk59lQxyp0KDaC6+RauVuO4JdMf6Onism47fi7deBBn+R1nclq
         B9gvj9xXpXwt5pP64U9/3uL1YkvYHbI4JorAufhwcyNwo1V6Vy2t/Y52xjPGjpf/PCaQ
         Pz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819243; x=1769424043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=tmO8PysIsrO9+/sT8jrXHzFWuwSR+hzeh8QrRnLcFxvh5EVx5M6lIPJ26JgFeriDL/
         GatXN6fC2LbvrRvtQwGMMS6Q5pLmPWdOHEc1auJLwI9cU8cldMOjNLW5gO3aF5hG04QR
         5krAz9H7ljV4fJaonC/xCNvCSK2Xyzxf21kmO30JdtEVSX5wy92v+sFJgENfyQS5hCgK
         G25DhJUtUkYUL4w3h41Qa3z4WvzeJCDdTeJviZtI9GZw32uQTqa/yV4D5STY99qZBufB
         LgoGv/R5nXBuIO24fxCz8bBSBsITXF/h/73bG478vaxXg3nQovceUzDfj5AB9a3lUoyy
         3hag==
X-Forwarded-Encrypted: i=1; AJvYcCXanDC6IKEAtTzhDHticxJqLTn7Ia7Yo9T7yhRqBK4m2eww1IUXPL33I+EHX73/ai7ozCNQkqsZNRuCGXs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzt3NqBrEYDDfye5spq9bN3ZFszbCFKL4cyUTgIH5RnzRsCOtzg
	POnS4DjbCUjzV+qVZt7y6SwfvYPNL79BBfWCavddE2p2y52cXpnCWfsf0DJUYbeg1dcVgOsV0Si
	d1aLGkqoAfo96d+Pl+/q37IXj3lwSLzDSRi3onj4gFRyPLEFas7nXd/c2w3XmeGc4bQ+W
X-Gm-Gg: AY/fxX5tiiVoeiB2BrD3xXVriDKQYNGNV6O6RyBX1aoOwRVLmKysJlJJ6z+MdrVjksz
	GHFh1wBtDXRT700L4HkVBPFoI5dejqUqv9iYzKestchusg3U5l31v1pjQjLWtndkOPFd4RP3S1q
	pFun1E0yhBsqwSn98QZythGhxJHuQAlBqLXWKKT2vnN5/IR+5VpB6tq7S1rTMYn7RdQv5wt96O+
	jFu2TovT0A8FFH/neHrmx872gREEDy0WSEJUd+QK5iFqqR+F5DtA52khGHjijnjLdBkIQckbIdj
	q/pLKP1SU9zn7HUYlgOBAdkiiQu4p0NldZRVeINqjevFlCoJvgIi9u5pZL4/mCCEzGcp2II9sk1
	MSq1eVqUgVtRKACcWNrXolM5z7PiOsA9iedSnWS+k
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427583085a.84.1768819242826;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427579785a.84.1768819242411;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:18 +0100
Subject: [PATCH 7/8] soc: renesas: don't access of_root directly
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
Message-Id: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8VSQLtaVd4SNUXyj3qVXPL+a8sCEU/CZusptF8ZaPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgobvncIAUeq9gHK6FXvIHO2lk7wpWwVIIRh/
 iA36+9fERmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGwAKCRAFnS7L/zaE
 w1hQD/9acgWHH3rnfakx6eDD26dTI6G9En6q2VSGmlbnwsl9tJ4nMDO2VLCusT5nxXCXG2YZ0+e
 2t7D68GFRWmhge+8Yo4En2R4ksA3WOpsvKOp8tGMji/3KiTjejFLsyF8yQaK21jsa2opCwRuwpy
 OrGdc+tFSsiIs2dFImSIcB3jwA2vGfOxY5RPVMDYtZJKmo3AU+FDDAQEEytNfoRhJ6gKDbMmWLy
 QMx2FZ4YK5TYSINwoxtiVMJScQQ5iqIYPWOo5QHZquIEdmXfClYw4BX7pB8uHTnpAT16yN3GPNY
 ryBK2rrRF9eTdtkmf+M4tRv4OoOL5EmJavIowcGDyHqHwE5FlCADIpYUSeaSwTnuxfW6X1LZr0+
 kDhGDEn5H+UaCrjAqMdrFE1RZ6scfc7WAwBw6LEbaA9Hg8EAkBqrvmJD6304Y78t4bYiF4WLTHM
 33vbth+dCB4S9vw/vX+/qelRibAzmjKOoAzJe4wuTUlmJ/Hq5opVf3rk/gtneFlw/l4bj2QkGax
 u0vlJhYKqneqCMl6QCd90ysN/QI4xNDatW5h3YoMEj+TU/eMdp2a1RJ4cTzEKUSvIkQtXNLFR6S
 gUtj6o/etpKnVJYXyD0IGul+1SDf9TfejO5yWonCratG4+iSt5OrlbTWx0DJ9IlvpgdzWNRuP5+
 tS0OA2oyaV47JIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a2b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX4pKP+yqGHRMf
 R2AnDu7Je7VxTU0bpGtw1dvbF9tJIsbqv9z/Xo5NGcPbEQlJhTfSp3r5V0ogzYW9h62o00pVpkj
 J0eXz3S7HrWYArWyVoOCsPzTu/JTqdXjtjT7bkNlv4cL48oPFgGgaWVzZ7Beijt/bLWJrX8x6iM
 1XRp1wyNPcGAjqSzNK7uFT1kKsncRsg2VGWLoNKPI3OPBvd4c8Up+hOyrC6kq7iUafEFLDKA6Ac
 MUI7ks1ixoIfPFkFzbnCwPMb0PKbrOjbVzZNT9qNtv7Yuw/X6DfWro3b546gSpNkCI/n2ciBzZ+
 PghufzTTjHtOYj6mMzfd89vzTuvfyHvqEG3221oXQ4487tPExyGH8s6FIoWLcWsPAcwru543TAb
 Cw6Vs1DisuFYUthXuVRfRLdaK8AO0ib1u0Sql0Fur7Nm4SXM9FfIIjcmMbj5WkJ4X1pezqVNjxE
 ZjOkWbWspfrK9YXI4kA==
X-Proofpoint-GUID: tIbo0ZuKq_nfHRjUvsyEyjThBn7H-RbN
X-Proofpoint-ORIG-GUID: tIbo0ZuKq_nfHRjUvsyEyjThBn7H-RbN
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
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index ee4f17bb4db45db7b96c782b770e5bb4eb139e09..7c54b39b9cdc6b070a7cb6c1c03cc1356bbf0309 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3


