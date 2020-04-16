Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FA1AC19E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 14:44:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492zSc3lH8zDqM9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:44:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492zDS5K1RzDrQ1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 22:33:58 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A8BE51A0D60;
 Thu, 16 Apr 2020 14:33:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DD9E1A0D44;
 Thu, 16 Apr 2020 14:33:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 003BB402C4;
 Thu, 16 Apr 2020 20:33:41 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v9 0/7] ASoC: Add new module driver for new ASRC
Date: Thu, 16 Apr 2020 20:25:30 +0800
Message-Id: <cover.1587038908.git.shengjiu.wang@nxp.com>
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

Add new module driver for new ASRC in i.MX8MN, several commits
are added for new property fsl,asrc-format

Shengjiu Wang (7):
  ASoC: fsl_asrc: rename asrc_priv to asrc
  ASoC: dt-bindings: fsl_asrc: Add new property fsl,asrc-format
  ASoC: fsl-asoc-card: Support new property fsl,asrc-format
  ASoC: fsl_asrc: Support new property fsl,asrc-format
  ASoC: fsl_asrc: Move common definition to fsl_asrc_common
  ASoC: dt-bindings: fsl_easrc: Add document for EASRC
  ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers

changes in v9
- use lowercase for dt example.

changes in v8
- change get_pair_priv_size to pair_priv_size variable

changes in v7
- updated according to Nicoin's comments.
- add get_pair_priv_size to replace PAIR_PRIVATE_SIZE

changes in v6
- updated according to Nicoin's and Rob's comments.

changes in v5
- Add new property fsl,asrc-format, rather than change fsl,asrc-width
  to fsl,asrc-formt.
- code change for above change.

changes in v4
- Add several commit for changing DT binding asrc-width to asrc-format
- rename asrc_priv to asrc

changes in v3
- add new commit "ASoC: fsl_asrc: Change asrc_width to asrc_format"
- modify binding doc to yaml format
- remove fsl_easrc_dma.c, make fsl_asrc_dma.c useable for easrc.

changes in v2
- change i.MX815 to i.MX8MN
- Add changes in Kconfig and Makefile

 .../devicetree/bindings/sound/fsl,asrc.txt    |    4 +
 .../devicetree/bindings/sound/fsl,easrc.yaml  |  101 +
 sound/soc/fsl/Kconfig                         |   11 +
 sound/soc/fsl/Makefile                        |    2 +
 sound/soc/fsl/fsl-asoc-card.c                 |   24 +-
 sound/soc/fsl/fsl_asrc.c                      |  305 +--
 sound/soc/fsl/fsl_asrc.h                      |   74 +-
 sound/soc/fsl/fsl_asrc_common.h               |  106 +
 sound/soc/fsl/fsl_asrc_dma.c                  |   54 +-
 sound/soc/fsl/fsl_easrc.c                     | 2114 +++++++++++++++++
 sound/soc/fsl/fsl_easrc.h                     |  651 +++++
 11 files changed, 3212 insertions(+), 234 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
 create mode 100644 sound/soc/fsl/fsl_asrc_common.h
 create mode 100644 sound/soc/fsl/fsl_easrc.c
 create mode 100644 sound/soc/fsl/fsl_easrc.h

-- 
2.21.0

