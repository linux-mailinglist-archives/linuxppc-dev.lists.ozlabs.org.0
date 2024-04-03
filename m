Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7EB896AEB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 11:43:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i9S2rWNS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8fvP6G0Hz3vXl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 20:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i9S2rWNS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8cmh33z9z30dn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 19:07:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A376DCE210F;
	Wed,  3 Apr 2024 08:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9555FC433C7;
	Wed,  3 Apr 2024 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712131648;
	bh=K2ePQOaggCQbp9MAuVhX6tyGJTkfITqYlV3FRyD1b2w=;
	h=From:To:Cc:Subject:Date:From;
	b=i9S2rWNSxBnVceX/PhEYHUL/8obuw7YBD3dJv3NpxgtqFmbZ6YmcytIk5F3iE5aJR
	 I5RYRukVlaohxFlUlx3DoVo8ioTOKPq24ESuwErVo02d8QkqEyqWnOCLJPy3IIKQQU
	 hPSJJJ28UFYnjJaOw9nBVZfRfW9z44J6zH3uuTF5it8w/Z071qPjEqTUM2WnMMrizN
	 fO98GSAxPEoZV8r5mdONzcx9Bk+cWCKiyR3aI2XXY3Z1B5LcdC6almvWr6dDKTwDko
	 dlyuak8JP+s7GrNn1iYACGO+Vywch0Qm7yXwZNXpNcwyBGG5wOlDd55NN/VlxGiFO6
	 vEIx/q6HxkU2Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/34] address all -Wunused-const warnings
Date: Wed,  3 Apr 2024 10:06:18 +0200
Message-Id: <20240403080702.3509288-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Apr 2024 20:42:54 +1100
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-sound@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>, linux-omap@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>, Alex Elder <elder@kernel.org>, Tero Kristo <kristo@kernel.org>, Xiang Chen <chenxiang66@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Alexandre Be
 lloni <alexandre.belloni@bootlin.com>, Markuss Broks <markuss.broks@gmail.com>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Yisen Zhuang <yisen.zhuang@huawei.com>, Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, Anna Schumaker <anna@kernel.org>, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, Jonathan Cameron <jic23@kernel.org>, linux-efi@vger.kernel.org, linux-iio@vger.kernel.org, linux-fpga
 @vger.kernel.org, linux-fbdev@vger.kernel.org, kasan-dev@googlegroups.com, Jiri Slaby <jirislaby@kernel.org>, linux-rtc@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>, Masahiro Yamada <masahiroy@kernel.org>, linux-staging@lists.linux.dev, linux-input@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jikos@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>, openipmi-developer@lists.sourceforge.net, linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>, linux-stm32@st-md-mailman.stormreply.com, Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-ide@vger.kerne
 l.org, Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Kalle Valo <kvalo@kernel.org>, John Allen <john.allen@amd.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Compilers traditionally warn for unused 'static' variables, but not
if they are constant. The reason here is a custom for C++ programmers
to define named constants as 'static const' variables in header files
instead of using macros or enums.

In W=1 builds, we get warnings only static const variables in C
files, but not in headers, which is a good compromise, but this still
produces warning output in at least 30 files. These warnings are
almost all harmless, but also trivial to fix, and there is no
good reason to warn only about the non-const variables being unused.

I've gone through all the files that I found using randconfig and
allmodconfig builds and created patches to avoid these warnings,
with the goal of retaining a clean build once the option is enabled
by default.

Unfortunately, there is one fairly large patch ("drivers: remove
incorrect of_match_ptr/ACPI_PTR annotations") that touches
34 individual drivers that all need the same one-line change.
If necessary, I can split it up by driver or by subsystem,
but at least for reviewing I would keep it as one piece for
the moment.

Please merge the individual patches through subsystem trees.
I expect that some of these will have to go through multiple
revisions before they are picked up, so anything that gets
applied early saves me from resending.

        Arnd

Arnd Bergmann (31):
  powerpc/fsl-soc: hide unused const variable
  ubsan: fix unused variable warning in test module
  platform: goldfish: remove ACPI_PTR() annotations
  i2c: pxa: hide unused icr_bits[] variable
  3c515: remove unused 'mtu' variable
  tracing: hide unused ftrace_event_id_fops
  Input: synaptics: hide unused smbus_pnp_ids[] array
  power: rt9455: hide unused rt9455_boost_voltage_values
  efi: sysfb: don't build when EFI is disabled
  clk: ti: dpll: fix incorrect #ifdef checks
  apm-emulation: hide an unused variable
  sisfb: hide unused variables
  dma/congiguous: avoid warning about unused size_bytes
  leds: apu: remove duplicate DMI lookup data
  iio: ad5755: hook up of_device_id lookup to platform driver
  greybus: arche-ctrl: move device table to its right location
  lib: checksum: hide unused expected_csum_ipv6_magic[]
  sunrpc: suppress warnings for unused procfs functions
  comedi: ni_atmio: avoid warning for unused device_ids[] table
  iwlegacy: don't warn for unused variables with DEBUG_FS=n
  drm/komeda: don't warn for unused debugfs files
  firmware: qcom_scm: mark qcom_scm_qseecom_allowlist as __maybe_unused
  crypto: ccp - drop platform ifdef checks
  usb: gadget: omap_udc: remove unused variable
  isdn: kcapi: don't build unused procfs code
  cpufreq: intel_pstate: hide unused intel_pstate_cpu_oob_ids[]
  net: xgbe: remove extraneous #ifdef checks
  Input: imagis - remove incorrect ifdef checks
  sata: mv: drop unnecessary #ifdef checks
  ASoC: remove incorrect of_match_ptr/ACPI_PTR annotations
  spi: remove incorrect of_match_ptr annotations
  drivers: remove incorrect of_match_ptr/ACPI_PTR annotations
  kbuild: always enable -Wunused-const-variable

Krzysztof Kozlowski (1):
  Input: stmpe-ts - mark OF related data as maybe unused

 arch/powerpc/sysdev/fsl_msi.c                 |  2 +
 drivers/ata/sata_mv.c                         | 64 +++++++++----------
 drivers/char/apm-emulation.c                  |  5 +-
 drivers/char/ipmi/ipmb_dev_int.c              |  2 +-
 drivers/char/tpm/tpm_ftpm_tee.c               |  2 +-
 drivers/clk/ti/dpll.c                         | 10 ++-
 drivers/comedi/drivers/ni_atmio.c             |  2 +-
 drivers/cpufreq/intel_pstate.c                |  2 +
 drivers/crypto/ccp/sp-platform.c              | 14 +---
 drivers/dma/img-mdc-dma.c                     |  2 +-
 drivers/firmware/efi/Makefile                 |  3 +-
 drivers/firmware/efi/sysfb_efi.c              |  2 -
 drivers/firmware/qcom/qcom_scm.c              |  2 +-
 drivers/fpga/versal-fpga.c                    |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_dev.c   |  8 ---
 drivers/hid/hid-google-hammer.c               |  6 +-
 drivers/i2c/busses/i2c-pxa.c                  |  2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c           |  2 +-
 drivers/i2c/muxes/i2c-mux-reg.c               |  2 +-
 drivers/iio/dac/ad5755.c                      |  1 +
 drivers/input/mouse/synaptics.c               |  2 +
 drivers/input/touchscreen/imagis.c            |  4 +-
 drivers/input/touchscreen/stmpe-ts.c          |  2 +-
 drivers/input/touchscreen/wdt87xx_i2c.c       |  2 +-
 drivers/isdn/capi/Makefile                    |  3 +-
 drivers/isdn/capi/kcapi.c                     |  7 +-
 drivers/leds/leds-apu.c                       |  3 +-
 drivers/mux/adg792a.c                         |  2 +-
 drivers/net/ethernet/3com/3c515.c             |  3 -
 drivers/net/ethernet/amd/xgbe/xgbe-platform.c |  8 ---
 drivers/net/ethernet/apm/xgene-v2/main.c      |  2 +-
 drivers/net/ethernet/hisilicon/hns_mdio.c     |  2 +-
 drivers/net/wireless/intel/iwlegacy/4965-rs.c | 15 +----
 drivers/net/wireless/intel/iwlegacy/common.h  |  2 -
 drivers/platform/goldfish/goldfish_pipe.c     |  2 +-
 drivers/power/supply/rt9455_charger.c         |  2 +
 drivers/regulator/pbias-regulator.c           |  2 +-
 drivers/regulator/twl-regulator.c             |  2 +-
 drivers/regulator/twl6030-regulator.c         |  2 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c               |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c        |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c        |  2 +-
 drivers/spi/spi-armada-3700.c                 |  2 +-
 drivers/spi/spi-img-spfi.c                    |  2 +-
 drivers/spi/spi-meson-spicc.c                 |  2 +-
 drivers/spi/spi-meson-spifc.c                 |  2 +-
 drivers/spi/spi-orion.c                       |  2 +-
 drivers/spi/spi-pic32-sqi.c                   |  2 +-
 drivers/spi/spi-pic32.c                       |  2 +-
 drivers/spi/spi-rockchip.c                    |  2 +-
 drivers/spi/spi-s3c64xx.c                     |  2 +-
 drivers/spi/spi-st-ssc4.c                     |  2 +-
 drivers/staging/greybus/arche-apb-ctrl.c      |  1 +
 drivers/staging/greybus/arche-platform.c      |  9 +--
 drivers/staging/pi433/pi433_if.c              |  2 +-
 drivers/tty/serial/amba-pl011.c               |  6 +-
 drivers/tty/serial/ma35d1_serial.c            |  2 +-
 drivers/usb/gadget/udc/omap_udc.c             | 10 +--
 drivers/video/fbdev/sis/init301.c             |  3 +-
 kernel/dma/contiguous.c                       |  2 +-
 kernel/trace/trace_events.c                   |  4 ++
 lib/checksum_kunit.c                          |  2 +
 lib/test_ubsan.c                              |  2 +-
 net/sunrpc/cache.c                            | 10 +--
 scripts/Makefile.extrawarn                    |  1 -
 sound/soc/atmel/sam9x5_wm8731.c               |  2 +-
 sound/soc/codecs/rt5514-spi.c                 |  2 +-
 sound/soc/qcom/lpass-sc7280.c                 |  2 +-
 sound/soc/samsung/aries_wm8994.c              |  2 +-
 69 files changed, 121 insertions(+), 169 deletions(-)

-- 
2.39.2

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Corey Minyard <minyard@acm.org>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Len Brown <lenb@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: John Allen <john.allen@amd.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Moritz Fischer <mdf@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Iyappan Subramanian <iyappan@os.amperecomputing.com>
Cc: Yisen Zhuang <yisen.zhuang@huawei.com>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Xiang Chen <chenxiang66@hisilicon.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: Alex Elder <elder@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: linux-integrity@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-fpga@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-input@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: netdev@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: iommu@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Cc: linux-hardening@vger.kernel.org
Cc: linux-nfs@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org
