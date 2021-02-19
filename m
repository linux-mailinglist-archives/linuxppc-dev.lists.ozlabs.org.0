Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A03201D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 00:33:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj7FF098cz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 10:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj7Bl6vfyz3cJc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 10:31:43 +1100 (AEDT)
IronPort-SDR: JzJ1yMHFRVsNx4MhdxU7PGOJfE2mHIxiG0yY8MluiqNZdJlZMr2GIZIDYceZFRjqu9h+MCbWDA
 wvgCzUUTHG5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293783"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:41 -0800
IronPort-SDR: 7J5iSuMxctWjKWA9b/RW/w0Y6U0jE9BtLu2q8n+o//laTJq3NERRJCZ18FAbsXtUH/+bOrFvBY
 TIL2tFRRWQgQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662875"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/9] ASoC: fsl: mpc8610: remove useless assignment
Date: Fri, 19 Feb 2021 17:29:36 -0600
Message-Id: <20210219232937.6440-9-pierre-louis.bossart@linux.intel.com>
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

sound/soc/fsl/mpc8610_hpcd.c:333:6: style: Redundant initialization
for 'ret'. The initialized value is overwritten before it is
read. [redundantInitialization]
 ret = fsl_asoc_get_dma_channel(np, "fsl,playback-dma",
     ^
sound/soc/fsl/mpc8610_hpcd.c:193:10: note: ret is initialized
 int ret = -ENODEV;
         ^
sound/soc/fsl/mpc8610_hpcd.c:333:6: note: ret is overwritten
 ret = fsl_asoc_get_dma_channel(np, "fsl,playback-dma",
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/mpc8610_hpcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index eccc833390d4..58b9ca3c4da0 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -190,7 +190,7 @@ static int mpc8610_hpcd_probe(struct platform_device *pdev)
 	struct device_node *codec_np = NULL;
 	struct mpc8610_hpcd_data *machine_data;
 	struct snd_soc_dai_link_component *comp;
-	int ret = -ENODEV;
+	int ret;
 	const char *sprop;
 	const u32 *iprop;
 
-- 
2.25.1

