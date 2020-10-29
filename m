Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5795D29E5C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 09:07:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMJ2C4bD8zDqbF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 19:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=coiby.xu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ImwowdAX; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMHW356SdzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 18:43:40 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id w21so1641196pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8u+cDEJ8AUe2fZreqSM2kctIiSNg1XEO6m83AlYJL7M=;
 b=ImwowdAXgeuskRRBCZOSYoc+noyNDsE7KVpUYFOdB/iwsNWyxeSa3KG4jvkGkcrbqS
 W+5ku5C1hxDug2UmHCXShNUvqJ/yinRCbh5r65F52i/HjK5RvAreAYThIwDpqH+neJu6
 qpLFLZfK3jNXX1A1NMJVy/f0XZcdks4BvDt7R9vRukBulBng8L6ExJT3saGcHY6Uh3oI
 HsSCwfEifi9SFo2N69TZoYyk31UBMqzsA9PiDn7sKI9BluMdq8TdPurU6JyCVqJkM88+
 g8HT//uvrMOYWqSv9fuIwhlvIJnwGhv3zTAjrOu7hCBPbCDtn4SK9gK0vU41eeL5OsFN
 m8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8u+cDEJ8AUe2fZreqSM2kctIiSNg1XEO6m83AlYJL7M=;
 b=iW6VVN8sL2phbFC2Qf4yISHIE0kWL/eE2IHBpkQBH+8RcUB1APSu3CD4b3uGB3SgXf
 PWUJuWUjxd77uCFPa3M818x1AWRiccfilSkWOoOCrR7pcKwWAW1lPa9oHkeQoRiJmGea
 sIT7nnc1gDPUYSySGkCZUn856QW03yt+pxLdtZ3CPk4cbQF08ABQe/oEVquRCzNL8OaL
 smwuzWMuaPkOtp+YUYb2DIvnt141ClByohh/wIJzDclq6guwjo8KYZgOMSgMqPRAdV1e
 8a/BXgc1a9ikgCQYLnAQE+Thh1OgGGz1QWm/DVxOYB0OSD5CREUcLXaFitRIOraB9IKP
 6VSA==
X-Gm-Message-State: AOAM5334AKDbkpSk5yEYE9f1pFggnt/Er8NppHP/xZgDxMVq19iND11m
 50hfdG0EeJ1Giwg8tAwC4Yg=
X-Google-Smtp-Source: ABdhPJw26LSjGJv0gkcHfnY3aVLwVaP63zCatI+cHlBpP4L5G2DQaRcfDxL/I3kfzEgHZfcdG92f0A==
X-Received: by 2002:a62:1c8f:0:b029:156:6ebd:3361 with SMTP id
 c137-20020a621c8f0000b02901566ebd3361mr3272158pfc.42.1603957417705; 
 Thu, 29 Oct 2020 00:43:37 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id b142sm1872361pfb.186.2020.10.29.00.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:37 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 03/25] ASoC: fsl: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:39 +0800
Message-Id: <20201029074301.226644-3-coiby.xu@gmail.com>
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
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/fsl/imx-audmux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 25c18b9e348f..6d77188a4eab 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -349,7 +349,6 @@ static int imx_audmux_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_audmux_suspend(struct device *dev)
 {
 	int i;
@@ -377,7 +376,6 @@ static int imx_audmux_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops imx_audmux_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(imx_audmux_suspend, imx_audmux_resume)
-- 
2.28.0

