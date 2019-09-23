Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85104BBC78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 21:51:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cZh74fHYzDqMn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 05:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="g48XT1EK"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTYz5nnkzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:00:39 +1000 (AEST)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 278D220673;
 Mon, 23 Sep 2019 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569254436;
 bh=ckF42/lzy9cn6Me8cZY3ApdIZ8tzZI5dtuYFoQCFjsg=;
 h=From:To:Cc:Subject:Date:From;
 b=g48XT1EK79k+gWBZ2BObRZqPpIXe5nJqKLel8JaFWTzZMnroecwR2hjmYdtIpWMu2
 ALEtllIiWTafGWP5oxm6BTAAdrxDzpq2YP7b7vl3bi2rbLWECjp+PAjEYgVunQdSVj
 pJc/2GBtUewnY/urPifMb2PD5UQp4pm5Bp3hUo6g=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, keyrings@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-input@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org,
 esc.storagedev@microsemi.com, linux-rockchip@lists.infradead.org,
 linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
 ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH trivial 1/3] treewide: drivers: Fix Kconfig indentation
Date: Mon, 23 Sep 2019 18:00:11 +0200
Message-Id: <20190923160013.8550-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 24 Sep 2019 05:49:27 +1000
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
    $ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/acpi/Kconfig                          |  8 +-
 drivers/ata/Kconfig                           | 12 +--
 drivers/auxdisplay/Kconfig                    | 14 +--
 drivers/base/firmware_loader/Kconfig          |  2 +-
 drivers/block/Kconfig                         | 28 +++---
 drivers/block/mtip32xx/Kconfig                |  2 +-
 drivers/char/Kconfig                          |  6 +-
 drivers/char/agp/Kconfig                      |  2 +-
 drivers/char/hw_random/Kconfig                | 10 +-
 drivers/char/ipmi/Kconfig                     | 20 ++--
 drivers/clk/Kconfig                           |  2 +-
 drivers/clk/mediatek/Kconfig                  | 10 +-
 drivers/clk/versatile/Kconfig                 |  2 +-
 drivers/clocksource/Kconfig                   | 20 ++--
 drivers/cpufreq/Kconfig.x86                   |  6 +-
 drivers/cpuidle/Kconfig                       |  8 +-
 drivers/cpuidle/Kconfig.arm                   | 16 ++--
 drivers/crypto/Kconfig                        |  4 +-
 drivers/crypto/caam/Kconfig                   | 14 +--
 drivers/crypto/chelsio/Kconfig                | 30 +++---
 drivers/crypto/stm32/Kconfig                  |  6 +-
 drivers/crypto/ux500/Kconfig                  | 16 ++--
 drivers/devfreq/Kconfig                       |  6 +-
 drivers/dma/Kconfig                           | 46 ++++-----
 drivers/edac/Kconfig                          |  2 +-
 drivers/firmware/Kconfig                      |  4 +-
 drivers/firmware/efi/Kconfig                  |  2 +-
 drivers/hid/Kconfig                           |  2 +-
 drivers/hwmon/Kconfig                         | 14 +--
 drivers/i2c/busses/Kconfig                    | 16 ++--
 drivers/i2c/muxes/Kconfig                     | 18 ++--
 drivers/iio/gyro/Kconfig                      |  8 +-
 drivers/infiniband/hw/bnxt_re/Kconfig         | 12 +--
 drivers/input/keyboard/Kconfig                |  8 +-
 drivers/input/mouse/Kconfig                   |  6 +-
 drivers/input/tablet/Kconfig                  | 20 ++--
 drivers/input/touchscreen/Kconfig             |  2 +-
 drivers/iommu/Kconfig                         |  2 +-
 drivers/irqchip/Kconfig                       | 10 +-
 drivers/isdn/hardware/mISDN/Kconfig           |  2 +-
 drivers/macintosh/Kconfig                     |  6 +-
 drivers/md/Kconfig                            | 54 +++++------
 drivers/media/Kconfig                         |  6 +-
 drivers/media/radio/si470x/Kconfig            |  4 +-
 drivers/memstick/core/Kconfig                 | 18 ++--
 drivers/memstick/host/Kconfig                 |  4 +-
 drivers/misc/Kconfig                          | 16 ++--
 drivers/mtd/nand/onenand/Kconfig              | 12 +--
 drivers/nfc/nfcmrvl/Kconfig                   |  2 +-
 drivers/pci/Kconfig                           | 24 ++---
 drivers/pci/controller/dwc/Kconfig            |  6 +-
 drivers/pci/hotplug/Kconfig                   |  2 +-
 drivers/perf/Kconfig                          | 14 +--
 drivers/phy/hisilicon/Kconfig                 |  6 +-
 drivers/pinctrl/Kconfig                       | 18 ++--
 drivers/pinctrl/freescale/Kconfig             | 12 +--
 drivers/pinctrl/qcom/Kconfig                  | 34 +++----
 drivers/platform/chrome/Kconfig               |  6 +-
 drivers/platform/mellanox/Kconfig             |  4 +-
 drivers/platform/x86/Kconfig                  | 48 +++++-----
 drivers/power/avs/Kconfig                     | 12 +--
 drivers/power/supply/Kconfig                  | 30 +++---
 drivers/regulator/Kconfig                     |  8 +-
 drivers/rpmsg/Kconfig                         |  2 +-
 drivers/rtc/Kconfig                           |  6 +-
 drivers/scsi/Kconfig                          | 22 ++---
 drivers/scsi/aic7xxx/Kconfig.aic7xxx          | 14 +--
 drivers/scsi/pcmcia/Kconfig                   |  2 +-
 drivers/scsi/qedf/Kconfig                     |  4 +-
 drivers/scsi/smartpqi/Kconfig                 |  8 +-
 drivers/soc/fsl/Kconfig                       |  8 +-
 drivers/soc/qcom/Kconfig                      | 22 ++---
 drivers/soc/rockchip/Kconfig                  | 18 ++--
 drivers/spi/Kconfig                           | 18 ++--
 drivers/staging/fbtft/Kconfig                 | 12 +--
 drivers/staging/fwserial/Kconfig              |  6 +-
 drivers/staging/most/Kconfig                  |  8 +-
 drivers/staging/nvec/Kconfig                  | 10 +-
 drivers/staging/pi433/Kconfig                 | 24 ++---
 drivers/staging/uwb/Kconfig                   | 42 ++++----
 .../vc04_services/bcm2835-audio/Kconfig       | 12 +--
 drivers/staging/wusbcore/Kconfig              |  2 +-
 drivers/tty/Kconfig                           | 26 ++---
 drivers/tty/hvc/Kconfig                       |  4 +-
 drivers/tty/serial/8250/Kconfig               |  2 +-
 drivers/tty/serial/Kconfig                    | 96 +++++++++----------
 drivers/video/backlight/Kconfig               |  8 +-
 drivers/video/console/Kconfig                 | 76 +++++++--------
 drivers/virt/Kconfig                          | 10 +-
 drivers/virtio/Kconfig                        | 10 +-
 drivers/w1/slaves/Kconfig                     |  4 +-
 drivers/xen/Kconfig                           | 22 ++---
 92 files changed, 631 insertions(+), 631 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ebe1e9e5fd81..1fbe7e3d57b3 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -104,9 +104,9 @@ config ACPI_PROCFS_POWER
 	depends on X86 && PROC_FS
 	help
 	  For backwards compatibility, this option allows
-          deprecated power /proc/acpi/ directories to exist, even when
-          they have been replaced by functions in /sys.
-          The deprecated directories (and their replacements) include:
+	  deprecated power /proc/acpi/ directories to exist, even when
+	  they have been replaced by functions in /sys.
+	  The deprecated directories (and their replacements) include:
 	  /proc/acpi/battery/* (/sys/class/power_supply/*) and
 	  /proc/acpi/ac_adapter/* (sys/class/power_supply/*).
 	  This option has no effect on /proc/acpi/ directories
@@ -454,7 +454,7 @@ config ACPI_CUSTOM_METHOD
 config ACPI_BGRT
 	bool "Boottime Graphics Resource Table support"
 	depends on EFI && (X86 || ARM64)
-        help
+	help
 	  This driver adds support for exposing the ACPI Boottime Graphics
 	  Resource Table, which allows the operating system to obtain
 	  data from the firmware boot splash. It will appear under
diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index a6beb2c5a692..86e35c9a9ac6 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -695,7 +695,7 @@ config PATA_IMX
 	depends on ARCH_MXC
 	help
 	  This option enables support for the PATA host available on Freescale
-          iMX SoCs.
+	  iMX SoCs.
 
 	  If unsure, say N.
 
@@ -704,7 +704,7 @@ config PATA_IT8213
 	depends on PCI
 	help
 	  This option enables support for the ITE 821 PATA
-          controllers via the new ATA layer.
+	  controllers via the new ATA layer.
 
 	  If unsure, say N.
 
@@ -732,9 +732,9 @@ config PATA_MACIO
 	depends on PPC_PMAC
 	help
 	  Most IDE capable PowerMacs have IDE busses driven by a variant
-          of this controller which is part of the Apple chipset used on
-          most PowerMac models. Some models have multiple busses using
-          different chipsets, though generally, MacIO is one of them.
+	  of this controller which is part of the Apple chipset used on
+	  most PowerMac models. Some models have multiple busses using
+	  different chipsets, though generally, MacIO is one of them.
 
 config PATA_MARVELL
 	tristate "Marvell PATA support via legacy mode"
@@ -915,7 +915,7 @@ config PATA_PXA
 	  This option enables support for harddrive attached to PXA CPU's bus.
 
 	  NOTE: This driver utilizes PXA DMA controller, in case your hardware
-	        is not capable of doing MWDMA, use pata_platform instead.
+	  is not capable of doing MWDMA, use pata_platform instead.
 
 	  If unsure, say N.
 
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index b8313a04422d..a92be39825f6 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -329,7 +329,7 @@ config PANEL_LCD_PROTO
 
 config PANEL_LCD_PIN_E
 	depends on PANEL_PROFILE="0" && PANEL_LCD="1" && PANEL_LCD_PROTO="0"
-        int "Parallel port pin number & polarity connected to the LCD E signal (-17...17) "
+	int "Parallel port pin number & polarity connected to the LCD E signal (-17...17) "
 	range -17 17
 	default 14
 	---help---
@@ -344,7 +344,7 @@ config PANEL_LCD_PIN_E
 
 config PANEL_LCD_PIN_RS
 	depends on PANEL_PROFILE="0" && PANEL_LCD="1" && PANEL_LCD_PROTO="0"
-        int "Parallel port pin number & polarity connected to the LCD RS signal (-17...17) "
+	int "Parallel port pin number & polarity connected to the LCD RS signal (-17...17) "
 	range -17 17
 	default 17
 	---help---
@@ -359,7 +359,7 @@ config PANEL_LCD_PIN_RS
 
 config PANEL_LCD_PIN_RW
 	depends on PANEL_PROFILE="0" && PANEL_LCD="1" && PANEL_LCD_PROTO="0"
-        int "Parallel port pin number & polarity connected to the LCD RW signal (-17...17) "
+	int "Parallel port pin number & polarity connected to the LCD RW signal (-17...17) "
 	range -17 17
 	default 16
 	---help---
@@ -374,7 +374,7 @@ config PANEL_LCD_PIN_RW
 
 config PANEL_LCD_PIN_SCL
 	depends on PANEL_PROFILE="0" && PANEL_LCD="1" && PANEL_LCD_PROTO!="0"
-        int "Parallel port pin number & polarity connected to the LCD SCL signal (-17...17) "
+	int "Parallel port pin number & polarity connected to the LCD SCL signal (-17...17) "
 	range -17 17
 	default 1
 	---help---
@@ -389,7 +389,7 @@ config PANEL_LCD_PIN_SCL
 
 config PANEL_LCD_PIN_SDA
 	depends on PANEL_PROFILE="0" && PANEL_LCD="1" && PANEL_LCD_PROTO!="0"
-        int "Parallel port pin number & polarity connected to the LCD SDA signal (-17...17) "
+	int "Parallel port pin number & polarity connected to the LCD SDA signal (-17...17) "
 	range -17 17
 	default 2
 	---help---
@@ -404,12 +404,12 @@ config PANEL_LCD_PIN_SDA
 
 config PANEL_LCD_PIN_BL
 	depends on PANEL_PROFILE="0" && PANEL_LCD="1"
-        int "Parallel port pin number & polarity connected to the LCD backlight signal (-17...17) "
+	int "Parallel port pin number & polarity connected to the LCD backlight signal (-17...17) "
 	range -17 17
 	default 0
 	---help---
 	  This describes the number of the parallel port pin to which the LCD 'BL' signal
-          has been connected. It can be :
+	  has been connected. It can be :
 
 	          0 : no connection (eg: connected to ground)
 	      1..17 : directly connected to any of these pins on the DB25 plug
diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
index 3f9e274e2ed3..e4cd11135785 100644
--- a/drivers/base/firmware_loader/Kconfig
+++ b/drivers/base/firmware_loader/Kconfig
@@ -148,7 +148,7 @@ config FW_LOADER_USER_HELPER_FALLBACK
 	  to be used for all firmware requests which explicitly do not disable a
 	  a fallback mechanism. Firmware calls which do prohibit a fallback
 	  mechanism is request_firmware_direct(). This option is kept for
-          backward compatibility purposes given this precise mechanism can also
+	  backward compatibility purposes given this precise mechanism can also
 	  be enabled by setting the proc sysctl value to true:
 
 	       /proc/sys/kernel/firmware_config/force_sysfs_fallback
diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 1bb8ec575352..fa0cd072f5a1 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -142,10 +142,10 @@ config BLK_DEV_UBD
 	bool "Virtual block device"
 	depends on UML
 	---help---
-          The User-Mode Linux port includes a driver called UBD which will let
-          you access arbitrary files on the host computer as block devices.
-          Unless you know that you do not need such virtual block devices say
-          Y here.
+	  The User-Mode Linux port includes a driver called UBD which will let
+	  you access arbitrary files on the host computer as block devices.
+	  Unless you know that you do not need such virtual block devices say
+	  Y here.
 
 config BLK_DEV_UBD_SYNC
 	bool "Always do synchronous disk IO for UBD"
@@ -156,16 +156,16 @@ config BLK_DEV_UBD_SYNC
 	  Linux 'Virtual Machine' uses a journalling filesystem and the host
 	  computer crashes.
 
-          Synchronous operation (i.e. always writing data to the host's disk
-          immediately) is configurable on a per-UBD basis by using a special
-          kernel command line option.  Alternatively, you can say Y here to
-          turn on synchronous operation by default for all block devices.
+	  Synchronous operation (i.e. always writing data to the host's disk
+	  immediately) is configurable on a per-UBD basis by using a special
+	  kernel command line option.  Alternatively, you can say Y here to
+	  turn on synchronous operation by default for all block devices.
 
-          If you're running a journalling file system (like reiserfs, for
-          example) in your virtual machine, you will want to say Y here.  If
-          you care for the safety of the data in your virtual machine, Y is a
-          wise choice too.  In all other cases (for example, if you're just
-          playing around with User-Mode Linux) you can choose N.
+	  If you're running a journalling file system (like reiserfs, for
+	  example) in your virtual machine, you will want to say Y here.  If
+	  you care for the safety of the data in your virtual machine, Y is a
+	  wise choice too.  In all other cases (for example, if you're just
+	  playing around with User-Mode Linux) you can choose N.
 
 config BLK_DEV_COW_COMMON
 	bool
@@ -430,7 +430,7 @@ config VIRTIO_BLK
 	depends on VIRTIO
 	---help---
 	  This is the virtual block driver for virtio.  It can be used with
-          QEMU based VMMs (like KVM or Xen).  Say Y or M.
+	  QEMU based VMMs (like KVM or Xen).  Say Y or M.
 
 config VIRTIO_BLK_SCSI
 	bool "SCSI passthrough request for the Virtio block driver"
diff --git a/drivers/block/mtip32xx/Kconfig b/drivers/block/mtip32xx/Kconfig
index bf221358567e..a469dc72e67a 100644
--- a/drivers/block/mtip32xx/Kconfig
+++ b/drivers/block/mtip32xx/Kconfig
@@ -7,4 +7,4 @@ config BLK_DEV_PCIESSD_MTIP32XX
 	tristate "Block Device Driver for Micron PCIe SSDs"
 	depends on PCI
 	help
-          This enables the block driver for Micron PCIe SSDs.
+	  This enables the block driver for Micron PCIe SSDs.
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index df0fc997dc3e..26956c006987 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -439,8 +439,8 @@ config RAW_DRIVER
 	  Once bound, I/O against /dev/raw/rawN uses efficient zero-copy I/O.
 	  See the raw(8) manpage for more details.
 
-          Applications should preferably open the device (eg /dev/hda1)
-          with the O_DIRECT flag.
+	  Applications should preferably open the device (eg /dev/hda1)
+	  with the O_DIRECT flag.
 
 config MAX_RAW_DEVS
 	int "Maximum number of RAW devices to support (1-65536)"
@@ -559,4 +559,4 @@ config RANDOM_TRUST_BOOTLOADER
 	device randomness. Say Y here to assume the entropy provided by the
 	booloader is trustworthy so it will be added to the kernel's entropy
 	pool. Otherwise, say N here so it will be regarded as device input that
-	only mixes the entropy pool.
\ No newline at end of file
+	only mixes the entropy pool.
diff --git a/drivers/char/agp/Kconfig b/drivers/char/agp/Kconfig
index 812d6aa6e013..bc54235a7022 100644
--- a/drivers/char/agp/Kconfig
+++ b/drivers/char/agp/Kconfig
@@ -63,7 +63,7 @@ config AGP_AMD64
 	  This option gives you AGP support for the GLX component of
 	  X using the on-CPU northbridge of the AMD Athlon64/Opteron CPUs.
 	  You still need an external AGP bridge like the AMD 8151, VIA
-          K8T400M, SiS755. It may also support other AGP bridges when loaded
+	  K8T400M, SiS755. It may also support other AGP bridges when loaded
 	  with agp_try_unsupported=1.
 
 config AGP_INTEL
diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 59f25286befe..5011eb673ab4 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -377,13 +377,13 @@ config HW_RANDOM_CAVIUM
        depends on HW_RANDOM && PCI && (ARM64 || (COMPILE_TEST && 64BIT))
        default HW_RANDOM
        ---help---
-         This driver provides kernel-side support for the Random Number
-         Generator hardware found on Cavium SoCs.
+	 This driver provides kernel-side support for the Random Number
+	 Generator hardware found on Cavium SoCs.
 
-         To compile this driver as a module, choose M here: the
-         module will be called cavium_rng.
+	 To compile this driver as a module, choose M here: the
+	 module will be called cavium_rng.
 
-         If unsure, say Y.
+	 If unsure, say Y.
 
 config HW_RANDOM_MTK
 	tristate "Mediatek Random Number Generator support"
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 4bad0614109b..cc4bea773ded 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -8,13 +8,13 @@ menuconfig IPMI_HANDLER
        depends on HAS_IOMEM
        select IPMI_DMI_DECODE if DMI
        help
-         This enables the central IPMI message handler, required for IPMI
+	 This enables the central IPMI message handler, required for IPMI
 	 to work.
 
-         IPMI is a standard for managing sensors (temperature,
-         voltage, etc.) in a system.
+	 IPMI is a standard for managing sensors (temperature,
+	 voltage, etc.) in a system.
 
-         See <file:Documentation/IPMI.txt> for more details on the driver.
+	 See <file:Documentation/IPMI.txt> for more details on the driver.
 
 	 If unsure, say N.
 
@@ -56,14 +56,14 @@ config IPMI_PANIC_STRING
 config IPMI_DEVICE_INTERFACE
        tristate 'Device interface for IPMI'
        help
-         This provides an IOCTL interface to the IPMI message handler so
+	 This provides an IOCTL interface to the IPMI message handler so
 	 userland processes may use IPMI.  It supports poll() and select().
 
 config IPMI_SI
        tristate 'IPMI System Interface handler'
        select IPMI_PLAT_DATA
        help
-         Provides a driver for System Interfaces (KCS, SMIC, BT).
+	 Provides a driver for System Interfaces (KCS, SMIC, BT).
 	 Currently, only KCS and SMIC are supported.  If
 	 you are using IPMI, you should probably say "y" here.
 
@@ -71,7 +71,7 @@ config IPMI_SSIF
        tristate 'IPMI SMBus handler (SSIF)'
        select I2C
        help
-         Provides a driver for a SMBus interface to a BMC, meaning that you
+	 Provides a driver for a SMBus interface to a BMC, meaning that you
 	 have a driver that must be accessed over an I2C bus instead of a
 	 standard interface.  This module requires I2C support.
 
@@ -79,17 +79,17 @@ config IPMI_POWERNV
        depends on PPC_POWERNV
        tristate 'POWERNV (OPAL firmware) IPMI interface'
        help
-         Provides a driver for OPAL firmware-based IPMI interfaces.
+	 Provides a driver for OPAL firmware-based IPMI interfaces.
 
 config IPMI_WATCHDOG
        tristate 'IPMI Watchdog Timer'
        help
-         This enables the IPMI watchdog timer.
+	 This enables the IPMI watchdog timer.
 
 config IPMI_POWEROFF
        tristate 'IPMI Poweroff'
        help
-         This enables a function to power off the system with IPMI if
+	 This enables a function to power off the system with IPMI if
 	 the IPMI management controller is capable of this.
 
 endif # IPMI_HANDLER
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c44247d0b83e..0bea0363142e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -27,7 +27,7 @@ config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
 	---help---
-          Supports the clocking subsystem of the WM831x/2x series of
+	  Supports the clocking subsystem of the WM831x/2x series of
 	  PMICs from Wolfson Microelectronics.
 
 source "drivers/clk/versatile/Kconfig"
diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7efc3617bbd5..5ddd813521e7 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -179,31 +179,31 @@ config COMMON_CLK_MT6797
        select COMMON_CLK_MEDIATEK
        default ARCH_MEDIATEK && ARM64
        ---help---
-         This driver supports MediaTek MT6797 basic clocks.
+	 This driver supports MediaTek MT6797 basic clocks.
 
 config COMMON_CLK_MT6797_MMSYS
        bool "Clock driver for MediaTek MT6797 mmsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 mmsys clocks.
+	 This driver supports MediaTek MT6797 mmsys clocks.
 
 config COMMON_CLK_MT6797_IMGSYS
        bool "Clock driver for MediaTek MT6797 imgsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 imgsys clocks.
+	 This driver supports MediaTek MT6797 imgsys clocks.
 
 config COMMON_CLK_MT6797_VDECSYS
        bool "Clock driver for MediaTek MT6797 vdecsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 vdecsys clocks.
+	 This driver supports MediaTek MT6797 vdecsys clocks.
 
 config COMMON_CLK_MT6797_VENCSYS
        bool "Clock driver for MediaTek MT6797 vencsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 vencsys clocks.
+	 This driver supports MediaTek MT6797 vencsys clocks.
 
 config COMMON_CLK_MT7622
 	bool "Clock driver for MediaTek MT7622"
diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index ac766855ba16..c2618f1477a2 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -9,7 +9,7 @@ config COMMON_CLK_VERSATILE
 		COMPILE_TEST
 	select REGMAP_MMIO
 	---help---
-          Supports clocking on ARM Reference designs:
+	  Supports clocking on ARM Reference designs:
 	  - Integrator/AP and Integrator/CP
 	  - RealView PB1176, EB, PB11MP and PBX
 	  - Versatile Express
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index f35a53ce8988..f2342cb58e08 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -470,7 +470,7 @@ config OXNAS_RPS_TIMER
 	  This enables support for the Oxford Semiconductor OXNAS RPS timers.
 
 config SYS_SUPPORTS_SH_CMT
-        bool
+	bool
 
 config MTK_TIMER
 	bool "Mediatek timer driver" if COMPILE_TEST
@@ -490,13 +490,13 @@ config SPRD_TIMER
 	  Enables support for the Spreadtrum timer driver.
 
 config SYS_SUPPORTS_SH_MTU2
-        bool
+	bool
 
 config SYS_SUPPORTS_SH_TMU
-        bool
+	bool
 
 config SYS_SUPPORTS_EM_STI
-        bool
+	bool
 
 config CLKSRC_JCORE_PIT
 	bool "J-Core PIT timer driver" if COMPILE_TEST
@@ -590,21 +590,21 @@ config CLKSRC_PXA
 	  platforms.
 
 config H8300_TMR8
-        bool "Clockevent timer for the H8300 platform" if COMPILE_TEST
-        depends on HAS_IOMEM
+	bool "Clockevent timer for the H8300 platform" if COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This enables the 8 bits timer for the H8300 platform.
 
 config H8300_TMR16
-        bool "Clockevent timer for the H83069 platform" if COMPILE_TEST
-        depends on HAS_IOMEM
+	bool "Clockevent timer for the H83069 platform" if COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This enables the 16 bits timer for the H8300 platform with the
 	  H83069 cpu.
 
 config H8300_TPU
-        bool "Clocksource for the H8300 platform" if COMPILE_TEST
-        depends on HAS_IOMEM
+	bool "Clocksource for the H8300 platform" if COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This enables the clocksource for the H8300 platform with the
 	  H8S2678 cpu.
diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index dfa6457deaf6..6eec6ccb14cb 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -9,12 +9,12 @@ config X86_INTEL_PSTATE
        select ACPI_PROCESSOR if ACPI
        select ACPI_CPPC_LIB if X86_64 && ACPI && SCHED_MC_PRIO
        help
-          This driver provides a P state for Intel core processors.
+	  This driver provides a P state for Intel core processors.
 	  The driver implements an internal governor and will become
-          the scaling driver and governor for Sandy bridge processors.
+	  the scaling driver and governor for Sandy bridge processors.
 
 	  When this driver is enabled it will become the preferred
-          scaling driver for Sandy bridge processors.
+	  scaling driver for Sandy bridge processors.
 
 	  If in doubt, say N.
 
diff --git a/drivers/cpuidle/Kconfig b/drivers/cpuidle/Kconfig
index 88727b7c0d59..1b8614d1c696 100644
--- a/drivers/cpuidle/Kconfig
+++ b/drivers/cpuidle/Kconfig
@@ -16,7 +16,7 @@ config CPU_IDLE
 if CPU_IDLE
 
 config CPU_IDLE_MULTIPLE_DRIVERS
-        bool
+	bool
 
 config CPU_IDLE_GOV_LADDER
 	bool "Ladder governor (for periodic timer tick)"
@@ -67,9 +67,9 @@ config HALTPOLL_CPUIDLE
        depends on X86 && KVM_GUEST
        default y
        help
-         This option enables halt poll cpuidle driver, which allows to poll
-         before halting in the guest (more efficient than polling in the
-         host via halt_poll_ns for some scenarios).
+	 This option enables halt poll cpuidle driver, which allows to poll
+	 before halting in the guest (more efficient than polling in the
+	 host via halt_poll_ns for some scenarios).
 
 endif
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index d8530475493c..e91ab792d14d 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -3,15 +3,15 @@
 # ARM CPU Idle drivers
 #
 config ARM_CPUIDLE
-        bool "Generic ARM/ARM64 CPU idle Driver"
-        select DT_IDLE_STATES
+	bool "Generic ARM/ARM64 CPU idle Driver"
+	select DT_IDLE_STATES
 	select CPU_IDLE_MULTIPLE_DRIVERS
-        help
-          Select this to enable generic cpuidle driver for ARM.
-          It provides a generic idle driver whose idle states are configured
-          at run-time through DT nodes. The CPUidle suspend backend is
-          initialized by calling the CPU operations init idle hook
-          provided by architecture code.
+	help
+	  Select this to enable generic cpuidle driver for ARM.
+	  It provides a generic idle driver whose idle states are configured
+	  at run-time through DT nodes. The CPUidle suspend backend is
+	  initialized by calling the CPU operations init idle hook
+	  provided by architecture code.
 
 config ARM_PSCI_CPUIDLE
 	bool "PSCI CPU idle Driver"
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 1fb622f2a87d..390f0d652cb1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -353,7 +353,7 @@ config CRYPTO_DEV_OMAP
 	depends on ARCH_OMAP2PLUS
 	help
 	  OMAP processors have various crypto HW accelerators. Select this if
-          you want to use the OMAP modules for any of the crypto algorithms.
+	  you want to use the OMAP modules for any of the crypto algorithms.
 
 if CRYPTO_DEV_OMAP
 
@@ -635,7 +635,7 @@ config CRYPTO_DEV_QCOM_RNG
 	  Generator hardware found on Qualcomm SoCs.
 
 	  To compile this driver as a module, choose M here. The
-          module will be called qcom-rng. If unsure, say N.
+	  module will be called qcom-rng. If unsure, say N.
 
 config CRYPTO_DEV_VMX
 	bool "Support for VMX cryptographic acceleration instructions"
diff --git a/drivers/crypto/caam/Kconfig b/drivers/crypto/caam/Kconfig
index 137ed3df0c74..2a0fa8dcae3c 100644
--- a/drivers/crypto/caam/Kconfig
+++ b/drivers/crypto/caam/Kconfig
@@ -130,13 +130,13 @@ config CRYPTO_DEV_FSL_CAAM_AHASH_API
 	  scatterlist crypto API to the SEC4 via job ring.
 
 config CRYPTO_DEV_FSL_CAAM_PKC_API
-        bool "Register public key cryptography implementations with Crypto API"
-        default y
-        select CRYPTO_RSA
-        help
-          Selecting this will allow SEC Public key support for RSA.
-          Supported cryptographic primitives: encryption, decryption,
-          signature and verification.
+	bool "Register public key cryptography implementations with Crypto API"
+	default y
+	select CRYPTO_RSA
+	help
+	  Selecting this will allow SEC Public key support for RSA.
+	  Supported cryptographic primitives: encryption, decryption,
+	  signature and verification.
 
 config CRYPTO_DEV_FSL_CAAM_RNG_API
 	bool "Register caam device for hwrng API"
diff --git a/drivers/crypto/chelsio/Kconfig b/drivers/crypto/chelsio/Kconfig
index 250150560e68..2786b497437c 100644
--- a/drivers/crypto/chelsio/Kconfig
+++ b/drivers/crypto/chelsio/Kconfig
@@ -23,22 +23,22 @@ config CRYPTO_DEV_CHELSIO
 	  will be called chcr.
 
 config CHELSIO_IPSEC_INLINE
-        bool "Chelsio IPSec XFRM Tx crypto offload"
-        depends on CHELSIO_T4
+	bool "Chelsio IPSec XFRM Tx crypto offload"
+	depends on CHELSIO_T4
 	depends on CRYPTO_DEV_CHELSIO
-        depends on XFRM_OFFLOAD
-        depends on INET_ESP_OFFLOAD || INET6_ESP_OFFLOAD
-        default n
-        ---help---
-          Enable support for IPSec Tx Inline.
+	depends on XFRM_OFFLOAD
+	depends on INET_ESP_OFFLOAD || INET6_ESP_OFFLOAD
+	default n
+	---help---
+	  Enable support for IPSec Tx Inline.
 
 config CRYPTO_DEV_CHELSIO_TLS
-        tristate "Chelsio Crypto Inline TLS Driver"
-        depends on CHELSIO_T4
-        depends on TLS
-        select CRYPTO_DEV_CHELSIO
-        ---help---
-          Support Chelsio Inline TLS with Chelsio crypto accelerator.
+	tristate "Chelsio Crypto Inline TLS Driver"
+	depends on CHELSIO_T4
+	depends on TLS
+	select CRYPTO_DEV_CHELSIO
+	---help---
+	  Support Chelsio Inline TLS with Chelsio crypto accelerator.
 
-          To compile this driver as a module, choose M here: the module
-          will be called chtls.
+	  To compile this driver as a module, choose M here: the module
+	  will be called chtls.
diff --git a/drivers/crypto/stm32/Kconfig b/drivers/crypto/stm32/Kconfig
index 1aba9372cd23..4ef3eb11361c 100644
--- a/drivers/crypto/stm32/Kconfig
+++ b/drivers/crypto/stm32/Kconfig
@@ -4,7 +4,7 @@ config CRYPTO_DEV_STM32_CRC
 	depends on ARCH_STM32
 	select CRYPTO_HASH
 	help
-          This enables support for the CRC32 hw accelerator which can be found
+	  This enables support for the CRC32 hw accelerator which can be found
 	  on STMicroelectronics STM32 SOC.
 
 config CRYPTO_DEV_STM32_HASH
@@ -17,7 +17,7 @@ config CRYPTO_DEV_STM32_HASH
 	select CRYPTO_SHA256
 	select CRYPTO_ENGINE
 	help
-          This enables support for the HASH hw accelerator which can be found
+	  This enables support for the HASH hw accelerator which can be found
 	  on STMicroelectronics STM32 SOC.
 
 config CRYPTO_DEV_STM32_CRYP
@@ -27,5 +27,5 @@ config CRYPTO_DEV_STM32_CRYP
 	select CRYPTO_ENGINE
 	select CRYPTO_LIB_DES
 	help
-          This enables support for the CRYP (AES/DES/TDES) hw accelerator which
+	  This enables support for the CRYP (AES/DES/TDES) hw accelerator which
 	  can be found on STMicroelectronics STM32 SOC.
diff --git a/drivers/crypto/ux500/Kconfig b/drivers/crypto/ux500/Kconfig
index b1c6f739f77b..5a48497989ad 100644
--- a/drivers/crypto/ux500/Kconfig
+++ b/drivers/crypto/ux500/Kconfig
@@ -11,18 +11,18 @@ config CRYPTO_DEV_UX500_CRYP
 	select CRYPTO_BLKCIPHER
 	select CRYPTO_LIB_DES
 	help
-        This selects the crypto driver for the UX500_CRYP hardware. It supports
-        AES-ECB, CBC and CTR with keys sizes of 128, 192 and 256 bit sizes.
+	This selects the crypto driver for the UX500_CRYP hardware. It supports
+	AES-ECB, CBC and CTR with keys sizes of 128, 192 and 256 bit sizes.
 
 config CRYPTO_DEV_UX500_HASH
-        tristate "UX500 crypto driver for HASH block"
-        depends on CRYPTO_DEV_UX500
-        select CRYPTO_HASH
+	tristate "UX500 crypto driver for HASH block"
+	depends on CRYPTO_DEV_UX500
+	select CRYPTO_HASH
 	select CRYPTO_SHA1
 	select CRYPTO_SHA256
-        help
-          This selects the hash driver for the UX500_HASH hardware.
-          Depends on UX500/STM DMA if running in DMA mode.
+	help
+	  This selects the hash driver for the UX500_HASH hardware.
+	  Depends on UX500/STM DMA if running in DMA mode.
 
 config CRYPTO_DEV_UX500_DEBUG
 	bool "Activate ux500 platform debug-mode for crypto and hash block"
diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index defe1d438710..0ccfd68f5cc2 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -123,9 +123,9 @@ config ARM_RK3399_DMC_DEVFREQ
 	select PM_DEVFREQ_EVENT
 	select PM_OPP
 	help
-          This adds the DEVFREQ driver for the RK3399 DMC(Dynamic Memory Controller).
-          It sets the frequency for the memory controller and reads the usage counts
-          from hardware.
+	  This adds the DEVFREQ driver for the RK3399 DMC(Dynamic Memory Controller).
+	  It sets the frequency for the memory controller and reads the usage counts
+	  from hardware.
 
 source "drivers/devfreq/event/Kconfig"
 
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 7af874b69ffb..e068677947d2 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -15,19 +15,19 @@ menuconfig DMADEVICES
 	  be empty in some cases.
 
 config DMADEVICES_DEBUG
-        bool "DMA Engine debugging"
-        depends on DMADEVICES != n
-        help
-          This is an option for use by developers; most people should
-          say N here.  This enables DMA engine core and driver debugging.
+	bool "DMA Engine debugging"
+	depends on DMADEVICES != n
+	help
+	  This is an option for use by developers; most people should
+	  say N here.  This enables DMA engine core and driver debugging.
 
 config DMADEVICES_VDEBUG
-        bool "DMA Engine verbose debugging"
-        depends on DMADEVICES_DEBUG != n
-        help
-          This is an option for use by developers; most people should
-          say N here.  This enables deeper (more verbose) debugging of
-          the DMA engine core and drivers.
+	bool "DMA Engine verbose debugging"
+	depends on DMADEVICES_DEBUG != n
+	help
+	  This is an option for use by developers; most people should
+	  say N here.  This enables deeper (more verbose) debugging of
+	  the DMA engine core and drivers.
 
 
 if DMADEVICES
@@ -222,21 +222,21 @@ config FSL_QDMA
        select DMA_ENGINE_RAID
        select ASYNC_TX_ENABLE_CHANNEL_SWITCH
        help
-         Support the NXP Layerscape qDMA engine with command queue and legacy mode.
-         Channel virtualization is supported through enqueuing of DMA jobs to,
-         or dequeuing DMA jobs from, different work queues.
-         This module can be found on NXP Layerscape SoCs.
+	 Support the NXP Layerscape qDMA engine with command queue and legacy mode.
+	 Channel virtualization is supported through enqueuing of DMA jobs to,
+	 or dequeuing DMA jobs from, different work queues.
+	 This module can be found on NXP Layerscape SoCs.
 	  The qdma driver only work on  SoCs with a DPAA hardware block.
 
 config FSL_RAID
-        tristate "Freescale RAID engine Support"
-        depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
-        select DMA_ENGINE
-        select DMA_ENGINE_RAID
-        ---help---
-          Enable support for Freescale RAID Engine. RAID Engine is
-          available on some QorIQ SoCs (like P5020/P5040). It has
-          the capability to offload memcpy, xor and pq computation
+	tristate "Freescale RAID engine Support"
+	depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
+	select DMA_ENGINE
+	select DMA_ENGINE_RAID
+	---help---
+	  Enable support for Freescale RAID Engine. RAID Engine is
+	  available on some QorIQ SoCs (like P5020/P5040). It has
+	  the capability to offload memcpy, xor and pq computation
 	  for raid5/6.
 
 config IMG_MDC_DMA
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 417dad635526..c49f6bc39716 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -492,7 +492,7 @@ config EDAC_TI
 	depends on ARCH_KEYSTONE || SOC_DRA7XX
 	help
 	  Support for error detection and correction on the
-          TI SoCs.
+	  TI SoCs.
 
 config EDAC_QCOM
 	tristate "QCOM EDAC Controller"
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index e40a77bfe821..312c27876b60 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -86,8 +86,8 @@ config EDD
 	  BIOS tries boot from.  This information is then exported via sysfs.
 
 	  This option is experimental and is known to fail to boot on some
-          obscure configurations. Most disk controller BIOS vendors do
-          not yet implement this feature.
+	  obscure configurations. Most disk controller BIOS vendors do
+	  not yet implement this feature.
 
 config EDD_OFF
 	bool "Sets default behavior for EDD detection to off"
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 178ee8106828..b6a4afcec75a 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -80,7 +80,7 @@ config EFI_PARAMS_FROM_FDT
 	help
 	  Select this config option from the architecture Kconfig if
 	  the EFI runtime support gets system table address, memory
-          map address, and other parameters from the device tree.
+	  map address, and other parameters from the device tree.
 
 config EFI_RUNTIME_WRAPPERS
 	bool
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 1ecb5124421c..04c2c4a9ffd9 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -107,7 +107,7 @@ config HID_ACCUTOUCH
 
 	  The driver works around a problem in the reported device capabilities
 	  which causes userspace to detect the device as a mouse rather than
-          a touchscreen.
+	  a touchscreen.
 
 	  Say Y here if you have a Accutouch 2216 touch controller.
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 13a6b4afb4b3..af92974abbae 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -495,10 +495,10 @@ config SENSORS_F75375S
 	  will be called f75375s.
 
 config SENSORS_MC13783_ADC
-        tristate "Freescale MC13783/MC13892 ADC"
-        depends on MFD_MC13XXX
-        help
-          Support for the A/D converter on MC13783 and MC13892 PMIC.
+	tristate "Freescale MC13783/MC13892 ADC"
+	depends on MFD_MC13XXX
+	help
+	  Support for the A/D converter on MC13783 and MC13892 PMIC.
 
 config SENSORS_FSCHMD
 	tristate "Fujitsu Siemens Computers sensor chips"
@@ -1287,10 +1287,10 @@ config SENSORS_NPCM7XX
 	imply THERMAL
 	help
 	  This driver provides support for Nuvoton NPCM750/730/715/705 PWM
-          and Fan controllers.
+	  and Fan controllers.
 
-          This driver can also be built as a module. If so, the module
-          will be called npcm750-pwm-fan.
+	  This driver can also be built as a module. If so, the module
+	  will be called npcm750-pwm-fan.
 
 config SENSORS_NSA320
 	tristate "ZyXEL NSA320 and compatible fan speed and temperature sensors"
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 146ce40d8e0a..9b2a478fc90a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -292,7 +292,7 @@ config I2C_VIA
 	select I2C_ALGOBIT
 	help
 	  If you say yes to this option, support will be included for the VIA
-          82C586B I2C interface
+	  82C586B I2C interface
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-via.
@@ -677,11 +677,11 @@ config I2C_IMX_LPI2C
 	tristate "IMX Low Power I2C interface"
 	depends on ARCH_MXC || COMPILE_TEST
 	help
-          Say Y here if you want to use the Low Power IIC bus controller
-          on the Freescale i.MX processors.
+	  Say Y here if you want to use the Low Power IIC bus controller
+	  on the Freescale i.MX processors.
 
-          This driver can also be built as a module. If so, the module
-          will be called i2c-imx-lpi2c.
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-imx-lpi2c.
 
 config I2C_IOP3XX
 	tristate "Intel IOPx3xx and IXP4xx on-chip I2C interface"
@@ -1283,9 +1283,9 @@ config I2C_VIPERBOARD
 	help
 	  Say yes here to access the I2C part of the Nano River
 	  Technologies Viperboard as I2C master.
-          See viperboard API specification and Nano
-          River Tech's viperboard.h for detailed meaning
-          of the module parameters.
+	  See viperboard API specification and Nano
+	  River Tech's viperboard.h for detailed meaning
+	  of the module parameters.
 
 comment "Other I2C/SMBus bus drivers"
 
diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index c6040aa839ac..1708b1a82da2 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -109,14 +109,14 @@ config I2C_DEMUX_PINCTRL
 	  want to change the I2C master at run-time depending on features.
 
 config I2C_MUX_MLXCPLD
-        tristate "Mellanox CPLD based I2C multiplexer"
-        help
-          If you say yes to this option, support will be included for a
-          CPLD based I2C multiplexer. This driver provides access to
-          I2C busses connected through a MUX, which is controlled
-          by a CPLD register.
-
-          This driver can also be built as a module.  If so, the module
-          will be called i2c-mux-mlxcpld.
+	tristate "Mellanox CPLD based I2C multiplexer"
+	help
+	  If you say yes to this option, support will be included for a
+	  CPLD based I2C multiplexer. This driver provides access to
+	  I2C busses connected through a MUX, which is controlled
+	  by a CPLD register.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mlxcpld.
 
 endmenu
diff --git a/drivers/iio/gyro/Kconfig b/drivers/iio/gyro/Kconfig
index 95e6f96d4529..f91af3b8e4da 100644
--- a/drivers/iio/gyro/Kconfig
+++ b/drivers/iio/gyro/Kconfig
@@ -82,11 +82,11 @@ config FXAS21002C
        select FXAS21002C_SPI if (SPI)
        depends on (I2C || SPI_MASTER)
        help
-         Say yes here to build support for NXP FXAS21002C Tri-axis Gyro
-         Sensor driver connected via I2C or SPI.
+	 Say yes here to build support for NXP FXAS21002C Tri-axis Gyro
+	 Sensor driver connected via I2C or SPI.
 
-         This driver can also be built as a module.  If so, the module
-         will be called fxas21002c_i2c or fxas21002c_spi.
+	 This driver can also be built as a module.  If so, the module
+	 will be called fxas21002c_i2c or fxas21002c_spi.
 
 config FXAS21002C_I2C
        tristate
diff --git a/drivers/infiniband/hw/bnxt_re/Kconfig b/drivers/infiniband/hw/bnxt_re/Kconfig
index ab8779d23382..b83f1cc38c52 100644
--- a/drivers/infiniband/hw/bnxt_re/Kconfig
+++ b/drivers/infiniband/hw/bnxt_re/Kconfig
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config INFINIBAND_BNXT_RE
-        tristate "Broadcom Netxtreme HCA support"
-        depends on 64BIT
-        depends on ETHERNET && NETDEVICES && PCI && INET && DCB
-        select NET_VENDOR_BROADCOM
-        select BNXT
-        ---help---
+	tristate "Broadcom Netxtreme HCA support"
+	depends on 64BIT
+	depends on ETHERNET && NETDEVICES && PCI && INET && DCB
+	select NET_VENDOR_BROADCOM
+	select BNXT
+	---help---
 	  This driver supports Broadcom NetXtreme-E 10/25/40/50 gigabit
 	  RoCE HCAs.  To compile this driver as a module, choose M here:
 	  the module will be called bnxt_re.
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 8911bc2ec42a..f553adae8eb4 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -171,11 +171,11 @@ config KEYBOARD_QT1070
        tristate "Atmel AT42QT1070 Touch Sensor Chip"
        depends on I2C
        help
-         Say Y here if you want to use Atmel AT42QT1070 QTouch
-         Sensor chip as input device.
+	 Say Y here if you want to use Atmel AT42QT1070 QTouch
+	 Sensor chip as input device.
 
-         To compile this driver as a module, choose M here:
-         the module will be called qt1070
+	 To compile this driver as a module, choose M here:
+	 the module will be called qt1070
 
 config KEYBOARD_QT2160
 	tristate "Atmel AT42QT2160 Touch Sensor Chip"
diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 652c38e3c0b5..e1ca0dd737c9 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -96,10 +96,10 @@ config MOUSE_PS2_CYPRESS
        default y
        depends on MOUSE_PS2
        help
-         Say Y here if you have a Cypress PS/2 Trackpad connected to
-         your system.
+	 Say Y here if you have a Cypress PS/2 Trackpad connected to
+	 your system.
 
-         If unsure, say Y.
+	 If unsure, say Y.
 
 config MOUSE_PS2_LIFEBOOK
 	bool "Fujitsu Lifebook PS/2 mouse protocol extension" if EXPERT
diff --git a/drivers/input/tablet/Kconfig b/drivers/input/tablet/Kconfig
index e4c0d9a055b9..51c339182017 100644
--- a/drivers/input/tablet/Kconfig
+++ b/drivers/input/tablet/Kconfig
@@ -39,16 +39,16 @@ config TABLET_USB_AIPTEK
 	  module will be called aiptek.
 
 config TABLET_USB_GTCO
-        tristate "GTCO CalComp/InterWrite USB Support"
-        depends on USB && INPUT
-        help
-          Say Y here if you want to use the USB version of the GTCO
-          CalComp/InterWrite Tablet.  Make sure to say Y to "Mouse support"
-          (CONFIG_INPUT_MOUSEDEV) and/or "Event interface support"
-          (CONFIG_INPUT_EVDEV) as well.
-
-          To compile this driver as a module, choose M here: the
-          module will be called gtco.
+	tristate "GTCO CalComp/InterWrite USB Support"
+	depends on USB && INPUT
+	help
+	  Say Y here if you want to use the USB version of the GTCO
+	  CalComp/InterWrite Tablet.  Make sure to say Y to "Mouse support"
+	  (CONFIG_INPUT_MOUSEDEV) and/or "Event interface support"
+	  (CONFIG_INPUT_EVDEV) as well.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gtco.
 
 config TABLET_USB_HANWANG
 	tristate "Hanwang Art Master III tablet support (USB)"
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 46ad9090493b..69d210e1175c 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -633,7 +633,7 @@ config TOUCHSCREEN_HP600
 	depends on SH_HP6XX && SH_ADC
 	help
 	  Say Y here if you have a HP Jornada 620/660/680/690 and want to
-          support the built-in touchscreen.
+	  support the built-in touchscreen.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called hp680_ts_input.
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e3842eabcfdd..0388d10e6e3c 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -78,7 +78,7 @@ config IOMMU_DEBUGFS
 config IOMMU_DEFAULT_PASSTHROUGH
 	bool "IOMMU passthrough by default"
 	depends on IOMMU_API
-        help
+	help
 	  Enable passthrough by default, removing the need to pass in
 	  iommu.passthrough=on or iommu=pt through command line. If this
 	  is enabled, you can still disable with iommu.passthrough=off
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ccbb8973a324..542ddc11fe87 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -328,7 +328,7 @@ config INGENIC_TCU_IRQ
 	  If unsure, say N.
 
 config RENESAS_H8300H_INTC
-        bool
+	bool
 	select IRQ_DOMAIN
 
 config RENESAS_H8S_INTC
@@ -368,7 +368,7 @@ config MVEBU_PIC
 	bool
 
 config MVEBU_SEI
-        bool
+	bool
 
 config LS_SCFG_MSI
 	def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
@@ -410,15 +410,15 @@ config MESON_IRQ_GPIO
        depends on ARCH_MESON
        select IRQ_DOMAIN_HIERARCHY
        help
-         Support Meson SoC Family GPIO Interrupt Multiplexer
+	 Support Meson SoC Family GPIO Interrupt Multiplexer
 
 config GOLDFISH_PIC
        bool "Goldfish programmable interrupt controller"
        depends on MIPS && (GOLDFISH || COMPILE_TEST)
        select IRQ_DOMAIN
        help
-         Say yes here to enable Goldfish interrupt controller driver used
-         for Goldfish based virtual platforms.
+	 Say yes here to enable Goldfish interrupt controller driver used
+	 for Goldfish based virtual platforms.
 
 config QCOM_PDC
 	bool "QCOM PDC"
diff --git a/drivers/isdn/hardware/mISDN/Kconfig b/drivers/isdn/hardware/mISDN/Kconfig
index 304f50c08da2..078eeadf707a 100644
--- a/drivers/isdn/hardware/mISDN/Kconfig
+++ b/drivers/isdn/hardware/mISDN/Kconfig
@@ -10,7 +10,7 @@ config MISDN_HFCPCI
 	depends on PCI
 	help
 	  Enable support for cards with Cologne Chip AG's
-          HFC PCI chip.
+	  HFC PCI chip.
 
 config MISDN_HFCMULTI
 	tristate "Support for HFC multiport cards (HFC-4S/8S/E1)"
diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 574e122ae105..cbd46c1c5bf7 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -178,7 +178,7 @@ config THERM_ADT746X
 	depends on I2C && I2C_POWERMAC && PPC_PMAC && !PPC_PMAC64
 	help
 	  This driver provides some thermostat and fan control for the
-          iBook G4, and the ATI based aluminium PowerBooks, allowing slightly
+	  iBook G4, and the ATI based aluminium PowerBooks, allowing slightly
 	  better fan behaviour by default, and some manual control.
 
 config WINDFARM
@@ -214,7 +214,7 @@ config WINDFARM_PM91
 	select I2C_POWERMAC
 	help
 	  This driver provides thermal control for the PowerMac9,1
-          which is the recent (SMU based) single CPU desktop G5
+	  which is the recent (SMU based) single CPU desktop G5
 
 config WINDFARM_PM112
 	tristate "Support for thermal management on PowerMac11,2"
@@ -242,7 +242,7 @@ config PMAC_RACKMETER
 	depends on PPC_PMAC
 	help
 	  This driver provides some support to control the front panel
-          blue LEDs "vu-meter" of the XServer macs.
+	  blue LEDs "vu-meter" of the XServer macs.
 
 config SENSORS_AMS
 	tristate "Apple Motion Sensor driver"
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index aa98953f4462..d6d5ab23c088 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -38,9 +38,9 @@ config MD_AUTODETECT
 	default y
 	---help---
 	  If you say Y here, then the kernel will try to autodetect raid
-	  arrays as part of its boot process. 
+	  arrays as part of its boot process.
 
-	  If you don't use raid and say Y, this autodetection can cause 
+	  If you don't use raid and say Y, this autodetection can cause
 	  a several-second delay in the boot time due to various
 	  synchronisation steps that are part of this step.
 
@@ -290,7 +290,7 @@ config DM_SNAPSHOT
        depends on BLK_DEV_DM
        select DM_BUFIO
        ---help---
-         Allow volume managers to take writable snapshots of a device.
+	 Allow volume managers to take writable snapshots of a device.
 
 config DM_THIN_PROVISIONING
        tristate "Thin provisioning target"
@@ -298,7 +298,7 @@ config DM_THIN_PROVISIONING
        select DM_PERSISTENT_DATA
        select DM_BIO_PRISON
        ---help---
-         Provides thin provisioning and snapshots that share a data store.
+	 Provides thin provisioning and snapshots that share a data store.
 
 config DM_CACHE
        tristate "Cache target (EXPERIMENTAL)"
@@ -307,23 +307,23 @@ config DM_CACHE
        select DM_PERSISTENT_DATA
        select DM_BIO_PRISON
        ---help---
-         dm-cache attempts to improve performance of a block device by
-         moving frequently used data to a smaller, higher performance
-         device.  Different 'policy' plugins can be used to change the
-         algorithms used to select which blocks are promoted, demoted,
-         cleaned etc.  It supports writeback and writethrough modes.
+	 dm-cache attempts to improve performance of a block device by
+	 moving frequently used data to a smaller, higher performance
+	 device.  Different 'policy' plugins can be used to change the
+	 algorithms used to select which blocks are promoted, demoted,
+	 cleaned etc.  It supports writeback and writethrough modes.
 
 config DM_CACHE_SMQ
        tristate "Stochastic MQ Cache Policy (EXPERIMENTAL)"
        depends on DM_CACHE
        default y
        ---help---
-         A cache policy that uses a multiqueue ordered by recent hits
-         to select which blocks should be promoted and demoted.
-         This is meant to be a general purpose policy.  It prioritises
-         reads over writes.  This SMQ policy (vs MQ) offers the promise
-         of less memory utilization, improved performance and increased
-         adaptability in the face of changing workloads.
+	 A cache policy that uses a multiqueue ordered by recent hits
+	 to select which blocks should be promoted and demoted.
+	 This is meant to be a general purpose policy.  It prioritises
+	 reads over writes.  This SMQ policy (vs MQ) offers the promise
+	 of less memory utilization, improved performance and increased
+	 adaptability in the face of changing workloads.
 
 config DM_WRITECACHE
 	tristate "Writecache target"
@@ -343,9 +343,9 @@ config DM_ERA
        select DM_PERSISTENT_DATA
        select DM_BIO_PRISON
        ---help---
-         dm-era tracks which parts of a block device are written to
-         over time.  Useful for maintaining cache coherency when using
-         vendor snapshots.
+	 dm-era tracks which parts of a block device are written to
+	 over time.  Useful for maintaining cache coherency when using
+	 vendor snapshots.
 
 config DM_CLONE
        tristate "Clone target (EXPERIMENTAL)"
@@ -353,20 +353,20 @@ config DM_CLONE
        default n
        select DM_PERSISTENT_DATA
        ---help---
-         dm-clone produces a one-to-one copy of an existing, read-only source
-         device into a writable destination device. The cloned device is
-         visible/mountable immediately and the copy of the source device to the
-         destination device happens in the background, in parallel with user
-         I/O.
+	 dm-clone produces a one-to-one copy of an existing, read-only source
+	 device into a writable destination device. The cloned device is
+	 visible/mountable immediately and the copy of the source device to the
+	 destination device happens in the background, in parallel with user
+	 I/O.
 
-         If unsure, say N.
+	 If unsure, say N.
 
 config DM_MIRROR
        tristate "Mirror target"
        depends on BLK_DEV_DM
        ---help---
-         Allow volume managers to mirror logical volumes, also
-         needed for live data migration tools such as 'pvmove'.
+	 Allow volume managers to mirror logical volumes, also
+	 needed for live data migration tools such as 'pvmove'.
 
 config DM_LOG_USERSPACE
 	tristate "Mirror userspace logging"
@@ -483,7 +483,7 @@ config DM_FLAKEY
        tristate "Flakey target"
        depends on BLK_DEV_DM
        ---help---
-         A target that intermittently fails I/O for debugging purposes.
+	 A target that intermittently fails I/O for debugging purposes.
 
 config DM_VERITY
 	tristate "Verity target support"
diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b36a41332867..9dfea5c4b6ab 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -208,9 +208,9 @@ config MEDIA_SUBDRV_AUTOSELECT
 	  If unsure say Y.
 
 config MEDIA_HIDE_ANCILLARY_SUBDRV
-        bool
-        depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
-        default y
+	bool
+	depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
+	default y
 
 config MEDIA_ATTACH
 	bool
diff --git a/drivers/media/radio/si470x/Kconfig b/drivers/media/radio/si470x/Kconfig
index 537f8e1601f3..a1ba8bc54b62 100644
--- a/drivers/media/radio/si470x/Kconfig
+++ b/drivers/media/radio/si470x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config RADIO_SI470X
-        tristate "Silicon Labs Si470x FM Radio Receiver support"
-        depends on VIDEO_V4L2
+	tristate "Silicon Labs Si470x FM Radio Receiver support"
+	depends on VIDEO_V4L2
 	help
 	  This is a driver for devices with the Silicon Labs SI470x
 	  chip (either via USB or I2C buses).
diff --git a/drivers/memstick/core/Kconfig b/drivers/memstick/core/Kconfig
index 516f454fde14..08192fd70eb4 100644
--- a/drivers/memstick/core/Kconfig
+++ b/drivers/memstick/core/Kconfig
@@ -6,16 +6,16 @@
 comment "MemoryStick drivers"
 
 config MEMSTICK_UNSAFE_RESUME
-        bool "Allow unsafe resume (DANGEROUS)"
-        help
-          If you say Y here, the MemoryStick layer will assume that all
-          cards stayed in their respective slots during the suspend. The
-          normal behaviour is to remove them at suspend and
-          redetecting them at resume. Breaking this assumption will
-          in most cases result in data corruption.
+	bool "Allow unsafe resume (DANGEROUS)"
+	help
+	  If you say Y here, the MemoryStick layer will assume that all
+	  cards stayed in their respective slots during the suspend. The
+	  normal behaviour is to remove them at suspend and
+	  redetecting them at resume. Breaking this assumption will
+	  in most cases result in data corruption.
 
-          This option is usually just for embedded systems which use
-          a MemoryStick card for rootfs. Most people should say N here.
+	  This option is usually just for embedded systems which use
+	  a MemoryStick card for rootfs. Most people should say N here.
 
 config MSPRO_BLOCK
 	tristate "MemoryStick Pro block device driver"
diff --git a/drivers/memstick/host/Kconfig b/drivers/memstick/host/Kconfig
index 446c93ecef8f..4113343da056 100644
--- a/drivers/memstick/host/Kconfig
+++ b/drivers/memstick/host/Kconfig
@@ -18,7 +18,7 @@ config MEMSTICK_TIFM_MS
 	  'Misc devices: TI Flash Media PCI74xx/PCI76xx host adapter support
 	  (TIFM_7XX1)'.
 
-          To compile this driver as a module, choose M here: the
+	  To compile this driver as a module, choose M here: the
 	  module will be called tifm_ms.
 
 config MEMSTICK_JMICRON_38X
@@ -29,7 +29,7 @@ config MEMSTICK_JMICRON_38X
 	  Say Y here if you want to be able to access MemoryStick cards with
 	  the JMicron(R) JMB38X MemoryStick card reader.
 
-          To compile this driver as a module, choose M here: the
+	  To compile this driver as a module, choose M here: the
 	  module will be called jmb38x_ms.
 
 config MEMSTICK_R592
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 3ce00bf5cfe3..1772a6dfefb4 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -339,14 +339,14 @@ config SENSORS_TSL2550
 	  will be called tsl2550.
 
 config SENSORS_BH1770
-         tristate "BH1770GLC / SFH7770 combined ALS - Proximity sensor"
-         depends on I2C
-         ---help---
-           Say Y here if you want to build a driver for BH1770GLC (ROHM) or
+	 tristate "BH1770GLC / SFH7770 combined ALS - Proximity sensor"
+	 depends on I2C
+	 ---help---
+	   Say Y here if you want to build a driver for BH1770GLC (ROHM) or
 	   SFH7770 (Osram) combined ambient light and proximity sensor chip.
 
-           To compile this driver as a module, choose M here: the
-           module will be called bh1770glc. If unsure, say N here.
+	   To compile this driver as a module, choose M here: the
+	   module will be called bh1770glc. If unsure, say N here.
 
 config SENSORS_APDS990X
 	 tristate "APDS990X combined als and proximity sensors"
@@ -451,8 +451,8 @@ config PCI_ENDPOINT_TEST
 	select CRC32
 	tristate "PCI Endpoint Test driver"
 	---help---
-           Enable this configuration option to enable the host side test driver
-           for PCI Endpoint.
+	   Enable this configuration option to enable the host side test driver
+	   for PCI Endpoint.
 
 config XILINX_SDFEC
 	tristate "Xilinx SDFEC 16"
diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
index ae0b8fe5b990..ea382fc48432 100644
--- a/drivers/mtd/nand/onenand/Kconfig
+++ b/drivers/mtd/nand/onenand/Kconfig
@@ -33,12 +33,12 @@ config MTD_ONENAND_OMAP2
 	  Enable dmaengine and gpiolib for better performance.
 
 config MTD_ONENAND_SAMSUNG
-        tristate "OneNAND on Samsung SOC controller support"
-        depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS4
-        help
-          Support for a OneNAND flash device connected to an Samsung SOC.
-          S3C64XX uses command mapping method.
-          S5PC110/S5PC210 use generic OneNAND method.
+	tristate "OneNAND on Samsung SOC controller support"
+	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS4
+	help
+	  Support for a OneNAND flash device connected to an Samsung SOC.
+	  S3C64XX uses command mapping method.
+	  S5PC110/S5PC210 use generic OneNAND method.
 
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
diff --git a/drivers/nfc/nfcmrvl/Kconfig b/drivers/nfc/nfcmrvl/Kconfig
index 06f34fb4e0b0..ded0d03c0015 100644
--- a/drivers/nfc/nfcmrvl/Kconfig
+++ b/drivers/nfc/nfcmrvl/Kconfig
@@ -15,7 +15,7 @@ config NFC_MRVL_USB
 	  Marvell NFC-over-USB driver.
 
 	  This driver provides support for Marvell NFC-over-USB devices:
-          8897.
+	  8897.
 
 	  Say Y here to compile support for Marvell NFC-over-USB driver
 	  into the kernel or say M to compile it as module.
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index a304f5ea11b9..bd50765f30cd 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -106,14 +106,14 @@ config PCI_PF_STUB
 	  When in doubt, say N.
 
 config XEN_PCIDEV_FRONTEND
-        tristate "Xen PCI Frontend"
-        depends on X86 && XEN
-        select PCI_XEN
+	tristate "Xen PCI Frontend"
+	depends on X86 && XEN
+	select PCI_XEN
 	select XEN_XENBUS_FRONTEND
-        default y
-        help
-          The PCI device frontend driver allows the kernel to import arbitrary
-          PCI devices from a PCI backend to support PCI driver domains.
+	default y
+	help
+	  The PCI device frontend driver allows the kernel to import arbitrary
+	  PCI devices from a PCI backend to support PCI driver domains.
 
 config PCI_ATS
 	bool
@@ -180,12 +180,12 @@ config PCI_LABEL
 	select NLS
 
 config PCI_HYPERV
-        tristate "Hyper-V PCI Frontend"
-        depends on X86_64 && HYPERV && PCI_MSI && PCI_MSI_IRQ_DOMAIN && SYSFS
+	tristate "Hyper-V PCI Frontend"
+	depends on X86_64 && HYPERV && PCI_MSI && PCI_MSI_IRQ_DOMAIN && SYSFS
 	select PCI_HYPERV_INTERFACE
-        help
-          The PCI device frontend driver allows the kernel to import arbitrary
-          PCI devices from a PCI backend to support PCI driver domains.
+	help
+	  The PCI device frontend driver allows the kernel to import arbitrary
+	  PCI devices from a PCI backend to support PCI driver domains.
 
 source "drivers/pci/hotplug/Kconfig"
 source "drivers/pci/controller/Kconfig"
diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 0ba988b5b5bc..625a031b2193 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -7,9 +7,9 @@ config PCIE_DW
 	bool
 
 config PCIE_DW_HOST
-        bool
+	bool
 	depends on PCI_MSI_IRQ_DOMAIN
-        select PCIE_DW
+	select PCIE_DW
 
 config PCIE_DW_EP
 	bool
@@ -224,7 +224,7 @@ config PCIE_HISI_STB
 	depends on PCI_MSI_IRQ_DOMAIN
 	select PCIE_DW_HOST
 	help
-          Say Y here if you want PCIe controller support on HiSilicon STB SoCs
+	  Say Y here if you want PCIe controller support on HiSilicon STB SoCs
 
 config PCI_MESON
 	bool "MESON PCIe controller"
diff --git a/drivers/pci/hotplug/Kconfig b/drivers/pci/hotplug/Kconfig
index e7b493c22bf3..32455a79372d 100644
--- a/drivers/pci/hotplug/Kconfig
+++ b/drivers/pci/hotplug/Kconfig
@@ -83,7 +83,7 @@ config HOTPLUG_PCI_CPCI_ZT5550
 	depends on HOTPLUG_PCI_CPCI && X86
 	help
 	  Say Y here if you have an Performance Technologies (formerly Intel,
-          formerly just Ziatech) Ziatech ZT5550 CompactPCI system card.
+	  formerly just Ziatech) Ziatech ZT5550 CompactPCI system card.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called cpcihp_zt5550.
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 09ae8a970880..288c1b3589e7 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -83,8 +83,8 @@ config HISI_PMU
        bool "HiSilicon SoC PMU"
        depends on ARM64 && ACPI
        help
-         Support for HiSilicon SoC uncore performance monitoring
-         unit (PMU), such as: L3C, HHA and DDRC.
+	 Support for HiSilicon SoC uncore performance monitoring
+	 unit (PMU), such as: L3C, HHA and DDRC.
 
 config QCOM_L2_PMU
 	bool "Qualcomm Technologies L2-cache PMU"
@@ -115,11 +115,11 @@ config THUNDERX2_PMU
 	   in the DDR4 Memory Controller (DMC).
 
 config XGENE_PMU
-        depends on ARCH_XGENE
-        bool "APM X-Gene SoC PMU"
-        default n
-        help
-          Say y if you want to use APM X-Gene SoC performance monitors.
+	depends on ARCH_XGENE
+	bool "APM X-Gene SoC PMU"
+	default n
+	help
+	  Say y if you want to use APM X-Gene SoC performance monitors.
 
 config ARM_SPE_PMU
 	tristate "Enable support for the ARMv8.2 Statistical Profiling Extension"
diff --git a/drivers/phy/hisilicon/Kconfig b/drivers/phy/hisilicon/Kconfig
index 534e393a09b3..6a591bb84031 100644
--- a/drivers/phy/hisilicon/Kconfig
+++ b/drivers/phy/hisilicon/Kconfig
@@ -38,9 +38,9 @@ config PHY_HISI_INNO_USB2
        select GENERIC_PHY
        select MFD_SYSCON
        help
-         Support for INNO USB2 PHY on HiSilicon SoCs. This Phy supports
-         USB 1.5Mb/s, USB 12Mb/s, USB 480Mb/s speeds. It supports one
-         USB host port to accept one USB device.
+	 Support for INNO USB2 PHY on HiSilicon SoCs. This Phy supports
+	 USB 1.5Mb/s, USB 12Mb/s, USB 480Mb/s speeds. It supports one
+	 USB host port to accept one USB device.
 
 config PHY_HIX5HD2_SATA
 	tristate "HIX5HD2 SATA PHY Driver"
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b372419d61f2..25b6c830f2f1 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -32,15 +32,15 @@ config DEBUG_PINCTRL
 	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
 
 config PINCTRL_ARTPEC6
-        bool "Axis ARTPEC-6 pin controller driver"
-        depends on MACH_ARTPEC6
-        select PINMUX
-        select GENERIC_PINCONF
-        help
-          This is the driver for the Axis ARTPEC-6 pin controller. This driver
-          supports pin function multiplexing as well as pin bias and drive
-          strength configuration. Device tree integration instructions can be
-          found in Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
+	bool "Axis ARTPEC-6 pin controller driver"
+	depends on MACH_ARTPEC6
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  This is the driver for the Axis ARTPEC-6 pin controller. This driver
+	  supports pin function multiplexing as well as pin bias and drive
+	  strength configuration. Device tree integration instructions can be
+	  found in Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 
 config PINCTRL_AS3722
 	tristate "Pinctrl and GPIO driver for ams AS3722 PMIC"
diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 5f4058033ec6..3ea9ce3e0cd9 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -39,12 +39,12 @@ config PINCTRL_IMX27
 
 
 config PINCTRL_IMX25
-        bool "IMX25 pinctrl driver"
-        depends on OF
-        depends on SOC_IMX25
-        select PINCTRL_IMX
-        help
-          Say Y here to enable the imx25 pinctrl driver
+	bool "IMX25 pinctrl driver"
+	depends on OF
+	depends on SOC_IMX25
+	select PINCTRL_IMX
+	help
+	  Say Y here to enable the imx25 pinctrl driver
 
 config PINCTRL_IMX35
 	bool "IMX35 pinctrl driver"
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 32fc2458b8eb..8ad0d3cc3bf6 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -141,10 +141,10 @@ config PINCTRL_QCOM_SPMI_PMIC
        select GPIOLIB_IRQCHIP
        select IRQ_DOMAIN_HIERARCHY
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-         which are using SPMI for communication with SoC. Example PMIC's
-         devices are pm8841, pm8941 and pma8084.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
+	 which are using SPMI for communication with SoC. Example PMIC's
+	 devices are pm8841, pm8941 and pma8084.
 
 config PINCTRL_QCOM_SSBI_PMIC
        tristate "Qualcomm SSBI PMIC pin controller driver"
@@ -154,10 +154,10 @@ config PINCTRL_QCOM_SSBI_PMIC
        select GENERIC_PINCONF
        select IRQ_DOMAIN_HIERARCHY
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-         which are using SSBI for communication with SoC. Example PMIC's
-         devices are pm8058 and pm8921.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
+	 which are using SSBI for communication with SoC. Example PMIC's
+	 devices are pm8058 and pm8921.
 
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
@@ -173,26 +173,26 @@ config PINCTRL_SDM660
        depends on GPIOLIB && OF
        select PINCTRL_MSM
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDM660 platform.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDM660 platform.
 
 config PINCTRL_SDM845
        tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
        depends on GPIOLIB && (OF || ACPI)
        select PINCTRL_MSM
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SDM845 platform.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDM845 platform.
 
 config PINCTRL_SM8150
        tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
        depends on GPIOLIB && OF
        select PINCTRL_MSM
        help
-         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-         Qualcomm Technologies Inc TLMM block found on the Qualcomm
-         Technologies Inc SM8150 platform.
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SM8150 platform.
 
 endif
diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index ee5f08ea57b6..b66cc7182287 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -132,9 +132,9 @@ config CROS_EC_LPC
 	  module will be called cros_ec_lpcs.
 
 config CROS_EC_PROTO
-        bool
-        help
-          ChromeOS EC communication protocol helpers.
+	bool
+	help
+	  ChromeOS EC communication protocol helpers.
 
 config CROS_KBD_LED_BACKLIGHT
 	tristate "Backlight LED support for Chrome OS keyboards"
diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 530fe7e31397..a4746bba7e9f 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -41,7 +41,7 @@ config MLXBF_TMFIFO
 	depends on VIRTIO_CONSOLE && VIRTIO_NET
 	help
 	  Say y here to enable TmFifo support. The TmFifo driver provides
-          platform driver support for the TmFifo which supports console
-          and networking based on the virtio framework.
+	  platform driver support for the TmFifo which supports console
+	  and networking based on the virtio framework.
 
 endif # MELLANOX_PLATFORM
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ae21d08c65e8..5c356e4c7d4b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -28,7 +28,7 @@ config ACER_WMI
 	depends on ACPI_WMI
 	select INPUT_SPARSEKMAP
 	# Acer WMI depends on ACPI_VIDEO when ACPI is enabled
-        select ACPI_VIDEO if ACPI
+	select ACPI_VIDEO if ACPI
 	---help---
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
@@ -38,18 +38,18 @@ config ACER_WMI
 	  here.
 
 config ACER_WIRELESS
-        tristate "Acer Wireless Radio Control Driver"
-        depends on ACPI
-        depends on INPUT
-        ---help---
-          The Acer Wireless Radio Control handles the airplane mode hotkey
-          present on new Acer laptops.
+	tristate "Acer Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
+	---help---
+	  The Acer Wireless Radio Control handles the airplane mode hotkey
+	  present on new Acer laptops.
 
-          Say Y or M here if you have an Acer notebook with an airplane mode
-          hotkey.
+	  Say Y or M here if you have an Acer notebook with an airplane mode
+	  hotkey.
 
-          If you choose to compile this driver as a module the module will be
-          called acer-wireless.
+	  If you choose to compile this driver as a module the module will be
+	  called acer-wireless.
 
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
@@ -286,17 +286,17 @@ config FUJITSU_TABLET
        depends on ACPI
        depends on INPUT
        ---help---
-         This is a driver for tablets built by Fujitsu:
+	 This is a driver for tablets built by Fujitsu:
 
-           * Lifebook P1510/P1610/P1620/Txxxx
-           * Stylistic ST5xxx
-           * Possibly other Fujitsu tablet models
+	   * Lifebook P1510/P1610/P1620/Txxxx
+	   * Stylistic ST5xxx
+	   * Possibly other Fujitsu tablet models
 
-         It adds support for the panel buttons, docking station detection,
-         tablet/notebook mode detection for convertible and
-         orientation detection for docked slates.
+	 It adds support for the panel buttons, docking station detection,
+	 tablet/notebook mode detection for convertible and
+	 orientation detection for docked slates.
 
-         If you have a Fujitsu convertible or slate, say Y or M here.
+	 If you have a Fujitsu convertible or slate, say Y or M here.
 
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
@@ -1013,8 +1013,8 @@ config INTEL_MFLD_THERMAL
        tristate "Thermal driver for Intel Medfield platform"
        depends on MFD_INTEL_MSIC && THERMAL
        help
-         Say Y here to enable thermal driver support for the  Intel Medfield
-         platform.
+	 Say Y here to enable thermal driver support for the  Intel Medfield
+	 platform.
 
 config INTEL_IPS
 	tristate "Intel Intelligent Power Sharing"
@@ -1121,7 +1121,7 @@ config MXM_WMI
        tristate "WMI support for MXM Laptop Graphics"
        depends on ACPI_WMI
        ---help---
-          MXM is a standard for laptop graphics cards, the WMI interface
+	  MXM is a standard for laptop graphics cards, the WMI interface
 	  is required for switchable nvidia graphics machines
 
 config INTEL_OAKTRAIL
@@ -1156,7 +1156,7 @@ config APPLE_GMUX
 	  control is supported by the driver.
 
 config INTEL_RST
-        tristate "Intel Rapid Start Technology Driver"
+	tristate "Intel Rapid Start Technology Driver"
 	depends on ACPI
 	---help---
 	  This driver provides support for modifying paramaters on systems
@@ -1168,7 +1168,7 @@ config INTEL_RST
 	  as usual.
 
 config INTEL_SMARTCONNECT
-        tristate "Intel Smart Connect disabling driver"
+	tristate "Intel Smart Connect disabling driver"
 	depends on ACPI
 	---help---
 	  Intel Smart Connect is a technology intended to permit devices to
diff --git a/drivers/power/avs/Kconfig b/drivers/power/avs/Kconfig
index b5a217b828dc..089b6244b716 100644
--- a/drivers/power/avs/Kconfig
+++ b/drivers/power/avs/Kconfig
@@ -13,9 +13,9 @@ menuconfig POWER_AVS
 	  Say Y here to enable Adaptive Voltage Scaling class support.
 
 config ROCKCHIP_IODOMAIN
-        tristate "Rockchip IO domain support"
-        depends on POWER_AVS && ARCH_ROCKCHIP && OF
-        help
-          Say y here to enable support io domains on Rockchip SoCs. It is
-          necessary for the io domain setting of the SoC to match the
-          voltage supplied by the regulators.
+	tristate "Rockchip IO domain support"
+	depends on POWER_AVS && ARCH_ROCKCHIP && OF
+	help
+	  Say y here to enable support io domains on Rockchip SoCs. It is
+	  necessary for the io domain setting of the SoC to match the
+	  voltage supplied by the regulators.
diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index c84a7b1caeb6..f6995eaa5640 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -73,10 +73,10 @@ config WM831X_POWER
 	  provided by Wolfson Microelectronics WM831x PMICs.
 
 config WM8350_POWER
-        tristate "WM8350 PMU support"
-        depends on MFD_WM8350
-        help
-          Say Y here to enable support for the power management unit
+	tristate "WM8350 PMU support"
+	depends on MFD_WM8350
+	help
+	  Say Y here to enable support for the power management unit
 	  provided by the Wolfson Microelectronics WM8350 PMIC.
 
 config TEST_POWER
@@ -209,16 +209,16 @@ config BATTERY_WM97XX
 	  Say Y to enable support for battery measured by WM97xx aux port.
 
 config BATTERY_SBS
-        tristate "SBS Compliant gas gauge"
-        depends on I2C
-        help
+	tristate "SBS Compliant gas gauge"
+	depends on I2C
+	help
 	  Say Y to include support for SBS battery driver for SBS-compliant
 	  gas gauges.
 
 config CHARGER_SBS
-        tristate "SBS Compliant charger"
-        depends on I2C
-        help
+	tristate "SBS Compliant charger"
+	depends on I2C
+	help
 	  Say Y to include support for SBS compliant battery chargers.
 
 config MANAGER_SBS
@@ -484,11 +484,11 @@ config CHARGER_MANAGER
 	depends on REGULATOR
 	select EXTCON
 	help
-          Say Y to enable charger-manager support, which allows multiple
-          chargers attached to a battery and multiple batteries attached to a
-          system. The charger-manager also can monitor charging status in
-          runtime and in suspend-to-RAM by waking up the system periodically
-          with help of suspend_again support.
+	  Say Y to enable charger-manager support, which allows multiple
+	  chargers attached to a battery and multiple batteries attached to a
+	  system. The charger-manager also can monitor charging status in
+	  runtime and in suspend-to-RAM by waking up the system periodically
+	  with help of suspend_again support.
 
 config CHARGER_LT3651
 	tristate "Analog Devices LT3651 charger"
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 3ee63531f6d5..74eb5af7295f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -841,10 +841,10 @@ config REGULATOR_SKY81452
 	  will be called sky81452-regulator.
 
 config REGULATOR_SLG51000
-        tristate "Dialog Semiconductor SLG51000 regulators"
-        depends on I2C
-        select REGMAP_I2C
-        help
+	tristate "Dialog Semiconductor SLG51000 regulators"
+	depends on I2C
+	select REGMAP_I2C
+	help
 	  Say y here to support for the Dialog Semiconductor SLG51000.
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index d0322b41eca5..709276540ef1 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -21,7 +21,7 @@ config RPMSG_QCOM_GLINK_NATIVE
 
 config RPMSG_QCOM_GLINK_RPM
 	tristate "Qualcomm RPM Glink driver"
-        select RPMSG_QCOM_GLINK_NATIVE
+	select RPMSG_QCOM_GLINK_NATIVE
 	depends on HAS_IOMEM
 	depends on MAILBOX
 	help
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 1adf9f815652..bc95038457c8 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1510,9 +1510,9 @@ config RTC_DRV_PXA
 	depends on ARCH_PXA
 	select RTC_DRV_SA1100
 	help
-         If you say Y here you will get access to the real time clock
-         built into your PXA27x or PXA3xx CPU. This RTC is actually 2 RTCs
-         consisting of an SA1100 compatible RTC and the extended PXA RTC.
+	 If you say Y here you will get access to the real time clock
+	 built into your PXA27x or PXA3xx CPU. This RTC is actually 2 RTCs
+	 consisting of an SA1100 compatible RTC and the extended PXA RTC.
 
 	 This RTC driver uses PXA RTC registers available since pxa27x
 	 series (RDxR, RYxR) instead of legacy RCNR, RTAR.
diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index 1b92f3c19ff3..23678311b51c 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1166,8 +1166,8 @@ config SCSI_LPFC
 	depends on NVME_FC || NVME_FC=n
 	select CRC_T10DIF
 	---help---
-          This lpfc driver supports the Emulex LightPulse
-          Family of Fibre Channel PCI host adapters.
+	  This lpfc driver supports the Emulex LightPulse
+	  Family of Fibre Channel PCI host adapters.
 
 config SCSI_LPFC_DEBUG_FS
 	bool "Emulex LightPulse Fibre Channel debugfs Support"
@@ -1480,14 +1480,14 @@ config ZFCP
 	depends on S390 && QDIO && SCSI
 	depends on SCSI_FC_ATTRS
 	help
-          If you want to access SCSI devices attached to your IBM eServer
-          zSeries by means of Fibre Channel interfaces say Y.
-          For details please refer to the documentation provided by IBM at
-          <http://oss.software.ibm.com/developerworks/opensource/linux390>
+	  If you want to access SCSI devices attached to your IBM eServer
+	  zSeries by means of Fibre Channel interfaces say Y.
+	  For details please refer to the documentation provided by IBM at
+	  <http://oss.software.ibm.com/developerworks/opensource/linux390>
 
-          This driver is also available as a module. This module will be
-          called zfcp. If you want to compile it as a module, say M here
-          and read <file:Documentation/kbuild/modules.rst>.
+	  This driver is also available as a module. This module will be
+	  called zfcp. If you want to compile it as a module, say M here
+	  and read <file:Documentation/kbuild/modules.rst>.
 
 config SCSI_PMCRAID
 	tristate "PMC SIERRA Linux MaxRAID adapter support"
@@ -1518,8 +1518,8 @@ config SCSI_VIRTIO
 	tristate "virtio-scsi support"
 	depends on VIRTIO
 	help
-          This is the virtual HBA driver for virtio.  If the kernel will
-          be used in a virtual machine, say Y or M.
+	  This is the virtual HBA driver for virtio.  If the kernel will
+	  be used in a virtual machine, say Y or M.
 
 source "drivers/scsi/csiostor/Kconfig"
 
diff --git a/drivers/scsi/aic7xxx/Kconfig.aic7xxx b/drivers/scsi/aic7xxx/Kconfig.aic7xxx
index 3546b8cc401f..4ed44ba4a55b 100644
--- a/drivers/scsi/aic7xxx/Kconfig.aic7xxx
+++ b/drivers/scsi/aic7xxx/Kconfig.aic7xxx
@@ -71,20 +71,20 @@ config AIC7XXX_DEBUG_ENABLE
 	driver errors.
 
 config AIC7XXX_DEBUG_MASK
-        int "Debug code enable mask (2047 for all debugging)"
-        depends on SCSI_AIC7XXX
-        default "0"
-        help
+	int "Debug code enable mask (2047 for all debugging)"
+	depends on SCSI_AIC7XXX
+	default "0"
+	help
 	Bit mask of debug options that is only valid if the
 	CONFIG_AIC7XXX_DEBUG_ENABLE option is enabled.  The bits in this mask
 	are defined in the drivers/scsi/aic7xxx/aic7xxx.h - search for the
 	variable ahc_debug in that file to find them.
 
 config AIC7XXX_REG_PRETTY_PRINT
-        bool "Decode registers during diagnostics"
-        depends on SCSI_AIC7XXX
+	bool "Decode registers during diagnostics"
+	depends on SCSI_AIC7XXX
 	default y
-        help
+	help
 	Compile in register value tables for the output of expanded register
 	contents in diagnostics.  This make it much easier to understand debug
 	output without having to refer to a data book and/or the aic7xxx.reg
diff --git a/drivers/scsi/pcmcia/Kconfig b/drivers/scsi/pcmcia/Kconfig
index 2368f34efba3..03aec3410ac7 100644
--- a/drivers/scsi/pcmcia/Kconfig
+++ b/drivers/scsi/pcmcia/Kconfig
@@ -56,7 +56,7 @@ config PCMCIA_NINJA_SCSI
 	    [I-O DATA (OEM) (version string: "IO DATA","CBSC16       ","1")]
 	    I-O DATA CBSC-II
 	    [Kyusyu Matsushita Kotobuki (OEM)
-               (version string: "KME    ","SCSI-CARD-001","1")]
+	       (version string: "KME    ","SCSI-CARD-001","1")]
 	    KME KXL-820AN's card
 	    HP M820e CDRW's card
 	    etc.
diff --git a/drivers/scsi/qedf/Kconfig b/drivers/scsi/qedf/Kconfig
index 7cd993be4e57..80328dbd44c9 100644
--- a/drivers/scsi/qedf/Kconfig
+++ b/drivers/scsi/qedf/Kconfig
@@ -3,8 +3,8 @@ config QEDF
 	tristate "QLogic QEDF 25/40/100Gb FCoE Initiator Driver Support"
 	depends on PCI && SCSI
 	depends on QED
-        depends on LIBFC
-        depends on LIBFCOE
+	depends on LIBFC
+	depends on LIBFCOE
 	select QED_LL2
 	select QED_FCOE
 	---help---
diff --git a/drivers/scsi/smartpqi/Kconfig b/drivers/scsi/smartpqi/Kconfig
index bc6506884e3b..456ec474fa17 100644
--- a/drivers/scsi/smartpqi/Kconfig
+++ b/drivers/scsi/smartpqi/Kconfig
@@ -50,7 +50,7 @@ config SCSI_SMARTPQI
 	To compile this driver as a module, choose M here: the
 	module will be called smartpqi.
 
-        Note: the aacraid driver will not manage a smartpqi
-              controller. You need to enable smartpqi for smartpqi
-              controllers. For more information, please see
-              Documentation/scsi/smartpqi.txt
+	Note: the aacraid driver will not manage a smartpqi
+	      controller. You need to enable smartpqi for smartpqi
+	      controllers. For more information, please see
+	      Documentation/scsi/smartpqi.txt
diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index f9ad8ad54a7d..192e28f2cc9a 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -21,10 +21,10 @@ config FSL_GUTS
 	  into this driver as well.
 
 config FSL_MC_DPIO
-        tristate "QorIQ DPAA2 DPIO driver"
-        depends on FSL_MC_BUS
-        select SOC_BUS
-        help
+	tristate "QorIQ DPAA2 DPIO driver"
+	depends on FSL_MC_BUS
+	select SOC_BUS
+	help
 	  Driver for the DPAA2 DPIO object.  A DPIO provides queue and
 	  buffer management facilities for software to interact with
 	  other DPAA2 objects. This driver does not expose the DPIO
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 661e47acc354..fd3abdf82fc0 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -45,13 +45,13 @@ config QCOM_GLINK_SSR
 	  neighboring subsystems going up or down.
 
 config QCOM_GSBI
-        tristate "QCOM General Serial Bus Interface"
-        depends on ARCH_QCOM || COMPILE_TEST
-        select MFD_SYSCON
-        help
-          Say y here to enable GSBI support.  The GSBI provides control
-          functions for connecting the underlying serial UART, SPI, and I2C
-          devices to the output pins.
+	tristate "QCOM General Serial Bus Interface"
+	depends on ARCH_QCOM || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Say y here to enable GSBI support.  The GSBI provides control
+	  functions for connecting the underlying serial UART, SPI, and I2C
+	  devices to the output pins.
 
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
@@ -196,8 +196,8 @@ config QCOM_APR
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	help
-          Enable APR IPC protocol support between
-          application processor and QDSP6. APR is
-          used by audio driver to configure QDSP6
-          ASM, ADM and AFE modules.
+	  Enable APR IPC protocol support between
+	  application processor and QDSP6. APR is
+	  used by audio driver to configure QDSP6
+	  ASM, ADM and AFE modules.
 endmenu
diff --git a/drivers/soc/rockchip/Kconfig b/drivers/soc/rockchip/Kconfig
index b71b73bf5fc5..3e2057f22bbc 100644
--- a/drivers/soc/rockchip/Kconfig
+++ b/drivers/soc/rockchip/Kconfig
@@ -15,15 +15,15 @@ config ROCKCHIP_GRF
 	  to make some of them conform to expectations of the kernel.
 
 config ROCKCHIP_PM_DOMAINS
-        bool "Rockchip generic power domain"
-        depends on PM
-        select PM_GENERIC_DOMAINS
-        help
-          Say y here to enable power domain support.
-          In order to meet high performance and low power requirements, a power
-          management unit is designed or saving power when RK3288 in low power
-          mode. The RK3288 PMU is dedicated for managing the power of the whole chip.
+	bool "Rockchip generic power domain"
+	depends on PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Say y here to enable power domain support.
+	  In order to meet high performance and low power requirements, a power
+	  management unit is designed or saving power when RK3288 in low power
+	  mode. The RK3288 PMU is dedicated for managing the power of the whole chip.
 
-          If unsure, say N.
+	  If unsure, say N.
 
 endif
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 6f7fdcbb9151..5e9d209e6d82 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -143,7 +143,7 @@ config SPI_BCM63XX
 	tristate "Broadcom BCM63xx SPI controller"
 	depends on BCM63XX || COMPILE_TEST
 	help
-          Enable support for the SPI controller on the Broadcom BCM63xx SoCs.
+	  Enable support for the SPI controller on the Broadcom BCM63xx SoCs.
 
 config SPI_BCM63XX_HSSPI
 	tristate "Broadcom BCM63XX HS SPI controller driver"
@@ -234,11 +234,11 @@ config SPI_DLN2
        tristate "Diolan DLN-2 USB SPI adapter"
        depends on MFD_DLN2
        help
-         If you say yes to this option, support will be included for Diolan
-         DLN2, a USB to SPI interface.
+	 If you say yes to this option, support will be included for Diolan
+	 DLN2, a USB to SPI interface.
 
-         This driver can also be built as a module.  If so, the module
-         will be called spi-dln2.
+	 This driver can also be built as a module.  If so, the module
+	 will be called spi-dln2.
 
 config SPI_EFM32
 	tristate "EFM32 SPI controller"
@@ -747,10 +747,10 @@ config SPI_SYNQUACER
 	  It also supports the new dual-bit and quad-bit SPI protocol.
 
 config SPI_MXIC
-        tristate "Macronix MX25F0A SPI controller"
-        depends on SPI_MASTER
-        help
-          This selects the Macronix MX25F0A SPI controller driver.
+	tristate "Macronix MX25F0A SPI controller"
+	depends on SPI_MASTER
+	help
+	  This selects the Macronix MX25F0A SPI controller driver.
 
 config SPI_MXS
 	tristate "Freescale MXS SPI controller"
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 8ec524a95ec8..ab3e71d54b13 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -95,8 +95,8 @@ config FB_TFT_PCD8544
 	  Generic Framebuffer support for PCD8544
 
 config FB_TFT_RA8875
-        tristate "FB driver for the RA8875 LCD Controller"
-        depends on FB_TFT
+	tristate "FB driver for the RA8875 LCD Controller"
+	depends on FB_TFT
 	help
 	  Generic Framebuffer support for RA8875
 
@@ -125,10 +125,10 @@ config FB_TFT_SSD1289
 	  Framebuffer support for SSD1289
 
 config FB_TFT_SSD1305
-        tristate "FB driver for the SSD1305 OLED Controller"
-        depends on FB_TFT
-        help
-          Framebuffer support for SSD1305
+	tristate "FB driver for the SSD1305 OLED Controller"
+	depends on FB_TFT
+	help
+	  Framebuffer support for SSD1305
 
 config FB_TFT_SSD1306
 	tristate "FB driver for the SSD1306 OLED Controller"
diff --git a/drivers/staging/fwserial/Kconfig b/drivers/staging/fwserial/Kconfig
index 9543f8454af9..d21124a1a127 100644
--- a/drivers/staging/fwserial/Kconfig
+++ b/drivers/staging/fwserial/Kconfig
@@ -3,7 +3,7 @@ config FIREWIRE_SERIAL
        tristate "TTY over Firewire"
        depends on FIREWIRE && TTY
        help
-          This enables TTY over IEEE 1394, providing high-speed serial
+	  This enables TTY over IEEE 1394, providing high-speed serial
 	  connectivity to cabled peers. This driver implements a
 	  ad-hoc transport protocol and is currently limited to
 	  Linux-to-Linux communication.
@@ -17,7 +17,7 @@ config FWTTY_MAX_TOTAL_PORTS
        int "Maximum number of serial ports supported"
        default "64"
        help
-          Set this to the maximum number of serial ports you want the
+	  Set this to the maximum number of serial ports you want the
 	  firewire-serial driver to support.
 
 config FWTTY_MAX_CARD_PORTS
@@ -25,7 +25,7 @@ config FWTTY_MAX_CARD_PORTS
        range 0 FWTTY_MAX_TOTAL_PORTS
        default "32"
        help
-          Set this to the maximum number of serial ports each firewire
+	  Set this to the maximum number of serial ports each firewire
 	  adapter supports. The actual number of serial ports registered
 	  is set with the module parameter "ttys".
 
diff --git a/drivers/staging/most/Kconfig b/drivers/staging/most/Kconfig
index 8948d5246409..6262eb25c80b 100644
--- a/drivers/staging/most/Kconfig
+++ b/drivers/staging/most/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig MOST
-        tristate "MOST support"
+	tristate "MOST support"
 	depends on HAS_DMA && CONFIGFS_FS
-        default n
-        help
+	default n
+	help
 	  Say Y here if you want to enable MOST support.
 	  This driver needs at least one additional component to enable the
 	  desired access from userspace (e.g. character devices) and one that
@@ -12,7 +12,7 @@ menuconfig MOST
 	  To compile this driver as a module, choose M here: the
 	  module will be called most_core.
 
-          If in doubt, say N here.
+	  If in doubt, say N here.
 
 
 
diff --git a/drivers/staging/nvec/Kconfig b/drivers/staging/nvec/Kconfig
index 5c12cacf75e1..9fa98c16f1d9 100644
--- a/drivers/staging/nvec/Kconfig
+++ b/drivers/staging/nvec/Kconfig
@@ -8,7 +8,7 @@ config MFD_NVEC
 	    controller.
 
 	    To compile this driver as a module, say M here: the module will be
-            called mfd-nvec
+	    called mfd-nvec
 
 config KEYBOARD_NVEC
 	tristate "Keyboard on nVidia compliant EC"
@@ -18,7 +18,7 @@ config KEYBOARD_NVEC
 	  a nVidia compliant embedded controller.
 
 	  To compile this driver as a module, say M here: the module will be
-          called keyboard-nvec
+	  called keyboard-nvec
 
 config SERIO_NVEC_PS2
 	tristate "PS2 on nVidia EC"
@@ -28,7 +28,7 @@ config SERIO_NVEC_PS2
 	  to a nVidia compliant embedded controller.
 
 	  To compile this driver as a module, say M here: the module will be
-          called serio-nvec-ps2
+	  called serio-nvec-ps2
 
 
 config NVEC_POWER
@@ -39,7 +39,7 @@ config NVEC_POWER
 	  nVidia compliant embedded controllers.
 
 	  To compile this driver as a module, say M here: the module will be
-          called nvec-power
+	  called nvec-power
 
 
 config NVEC_PAZ00
@@ -50,5 +50,5 @@ config NVEC_PAZ00
 	  devices, e.g. Toshbia AC100 and Dynabooks AZ netbooks.
 
 	  To compile this driver as a module, say M here: the module will be
-          called nvec-paz00
+	  called nvec-paz00
 
diff --git a/drivers/staging/pi433/Kconfig b/drivers/staging/pi433/Kconfig
index 8acde0814206..dd9e4709d1a8 100644
--- a/drivers/staging/pi433/Kconfig
+++ b/drivers/staging/pi433/Kconfig
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 config PI433
-        tristate "Pi433 - a 433MHz radio module for Raspberry Pi"
-        depends on SPI
-        help
-          This option allows you to enable support for the radio module Pi433.
+	tristate "Pi433 - a 433MHz radio module for Raspberry Pi"
+	depends on SPI
+	help
+	  This option allows you to enable support for the radio module Pi433.
 
-          Pi433 is a shield that fits onto the GPIO header of a Raspberry Pi
-          or compatible. It extends the Raspberry Pi with the option, to
-          send and receive data in the 433MHz ISM band - for example to
-          communicate between two systems without using ethernet or bluetooth
-          or for control or read sockets, actors, sensors, widely available
-          for low price.
+	  Pi433 is a shield that fits onto the GPIO header of a Raspberry Pi
+	  or compatible. It extends the Raspberry Pi with the option, to
+	  send and receive data in the 433MHz ISM band - for example to
+	  communicate between two systems without using ethernet or bluetooth
+	  or for control or read sockets, actors, sensors, widely available
+	  for low price.
 
-          For details or the option to buy, please visit https://pi433.de/en.html
+	  For details or the option to buy, please visit https://pi433.de/en.html
 
-          If in doubt, say N here, but saying yes most probably won't hurt
+	  If in doubt, say N here, but saying yes most probably won't hurt
diff --git a/drivers/staging/uwb/Kconfig b/drivers/staging/uwb/Kconfig
index 259e053e1e09..c03dcc76b57c 100644
--- a/drivers/staging/uwb/Kconfig
+++ b/drivers/staging/uwb/Kconfig
@@ -42,31 +42,31 @@ config UWB_HWA
 	  is safe to select any even if you do not have the hardware.
 
 config UWB_WHCI
-        tristate "UWB Radio Control driver for WHCI-compliant cards"
-        depends on PCI
-        help
-          This driver enables the radio controller for WHCI cards.
+	tristate "UWB Radio Control driver for WHCI-compliant cards"
+	depends on PCI
+	help
+	  This driver enables the radio controller for WHCI cards.
 
-          WHCI is a specification developed by Intel
-          (http://www.intel.com/technology/comms/wusb/whci.htm) much
-          in the spirit of USB's EHCI, but for UWB and Wireless USB
-          radio/host controllers connected via memory mapping (eg:
-          PCI). Most of these cards come also with a Wireless USB host
-          controller.
+	  WHCI is a specification developed by Intel
+	  (http://www.intel.com/technology/comms/wusb/whci.htm) much
+	  in the spirit of USB's EHCI, but for UWB and Wireless USB
+	  radio/host controllers connected via memory mapping (eg:
+	  PCI). Most of these cards come also with a Wireless USB host
+	  controller.
 
-          To compile this driver select Y (built in) or M (module). It
-          is safe to select any even if you do not have the hardware.
+	  To compile this driver select Y (built in) or M (module). It
+	  is safe to select any even if you do not have the hardware.
 
 config UWB_I1480U
-        tristate "Support for Intel Wireless UWB Link 1480 HWA"
-        depends on UWB_HWA
-        select FW_LOADER
-        help
-         This driver enables support for the i1480 when connected via
-         USB. It consists of a firmware uploader that will enable it
-         to behave as an HWA device.
+	tristate "Support for Intel Wireless UWB Link 1480 HWA"
+	depends on UWB_HWA
+	select FW_LOADER
+	help
+	 This driver enables support for the i1480 when connected via
+	 USB. It consists of a firmware uploader that will enable it
+	 to behave as an HWA device.
 
-         To compile this driver select Y (built in) or M (module). It
-         is safe to select any even if you do not have the hardware.
+	 To compile this driver select Y (built in) or M (module). It
+	 is safe to select any even if you do not have the hardware.
 
 endif # UWB
diff --git a/drivers/staging/vc04_services/bcm2835-audio/Kconfig b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
index f66319512faf..d32ea348e846 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/Kconfig
+++ b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 config SND_BCM2835
-        tristate "BCM2835 Audio"
-        depends on (ARCH_BCM2835 || COMPILE_TEST) && SND
-        select SND_PCM
-        select BCM2835_VCHIQ
-        help
-          Say Y or M if you want to support BCM2835 built in audio
+	tristate "BCM2835 Audio"
+	depends on (ARCH_BCM2835 || COMPILE_TEST) && SND
+	select SND_PCM
+	select BCM2835_VCHIQ
+	help
+	  Say Y or M if you want to support BCM2835 built in audio
 
diff --git a/drivers/staging/wusbcore/Kconfig b/drivers/staging/wusbcore/Kconfig
index a559d023b508..64be97ca734a 100644
--- a/drivers/staging/wusbcore/Kconfig
+++ b/drivers/staging/wusbcore/Kconfig
@@ -11,7 +11,7 @@ config USB_WUSB
 	help
 	  Enable the host-side support for Wireless USB.
 
-          To compile this support select Y (built in). It is safe to
+	  To compile this support select Y (built in). It is safe to
 	  select even if you don't have the hardware.
 
 config USB_WUSB_CBAF
diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index c7623f99ac0f..ec53b1d4aef3 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -85,13 +85,13 @@ config VT_HW_CONSOLE_BINDING
        bool "Support for binding and unbinding console drivers"
        depends on HW_CONSOLE
        ---help---
-         The virtual terminal is the device that interacts with the physical
-         terminal through console drivers. On these systems, at least one
-         console driver is loaded. In other configurations, additional console
-         drivers may be enabled, such as the framebuffer console. If more than
-         1 console driver is enabled, setting this to 'y' will allow you to
-         select the console driver that will serve as the backend for the
-         virtual terminals.
+	 The virtual terminal is the device that interacts with the physical
+	 terminal through console drivers. On these systems, at least one
+	 console driver is loaded. In other configurations, additional console
+	 drivers may be enabled, such as the framebuffer console. If more than
+	 1 console driver is enabled, setting this to 'y' will allow you to
+	 select the console driver that will serve as the backend for the
+	 virtual terminals.
 
 	 See <file:Documentation/driver-api/console.rst> for more
 	 information. For framebuffer console users, please refer to
@@ -173,15 +173,15 @@ config ROCKETPORT
 	depends on SERIAL_NONSTANDARD && (ISA || EISA || PCI)
 	help
 	  This driver supports Comtrol RocketPort and RocketModem PCI boards.   
-          These boards provide 2, 4, 8, 16, or 32 high-speed serial ports or
-          modems.  For information about the RocketPort/RocketModem  boards
-          and this driver read <file:Documentation/driver-api/serial/rocket.rst>.
+	  These boards provide 2, 4, 8, 16, or 32 high-speed serial ports or
+	  modems.  For information about the RocketPort/RocketModem  boards
+	  and this driver read <file:Documentation/driver-api/serial/rocket.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called rocket.
 
 	  If you want to compile this driver into the kernel, say Y here.  If
-          you don't have a Comtrol RocketPort/RocketModem card installed, say N.
+	  you don't have a Comtrol RocketPort/RocketModem card installed, say N.
 
 config CYCLADES
 	tristate "Cyclades async mux support"
@@ -437,8 +437,8 @@ config MIPS_EJTAG_FDC_KGDB
 	depends on MIPS_EJTAG_FDC_TTY && KGDB
 	default y
 	help
-          This enables the use of KGDB over an FDC channel, allowing KGDB to be
-          used remotely or when a serial port isn't available.
+	  This enables the use of KGDB over an FDC channel, allowing KGDB to be
+	  used remotely or when a serial port isn't available.
 
 config MIPS_EJTAG_FDC_KGDB_CHAN
 	int "KGDB FDC channel"
diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 4d22b911111f..bb5953dd1a2c 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -74,7 +74,7 @@ config HVC_UDBG
        depends on PPC
        select HVC_DRIVER
        help
-         This is meant to be used during HW bring up or debugging when
+	 This is meant to be used during HW bring up or debugging when
 	 no other console mechanism exist but udbg, to get you a quick
 	 console for userspace. Do NOT enable in production kernels. 
 
@@ -83,7 +83,7 @@ config HVC_DCC
        depends on ARM || ARM64
        select HVC_DRIVER
        help
-         This console uses the JTAG DCC on ARM to create a console under the HVC
+	 This console uses the JTAG DCC on ARM to create a console under the HVC
 	 driver. This console is used through a JTAG only on ARM. If you don't have
 	 a JTAG then you probably don't want this option.
 
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 7ef60f8b6e2c..7e132657f160 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -334,7 +334,7 @@ config SERIAL_8250_BCM2835AUX
 
 	  Features and limitations of the UART are
 	    Registers are similar to 16650 registers,
-              set bits in the control registers that are unsupported
+	      set bits in the control registers that are unsupported
 	      are ignored and read back as 0
 	    7/8 bit operation with 1 start and 1 stop bit
 	    8 symbols deep fifo for rx and tx
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 4789b5d62f63..b11b4d725ae6 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -287,26 +287,26 @@ config SERIAL_SAMSUNG_CONSOLE
 	  boot time.)
 
 config SERIAL_SIRFSOC
-        tristate "SiRF SoC Platform Serial port support"
-        depends on ARCH_SIRF
-        select SERIAL_CORE
-        help
-          Support for the on-chip UART on the CSR SiRFprimaII series,
-          providing /dev/ttySiRF0, 1 and 2 (note, some machines may not
-          provide all of these ports, depending on how the serial port
-          pins are configured).
+	tristate "SiRF SoC Platform Serial port support"
+	depends on ARCH_SIRF
+	select SERIAL_CORE
+	help
+	  Support for the on-chip UART on the CSR SiRFprimaII series,
+	  providing /dev/ttySiRF0, 1 and 2 (note, some machines may not
+	  provide all of these ports, depending on how the serial port
+	  pins are configured).
 
 config SERIAL_SIRFSOC_CONSOLE
-        bool "Support for console on SiRF SoC serial port"
-        depends on SERIAL_SIRFSOC=y
-        select SERIAL_CORE_CONSOLE
-        help
-          Even if you say Y here, the currently visible virtual console
-          (/dev/tty0) will still be used as the system console by default, but
-          you can alter that using a kernel command line option such as
-          "console=ttySiRFx". (Try "man bootparam" or see the documentation of
-          your boot loader about how to pass options to the kernel at
-          boot time.)
+	bool "Support for console on SiRF SoC serial port"
+	depends on SERIAL_SIRFSOC=y
+	select SERIAL_CORE_CONSOLE
+	help
+	  Even if you say Y here, the currently visible virtual console
+	  (/dev/tty0) will still be used as the system console by default, but
+	  you can alter that using a kernel command line option such as
+	  "console=ttySiRFx". (Try "man bootparam" or see the documentation of
+	  your boot loader about how to pass options to the kernel at
+	  boot time.)
 
 config SERIAL_TEGRA
 	tristate "NVIDIA Tegra20/30 SoC serial controller"
@@ -1077,41 +1077,41 @@ config SERIAL_SCCNXP_CONSOLE
 	  Support for console on SCCNXP serial ports.
 
 config SERIAL_SC16IS7XX_CORE
-        tristate
+	tristate
 
 config SERIAL_SC16IS7XX
-        tristate "SC16IS7xx serial support"
-        select SERIAL_CORE
-        depends on (SPI_MASTER && !I2C) || I2C
-        help
-          This selects support for SC16IS7xx serial ports.
-          Supported ICs are SC16IS740, SC16IS741, SC16IS750, SC16IS752,
-          SC16IS760 and SC16IS762. Select supported buses using options below.
+	tristate "SC16IS7xx serial support"
+	select SERIAL_CORE
+	depends on (SPI_MASTER && !I2C) || I2C
+	help
+	  This selects support for SC16IS7xx serial ports.
+	  Supported ICs are SC16IS740, SC16IS741, SC16IS750, SC16IS752,
+	  SC16IS760 and SC16IS762. Select supported buses using options below.
 
 config SERIAL_SC16IS7XX_I2C
-        bool "SC16IS7xx for I2C interface"
-        depends on SERIAL_SC16IS7XX
-        depends on I2C
-        select SERIAL_SC16IS7XX_CORE if SERIAL_SC16IS7XX
-        select REGMAP_I2C if I2C
-        default y
-        help
-          Enable SC16IS7xx driver on I2C bus,
-          If required say y, and say n to i2c if not required,
-          Enabled by default to support oldconfig.
-          You must select at least one bus for the driver to be built.
+	bool "SC16IS7xx for I2C interface"
+	depends on SERIAL_SC16IS7XX
+	depends on I2C
+	select SERIAL_SC16IS7XX_CORE if SERIAL_SC16IS7XX
+	select REGMAP_I2C if I2C
+	default y
+	help
+	  Enable SC16IS7xx driver on I2C bus,
+	  If required say y, and say n to i2c if not required,
+	  Enabled by default to support oldconfig.
+	  You must select at least one bus for the driver to be built.
 
 config SERIAL_SC16IS7XX_SPI
-        bool "SC16IS7xx for spi interface"
-        depends on SERIAL_SC16IS7XX
-        depends on SPI_MASTER
-        select SERIAL_SC16IS7XX_CORE if SERIAL_SC16IS7XX
-        select REGMAP_SPI if SPI_MASTER
-        help
-          Enable SC16IS7xx driver on SPI bus,
-          If required say y, and say n to spi if not required,
-          This is additional support to exsisting driver.
-          You must select at least one bus for the driver to be built.
+	bool "SC16IS7xx for spi interface"
+	depends on SERIAL_SC16IS7XX
+	depends on SPI_MASTER
+	select SERIAL_SC16IS7XX_CORE if SERIAL_SC16IS7XX
+	select REGMAP_SPI if SPI_MASTER
+	help
+	  Enable SC16IS7xx driver on SPI bus,
+	  If required say y, and say n to spi if not required,
+	  This is additional support to exsisting driver.
+	  You must select at least one bus for the driver to be built.
 
 config SERIAL_TIMBERDALE
 	tristate "Support for timberdale UART"
@@ -1211,7 +1211,7 @@ config SERIAL_ALTERA_UART_CONSOLE
 	  Enable a Altera UART port to be the system console.
 
 config SERIAL_IFX6X60
-        tristate "SPI protocol driver for Infineon 6x60 modem (EXPERIMENTAL)"
+	tristate "SPI protocol driver for Infineon 6x60 modem (EXPERIMENTAL)"
 	depends on GPIOLIB || COMPILE_TEST
 	depends on SPI && HAS_DMA
 	help
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 40676be2e46a..3b591e294707 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -9,7 +9,7 @@ menu "Backlight & LCD device support"
 # LCD
 #
 config LCD_CLASS_DEVICE
-        tristate "Lowlevel LCD controls"
+	tristate "Lowlevel LCD controls"
 	help
 	  This framework adds support for low-level control of LCD.
 	  Some framebuffer devices connect to platform-specific LCD modules
@@ -141,10 +141,10 @@ endif # LCD_CLASS_DEVICE
 # Backlight
 #
 config BACKLIGHT_CLASS_DEVICE
-        tristate "Lowlevel Backlight controls"
+	tristate "Lowlevel Backlight controls"
 	help
 	  This framework adds support for low-level control of the LCD
-          backlight. This includes support for brightness and power.
+	  backlight. This includes support for brightness and power.
 
 	  To have support for your specific LCD panel you will have to
 	  select the proper drivers which depend on this option.
@@ -272,7 +272,7 @@ config BACKLIGHT_APPLE
        tristate "Apple Backlight Driver"
        depends on X86 && ACPI
        help
-         If you have an Intel-based Apple say Y to enable a driver for its
+	 If you have an Intel-based Apple say Y to enable a driver for its
 	 backlight.
 
 config BACKLIGHT_TOSA
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index c10e17fb9a9a..ac3a28c08f78 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -27,7 +27,7 @@ config VGACON_SOFT_SCROLLBACK
        depends on VGA_CONSOLE
        default n
        help
-         The scrollback buffer of the standard VGA console is located in
+	 The scrollback buffer of the standard VGA console is located in
 	 the VGA RAM.  The size of this RAM is fixed and is quite small.
 	 If you require a larger scrollback buffer, this can be placed in
 	 System RAM which is dynamically allocated during initialization.
@@ -84,12 +84,12 @@ config MDA_CONSOLE
 	  If unsure, say N.
 
 config SGI_NEWPORT_CONSOLE
-        tristate "SGI Newport Console support"
+	tristate "SGI Newport Console support"
 	depends on SGI_IP22 && HAS_IOMEM
-        select FONT_SUPPORT
-        help
-          Say Y here if you want the console on the Newport aka XL graphics
-          card of your Indy.  Most people say Y here.
+	select FONT_SUPPORT
+	help
+	  Say Y here if you want the console on the Newport aka XL graphics
+	  card of your Indy.  Most people say Y here.
 
 config DUMMY_CONSOLE
 	bool
@@ -97,24 +97,24 @@ config DUMMY_CONSOLE
 	default y
 
 config DUMMY_CONSOLE_COLUMNS
-        int "Initial number of console screen columns"
-        depends on DUMMY_CONSOLE && !ARM
-        default 160 if PARISC
-        default 80
-        help
-          On PA-RISC, the default value is 160, which should fit a 1280x1024
-          monitor.
-          Select 80 if you use a 640x480 resolution by default.
+	int "Initial number of console screen columns"
+	depends on DUMMY_CONSOLE && !ARM
+	default 160 if PARISC
+	default 80
+	help
+	  On PA-RISC, the default value is 160, which should fit a 1280x1024
+	  monitor.
+	  Select 80 if you use a 640x480 resolution by default.
 
 config DUMMY_CONSOLE_ROWS
-        int "Initial number of console screen rows"
-        depends on DUMMY_CONSOLE && !ARM
-        default 64 if PARISC
-        default 25
-        help
-          On PA-RISC, the default value is 64, which should fit a 1280x1024
-          monitor.
-          Select 25 if you use a 640x480 resolution by default.
+	int "Initial number of console screen rows"
+	depends on DUMMY_CONSOLE && !ARM
+	default 64 if PARISC
+	default 25
+	help
+	  On PA-RISC, the default value is 64, which should fit a 1280x1024
+	  monitor.
+	  Select 25 if you use a 640x480 resolution by default.
 
 config FRAMEBUFFER_CONSOLE
 	bool "Framebuffer Console support"
@@ -130,11 +130,11 @@ config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
        depends on FRAMEBUFFER_CONSOLE
        default n
        ---help---
-         If this option is selected, the framebuffer console will
-         automatically select the primary display device (if the architecture
+	 If this option is selected, the framebuffer console will
+	 automatically select the primary display device (if the architecture
 	 supports this feature).  Otherwise, the framebuffer console will
-         always select the first framebuffer driver that is loaded. The latter
-         is the default behavior.
+	 always select the first framebuffer driver that is loaded. The latter
+	 is the default behavior.
 
 	 You can always override the automatic selection of the primary device
 	 by using the fbcon=map: boot option.
@@ -145,11 +145,11 @@ config FRAMEBUFFER_CONSOLE_ROTATION
        bool "Framebuffer Console Rotation"
        depends on FRAMEBUFFER_CONSOLE
        help
-         Enable display rotation for the framebuffer console.  This is done
-         in software and may be significantly slower than a normally oriented
-         display.  Note that the rotation is done at the console level only
-         such that other users of the framebuffer will remain normally
-         oriented.
+	 Enable display rotation for the framebuffer console.  This is done
+	 in software and may be significantly slower than a normally oriented
+	 display.  Note that the rotation is done at the console level only
+	 such that other users of the framebuffer will remain normally
+	 oriented.
 
 config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	bool "Framebuffer Console Deferred Takeover"
@@ -163,14 +163,14 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	  black screen as soon as fbcon loads.
 
 config STI_CONSOLE
-        bool "STI text console"
+	bool "STI text console"
 	depends on PARISC && HAS_IOMEM
-        select FONT_SUPPORT
-        default y
-        help
-          The STI console is the builtin display/keyboard on HP-PARISC
-          machines.  Say Y here to build support for it into your kernel.
-          The alternative is to use your primary serial port as a console.
+	select FONT_SUPPORT
+	default y
+	help
+	  The STI console is the builtin display/keyboard on HP-PARISC
+	  machines.  Say Y here to build support for it into your kernel.
+	  The alternative is to use your primary serial port as a console.
 
 endmenu
 
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 363af2eaf2ba..cb5d2d89592f 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -18,17 +18,17 @@ config FSL_HV_MANAGER
 	depends on FSL_SOC
 	select EPAPR_PARAVIRT
 	help
-          The Freescale hypervisor management driver provides several services
+	  The Freescale hypervisor management driver provides several services
 	  to drivers and applications related to the Freescale hypervisor:
 
-          1) An ioctl interface for querying and managing partitions.
+	  1) An ioctl interface for querying and managing partitions.
 
-          2) A file interface to reading incoming doorbells.
+	  2) A file interface to reading incoming doorbells.
 
-          3) An interrupt handler for shutting down the partition upon
+	  3) An interrupt handler for shutting down the partition upon
 	     receiving the shutdown doorbell from a manager partition.
 
-          4) A kernel interface for receiving callbacks when a managed
+	  4) A kernel interface for receiving callbacks when a managed
 	     partition shuts down.
 
 source "drivers/virt/vboxguest/Kconfig"
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 078615cf2afc..29896374bf1b 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -29,17 +29,17 @@ config VIRTIO_PCI_LEGACY
 	default y
 	depends on VIRTIO_PCI
 	---help---
-          Virtio PCI Card 0.9.X Draft (circa 2014) and older device support.
+	  Virtio PCI Card 0.9.X Draft (circa 2014) and older device support.
 
 	  This option enables building a transitional driver, supporting
 	  both devices conforming to Virtio 1 specification, and legacy devices.
 	  If disabled, you get a slightly smaller, non-transitional driver,
 	  with no legacy compatibility.
 
-          So look out into your driveway.  Do you have a flying car?  If
-          so, you can happily disable this option and virtio will not
-          break.  Otherwise, leave it set.  Unless you're testing what
-          life will be like in The Future.
+	  So look out into your driveway.  Do you have a flying car?  If
+	  so, you can happily disable this option and virtio will not
+	  break.  Otherwise, leave it set.  Unless you're testing what
+	  life will be like in The Future.
 
 	  If unsure, say Y.
 
diff --git a/drivers/w1/slaves/Kconfig b/drivers/w1/slaves/Kconfig
index ebed495b9e69..035de04710d1 100644
--- a/drivers/w1/slaves/Kconfig
+++ b/drivers/w1/slaves/Kconfig
@@ -71,8 +71,8 @@ config W1_SLAVE_DS2805
 	help
 	  Say Y here if you want to use a 1-wire
 	  is a 112-byte user-programmable EEPROM is
-          organized as 7 pages of 16 bytes each with 64bit
-          unique number. Requires OverDrive Speed to talk to.
+	  organized as 7 pages of 16 bytes each with 64bit
+	  unique number. Requires OverDrive Speed to talk to.
 
 config W1_SLAVE_DS2431
 	tristate "1kb EEPROM family support (DS2431)"
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 79cc75096f42..d8c9bba57cae 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -110,12 +110,12 @@ config XEN_COMPAT_XENFS
        depends on XENFS
        default y
        help
-         The old xenstore userspace tools expect to find "xenbus"
-         under /proc/xen, but "xenbus" is now found at the root of the
-         xenfs filesystem.  Selecting this causes the kernel to create
-         the compatibility mount point /proc/xen if it is running on
-         a xen platform.
-         If in doubt, say yes.
+	 The old xenstore userspace tools expect to find "xenbus"
+	 under /proc/xen, but "xenbus" is now found at the root of the
+	 xenfs filesystem.  Selecting this causes the kernel to create
+	 the compatibility mount point /proc/xen if it is running on
+	 a xen platform.
+	 If in doubt, say yes.
 
 config XEN_SYS_HYPERVISOR
        bool "Create xen entries under /sys/hypervisor"
@@ -123,7 +123,7 @@ config XEN_SYS_HYPERVISOR
        select SYS_HYPERVISOR
        default y
        help
-         Create entries under /sys/hypervisor describing the Xen
+	 Create entries under /sys/hypervisor describing the Xen
 	 hypervisor environment.  When running native or in another
 	 virtual environment, /sys/hypervisor will still be present,
 	 but will have no xen contents.
@@ -270,7 +270,7 @@ config XEN_ACPI_PROCESSOR
 	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
-          This ACPI processor uploads Power Management information to the Xen
+	  This ACPI processor uploads Power Management information to the Xen
 	  hypervisor.
 
 	  To do that the driver parses the Power Management data and uploads
@@ -279,7 +279,7 @@ config XEN_ACPI_PROCESSOR
 	  SMM so that other drivers (such as ACPI cpufreq scaling driver) will
 	  not load.
 
-          To compile this driver as a module, choose M here: the module will be
+	  To compile this driver as a module, choose M here: the module will be
 	  called xen_acpi_processor  If you do not know what to choose, select
 	  M here. If the CPUFREQ drivers are built in, select Y here.
 
@@ -312,8 +312,8 @@ config XEN_SYMS
        depends on X86 && XEN_DOM0 && XENFS
        default y if KALLSYMS
        help
-          Exports hypervisor symbols (along with their types and addresses) via
-          /proc/xen/xensyms file, similar to /proc/kallsyms
+	  Exports hypervisor symbols (along with their types and addresses) via
+	  /proc/xen/xensyms file, similar to /proc/kallsyms
 
 config XEN_HAVE_VPMU
        bool
-- 
2.17.1

