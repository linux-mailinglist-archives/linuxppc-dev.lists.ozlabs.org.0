Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DC91DDF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:32:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ANN/2Ckk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCP6B62J3z3dGt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:32:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ANN/2Ckk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 13455 seconds by postgrey-1.37 at boromir; Mon, 01 Jul 2024 21:31:58 AEST
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCP5V2KTKz30Tr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:31:56 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4AADC240004;
	Mon,  1 Jul 2024 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TqveFrD/1PHIy0E8P+KaxTJIcmaej9qy4xJZ6jJ5cN0=;
	b=ANN/2CkkQrqrO4xZK9u8ClRYRFb5eKoKlcj7yRDCdnZ/9TiyxlLkJjTAve49Nx3kQf8MlB
	/62guWb9ZBsXWoJY5WY6cvBiMU/RMfTxashgUO/JCcF6lKlMXUKqHNLnIPLCz/zvoi9NiW
	Wx8tSqaZruOasBKpnyaIlbzxju3oXeHITfVLQtYvuHbYv2A4PqJ9UEj2mJfsNBahZfkzTK
	I2qMiWLpTIz38BkgEm/l1sA5aLZonUm4pkA0sf73hW6ZCyt5wYZZ3moV+wC0dCxB1WlzF3
	DkDaRYEBbd7h6mjSQOw6HY5ZL9nbJC5Q1a8vjoirhzMFJVi8gCKB9GwOZDc8uA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 00/10] Add support for non-interleaved mode in qmc_audio
Date: Mon,  1 Jul 2024 13:30:27 +0200
Message-ID: <20240701113038.55144-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The qmc_audio driver supports only audio in interleaved mode.
Non-interleaved mode can be easily supported using several QMC channel
per DAI. In that case, data related to ch0 are sent to (received from)
the first QMC channel, data related to ch1 use the next QMC channel and
so on up to the last channel.

In terms of constraints and settings, the interleaved and
non-interleaved modes are slightly different.

In interleaved mode:
  - The sample size should fit in the number of time-slots available for
    the QMC channel.
  - The number of audio channels should fit in the number of time-slots
    (taking into account the sample size) available for the QMC channel.

In non-interleaved mode:
  - The number of audio channels is the number of available QMC
    channels.
  - Each QMC channel should have the same number of time-slots.
  - The sample size equals the number of time-slots of one QMC channel.

This series add support for the non-interleaved mode in the qmc_audio
driver and is composed of the following parts:
  - Patches 1 and 2: Fix some issues in the qmc_audio
  - Patches 3 to 6: Prepare qmc_audio for the non-interleaved mode
  - Patches 7 and 8: Extend the QMC driver API
  - Patches 9 and 10: The support for non-interleaved mode itself

Compared to the previous iteration, this v2 series mainly improves
qmc_audio_access_is_interleaved().

Best regards,
Hervé

Link to v1: https://lore.kernel.org/lkml/20240620084300.397853-1-herve.codina@bootlin.com/
Changes v1 -> v2
  - Patches 1 to 8
    No changes

  - Patch 9
    Add 'Reviewed-by: Rob Herring (Arm) <robh@kernel.org>'

  - Patch 10
    Remove unneeded ';'
    Modify qmc_audio_access_is_interleaved()

Herve Codina (10):
  ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
  ASoC: fsl: fsl_qmc_audio: Fix issues detected by checkpatch
  ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM pointer
    handling
  ASoC: fsl: fsl_qmc_audio: Identify the QMC channel involved in
    completion routines
  ASoC: fsl: fsl_qmc_audio: Introduce
    qmc_audio_pcm_{read,write}_submit()
  ASoC: fsl: fsl_qmc_audio: Introduce qmc_dai_constraints_interleaved()
  soc: fsl: cpm1: qmc: Introduce functions to get a channel from a
    phandle list
  soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
  dt-bindings: sound: fsl,qmc-audio: Add support for multiple QMC
    channels per DAI
  ASoC: fsl: fsl_qmc_audio: Add support for non-interleaved mode.

 .../bindings/sound/fsl,qmc-audio.yaml         |  41 +-
 drivers/soc/fsl/qe/qmc.c                      |  32 +-
 include/soc/fsl/qe/qmc.h                      |  27 +-
 sound/soc/fsl/fsl_qmc_audio.c                 | 591 +++++++++++++-----
 4 files changed, 506 insertions(+), 185 deletions(-)

-- 
2.45.0

