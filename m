Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A33201CF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 00:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj7DQ2mXWz3d8H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 10:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj7Bk0X3Yz3cG0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 10:31:41 +1100 (AEDT)
IronPort-SDR: uFZ2voXobeGuV9nOtpmhLBFSbGzvh+ihdm/BBD9P31NCEcE0e9g6ip5buINSAvZ4ui+R3AQOuL
 Z6IyD5AVcxHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293747"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293747"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:36 -0800
IronPort-SDR: VyoqTH3drO05WzEFz7pFbR0O3B2W8LfcnKCPAG7mL61X+hE273j4sLw9TwIZFwrHBTG9qBZHEI
 Dzaopj3D/9Sg==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662737"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/9] ASoC: fsl: fsl_ssi: remove unnecessary tests
Date: Fri, 19 Feb 2021 17:29:33 -0600
Message-Id: <20210219232937.6440-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
References: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
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
Cc: Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 broonie@kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cppcheck warnings:

sound/soc/fsl/fsl_ssi.c:767:34: style: Condition 'div2' is always
false [knownConditionTrueFalse]
 stccr = SSI_SxCCR_PM(pm + 1) | (div2 ? SSI_SxCCR_DIV2 : 0) |
                                 ^
sound/soc/fsl/fsl_ssi.c:722:9: note: Assignment 'div2=0', assigned value is 0
 div2 = 0;
        ^
sound/soc/fsl/fsl_ssi.c:767:34: note: Condition 'div2' is always false
 stccr = SSI_SxCCR_PM(pm + 1) | (div2 ? SSI_SxCCR_DIV2 : 0) |
                                 ^
sound/soc/fsl/fsl_ssi.c:768:4: style: Condition 'psr' is always false
[knownConditionTrueFalse]
  (psr ? SSI_SxCCR_PSR : 0);
   ^
sound/soc/fsl/fsl_ssi.c:721:8: note: Assignment 'psr=0', assigned
value is 0
 psr = 0;
       ^
sound/soc/fsl/fsl_ssi.c:768:4: note: Condition 'psr' is always false
  (psr ? SSI_SxCCR_PSR : 0);
   ^

Upon further analysis, the variables 'div2' and 'psr' are set to zero
and never modified. All the tests can be removed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_ssi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 57811743c294..c57d0428c0a3 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -747,7 +747,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 		sub *= 100000;
 		do_div(sub, freq);
 
-		if (sub < savesub && !(i == 0 && psr == 0 && div2 == 0)) {
+		if (sub < savesub && !(i == 0)) {
 			baudrate = tmprate;
 			savesub = sub;
 			pm = i;
@@ -764,8 +764,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	stccr = SSI_SxCCR_PM(pm + 1) | (div2 ? SSI_SxCCR_DIV2 : 0) |
-		(psr ? SSI_SxCCR_PSR : 0);
+	stccr = SSI_SxCCR_PM(pm + 1);
 	mask = SSI_SxCCR_PM_MASK | SSI_SxCCR_DIV2 | SSI_SxCCR_PSR;
 
 	/* STCCR is used for RX in synchronous mode */
-- 
2.25.1

