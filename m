Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0379C9E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 10:28:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YKngppwd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlGv52ln8z3cVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 18:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YKngppwd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlGt940Ddz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 18:27:42 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id AF29F240016;
	Tue, 12 Sep 2023 08:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694507256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NNWFLazESxtDfZ0O18bgdLpVRYNM1p8Orh6JoHPD9OQ=;
	b=YKngppwdh40YfWiGLJAS/KGVy3lcyyimFa5IhNF2BFpY76MQv7PcAngjWD5emB/NpPdZVs
	XuFHa7GDsZeCDN4VtR1DBdOhhQMg7F0sKFJAb1MDA7SiI1aMS1uljTxpDobJ34HUMqgBjt
	FHOxQNRcNFQVzbTLPwBJsz8bn9G8RLA4WP+TyyXemwpqd4wrtR0zPRPD7LXQ8thvcbVeuZ
	ExcT1Fcq50Uh6D73l3yfs6AqzdGcuV9dXnjY+Tgn2jvV+Rk9i1RjFps/RP9BqIFKYwuwfR
	kO8gTvwFMC5ooqNP3G2Onc78ybIs69RViNXNP4dTCVaFKEEPSvcfTmBa6iIIVg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 00/31] Add support for QMC HDLC, framer infrastructure and PEF2256 framer
Date: Tue, 12 Sep 2023 10:14:51 +0200
Message-ID: <20230912081527.208499-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I have a system where I need to handle an HDLC interface and some audio
data.

The HDLC data are transferred using a TDM bus on which a PEF2256
(E1/T1 framer) is present. The PEF2256 transfers data from/to the TDM
bus to/from the E1 line. This PEF2256 is connected to a PowerQUICC SoC
for the control path and the TDM is connected to the SoC (QMC component)
for the data path.

From the QMC HDLC driver, I need to handle HDLC data using the QMC,
carrier detection using the PEF2256 (E1 line carrier) and set/get some
PEF2256 configuration.

The QMC HDLC driver considers the PEF2256 as a generic framer.
It performs operations that involve the PEF2256 through the generic
framer API.

The audio data are exchanged with the PEF2256 using a CPU DAI connected
to the TDM bus through the QMC and the PEF2256 needs to be seen as a
codec in order to be linked to the CPU DAI.
The codec handles the carrier detection using the PEF2256 and reports
the carrier state to the ALSA subsystem using the ASoC jack detection.

The codec, even if instantiated by the PEF2256 driver, considers the
PEF2256 as a generic framer.

The generic framer has:
 - 2 consumers (QMC HDLC drv and codec)
 - 1 provider (PEF2256)

So, the design is the following:
                        +------------------+           +---------+
                        | QMC              | <- TDM -> | PEF2256 | <-> E1
     +---------+        |  +-------------+ |           |         |
     | CPU DAI | <-data--> | QMC channel | |           |         |
     +---------+        |  +-------------+ |           |         |
+--------------+        |  +-------------+ |           |         |
| QMC HDLC drv | <-data--> | QMC channel | |           |         |
+--------------+        |  +-------------+ |           |         |
     ^                  +------------------+           |         |
     |   +--------+     +-------------+                |         |
     +-> | framer | <-> | PEF2256 drv | <- local bus ->|         |
         |        |     |             |                +---------+
     +-> |        |     |             |
     |   +--------+     |  +-------+  |
     +-------------------> | codec |  |
                        |  +-------+  |
                        +-------------+

Further more, the TDM timeslots used by the QMC HDLC driver need to be
configured at runtime (QMC dynamic timeslots).

Several weeks ago, I sent two series related to this topic:
 - Add the Lantiq PEF2256 audio support [1]
 - RFC Add support for QMC HDLC and PHY [2]
This current series is a rework of these two series taking into account
feedbacks previously received.

In order to implement all of this, I do the following:
 1) Perform some fixes (patches 1, 2, 3, 4, 5, 6, 7)
 2) Introduce the QMC HDLC driver (patches 8, 9, 10, 11)
 3) Add QMC dynamic timeslot support (patches 12 - 22)
 4) Add timeslots change support in QMC HDLC (patch 23)
 5) Introduce framer infrastructure (patch 24)
 6) Add PEF2256 framer provider (patches 25, 26, 27, 28, 29)
 7) Add framer codec as a framer consumer (patch 30)
 8) Add framer support as a framer consumer in QMC HDLC (patch 31)

The series contains the full story and detailed modifications.
If needed, the series can be split and/or commits can be squashed.
Let me know.

Compare to the previous iteration
  https://lore.kernel.org/linux-kernel/cover.1692376360.git.christophe.leroy@csgroup.eu/
This v5 series mainly:
 - Fixes the DT bindings
 - Adds QMC child devices support
 - Fixes typos and documentation

Best regards,
Hervé

[1]: https://lore.kernel.org/all/20230417171601.74656-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/all/20230323103154.264546-1-herve.codina@bootlin.com/

Changes v4 -> v5

  - Patches 1 to 5
    No changes

  - Patch 6 (new in v5)
    Fix QMC binding example

  - Patch 7 (new in v5)
    Add missing 'additionalProperties: false'

  - Patch 8 (new in v5, replace v4 patch 6)
    Add QMC HDLC properties in the QMC channel node
    Renamed the 'framer' property to 'fsl,framer'

  - Patch 9 (new in v5)
    Add support for QMC child devices

  - Patch 10 (patch 7 in v4)
    No changes

  - Patch 11 (patch 8 in v4)
    Remove fsl,qmc-hdlc.yaml (no more existing file)

  - Patches 12 to 22 (patches 9 to 19 in v4)
    No changes

  - Patch 23 (patch 20 in v4)
    Remove unused variable initializations
    Remove extra space

  - Patch 24 (patch 21 in v4)
    Improve Kconfig help text
    Fix variable declaration (reverse xmas tree)
    Fix typos and extra spaces
    Fix documentation issues raised by 'kernel-doc -none'
    Move of_node_put() and kfree() out of the mutex
    Replace ida_simple_{get,remove}() by ida_{alloc,free}()
    Support framer device-tree nodes without '#framer-cells' property

  - Patch 25 (patch 22 in v4)
    Fix $ref in the pinctrl subnode
    Remove '#framer-cells' property
    Add needed '|'

  - Patch 26 (patch 23 in v4)
    Fix a typo in the commit subject

  - Patches 27, 28, 29 (patch 24, 25, 26 in v4)
    No changes

  - Patch 30 (patch 27 in v4)
    Fix a typo in the commit log

  - Patch 31 (patch 28 in v4)
    Used 'fsl,framer' property name instead of 'framer'

Changes v3 -> v4

  - Patch 21
    Fixes build failure with CONFIG_MODULES

Changes v2 -> v3

  - Patches 1, 2, 3, 4
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - New patch
    Remove inline keyword from the existing registers accessors helpers

  - Patch 6 (patches 5, 27 in v2)
    Update the binding title
    Squash patch 27

  - Patch 7 (patch 6 in v2)
    Remove the cast in netdev_to_qmc_hdlc()
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 8 (patch 7 in v2): No change

  - Patches 9, 10 (patches 8, 9 in v2)
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 11 (patch 10 in v2)
    Remove inline keyword from the introduced qmc_clrsetbits16() helper
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patches 12, 13, 14, 15, 16, 17, 18, 19, 20
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 21 (patch 20 in v2)
    Remove unneeded framer NULL pointer check
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 22 (patch 21 in v2)
    Change sclkr and sclkx clocks description
    Remove the framer phandle property from the framer subnodes
    (ie. from framer-codec nodes)

  - Patch 23 (patch 22 in v2)
    Initialize 'disabled' variable at declaration
    Fix commit log
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 24 (patch 23 in v2)
    Remove inline keyword from the existing registers accessors helpers
    Use dev_warn_ratelimited() in default interrupt handler
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 25 (patch 24 in v2)
    Replace #include "linux/bitfield.h" by #include <linux/bitfield.h>
    Fold the pinctrl anonymous struct into the struct pef2256_pinctrl
    Update commit log
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 26 (patch 25 in v2)
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 27 (patch 26 in v2)
    Fix error message
    Changed the ch.max computation in framer_dai_hw_rule_channels_by_format()
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 28
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

Changes v1 -> v2
  - Patches 1, 2 (New in v2)
    Fix __iomem addresses declaration

  - Patch 19 (17 in v1)
    Fix a compilation warning

  - Patch 26 (24 in v1)
    Fix a typo in Kconfig file
    Fix issues raised by sparse (make C=1)

Herve Codina (31):
  soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix rx channel reset
  soc: fsl: cpm1: qmc: Extend the API to provide Rx status
  soc: fsl: cpm1: qmc: Remove inline function specifiers
  dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Fix example property name
  dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add
    'additionalProperties: false' in child nodes
  dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add support for QMC HDLC
  soc: fsl: cpm1: qmc: Add support for child devices
  net: wan: Add support for QMC HDLC
  MAINTAINERS: Add the Freescale QMC HDLC driver entry
  soc: fsl: cpm1: qmc: Introduce available timeslots masks
  soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
  soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
  soc: fsl: cpm1: qmc: Remove no more needed checks from
    qmc_check_chans()
  soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
  soc: fsl: cpm1: qmc: Add support for disabling channel TSA entries
  soc: fsl: cpm1: qmc: Split Tx and Rx TSA entries setup
  soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
  soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and
    stop()
  soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
  soc: fsl: cpm1: qmc: Introduce functions to change timeslots at
    runtime
  wan: qmc_hdlc: Add runtime timeslots changes support
  net: wan: Add framer framework support
  dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
  mfd: core: Ensure disabled devices are skipped without aborting
  net: wan: framer: Add support for the Lantiq PEF2256 framer
  pinctrl: Add support for the Lantic PEF2256 pinmux
  MAINTAINERS: Add the Lantiq PEF2256 driver entry
  ASoC: codecs: Add support for the framer codec
  net: wan: fsl_qmc_hdlc: Add framer support

 .../bindings/net/lantiq,pef2256.yaml          | 214 +++++
 .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      |  20 +-
 MAINTAINERS                                   |  16 +
 drivers/mfd/mfd-core.c                        |  17 +-
 drivers/net/wan/Kconfig                       |  14 +
 drivers/net/wan/Makefile                      |   3 +
 drivers/net/wan/framer/Kconfig                |  39 +
 drivers/net/wan/framer/Makefile               |   7 +
 drivers/net/wan/framer/framer-core.c          | 887 ++++++++++++++++++
 drivers/net/wan/framer/pef2256/Makefile       |   8 +
 drivers/net/wan/framer/pef2256/pef2256-regs.h | 250 +++++
 drivers/net/wan/framer/pef2256/pef2256.c      | 880 +++++++++++++++++
 drivers/net/wan/fsl_qmc_hdlc.c                | 820 ++++++++++++++++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h        |  65 ++
 drivers/pinctrl/pinctrl-pef2256.c             | 308 ++++++
 drivers/soc/fsl/qe/qmc.c                      | 592 +++++++++---
 drivers/soc/fsl/qe/tsa.c                      |  22 +-
 include/linux/framer/framer-provider.h        | 194 ++++
 include/linux/framer/framer.h                 | 205 ++++
 include/linux/framer/pef2256.h                |  31 +
 include/soc/fsl/qe/qmc.h                      |  27 +-
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/framer-codec.c               | 413 ++++++++
 sound/soc/fsl/fsl_qmc_audio.c                 |   2 +-
 27 files changed, 4921 insertions(+), 145 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
 create mode 100644 drivers/net/wan/framer/Kconfig
 create mode 100644 drivers/net/wan/framer/Makefile
 create mode 100644 drivers/net/wan/framer/framer-core.c
 create mode 100644 drivers/net/wan/framer/pef2256/Makefile
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256-regs.h
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256.c
 create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c
 create mode 100644 drivers/pinctrl/pinctrl-pef2256-regs.h
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c
 create mode 100644 include/linux/framer/framer-provider.h
 create mode 100644 include/linux/framer/framer.h
 create mode 100644 include/linux/framer/pef2256.h
 create mode 100644 sound/soc/codecs/framer-codec.c

-- 
2.41.0

