Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DC3938C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 00:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrjYN5172z300J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 08:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=green-communications.fr (client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 841 seconds by postgrey-1.36 at boromir;
 Fri, 28 May 2021 02:50:04 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrYhX6xXdz2ykG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:50:00 +1000 (AEST)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MxDgs-1lWi1Y41ay-00xb4U; Thu, 27 May 2021 18:35:05 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl-asoc-card: Set .owner attribute when registering
 card.
Date: Thu, 27 May 2021 18:34:09 +0200
Message-Id: <20210527163409.22049-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2Xcz2Picz7QfmT/3RZBi3M8YNs4IfW4bK0TwJV+1zVrQF9+vlSl
 SpyEYVbT+4phkVcPD0ZG9bn4CAhEsIknv5lWwzPzDyXjwUVbUyGnIcI/zSyao3qv97Uyo4i
 8I+4g8168s60kXemjwIW7S501zxCz+aUwNwwO7y+Pb2ZprPbNdy7M8pHZeG2EZATaEWW/9y
 6O8qBSxcDQtKbzu8xhHQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ni03RLG98I4=:0oDR6vjMS/6XB6RorvHIwE
 sV06cCEbpNksNjjzCgkM6fLYlIJPJKoBRTj33QVsh6k6VAIVagmbHM5ROgopQ/hlKIQjO2cqk
 ZOe4REtM+e2uFUjafvXOx9vFNW4HGbjPNKSnt5fxeaBra+EYulgDjGaJ4axdxrxs9RSV9v/6l
 6UtQUzJzNGTayK1Zcq9Ct4Wa7QXud4ixCB/0+K2L4/g6tCN2XW0Yo5VB4dk7L4X2shpeTGBj0
 USl346R2jKMNlTyUgig/6z+l/71on7Oz6uUvgrsdIrWNoOGAIE6rAbJAcAw+fc5ioEb5FbqSI
 GV7EuZrGR4C5Sgu5vO3iiAFJcj3igmo+LpmETn+k+omR27gci4yz1G4sPWiEneVF4jfLr6xzh
 9rsnOcBFLSjV8RzZI39hvHdrKm5vqAj3C0QsKvnf6INKkFoLlAtn4UbfskSVX/qPTsCKGjWwZ
 TQnXnj/pvK2TWGaz6hF4iPMt3hy68OSo7jH0RYWa1lLeD6ijgYDMWNZEQT/O++4MJERG6aSfe
 5VA6HKsvkfwSl5g+UBf73ib8+qU+0ImzxUZxERPueVkXQqQq32C7RCkbtVYeplJnQ==
X-Mailman-Approved-At: Fri, 28 May 2021 08:44:07 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Otherwise, when compiled as module, a WARN_ON is triggered:

WARNING: CPU: 0 PID: 5 at sound/core/init.c:208 snd_card_new+0x310/0x39c [snd]
[...]
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.10.39 #1
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
Workqueue: events deferred_probe_work_func
[<c0111988>] (unwind_backtrace) from [<c010c8ac>] (show_stack+0x10/0x14)
[<c010c8ac>] (show_stack) from [<c092784c>] (dump_stack+0xdc/0x104)
[<c092784c>] (dump_stack) from [<c0129710>] (__warn+0xd8/0x114)
[<c0129710>] (__warn) from [<c0922a48>] (warn_slowpath_fmt+0x5c/0xc4)
[<c0922a48>] (warn_slowpath_fmt) from [<bf0496f8>] (snd_card_new+0x310/0x39c [snd])
[<bf0496f8>] (snd_card_new [snd]) from [<bf1d7df8>] (snd_soc_bind_card+0x334/0x9c4 [snd_soc_core])
[<bf1d7df8>] (snd_soc_bind_card [snd_soc_core]) from [<bf1e9cd8>] (devm_snd_soc_register_card+0x30/0x6c [snd_soc_core])
[<bf1e9cd8>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf22d964>] (fsl_asoc_card_probe+0x550/0xcc8 [snd_soc_fsl_asoc_card])
[<bf22d964>] (fsl_asoc_card_probe [snd_soc_fsl_asoc_card]) from [<c060c930>] (platform_drv_probe+0x48/0x98)
[...]

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index c62bfd1c3ac7..4f55b316cf0f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -744,6 +744,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	/* Initialize sound card */
 	priv->pdev = pdev;
 	priv->card.dev = &pdev->dev;
+	priv->card.owner = THIS_MODULE;
 	ret = snd_soc_of_parse_card_name(&priv->card, "model");
 	if (ret) {
 		snprintf(priv->name, sizeof(priv->name), "%s-audio",
-- 
2.32.0.rc0

