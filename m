Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A03201C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 00:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj7CM4W7Pz3cYy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 10:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj7Bh2q1yz30QC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 10:31:40 +1100 (AEDT)
IronPort-SDR: 80k9JVrrAL1ORbqqWJbWpBVNNIfFZjJm9/7nz16+iUXL5JlW0NnYYauU5qIrXIo8MGyjJkKLyi
 ny7RYcpjUQfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293708"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293708"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:31 -0800
IronPort-SDR: 7fuqsnI5d1rCvsuQB4y1W5hbfpKOGWCfTShDcjfpVFCd5QXr4Iz+Qk/IQP3w6Hz/3gQt/vBW90
 NOgGQyVei+hg==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662632"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/9] ASoC: fsl: fsl_dma: remove unused variable
Date: Fri, 19 Feb 2021 17:29:30 -0600
Message-Id: <20210219232937.6440-3-pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/fsl/fsl_dma.c:411:10: style: Variable 'channel' is assigned
a value that is never used. [unreadVariable]

 channel = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0 : 1;
         ^

Removing this line shows the variable isn't needed any longer so
remove declaration as well.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index e0c39c5f4854..84bd8a5356eb 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -392,7 +392,6 @@ static int fsl_dma_open(struct snd_soc_component *component,
 	dma_addr_t ld_buf_phys;
 	u64 temp_link;  	/* Pointer to next link descriptor */
 	u32 mr;
-	unsigned int channel;
 	int ret = 0;
 	unsigned int i;
 
@@ -408,8 +407,6 @@ static int fsl_dma_open(struct snd_soc_component *component,
 		return ret;
 	}
 
-	channel = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0 : 1;
-
 	if (dma->assigned) {
 		dev_err(dev, "dma channel already assigned\n");
 		return -EBUSY;
-- 
2.25.1

