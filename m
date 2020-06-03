Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EF1EC824
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 05:58:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cFWB0cBdzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 13:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cFL366SCzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 13:50:19 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F3CCF1A0054;
 Wed,  3 Jun 2020 05:50:16 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7304E1A0F20;
 Wed,  3 Jun 2020 05:50:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9461840323;
 Wed,  3 Jun 2020 11:50:06 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 3/3] ASoC: fsl_easrc: Fix "Function parameter not described"
 warnings
Date: Wed,  3 Jun 2020 11:39:41 +0800
Message-Id: <d166b868e6d294de47a89857be03758ec82a0a61.1591155860.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Obtained with:
$ make W=1

sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'easrc' not described in 'fsl_easrc_normalize_filter'
sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'infilter' not described in 'fsl_easrc_normalize_filter'
sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'outfilter' not described in 'fsl_easrc_normalize_filter'
sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'shift' not described in 'fsl_easrc_normalize_filter'

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 sound/soc/fsl/fsl_easrc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 7d8bf9d47842..2f6b3d8bfcfc 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -389,11 +389,11 @@ static int fsl_easrc_resampler_config(struct fsl_asrc *easrc)
  *  For input int[16, 24, 32] -> output float32
  *      scale it by multiplying filter coefficients by 2^-15, 2^-23, 2^-31
  *  input:
- *      asrc:  Structure pointer of fsl_asrc
- *      infilter : Pointer to non-scaled input filter
- *      shift:  The multiply factor
+ *      @easrc:  Structure pointer of fsl_asrc
+ *      @infilter : Pointer to non-scaled input filter
+ *      @shift:  The multiply factor
  *  output:
- *      outfilter: scaled filter
+ *      @outfilter: scaled filter
  */
 static int fsl_easrc_normalize_filter(struct fsl_asrc *easrc,
 				      u64 *infilter,
-- 
2.21.0

