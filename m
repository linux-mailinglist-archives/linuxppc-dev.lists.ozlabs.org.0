Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C276BCFA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 13:38:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcmyL67HWz3cd5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 23:38:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZzfCLHEj;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=KFvm+kL7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZzfCLHEj;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=KFvm+kL7;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Thu, 16 Mar 2023 23:37:27 AEDT
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcmxM6tGXz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 23:37:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970248; x=1710506248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=srkpdC+yB+EdyLTj0WhGzLGs6EFRQ5wKwgJvE5nC0hQ=;
  b=ZzfCLHEjxPhIX5GSlzzVYDR288k6YmGViWn9kOYSUzbUNdRdPOEloAkg
   4sI+dVxSnrFpOlEeZL3AIEBWU9+U/5D8KEnl70lC0lu99yJE8l51s52fo
   CPiNS23x5wvesLIWB92sD0eLuuO9147Bzb8jEUtfp1wHDyMccBMXCOzej
   6znZOrka5IuPoJkwWG2aQqIs5CtJ7sMJX5MZWVsV+g5Vrg8GfR4VTQdQ/
   eRbZkcsBGayJ51XCWUtlEzTGaCpkwfUTSIGf/U+OhjPzprQy1R+EHpwyW
   FCmiWf/H68Zf59U5mgQwWz3EEzUgM94qIEcPh0YBx8OAH91Imgy3ul1at
   A==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29738028"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 13:36:16 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 13:36:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970176; x=1710506176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=srkpdC+yB+EdyLTj0WhGzLGs6EFRQ5wKwgJvE5nC0hQ=;
  b=KFvm+kL7CHuuM5/eAedvnG/nJcC2LiZLSDpCSK88WRZsbyOx7zzCGCW5
   BAQ4la6/E2QWkMSkXLgttnUCGcEL489cIHHw4Rm7a2ZOWumY+HVC5xlM5
   MRBWc1QyHNCJioC0e8O675RiD5IKWZD0B3PxLo3sKzab2gnZtzvoouRz/
   cnUa2y7sR1LcMBeokficFCpBoDqRN48YRXPJcPAPZtxewbSeRR0IevjFh
   YPnwFZMwaVvzXjqPPOTuriMF8Qb7STRzd/KAlJ8MvkYvLb0uxnumhU7DM
   ap2Iuwnv3UbBfNA5sPCrnFa+frhtfRGx5O7hMKMrBaAZ4FGfEonNbB0ly
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29738026"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 50D81280056;
	Thu, 16 Mar 2023 13:36:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: fsl: define a common DRIVER_NAME
Date: Thu, 16 Mar 2023 13:36:10 +0100
Message-Id: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of copying the driver name manually, use a common define.
No functional change.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index cdfca9fd1eb0..e956abfd50f8 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -28,6 +28,8 @@
 #include "../codecs/wm8994.h"
 #include "../codecs/tlv320aic31xx.h"
 
+#define DRIVER_NAME "fsl-asoc-card"
+
 #define CS427x_SYSCLK_MCLK 0
 
 #define RX 0
@@ -915,7 +917,7 @@ MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
 static struct platform_driver fsl_asoc_card_driver = {
 	.probe = fsl_asoc_card_probe,
 	.driver = {
-		.name = "fsl-asoc-card",
+		.name = DRIVER_NAME,
 		.pm = &snd_soc_pm_ops,
 		.of_match_table = fsl_asoc_card_dt_ids,
 	},
@@ -924,5 +926,5 @@ module_platform_driver(fsl_asoc_card_driver);
 
 MODULE_DESCRIPTION("Freescale Generic ASoC Sound Card driver with ASRC");
 MODULE_AUTHOR("Nicolin Chen <nicoleotsuka@gmail.com>");
-MODULE_ALIAS("platform:fsl-asoc-card");
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
-- 
2.34.1

