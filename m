Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A663815735
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 05:12:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsXjw0Kmdz3clY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:12:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xfusion.com (client-ip=36.139.87.180; helo=wxsgout04.xfusion.com; envelope-from=prvs=170628f7c2=wangjinchao@xfusion.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 929 seconds by postgrey-1.37 at boromir; Fri, 15 Dec 2023 20:29:30 AEDT
Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss3p23NlYz3bx1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 20:29:28 +1100 (AEDT)
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4Ss3My1dbpzB2NhN;
	Fri, 15 Dec 2023 17:10:22 +0800 (CST)
Received: from localhost (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 15 Dec
 2023 17:13:52 +0800
Date: Fri, 15 Dec 2023 17:13:51 +0800
From: Wang Jinchao <wangjinchao@xfusion.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: fsl_mqs: remove duplicated including
Message-ID: <202312151713+0800-wangjinchao@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.82.147.3]
X-ClientProxiedBy: wuxshcsitd00602.xfusion.com (10.32.132.250) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)
X-Mailman-Approved-At: Sat, 16 Dec 2023 15:12:13 +1100
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
Cc: wangjinchao@xfusion.com, stone.xulei@xfusion.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rm the second \#include <linux/of.h>

Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
---
 sound/soc/fsl/fsl_mqs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index f2d74ec05cdf..c73e6c141f7e 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -12,7 +12,6 @@
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
-#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
-- 
2.40.0

