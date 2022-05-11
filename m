Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1E522BA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 07:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyk350BXSz3cJt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 15:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pZ7INeRK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pZ7INeRK; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyk2N2g4Jz3bVH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 15:27:55 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id j14so838414plx.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhdm254L1jYhgvQgbJzDhHX/1k7BNUYa5TibU3+NCCw=;
 b=pZ7INeRKE7ikbL0Wp1J2nkeg5H+ixeNlVyt8PYCddh2qShvjPh+hek64IhQ72pjYiI
 7emBeRFo+ZBiSd6HXcaXOmhC+lL3WiJqfw6jXaPXvYjcjTJk8+EAcrW7nBNknBW8MamG
 y3IM79TAD97U/nTxtEo9yvf5XYzIF4gzw+u7IgzhoT3ceHSuOUOwpuYMb/KzCmOlru5l
 9aNHlqiUqt3TaR84XMjujDYI71Svp937IGTCm9Oiuv+bXoeSRUiGHWiNMlWtcPUtFmKD
 BYh9nNVtPT2zfyA8wsUHIo3lHKyxQV33wgLC9Voh85/bQ8qPt9QSI43AUrUeQuBnwwSu
 gbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhdm254L1jYhgvQgbJzDhHX/1k7BNUYa5TibU3+NCCw=;
 b=Hcrw8d1z6k7/GDvZc/mOL822j7BiLkJLzPjGkNQxhAtVSR6Jkmny2doZf5YnnSilEZ
 7TC7NYQIjdDMM0fAlfLTQ3UrGhg2+fZfhwWEAruI0im+UySCBI1o3fsl91yzAyW+FQuc
 oUTzWqi4e8TazWsVNN0OP7mhxxs8E7JlmLwnkqcgyLwOSKee/f6jH5BbLkmkoVyF+r5U
 EYYB7CTt6thJOnqkPlEAdUlBwnLy5U+hC/DXS9gdC/+n9fF6C36+YL31euO5LziUBoFc
 lyTJDrAaKPchOB0BXi1AoRfdH+7hUf7JpOsk9T8UVkhp4Fzw7LdxrmCTYPizsR7WhI+0
 ZbOw==
X-Gm-Message-State: AOAM533UeLPe1Sz1G+iFS8QnXt/7ZJdy6LoUka4qyR08kIx1n8HTQi6G
 ocPOg5ppvPHF84Q6tnFV5zU=
X-Google-Smtp-Source: ABdhPJxp27enUzauf894HfT9NP3kw4axhqglDt0NeLn5w5FytMmzOkolsl2i+qdZja+aIx6uEVmDBQ==
X-Received: by 2002:a17:902:7fc2:b0:153:3c90:17b9 with SMTP id
 t2-20020a1709027fc200b001533c9017b9mr24081383plb.61.1652246872324; 
 Tue, 10 May 2022 22:27:52 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 s12-20020a170902c64c00b0015e8d4eb2e6sm588632pls.304.2022.05.10.22.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 22:27:51 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Ye Guojin <ye.guojin@zte.com.cn>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
Date: Wed, 11 May 2022 09:27:40 +0400
Message-Id: <20220511052740.46903-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_device_by_node() takes reference, we should use put_device()
to release it. when devm_kzalloc() fails, it doesn't have a
put_device(), it will cause refcount leak.
Add missing put_device() to fix this.

Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
Fixes: f670b274f7f6 ("ASoC: imx-hdmi: add put_device() after of_find_device_by_node()")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/fsl/imx-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 929f69b758af..ec149dc73938 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -126,6 +126,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
+		put_device(&cpu_pdev->dev);
 		goto fail;
 	}
 
-- 
2.25.1

