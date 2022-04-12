Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5834FD301
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 10:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KczSn1N29z3bWt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 18:30:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bguj7Cwr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bguj7Cwr; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KczS52gyPz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 18:30:12 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id 12so4366619pll.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+EBqN3UPFUGLYVFLyAS2kc4ocqBW5MswCAjPd97TUw=;
 b=Bguj7CwrjTc+mzk+TmB7JVFoPyy0Zskev01NAMeOClCzjpw2E1k0tA1zrwPWhRhZYh
 8MxY/6opBxkk5Cb81qAM+dgfsdS/yu/xmJntl8ipYL+X6CYZL5nZYM4ob0ElVhk/spAo
 w0KsetW8iDqNEbwwyi3/I/y+s+75Vel4sYcox7oKIuFBWC7xIB72GjJ2KVsMY9joDV74
 e5HGMB3Thh/AHmZmAeBUntojUpjX9wxCLnru9Wa56l1wzN7avN+EAlLlCCMfhA/kCzb1
 GAO4g8VZO+eFrbmYO4t/SMgdj1KfOVEThMrxSUjoR1GlAFTkOYlFrQkW8vHAO4qXlpct
 jdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+EBqN3UPFUGLYVFLyAS2kc4ocqBW5MswCAjPd97TUw=;
 b=4+6B/E9AeZ7TA5rckZdaTbJjph0DKDr4qd350zEoptGxipG/x9GqUGqMZkMIw2VMd3
 4nqU9MC2UdN6dN1GCm3eAWdEf2zhWKxZroA+KRHCGLYQCChgfNRoryPjDddvZ0GNQuNO
 F9mJ7hkX38MgP6g5Bfle9mkibIS0if2wBzcphojhspYbi0DDB51WNzHeYhjEj2l/0TU5
 mJBubEzNPuIx2j9xHKvAspwggwPBa70rB3bl8HUjIAUE5rSAIfXH5SyvtG0dxJs6qvL4
 x0zB9F0SZRQTogbduCm/bEEoLZk4xG19Wqk8UgukUcxi4m1x4XNp4rDRJWc3Hvw+i/hO
 DDPA==
X-Gm-Message-State: AOAM530ExqfcsRRII+0YAnkAFERi4/xBLVcs3r/65RDxHMdaVscpzZsx
 ndsn2cJBaReNcZQA2nZk81o=
X-Google-Smtp-Source: ABdhPJwJPW0ts18fTByd2sl+p9939cGGiOvxLr5m0ZbLLv7Y4tadnT8ZE6+LYBT85nwWVa/BpG9kkg==
X-Received: by 2002:a17:90b:3e8c:b0:1c7:3001:f359 with SMTP id
 rj12-20020a17090b3e8c00b001c73001f359mr3699846pjb.179.1649752208998; 
 Tue, 12 Apr 2022 01:30:08 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m13-20020aa7900d000000b00505fa4c7ba6sm1654089pfo.35.2022.04.12.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 01:30:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Date: Tue, 12 Apr 2022 08:30:00 +0000
Message-Id: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
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

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/fsl/fsl_esai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index ed444e8f1d6b..1a2bdf8e76f0 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_esai_hw_init(esai_priv);
 	if (ret)
-- 
2.25.1

