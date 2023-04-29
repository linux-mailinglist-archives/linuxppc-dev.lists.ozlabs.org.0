Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB36F254A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 17:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7vDh6Bpzz3f8Q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Apr 2023 01:54:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRNlNK7T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRNlNK7T;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7vCm71SJz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Apr 2023 01:53:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vgnEmcsn/vdxwW+Wgs9nj2+PsYmZXDs2hNecCx7a6R8=; b=LRNlNK7TBM7nikpM4NT1V834vb
	uitrEU2b6gtBZOvfg8VdXsElpxbhD+bTxtVcHL5+xJl2RjbGabz8En4H3lt9xbqJmonyGgTb3sdHD
	3vvuSn98FPaXvCaMnWrYNiugZUaG2uTEs4tJRVR0n/d+rRNUEg45vCum7sLgV6MVG1DFztQOHFIu/
	G/EVRs/LHa/jSudPnVV1/3c4HgalePQiyBy6gqvG5+4KcvsoSm0+qR+C99ihRHfyqlOOCCS+waEQ9
	3o42FpiTfoakZAwoqsxGoSiK09kGBSpFLv2xDY/HB9bWmvoGuuETZW74vZDIeX+7YdAvDv01Umnwb
	S1wUBBgA==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1psmtO-00Crzv-1H;
	Sat, 29 Apr 2023 15:53:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl MPC52xx drivers require PPC_BESTCOMM
Date: Sat, 29 Apr 2023 08:53:45 -0700
Message-Id: <20230429155345.14370-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
so the 2 former symbols should also depend on PPC_BESTCOMM since
"select" does not follow any dependency chains.

This prevents a kconfig warning and build errors:

WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
  Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
  Selected by [m]:
  - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
  - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]

ERROR: modpost: "mpc5200_audio_dma_destroy" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
ERROR: modpost: "mpc5200_audio_dma_create" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!

Fixes: 40d9ec14e7e1 ("ASoC: remove BROKEN from Efika and pcm030 fabric drivers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
---
v2: use correct email address for Mark Brown.

 sound/soc/fsl/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
 
 config SND_MPC52xx_SOC_PCM030
 	tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
-	depends on PPC_MPC5200_SIMPLE
+	depends on PPC_MPC5200_SIMPLE && PPC_BESTCOMM
 	select SND_SOC_MPC5200_AC97
 	select SND_SOC_WM9712
 	help
@@ -252,7 +252,7 @@ config SND_MPC52xx_SOC_PCM030
 
 config SND_MPC52xx_SOC_EFIKA
 	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
-	depends on PPC_EFIKA
+	depends on PPC_EFIKA && PPC_BESTCOMM
 	select SND_SOC_MPC5200_AC97
 	select SND_SOC_STAC9766
 	help
