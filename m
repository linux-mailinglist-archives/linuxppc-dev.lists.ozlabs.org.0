Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9229E5A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 09:04:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMHz114fLzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 19:04:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=coiby.xu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qelMKJ2W; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMHW16b6RzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 18:43:36 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id o129so1660737pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tubacnQpwB3/W2PhhRu24urvA3DZqPuQW1vT0viMV9c=;
 b=qelMKJ2WSeEmQYBOX1ZKDe81Ga6Ri3W0Vyv+XB3IPPvJcxS32qo9MAPakdGNGTBBbq
 zrqOzulmZraX3Q7qsRKvDDYFQk7udvuSECmgQJGPxjaJ6Dr+7I+ILcb+r8U1KjI8UTmf
 qxc5S4bAEM1nkq0i7esFIzTiCzQOfn0OVOaxCogYvzwU4DGlF/Z9ok/mfJXLwovnkcZ0
 3C4yEoqwfNwBYF6tlPYKL63YLgSKl5BnMVy/m82jOBhOcCQ1eL7fINId/h/LLGtWaYUW
 LErPqdvsFq6LiV/7vIWgSrlgaxcgFLkvhhD1mZlYPmchGJHRK7ThN521grVT1fGzcAz4
 kvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tubacnQpwB3/W2PhhRu24urvA3DZqPuQW1vT0viMV9c=;
 b=ClBYWA6i1JafY+J4g5Gf3YnogSd/EHhJJqvcUQjrgpUVZ+kpl0wMwKkw5DKVLdiYaa
 cWVJkkQSxwUapqtJWJoJD0hzliUWPMnd/+7lZMex91uSvFvJWzcjvKOKTC2DHLEwHaqk
 29dSbZXV1+FA3E/Dqcn9MGTKhumWRNntUArFsIOnQuWz0tDiCERTOvUBTZeNpoBRb8u5
 cK5H391grfoi3DjUnbXDfE9DlvvTkuuKNYXkr6KA4L8FvXW6XqSqHi+hdlRHnFbJr3Qz
 P4C6q22MrBUudBxewRmUoAGnCc7cY+qx2Q2c3ymnOwSWZg1QTo368BQrgt92CGfC0Ew2
 NffQ==
X-Gm-Message-State: AOAM533FkCUij3biPs25dIXIKNhSKGxSmZtrOOppB4NS+HZKE8+rixNn
 uTP+vFfxp1wnkHIlWC10PjI=
X-Google-Smtp-Source: ABdhPJwfCpKPCpSPUWy+Lzj+iwnX+ql0BPKlVGcGxkFcgc7JIGCDlh6SjXrSCFSf54pnToB9lwi7Hg==
X-Received: by 2002:a63:7e4f:: with SMTP id o15mr2971579pgn.428.1603957412989; 
 Thu, 29 Oct 2020 00:43:32 -0700 (PDT)
Received: from localhost ([160.16.113.140])
 by smtp.gmail.com with ESMTPSA id v4sm951756pfm.57.2020.10.29.00.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:32 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 02/25] ASoC: fsl: fsl_ssi: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:38 +0800
Message-Id: <20201029074301.226644-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 19:01:06 +1100
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
Cc: "moderated list:FREESCALE SOC SOUND DRIVERS" <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/fsl/fsl_ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 404be27c15fe..065500a4cbc1 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1669,7 +1669,6 @@ static int fsl_ssi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int fsl_ssi_suspend(struct device *dev)
 {
 	struct fsl_ssi *ssi = dev_get_drvdata(dev);
@@ -1699,7 +1698,6 @@ static int fsl_ssi_resume(struct device *dev)
 
 	return regcache_sync(regs);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops fsl_ssi_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(fsl_ssi_suspend, fsl_ssi_resume)
-- 
2.28.0

