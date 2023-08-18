Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEADB781089
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS71G5vTSz3dJx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS6zt00jLz3cQb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:40:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS6zd3Vwdz9vh6;
	Fri, 18 Aug 2023 18:39:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ok8P6jc0Im6f; Fri, 18 Aug 2023 18:39:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6zb6BlNz9vh2;
	Fri, 18 Aug 2023 18:39:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBB398B763;
	Fri, 18 Aug 2023 18:39:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5beDYZ15lM4Q; Fri, 18 Aug 2023 18:39:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2064B8B76C;
	Fri, 18 Aug 2023 18:39:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGdnC1141935
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:39:49 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGdfGJ141922;
	Fri, 18 Aug 2023 18:39:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 00/28] Add support for QMC HDLC, framer infrastruture and PEF2256 framer (v4)
Date: Fri, 18 Aug 2023 18:38:54 +0200
Message-ID: <cover.1692376360.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692376733; l=10866; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=835G2+Dp1ba8DphKmbFdPRBzL9um9unEywPAxrJCQm4=; b=5997gMHilOeMKEtdjViSSuw8u3fSBtNmAMIrRP3FiSsrVAJNLPDw4ypo8RmXIPrGZoappExBe ANDgcgUJ5EBDsC0hs5U1QAqDFXb5s53H6/6hBXFlU4ImeGfN/sjH0W5
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Herve Codina <herve.codina@bootlin.com>

Hi,

TLDR: This is a resend of v3 with a build failure fix in patch 21. No other changes.

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
 1) Perform some fixes (patches 1, 2, 3, 4)
 2) Introduce the QMC HDLC driver (patches 5, 6, 7)
 3) Add QMC dynamic timeslot support (patches 8 - 18)
 4) Add timeslots change support in QMC HDLC (patch 19)
 5) Introduce framer infrastructure (patch 20)
 6) Add PEF2256 framer provider (patches 11, 22, 23, 24, 25)
 7) Add framer codec as a framer consumer (patch 26)
 8) Add framer support as a framer consumer in QMC HDLC (patch 27, 28)

The series contains the full story and detailed modifications.
If needed, the series can be split and/or commmits can be squashed.
Let me know.

Compare to the previous iteration
  https://lore.kernel.org/linux-kernel/20230726150225.483464-1-herve.codina@bootlin.com/
This v3 series mainly:
 - Fixes some implementation details.
 - Adds a new patch (patch 5) to remove existing inline keyword in the
   QMC driver.
 - Squashes patches related to the QMC HDLC binding together.

Best regards,
Hervé

[1]: https://lore.kernel.org/all/20230417171601.74656-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/all/20230323103154.264546-1-herve.codina@bootlin.com/

Changes v3 -> v4
  - Fixes build failure with CONFIG_MODULES in patch 21 (net: wan: Add framer framework support)

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

Herve Codina (28):
  soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix rx channel reset
  soc: fsl: cpm1: qmc: Extend the API to provide Rx status
  soc: fsl: cpm1: qmc: Remove inline function specifiers
  dt-bindings: net: Add support for QMC HDLC
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
  mfd: core: Ensure disabled devices are skiped without aborting
  net: wan: framer: Add support for the Lantiq PEF2256 framer
  pinctrl: Add support for the Lantic PEF2256 pinmux
  MAINTAINERS: Add the Lantiq PEF2256 driver entry
  ASoC: codecs: Add support for the framer codec
  net: wan: fsl_qmc_hdlc: Add framer support

 .../devicetree/bindings/net/fsl,qmc-hdlc.yaml |  46 +
 .../bindings/net/lantiq,pef2256.yaml          | 219 +++++
 MAINTAINERS                                   |  17 +
 drivers/mfd/mfd-core.c                        |  17 +-
 drivers/net/wan/Kconfig                       |  14 +
 drivers/net/wan/Makefile                      |   3 +
 drivers/net/wan/framer/Kconfig                |  35 +
 drivers/net/wan/framer/Makefile               |   7 +
 drivers/net/wan/framer/framer-core.c          | 886 ++++++++++++++++++
 drivers/net/wan/framer/pef2256/Makefile       |   8 +
 drivers/net/wan/framer/pef2256/pef2256-regs.h | 250 +++++
 drivers/net/wan/framer/pef2256/pef2256.c      | 880 +++++++++++++++++
 drivers/net/wan/fsl_qmc_hdlc.c                | 820 ++++++++++++++++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h        |  65 ++
 drivers/pinctrl/pinctrl-pef2256.c             | 308 ++++++
 drivers/soc/fsl/qe/qmc.c                      | 501 ++++++++--
 drivers/soc/fsl/qe/tsa.c                      |  22 +-
 include/linux/framer/framer-provider.h        | 194 ++++
 include/linux/framer/framer.h                 | 199 ++++
 include/linux/framer/pef2256.h                |  31 +
 include/soc/fsl/qe/qmc.h                      |  25 +-
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/framer-codec.c               | 413 ++++++++
 sound/soc/fsl/fsl_qmc_audio.c                 |   2 +-
 27 files changed, 4872 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
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

