Return-Path: <linuxppc-dev+bounces-15970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52893D3A569
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:41:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6m1Pw8z3cL8;
	Mon, 19 Jan 2026 21:40:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819248;
	cv=none; b=I5USNesyPUIdk8LGb1L0hia6k4mtreuWKQMOxEERGCKHrRDLU/HZjZSJcmihJhvQ3DU1blrM3d/rz+gcUu55kybGr3vTzdMYWrF/KCkpRaE/uhqWb1AXNtDIfIPidpXV1+jdJhskD6zQHoRRHoR85G4O6xiOE8aT8+yZmA63cZ8MywCLAD9P30R9YFH2XJyKcWtWFwNus6UnF4hoCJ9wOQIQuQPqOEPpaivfEK6oXlncYhprYtqUMH4K9gP5ud8uBbymeLJZQYAYN1QRLlr2QmrKEFr4fXMPhtvXJTP3F/ERBiyjSHIEnaUhIWzXk1ON+AvtLJo09O0oCgXg620vYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819248; c=relaxed/relaxed;
	bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRodwZx3bmNn1tZMMeq+rRge5gDDutMsO0XEMDYHOhEo0bxSV/uitY4NM0MSZyH+AoAuTerc217RKJo9w1qou4W1G27pd5dEebQOVhVA3snH+foYQUEyO9GDHxHTSKLA6fQHC+O7MadEYDSlnKs4BPlNiTbtc1Obz/wFFPHKgUDFFKsKHkwHLnysuCJSguqHEK2HCObvhOWwAFmC9FtA3PuyU2r5x9kr2uc8X+7CVPcweUfimY6yIIh/xdmKdiDqT4v9Oxm2AFdibqSV/IEmkFI6jucZTIJsyg4HkRbHMqgHvz4y8hyMTuI/vlt2iJPMCyVKW1o2TTzMZRRXR+eBVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfYRj9j2; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXZFzYtX; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfYRj9j2;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXZFzYtX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6l4G8Cz3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:47 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAKJH71531837
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=; b=VfYRj9j2PNJX0xTQ
	LS8UojMeyGf/yFkKE15ePZh5QbzcuBMbCRXmrRZREehh/jduTzkUmLrIW5NwSjGY
	le2zU/rE39ze583tqUYzOTOKOfb6xKUNz/luf/2modht+drwAbuvPlMN0RAvsJlq
	7NrfmmMYIKhxeKe3xXmy9MuvIvR9/yF+GDEeh9+o8lfP+dKlFFYPh/5hO3wG7CkL
	UdRzl82RGls1uthJ8VO/55NlQyLreT3avHOgrxQ/LAxTsb+jqH0xTmjbyaXAy38d
	nyCMkMPm+Y3hkT+e1SaU3uBB0Ms8ynduzh+TunPZVet9OzWKBOZpUq+3tCRWsVX6
	kxIV5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxr20r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b20137a6so475660985a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819245; x=1769424045; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
        b=OXZFzYtX5PiOnLeYHYT4E9WPqKreER7POi8OV+sJObe5/ffY/rWGm6FZgpJ2PiAUhh
         /OCY7wzyV1o13xhiNJBrE1v2nPOocB5OW1jFZFc4jbywvjELgAoL46qyNVRVoFBdISxv
         YzSewh2MJYAxF7UilvRzauv/tZTLRNb5njQNds7o5AxqXDawico3dNVZR63Lx644N8Aa
         JCEINR5FZYaHIaretM5fmcQGxfppmw5b92Vfys+pN0VOe8JSCuX2pEZZHfF5sMGjcHPz
         uguzC+VP1kzwavRpi+f75ZbuarYHGhPO1U9HCh9Fov2XHRKwfWGN9Fx4xMwlh4vraoYi
         jJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819245; x=1769424045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
        b=TTxYf4Jas/cFx0gRii124yEkoJV5CaiaaakbQe10Yj8jFnpU8Z5XflzHTWlwKdDlk1
         qu5rr+9UxLP5itwaH156wOsW504fu4tkdsUMJrudaIvHZn6kmvhGsRK25knehDIh9n+c
         ZuDf09QjzJBYs+aLluV7DVEcXVaNJfPHxgexJTgp0Nm+UN8JCKviC1y7WFuMMA4K3b4o
         WjKN9ZXLq/t2aDR1jnfiHIJi5eYTa/BZLD5S1PJDYB1dcnt2g9EseBPh+u5Ah+iZwg7P
         tbApTWRTwiy0TR2h03yoll9ysT+iD0Ooq3QxTHsqcDTPyiZQENYeF+j7+gtAJr8PKS2C
         xOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbyvHjXR52G02lt68YHMAKvm5fdcF3Wg6U410LJdovEjLU7bLnOJD6h9FttxKggWDeftRbMLTnY/u6iBM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQEUzrkAhKx+puMk27YJZPiJ0kqqYhax+axmQceK36s/r5p6zW
	LfzkTBHqJFv8CQxz/ow3+52Yk+3axdRPvwuFoeZtobaYwo6WgkuZbHoLldCGdH13Gi6no/8zwMS
	wbjnqz45eUawFAOKQSX/EK7VNx4GcWRkKuqJ9gccqvqioWNOv7xc3L6HltPzaYnLSsbyu
X-Gm-Gg: AY/fxX5dEW9TJXCyywoF2GpPG9sRGIZ2yDgy5u4R3dUhrFJ7Ri3RIP+PCrqPZ0ZPMDk
	bTzfdxuPPRwJL9VkQkbFNmEHjLaVMR+lPImMMO4ReGmN0D0gYTYKt1TQeKsGRwPSDaTf2U+VhlD
	19x85RAjGTpPoRAeITE6i3+f1h3SYy8kdCfo3aKbfvBVciaMGFfD9LwO1WJEIbWQuIJLsL7NzET
	QOAa7lIDWp1njUoI5/2+3j30bjbYzYF6soeuSMOxdLb49zJhjwMK5sAxSh/y16woEDZsYFHkchu
	tMLmZ4STFswzFjojgaLJZDLffiq43RFJmBsWuFfWwVB3pU/w8f9/+V36MIFvDhD3C+lBSXpIvV4
	Mwr2xToUZvGO0AbHfX5qghTTtYNLDmk9PnKNc2CvO
X-Received: by 2002:a05:620a:19a9:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c6a670cd8fmr1467498385a.40.1768819244752;
        Mon, 19 Jan 2026 02:40:44 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c6a670cd8fmr1467494785a.40.1768819244181;
        Mon, 19 Jan 2026 02:40:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:19 +0100
Subject: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
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
Message-Id: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GKVObXCXNC12fSCZyvL3ryQ6x2vBtI3uuvqrxKyzc6o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgod2Z0XeYN0hebAo6LmFskYdjL5FbX1EGXvo
 I3KG/9vZDCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KHQAKCRAFnS7L/zaE
 w6ynEACXUgdvUuKIyGdhXbkqmx6FYZmuzw4u+krC5x/9fU2AvfjEdoMGWsMBlbEfRgb8SD4b5Ey
 Wuk9beTVoujuYsJqtMB1kexe1ve0+ibT/ooleUNc574lFxHYDSAqFuhAcqN9lgVdJUqOL+I92Br
 IJndTOD1P84qPpzERNqfkix/k060FWZcyag6YVcDrgqR92RpHK0gokao/8AZbM+LiWbYf0CHM6w
 MIHSpKSjUgILEVeOGjf0JxqIUr1dbCQXtSY98u96NAqI/9XPeaeMbtTKG89yy3qeoLN7Z74SKGi
 05pwXG4l190xK/MiT/QXVyMvF9QMobxWIRQDdIAIh1VdILHSz0EAJU17fcMWldP95oK4zDsySzn
 tSyHjzvsArXa7WK8c9n7Z95ENQjXS6er7i694Ud9TjbSOe4gCyAX0cHLeWKfY42YH7f/0095ho9
 fz+379qIEV2Bu61EjCTt4S6FW+Q+pVfvnWhYI/Aml8gwbZRnnMouovko516RweLmcl0PNmQy75X
 8a8hHzKrmq9n8wWa+anMcuTdNX4YXMjgRILsEiuUaVLEz2PbxUcRjVsyO3yjLdmG8lwNImohj5p
 lU8lblx+dpgKKq6LdGtiqKBbciQ9Zp2iXfMqaiNkNyIGdlzIsH+r54p+7LWdt8MjW7ZxUNs9/U0
 SY+metMEW2Zh2Hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX4z2ToQrOgB2H
 LExTQQ9OeoNI48qaZUICAc3WKL2xfe4I54C8ZapQiIKnHIDThIh7CiQem3n9hevxYzlcwN8h3OC
 sKmOeKBSa0K3ZmND2ltvtDShHumVRcnAKATQ60ctOiWl/AONKEJ/F/XqdLhvlIHUNwn1uyiy1hx
 WIFqFbfmNUJ1faQWFUZKiYh2l/yuNHjY40733atvMk9IuHw6LkqjzH+Oab4TBvIXUM7Al9Pav+0
 2Xpg3Uq97Dvq6Ql6uEnP7l2R6ujI3jRrTI2kQ9L+IAshoHQjkEgWOim6PrBaRh45/uZKKeJ6aK4
 +accnDBPibY56Q0vdg3rjADW3LxdS6EGYoTmr1jKZprOOwZSGtqe06cTxIML53i2ekbiWyPWt7i
 dIDldhlLzvZu6p0EQRh6/bijAVVrdgXoSUjh30ov0x2sAAuraAUFSC1COs90bqUeknIayM8nC4H
 Oovyhb4EUAPyuum+ZHA==
X-Proofpoint-GUID: ayIAVqyLS09tAbyJ_FBbPr_j5HhBWLhx
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e0a2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GnGDLHjXiqABGLigSj8A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ayIAVqyLS09tAbyJ_FBbPr_j5HhBWLhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088
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
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb84b60d1872b31c27 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __initconst = {
 
 static int __init sunxi_mbus_init(void)
 {
-	if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
+	if (!of_machine_compatible_match(sunxi_mbus_platforms))
 		return 0;
 
 	bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);

-- 
2.47.3


