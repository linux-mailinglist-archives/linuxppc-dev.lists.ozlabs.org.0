Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E3212B3E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 19:29:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yQ7k0lxNzDqxq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yQ1Z6HKXzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 03:24:02 +1000 (AEST)
IronPort-SDR: 3zbS5js3bVy2jzyZ1XK7lzH27iTTq2E84NjdNg+810Fp3FLy465OWKJAi383eLLyDE6GyhHYUI
 HB0gvz2sZelQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126590472"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126590472"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:48 -0700
IronPort-SDR: mAjwL2tKlw+8j+DkGoWVLnlP8CIn6QoiOCfJJKopCnLuikTcm3HZo/+RhJsu9GbTHbE/l9bvp0
 GBUyMbj0BL5A==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="356521253"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: fsl: fsl-asoc-card: fix kernel-doc
Date: Thu,  2 Jul 2020 12:22:24 -0500
Message-Id: <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
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
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 broonie@kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Fabio Estevam <festevam@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix W=1 warnings. Kernel-doc syntax was not properly used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 57ea1b072326..91220b96e043 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -33,8 +33,7 @@
 #define DAI_FMT_BASE (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF)
 
 /**
- * CODEC private data
- *
+ * struct codec_priv - CODEC private data
  * @mclk_freq: Clock rate of MCLK
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
  * @fll_id: FLL (or secordary clock) id for set_sysclk()
@@ -48,11 +47,10 @@ struct codec_priv {
 };
 
 /**
- * CPU private data
- *
- * @sysclk_freq[2]: SYSCLK rates for set_sysclk()
- * @sysclk_dir[2]: SYSCLK directions for set_sysclk()
- * @sysclk_id[2]: SYSCLK ids for set_sysclk()
+ * struct cpu_priv - CPU private data
+ * @sysclk_freq: SYSCLK rates for set_sysclk()
+ * @sysclk_dir: SYSCLK directions for set_sysclk()
+ * @sysclk_id: SYSCLK ids for set_sysclk()
  * @slot_width: Slot width of each frame
  *
  * Note: [1] for tx and [0] for rx
@@ -65,9 +63,8 @@ struct cpu_priv {
 };
 
 /**
- * Freescale Generic ASOC card private data
- *
- * @dai_link[3]: DAI link structure including normal one and DPCM link
+ * struct fsl_asoc_card_priv - struct Freescale Generic ASOC card private data
+ * @dai_link: DAI link structure including normal one and DPCM link
  * @pdev: platform device pointer
  * @codec_priv: CODEC private data
  * @cpu_priv: CPU private data
@@ -94,8 +91,8 @@ struct fsl_asoc_card_priv {
 	char name[32];
 };
 
-/**
- * This dapm route map exsits for DPCM link only.
+/*
+ * This dapm route map exits for DPCM link only.
  * The other routes shall go through Device Tree.
  *
  * Note: keep all ASRC routes in the second half
-- 
2.25.1

