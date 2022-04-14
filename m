Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898F35008E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 10:53:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfCsv2xxpz3bY6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 18:53:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UPD8XVIW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UPD8XVIW; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfCsD48fzz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 18:52:47 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so8672387pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+75oGozFhysU8kD1Lg/rKFGSAHmgc1qYyotBmF08jM=;
 b=UPD8XVIWD4mPKPFPSRTZZw7rS5flMgBMcFYR/JI+sngKZx/Ni3zarN0PFke1o6Fu1L
 InBFy/wIn9tnObwcezs7Z/4Vje9aGXhfVgz2zcRDaz3XsN+ON/t/lKcSMaY7If6Ag1yJ
 QYHAGg3J9FoYCMs/l69Ds5moWeu6J7gBNh0slliAzvCo8dvJDuv0Nixw4CGGLOn9DH+l
 W6H/VXbHHQdH7PPkXEk30qQSp3wvuRWX2fJGLnmakDOkyH59oBSX83D/3gVuSZl+1ebS
 Mx2m8S4XPgLehczU2j9KgPQ73RGP98QmIo/+FBhv7qPg5NSG4Nl1FkSeElGaVsqS6G/s
 rPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+75oGozFhysU8kD1Lg/rKFGSAHmgc1qYyotBmF08jM=;
 b=ijXP1prIor82YlNuDE2D1LzZquyXNE2sePog41rGqvN0hJpmMjvKbP3OVnD2K3h9EG
 tOpHQww+TF9wTV4gTHLFy/PGPlWV4JeRQxsaZc7+qFijMtanfdXu15+5oFqQgdN5GBoG
 VWhFp2X6uPb6kUCAQ3qaP9wvxueZMdkcGs27I7ZAgV7JToY+Dfxa49y5X1PMPPEj2uGW
 rvjDzLNbV4jK7pI6WIshFrxGZ2XdZ7DyV/plcKDxrnYR1EowiG+AsOhJ8FU926lVfotn
 dZSKvdyZhZcHFc3E0N093RVHc2Ll2FXgOZrlGqdyDXbpXMVOyH6T+V4wQ2abcIvebN2N
 CszA==
X-Gm-Message-State: AOAM530RY4A3Aa92UWdpUArBDbPfAG2NQoPcXF+W7yhV6Fqvd33OMsUX
 9U/u/ITItwlLQdACVI0FXpA=
X-Google-Smtp-Source: ABdhPJw49/iSTrK6F3IHxwDYuRMrTRAEGaa1SDYkT/crPMXWEUcOiZlpFWkHagaj+numhN1BJmbP2Q==
X-Received: by 2002:a17:90a:510e:b0:1cb:b1de:27a0 with SMTP id
 t14-20020a17090a510e00b001cbb1de27a0mr3229470pjh.196.1649926364403; 
 Thu, 14 Apr 2022 01:52:44 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 qe15-20020a17090b4f8f00b001c6f4991cd4sm5216580pjb.45.2022.04.14.01.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:52:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl_sai: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Date: Thu, 14 Apr 2022 08:52:39 +0000
Message-Id: <20220414085239.2541484-1-chi.minghao@zte.com.cn>
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
 sound/soc/fsl/fsl_sai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4650a6931a94..a7930049a049 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1134,11 +1134,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_pm_get_sync;
-	}
 
 	/* Get sai version */
 	ret = fsl_sai_check_version(&pdev->dev);
-- 
2.25.1


