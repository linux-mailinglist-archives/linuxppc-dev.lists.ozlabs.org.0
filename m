Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA71A467CDD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 18:52:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5L4K3sblz3bXW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 04:52:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NwkfaQST;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=NwkfaQST; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5L2y3dDRz3bj0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 04:50:50 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 5BF591F4724E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638553848; bh=sjUDlRzGKvbKVrH0gyQWnGzouzwqlG1XZ4Jt6m71DjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NwkfaQSTsNOkewcP0B716mc78gWZExuruZKkT+w5vMZK3j5bz16Jz46lMdsSHN6d8
 vbrQW+rczqrkZv7gADP/scWRDEpZELWkgK9yA3WbJZ7dzxsAcQM3cDW6Z1dSMAb2Ph
 DNZF/IGm1DuStbG7DGLsA3ifLF43DOGqZelzCHtFwWuhY9wg8KVgqH+XQ0KWLpha4L
 qG7g0WNvjEWJlWRgAmxQ49gBw/2k9U/fZgKgHc25hoh1vheF6Au/McyIVX/qPQcez6
 qZRfpnnAGXXsjsVkukAqI/r4Gfni8Z3xi3pR/SlzRu6kHkDoRnRsKTWgE+AyRiCnpk
 05KK4eUCt4h8g==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Date: Fri,  3 Dec 2021 14:50:18 -0300
Message-Id: <20211203175018.252641-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
References: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
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
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, broonie@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following commit added support for tlv320aic31xx codec to
fsl-asoc-card, but missed the related Kconfig option. Fix this.

  commit 8c9b9cfb7724685ce705f511b882f30597596536
  Author: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
  Date:   Fri Nov 19 12:32:48 2021 -0300

      ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8e05d092790e..10fa38753453 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -311,6 +311,7 @@ config SND_SOC_FSL_ASOC_CARD
 	select SND_SOC_FSL_ESAI
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_SSI
+	select SND_SOC_TLV320AIC31XX
 	select SND_SOC_WM8994
 	select MFD_WM8994
 	help
-- 
2.30.2

