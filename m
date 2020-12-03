Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A10BD2CE1A7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 23:31:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn9Y62Q6XzDrKq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 09:31:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn9VX5DqQzDrHF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 09:29:08 +1100 (AEDT)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH] ASoC: fsl_aud2htx: mark PM functions as __maybe_unused
Date: Thu,  3 Dec 2020 23:28:47 +0100
Message-Id: <20201203222900.1042578-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_PM is disabled, we get a warning for unused functions:

sound/soc/fsl/fsl_aud2htx.c:261:12: error: unused function 'fsl_aud2htx_runtime_suspend' [-Werror,-Wunused-function]
static int fsl_aud2htx_runtime_suspend(struct device *dev)
sound/soc/fsl/fsl_aud2htx.c:271:12: error: unused function 'fsl_aud2htx_runtime_resume' [-Werror,-Wunused-function]
static int fsl_aud2htx_runtime_resume(struct device *dev)

Mark these as __maybe_unused to avoid the warning without adding
an #ifdef.

Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/fsl_aud2htx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 4091ccc7c3e9..d70d5e75a30c 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -258,7 +258,7 @@ static int fsl_aud2htx_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_aud2htx_runtime_suspend(struct device *dev)
+static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
 
@@ -268,7 +268,7 @@ static int fsl_aud2htx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int fsl_aud2htx_runtime_resume(struct device *dev)
+static int __maybe_unused fsl_aud2htx_runtime_resume(struct device *dev)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
 	int ret;
-- 
2.27.0

