Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331D347589
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 11:13:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F53wN1KjJz30Lc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 21:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F53w371MFz2xxp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 21:13:06 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8140A1A27DC;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F98E1A1D0A;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C03284029B;
 Wed, 24 Mar 2021 11:12:29 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: fsl: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:42 +0800
Message-Id: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

When there is power domain bind with ipg clock,

The call flow:
devm_regmap_init_mmio_clk
    - clk_prepare()
        - clk_pm_runtime_get()

cause the power domain of clock always be enabled after
regmap_init(). which impact the power consumption.

So use devm_regmap_init_mmio instead of
devm_regmap_init_mmio_clk.

Shengjiu Wang (6):
  ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk
  ASoC: fsl_spdif: Don't use devm_regmap_init_mmio_clk
  ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk
  ASoC: fsl_easrc: Don't use devm_regmap_init_mmio_clk
  ASoC: fsl_audmix: Don't use devm_regmap_init_mmio_clk
  ASoC: fsl_micfil: Don't use devm_regmap_init_mmio_clk

 sound/soc/fsl/fsl_asrc.c   | 57 +++++++++++++++++++++++++++++---------
 sound/soc/fsl/fsl_audmix.c |  3 +-
 sound/soc/fsl/fsl_easrc.c  |  3 +-
 sound/soc/fsl/fsl_esai.c   | 48 ++++++++++++++++++++++++--------
 sound/soc/fsl/fsl_micfil.c | 25 +++++++++++++----
 sound/soc/fsl/fsl_spdif.c  |  3 +-
 6 files changed, 103 insertions(+), 36 deletions(-)

-- 
2.27.0

