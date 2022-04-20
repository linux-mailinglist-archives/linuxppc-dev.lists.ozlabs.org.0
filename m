Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DE507F4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 05:04:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kjlrx1CyYz3046
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 13:04:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ts5wpZle;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ts5wpZle; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjlrG4YP2z2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 13:04:13 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id j9so375152qkg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 20:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqneS1sFpDsOyrIE2+1UdTS/4fNFnUPRBLnd3RmNOTc=;
 b=Ts5wpZlehNTldV56YalrJSp5dhybuu6s+42AgTPpMsMwjFt1Lis7Rt+xmK9FiGrio2
 HqLSB4P+IzJOw+6Bkz6PTrg+YcegYXzJGd4zlkOm30JZB+yWwqKV7qq9mHJMgm9uucUv
 /ylGtHPl592ncy1Ko3mPGdSmR3RmOr7Ar//h7ITZwPp/wsPT6/qocvoCupoZwIFDzDSf
 fYcOGN48iPY8aBPztkQacG0OHWYO35uCtj4BqSNdu25D3pTWUH0OjeCD8FbVBoa8L1Aj
 sDsFDbYDyfEySElrOHYUPcqUKXIq5uonPN1JW7eM9e1SOfRmSiKxCj5zvxMMKj7c6X/3
 FsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqneS1sFpDsOyrIE2+1UdTS/4fNFnUPRBLnd3RmNOTc=;
 b=LPYDzWvayG95uegbvBeptxdFgGAZlIAWcpMMa2ZfKQTzAxM8bzKp0ydrspS6/cunAL
 9vUsMheuNV3gt+hzY3/vWrgRGKubq+t6/Ksm0yjCdkI2mE3yF/FywBXigwIWPxyrcWQV
 mDCU8vYVuvPvEDWdrBNMo6ImQdRVOy/6uw9pCDC1/IUrkPjnS5bUTFSbI9ELSfZRCya9
 nmlC50iPpQq4k9PT0zCHP71wbjYxutZRsZAL2fAtvj03WE5Jxlo97zi93Ab7CFvXfsDF
 J3EuQLBw4CrMmOnaUUn2wZtGtgJERk+0L+vAUto9p0erYELaKVwSTiltnCXtv42OWzbn
 zyRw==
X-Gm-Message-State: AOAM532Ix5jst95Fx2lK4fj9/qUzrUsRIFiGn2T/hlta2d6NTopOMbmG
 8sZ9OcL0b6OSIrUrP2Bjv7o=
X-Google-Smtp-Source: ABdhPJx/s+b4syYfQni7rUQWx2AyU+UcLFCRd7P0jGC6d1QDovYVBI1ayiBLkCungiG7Xd4kM0xQww==
X-Received: by 2002:a05:620a:16b3:b0:69e:bf77:778b with SMTP id
 s19-20020a05620a16b300b0069ebf77778bmr4284035qkj.642.1650423849002; 
 Tue, 19 Apr 2022 20:04:09 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v23-20020ae9e317000000b0069ea555b54dsm901109qkf.128.2022.04.19.20.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 20:04:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl_asrc: using pm_runtime_resume_and_get to simplify
 the code
Date: Wed, 20 Apr 2022 03:04:02 +0000
Message-Id: <20220420030402.2575755-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/fsl/fsl_asrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index d7d1536a4f37..31a7f9aac6e3 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1211,11 +1211,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
-- 
2.25.1


