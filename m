Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C53C79D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 00:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPbbL5YTzz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 08:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPW8l2RF1z2yQF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 05:36:21 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3OBr-0001GT-RJ; Tue, 13 Jul 2021 21:35:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3OBi-0006p7-4I; Tue, 13 Jul 2021 21:35:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3OBh-0002bU-W6; Tue, 13 Jul 2021 21:35:25 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 0/5] bus: Make remove callback return void
Date: Tue, 13 Jul 2021 21:35:17 +0200
Message-Id: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Wed, 14 Jul 2021 08:55:07 +1000
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
Cc: nvdimm@lists.linux.dev, linux-sh@vger.kernel.org,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Halil Pasic <pasic@linux.ibm.com>, linux-acpi@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Tomas Winkler <tomas.winkler@intel.com>,
 Julien Grall <jgrall@amazon.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Yufen Yu <yuyufen@huawei.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>, linux-parisc@vger.kernel.org,
 Finn Thain <fthain@linux-m68k.org>, Geoff Levand <geoff@infradead.org>,
 linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jiri Slaby <jirislaby@kernel.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>, industrypack-devel@lists.sourceforge.net,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, greybus-dev@lists.linaro.org,
 linux-m68k@lists.linux-m68k.org, Florian Fainelli <f.fainelli@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Frank Li <lznuaa@gmail.com>,
 Mark Gross <mgross@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Wolfram Sang <wsa@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 netdev@vger.kernel.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Allen Hubbe <allenbh@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Jiri Kosina <jikos@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>, linux-cxl@vger.kernel.org,
 Michael Buesch <m@bues.ch>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Sven Van Asbroeck <TheSven73@gmail.com>, Rich Felker <dalias@libc.org>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 sparclinux@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-hyperv@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Alexandre Bounine <alex.bou9@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>, dmaengine@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this is v4 of the final patch set for my effort to make struct
bus_type::remove return void.

The first four patches contain cleanups that make some of these
callbacks (more obviously) always return 0. They are acked by the
respective maintainers. Bjorn Helgaas explicitly asked to include the
pci patch (#1) into this series, so Greg taking this is fine. I assume
the s390 people are fine with Greg taking patches #2 to #4, too, they
didn't explicitly said so though.

The last patch actually changes the prototype and so touches quite some
drivers and has the potential to conflict with future developments, so I
consider it beneficial to put these patches into next soon. I expect
that it will be Greg who takes the complete series, he already confirmed
via irc (for v2) to look into this series.

The only change compared to v3 is in the fourth patch where I modified a
few more drivers to fix build failures. Some of them were found by build
bots (thanks!), some of them I found myself using a regular expression
search. The newly modified files are:

 arch/sparc/kernel/vio.c
 drivers/nubus/bus.c
 drivers/sh/superhyway/superhyway.c
 drivers/vlynq/vlynq.c
 drivers/zorro/zorro-driver.c
 sound/ac97/bus.c

Best regards
Uwe

Uwe Kleine-König (5):
  PCI: endpoint: Make struct pci_epf_driver::remove return void
  s390/cio: Make struct css_driver::remove return void
  s390/ccwgroup: Drop if with an always false condition
  s390/scm: Make struct scm_driver::remove return void
  bus: Make remove callback return void

 arch/arm/common/locomo.c                  | 3 +--
 arch/arm/common/sa1111.c                  | 4 +---
 arch/arm/mach-rpc/ecard.c                 | 4 +---
 arch/mips/sgi-ip22/ip22-gio.c             | 3 +--
 arch/parisc/kernel/drivers.c              | 5 ++---
 arch/powerpc/platforms/ps3/system-bus.c   | 3 +--
 arch/powerpc/platforms/pseries/ibmebus.c  | 3 +--
 arch/powerpc/platforms/pseries/vio.c      | 3 +--
 arch/s390/include/asm/eadm.h              | 2 +-
 arch/sparc/kernel/vio.c                   | 4 +---
 drivers/acpi/bus.c                        | 3 +--
 drivers/amba/bus.c                        | 4 +---
 drivers/base/auxiliary.c                  | 4 +---
 drivers/base/isa.c                        | 4 +---
 drivers/base/platform.c                   | 4 +---
 drivers/bcma/main.c                       | 6 ++----
 drivers/bus/sunxi-rsb.c                   | 4 +---
 drivers/cxl/core.c                        | 3 +--
 drivers/dax/bus.c                         | 4 +---
 drivers/dma/idxd/sysfs.c                  | 4 +---
 drivers/firewire/core-device.c            | 4 +---
 drivers/firmware/arm_scmi/bus.c           | 4 +---
 drivers/firmware/google/coreboot_table.c  | 4 +---
 drivers/fpga/dfl.c                        | 4 +---
 drivers/hid/hid-core.c                    | 4 +---
 drivers/hid/intel-ish-hid/ishtp/bus.c     | 4 +---
 drivers/hv/vmbus_drv.c                    | 5 +----
 drivers/hwtracing/intel_th/core.c         | 4 +---
 drivers/i2c/i2c-core-base.c               | 5 +----
 drivers/i3c/master.c                      | 4 +---
 drivers/input/gameport/gameport.c         | 3 +--
 drivers/input/serio/serio.c               | 3 +--
 drivers/ipack/ipack.c                     | 4 +---
 drivers/macintosh/macio_asic.c            | 4 +---
 drivers/mcb/mcb-core.c                    | 4 +---
 drivers/media/pci/bt8xx/bttv-gpio.c       | 3 +--
 drivers/memstick/core/memstick.c          | 3 +--
 drivers/mfd/mcp-core.c                    | 3 +--
 drivers/misc/mei/bus.c                    | 4 +---
 drivers/misc/tifm_core.c                  | 3 +--
 drivers/mmc/core/bus.c                    | 4 +---
 drivers/mmc/core/sdio_bus.c               | 4 +---
 drivers/net/netdevsim/bus.c               | 3 +--
 drivers/ntb/core.c                        | 4 +---
 drivers/ntb/ntb_transport.c               | 4 +---
 drivers/nubus/bus.c                       | 6 ++----
 drivers/nvdimm/bus.c                      | 3 +--
 drivers/pci/endpoint/pci-epf-core.c       | 7 ++-----
 drivers/pci/pci-driver.c                  | 3 +--
 drivers/pcmcia/ds.c                       | 4 +---
 drivers/platform/surface/aggregator/bus.c | 4 +---
 drivers/platform/x86/wmi.c                | 4 +---
 drivers/pnp/driver.c                      | 3 +--
 drivers/rapidio/rio-driver.c              | 4 +---
 drivers/rpmsg/rpmsg_core.c                | 7 ++-----
 drivers/s390/block/scm_drv.c              | 4 +---
 drivers/s390/cio/ccwgroup.c               | 6 +-----
 drivers/s390/cio/chsc_sch.c               | 3 +--
 drivers/s390/cio/css.c                    | 7 +++----
 drivers/s390/cio/css.h                    | 2 +-
 drivers/s390/cio/device.c                 | 9 +++------
 drivers/s390/cio/eadm_sch.c               | 4 +---
 drivers/s390/cio/scm.c                    | 5 +++--
 drivers/s390/cio/vfio_ccw_drv.c           | 3 +--
 drivers/s390/crypto/ap_bus.c              | 4 +---
 drivers/scsi/scsi_debug.c                 | 3 +--
 drivers/sh/superhyway/superhyway.c        | 8 ++------
 drivers/siox/siox-core.c                  | 4 +---
 drivers/slimbus/core.c                    | 4 +---
 drivers/soc/qcom/apr.c                    | 4 +---
 drivers/spi/spi.c                         | 4 +---
 drivers/spmi/spmi.c                       | 3 +--
 drivers/ssb/main.c                        | 4 +---
 drivers/staging/fieldbus/anybuss/host.c   | 4 +---
 drivers/staging/greybus/gbphy.c           | 4 +---
 drivers/target/loopback/tcm_loop.c        | 5 ++---
 drivers/thunderbolt/domain.c              | 4 +---
 drivers/tty/serdev/core.c                 | 4 +---
 drivers/usb/common/ulpi.c                 | 4 +---
 drivers/usb/serial/bus.c                  | 4 +---
 drivers/usb/typec/bus.c                   | 4 +---
 drivers/vdpa/vdpa.c                       | 4 +---
 drivers/vfio/mdev/mdev_driver.c           | 4 +---
 drivers/virtio/virtio.c                   | 3 +--
 drivers/vlynq/vlynq.c                     | 4 +---
 drivers/vme/vme.c                         | 4 +---
 drivers/xen/xenbus/xenbus.h               | 2 +-
 drivers/xen/xenbus/xenbus_probe.c         | 4 +---
 drivers/zorro/zorro-driver.c              | 3 +--
 include/linux/device/bus.h                | 2 +-
 include/linux/pci-epf.h                   | 2 +-
 sound/ac97/bus.c                          | 6 ++----
 sound/aoa/soundbus/core.c                 | 4 +---
 93 files changed, 107 insertions(+), 263 deletions(-)


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
-- 
2.30.2

