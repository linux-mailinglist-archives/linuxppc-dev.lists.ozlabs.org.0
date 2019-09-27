Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F9BFCE0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 03:50:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fZVr58pszDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 11:50:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fZSS4D9xzDqxZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 11:48:06 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D9024200603;
 Fri, 27 Sep 2019 03:48:01 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 683B6200125;
 Fri, 27 Sep 2019 03:47:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 45175402CB;
 Fri, 27 Sep 2019 09:47:47 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 lars@metafoo.de
Subject: [PATCH V6 0/4] update supported sample format
Date: Fri, 27 Sep 2019 09:46:08 +0800
Message-Id: <cover.1569493933.git.shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch serial is to update the supported format for fsl_asrc
and fix some format issue

Shengjiu Wang (4):
  ASoC: fsl_asrc: Use in(out)put_format instead of in(out)put_word_width
  ASoC: fsl_asrc: update supported sample format
  ASoC: pcm_dmaengine: Extract snd_dmaengine_pcm_refine_runtime_hwparams
  ASoC: fsl_asrc: Fix error with S24_3LE format bitstream in i.MX8

changes in v2
- extract snd_dmaengine_pcm_set_runtime_hwparams in one
  separate path.
- 4th patch depends on 3rd patch

changes in v3
- Fix build report by kbuild test robot <lkp@intel.com>
- change snd_dmaengine_pcm_set_runtime_hwparams to
  snd_dmaengine_pcm_refine_runtime_hwparams

changes in v4
- update according to Nicolin's comments.

changes in v5
- free asrc pair when error happens in patch 4/4

changes in v6
- ignore return value of snd_soc_set_runtime_hwparams in patch 4/4

 include/sound/dmaengine_pcm.h         |  5 ++
 sound/core/pcm_dmaengine.c            | 83 +++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.c              | 65 ++++++++++++++-------
 sound/soc/fsl/fsl_asrc.h              |  7 ++-
 sound/soc/fsl/fsl_asrc_dma.c          | 64 ++++++++++++++++++---
 sound/soc/soc-generic-dmaengine-pcm.c | 61 ++------------------
 6 files changed, 199 insertions(+), 86 deletions(-)

-- 
2.21.0

