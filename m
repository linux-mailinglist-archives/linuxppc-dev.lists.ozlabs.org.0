Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD35162121
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:49:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MBLB3syjzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 17:49:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MBG22NwrzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 17:46:15 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CF2281A3775;
 Tue, 18 Feb 2020 07:46:10 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C29CD1A3778;
 Tue, 18 Feb 2020 07:46:03 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5C3E540345;
 Tue, 18 Feb 2020 14:45:26 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] Add new module driver for new ASRC
Date: Tue, 18 Feb 2020 14:39:34 +0800
Message-Id: <cover.1582007379.git.shengjiu.wang@nxp.com>
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

Add new module driver for new ASRC in i.MX8MN.

Shengjiu Wang (3):
  ASoC: fsl_asrc: Move common definition to fsl_asrc_common
  ASoC: dt-bindings: fsl_easrc: Add document for EASRC
  ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and platform drivers

changes in v2
- change i.MX815 to i.MX8MN
- Add changes in Kconfig and Makefile

 .../devicetree/bindings/sound/fsl,easrc.txt   |   57 +
 sound/soc/fsl/Kconfig                         |   10 +
 sound/soc/fsl/Makefile                        |    2 +
 sound/soc/fsl/fsl_asrc.h                      |   11 +-
 sound/soc/fsl/fsl_asrc_common.h               |   22 +
 sound/soc/fsl/fsl_easrc.c                     | 2265 +++++++++++++++++
 sound/soc/fsl/fsl_easrc.h                     |  668 +++++
 sound/soc/fsl/fsl_easrc_dma.c                 |  440 ++++
 8 files changed, 3465 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
 create mode 100644 sound/soc/fsl/fsl_asrc_common.h
 create mode 100644 sound/soc/fsl/fsl_easrc.c
 create mode 100644 sound/soc/fsl/fsl_easrc.h
 create mode 100644 sound/soc/fsl/fsl_easrc_dma.c

-- 
2.21.0

