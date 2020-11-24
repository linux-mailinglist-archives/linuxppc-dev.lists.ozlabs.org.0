Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA132C3259
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 22:10:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgc9Q2d4FzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:10:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BgH7q06R; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BgH7q06R; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgc7W0jPkzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 08:08:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606252096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WuJKBZA7v6dln/Ze4aIM10HFqbp/pynhdLtgpd/B4c=;
 b=BgH7q06RGBxVzoi8snSCP99AhvlzO+TMO3E647Gsy5rw/ZZ87sQq4JVPIvAl0e+oqOAJYd
 hyinoFw4VDqidWzRw4MfkNDiGcHQEj1Lk+/h7qn9qhq9lPA3HzWlwx3CP2OPNcwup0zWjw
 Luuux2hgh0Do5jDq/mZkrzcyNpyor2s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606252096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WuJKBZA7v6dln/Ze4aIM10HFqbp/pynhdLtgpd/B4c=;
 b=BgH7q06RGBxVzoi8snSCP99AhvlzO+TMO3E647Gsy5rw/ZZ87sQq4JVPIvAl0e+oqOAJYd
 hyinoFw4VDqidWzRw4MfkNDiGcHQEj1Lk+/h7qn9qhq9lPA3HzWlwx3CP2OPNcwup0zWjw
 Luuux2hgh0Do5jDq/mZkrzcyNpyor2s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-TNd2_4DdPb2kYYS-8b9nBQ-1; Tue, 24 Nov 2020 16:08:11 -0500
X-MC-Unique: TNd2_4DdPb2kYYS-8b9nBQ-1
Received: by mail-wm1-f72.google.com with SMTP id y26so12355wmj.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 13:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9WuJKBZA7v6dln/Ze4aIM10HFqbp/pynhdLtgpd/B4c=;
 b=GzB2jdjmLwGezaAtIgnzDPTS5xGp2imHTIfGCsHcC2oU8YJuvBGHuyh5e+NKqzwp5q
 tNmo7SN0SuiJxMK3QaNzst8PW6S4YhO/KlfOh8MAKARfaoeILYvG89OPUmn9YjXhO/I6
 mKdYZGY4gKfWlHzZ7LhrlA90MHjQLK4oAiiZ0I8xrE7xNvM55PvyNb7RjHoY0iMdETRD
 INyzEVyv5c0hJvYLu438JqFaUI1+PYfc4nn4+ey6TLVc9l3Zp6hsNsGbsVCOhlJ5FBlh
 xr6YL7T36rFrjFH/Qpzjsw8pkedO6bnMf5ULBgxmp0Cw6i1NWy3MZoxJWkdhM5UmS8PL
 L7jg==
X-Gm-Message-State: AOAM532wrdjGFpPYVubIvwvzELPK0y4KagSbloYzvtKOwuO15R0kc/+c
 kAkeiPnhb/cyCiCQ0CFQHr3huL+l6FV/cW6h8WtRPWhOU4m/+PlgJ4bjctJXdINU0NdGNUWb+dl
 l1jY2QmpRS/ojGM4gktcwaE2wdw==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr381873wrv.193.1606252090787; 
 Tue, 24 Nov 2020 13:08:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoKIBssI4HGDyzY0qu85iBHGqHaEokuLsbgGjIwpz+g5/1A4bY+pROXvrDQETbZQrYR4rQSg==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr381855wrv.193.1606252090578; 
 Tue, 24 Nov 2020 13:08:10 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w3sm193480wma.3.2020.11.24.13.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:08:09 -0800 (PST)
Date: Tue, 24 Nov 2020 16:08:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] powerpc/pseries: fix MSI/X IRQ affinity on pseries
Message-ID: <20201124160747-mutt-send-email-mst@kernel.org>
References: <20201124200308.1110744-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201124200308.1110744-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 09:03:06PM +0100, Laurent Vivier wrote:
> With virtio, in multiqueue case, each queue IRQ is normally
> bound to a different CPU using the affinity mask.
> 
> This works fine on x86_64 but totally ignored on pseries.
> 
> This is not obvious at first look because irqbalance is doing
> some balancing to improve that.
> 
> It appears that the "managed" flag set in the MSI entry
> is never copied to the system IRQ entry.
> 
> This series passes the affinity mask from rtas_setup_msi_irqs()
> to irq_domain_alloc_descs() by adding an affinity parameter to
> irq_create_mapping().
> 
> The first patch adds the parameter (no functional change), the
> second patch passes the actual affinity mask to irq_create_mapping()
> in rtas_setup_msi_irqs().
> 
> For instance, with 32 CPUs VM and 32 queues virtio-scsi interface:
> 
> ... -smp 32 -device virtio-scsi-pci,id=virtio_scsi_pci0,num_queues=32
> 
> for IRQ in $(grep virtio2-request /proc/interrupts |cut -d: -f1); do
>     for file in /proc/irq/$IRQ/ ; do
>         echo -n "IRQ: $(basename $file) CPU: " ; cat $file/smp_affinity_list
>     done
> done
> 
> Without the patch (and without irqbalanced)
> 
> IRQ: 268 CPU: 0-31
> IRQ: 269 CPU: 0-31
> IRQ: 270 CPU: 0-31
> IRQ: 271 CPU: 0-31
> IRQ: 272 CPU: 0-31
> IRQ: 273 CPU: 0-31
> IRQ: 274 CPU: 0-31
> IRQ: 275 CPU: 0-31
> IRQ: 276 CPU: 0-31
> IRQ: 277 CPU: 0-31
> IRQ: 278 CPU: 0-31
> IRQ: 279 CPU: 0-31
> IRQ: 280 CPU: 0-31
> IRQ: 281 CPU: 0-31
> IRQ: 282 CPU: 0-31
> IRQ: 283 CPU: 0-31
> IRQ: 284 CPU: 0-31
> IRQ: 285 CPU: 0-31
> IRQ: 286 CPU: 0-31
> IRQ: 287 CPU: 0-31
> IRQ: 288 CPU: 0-31
> IRQ: 289 CPU: 0-31
> IRQ: 290 CPU: 0-31
> IRQ: 291 CPU: 0-31
> IRQ: 292 CPU: 0-31
> IRQ: 293 CPU: 0-31
> IRQ: 294 CPU: 0-31
> IRQ: 295 CPU: 0-31
> IRQ: 296 CPU: 0-31
> IRQ: 297 CPU: 0-31
> IRQ: 298 CPU: 0-31
> IRQ: 299 CPU: 0-31
> 
> With the patch:
> 
> IRQ: 265 CPU: 0
> IRQ: 266 CPU: 1
> IRQ: 267 CPU: 2
> IRQ: 268 CPU: 3
> IRQ: 269 CPU: 4
> IRQ: 270 CPU: 5
> IRQ: 271 CPU: 6
> IRQ: 272 CPU: 7
> IRQ: 273 CPU: 8
> IRQ: 274 CPU: 9
> IRQ: 275 CPU: 10
> IRQ: 276 CPU: 11
> IRQ: 277 CPU: 12
> IRQ: 278 CPU: 13
> IRQ: 279 CPU: 14
> IRQ: 280 CPU: 15
> IRQ: 281 CPU: 16
> IRQ: 282 CPU: 17
> IRQ: 283 CPU: 18
> IRQ: 284 CPU: 19
> IRQ: 285 CPU: 20
> IRQ: 286 CPU: 21
> IRQ: 287 CPU: 22
> IRQ: 288 CPU: 23
> IRQ: 289 CPU: 24
> IRQ: 290 CPU: 25
> IRQ: 291 CPU: 26
> IRQ: 292 CPU: 27
> IRQ: 293 CPU: 28
> IRQ: 294 CPU: 29
> IRQ: 295 CPU: 30
> IRQ: 299 CPU: 31
> 
> This matches what we have on an x86_64 system.


Makes sense to me. FWIW

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Laurent Vivier (2):
>   genirq: add an affinity parameter to irq_create_mapping()
>   powerpc/pseries: pass MSI affinity to irq_create_mapping()
> 
>  arch/arc/kernel/intc-arcv2.c                  | 4 ++--
>  arch/arc/kernel/mcip.c                        | 2 +-
>  arch/arm/common/sa1111.c                      | 2 +-
>  arch/arm/mach-s3c/irq-s3c24xx.c               | 3 ++-
>  arch/arm/plat-orion/gpio.c                    | 2 +-
>  arch/mips/ath25/ar2315.c                      | 4 ++--
>  arch/mips/ath25/ar5312.c                      | 4 ++--
>  arch/mips/lantiq/irq.c                        | 2 +-
>  arch/mips/pci/pci-ar2315.c                    | 3 ++-
>  arch/mips/pic32/pic32mzda/time.c              | 2 +-
>  arch/mips/ralink/irq.c                        | 2 +-
>  arch/powerpc/kernel/pci-common.c              | 2 +-
>  arch/powerpc/kvm/book3s_xive.c                | 2 +-
>  arch/powerpc/platforms/44x/ppc476.c           | 4 ++--
>  arch/powerpc/platforms/cell/interrupt.c       | 4 ++--
>  arch/powerpc/platforms/cell/iommu.c           | 3 ++-
>  arch/powerpc/platforms/cell/pmu.c             | 2 +-
>  arch/powerpc/platforms/cell/spider-pic.c      | 2 +-
>  arch/powerpc/platforms/cell/spu_manage.c      | 6 +++---
>  arch/powerpc/platforms/maple/pci.c            | 2 +-
>  arch/powerpc/platforms/pasemi/dma_lib.c       | 5 +++--
>  arch/powerpc/platforms/pasemi/msi.c           | 2 +-
>  arch/powerpc/platforms/pasemi/setup.c         | 4 ++--
>  arch/powerpc/platforms/powermac/pci.c         | 2 +-
>  arch/powerpc/platforms/powermac/pic.c         | 2 +-
>  arch/powerpc/platforms/powermac/smp.c         | 2 +-
>  arch/powerpc/platforms/powernv/opal-irqchip.c | 5 +++--
>  arch/powerpc/platforms/powernv/pci.c          | 2 +-
>  arch/powerpc/platforms/powernv/vas.c          | 2 +-
>  arch/powerpc/platforms/ps3/interrupt.c        | 2 +-
>  arch/powerpc/platforms/pseries/ibmebus.c      | 2 +-
>  arch/powerpc/platforms/pseries/msi.c          | 2 +-
>  arch/powerpc/sysdev/fsl_mpic_err.c            | 2 +-
>  arch/powerpc/sysdev/fsl_msi.c                 | 2 +-
>  arch/powerpc/sysdev/mpic.c                    | 3 ++-
>  arch/powerpc/sysdev/mpic_u3msi.c              | 2 +-
>  arch/powerpc/sysdev/xics/xics-common.c        | 2 +-
>  arch/powerpc/sysdev/xive/common.c             | 2 +-
>  arch/sh/boards/mach-se/7343/irq.c             | 2 +-
>  arch/sh/boards/mach-se/7722/irq.c             | 2 +-
>  arch/sh/boards/mach-x3proto/gpio.c            | 2 +-
>  arch/xtensa/kernel/perf_event.c               | 2 +-
>  arch/xtensa/kernel/smp.c                      | 2 +-
>  arch/xtensa/kernel/time.c                     | 2 +-
>  drivers/ata/pata_macio.c                      | 2 +-
>  drivers/base/regmap/regmap-irq.c              | 2 +-
>  drivers/bus/moxtet.c                          | 2 +-
>  drivers/clocksource/ingenic-timer.c           | 2 +-
>  drivers/clocksource/timer-riscv.c             | 2 +-
>  drivers/extcon/extcon-max8997.c               | 3 ++-
>  drivers/gpio/gpio-bcm-kona.c                  | 2 +-
>  drivers/gpio/gpio-brcmstb.c                   | 2 +-
>  drivers/gpio/gpio-davinci.c                   | 2 +-
>  drivers/gpio/gpio-em.c                        | 3 ++-
>  drivers/gpio/gpio-grgpio.c                    | 2 +-
>  drivers/gpio/gpio-mockup.c                    | 2 +-
>  drivers/gpio/gpio-mpc8xxx.c                   | 2 +-
>  drivers/gpio/gpio-mvebu.c                     | 2 +-
>  drivers/gpio/gpio-tb10x.c                     | 2 +-
>  drivers/gpio/gpio-tegra.c                     | 2 +-
>  drivers/gpio/gpio-wm831x.c                    | 2 +-
>  drivers/gpio/gpiolib.c                        | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       | 3 ++-
>  drivers/gpu/ipu-v3/ipu-common.c               | 2 +-
>  drivers/hid/hid-rmi.c                         | 2 +-
>  drivers/i2c/busses/i2c-cht-wc.c               | 2 +-
>  drivers/i2c/i2c-core-base.c                   | 2 +-
>  drivers/i2c/muxes/i2c-mux-pca954x.c           | 2 +-
>  drivers/ide/pmac.c                            | 2 +-
>  drivers/iio/dummy/iio_dummy_evgen.c           | 3 ++-
>  drivers/input/rmi4/rmi_bus.c                  | 2 +-
>  drivers/irqchip/irq-ath79-misc.c              | 3 ++-
>  drivers/irqchip/irq-bcm2835.c                 | 3 ++-
>  drivers/irqchip/irq-csky-mpintc.c             | 2 +-
>  drivers/irqchip/irq-eznps.c                   | 2 +-
>  drivers/irqchip/irq-mips-gic.c                | 8 +++++---
>  drivers/irqchip/irq-mmp.c                     | 4 ++--
>  drivers/irqchip/irq-versatile-fpga.c          | 2 +-
>  drivers/irqchip/irq-vic.c                     | 2 +-
>  drivers/macintosh/macio_asic.c                | 2 +-
>  drivers/memory/omap-gpmc.c                    | 2 +-
>  drivers/mfd/ab8500-core.c                     | 2 +-
>  drivers/mfd/arizona-irq.c                     | 5 +++--
>  drivers/mfd/db8500-prcmu.c                    | 2 +-
>  drivers/mfd/mfd-core.c                        | 2 +-
>  drivers/mfd/stmpe.c                           | 5 +++--
>  drivers/mfd/tc3589x.c                         | 2 +-
>  drivers/mfd/tps6586x.c                        | 2 +-
>  drivers/mfd/wm8994-irq.c                      | 5 +++--
>  drivers/misc/cxl/irq.c                        | 2 +-
>  drivers/misc/ocxl/afu_irq.c                   | 2 +-
>  drivers/misc/ocxl/link.c                      | 2 +-
>  drivers/net/dsa/mv88e6xxx/chip.c              | 2 +-
>  drivers/net/dsa/mv88e6xxx/global2.c           | 2 +-
>  drivers/net/dsa/qca/ar9331.c                  | 2 +-
>  drivers/net/dsa/rtl8366rb.c                   | 3 ++-
>  drivers/net/ethernet/ibm/ibmvnic.c            | 4 ++--
>  drivers/net/usb/lan78xx.c                     | 2 +-
>  drivers/pci/controller/pci-ftpci100.c         | 2 +-
>  drivers/pci/controller/pci-tegra.c            | 2 +-
>  drivers/pci/controller/pcie-rcar-host.c       | 2 +-
>  drivers/pci/controller/pcie-xilinx-cpm.c      | 4 ++--
>  drivers/pci/controller/pcie-xilinx.c          | 2 +-
>  drivers/pinctrl/mediatek/mtk-eint.c           | 2 +-
>  drivers/pinctrl/nomadik/pinctrl-abx500.c      | 3 ++-
>  drivers/pinctrl/pinctrl-at91-pio4.c           | 3 ++-
>  drivers/pinctrl/pinctrl-rockchip.c            | 2 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.c     | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
>  drivers/power/supply/lp8788-charger.c         | 2 +-
>  drivers/rtc/rtc-lp8788.c                      | 2 +-
>  drivers/rtc/rtc-max8997.c                     | 3 ++-
>  drivers/rtc/rtc-max8998.c                     | 3 ++-
>  drivers/scsi/cxlflash/ocxl_hw.c               | 2 +-
>  drivers/ssb/driver_gpio.c                     | 4 ++--
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 2 +-
>  drivers/staging/octeon-usb/octeon-hcd.c       | 2 +-
>  drivers/tty/hvc/hvsi.c                        | 2 +-
>  drivers/tty/serial/pmac_zilog.c               | 6 +++---
>  drivers/watchdog/octeon-wdt-main.c            | 2 +-
>  include/linux/irqdomain.h                     | 3 ++-
>  kernel/irq/irqdomain.c                        | 8 +++++---
>  sound/soc/codecs/rt5677.c                     | 2 +-
>  123 files changed, 171 insertions(+), 146 deletions(-)
> 
> -- 
> 2.28.0
> 

