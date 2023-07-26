Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F67639F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 17:03:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Gzf68b/X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9xx06LYzz3cTK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 01:03:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Gzf68b/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9xw45rXwz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 01:02:41 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2CC861C000F;
	Wed, 26 Jul 2023 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690383756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FpeWQVS1LV41419lc34wEM78sy9lpE/B0BYD4uQm7jg=;
	b=Gzf68b/XHUTXP3KQE7d0QnVpc5X/vl4c556z35tFIPXX7gqQeb2ezoJ3mjAyEKVJkOl0AQ
	GmlcY4CyOtXQ1AqovYAZ2wJEvUiZPsUAQj7m6vIGBk8ArMF2YWjK3MFRLhOvKsdkSUA9zn
	0VZQAsXOFs8fu2RxSDvcPmiBJ5AUbyiedZaQJ4FqFlm/HNf47DKgzMUA7za4uA3gDddVWc
	caO0ECW6RKM0cPwoqi9mEpM4Va5EQ0ap2n+P9/+PwD02v2D56YykatyZT3rvigBESrQuyI
	RaqXj8+rvS/zlmzMRVVqLN4K3ZmHPcLy9ykbbAHz65med6BnWMaVgzu4EAMKWg==
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
Subject: [PATCH v2 00/28] Add support for QMC HDLC, framer infrastruture and PEF2256 framer
Date: Wed, 26 Jul 2023 17:01:56 +0200
Message-ID: <20230726150225.483464-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
  https://lore.kernel.org/linux-kernel/20230725092417.43706-1-herve.codina@bootlin.com/
This v2 series mainly:
 - Adds 2 patches to fix some compilation warning present on existing
   files (__iomem addresses declaration issues).
 - Fixes compilation warning on some patches.
 - Reword a commit log.

Best regards,
Hervé

[1]: https://lore.kernel.org/all/20230417171601.74656-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/all/20230323103154.264546-1-herve.codina@bootlin.com/

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
  dt-bindings: net: fsl,qmc-hdlc: Add framer support
  net: wan: fsl_qmc_hdlc: Add framer support

 .../devicetree/bindings/net/fsl,qmc-hdlc.yaml |  46 +
 .../bindings/net/lantiq,pef2256.yaml          | 226 +++++
 MAINTAINERS                                   |  17 +
 drivers/mfd/mfd-core.c                        |  18 +-
 drivers/net/wan/Kconfig                       |  14 +
 drivers/net/wan/Makefile                      |   3 +
 drivers/net/wan/framer/Kconfig                |  35 +
 drivers/net/wan/framer/Makefile               |   7 +
 drivers/net/wan/framer/framer-core.c          | 935 ++++++++++++++++++
 drivers/net/wan/framer/pef2256/Makefile       |   8 +
 drivers/net/wan/framer/pef2256/pef2256-regs.h | 250 +++++
 drivers/net/wan/framer/pef2256/pef2256.c      | 880 +++++++++++++++++
 drivers/net/wan/fsl_qmc_hdlc.c                | 820 +++++++++++++++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h        |  65 ++
 drivers/pinctrl/pinctrl-pef2256.c             | 310 ++++++
 drivers/soc/fsl/qe/qmc.c                      | 501 ++++++++--
 drivers/soc/fsl/qe/tsa.c                      |  22 +-
 include/linux/framer/framer-provider.h        | 194 ++++
 include/linux/framer/framer.h                 | 215 ++++
 include/linux/framer/pef2256.h                |  31 +
 include/soc/fsl/qe/qmc.h                      |  25 +-
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/framer-codec.c               | 423 ++++++++
 sound/soc/fsl/fsl_qmc_audio.c                 |   2 +-
 27 files changed, 4957 insertions(+), 122 deletions(-)
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

