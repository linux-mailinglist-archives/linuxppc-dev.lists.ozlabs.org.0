Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55893BED3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 11:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WV4wW5XxTz3fny
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 19:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WV4vJ3HSzz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 19:14:04 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F1351A0517;
	Thu, 25 Jul 2024 11:14:02 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CADEA1A0515;
	Thu, 25 Jul 2024 11:14:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 36826181D0FA;
	Thu, 25 Jul 2024 17:14:00 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_micfil: Differentiate register access permission for platforms
Date: Thu, 25 Jul 2024 16:54:54 +0800
Message-Id: <1721897694-6088-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On i.MX9x platforms, the REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID,
REG_MICFIL_PARAM are added, but they are not existed on i.MX8x
platforms.

Use the existed micfil->soc->use_verid to distinguish the access
permission for these platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 96a6b88d0d67..22b240a70ad4 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -855,6 +855,8 @@ static const struct reg_default fsl_micfil_reg_defaults[] = {
 
 static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case REG_MICFIL_CTRL1:
 	case REG_MICFIL_CTRL2:
@@ -872,9 +874,6 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:
-	case REG_MICFIL_FSYNC_CTRL:
-	case REG_MICFIL_VERID:
-	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:
@@ -883,6 +882,12 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_VAD0_NDATA:
 	case REG_MICFIL_VAD0_ZCD:
 		return true;
+	case REG_MICFIL_FSYNC_CTRL:
+	case REG_MICFIL_VERID:
+	case REG_MICFIL_PARAM:
+		if (micfil->soc->use_verid)
+			return true;
+		fallthrough;
 	default:
 		return false;
 	}
@@ -890,6 +895,8 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 
 static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case REG_MICFIL_CTRL1:
 	case REG_MICFIL_CTRL2:
@@ -899,7 +906,6 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:	/* Write 1 to Clear */
-	case REG_MICFIL_FSYNC_CTRL:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:	/* Write 1 to Clear */
@@ -907,6 +913,10 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_VAD0_NCONFIG:
 	case REG_MICFIL_VAD0_ZCD:
 		return true;
+	case REG_MICFIL_FSYNC_CTRL:
+		if (micfil->soc->use_verid)
+			return true;
+		fallthrough;
 	default:
 		return false;
 	}
-- 
2.34.1

