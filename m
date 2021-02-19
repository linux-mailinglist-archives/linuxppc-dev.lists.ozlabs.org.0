Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F33201C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 00:32:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj7C114JJz3cJs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 10:31:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Sat, 20 Feb 2021 10:31:39 AEDT
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj7Bg3z1Cz30QC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 10:31:39 +1100 (AEDT)
IronPort-SDR: J86fMjJLL5xnT5Yhw5djIes++WMdzDRWSS5z4EKOtZooyh9kEHknukp+6ThkOF9G11aQFGm7Bm
 2i5lyxw9TFsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293694"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293694"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:29 -0800
IronPort-SDR: 8FE41/OafuIQFCSt+0a+uAkO9CbLdA63YTZhNlLMzQJZnh7Vm9CM7mMLRhB8/lemN2by4dD4BH
 vkMLe6nUjlKA==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662589"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ASoC: fsl: fsl_asrc: remove useless assignment
Date: Fri, 19 Feb 2021 17:29:29 -0600
Message-Id: <20210219232937.6440-2-pierre-louis.bossart@linux.intel.com>
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

sound/soc/fsl/fsl_asrc.c:613:8: style: Variable 'i' is assigned a
value that is never used. [unreadVariable]
 int i = 0, j = 0;
       ^

The same issue occurs for the 'j' variable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c325c984d165..63d236ef5c4d 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -610,7 +610,7 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
 	struct asrc_config *config = pair_priv->config;
 	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
 	int clk_rate, clk_index;
-	int i = 0, j = 0;
+	int i, j;
 
 	rate[IN] = in_rate;
 	rate[OUT] = out_rate;
-- 
2.25.1

