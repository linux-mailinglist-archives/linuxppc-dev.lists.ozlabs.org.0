Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBC2C31AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:07:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZml2qgGzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=P7BRi8/4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7BRi8/4; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZhj19rBzDqCC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 07:03:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DOLfU9QYMGrspYJyzvFCDSDoj+0Yb7d+LpKKWf0+TiU=;
 b=P7BRi8/4CS123VDDNoNjfnmDEkg4Vld4Yw5NpXVGoiDS6ZEVYCXyQWpMU1Y1uOUHzF57rs
 ymMhzuvlkKDa+2HmPKe2JTvZKYgRwkh4O7SG8Vy4Lv1joTp6Bm+LeYeBwM+1lu9Zk+GFJG
 fO+FcW/7moyi1PABVv+XtNtaAVlT7V8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DOLfU9QYMGrspYJyzvFCDSDoj+0Yb7d+LpKKWf0+TiU=;
 b=P7BRi8/4CS123VDDNoNjfnmDEkg4Vld4Yw5NpXVGoiDS6ZEVYCXyQWpMU1Y1uOUHzF57rs
 ymMhzuvlkKDa+2HmPKe2JTvZKYgRwkh4O7SG8Vy4Lv1joTp6Bm+LeYeBwM+1lu9Zk+GFJG
 fO+FcW/7moyi1PABVv+XtNtaAVlT7V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-6_d5NO5PPCy6SULvgRXZBQ-1; Tue, 24 Nov 2020 15:03:19 -0500
X-MC-Unique: 6_d5NO5PPCy6SULvgRXZBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F411107AD88;
 Tue, 24 Nov 2020 20:03:17 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B80705D6AB;
 Tue, 24 Nov 2020 20:03:09 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] powerpc/pseries: fix MSI/X IRQ affinity on pseries
Date: Tue, 24 Nov 2020 21:03:06 +0100
Message-Id: <20201124200308.1110744-1-lvivier@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Laurent Vivier <lvivier@redhat.com>, Marc Zyngier <maz@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With virtio, in multiqueue case, each queue IRQ is normally=0D
bound to a different CPU using the affinity mask.=0D
=0D
This works fine on x86_64 but totally ignored on pseries.=0D
=0D
This is not obvious at first look because irqbalance is doing=0D
some balancing to improve that.=0D
=0D
It appears that the "managed" flag set in the MSI entry=0D
is never copied to the system IRQ entry.=0D
=0D
This series passes the affinity mask from rtas_setup_msi_irqs()=0D
to irq_domain_alloc_descs() by adding an affinity parameter to=0D
irq_create_mapping().=0D
=0D
The first patch adds the parameter (no functional change), the=0D
second patch passes the actual affinity mask to irq_create_mapping()=0D
in rtas_setup_msi_irqs().=0D
=0D
For instance, with 32 CPUs VM and 32 queues virtio-scsi interface:=0D
=0D
... -smp 32 -device virtio-scsi-pci,id=3Dvirtio_scsi_pci0,num_queues=3D32=0D
=0D
for IRQ in $(grep virtio2-request /proc/interrupts |cut -d: -f1); do=0D
    for file in /proc/irq/$IRQ/ ; do=0D
        echo -n "IRQ: $(basename $file) CPU: " ; cat $file/smp_affinity_lis=
t=0D
    done=0D
done=0D
=0D
Without the patch (and without irqbalanced)=0D
=0D
IRQ: 268 CPU: 0-31=0D
IRQ: 269 CPU: 0-31=0D
IRQ: 270 CPU: 0-31=0D
IRQ: 271 CPU: 0-31=0D
IRQ: 272 CPU: 0-31=0D
IRQ: 273 CPU: 0-31=0D
IRQ: 274 CPU: 0-31=0D
IRQ: 275 CPU: 0-31=0D
IRQ: 276 CPU: 0-31=0D
IRQ: 277 CPU: 0-31=0D
IRQ: 278 CPU: 0-31=0D
IRQ: 279 CPU: 0-31=0D
IRQ: 280 CPU: 0-31=0D
IRQ: 281 CPU: 0-31=0D
IRQ: 282 CPU: 0-31=0D
IRQ: 283 CPU: 0-31=0D
IRQ: 284 CPU: 0-31=0D
IRQ: 285 CPU: 0-31=0D
IRQ: 286 CPU: 0-31=0D
IRQ: 287 CPU: 0-31=0D
IRQ: 288 CPU: 0-31=0D
IRQ: 289 CPU: 0-31=0D
IRQ: 290 CPU: 0-31=0D
IRQ: 291 CPU: 0-31=0D
IRQ: 292 CPU: 0-31=0D
IRQ: 293 CPU: 0-31=0D
IRQ: 294 CPU: 0-31=0D
IRQ: 295 CPU: 0-31=0D
IRQ: 296 CPU: 0-31=0D
IRQ: 297 CPU: 0-31=0D
IRQ: 298 CPU: 0-31=0D
IRQ: 299 CPU: 0-31=0D
=0D
With the patch:=0D
=0D
IRQ: 265 CPU: 0=0D
IRQ: 266 CPU: 1=0D
IRQ: 267 CPU: 2=0D
IRQ: 268 CPU: 3=0D
IRQ: 269 CPU: 4=0D
IRQ: 270 CPU: 5=0D
IRQ: 271 CPU: 6=0D
IRQ: 272 CPU: 7=0D
IRQ: 273 CPU: 8=0D
IRQ: 274 CPU: 9=0D
IRQ: 275 CPU: 10=0D
IRQ: 276 CPU: 11=0D
IRQ: 277 CPU: 12=0D
IRQ: 278 CPU: 13=0D
IRQ: 279 CPU: 14=0D
IRQ: 280 CPU: 15=0D
IRQ: 281 CPU: 16=0D
IRQ: 282 CPU: 17=0D
IRQ: 283 CPU: 18=0D
IRQ: 284 CPU: 19=0D
IRQ: 285 CPU: 20=0D
IRQ: 286 CPU: 21=0D
IRQ: 287 CPU: 22=0D
IRQ: 288 CPU: 23=0D
IRQ: 289 CPU: 24=0D
IRQ: 290 CPU: 25=0D
IRQ: 291 CPU: 26=0D
IRQ: 292 CPU: 27=0D
IRQ: 293 CPU: 28=0D
IRQ: 294 CPU: 29=0D
IRQ: 295 CPU: 30=0D
IRQ: 299 CPU: 31=0D
=0D
This matches what we have on an x86_64 system.=0D
=0D
Laurent Vivier (2):=0D
  genirq: add an affinity parameter to irq_create_mapping()=0D
  powerpc/pseries: pass MSI affinity to irq_create_mapping()=0D
=0D
 arch/arc/kernel/intc-arcv2.c                  | 4 ++--=0D
 arch/arc/kernel/mcip.c                        | 2 +-=0D
 arch/arm/common/sa1111.c                      | 2 +-=0D
 arch/arm/mach-s3c/irq-s3c24xx.c               | 3 ++-=0D
 arch/arm/plat-orion/gpio.c                    | 2 +-=0D
 arch/mips/ath25/ar2315.c                      | 4 ++--=0D
 arch/mips/ath25/ar5312.c                      | 4 ++--=0D
 arch/mips/lantiq/irq.c                        | 2 +-=0D
 arch/mips/pci/pci-ar2315.c                    | 3 ++-=0D
 arch/mips/pic32/pic32mzda/time.c              | 2 +-=0D
 arch/mips/ralink/irq.c                        | 2 +-=0D
 arch/powerpc/kernel/pci-common.c              | 2 +-=0D
 arch/powerpc/kvm/book3s_xive.c                | 2 +-=0D
 arch/powerpc/platforms/44x/ppc476.c           | 4 ++--=0D
 arch/powerpc/platforms/cell/interrupt.c       | 4 ++--=0D
 arch/powerpc/platforms/cell/iommu.c           | 3 ++-=0D
 arch/powerpc/platforms/cell/pmu.c             | 2 +-=0D
 arch/powerpc/platforms/cell/spider-pic.c      | 2 +-=0D
 arch/powerpc/platforms/cell/spu_manage.c      | 6 +++---=0D
 arch/powerpc/platforms/maple/pci.c            | 2 +-=0D
 arch/powerpc/platforms/pasemi/dma_lib.c       | 5 +++--=0D
 arch/powerpc/platforms/pasemi/msi.c           | 2 +-=0D
 arch/powerpc/platforms/pasemi/setup.c         | 4 ++--=0D
 arch/powerpc/platforms/powermac/pci.c         | 2 +-=0D
 arch/powerpc/platforms/powermac/pic.c         | 2 +-=0D
 arch/powerpc/platforms/powermac/smp.c         | 2 +-=0D
 arch/powerpc/platforms/powernv/opal-irqchip.c | 5 +++--=0D
 arch/powerpc/platforms/powernv/pci.c          | 2 +-=0D
 arch/powerpc/platforms/powernv/vas.c          | 2 +-=0D
 arch/powerpc/platforms/ps3/interrupt.c        | 2 +-=0D
 arch/powerpc/platforms/pseries/ibmebus.c      | 2 +-=0D
 arch/powerpc/platforms/pseries/msi.c          | 2 +-=0D
 arch/powerpc/sysdev/fsl_mpic_err.c            | 2 +-=0D
 arch/powerpc/sysdev/fsl_msi.c                 | 2 +-=0D
 arch/powerpc/sysdev/mpic.c                    | 3 ++-=0D
 arch/powerpc/sysdev/mpic_u3msi.c              | 2 +-=0D
 arch/powerpc/sysdev/xics/xics-common.c        | 2 +-=0D
 arch/powerpc/sysdev/xive/common.c             | 2 +-=0D
 arch/sh/boards/mach-se/7343/irq.c             | 2 +-=0D
 arch/sh/boards/mach-se/7722/irq.c             | 2 +-=0D
 arch/sh/boards/mach-x3proto/gpio.c            | 2 +-=0D
 arch/xtensa/kernel/perf_event.c               | 2 +-=0D
 arch/xtensa/kernel/smp.c                      | 2 +-=0D
 arch/xtensa/kernel/time.c                     | 2 +-=0D
 drivers/ata/pata_macio.c                      | 2 +-=0D
 drivers/base/regmap/regmap-irq.c              | 2 +-=0D
 drivers/bus/moxtet.c                          | 2 +-=0D
 drivers/clocksource/ingenic-timer.c           | 2 +-=0D
 drivers/clocksource/timer-riscv.c             | 2 +-=0D
 drivers/extcon/extcon-max8997.c               | 3 ++-=0D
 drivers/gpio/gpio-bcm-kona.c                  | 2 +-=0D
 drivers/gpio/gpio-brcmstb.c                   | 2 +-=0D
 drivers/gpio/gpio-davinci.c                   | 2 +-=0D
 drivers/gpio/gpio-em.c                        | 3 ++-=0D
 drivers/gpio/gpio-grgpio.c                    | 2 +-=0D
 drivers/gpio/gpio-mockup.c                    | 2 +-=0D
 drivers/gpio/gpio-mpc8xxx.c                   | 2 +-=0D
 drivers/gpio/gpio-mvebu.c                     | 2 +-=0D
 drivers/gpio/gpio-tb10x.c                     | 2 +-=0D
 drivers/gpio/gpio-tegra.c                     | 2 +-=0D
 drivers/gpio/gpio-wm831x.c                    | 2 +-=0D
 drivers/gpio/gpiolib.c                        | 2 +-=0D
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       | 3 ++-=0D
 drivers/gpu/ipu-v3/ipu-common.c               | 2 +-=0D
 drivers/hid/hid-rmi.c                         | 2 +-=0D
 drivers/i2c/busses/i2c-cht-wc.c               | 2 +-=0D
 drivers/i2c/i2c-core-base.c                   | 2 +-=0D
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 2 +-=0D
 drivers/ide/pmac.c                            | 2 +-=0D
 drivers/iio/dummy/iio_dummy_evgen.c           | 3 ++-=0D
 drivers/input/rmi4/rmi_bus.c                  | 2 +-=0D
 drivers/irqchip/irq-ath79-misc.c              | 3 ++-=0D
 drivers/irqchip/irq-bcm2835.c                 | 3 ++-=0D
 drivers/irqchip/irq-csky-mpintc.c             | 2 +-=0D
 drivers/irqchip/irq-eznps.c                   | 2 +-=0D
 drivers/irqchip/irq-mips-gic.c                | 8 +++++---=0D
 drivers/irqchip/irq-mmp.c                     | 4 ++--=0D
 drivers/irqchip/irq-versatile-fpga.c          | 2 +-=0D
 drivers/irqchip/irq-vic.c                     | 2 +-=0D
 drivers/macintosh/macio_asic.c                | 2 +-=0D
 drivers/memory/omap-gpmc.c                    | 2 +-=0D
 drivers/mfd/ab8500-core.c                     | 2 +-=0D
 drivers/mfd/arizona-irq.c                     | 5 +++--=0D
 drivers/mfd/db8500-prcmu.c                    | 2 +-=0D
 drivers/mfd/mfd-core.c                        | 2 +-=0D
 drivers/mfd/stmpe.c                           | 5 +++--=0D
 drivers/mfd/tc3589x.c                         | 2 +-=0D
 drivers/mfd/tps6586x.c                        | 2 +-=0D
 drivers/mfd/wm8994-irq.c                      | 5 +++--=0D
 drivers/misc/cxl/irq.c                        | 2 +-=0D
 drivers/misc/ocxl/afu_irq.c                   | 2 +-=0D
 drivers/misc/ocxl/link.c                      | 2 +-=0D
 drivers/net/dsa/mv88e6xxx/chip.c              | 2 +-=0D
 drivers/net/dsa/mv88e6xxx/global2.c           | 2 +-=0D
 drivers/net/dsa/qca/ar9331.c                  | 2 +-=0D
 drivers/net/dsa/rtl8366rb.c                   | 3 ++-=0D
 drivers/net/ethernet/ibm/ibmvnic.c            | 4 ++--=0D
 drivers/net/usb/lan78xx.c                     | 2 +-=0D
 drivers/pci/controller/pci-ftpci100.c         | 2 +-=0D
 drivers/pci/controller/pci-tegra.c            | 2 +-=0D
 drivers/pci/controller/pcie-rcar-host.c       | 2 +-=0D
 drivers/pci/controller/pcie-xilinx-cpm.c      | 4 ++--=0D
 drivers/pci/controller/pcie-xilinx.c          | 2 +-=0D
 drivers/pinctrl/mediatek/mtk-eint.c           | 2 +-=0D
 drivers/pinctrl/nomadik/pinctrl-abx500.c      | 3 ++-=0D
 drivers/pinctrl/pinctrl-at91-pio4.c           | 3 ++-=0D
 drivers/pinctrl/pinctrl-rockchip.c            | 2 +-=0D
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 2 +-=0D
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-=0D
 drivers/power/supply/lp8788-charger.c         | 2 +-=0D
 drivers/rtc/rtc-lp8788.c                      | 2 +-=0D
 drivers/rtc/rtc-max8997.c                     | 3 ++-=0D
 drivers/rtc/rtc-max8998.c                     | 3 ++-=0D
 drivers/scsi/cxlflash/ocxl_hw.c               | 2 +-=0D
 drivers/ssb/driver_gpio.c                     | 4 ++--=0D
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 2 +-=0D
 drivers/staging/octeon-usb/octeon-hcd.c       | 2 +-=0D
 drivers/tty/hvc/hvsi.c                        | 2 +-=0D
 drivers/tty/serial/pmac_zilog.c               | 6 +++---=0D
 drivers/watchdog/octeon-wdt-main.c            | 2 +-=0D
 include/linux/irqdomain.h                     | 3 ++-=0D
 kernel/irq/irqdomain.c                        | 8 +++++---=0D
 sound/soc/codecs/rt5677.c                     | 2 +-=0D
 123 files changed, 171 insertions(+), 146 deletions(-)=0D
=0D
-- =0D
2.28.0=0D
=0D

