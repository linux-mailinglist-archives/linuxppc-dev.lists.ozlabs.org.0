Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE265611F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:54:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYSG91HvDz3ds1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYSFk5Z75z3blB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:54:16 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 013051A09D4;
	Thu, 30 Jun 2022 07:54:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B84B71A06F8;
	Thu, 30 Jun 2022 07:54:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E7FC2180222C;
	Thu, 30 Jun 2022 13:54:10 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] Add support of two Audio PLL source
Date: Thu, 30 Jun 2022 13:39:08 +0800
Message-Id: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.

The patches implement the functionality to select at runtime
the appropriate AUDIO PLL for root clock, if there is no
two PLL registered, then no action taken.

Shengjiu Wang (6):
  ASoC: fsl_utils: Add function to handle PLL clock source
  ASoC: fsl_spdif: Add support for PLL switch at runtime.
  ASoC: fsl_micfil: Add support for PLL switch at runtime
  ASoC: fsl_sai: Add support for PLL switch at runtime
  ASoC: dt-bindings: fsl_spdif: Add two PLL clock source
  ASoC: dt-bindings: fsl-sai: Add two PLL clock source

 .../devicetree/bindings/sound/fsl,spdif.yaml  |  4 ++
 .../devicetree/bindings/sound/fsl-sai.txt     |  3 +
 sound/soc/fsl/Kconfig                         |  3 +
 sound/soc/fsl/fsl_micfil.c                    | 41 +++++++++++
 sound/soc/fsl/fsl_sai.c                       | 54 +++++++++++++++
 sound/soc/fsl/fsl_sai.h                       |  2 +
 sound/soc/fsl/fsl_spdif.c                     | 57 +++++++++++++--
 sound/soc/fsl/fsl_utils.c                     | 69 +++++++++++++++++++
 sound/soc/fsl/fsl_utils.h                     |  9 +++
 9 files changed, 237 insertions(+), 5 deletions(-)

-- 
2.17.1

