Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89391DEEE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 14:19:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ExbwQcSB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCQ8Y0Rd9z3dWK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 22:19:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ExbwQcSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCPvG2gfmz3cB2;
	Mon,  1 Jul 2024 22:08:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 806B36123F;
	Mon,  1 Jul 2024 12:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC45C116B1;
	Mon,  1 Jul 2024 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719835685;
	bh=HVwXXjeqW3F17X4t5vl1Ng/d1Y6cdxnpbJ0stcVgsoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ExbwQcSBV1QX44LaIQPyXZwJrPmnu5/IqvdgB8EhoNeUq+6KJRX382Sryw51/DrNO
	 feTo57i6tNI/ASfdAZ55LlANoIelq8TLwIkUp2e7l0yYh+R1Yxqp9qVWOzveDqVdG0
	 e4ABx2/RXrapiNPE3XRWJdNyZcvLttWr0ZWLGDA8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: have match() callback in struct bus_type take a const *
Date: Mon,  1 Jul 2024 14:07:37 +0200
Message-ID: <2024070136-wrongdoer-busily-01e8@gregkh>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Lines: 2933
X-Developer-Signature: v=1; a=openpgp-sha256; l=120677; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=HVwXXjeqW3F17X4t5vl1Ng/d1Y6cdxnpbJ0stcVgsoQ=; b=owGbwMvMwCRo6H6F97bub03G02pJDGlNczhV5YrTvxpr6j/o3toe06uv18//t7fy2QVm8Szui V0dbO86YlkYBJkYZMUUWb5s4zm6v+KQopeh7WmYOaxMIEMYuDgFYCI/mBgWbGTtFuTMtHT2LJo6 s9pu48oXZtO9GBbs5L2V9aioPH23WV7cNbnlChfO6wYDAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jul 2024 22:19:06 +1000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the match() callback, the struct device_driver * should not be
changed, so change the function callback to be a const *.  This is one
step of many towards making the driver core safe to have struct
device_driver in read-only memory.

Because the match() callback is in all busses, all busses are modified
to handle this properly.  This does entail switching some container_of()
calls to container_of_const() to properly handle the constant *.

For some busses, like PCI and USB and HV, the const * is cast away in
the match callback as those busses do want to modify those structures at
this point in time (they have a local lock in the driver structure.)
That will have to be changed in the future if they wish to have their
struct device * in read-only-memory.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 - cc: list suppressed as it just touches too many different subsystems
   at once, sorry.  I tried to hit all of the mailing lists as a bcc:
   hopefully they don't reject it...

 arch/arm/common/locomo.c                      |  4 ++--
 arch/arm/include/asm/hardware/locomo.h        |  2 +-
 arch/parisc/include/asm/parisc-device.h       |  2 +-
 arch/parisc/kernel/drivers.c                  |  4 ++--
 arch/powerpc/include/asm/ps3.h                |  6 +-----
 arch/powerpc/include/asm/vio.h                |  6 +-----
 arch/powerpc/platforms/ps3/system-bus.c       |  4 ++--
 arch/powerpc/platforms/pseries/ibmebus.c      |  2 +-
 arch/powerpc/platforms/pseries/vio.c          |  6 +++---
 arch/s390/include/asm/ccwdev.h                |  2 +-
 arch/sparc/include/asm/vio.h                  |  6 +-----
 arch/sparc/kernel/vio.c                       |  4 ++--
 drivers/acpi/bus.c                            |  4 ++--
 drivers/amba/bus.c                            |  6 +++---
 drivers/base/auxiliary.c                      |  2 +-
 drivers/base/base.h                           |  3 +--
 drivers/base/cpu.c                            |  2 +-
 drivers/base/isa.c                            |  2 +-
 drivers/base/platform.c                       |  2 +-
 drivers/bcma/main.c                           |  6 +++---
 drivers/bus/fsl-mc/fsl-mc-bus.c               |  4 ++--
 drivers/bus/mhi/ep/main.c                     |  4 ++--
 drivers/bus/mhi/host/init.c                   |  4 ++--
 drivers/bus/mips_cdmm.c                       |  6 +++---
 drivers/bus/moxtet.c                          |  4 ++--
 drivers/bus/sunxi-rsb.c                       |  2 +-
 drivers/cdx/cdx.c                             |  4 ++--
 drivers/cxl/core/port.c                       |  2 +-
 drivers/cxl/cxl.h                             |  5 +----
 drivers/dax/bus.c                             | 17 +++++++----------
 drivers/dma/idxd/bus.c                        |  6 +++---
 drivers/eisa/eisa-bus.c                       |  4 ++--
 drivers/firewire/core-device.c                |  6 +++---
 drivers/firmware/arm_ffa/bus.c                |  2 +-
 drivers/firmware/arm_scmi/bus.c               |  6 +++---
 drivers/firmware/google/coreboot_table.c      |  6 +++---
 drivers/fpga/dfl.c                            |  4 ++--
 drivers/fsi/fsi-core.c                        |  4 ++--
 drivers/gpio/gpiolib.c                        |  2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c      |  2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  2 +-
 drivers/gpu/host1x/bus.c                      |  2 +-
 drivers/greybus/core.c                        |  4 ++--
 drivers/hid/hid-core.c                        |  2 +-
 drivers/hid/intel-ish-hid/ishtp/bus.c         |  2 +-
 drivers/hsi/hsi_core.c                        |  2 +-
 drivers/hv/vmbus_drv.c                        |  8 ++++----
 drivers/hwtracing/intel_th/core.c             |  4 ++--
 drivers/hwtracing/intel_th/intel_th.h         |  2 +-
 drivers/i2c/i2c-core-base.c                   |  4 ++--
 drivers/i3c/master.c                          |  4 ++--
 drivers/input/gameport/gameport.c             |  4 ++--
 drivers/input/rmi4/rmi_bus.c                  |  6 +++---
 drivers/input/rmi4/rmi_bus.h                  |  2 +-
 drivers/input/rmi4/rmi_driver.c               |  2 +-
 drivers/input/rmi4/rmi_driver.h               |  2 +-
 drivers/input/serio/serio.c                   |  4 ++--
 drivers/ipack/ipack.c                         |  6 +++---
 drivers/macintosh/macio_asic.c                |  2 +-
 drivers/mcb/mcb-core.c                        |  4 ++--
 drivers/media/pci/bt8xx/bttv-gpio.c           |  4 ++--
 drivers/media/pci/bt8xx/bttv.h                |  2 +-
 drivers/memstick/core/memstick.c              |  7 +++----
 drivers/mfd/mcp-core.c                        |  2 +-
 drivers/misc/mei/bus.c                        |  4 ++--
 drivers/misc/tifm_core.c                      |  6 +++---
 drivers/mmc/core/sdio_bus.c                   | 10 +++++-----
 drivers/most/core.c                           |  2 +-
 drivers/net/phy/mdio_bus.c                    |  4 ++--
 drivers/net/phy/mdio_device.c                 |  4 ++--
 drivers/net/phy/phy_device.c                  |  4 ++--
 drivers/ntb/ntb_transport.c                   |  2 +-
 drivers/nvdimm/bus.c                          |  6 +++---
 drivers/nvmem/layouts.c                       |  4 ++--
 drivers/pci/endpoint/pci-epf-core.c           |  4 ++--
 drivers/pci/pci-driver.c                      |  8 ++++----
 drivers/pcmcia/ds.c                           |  2 +-
 drivers/peci/core.c                           |  4 ++--
 drivers/peci/internal.h                       |  5 +----
 drivers/platform/surface/aggregator/bus.c     |  4 ++--
 drivers/platform/x86/wmi.c                    |  9 +++------
 drivers/pnp/driver.c                          |  6 +++---
 drivers/rapidio/rio-driver.c                  |  4 ++--
 drivers/rpmsg/rpmsg_core.c                    |  4 ++--
 drivers/rpmsg/rpmsg_internal.h                |  2 +-
 drivers/s390/cio/css.c                        |  4 ++--
 drivers/s390/cio/css.h                        |  2 +-
 drivers/s390/cio/device.c                     |  4 ++--
 drivers/s390/crypto/ap_bus.c                  |  4 ++--
 drivers/s390/crypto/ap_bus.h                  |  2 +-
 drivers/scsi/fcoe/fcoe_sysfs.c                |  2 +-
 drivers/scsi/scsi_sysfs.c                     |  6 +++---
 drivers/scsi/scsi_transport_iscsi.c           |  2 +-
 drivers/sh/maple/maple.c                      |  4 ++--
 drivers/siox/siox-core.c                      |  2 +-
 drivers/slimbus/core.c                        |  4 ++--
 drivers/soc/qcom/apr.c                        |  4 ++--
 drivers/soundwire/bus_type.c                  |  6 +++---
 drivers/spi/spi.c                             |  2 +-
 drivers/spmi/spmi.c                           |  2 +-
 drivers/ssb/main.c                            |  4 ++--
 .../staging/fieldbus/anybuss/anybuss-client.h |  6 +-----
 drivers/staging/fieldbus/anybuss/host.c       |  4 ++--
 drivers/staging/greybus/gbphy.c               |  2 +-
 .../interface/vchiq_arm/vchiq_bus.c           |  2 +-
 drivers/staging/vme_user/vme.c                |  2 +-
 drivers/tc/tc-driver.c                        |  6 +++---
 drivers/tee/tee_core.c                        |  2 +-
 drivers/thunderbolt/domain.c                  |  8 ++++----
 drivers/tty/serdev/core.c                     |  2 +-
 drivers/tty/serial/serial_base_bus.c          |  2 +-
 drivers/usb/common/ulpi.c                     |  2 +-
 drivers/usb/core/driver.c                     |  2 +-
 drivers/usb/gadget/udc/core.c                 |  2 +-
 drivers/usb/serial/bus.c                      |  2 +-
 drivers/usb/typec/bus.c                       |  2 +-
 drivers/vdpa/vdpa.c                           |  2 +-
 drivers/vfio/mdev/mdev_driver.c               |  2 +-
 drivers/virtio/virtio.c                       |  2 +-
 drivers/xen/xenbus/xenbus.h                   |  2 +-
 drivers/xen/xenbus/xenbus_probe.c             |  4 ++--
 include/acpi/acpi_bus.h                       |  2 +-
 include/linux/arm_ffa.h                       |  2 +-
 include/linux/cdx/cdx_bus.h                   |  2 +-
 include/linux/device/bus.h                    |  2 +-
 include/linux/dfl.h                           |  2 +-
 include/linux/eisa.h                          |  2 +-
 include/linux/fsi.h                           |  2 +-
 include/linux/fsl/mc.h                        |  2 +-
 include/linux/gameport.h                      |  2 +-
 include/linux/greybus.h                       |  2 +-
 include/linux/hyperv.h                        |  6 +-----
 include/linux/i2c.h                           |  2 +-
 include/linux/i3c/device.h                    |  5 +----
 include/linux/maple.h                         |  2 +-
 include/linux/mcb.h                           |  5 +----
 include/linux/mdio.h                          | 19 ++++++-------------
 include/linux/mhi.h                           |  2 +-
 include/linux/mhi_ep.h                        |  2 +-
 include/linux/moxtet.h                        |  9 ++-------
 include/linux/nd.h                            |  6 +-----
 include/linux/pci-epf.h                       |  3 +--
 include/linux/pci.h                           |  6 ++----
 include/linux/phy.h                           |  2 +-
 include/linux/pnp.h                           |  2 +-
 include/linux/rio.h                           |  2 +-
 include/linux/scmi_protocol.h                 |  2 +-
 include/linux/serio.h                         |  2 +-
 include/linux/slimbus.h                       |  2 +-
 include/linux/soc/qcom/apr.h                  |  2 +-
 include/linux/soundwire/sdw_type.h            |  2 +-
 include/linux/spi/spi.h                       |  6 ++----
 include/linux/ssb/ssb.h                       |  2 +-
 include/linux/tc.h                            |  2 +-
 include/linux/tee_drv.h                       |  2 +-
 include/linux/virtio.h                        |  5 +----
 include/scsi/scsi_transport_iscsi.h           |  2 +-
 include/sound/ac97/codec.h                    |  5 +----
 include/xen/xenbus.h                          |  5 +----
 net/iucv/iucv.c                               |  2 +-
 sound/ac97/bus.c                              |  4 ++--
 sound/core/seq_device.c                       |  4 ++--
 sound/hda/hda_bus_type.c                      |  2 +-
 163 files changed, 268 insertions(+), 338 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 6d0c9f7268ba..06b0e5fd54a6 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -816,10 +816,10 @@ EXPORT_SYMBOL(locomo_frontlight_set);
  *	We model this as a regular bus type, and hang devices directly
  *	off this.
  */
-static int locomo_match(struct device *_dev, struct device_driver *_drv)
+static int locomo_match(struct device *_dev, const struct device_driver *_drv)
 {
 	struct locomo_dev *dev = LOCOMO_DEV(_dev);
-	struct locomo_driver *drv = LOCOMO_DRV(_drv);
+	const struct locomo_driver *drv = LOCOMO_DRV(_drv);
 
 	return dev->devid == drv->devid;
 }
diff --git a/arch/arm/include/asm/hardware/locomo.h b/arch/arm/include/asm/hardware/locomo.h
index 9fd9ad5d9202..3190e1e5067a 100644
--- a/arch/arm/include/asm/hardware/locomo.h
+++ b/arch/arm/include/asm/hardware/locomo.h
@@ -189,7 +189,7 @@ struct locomo_driver {
 	void (*remove)(struct locomo_dev *);
 };
 
-#define LOCOMO_DRV(_d)	container_of((_d), struct locomo_driver, drv)
+#define LOCOMO_DRV(_d)	container_of_const((_d), struct locomo_driver, drv)
 
 #define LOCOMO_DRIVER_NAME(_ldev) ((_ldev)->dev.driver->name)
 
diff --git a/arch/parisc/include/asm/parisc-device.h b/arch/parisc/include/asm/parisc-device.h
index 7ddd7f433367..9e74cef4d774 100644
--- a/arch/parisc/include/asm/parisc-device.h
+++ b/arch/parisc/include/asm/parisc-device.h
@@ -41,7 +41,7 @@ struct parisc_driver {
 
 
 #define to_parisc_device(d)	container_of(d, struct parisc_device, dev)
-#define to_parisc_driver(d)	container_of(d, struct parisc_driver, drv)
+#define to_parisc_driver(d)	container_of_const(d, struct parisc_driver, drv)
 #define parisc_parent(d)	to_parisc_device(d->dev.parent)
 
 static inline const char *parisc_pathname(struct parisc_device *d)
diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index ac19d685e4a5..1e793f770f71 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -97,7 +97,7 @@ static int for_each_padev(int (*fn)(struct device *, void *), void * data)
  * @driver: the PA-RISC driver to try
  * @dev: the PA-RISC device to try
  */
-static int match_device(struct parisc_driver *driver, struct parisc_device *dev)
+static int match_device(const struct parisc_driver *driver, struct parisc_device *dev)
 {
 	const struct parisc_device_id *ids;
 
@@ -548,7 +548,7 @@ alloc_pa_dev(unsigned long hpa, struct hardware_path *mod_path)
 	return dev;
 }
 
-static int parisc_generic_match(struct device *dev, struct device_driver *drv)
+static int parisc_generic_match(struct device *dev, const struct device_driver *drv)
 {
 	return match_device(to_parisc_driver(drv), to_parisc_device(dev));
 }
diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index d13d8fdc3411..987e23a2bd28 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -390,11 +390,7 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev);
 int ps3_system_bus_driver_register(struct ps3_system_bus_driver *drv);
 void ps3_system_bus_driver_unregister(struct ps3_system_bus_driver *drv);
 
-static inline struct ps3_system_bus_driver *ps3_drv_to_system_bus_drv(
-	struct device_driver *_drv)
-{
-	return container_of(_drv, struct ps3_system_bus_driver, core);
-}
+#define ps3_drv_to_system_bus_drv(_drv) container_of_const(_drv, struct ps3_system_bus_driver, core)
 static inline struct ps3_system_bus_device *ps3_dev_to_system_bus_dev(
 	const struct device *_dev)
 {
diff --git a/arch/powerpc/include/asm/vio.h b/arch/powerpc/include/asm/vio.h
index 6faf2a931755..7c444150c5ad 100644
--- a/arch/powerpc/include/asm/vio.h
+++ b/arch/powerpc/include/asm/vio.h
@@ -156,11 +156,7 @@ static inline int vio_enable_interrupts(struct vio_dev *dev)
 }
 #endif
 
-static inline struct vio_driver *to_vio_driver(struct device_driver *drv)
-{
-	return container_of(drv, struct vio_driver, driver);
-}
-
+#define to_vio_driver(__drv)	container_of_const(__drv, struct vio_driver, driver)
 #define to_vio_dev(__dev)	container_of_const(__dev, struct vio_dev, dev)
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 56dc6b29a3e7..b9a7d9bae687 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -333,10 +333,10 @@ int ps3_mmio_region_init(struct ps3_system_bus_device *dev,
 EXPORT_SYMBOL_GPL(ps3_mmio_region_init);
 
 static int ps3_system_bus_match(struct device *_dev,
-	struct device_driver *_drv)
+	const struct device_driver *_drv)
 {
 	int result;
-	struct ps3_system_bus_driver *drv = ps3_drv_to_system_bus_drv(_drv);
+	const struct ps3_system_bus_driver *drv = ps3_drv_to_system_bus_drv(_drv);
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
 
 	if (!dev->match_sub_id)
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index b401282727a4..3436b0af795e 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -339,7 +339,7 @@ static struct attribute *ibmbus_bus_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ibmbus_bus);
 
-static int ibmebus_bus_bus_match(struct device *dev, struct device_driver *drv)
+static int ibmebus_bus_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct of_device_id *matches = drv->of_match_table;
 
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 36d1c7d4156b..ac1d2d2c9a88 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1576,10 +1576,10 @@ void vio_unregister_device(struct vio_dev *viodev)
 }
 EXPORT_SYMBOL(vio_unregister_device);
 
-static int vio_bus_match(struct device *dev, struct device_driver *drv)
+static int vio_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct vio_dev *vio_dev = to_vio_dev(dev);
-	struct vio_driver *vio_drv = to_vio_driver(drv);
+	const struct vio_driver *vio_drv = to_vio_driver(drv);
 	const struct vio_device_id *ids = vio_drv->id_table;
 
 	return (ids != NULL) && (vio_match_device(ids, vio_dev) != NULL);
@@ -1689,7 +1689,7 @@ struct vio_dev *vio_find_node(struct device_node *vnode)
 	/* construct the kobject name from the device node */
 	if (of_node_is_type(vnode_parent, "vdevice")) {
 		const __be32 *prop;
-		
+
 		prop = of_get_property(vnode, "reg", NULL);
 		if (!prop)
 			goto out;
diff --git a/arch/s390/include/asm/ccwdev.h b/arch/s390/include/asm/ccwdev.h
index 436365ff6c19..e3afcece375e 100644
--- a/arch/s390/include/asm/ccwdev.h
+++ b/arch/s390/include/asm/ccwdev.h
@@ -210,7 +210,7 @@ extern void ccw_device_get_id(struct ccw_device *, struct ccw_dev_id *);
 #define get_ccwdev_lock(x) (x)->ccwlock
 
 #define to_ccwdev(n) container_of(n, struct ccw_device, dev)
-#define to_ccwdrv(n) container_of(n, struct ccw_driver, driver)
+#define to_ccwdrv(n) container_of_const(n, struct ccw_driver, driver)
 
 extern struct ccw_device *ccw_device_create_console(struct ccw_driver *);
 extern void ccw_device_destroy_console(struct ccw_device *);
diff --git a/arch/sparc/include/asm/vio.h b/arch/sparc/include/asm/vio.h
index 587fb7841096..0ca8c3463166 100644
--- a/arch/sparc/include/asm/vio.h
+++ b/arch/sparc/include/asm/vio.h
@@ -483,11 +483,7 @@ int __vio_register_driver(struct vio_driver *drv, struct module *owner,
 	__vio_register_driver(driver, THIS_MODULE, KBUILD_MODNAME)
 void vio_unregister_driver(struct vio_driver *drv);
 
-static inline struct vio_driver *to_vio_driver(struct device_driver *drv)
-{
-	return container_of(drv, struct vio_driver, driver);
-}
-
+#define to_vio_driver(__drv)	container_of_const(__drv, struct vio_driver, driver)
 #define to_vio_dev(__dev)	container_of_const(__dev, struct vio_dev, dev)
 
 int vio_ldc_send(struct vio_driver_state *vio, void *data, int len);
diff --git a/arch/sparc/kernel/vio.c b/arch/sparc/kernel/vio.c
index 846a55f942d4..07933d75ac81 100644
--- a/arch/sparc/kernel/vio.c
+++ b/arch/sparc/kernel/vio.c
@@ -54,10 +54,10 @@ static int vio_hotplug(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
-static int vio_bus_match(struct device *dev, struct device_driver *drv)
+static int vio_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct vio_dev *vio_dev = to_vio_dev(dev);
-	struct vio_driver *vio_drv = to_vio_driver(drv);
+	const struct vio_driver *vio_drv = to_vio_driver(drv);
 	const struct vio_device_id *matches = vio_drv->id_table;
 
 	if (!matches)
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 787eca838410..d3e1457cba17 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1045,10 +1045,10 @@ EXPORT_SYMBOL(acpi_bus_unregister_driver);
                               ACPI Bus operations
    -------------------------------------------------------------------------- */
 
-static int acpi_bus_match(struct device *dev, struct device_driver *drv)
+static int acpi_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
-	struct acpi_driver *acpi_drv = to_acpi_driver(drv);
+	const struct acpi_driver *acpi_drv = to_acpi_driver(drv);
 
 	return acpi_dev->flags.match_driver
 		&& !acpi_match_device_ids(acpi_dev, acpi_drv->ids);
diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index aba3aa95b224..34bc880ca20b 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -26,7 +26,7 @@
 #include <linux/iommu.h>
 #include <linux/dma-map-ops.h>
 
-#define to_amba_driver(d)	container_of(d, struct amba_driver, drv)
+#define to_amba_driver(d)	container_of_const(d, struct amba_driver, drv)
 
 /* called on periphid match and class 0x9 coresight device. */
 static int
@@ -205,10 +205,10 @@ static int amba_read_periphid(struct amba_device *dev)
 	return ret;
 }
 
-static int amba_match(struct device *dev, struct device_driver *drv)
+static int amba_match(struct device *dev, const struct device_driver *drv)
 {
 	struct amba_device *pcdev = to_amba_device(dev);
-	struct amba_driver *pcdrv = to_amba_driver(drv);
+	const struct amba_driver *pcdrv = to_amba_driver(drv);
 
 	mutex_lock(&pcdev->periphid_lock);
 	if (!pcdev->periphid) {
diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index 5832e31bb77b..95408b7594fc 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -177,7 +177,7 @@ static const struct auxiliary_device_id *auxiliary_match_id(const struct auxilia
 	return NULL;
 }
 
-static int auxiliary_match(struct device *dev, struct device_driver *drv)
+static int auxiliary_match(struct device *dev, const struct device_driver *drv)
 {
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
 	const struct auxiliary_driver *auxdrv = to_auxiliary_drv(drv);
diff --git a/drivers/base/base.h b/drivers/base/base.h
index 8bef47afa3a9..0886f555d782 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -164,8 +164,7 @@ void device_set_deferred_probe_reason(const struct device *dev, struct va_format
 static inline int driver_match_device(const struct device_driver *drv,
 				      struct device *dev)
 {
-	/* cast will be removed in the future when match can handle a const pointer properly. */
-	return drv->bus->match ? drv->bus->match(dev, (struct device_driver *)drv) : 1;
+	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
 static inline void dev_sync_state(struct device *dev)
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index c61ecb0c2ae2..4901fbfca326 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -26,7 +26,7 @@
 
 static DEFINE_PER_CPU(struct device *, cpu_sys_devices);
 
-static int cpu_subsys_match(struct device *dev, struct device_driver *drv)
+static int cpu_subsys_match(struct device *dev, const struct device_driver *drv)
 {
 	/* ACPI style match is the only one that may succeed. */
 	if (acpi_driver_match_device(dev, drv))
diff --git a/drivers/base/isa.c b/drivers/base/isa.c
index e23d0b49a793..bfd9215c9070 100644
--- a/drivers/base/isa.c
+++ b/drivers/base/isa.c
@@ -23,7 +23,7 @@ struct isa_dev {
 
 #define to_isa_dev(x) container_of((x), struct isa_dev, dev)
 
-static int isa_bus_match(struct device *dev, struct device_driver *driver)
+static int isa_bus_match(struct device *dev, const struct device_driver *driver)
 {
 	struct isa_driver *isa_driver = to_isa_driver(driver);
 
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a6884479f4ac..8a511fe47bdb 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1332,7 +1332,7 @@ __ATTRIBUTE_GROUPS(platform_dev);
  * and compare it against the name of the driver. Return whether they match
  * or not.
  */
-static int platform_match(struct device *dev, struct device_driver *drv)
+static int platform_match(struct device *dev, const struct device_driver *drv)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct platform_driver *pdrv = to_platform_driver(drv);
diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 6b5d34919c72..6ecfc821cf83 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -26,7 +26,7 @@ static unsigned int bcma_bus_next_num;
 /* bcma_buses_mutex locks the bcma_bus_next_num */
 static DEFINE_MUTEX(bcma_buses_mutex);
 
-static int bcma_bus_match(struct device *dev, struct device_driver *drv);
+static int bcma_bus_match(struct device *dev, const struct device_driver *drv);
 static int bcma_device_probe(struct device *dev);
 static void bcma_device_remove(struct device *dev);
 static int bcma_device_uevent(const struct device *dev, struct kobj_uevent_env *env);
@@ -584,10 +584,10 @@ void bcma_driver_unregister(struct bcma_driver *drv)
 }
 EXPORT_SYMBOL_GPL(bcma_driver_unregister);
 
-static int bcma_bus_match(struct device *dev, struct device_driver *drv)
+static int bcma_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct bcma_device *core = container_of(dev, struct bcma_device, dev);
-	struct bcma_driver *adrv = container_of(drv, struct bcma_driver, drv);
+	const struct bcma_driver *adrv = container_of_const(drv, struct bcma_driver, drv);
 	const struct bcma_device_id *cid = &core->id;
 	const struct bcma_device_id *did;
 
diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 78b96cd63de9..dd68b8191a0a 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -80,11 +80,11 @@ static phys_addr_t mc_portal_base_phys_addr;
  *
  * Returns 1 on success, 0 otherwise.
  */
-static int fsl_mc_bus_match(struct device *dev, struct device_driver *drv)
+static int fsl_mc_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct fsl_mc_device_id *id;
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(drv);
+	const struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(drv);
 	bool found = false;
 
 	/* When driver_override is set, only bind to the matching driver */
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index f8f674adf1d4..b193c2d25621 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1694,10 +1694,10 @@ static int mhi_ep_uevent(const struct device *dev, struct kobj_uevent_env *env)
 					mhi_dev->name);
 }
 
-static int mhi_ep_match(struct device *dev, struct device_driver *drv)
+static int mhi_ep_match(struct device *dev, const struct device_driver *drv)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
-	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(drv);
+	const struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(drv);
 	const struct mhi_device_id *id;
 
 	/*
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 173f79918741..ce7d2e62c2f1 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1442,10 +1442,10 @@ static int mhi_uevent(const struct device *dev, struct kobj_uevent_env *env)
 					mhi_dev->name);
 }
 
-static int mhi_match(struct device *dev, struct device_driver *drv)
+static int mhi_match(struct device *dev, const struct device_driver *drv)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
-	struct mhi_driver *mhi_drv = to_mhi_driver(drv);
+	const struct mhi_driver *mhi_drv = to_mhi_driver(drv);
 	const struct mhi_device_id *id;
 
 	/*
diff --git a/drivers/bus/mips_cdmm.c b/drivers/bus/mips_cdmm.c
index 8baf14bd5eff..12dd32fd0b62 100644
--- a/drivers/bus/mips_cdmm.c
+++ b/drivers/bus/mips_cdmm.c
@@ -37,7 +37,7 @@
 /* Each block of device registers is 64 bytes */
 #define CDMM_DRB_SIZE		64
 
-#define to_mips_cdmm_driver(d)	container_of(d, struct mips_cdmm_driver, drv)
+#define to_mips_cdmm_driver(d)	container_of_const(d, struct mips_cdmm_driver, drv)
 
 /* Default physical base address */
 static phys_addr_t mips_cdmm_default_base;
@@ -59,10 +59,10 @@ mips_cdmm_lookup(const struct mips_cdmm_device_id *table,
 	return ret ? table : NULL;
 }
 
-static int mips_cdmm_match(struct device *dev, struct device_driver *drv)
+static int mips_cdmm_match(struct device *dev, const struct device_driver *drv)
 {
 	struct mips_cdmm_device *cdev = to_mips_cdmm_device(dev);
-	struct mips_cdmm_driver *cdrv = to_mips_cdmm_driver(drv);
+	const struct mips_cdmm_driver *cdrv = to_mips_cdmm_driver(drv);
 
 	return mips_cdmm_lookup(cdrv->id_table, cdev) != NULL;
 }
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 641c1a6adc8a..8412406c4f1d 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -83,10 +83,10 @@ static const struct attribute_group *moxtet_dev_groups[] = {
 	NULL,
 };
 
-static int moxtet_match(struct device *dev, struct device_driver *drv)
+static int moxtet_match(struct device *dev, const struct device_driver *drv)
 {
 	struct moxtet_device *mdev = to_moxtet_device(dev);
-	struct moxtet_driver *tdrv = to_moxtet_driver(drv);
+	const struct moxtet_driver *tdrv = to_moxtet_driver(drv);
 	const enum turris_mox_module_id *t;
 
 	if (of_driver_match_device(dev, drv))
diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 1e29ba76615d..a2a7576a33cc 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -130,7 +130,7 @@ struct sunxi_rsb {
 /* bus / slave device related functions */
 static const struct bus_type sunxi_rsb_bus;
 
-static int sunxi_rsb_device_match(struct device *dev, struct device_driver *drv)
+static int sunxi_rsb_device_match(struct device *dev, const struct device_driver *drv)
 {
 	return of_driver_match_device(dev, drv);
 }
diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index 236d381dc5f7..07371cb653d3 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -262,10 +262,10 @@ EXPORT_SYMBOL_GPL(cdx_clear_master);
  *
  * Return: true on success, false otherwise.
  */
-static int cdx_bus_match(struct device *dev, struct device_driver *drv)
+static int cdx_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct cdx_device *cdx_dev = to_cdx_device(dev);
-	struct cdx_driver *cdx_drv = to_cdx_driver(drv);
+	const struct cdx_driver *cdx_drv = to_cdx_driver(drv);
 	const struct cdx_device_id *found_id = NULL;
 	const struct cdx_device_id *ids;
 
diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index 887ed6e358fb..cb730050d3d4 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -2082,7 +2082,7 @@ static int cxl_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			      cxl_device_id(dev));
 }
 
-static int cxl_bus_match(struct device *dev, struct device_driver *drv)
+static int cxl_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	return cxl_device_id(dev) == to_cxl_drv(drv)->id;
 }
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index 603c0120cff8..65c91e133e26 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -823,10 +823,7 @@ struct cxl_driver {
 	int id;
 };
 
-static inline struct cxl_driver *to_cxl_drv(struct device_driver *drv)
-{
-	return container_of(drv, struct cxl_driver, drv);
-}
+#define to_cxl_drv(__drv)	container_of_const(__drv, struct cxl_driver, drv)
 
 int __cxl_driver_register(struct cxl_driver *cxl_drv, struct module *owner,
 			  const char *modname);
diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 3ef9550bd2ca..fde29e0ad68b 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -39,12 +39,9 @@ static int dax_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return add_uevent_var(env, "MODALIAS=" DAX_DEVICE_MODALIAS_FMT, 0);
 }
 
-static struct dax_device_driver *to_dax_drv(struct device_driver *drv)
-{
-	return container_of(drv, struct dax_device_driver, drv);
-}
+#define to_dax_drv(__drv)	container_of_const(__drv, struct dax_device_driver, drv)
 
-static struct dax_id *__dax_match_id(struct dax_device_driver *dax_drv,
+static struct dax_id *__dax_match_id(const struct dax_device_driver *dax_drv,
 		const char *dev_name)
 {
 	struct dax_id *dax_id;
@@ -57,7 +54,7 @@ static struct dax_id *__dax_match_id(struct dax_device_driver *dax_drv,
 	return NULL;
 }
 
-static int dax_match_id(struct dax_device_driver *dax_drv, struct device *dev)
+static int dax_match_id(const struct dax_device_driver *dax_drv, struct device *dev)
 {
 	int match;
 
@@ -68,7 +65,7 @@ static int dax_match_id(struct dax_device_driver *dax_drv, struct device *dev)
 	return match;
 }
 
-static int dax_match_type(struct dax_device_driver *dax_drv, struct device *dev)
+static int dax_match_type(const struct dax_device_driver *dax_drv, struct device *dev)
 {
 	enum dax_driver_type type = DAXDRV_DEVICE_TYPE;
 	struct dev_dax *dev_dax = to_dev_dax(dev);
@@ -156,7 +153,7 @@ static struct attribute *dax_drv_attrs[] = {
 };
 ATTRIBUTE_GROUPS(dax_drv);
 
-static int dax_bus_match(struct device *dev, struct device_driver *drv);
+static int dax_bus_match(struct device *dev, const struct device_driver *drv);
 
 /*
  * Static dax regions are regions created by an external subsystem
@@ -250,9 +247,9 @@ static const struct bus_type dax_bus_type = {
 	.drv_groups = dax_drv_groups,
 };
 
-static int dax_bus_match(struct device *dev, struct device_driver *drv)
+static int dax_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct dax_device_driver *dax_drv = to_dax_drv(drv);
+	const struct dax_device_driver *dax_drv = to_dax_drv(drv);
 
 	if (dax_match_id(dax_drv, dev))
 		return 1;
diff --git a/drivers/dma/idxd/bus.c b/drivers/dma/idxd/bus.c
index b83b27e04f2a..e647a684485d 100644
--- a/drivers/dma/idxd/bus.c
+++ b/drivers/dma/idxd/bus.c
@@ -33,10 +33,10 @@ void idxd_driver_unregister(struct idxd_device_driver *idxd_drv)
 EXPORT_SYMBOL_GPL(idxd_driver_unregister);
 
 static int idxd_config_bus_match(struct device *dev,
-				 struct device_driver *drv)
+				 const struct device_driver *drv)
 {
-	struct idxd_device_driver *idxd_drv =
-		container_of(drv, struct idxd_device_driver, drv);
+	const struct idxd_device_driver *idxd_drv =
+		container_of_const(drv, struct idxd_device_driver, drv);
 	struct idxd_dev *idxd_dev = confdev_to_idxd_dev(dev);
 	int i = 0;
 
diff --git a/drivers/eisa/eisa-bus.c b/drivers/eisa/eisa-bus.c
index 33f0ba11c6ad..cb586a362944 100644
--- a/drivers/eisa/eisa-bus.c
+++ b/drivers/eisa/eisa-bus.c
@@ -105,10 +105,10 @@ static char __init *decode_eisa_sig(unsigned long addr)
 	return sig_str;
 }
 
-static int eisa_bus_match(struct device *dev, struct device_driver *drv)
+static int eisa_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct eisa_device *edev = to_eisa_device(dev);
-	struct eisa_driver *edrv = to_eisa_driver(drv);
+	const struct eisa_driver *edrv = to_eisa_driver(drv);
 	const struct eisa_device_id *eids = edrv->id_table;
 
 	if (!eids)
diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index e6cdb905eeac..00e9a13e6c45 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -190,10 +190,10 @@ static bool match_ids(const struct ieee1394_device_id *id_table, int *id)
 }
 
 static const struct ieee1394_device_id *unit_match(struct device *dev,
-						   struct device_driver *drv)
+						   const struct device_driver *drv)
 {
 	const struct ieee1394_device_id *id_table =
-			container_of(drv, struct fw_driver, driver)->id_table;
+			container_of_const(drv, struct fw_driver, driver)->id_table;
 	int id[] = {0, 0, 0, 0};
 
 	get_modalias_ids(fw_unit(dev), id);
@@ -207,7 +207,7 @@ static const struct ieee1394_device_id *unit_match(struct device *dev,
 
 static bool is_fw_unit(const struct device *dev);
 
-static int fw_unit_match(struct device *dev, struct device_driver *drv)
+static int fw_unit_match(struct device *dev, const struct device_driver *drv)
 {
 	/* We only allow binding to fw_units. */
 	return is_fw_unit(dev) && unit_match(dev, drv) != NULL;
diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 2f557e90f2eb..62b0b8b919aa 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -19,7 +19,7 @@
 
 static DEFINE_IDA(ffa_bus_id);
 
-static int ffa_device_match(struct device *dev, struct device_driver *drv)
+static int ffa_device_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct ffa_device_id *id_table;
 	struct ffa_device *ffa_dev;
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 77c78be6e79c..96b2e5f9a8ef 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -207,7 +207,7 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 }
 
 static const struct scmi_device_id *
-scmi_dev_match_id(struct scmi_device *scmi_dev, struct scmi_driver *scmi_drv)
+scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_drv)
 {
 	const struct scmi_device_id *id = scmi_drv->id_table;
 
@@ -225,9 +225,9 @@ scmi_dev_match_id(struct scmi_device *scmi_dev, struct scmi_driver *scmi_drv)
 	return NULL;
 }
 
-static int scmi_dev_match(struct device *dev, struct device_driver *drv)
+static int scmi_dev_match(struct device *dev, const struct device_driver *drv)
 {
-	struct scmi_driver *scmi_drv = to_scmi_driver(drv);
+	const struct scmi_driver *scmi_drv = to_scmi_driver(drv);
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 	const struct scmi_device_id *id;
 
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index fa7752f6e89b..c179c4e85108 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -22,12 +22,12 @@
 #include "coreboot_table.h"
 
 #define CB_DEV(d) container_of(d, struct coreboot_device, dev)
-#define CB_DRV(d) container_of(d, struct coreboot_driver, drv)
+#define CB_DRV(d) container_of_const(d, struct coreboot_driver, drv)
 
-static int coreboot_bus_match(struct device *dev, struct device_driver *drv)
+static int coreboot_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct coreboot_device *device = CB_DEV(dev);
-	struct coreboot_driver *driver = CB_DRV(drv);
+	const struct coreboot_driver *driver = CB_DRV(drv);
 	const struct coreboot_device_id *id;
 
 	if (!driver->id_table)
diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
index 094ee97ea26c..c406b949026f 100644
--- a/drivers/fpga/dfl.c
+++ b/drivers/fpga/dfl.c
@@ -257,10 +257,10 @@ dfl_match_one_device(const struct dfl_device_id *id, struct dfl_device *ddev)
 	return NULL;
 }
 
-static int dfl_bus_match(struct device *dev, struct device_driver *drv)
+static int dfl_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct dfl_device *ddev = to_dfl_dev(dev);
-	struct dfl_driver *ddrv = to_dfl_drv(drv);
+	const struct dfl_driver *ddrv = to_dfl_drv(drv);
 	const struct dfl_device_id *id_entry;
 
 	id_entry = ddrv->id_table;
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 097d5a780264..46ac5a8beab7 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1361,10 +1361,10 @@ EXPORT_SYMBOL_GPL(fsi_master_unregister);
 
 /* FSI core & Linux bus type definitions */
 
-static int fsi_bus_match(struct device *dev, struct device_driver *drv)
+static int fsi_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
-	struct fsi_driver *fsi_drv = to_fsi_drv(drv);
+	const struct fsi_driver *fsi_drv = to_fsi_drv(drv);
 	const struct fsi_device_id *id;
 
 	if (!fsi_drv->id_table)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fa62367ee929..8c1c7cd365c7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -53,7 +53,7 @@ static DEFINE_IDA(gpio_ida);
 static dev_t gpio_devt;
 #define GPIO_DEV_MAX 256 /* 256 GPIO chip devices supported */
 
-static int gpio_bus_match(struct device *dev, struct device_driver *drv)
+static int gpio_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 
diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index 5afc26be9d2a..d810529ebfb6 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -36,7 +36,7 @@ struct dp_aux_ep_device_with_data {
  *
  * Return: True if this driver matches this device; false otherwise.
  */
-static int dp_aux_ep_match(struct device *dev, struct device_driver *drv)
+static int dp_aux_ep_match(struct device *dev, const struct device_driver *drv)
 {
 	return !!of_match_device(drv->of_match_table, dev);
 }
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 795001bb7ff1..ddd51279cc9a 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -48,7 +48,7 @@
  * subset of the MIPI DCS command set.
  */
 
-static int mipi_dsi_device_match(struct device *dev, struct device_driver *drv)
+static int mipi_dsi_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 7c52757a89db..8e09d6d328d2 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -333,7 +333,7 @@ static int host1x_del_client(struct host1x *host1x,
 	return -ENODEV;
 }
 
-static int host1x_device_match(struct device *dev, struct device_driver *drv)
+static int host1x_device_match(struct device *dev, const struct device_driver *drv)
 {
 	return strcmp(dev_name(dev), drv->name) == 0;
 }
diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 95c09d4f3a86..c5569563bd03 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -90,9 +90,9 @@ greybus_match_id(struct gb_bundle *bundle, const struct greybus_bundle_id *id)
 	return NULL;
 }
 
-static int greybus_match_device(struct device *dev, struct device_driver *drv)
+static int greybus_match_device(struct device *dev, const struct device_driver *drv)
 {
-	struct greybus_driver *driver = to_greybus_driver(drv);
+	const struct greybus_driver *driver = to_greybus_driver(drv);
 	struct gb_bundle *bundle;
 	const struct greybus_bundle_id *id;
 
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 74efda212c55..d7a1f8121006 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2562,7 +2562,7 @@ const struct hid_device_id *hid_match_device(struct hid_device *hdev,
 }
 EXPORT_SYMBOL_GPL(hid_match_device);
 
-static int hid_bus_match(struct device *dev, struct device_driver *drv)
+static int hid_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct hid_driver *hdrv = to_hid_driver(drv);
 	struct hid_device *hdev = to_hid_device(dev);
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 03d5601ce807..4a91577f6027 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -236,7 +236,7 @@ static int ishtp_cl_device_probe(struct device *dev)
  *
  * Return: 1 if dev & drv matches, 0 otherwise.
  */
-static int ishtp_cl_bus_match(struct device *dev, struct device_driver *drv)
+static int ishtp_cl_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct ishtp_cl_device *device = to_ishtp_cl_device(dev);
 	struct ishtp_cl_driver *driver = to_ishtp_cl_driver(drv);
diff --git a/drivers/hsi/hsi_core.c b/drivers/hsi/hsi_core.c
index e3beeac8aee5..8113cb9d4015 100644
--- a/drivers/hsi/hsi_core.c
+++ b/drivers/hsi/hsi_core.c
@@ -37,7 +37,7 @@ static int hsi_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
-static int hsi_bus_match(struct device *dev, struct device_driver *driver)
+static int hsi_bus_match(struct device *dev, const struct device_driver *driver)
 {
 	if (of_driver_match_device(dev, driver))
 		return true;
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 12a707ab73f8..c857dc3975be 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -685,7 +685,7 @@ static const struct hv_vmbus_device_id vmbus_device_null;
  * Return a matching hv_vmbus_device_id pointer.
  * If there is no match, return NULL.
  */
-static const struct hv_vmbus_device_id *hv_vmbus_get_id(struct hv_driver *drv,
+static const struct hv_vmbus_device_id *hv_vmbus_get_id(const struct hv_driver *drv,
 							struct hv_device *dev)
 {
 	const guid_t *guid = &dev->dev_type;
@@ -696,7 +696,7 @@ static const struct hv_vmbus_device_id *hv_vmbus_get_id(struct hv_driver *drv,
 		return NULL;
 
 	/* Look at the dynamic ids first, before the static ones */
-	id = hv_vmbus_dynid_match(drv, guid);
+	id = hv_vmbus_dynid_match((struct hv_driver *)drv, guid);
 	if (!id)
 		id = hv_vmbus_dev_match(drv->id_table, guid);
 
@@ -809,9 +809,9 @@ ATTRIBUTE_GROUPS(vmbus_drv);
 /*
  * vmbus_match - Attempt to match the specified device to the specified driver
  */
-static int vmbus_match(struct device *device, struct device_driver *driver)
+static int vmbus_match(struct device *device, const struct device_driver *driver)
 {
-	struct hv_driver *drv = drv_to_hv_drv(driver);
+	const struct hv_driver *drv = drv_to_hv_drv(driver);
 	struct hv_device *hv_dev = device_to_hv_device(device);
 
 	/* The hv_sock driver handles all hv_sock offers. */
diff --git a/drivers/hwtracing/intel_th/core.c b/drivers/hwtracing/intel_th/core.c
index a121dc5cbd61..d72993355473 100644
--- a/drivers/hwtracing/intel_th/core.c
+++ b/drivers/hwtracing/intel_th/core.c
@@ -26,9 +26,9 @@ module_param(host_mode, bool, 0444);
 
 static DEFINE_IDA(intel_th_ida);
 
-static int intel_th_match(struct device *dev, struct device_driver *driver)
+static int intel_th_match(struct device *dev, const struct device_driver *driver)
 {
-	struct intel_th_driver *thdrv = to_intel_th_driver(driver);
+	const struct intel_th_driver *thdrv = to_intel_th_driver(driver);
 	struct intel_th_device *thdev = to_intel_th_device(dev);
 
 	if (thdev->type == INTEL_TH_SWITCH &&
diff --git a/drivers/hwtracing/intel_th/intel_th.h b/drivers/hwtracing/intel_th/intel_th.h
index 6cbba733f259..3b87cd542c1b 100644
--- a/drivers/hwtracing/intel_th/intel_th.h
+++ b/drivers/hwtracing/intel_th/intel_th.h
@@ -189,7 +189,7 @@ struct intel_th_driver {
 };
 
 #define to_intel_th_driver(_d)					\
-	container_of((_d), struct intel_th_driver, driver)
+	container_of_const((_d), struct intel_th_driver, driver)
 
 #define to_intel_th_driver_or_null(_d)		\
 	((_d) ? to_intel_th_driver(_d) : NULL)
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index db0d1ac82910..0b1be9559d2d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -136,10 +136,10 @@ const void *i2c_get_match_data(const struct i2c_client *client)
 }
 EXPORT_SYMBOL(i2c_get_match_data);
 
-static int i2c_device_match(struct device *dev, struct device_driver *drv)
+static int i2c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
-	struct i2c_driver	*driver;
+	const struct i2c_driver	*driver;
 
 
 	/* Attempt an OF style match */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3b4d6a8edca3..00a3e9d01547 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -301,10 +301,10 @@ static const struct device_type i3c_device_type = {
 	.uevent = i3c_device_uevent,
 };
 
-static int i3c_device_match(struct device *dev, struct device_driver *drv)
+static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
-	struct i3c_driver *i3cdrv;
+	const struct i3c_driver *i3cdrv;
 
 	if (dev->type != &i3c_device_type)
 		return 0;
diff --git a/drivers/input/gameport/gameport.c b/drivers/input/gameport/gameport.c
index cfcc81c47b50..e77dd0740d27 100644
--- a/drivers/input/gameport/gameport.c
+++ b/drivers/input/gameport/gameport.c
@@ -806,9 +806,9 @@ void gameport_unregister_driver(struct gameport_driver *drv)
 }
 EXPORT_SYMBOL(gameport_unregister_driver);
 
-static int gameport_bus_match(struct device *dev, struct device_driver *drv)
+static int gameport_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct gameport_driver *gameport_drv = to_gameport_driver(drv);
+	const struct gameport_driver *gameport_drv = to_gameport_driver(drv);
 
 	return !gameport_drv->ignore;
 }
diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index 343030290d78..3aee04837205 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -144,9 +144,9 @@ bool rmi_is_function_device(struct device *dev)
 	return dev->type == &rmi_function_type;
 }
 
-static int rmi_function_match(struct device *dev, struct device_driver *drv)
+static int rmi_function_match(struct device *dev, const struct device_driver *drv)
 {
-	struct rmi_function_handler *handler = to_rmi_function_handler(drv);
+	const struct rmi_function_handler *handler = to_rmi_function_handler(drv);
 	struct rmi_function *fn = to_rmi_function(dev);
 
 	return fn->fd.function_number == handler->func;
@@ -333,7 +333,7 @@ EXPORT_SYMBOL_GPL(rmi_unregister_function_handler);
 
 /* Bus specific stuff */
 
-static int rmi_bus_match(struct device *dev, struct device_driver *drv)
+static int rmi_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	bool physical = rmi_is_physical_device(dev);
 
diff --git a/drivers/input/rmi4/rmi_bus.h b/drivers/input/rmi4/rmi_bus.h
index ea46ad9447ec..d4d0d82c69aa 100644
--- a/drivers/input/rmi4/rmi_bus.h
+++ b/drivers/input/rmi4/rmi_bus.h
@@ -87,7 +87,7 @@ struct rmi_function_handler {
 };
 
 #define to_rmi_function_handler(d) \
-		container_of(d, struct rmi_function_handler, driver)
+		container_of_const(d, struct rmi_function_handler, driver)
 
 int __must_check __rmi_register_function_handler(struct rmi_function_handler *,
 						 struct module *, const char *);
diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index ef9ea295f9e0..2168b6cd7167 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -1258,7 +1258,7 @@ static struct rmi_driver rmi_physical_driver = {
 	.set_input_params = rmi_driver_set_input_params,
 };
 
-bool rmi_is_physical_driver(struct device_driver *drv)
+bool rmi_is_physical_driver(const struct device_driver *drv)
 {
 	return drv == &rmi_physical_driver.driver;
 }
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 1c6c6086c0e5..3bfe9013043e 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -84,7 +84,7 @@ int rmi_register_desc_calc_reg_offset(
 bool rmi_register_desc_has_subpacket(const struct rmi_register_desc_item *item,
 			u8 subpacket);
 
-bool rmi_is_physical_driver(struct device_driver *);
+bool rmi_is_physical_driver(const struct device_driver *);
 int rmi_register_physical_driver(void);
 void rmi_unregister_physical_driver(void);
 void rmi_free_function_list(struct rmi_device *rmi_dev);
diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
index a8838b522627..36bf2c50d8e9 100644
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -877,10 +877,10 @@ static void serio_set_drv(struct serio *serio, struct serio_driver *drv)
 	serio_continue_rx(serio);
 }
 
-static int serio_bus_match(struct device *dev, struct device_driver *drv)
+static int serio_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct serio *serio = to_serio_port(dev);
-	struct serio_driver *serio_drv = to_serio_driver(drv);
+	const struct serio_driver *serio_drv = to_serio_driver(drv);
 
 	if (serio->manual_bind || serio_drv->manual_bind)
 		return 0;
diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
index 866bf48d803b..57d232c909f9 100644
--- a/drivers/ipack/ipack.c
+++ b/drivers/ipack/ipack.c
@@ -13,7 +13,7 @@
 #include <linux/ipack.h>
 
 #define to_ipack_dev(device) container_of(device, struct ipack_device, dev)
-#define to_ipack_driver(drv) container_of(drv, struct ipack_driver, driver)
+#define to_ipack_driver(drv) container_of_const(drv, struct ipack_driver, driver)
 
 static DEFINE_IDA(ipack_ida);
 
@@ -49,10 +49,10 @@ ipack_match_id(const struct ipack_device_id *ids, struct ipack_device *idev)
 	return NULL;
 }
 
-static int ipack_bus_match(struct device *dev, struct device_driver *drv)
+static int ipack_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct ipack_device *idev = to_ipack_dev(dev);
-	struct ipack_driver *idrv = to_ipack_driver(drv);
+	const struct ipack_driver *idrv = to_ipack_driver(drv);
 	const struct ipack_device_id *found_id;
 
 	found_id = ipack_match_id(idrv->id_table, idev);
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 565f1e21ff7d..13626205530d 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -36,7 +36,7 @@
 
 static struct macio_chip      *macio_on_hold;
 
-static int macio_bus_match(struct device *dev, struct device_driver *drv) 
+static int macio_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct of_device_id * matches = drv->of_match_table;
 
diff --git a/drivers/mcb/mcb-core.c b/drivers/mcb/mcb-core.c
index 267045b76505..91bbd948ee93 100644
--- a/drivers/mcb/mcb-core.c
+++ b/drivers/mcb/mcb-core.c
@@ -28,9 +28,9 @@ static const struct mcb_device_id *mcb_match_id(const struct mcb_device_id *ids,
 	return NULL;
 }
 
-static int mcb_match(struct device *dev, struct device_driver *drv)
+static int mcb_match(struct device *dev, const struct device_driver *drv)
 {
-	struct mcb_driver *mdrv = to_mcb_driver(drv);
+	const struct mcb_driver *mdrv = to_mcb_driver(drv);
 	struct mcb_device *mdev = to_mcb_device(dev);
 	const struct mcb_device_id *found_id;
 
diff --git a/drivers/media/pci/bt8xx/bttv-gpio.c b/drivers/media/pci/bt8xx/bttv-gpio.c
index 6b7fea50328c..59a6f160aac7 100644
--- a/drivers/media/pci/bt8xx/bttv-gpio.c
+++ b/drivers/media/pci/bt8xx/bttv-gpio.c
@@ -28,9 +28,9 @@
 /* ----------------------------------------------------------------------- */
 /* internal: the bttv "bus"                                                */
 
-static int bttv_sub_bus_match(struct device *dev, struct device_driver *drv)
+static int bttv_sub_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct bttv_sub_driver *sub = to_bttv_sub_drv(drv);
+	const struct bttv_sub_driver *sub = to_bttv_sub_drv(drv);
 	int len = strlen(sub->wanted);
 
 	if (0 == strncmp(dev_name(dev), sub->wanted, len))
diff --git a/drivers/media/pci/bt8xx/bttv.h b/drivers/media/pci/bt8xx/bttv.h
index eed7eeb3b963..97bbed980f98 100644
--- a/drivers/media/pci/bt8xx/bttv.h
+++ b/drivers/media/pci/bt8xx/bttv.h
@@ -341,7 +341,7 @@ struct bttv_sub_driver {
 	int                    (*probe)(struct bttv_sub_device *sub);
 	void                   (*remove)(struct bttv_sub_device *sub);
 };
-#define to_bttv_sub_drv(x) container_of((x), struct bttv_sub_driver, drv)
+#define to_bttv_sub_drv(x) container_of_const((x), struct bttv_sub_driver, drv)
 
 int bttv_sub_register(struct bttv_sub_driver *drv, char *wanted);
 int bttv_sub_unregister(struct bttv_sub_driver *drv);
diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
index 23fea51ecbdd..9a3a784054cc 100644
--- a/drivers/memstick/core/memstick.c
+++ b/drivers/memstick/core/memstick.c
@@ -38,13 +38,12 @@ static int memstick_dev_match(struct memstick_dev *card,
 	return 0;
 }
 
-static int memstick_bus_match(struct device *dev, struct device_driver *drv)
+static int memstick_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct memstick_dev *card = container_of(dev, struct memstick_dev,
 						 dev);
-	struct memstick_driver *ms_drv = container_of(drv,
-						      struct memstick_driver,
-						      driver);
+	const struct memstick_driver *ms_drv = container_of_const(drv, struct memstick_driver,
+								  driver);
 	struct memstick_device_id *ids = ms_drv->id_table;
 
 	if (ids) {
diff --git a/drivers/mfd/mcp-core.c b/drivers/mfd/mcp-core.c
index 16ca23311cab..be08eaee0a90 100644
--- a/drivers/mfd/mcp-core.c
+++ b/drivers/mfd/mcp-core.c
@@ -20,7 +20,7 @@
 #define to_mcp(d)		container_of(d, struct mcp, attached_device)
 #define to_mcp_driver(d)	container_of(d, struct mcp_driver, drv)
 
-static int mcp_bus_match(struct device *dev, struct device_driver *drv)
+static int mcp_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	return 1;
 }
diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 99393f610cdf..5576146ab13b 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -19,7 +19,7 @@
 #include "mei_dev.h"
 #include "client.h"
 
-#define to_mei_cl_driver(d) container_of(d, struct mei_cl_driver, driver)
+#define to_mei_cl_driver(d) container_of_const(d, struct mei_cl_driver, driver)
 
 /**
  * __mei_cl_send - internal client send (write)
@@ -1124,7 +1124,7 @@ struct mei_cl_device_id *mei_cl_device_find(const struct mei_cl_device *cldev,
  *
  * Return:  1 if matching device was found 0 otherwise
  */
-static int mei_cl_device_match(struct device *dev, struct device_driver *drv)
+static int mei_cl_device_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	const struct mei_cl_driver *cldrv = to_mei_cl_driver(drv);
diff --git a/drivers/misc/tifm_core.c b/drivers/misc/tifm_core.c
index fd9c3cbbc51e..12355d34e193 100644
--- a/drivers/misc/tifm_core.c
+++ b/drivers/misc/tifm_core.c
@@ -38,11 +38,11 @@ static int tifm_dev_match(struct tifm_dev *sock, struct tifm_device_id *id)
 	return 0;
 }
 
-static int tifm_bus_match(struct device *dev, struct device_driver *drv)
+static int tifm_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct tifm_dev *sock = container_of(dev, struct tifm_dev, dev);
-	struct tifm_driver *fm_drv = container_of(drv, struct tifm_driver,
-						  driver);
+	const struct tifm_driver *fm_drv = container_of_const(drv, struct tifm_driver,
+							      driver);
 	struct tifm_device_id *ids = fm_drv->id_table;
 
 	if (ids) {
diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
index c5fdfe2325f8..b66b637e2d57 100644
--- a/drivers/mmc/core/sdio_bus.c
+++ b/drivers/mmc/core/sdio_bus.c
@@ -26,7 +26,7 @@
 #include "sdio_cis.h"
 #include "sdio_bus.h"
 
-#define to_sdio_driver(d)	container_of(d, struct sdio_driver, drv)
+#define to_sdio_driver(d)	container_of_const(d, struct sdio_driver, drv)
 
 /* show configuration fields */
 #define sdio_config_attr(field, format_string, args...)			\
@@ -91,7 +91,7 @@ static const struct sdio_device_id *sdio_match_one(struct sdio_func *func,
 }
 
 static const struct sdio_device_id *sdio_match_device(struct sdio_func *func,
-	struct sdio_driver *sdrv)
+	const struct sdio_driver *sdrv)
 {
 	const struct sdio_device_id *ids;
 
@@ -108,10 +108,10 @@ static const struct sdio_device_id *sdio_match_device(struct sdio_func *func,
 	return NULL;
 }
 
-static int sdio_bus_match(struct device *dev, struct device_driver *drv)
+static int sdio_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
-	struct sdio_driver *sdrv = to_sdio_driver(drv);
+	const struct sdio_driver *sdrv = to_sdio_driver(drv);
 
 	if (sdio_match_device(func, sdrv))
 		return 1;
@@ -129,7 +129,7 @@ sdio_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			"SDIO_CLASS=%02X", func->class))
 		return -ENOMEM;
 
-	if (add_uevent_var(env, 
+	if (add_uevent_var(env,
 			"SDIO_ID=%04X:%04X", func->vendor, func->device))
 		return -ENOMEM;
 
diff --git a/drivers/most/core.c b/drivers/most/core.c
index f13d0e14a48b..304f0b457654 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -491,7 +491,7 @@ static int print_links(struct device *dev, void *data)
 	return 0;
 }
 
-static int most_match(struct device *dev, struct device_driver *drv)
+static int most_match(struct device *dev, const struct device_driver *drv)
 {
 	if (!strcmp(dev_name(dev), "most"))
 		return 0;
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 8b9ead76e40e..7e2f10182c0c 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -1375,9 +1375,9 @@ EXPORT_SYMBOL_GPL(mdiobus_c45_modify_changed);
  *   require calling the devices own match function, since different classes
  *   of MDIO devices have different match criteria.
  */
-static int mdio_bus_match(struct device *dev, struct device_driver *drv)
+static int mdio_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct mdio_driver *mdiodrv = to_mdio_driver(drv);
+	const struct mdio_driver *mdiodrv = to_mdio_driver(drv);
 	struct mdio_device *mdio = to_mdio_device(dev);
 
 	/* Both the driver and device must type-match */
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index 73f6539b9e50..e747ee63c665 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -35,10 +35,10 @@ static void mdio_device_release(struct device *dev)
 	kfree(to_mdio_device(dev));
 }
 
-int mdio_device_bus_match(struct device *dev, struct device_driver *drv)
+int mdio_device_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct mdio_device *mdiodev = to_mdio_device(dev);
-	struct mdio_driver *mdiodrv = to_mdio_driver(drv);
+	const struct mdio_driver *mdiodrv = to_mdio_driver(drv);
 
 	if (mdiodrv->mdiodrv.flags & MDIO_DEVICE_IS_PHY)
 		return 0;
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 6c6ec9475709..fc63299e4632 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -533,10 +533,10 @@ static int phy_scan_fixups(struct phy_device *phydev)
 	return 0;
 }
 
-static int phy_bus_match(struct device *dev, struct device_driver *drv)
+static int phy_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct phy_device *phydev = to_phy_device(dev);
-	struct phy_driver *phydrv = to_phy_driver(drv);
+	const struct phy_driver *phydrv = to_phy_driver(drv);
 	const int num_ids = ARRAY_SIZE(phydev->c45_ids.device_ids);
 	int i;
 
diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
index f9e7847a378e..77e55debeed6 100644
--- a/drivers/ntb/ntb_transport.c
+++ b/drivers/ntb/ntb_transport.c
@@ -284,7 +284,7 @@ static void ntb_memcpy_rx(struct ntb_queue_entry *entry, void *offset);
 
 
 static int ntb_transport_bus_match(struct device *dev,
-				   struct device_driver *drv)
+				   const struct device_driver *drv)
 {
 	return !strncmp(dev_name(dev), drv->name, strlen(drv->name));
 }
diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
index 101c425f3e8b..2237715e42eb 100644
--- a/drivers/nvdimm/bus.c
+++ b/drivers/nvdimm/bus.c
@@ -272,7 +272,7 @@ long nvdimm_clear_poison(struct device *dev, phys_addr_t phys,
 }
 EXPORT_SYMBOL_GPL(nvdimm_clear_poison);
 
-static int nvdimm_bus_match(struct device *dev, struct device_driver *drv);
+static int nvdimm_bus_match(struct device *dev, const struct device_driver *drv);
 
 static const struct bus_type nvdimm_bus_type = {
 	.name = "nd",
@@ -468,9 +468,9 @@ static struct nd_device_driver nd_bus_driver = {
 	},
 };
 
-static int nvdimm_bus_match(struct device *dev, struct device_driver *drv)
+static int nvdimm_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct nd_device_driver *nd_drv = to_nd_device_driver(drv);
+	const struct nd_device_driver *nd_drv = to_nd_device_driver(drv);
 
 	if (is_nvdimm_bus(dev) && nd_drv == &nd_bus_driver)
 		return true;
diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index 64dc7013a098..77a4119efea8 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -17,11 +17,11 @@
 #include "internals.h"
 
 #define to_nvmem_layout_driver(drv) \
-	(container_of((drv), struct nvmem_layout_driver, driver))
+	(container_of_const((drv), struct nvmem_layout_driver, driver))
 #define to_nvmem_layout_device(_dev) \
 	container_of((_dev), struct nvmem_layout, dev)
 
-static int nvmem_layout_bus_match(struct device *dev, struct device_driver *drv)
+static int nvmem_layout_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	return of_driver_match_device(dev, drv);
 }
diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index 323f2a60ab16..8fa2797d4169 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -488,10 +488,10 @@ pci_epf_match_id(const struct pci_epf_device_id *id, const struct pci_epf *epf)
 	return NULL;
 }
 
-static int pci_epf_device_match(struct device *dev, struct device_driver *drv)
+static int pci_epf_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct pci_epf *epf = to_pci_epf(dev);
-	struct pci_epf_driver *driver = to_pci_epf_driver(drv);
+	const struct pci_epf_driver *driver = to_pci_epf_driver(drv);
 
 	if (driver->id_table)
 		return !!pci_epf_match_id(driver->id_table, epf);
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index af2996d0d17f..f412ef73a6e4 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1503,7 +1503,7 @@ EXPORT_SYMBOL(pci_dev_driver);
  * system is in its list of supported devices. Returns the matching
  * pci_device_id structure or %NULL if there is no match.
  */
-static int pci_bus_match(struct device *dev, struct device_driver *drv)
+static int pci_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *pci_drv;
@@ -1512,7 +1512,7 @@ static int pci_bus_match(struct device *dev, struct device_driver *drv)
 	if (!pci_dev->match_driver)
 		return 0;
 
-	pci_drv = to_pci_driver(drv);
+	pci_drv = (struct pci_driver *)to_pci_driver(drv);
 	found_id = pci_match_device(pci_drv, pci_dev);
 	if (found_id)
 		return 1;
@@ -1688,10 +1688,10 @@ struct bus_type pci_bus_type = {
 EXPORT_SYMBOL(pci_bus_type);
 
 #ifdef CONFIG_PCIEPORTBUS
-static int pcie_port_bus_match(struct device *dev, struct device_driver *drv)
+static int pcie_port_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct pcie_device *pciedev;
-	struct pcie_port_service_driver *driver;
+	const struct pcie_port_service_driver *driver;
 
 	if (drv->bus != &pcie_port_bus_type || dev->bus != &pcie_port_bus_type)
 		return 0;
diff --git a/drivers/pcmcia/ds.c b/drivers/pcmcia/ds.c
index d3cfd353fb93..da6f66f357cc 100644
--- a/drivers/pcmcia/ds.c
+++ b/drivers/pcmcia/ds.c
@@ -900,7 +900,7 @@ static inline int pcmcia_devmatch(struct pcmcia_device *dev,
 }
 
 
-static int pcmcia_bus_match(struct device *dev, struct device_driver *drv)
+static int pcmcia_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct pcmcia_device *p_dev = to_pcmcia_dev(dev);
 	struct pcmcia_driver *p_drv = to_pcmcia_drv(drv);
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index 8f8bda2f2a62..289f0815a1c8 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -173,10 +173,10 @@ peci_bus_match_device_id(const struct peci_device_id *id, struct peci_device *de
 	return NULL;
 }
 
-static int peci_bus_device_match(struct device *dev, struct device_driver *drv)
+static int peci_bus_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct peci_device *device = to_peci_device(dev);
-	struct peci_driver *peci_drv = to_peci_driver(drv);
+	const struct peci_driver *peci_drv = to_peci_driver(drv);
 
 	if (dev->type != &peci_device_type)
 		return 0;
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 506bafcccbbf..d388dfdeb48e 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -98,10 +98,7 @@ struct peci_driver {
 	const struct peci_device_id *id_table;
 };
 
-static inline struct peci_driver *to_peci_driver(struct device_driver *d)
-{
-	return container_of(d, struct peci_driver, driver);
-}
+#define to_peci_driver(__drv)	container_of_const(__drv, struct peci_driver, driver)
 
 int __peci_driver_register(struct peci_driver *driver, struct module *owner,
 			   const char *mod_name);
diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
index 118caa651bec..af8d573aae93 100644
--- a/drivers/platform/surface/aggregator/bus.c
+++ b/drivers/platform/surface/aggregator/bus.c
@@ -306,9 +306,9 @@ const void *ssam_device_get_match_data(const struct ssam_device *dev)
 }
 EXPORT_SYMBOL_GPL(ssam_device_get_match_data);
 
-static int ssam_bus_match(struct device *dev, struct device_driver *drv)
+static int ssam_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct ssam_device_driver *sdrv = to_ssam_device_driver(drv);
+	const struct ssam_device_driver *sdrv = to_ssam_device_driver(drv);
 	struct ssam_device *sdev = to_ssam_device(dev);
 
 	if (!is_ssam_device(dev))
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index d21f3fa25823..389e7878e937 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -727,10 +727,7 @@ char *wmi_get_acpi_device_uid(const char *guid_string)
 }
 EXPORT_SYMBOL_GPL(wmi_get_acpi_device_uid);
 
-static inline struct wmi_driver *drv_to_wdrv(struct device_driver *drv)
-{
-	return container_of(drv, struct wmi_driver, driver);
-}
+#define drv_to_wdrv(__drv)	container_of_const(__drv, struct wmi_driver, driver)
 
 /*
  * sysfs interface
@@ -848,9 +845,9 @@ static void wmi_dev_release(struct device *dev)
 	kfree(wblock);
 }
 
-static int wmi_dev_match(struct device *dev, struct device_driver *driver)
+static int wmi_dev_match(struct device *dev, const struct device_driver *driver)
 {
-	struct wmi_driver *wmi_driver = drv_to_wdrv(driver);
+	const struct wmi_driver *wmi_driver = drv_to_wdrv(driver);
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	const struct wmi_device_id *id = wmi_driver->id_table;
 
diff --git a/drivers/pnp/driver.c b/drivers/pnp/driver.c
index 3483e52e3a81..7de7aabb275e 100644
--- a/drivers/pnp/driver.c
+++ b/drivers/pnp/driver.c
@@ -41,7 +41,7 @@ int compare_pnp_id(struct pnp_id *pos, const char *id)
 	return 0;
 }
 
-static const struct pnp_device_id *match_device(struct pnp_driver *drv,
+static const struct pnp_device_id *match_device(const struct pnp_driver *drv,
 						struct pnp_dev *dev)
 {
 	const struct pnp_device_id *drv_id = drv->id_table;
@@ -150,10 +150,10 @@ static void pnp_device_shutdown(struct device *dev)
 		drv->shutdown(pnp_dev);
 }
 
-static int pnp_bus_match(struct device *dev, struct device_driver *drv)
+static int pnp_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct pnp_dev *pnp_dev = to_pnp_dev(dev);
-	struct pnp_driver *pnp_drv = to_pnp_driver(drv);
+	const struct pnp_driver *pnp_drv = to_pnp_driver(drv);
 
 	if (match_device(pnp_drv, pnp_dev) == NULL)
 		return 0;
diff --git a/drivers/rapidio/rio-driver.c b/drivers/rapidio/rio-driver.c
index 1b3b4c2e015d..238250e69005 100644
--- a/drivers/rapidio/rio-driver.c
+++ b/drivers/rapidio/rio-driver.c
@@ -186,10 +186,10 @@ EXPORT_SYMBOL_GPL(rio_attach_device);
  *  there is a matching &struct rio_device_id or 0 if there is
  *  no match.
  */
-static int rio_match_bus(struct device *dev, struct device_driver *drv)
+static int rio_match_bus(struct device *dev, const struct device_driver *drv)
 {
 	struct rio_dev *rdev = to_rio_dev(dev);
-	struct rio_driver *rdrv = to_rio_driver(drv);
+	const struct rio_driver *rdrv = to_rio_driver(drv);
 	const struct rio_device_id *id = rdrv->id_table;
 	const struct rio_device_id *found_id;
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 0fa08266404d..712c06c02696 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -493,10 +493,10 @@ static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
 }
 
 /* match rpmsg channel and rpmsg driver */
-static int rpmsg_dev_match(struct device *dev, struct device_driver *drv)
+static int rpmsg_dev_match(struct device *dev, const struct device_driver *drv)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
-	struct rpmsg_driver *rpdrv = to_rpmsg_driver(drv);
+	const struct rpmsg_driver *rpdrv = to_rpmsg_driver(drv);
 	const struct rpmsg_device_id *ids = rpdrv->id_table;
 	unsigned int i;
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a3ba768138f1..42c7007be1b5 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -16,7 +16,7 @@
 #include <linux/poll.h>
 
 #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
-#define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
+#define to_rpmsg_driver(d) container_of_const(d, struct rpmsg_driver, drv)
 
 extern const struct class rpmsg_class;
 
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index 781f84901256..53b68f8c32f3 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -1354,10 +1354,10 @@ int sch_is_pseudo_sch(struct subchannel *sch)
 	return sch == to_css(sch->dev.parent)->pseudo_subchannel;
 }
 
-static int css_bus_match(struct device *dev, struct device_driver *drv)
+static int css_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct subchannel *sch = to_subchannel(dev);
-	struct css_driver *driver = to_cssdriver(drv);
+	const struct css_driver *driver = to_cssdriver(drv);
 	struct css_device_id *id;
 
 	/* When driver_override is set, only bind to the matching driver */
diff --git a/drivers/s390/cio/css.h b/drivers/s390/cio/css.h
index c2b175592bb7..a65a27dc520c 100644
--- a/drivers/s390/cio/css.h
+++ b/drivers/s390/cio/css.h
@@ -103,7 +103,7 @@ struct css_driver {
 	int (*settle)(void);
 };
 
-#define to_cssdriver(n) container_of(n, struct css_driver, drv)
+#define to_cssdriver(n) container_of_const(n, struct css_driver, drv)
 
 extern int css_driver_register(struct css_driver *);
 extern void css_driver_unregister(struct css_driver *);
diff --git a/drivers/s390/cio/device.c b/drivers/s390/cio/device.c
index 920f550bc313..b0f23242e171 100644
--- a/drivers/s390/cio/device.c
+++ b/drivers/s390/cio/device.c
@@ -58,10 +58,10 @@ static const struct bus_type ccw_bus_type;
  * subsystem driver and one channel system per machine, but
  * we still use the abstraction. T.R. says it's a good idea. */
 static int
-ccw_bus_match (struct device * dev, struct device_driver * drv)
+ccw_bus_match (struct device * dev, const struct device_driver * drv)
 {
 	struct ccw_device *cdev = to_ccwdev(dev);
-	struct ccw_driver *cdrv = to_ccwdrv(drv);
+	const struct ccw_driver *cdrv = to_ccwdrv(drv);
 	const struct ccw_device_id *ids = cdrv->ids, *found;
 
 	if (!ids)
diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index 898865be0dad..0998b17ecb37 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -552,9 +552,9 @@ static void ap_poll_thread_stop(void)
  *
  * AP bus driver registration/unregistration.
  */
-static int ap_bus_match(struct device *dev, struct device_driver *drv)
+static int ap_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct ap_driver *ap_drv = to_ap_drv(drv);
+	const struct ap_driver *ap_drv = to_ap_drv(drv);
 	struct ap_device_id *id;
 
 	/*
diff --git a/drivers/s390/crypto/ap_bus.h b/drivers/s390/crypto/ap_bus.h
index fdbc6fdfdf57..0b275c719319 100644
--- a/drivers/s390/crypto/ap_bus.h
+++ b/drivers/s390/crypto/ap_bus.h
@@ -158,7 +158,7 @@ struct ap_driver {
 				 struct ap_config_info *old_config_info);
 };
 
-#define to_ap_drv(x) container_of((x), struct ap_driver, driver)
+#define to_ap_drv(x) container_of_const((x), struct ap_driver, driver)
 
 int ap_driver_register(struct ap_driver *, struct module *, char *);
 void ap_driver_unregister(struct ap_driver *);
diff --git a/drivers/scsi/fcoe/fcoe_sysfs.c b/drivers/scsi/fcoe/fcoe_sysfs.c
index 453665ac6020..7d3b904af9e8 100644
--- a/drivers/scsi/fcoe/fcoe_sysfs.c
+++ b/drivers/scsi/fcoe/fcoe_sysfs.c
@@ -600,7 +600,7 @@ static const struct attribute_group *fcoe_fcf_attr_groups[] = {
 static const struct bus_type fcoe_bus_type;
 
 static int fcoe_bus_match(struct device *dev,
-			  struct device_driver *drv)
+			  const struct device_driver *drv)
 {
 	if (dev->bus == &fcoe_bus_type)
 		return 1;
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index b5aae4e8ae33..32f94db6d6bf 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -528,7 +528,7 @@ static struct class sdev_class = {
 };
 
 /* all probing is done in the individual ->probe routines */
-static int scsi_bus_match(struct device *dev, struct device_driver *gendrv)
+static int scsi_bus_match(struct device *dev, const struct device_driver *gendrv)
 {
 	struct scsi_device *sdp;
 
@@ -661,7 +661,7 @@ static int scsi_sdev_check_buf_bit(const char *buf)
 			return 1;
 		else if (buf[0] == '0')
 			return 0;
-		else 
+		else
 			return -EINVAL;
 	} else
 		return -EINVAL;
@@ -886,7 +886,7 @@ store_queue_type_field(struct device *dev, struct device_attribute *attr,
 
 	if (!sdev->tagged_supported)
 		return -EINVAL;
-		
+
 	sdev_printk(KERN_INFO, sdev,
 		    "ignoring write to deprecated queue_type attribute");
 	return count;
diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_transport_iscsi.c
index 93e1978ad564..fde7de3b1e55 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -1204,7 +1204,7 @@ static const struct device_type iscsi_flashnode_conn_dev_type = {
 static const struct bus_type iscsi_flashnode_bus;
 
 int iscsi_flashnode_bus_match(struct device *dev,
-				     struct device_driver *drv)
+			      const struct device_driver *drv)
 {
 	if (dev->bus == &iscsi_flashnode_bus)
 		return 1;
diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
index 16018009a5a6..6dc0549f7900 100644
--- a/drivers/sh/maple/maple.c
+++ b/drivers/sh/maple/maple.c
@@ -747,9 +747,9 @@ static int maple_get_dma_buffer(void)
 }
 
 static int maple_match_bus_driver(struct device *devptr,
-				  struct device_driver *drvptr)
+				  const struct device_driver *drvptr)
 {
-	struct maple_driver *maple_drv = to_maple_driver(drvptr);
+	const struct maple_driver *maple_drv = to_maple_driver(drvptr);
 	struct maple_device *maple_dev = to_maple_dev(devptr);
 
 	/* Trap empty port case */
diff --git a/drivers/siox/siox-core.c b/drivers/siox/siox-core.c
index 24a45920a240..f98f5a27e659 100644
--- a/drivers/siox/siox-core.c
+++ b/drivers/siox/siox-core.c
@@ -503,7 +503,7 @@ static const struct device_type siox_device_type = {
 	.release = siox_device_release,
 };
 
-static int siox_match(struct device *dev, struct device_driver *drv)
+static int siox_match(struct device *dev, const struct device_driver *drv)
 {
 	if (dev->type != &siox_device_type)
 		return 0;
diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 41e62de1f91f..65e5515f7555 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -30,10 +30,10 @@ static const struct slim_device_id *slim_match(const struct slim_device_id *id,
 	return NULL;
 }
 
-static int slim_device_match(struct device *dev, struct device_driver *drv)
+static int slim_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct slim_device *sbdev = to_slim_device(dev);
-	struct slim_driver *sbdrv = to_slim_driver(drv);
+	const struct slim_driver *sbdrv = to_slim_driver(drv);
 
 	/* Attempt an OF style match first */
 	if (of_driver_match_device(dev, drv))
diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 50749e870efa..4fbff3a890e2 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -338,10 +338,10 @@ static void apr_rxwq(struct work_struct *work)
 	}
 }
 
-static int apr_device_match(struct device *dev, struct device_driver *drv)
+static int apr_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct apr_device *adev = to_apr_device(dev);
-	struct apr_driver *adrv = to_apr_driver(drv);
+	const struct apr_driver *adrv = to_apr_driver(drv);
 	const struct apr_device_id *id = adrv->id_table;
 
 	/* Attempt an OF style match first */
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index c32faace618f..d928258c6761 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -19,7 +19,7 @@
  * struct sdw_device_id.
  */
 static const struct sdw_device_id *
-sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
+sdw_get_device_id(struct sdw_slave *slave, const struct sdw_driver *drv)
 {
 	const struct sdw_device_id *id;
 
@@ -35,10 +35,10 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 	return NULL;
 }
 
-static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
+static int sdw_bus_match(struct device *dev, const struct device_driver *ddrv)
 {
 	struct sdw_slave *slave;
-	struct sdw_driver *drv;
+	const struct sdw_driver *drv;
 	int ret = 0;
 
 	if (is_sdw_slave(dev)) {
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9bc9fd10d538..38a857024333 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -371,7 +371,7 @@ const void *spi_get_device_match_data(const struct spi_device *sdev)
 }
 EXPORT_SYMBOL_GPL(spi_get_device_match_data);
 
-static int spi_match_device(struct device *dev, struct device_driver *drv)
+static int spi_match_device(struct device *dev, const struct device_driver *drv)
 {
 	const struct spi_device	*spi = to_spi_device(dev);
 	const struct spi_driver	*sdrv = to_spi_driver(drv);
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 667085cb199d..fb0101da1485 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -43,7 +43,7 @@ static const struct device_type spmi_ctrl_type = {
 	.release	= spmi_ctrl_release,
 };
 
-static int spmi_device_match(struct device *dev, struct device_driver *drv)
+static int spmi_device_match(struct device *dev, const struct device_driver *drv)
 {
 	if (of_driver_match_device(dev, drv))
 		return 1;
diff --git a/drivers/ssb/main.c b/drivers/ssb/main.c
index 4da8848b3639..aa6165e3db4a 100644
--- a/drivers/ssb/main.c
+++ b/drivers/ssb/main.c
@@ -323,10 +323,10 @@ static int ssb_match_devid(const struct ssb_device_id *tabid,
 	return 1;
 }
 
-static int ssb_bus_match(struct device *dev, struct device_driver *drv)
+static int ssb_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct ssb_device *ssb_dev = dev_to_ssb_dev(dev);
-	struct ssb_driver *ssb_drv = drv_to_ssb_drv(drv);
+	const struct ssb_driver *ssb_drv = drv_to_ssb_drv(drv);
 	const struct ssb_device_id *id;
 
 	for (id = ssb_drv->id_table;
diff --git a/drivers/staging/fieldbus/anybuss/anybuss-client.h b/drivers/staging/fieldbus/anybuss/anybuss-client.h
index a219688006fe..c21c4bebfb84 100644
--- a/drivers/staging/fieldbus/anybuss/anybuss-client.h
+++ b/drivers/staging/fieldbus/anybuss/anybuss-client.h
@@ -44,11 +44,7 @@ static inline struct anybuss_client *to_anybuss_client(struct device *dev)
 	return container_of(dev, struct anybuss_client, dev);
 }
 
-static inline struct anybuss_client_driver *
-to_anybuss_client_driver(struct device_driver *drv)
-{
-	return container_of(drv, struct anybuss_client_driver, driver);
-}
+#define to_anybuss_client_driver(__drv) container_of_const(__drv, struct anybuss_client_driver, driver)
 
 static inline void *
 anybuss_get_drvdata(const struct anybuss_client *client)
diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
index 410e6f8073c0..4f2b2fce92ee 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1166,9 +1166,9 @@ EXPORT_SYMBOL_GPL(anybuss_recv_msg);
 /* ------------------------ bus functions ------------------------ */
 
 static int anybus_bus_match(struct device *dev,
-			    struct device_driver *drv)
+			    const struct device_driver *drv)
 {
-	struct anybuss_client_driver *adrv =
+	const struct anybuss_client_driver *adrv =
 		to_anybuss_client_driver(drv);
 	struct anybuss_client *adev =
 		to_anybuss_client(dev);
diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index d827f03f5253..fe4f76da7f9c 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -117,7 +117,7 @@ gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
 	return NULL;
 }
 
-static int gbphy_dev_match(struct device *dev, struct device_driver *drv)
+static int gbphy_dev_match(struct device *dev, const struct device_driver *drv)
 {
 	struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 3f87b93c6537..41ece91ab88a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -14,7 +14,7 @@
 #include "vchiq_arm.h"
 #include "vchiq_bus.h"
 
-static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
+static int vchiq_bus_type_match(struct device *dev, const struct device_driver *drv)
 {
 	if (dev->bus == &vchiq_bus_type &&
 	    strcmp(dev_name(dev), drv->name) == 0)
diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 0cd370ab1008..9a091463656d 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1931,7 +1931,7 @@ EXPORT_SYMBOL(vme_unregister_driver);
 
 /* - Bus Registration ------------------------------------------------------ */
 
-static int vme_bus_match(struct device *dev, struct device_driver *drv)
+static int vme_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct vme_driver *vme_drv;
 
diff --git a/drivers/tc/tc-driver.c b/drivers/tc/tc-driver.c
index 1c9d983a5a1f..2f6d147594b0 100644
--- a/drivers/tc/tc-driver.c
+++ b/drivers/tc/tc-driver.c
@@ -56,7 +56,7 @@ EXPORT_SYMBOL(tc_unregister_driver);
  * system is in its list of supported devices.  Returns the matching
  * tc_device_id structure or %NULL if there is no match.
  */
-static const struct tc_device_id *tc_match_device(struct tc_driver *tdrv,
+static const struct tc_device_id *tc_match_device(const struct tc_driver *tdrv,
 						  struct tc_dev *tdev)
 {
 	const struct tc_device_id *id = tdrv->id_table;
@@ -82,10 +82,10 @@ static const struct tc_device_id *tc_match_device(struct tc_driver *tdrv,
  * system is in its list of supported devices.  Returns 1 if there
  * is a match or 0 otherwise.
  */
-static int tc_bus_match(struct device *dev, struct device_driver *drv)
+static int tc_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct tc_dev *tdev = to_tc_dev(dev);
-	struct tc_driver *tdrv = to_tc_driver(drv);
+	const struct tc_driver *tdrv = to_tc_driver(drv);
 	const struct tc_device_id *id;
 
 	id = tc_match_device(tdrv, tdev);
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 82ad095d2b1c..d52e879b204e 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1201,7 +1201,7 @@ int tee_client_cancel_req(struct tee_context *ctx,
 }
 
 static int tee_client_device_match(struct device *dev,
-				   struct device_driver *drv)
+				   const struct device_driver *drv)
 {
 	const struct tee_client_device_id *id_table;
 	struct tee_client_device *tee_device;
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 0023017299f7..144d0232a70c 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -45,9 +45,9 @@ static bool match_service_id(const struct tb_service_id *id,
 }
 
 static const struct tb_service_id *__tb_service_match(struct device *dev,
-						      struct device_driver *drv)
+						      const struct device_driver *drv)
 {
-	struct tb_service_driver *driver;
+	const struct tb_service_driver *driver;
 	const struct tb_service_id *ids;
 	struct tb_service *svc;
 
@@ -55,7 +55,7 @@ static const struct tb_service_id *__tb_service_match(struct device *dev,
 	if (!svc)
 		return NULL;
 
-	driver = container_of(drv, struct tb_service_driver, driver);
+	driver = container_of_const(drv, struct tb_service_driver, driver);
 	if (!driver->id_table)
 		return NULL;
 
@@ -67,7 +67,7 @@ static const struct tb_service_id *__tb_service_match(struct device *dev,
 	return NULL;
 }
 
-static int tb_service_match(struct device *dev, struct device_driver *drv)
+static int tb_service_match(struct device *dev, const struct device_driver *drv)
 {
 	return !!__tb_service_match(dev, drv);
 }
diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 613cb356b918..8913cdd675f6 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -85,7 +85,7 @@ static const struct device_type serdev_ctrl_type = {
 	.release	= serdev_ctrl_release,
 };
 
-static int serdev_device_match(struct device *dev, struct device_driver *drv)
+static int serdev_device_match(struct device *dev, const struct device_driver *drv)
 {
 	if (!is_serdev_device(dev))
 		return 0;
diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
index 73c6ee540c83..e0d15dac7b9b 100644
--- a/drivers/tty/serial/serial_base_bus.c
+++ b/drivers/tty/serial/serial_base_bus.c
@@ -29,7 +29,7 @@ static const struct device_type serial_port_type = {
 	.name = "port",
 };
 
-static int serial_base_match(struct device *dev, struct device_driver *drv)
+static int serial_base_match(struct device *dev, const struct device_driver *drv)
 {
 	if (dev->type == &serial_ctrl_type &&
 	    str_has_prefix(drv->name, serial_ctrl_type.name))
diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index 0886b19d2e1c..4a2ee447b213 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -34,7 +34,7 @@ EXPORT_SYMBOL_GPL(ulpi_write);
 
 /* -------------------------------------------------------------------------- */
 
-static int ulpi_match(struct device *dev, struct device_driver *driver)
+static int ulpi_match(struct device *dev, const struct device_driver *driver)
 {
 	struct ulpi_driver *drv = to_ulpi_driver(driver);
 	struct ulpi *ulpi = to_ulpi_dev(dev);
diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index e02ba15f6e34..8e9bafcd62c6 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -855,7 +855,7 @@ bool usb_driver_applicable(struct usb_device *udev,
 	return false;
 }
 
-static int usb_device_match(struct device *dev, struct device_driver *drv)
+static int usb_device_match(struct device *dev, const struct device_driver *drv)
 {
 	/* devices and interfaces are handled separately */
 	if (is_usb_device(dev)) {
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 2dfae7a17b3f..b0a613758414 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1568,7 +1568,7 @@ EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
 /* ------------------------------------------------------------------------- */
 
-static int gadget_match_driver(struct device *dev, struct device_driver *drv)
+static int gadget_match_driver(struct device *dev, const struct device_driver *drv)
 {
 	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
 	struct usb_udc *udc = gadget->udc;
diff --git a/drivers/usb/serial/bus.c b/drivers/usb/serial/bus.c
index 6c812d01b37d..d200e2c29a8f 100644
--- a/drivers/usb/serial/bus.c
+++ b/drivers/usb/serial/bus.c
@@ -14,7 +14,7 @@
 #include <linux/usb/serial.h>
 
 static int usb_serial_device_match(struct device *dev,
-						struct device_driver *drv)
+				   const struct device_driver *drv)
 {
 	const struct usb_serial_port *port = to_usb_serial_port(dev);
 	struct usb_serial_driver *driver = to_usb_serial_driver(drv);
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 6ea103e1abae..aa879253d3b8 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -447,7 +447,7 @@ static struct attribute *typec_attrs[] = {
 };
 ATTRIBUTE_GROUPS(typec);
 
-static int typec_match(struct device *dev, struct device_driver *driver)
+static int typec_match(struct device *dev, const struct device_driver *driver)
 {
 	struct typec_altmode_driver *drv = to_altmode_driver(driver);
 	struct typec_altmode *altmode = to_typec_altmode(dev);
diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 8d391947eb8d..3813ec493d9d 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -65,7 +65,7 @@ static void vdpa_dev_remove(struct device *d)
 		drv->remove(vdev);
 }
 
-static int vdpa_dev_match(struct device *dev, struct device_driver *drv)
+static int vdpa_dev_match(struct device *dev, const struct device_driver *drv)
 {
 	struct vdpa_device *vdev = dev_to_vdpa(dev);
 
diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index b98322966b3e..ad5b834806ff 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -31,7 +31,7 @@ static void mdev_remove(struct device *dev)
 		drv->remove(to_mdev_device(dev));
 }
 
-static int mdev_match(struct device *dev, struct device_driver *drv)
+static int mdev_match(struct device *dev, const struct device_driver *drv)
 {
 	/*
 	 * No drivers automatically match. Drivers are only bound by explicit
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index b968b2aa5f4d..bc0218f15a1e 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -82,7 +82,7 @@ static inline int virtio_id_match(const struct virtio_device *dev,
 
 /* This looks through all the IDs a driver claims to support.  If any of them
  * match, we return 1 and the kernel will call virtio_dev_probe(). */
-static int virtio_dev_match(struct device *_dv, struct device_driver *_dr)
+static int virtio_dev_match(struct device *_dv, const struct device_driver *_dr)
 {
 	unsigned int i;
 	struct virtio_device *dev = dev_to_virtio(_dv);
diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index 2754bdfadcb8..13821e7e825e 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -104,7 +104,7 @@ void xb_deinit_comms(void);
 int xs_watch_msg(struct xs_watch_event *event);
 void xs_request_exit(struct xb_req_data *req);
 
-int xenbus_match(struct device *_dev, struct device_driver *_drv);
+int xenbus_match(struct device *_dev, const struct device_driver *_drv);
 int xenbus_dev_probe(struct device *_dev);
 void xenbus_dev_remove(struct device *_dev);
 int xenbus_register_driver_common(struct xenbus_driver *drv,
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 1a9ded0cddcb..9f097f1f4a4c 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -94,9 +94,9 @@ match_device(const struct xenbus_device_id *arr, struct xenbus_device *dev)
 	return NULL;
 }
 
-int xenbus_match(struct device *_dev, struct device_driver *_drv)
+int xenbus_match(struct device *_dev, const struct device_driver *_drv)
 {
-	struct xenbus_driver *drv = to_xenbus_driver(_drv);
+	const struct xenbus_driver *drv = to_xenbus_driver(_drv);
 
 	if (!drv->ids)
 		return 0;
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 1a4dfd7a1c4a..08d27a1a0072 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -562,7 +562,7 @@ static inline void *acpi_driver_data(struct acpi_device *d)
 }
 
 #define to_acpi_device(d)	container_of(d, struct acpi_device, dev)
-#define to_acpi_driver(d)	container_of(d, struct acpi_driver, drv)
+#define to_acpi_driver(d)	container_of_const(d, struct acpi_driver, drv)
 
 static inline struct acpi_device *acpi_dev_parent(struct acpi_device *adev)
 {
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index c82d56768101..ae70704bfa90 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -149,7 +149,7 @@ struct ffa_driver {
 	struct device_driver driver;
 };
 
-#define to_ffa_driver(d) container_of(d, struct ffa_driver, driver)
+#define to_ffa_driver(d) container_of_const(d, struct ffa_driver, driver)
 
 static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *data)
 {
diff --git a/include/linux/cdx/cdx_bus.h b/include/linux/cdx/cdx_bus.h
index b57118aaa679..79bb80e56790 100644
--- a/include/linux/cdx/cdx_bus.h
+++ b/include/linux/cdx/cdx_bus.h
@@ -211,7 +211,7 @@ struct cdx_driver {
 };
 
 #define to_cdx_driver(_drv) \
-	container_of(_drv, struct cdx_driver, driver)
+	container_of_const(_drv, struct cdx_driver, driver)
 
 /* Macro to avoid include chaining to get THIS_MODULE */
 #define cdx_driver_register(drv) \
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 5ef4ec1c36c3..807831d6bf0f 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -81,7 +81,7 @@ struct bus_type {
 	const struct attribute_group **dev_groups;
 	const struct attribute_group **drv_groups;
 
-	int (*match)(struct device *dev, struct device_driver *drv);
+	int (*match)(struct device *dev, const struct device_driver *drv);
 	int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
 	int (*probe)(struct device *dev);
 	void (*sync_state)(struct device *dev);
diff --git a/include/linux/dfl.h b/include/linux/dfl.h
index 0a7a00a0ee7f..1f02db0c1897 100644
--- a/include/linux/dfl.h
+++ b/include/linux/dfl.h
@@ -71,7 +71,7 @@ struct dfl_driver {
 };
 
 #define to_dfl_dev(d) container_of(d, struct dfl_device, dev)
-#define to_dfl_drv(d) container_of(d, struct dfl_driver, drv)
+#define to_dfl_drv(d) container_of_const(d, struct dfl_driver, drv)
 
 /*
  * use a macro to avoid include chaining to get THIS_MODULE.
diff --git a/include/linux/eisa.h b/include/linux/eisa.h
index b012e30afebd..f98200cae637 100644
--- a/include/linux/eisa.h
+++ b/include/linux/eisa.h
@@ -60,7 +60,7 @@ struct eisa_driver {
 	struct device_driver         driver;
 };
 
-#define to_eisa_driver(drv) container_of(drv,struct eisa_driver, driver)
+#define to_eisa_driver(drv) container_of_const(drv,struct eisa_driver, driver)
 
 /* These external functions are only available when EISA support is enabled. */
 #ifdef CONFIG_EISA
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 3df8c54868df..8c5eef808788 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -44,7 +44,7 @@ struct fsi_driver {
 };
 
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
-#define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
+#define to_fsi_drv(drvp) container_of_const(drvp, struct fsi_driver, drv)
 
 extern int fsi_driver_register(struct fsi_driver *fsi_drv);
 extern void fsi_driver_unregister(struct fsi_driver *fsi_drv);
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index a1b3de87a3d1..083c860fd28e 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -56,7 +56,7 @@ struct fsl_mc_driver {
 };
 
 #define to_fsl_mc_driver(_drv) \
-	container_of(_drv, struct fsl_mc_driver, driver)
+	container_of_const(_drv, struct fsl_mc_driver, driver)
 
 /**
  * enum fsl_mc_pool_type - Types of allocatable MC bus resources
diff --git a/include/linux/gameport.h b/include/linux/gameport.h
index 07e370113b2b..86d62fdafd7a 100644
--- a/include/linux/gameport.h
+++ b/include/linux/gameport.h
@@ -58,7 +58,7 @@ struct gameport_driver {
 
 	bool ignore;
 };
-#define to_gameport_driver(d)	container_of(d, struct gameport_driver, driver)
+#define to_gameport_driver(d)	container_of_const(d, struct gameport_driver, driver)
 
 int gameport_open(struct gameport *gameport, struct gameport_driver *drv, int mode);
 void gameport_close(struct gameport *gameport);
diff --git a/include/linux/greybus.h b/include/linux/greybus.h
index 634c9511cf78..4d58e27ceaf6 100644
--- a/include/linux/greybus.h
+++ b/include/linux/greybus.h
@@ -64,7 +64,7 @@ struct greybus_driver {
 
 	struct device_driver driver;
 };
-#define to_greybus_driver(d) container_of(d, struct greybus_driver, driver)
+#define to_greybus_driver(d) container_of_const(d, struct greybus_driver, driver)
 
 static inline void greybus_set_drvdata(struct gb_bundle *bundle, void *data)
 {
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 5e39baa7f6cb..22c22fb91042 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1330,11 +1330,7 @@ struct hv_device {
 
 
 #define device_to_hv_device(d)	container_of_const(d, struct hv_device, device)
-
-static inline struct hv_driver *drv_to_hv_drv(struct device_driver *d)
-{
-	return container_of(d, struct hv_driver, driver);
-}
+#define drv_to_hv_drv(d)	container_of_const(d, struct hv_driver, driver)
 
 static inline void hv_set_drvdata(struct hv_device *dev, void *data)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 9709537370ee..cde3de35a89f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -304,7 +304,7 @@ struct i2c_driver {
 
 	u32 flags;
 };
-#define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
+#define to_i2c_driver(d) container_of_const(d, struct i2c_driver, driver)
 
 /**
  * struct i2c_client - represent an I2C slave device
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index e119f11948ef..0a8a44ac2f02 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -183,10 +183,7 @@ struct i3c_driver {
 	const struct i3c_device_id *id_table;
 };
 
-static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
-{
-	return container_of(drv, struct i3c_driver, driver);
-}
+#define drv_to_i3cdrv(__drv)	container_of_const(__drv, struct i3c_driver, driver)
 
 struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
 
diff --git a/include/linux/maple.h b/include/linux/maple.h
index 9aae44efcfd4..3be4e567473c 100644
--- a/include/linux/maple.h
+++ b/include/linux/maple.h
@@ -97,7 +97,7 @@ int maple_add_packet(struct maple_device *mdev, u32 function,
 void maple_clear_dev(struct maple_device *mdev);
 
 #define to_maple_dev(n) container_of(n, struct maple_device, dev)
-#define to_maple_driver(n) container_of(n, struct maple_driver, drv)
+#define to_maple_driver(n) container_of_const(n, struct maple_driver, drv)
 
 #define maple_get_drvdata(d)		dev_get_drvdata(&(d)->dev)
 #define maple_set_drvdata(d,p)		dev_set_drvdata(&(d)->dev, (p))
diff --git a/include/linux/mcb.h b/include/linux/mcb.h
index 0b971b24a804..4ab2691f51a6 100644
--- a/include/linux/mcb.h
+++ b/include/linux/mcb.h
@@ -94,10 +94,7 @@ struct mcb_driver {
 	void (*shutdown)(struct mcb_device *mdev);
 };
 
-static inline struct mcb_driver *to_mcb_driver(struct device_driver *drv)
-{
-	return container_of(drv, struct mcb_driver, driver);
-}
+#define to_mcb_driver(__drv)	container_of_const(__drv, struct mcb_driver, driver)
 
 static inline void *mcb_get_drvdata(struct mcb_device *dev)
 {
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 68f8d2e970d4..efeca5bd7600 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -31,7 +31,7 @@ struct mdio_device {
 	struct mii_bus *bus;
 	char modalias[MDIO_NAME_SIZE];
 
-	int (*bus_match)(struct device *dev, struct device_driver *drv);
+	int (*bus_match)(struct device *dev, const struct device_driver *drv);
 	void (*device_free)(struct mdio_device *mdiodev);
 	void (*device_remove)(struct mdio_device *mdiodev);
 
@@ -57,11 +57,8 @@ struct mdio_driver_common {
 };
 #define MDIO_DEVICE_FLAG_PHY		1
 
-static inline struct mdio_driver_common *
-to_mdio_common_driver(const struct device_driver *driver)
-{
-	return container_of(driver, struct mdio_driver_common, driver);
-}
+#define to_mdio_common_driver(__drv_c)	container_of_const(__drv_c, struct mdio_driver_common,	\
+							   driver)
 
 /* struct mdio_driver: Generic MDIO driver */
 struct mdio_driver {
@@ -80,12 +77,8 @@ struct mdio_driver {
 	void (*shutdown)(struct mdio_device *mdiodev);
 };
 
-static inline struct mdio_driver *
-to_mdio_driver(const struct device_driver *driver)
-{
-	return container_of(to_mdio_common_driver(driver), struct mdio_driver,
-			    mdiodrv);
-}
+#define to_mdio_driver(__drv_m)	container_of_const(to_mdio_common_driver(__drv_m),	\
+						   struct mdio_driver, mdiodrv)
 
 /* device driver data */
 static inline void mdiodev_set_drvdata(struct mdio_device *mdio, void *data)
@@ -105,7 +98,7 @@ void mdio_device_remove(struct mdio_device *mdiodev);
 void mdio_device_reset(struct mdio_device *mdiodev, int value);
 int mdio_driver_register(struct mdio_driver *drv);
 void mdio_driver_unregister(struct mdio_driver *drv);
-int mdio_device_bus_match(struct device *dev, struct device_driver *drv);
+int mdio_device_bus_match(struct device *dev, const struct device_driver *drv);
 
 static inline void mdio_device_get(struct mdio_device *mdiodev)
 {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b573f15762f8..ce1f9d737964 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -526,7 +526,7 @@ struct mhi_driver {
 	struct device_driver driver;
 };
 
-#define to_mhi_driver(drv) container_of(drv, struct mhi_driver, driver)
+#define to_mhi_driver(drv) container_of_const(drv, struct mhi_driver, driver)
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 11bf3212f782..7b40fc8cbe77 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -221,7 +221,7 @@ struct mhi_ep_driver {
 };
 
 #define to_mhi_ep_device(dev) container_of(dev, struct mhi_ep_device, dev)
-#define to_mhi_ep_driver(drv) container_of(drv, struct mhi_ep_driver, driver)
+#define to_mhi_ep_driver(drv) container_of_const(drv, struct mhi_ep_driver, driver)
 
 /*
  * module_mhi_ep_driver() - Helper macro for drivers that don't do
diff --git a/include/linux/moxtet.h b/include/linux/moxtet.h
index ac577699edfd..dfa4800306ee 100644
--- a/include/linux/moxtet.h
+++ b/include/linux/moxtet.h
@@ -61,13 +61,8 @@ struct moxtet_driver {
 	struct device_driver		driver;
 };
 
-static inline struct moxtet_driver *
-to_moxtet_driver(struct device_driver *drv)
-{
-	if (!drv)
-		return NULL;
-	return container_of(drv, struct moxtet_driver, driver);
-}
+#define to_moxtet_driver(__drv)	\
+	( __drv ? container_of_const(__drv, struct moxtet_driver, driver) : NULL )
 
 extern int __moxtet_register_driver(struct module *owner,
 				    struct moxtet_driver *mdrv);
diff --git a/include/linux/nd.h b/include/linux/nd.h
index b9771ba1ef87..fa099e295f78 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -84,11 +84,7 @@ struct nd_device_driver {
 	void (*notify)(struct device *dev, enum nvdimm_event event);
 };
 
-static inline struct nd_device_driver *to_nd_device_driver(
-		struct device_driver *drv)
-{
-	return container_of(drv, struct nd_device_driver, drv);
-};
+#define to_nd_device_driver(__drv)	container_of_const(__drv, struct nd_device_driver, drv)
 
 /**
  * struct nd_namespace_common - core infrastructure of a namespace
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index adee6a1b35db..980a3c90a5ee 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -105,8 +105,7 @@ struct pci_epf_driver {
 	const struct pci_epf_device_id	*id_table;
 };
 
-#define to_pci_epf_driver(drv) (container_of((drv), struct pci_epf_driver, \
-				driver))
+#define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
 
 /**
  * struct pci_epf_bar - represents the BAR of EPF device
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cafc5ab1cbcb..aa1c3280b7d0 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -958,10 +958,8 @@ struct pci_driver {
 	bool driver_managed_dma;
 };
 
-static inline struct pci_driver *to_pci_driver(struct device_driver *drv)
-{
-    return drv ? container_of(drv, struct pci_driver, driver) : NULL;
-}
+#define to_pci_driver(__drv)	\
+	( __drv ? container_of_const(__drv, struct pci_driver, driver) : NULL )
 
 /**
  * PCI_DEVICE - macro used to describe a specific PCI device
diff --git a/include/linux/phy.h b/include/linux/phy.h
index e6e83304558e..8237d5006a99 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1179,7 +1179,7 @@ struct phy_driver {
 	int (*led_polarity_set)(struct phy_device *dev, int index,
 				unsigned long modes);
 };
-#define to_phy_driver(d) container_of(to_mdio_common_driver(d),		\
+#define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
 
 #define PHY_ANY_ID "MATCH ANY PHY"
diff --git a/include/linux/pnp.h b/include/linux/pnp.h
index 7f2ff95d2deb..b7a7158aaf65 100644
--- a/include/linux/pnp.h
+++ b/include/linux/pnp.h
@@ -383,7 +383,7 @@ struct pnp_driver {
 	struct device_driver driver;
 };
 
-#define	to_pnp_driver(drv) container_of(drv, struct pnp_driver, driver)
+#define	to_pnp_driver(drv) container_of_const(drv, struct pnp_driver, driver)
 
 struct pnp_card_driver {
 	struct list_head global_list;
diff --git a/include/linux/rio.h b/include/linux/rio.h
index 2cd637268b4f..3c29f40f3c94 100644
--- a/include/linux/rio.h
+++ b/include/linux/rio.h
@@ -465,7 +465,7 @@ struct rio_driver {
 	struct device_driver driver;
 };
 
-#define	to_rio_driver(drv) container_of(drv,struct rio_driver, driver)
+#define	to_rio_driver(drv) container_of_const(drv,struct rio_driver, driver)
 
 union rio_pw_msg {
 	struct {
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3a9bb5b9a9e8..688466a0e816 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -945,7 +945,7 @@ struct scmi_device {
 	struct scmi_handle *handle;
 };
 
-#define to_scmi_dev(d) container_of(d, struct scmi_device, dev)
+#define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
 struct scmi_device_id {
 	u8 protocol_id;
diff --git a/include/linux/serio.h b/include/linux/serio.h
index 7ca41af93b37..bf2191f25350 100644
--- a/include/linux/serio.h
+++ b/include/linux/serio.h
@@ -80,7 +80,7 @@ struct serio_driver {
 
 	struct device_driver driver;
 };
-#define to_serio_driver(d)	container_of(d, struct serio_driver, driver)
+#define to_serio_driver(d)	container_of_const(d, struct serio_driver, driver)
 
 int serio_open(struct serio *serio, struct serio_driver *drv);
 void serio_close(struct serio *serio);
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index 3042385b7b40..a4608d9a9684 100644
--- a/include/linux/slimbus.h
+++ b/include/linux/slimbus.h
@@ -91,7 +91,7 @@ struct slim_driver {
 	struct device_driver		driver;
 	const struct slim_device_id	*id_table;
 };
-#define to_slim_driver(d) container_of(d, struct slim_driver, driver)
+#define to_slim_driver(d) container_of_const(d, struct slim_driver, driver)
 
 /**
  * struct slim_val_inf - Slimbus value or information element
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 7161a3183eda..a532d1e4b1f4 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -162,7 +162,7 @@ struct apr_driver {
 };
 
 typedef struct apr_driver gpr_driver_t;
-#define to_apr_driver(d) container_of(d, struct apr_driver, driver)
+#define to_apr_driver(d) container_of_const(d, struct apr_driver, driver)
 
 /*
  * use a macro to avoid include chaining to get THIS_MODULE
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index 693320b4f5c2..d405935a45fe 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -13,7 +13,7 @@ static inline int is_sdw_slave(const struct device *dev)
 	return dev->type == &sdw_slave_type;
 }
 
-#define drv_to_sdw_driver(_drv) container_of(_drv, struct sdw_driver, driver)
+#define drv_to_sdw_driver(_drv) container_of_const(_drv, struct sdw_driver, driver)
 
 #define sdw_register_driver(drv) \
 	__sdw_register_driver(drv, THIS_MODULE)
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e8e1e798924f..3fc559686d38 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -351,10 +351,8 @@ struct spi_driver {
 	struct device_driver	driver;
 };
 
-static inline struct spi_driver *to_spi_driver(struct device_driver *drv)
-{
-	return drv ? container_of(drv, struct spi_driver, driver) : NULL;
-}
+#define to_spi_driver(__drv)   \
+	( __drv ? container_of_const(__drv, struct spi_driver, driver) : NULL )
 
 extern int __spi_register_driver(struct module *owner, struct spi_driver *sdrv);
 
diff --git a/include/linux/ssb/ssb.h b/include/linux/ssb/ssb.h
index a2257380c3f1..e1fb11e0f12c 100644
--- a/include/linux/ssb/ssb.h
+++ b/include/linux/ssb/ssb.h
@@ -325,7 +325,7 @@ struct ssb_driver {
 
 	struct device_driver drv;
 };
-#define drv_to_ssb_drv(_drv) container_of(_drv, struct ssb_driver, drv)
+#define drv_to_ssb_drv(_drv) container_of_const(_drv, struct ssb_driver, drv)
 
 extern int __ssb_driver_register(struct ssb_driver *drv, struct module *owner);
 #define ssb_driver_register(drv) \
diff --git a/include/linux/tc.h b/include/linux/tc.h
index 1638660abf5e..8416bae9b126 100644
--- a/include/linux/tc.h
+++ b/include/linux/tc.h
@@ -108,7 +108,7 @@ struct tc_driver {
 	struct device_driver driver;
 };
 
-#define to_tc_driver(drv) container_of(drv, struct tc_driver, driver)
+#define to_tc_driver(drv) container_of_const(drv, struct tc_driver, driver)
 
 /*
  * Return TURBOchannel clock frequency in Hz.
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 786b9ae6cf4d..a54c203000ed 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -298,6 +298,6 @@ struct tee_client_driver {
 };
 
 #define to_tee_client_driver(d) \
-		container_of(d, struct tee_client_driver, driver)
+		container_of_const(d, struct tee_client_driver, driver)
 
 #endif /*__TEE_DRV_H*/
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 96fea920873b..ecc5cb7b8c91 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -209,10 +209,7 @@ struct virtio_driver {
 	int (*restore)(struct virtio_device *dev);
 };
 
-static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
-{
-	return container_of(drv, struct virtio_driver, driver);
-}
+#define drv_to_virtio(__drv)	container_of_const(__drv, struct virtio_driver, driver)
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
 #define register_virtio_driver(drv) \
diff --git a/include/scsi/scsi_transport_iscsi.h b/include/scsi/scsi_transport_iscsi.h
index fb3399e4cd29..bd1243657c01 100644
--- a/include/scsi/scsi_transport_iscsi.h
+++ b/include/scsi/scsi_transport_iscsi.h
@@ -495,7 +495,7 @@ iscsi_destroy_flashnode_sess(struct iscsi_bus_flash_session *fnode_sess);
 
 extern void iscsi_destroy_all_flashnode(struct Scsi_Host *shost);
 extern int iscsi_flashnode_bus_match(struct device *dev,
-				     struct device_driver *drv);
+				     const struct device_driver *drv);
 extern struct device *
 iscsi_find_flashnode_sess(struct Scsi_Host *shost, void *data,
 			  int (*fn)(struct device *dev, void *data));
diff --git a/include/sound/ac97/codec.h b/include/sound/ac97/codec.h
index 2fc641cb1982..882b849b9255 100644
--- a/include/sound/ac97/codec.h
+++ b/include/sound/ac97/codec.h
@@ -73,10 +73,7 @@ static inline struct ac97_codec_device *to_ac97_device(struct device *d)
 	return container_of(d, struct ac97_codec_device, dev);
 }
 
-static inline struct ac97_codec_driver *to_ac97_driver(struct device_driver *d)
-{
-	return container_of(d, struct ac97_codec_driver, driver);
-}
+#define to_ac97_driver(__drv) container_of_const(__drv, struct ac97_codec_driver, driver)
 
 #if IS_ENABLED(CONFIG_AC97_BUS_NEW)
 int snd_ac97_codec_driver_register(struct ac97_codec_driver *drv);
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index ac22cf08c09f..3f90bdd387b6 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -124,10 +124,7 @@ struct xenbus_driver {
 	void (*reclaim_memory)(struct xenbus_device *dev);
 };
 
-static inline struct xenbus_driver *to_xenbus_driver(struct device_driver *drv)
-{
-	return container_of(drv, struct xenbus_driver, driver);
-}
+#define to_xenbus_driver(__drv)	container_of_const(__drv, struct xenbus_driver, driver)
 
 int __must_check __xenbus_register_frontend(struct xenbus_driver *drv,
 					    struct module *owner,
diff --git a/net/iucv/iucv.c b/net/iucv/iucv.c
index b7bf34a5eb37..1e42e13ad24e 100644
--- a/net/iucv/iucv.c
+++ b/net/iucv/iucv.c
@@ -62,7 +62,7 @@
 #define IUCV_IPNORPY	0x10
 #define IUCV_IPALL	0x80
 
-static int iucv_bus_match(struct device *dev, struct device_driver *drv)
+static int iucv_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	return 0;
 }
diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 40e88d79c483..96d4d7eb879f 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -469,10 +469,10 @@ static struct attribute *ac97_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ac97_dev);
 
-static int ac97_bus_match(struct device *dev, struct device_driver *drv)
+static int ac97_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct ac97_codec_device *adev = to_ac97_device(dev);
-	struct ac97_codec_driver *adrv = to_ac97_driver(drv);
+	const struct ac97_codec_driver *adrv = to_ac97_driver(drv);
 	const struct ac97_id *id = adrv->id_table;
 	int i = 0;
 
diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 654d620d0199..4492be5d2317 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -40,7 +40,7 @@ MODULE_LICENSE("GPL");
 /*
  * bus definition
  */
-static int snd_seq_bus_match(struct device *dev, struct device_driver *drv)
+static int snd_seq_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct snd_seq_device *sdev = to_seq_dev(dev);
 	struct snd_seq_driver *sdrv = to_seq_drv(drv);
@@ -234,7 +234,7 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 		put_device(&dev->dev);
 		return err;
 	}
-	
+
 	if (result)
 		*result = dev;
 
diff --git a/sound/hda/hda_bus_type.c b/sound/hda/hda_bus_type.c
index cce2c30511a2..7545ace7b0ee 100644
--- a/sound/hda/hda_bus_type.c
+++ b/sound/hda/hda_bus_type.c
@@ -46,7 +46,7 @@ static int hdac_codec_match(struct hdac_device *dev, struct hdac_driver *drv)
 		return 0;
 }
 
-static int hda_bus_match(struct device *dev, struct device_driver *drv)
+static int hda_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_driver *hdrv = drv_to_hdac_driver(drv);
-- 
2.45.2

