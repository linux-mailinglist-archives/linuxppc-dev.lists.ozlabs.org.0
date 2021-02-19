Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DA3201CC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 00:32:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj7D35vM6z3cHm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 10:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=pierre-louis.bossart@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj7Bj1rlrz30RM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 10:31:41 +1100 (AEDT)
IronPort-SDR: OGFJKVpO4V8K3MFhujcaslD46tjZZfhwB2iYehvNKBp6mfWZM3J064qPwaTXmFux2mZwMmPc6d
 Fd48qXriv0dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293730"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293730"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:34 -0800
IronPort-SDR: SurJ3CsLcPmihPJoIFAIVwZXjtmj6q5FoB2yxWqZYu+cp/yybEUUY/oge9K219ESq6ZW6eYYG0
 3l+Rk0FfDn0Q==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662695"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:33 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/9] ASoC: fsl: fsl_esai: clarify expression
Date: Fri, 19 Feb 2021 17:29:32 -0600
Message-Id: <20210219232937.6440-5-pierre-louis.bossart@linux.intel.com>
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

sound/soc/fsl/fsl_esai.c:307:16: style: Clarify calculation precedence
for '%' and '?'. [clarifyCalculation]
    clk_id % 2 ? "extal" : "fsys");
               ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_esai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 08056fa0a0fa..41b154417b92 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -304,7 +304,7 @@ static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 
 	if (IS_ERR(clksrc)) {
 		dev_err(dai->dev, "no assigned %s clock\n",
-				clk_id % 2 ? "extal" : "fsys");
+			(clk_id % 2) ? "extal" : "fsys");
 		return PTR_ERR(clksrc);
 	}
 	clk_rate = clk_get_rate(clksrc);
-- 
2.25.1

