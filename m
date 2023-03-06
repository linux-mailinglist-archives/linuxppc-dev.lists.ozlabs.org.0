Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 335756AC789
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 17:18:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVkKY0jHGz3f4r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 03:18:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KLgXll9U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KLgXll9U;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVkJf6Yl1z3c99
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 03:18:10 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id B8DE6240011;
	Mon,  6 Mar 2023 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678119486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AEHB70r9T6Xb4b/oyO9gU4B0pTFiE3k8r5z+jtLT0dI=;
	b=KLgXll9UVG4p9bonmysPq63TNtxUR0Yet2qsQ/rpVlhq8DKJCO6ITCbS/JsKQPcv2En9+w
	wxobG22c2Uh9Rg8HVZXFwWTTXY3ZL/P/HevSIdUEF0vttdv3KdW7GtYOpCWl9Ta8pQx7pM
	3YV8HaF6lS9Z++o5Vc90IOkMgHtpRgWummRWsw1cBy2EtA9InWQqIJpwq0Qn2D5ya+AzuV
	62HiiGNMr54leuOiWDu7LQS1UKdROpJZCjgkDboPEqOxSVPbFTlbn3l55fWDT2x370KQgt
	Q8bTLsfbXnu8bAKyVH4RR4qDvW5ST2m8RpbvPCTY5RLug+QIGc8kzXKINlaiGA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v7 00/10] Add the PowerQUICC audio support using the QMC
Date: Mon,  6 Mar 2023 17:17:44 +0100
Message-Id: <20230306161754.89146-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This series adds support for audio using the QMC controller available in
some Freescale PowerQUICC SoCs.

This series contains three parts in order to show the different blocks
hierarchy and their usage in this support.

The first one is related to TSA (Time Slot Assigner).
The TSA handles the data present at the pin level (TDM with up to 64
time slots) and dispatchs them to one or more serial controller (SCC).

The second is related to QMC (QUICC Multichannel Controller).
The QMC handles the data at the serial controller (SCC) level and splits
again the data to creates some virtual channels.

The last one is related to the audio component (QMC audio).
It is the glue between the QMC controller and the ASoC component. It
handles one or more QMC virtual channels and creates one DAI per QMC
virtual channels handled.

Compared to the previous iteration
  https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codina@bootlin.com/
this v7 series:
  - remove '#fsl,serial-cells' (TSA) and '#fsl,chan-cells' (QMC)
    properties
  - Fix the QMC timeslots mask generation in case of 64 timeslots

Best regards,
Herve Codina

Changes v6 -> v7
  - Patch 1
    Remove #fsl,serial-cells
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 2, 3, 7, 8 and 10
    Add	'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 5
    Remove #fsl,chan-cells
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 6
    Fix the timeslot assigned mask in case of 64 timeslots

  - Patch 9
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
    Add 'Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

Changes v5 -> v6
  - Patch 1
    Fix blank lines and spaces
    Remove fsl,diagnostic-mode
    Add some maxItems values
    Renamed fsl,tsa.h to cpm1-fsl,tsa.h

  - Patch 2
    Remove fsl,diagnostic-mode
    Renamed fsl,tsa.h to cpm1-fsl,tsa.h
    Add 'Acked-by: Li Yang <leoyang.li@nxp.com>'

  - Patch 3
    Renamed fsl,tsa.h to cpm1-fsl,tsa.h

  - Patch 5
    Renamed fsl,tsa.h to cpm1-fsl,tsa.h
    Add 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>'

Changes v4 -> v5
  - patch 1
    Rename fsl,tsa.yaml to fsl,cpm1-tsa.yaml
    Rename #serial-cells to #fsl,serial-cells and add a description
    Fix typos
    Remove examples present in description
    Use a pattern property for fsl,[rt]x-ts-routes

  - patch 2
    Remove one left out_8() ppc specific function call
    Remove the no more needed PPC dependency in case of COMPILE_TEST

  - patch 4
    Add 'Acked-by: Michael Ellerman <mpe@ellerman.id.au>'

  - patch 5
    Rename fsl,qmc.yaml to fsl,cpm1-scc-qmc.yaml
    Rename #chan-cells to #fsl,chan-cells and add a description

  - patch 6
    Add the SOC_FSL dependency in case of COMPILE_TEST (issue raised by
    the kernel test robot).
    Fix a typo in commit log
    Add 'Acked-by: Li Yang <leoyang.li@nxp.com>'

Changes v3 -> v4
  - patches 2, 6 and 9
    Update code comment format.

  - patch 1
    Fix some description formats.
    Add 'additionalProperties: false' in subnode.
    Move fsl,mode to fsl,diagnostic-mode.
    Change clocks and clock-names properties.
    Add '#serial-cells' property related to the newly introduced
    fsl,tsa-serial phandle.

  - patch 2
    Move fsl,mode to fsl,diagnostic-mode.
    Replace the	fsl,tsa phandle and the	fsl,tsa-cell-id	property by a
    fsl,tsa-serial phandle and update the related API.
    Add missing locks.

  - patch 5
    Fix some description format.
    Replace the fsl,tsa phandle and the fsl,tsa-cell-id property by a
    fsl,tsa-serial phandle.
    Rename fsl,mode to fsl,operational-mode and update its description.

  - patch 6
    Replace the	fsl,tsa phandle and the	fsl,tsa-cell-id	property by a
    fsl,tsa-serial phandle and use the TSA updated API.
    Rename fsl,mode to fsl,operational-mode.

  - patch 8
    Add 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>'

Changes v2 -> v3
  - All bindings
    Rename fsl-tsa.h to fsl,tsa.h
    Add missing vendor prefix
    Various fixes (quotes, node names, upper/lower case)

  - patches 1 and 2 (TSA binding specific)
    Remove 'reserved' values in the routing tables
    Remove fsl,grant-mode
    Add a better description for 'fsl,common-rxtx-pins'
    Fix clocks/clocks-name handling against fsl,common-rxtx-pins
    Add information related to the delays unit
    Removed FSL_CPM_TSA_NBCELL
    Fix license in binding header file fsl,tsa.h

  - patches 5 and 6 (QMC binding specific)
    Remove fsl,cpm-command property
    Add interrupt property constraint

  - patches 8 and 9 (QMC audio binding specific)
    Remove 'items' in compatible property definition
    Add missing 'dai-common.yaml' reference
    Fix the qmc_chan phandle definition

  - patch 2 and 6
    Use io{read,write}be{32,16}
    Change commit subjects and logs

  - patch 4
    Add 'Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

Changes v1 -> v2:
  - patch 2 and 6
    Fix kernel test robot errors

  - other patches
    No changes

Herve Codina (10):
  dt-bindings: soc: fsl: cpm_qe: Add TSA controller
  soc: fsl: cpm1: Add support for TSA
  MAINTAINERS: add the Freescale TSA controller entry
  powerpc/8xx: Use a larger CPM1 command check mask
  dt-bindings: soc: fsl: cpm_qe: Add QMC controller
  soc: fsl: cpm1: Add support for QMC
  MAINTAINERS: add the Freescale QMC controller entry
  dt-bindings: sound: Add support for QMC audio
  ASoC: fsl: Add support for QMC audio
  MAINTAINERS: add the Freescale QMC audio entry

 .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      |  162 ++
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml |  205 +++
 .../bindings/sound/fsl,qmc-audio.yaml         |  117 ++
 MAINTAINERS                                   |   25 +
 arch/powerpc/platforms/8xx/cpm1.c             |    2 +-
 drivers/soc/fsl/qe/Kconfig                    |   23 +
 drivers/soc/fsl/qe/Makefile                   |    2 +
 drivers/soc/fsl/qe/qmc.c                      | 1537 +++++++++++++++++
 drivers/soc/fsl/qe/tsa.c                      |  846 +++++++++
 drivers/soc/fsl/qe/tsa.h                      |   42 +
 include/dt-bindings/soc/cpm1-fsl,tsa.h        |   13 +
 include/soc/fsl/qe/qmc.h                      |   71 +
 sound/soc/fsl/Kconfig                         |    9 +
 sound/soc/fsl/Makefile                        |    2 +
 sound/soc/fsl/fsl_qmc_audio.c                 |  735 ++++++++
 15 files changed, 3790 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
 create mode 100644 drivers/soc/fsl/qe/qmc.c
 create mode 100644 drivers/soc/fsl/qe/tsa.c
 create mode 100644 drivers/soc/fsl/qe/tsa.h
 create mode 100644 include/dt-bindings/soc/cpm1-fsl,tsa.h
 create mode 100644 include/soc/fsl/qe/qmc.h
 create mode 100644 sound/soc/fsl/fsl_qmc_audio.c

-- 
2.39.2

