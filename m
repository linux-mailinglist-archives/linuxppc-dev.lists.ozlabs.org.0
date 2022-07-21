Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0457C94B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 12:46:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpTkm45sHz3cgh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 20:46:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpTkL2C95z2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 20:45:44 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B0EE32038F8;
	Thu, 21 Jul 2022 12:45:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A5082038F6;
	Thu, 21 Jul 2022 12:45:40 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id F280E180222B;
	Thu, 21 Jul 2022 18:45:38 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 -next 0/5] ASoC: fsl: Fix sparse warning
Date: Thu, 21 Jul 2022 18:29:48 +0800
Message-Id: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
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

Fix sparse warning

changes in v2:
- use pcm_format_to_bits
- use u32 asrc_fmt, then convert it to snd_pcm_format_t

Shengjiu Wang (5):
  ASoC: fsl_sai: Don't use plain integer as NULL pointer
  ASoC: fsl_asrc: force cast the asrc_format type
  ASoC: fsl-asoc-card: force cast the asrc_format type
  ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
  ASoC: imx-card: use snd_pcm_format_t type for asrc_format

 sound/soc/fsl/fsl-asoc-card.c | 5 +++--
 sound/soc/fsl/fsl_asrc.c      | 6 ++++--
 sound/soc/fsl/fsl_easrc.c     | 9 ++++++---
 sound/soc/fsl/fsl_easrc.h     | 2 +-
 sound/soc/fsl/fsl_sai.c       | 2 +-
 sound/soc/fsl/imx-card.c      | 8 +++++---
 6 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.34.1

