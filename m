Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E9554F266
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:00:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWgG161Qz3dvQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:00:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPWf13FQkz3bp3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 17:59:19 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B77E1201FAA;
	Fri, 17 Jun 2022 09:59:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E2B2201FAC;
	Fri, 17 Jun 2022 09:59:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7FDD61820F45;
	Fri, 17 Jun 2022 15:59:13 +0800 (+08)
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
Subject: [PATCH v2 0/7] Add PDM/DSD/dataline configuration support
Date: Fri, 17 Jun 2022 15:44:30 +0800
Message-Id: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
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

Support PDM format and DSD format.
Add new dts property to configure dataline. The SAI has multiple
successive FIFO registers, but in some use
case the required dataline/FIFOs are not successive.

Changes in v2:
- refine the commit subject of patch 5/7

Shengjiu Wang (7):
  ASoC: fsl_sai: Add PDM daifmt support
  ASoC: fsl_sai: Add DSD bit format support
  ASoC: fsl_sai: Add support for more sample rates
  ASoc: fsl_sai: Add pinctrl operation for PDM and DSD
  ASoC: fsl_sai: Make res a member of struct fsl_sai
  ASoC: dt-bindings: fsl-sai: Add new property to configure dataline
  ASoC: fsl_sai: Configure dataline/FIFO information from dts property

 .../devicetree/bindings/sound/fsl-sai.txt     |   8 +
 sound/soc/fsl/fsl_sai.c                       | 260 ++++++++++++++++--
 sound/soc/fsl/fsl_sai.h                       |  26 +-
 3 files changed, 272 insertions(+), 22 deletions(-)

-- 
2.17.1

