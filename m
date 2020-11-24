Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C42C31A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:05:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZkd4mBhzDqXd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:05:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RZH+rhU6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RZH+rhU6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZhg6GRDzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 07:03:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBqagyHf5Ec7jKNc63jZMOiv4NN5fmqWEUQCXnRLhKE=;
 b=RZH+rhU61wMG7xD9xe4LFE7ASS+vTs8roi4yYxuVKiufBJWjRhNCMHUPFBZWTaBFlPOE3Y
 p4wMxpjlk7azLcWHJFQ7gUNRlmgvdRM+kOrj+rkBlh9XGsS85gjLGlSYsp/BRUFvDiQfUx
 RIJCTnne0CsGkE2+pkEMp/yHqmWGOXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBqagyHf5Ec7jKNc63jZMOiv4NN5fmqWEUQCXnRLhKE=;
 b=RZH+rhU61wMG7xD9xe4LFE7ASS+vTs8roi4yYxuVKiufBJWjRhNCMHUPFBZWTaBFlPOE3Y
 p4wMxpjlk7azLcWHJFQ7gUNRlmgvdRM+kOrj+rkBlh9XGsS85gjLGlSYsp/BRUFvDiQfUx
 RIJCTnne0CsGkE2+pkEMp/yHqmWGOXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-bNeGSUIQO8e95iz9oGZLtg-1; Tue, 24 Nov 2020 15:03:23 -0500
X-MC-Unique: bNeGSUIQO8e95iz9oGZLtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49472180E461;
 Tue, 24 Nov 2020 20:03:21 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC4C5D6AB;
 Tue, 24 Nov 2020 20:03:17 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] genirq: add an affinity parameter to irq_create_mapping()
Date: Tue, 24 Nov 2020 21:03:07 +0100
Message-Id: <20201124200308.1110744-2-lvivier@redhat.com>
In-Reply-To: <20201124200308.1110744-1-lvivier@redhat.com>
References: <20201124200308.1110744-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This parameter is needed to pass it to irq_domain_alloc_descs().

This seems to have been missed by
o06ee6d571f0e ("genirq: Add affinity hint to irq allocation")

This is needed to implement proper support for multiqueue with pseries.

All irq_create_mapping() callers have been updated with the help
of the following coccinelle script:
@@
expression a, b;
@@
<...
- irq_create_mapping(a, b)
+ irq_create_mapping(a, b, NULL)
...>

With some manual changes to comply with checkpatch errors.

No functional change.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 arch/arc/kernel/intc-arcv2.c                  | 4 ++--
 arch/arc/kernel/mcip.c                        | 2 +-
 arch/arm/common/sa1111.c                      | 2 +-
 arch/arm/mach-s3c/irq-s3c24xx.c               | 3 ++-
 arch/arm/plat-orion/gpio.c                    | 2 +-
 arch/mips/ath25/ar2315.c                      | 4 ++--
 arch/mips/ath25/ar5312.c                      | 4 ++--
 arch/mips/lantiq/irq.c                        | 2 +-
 arch/mips/pci/pci-ar2315.c                    | 3 ++-
 arch/mips/pic32/pic32mzda/time.c              | 2 +-
 arch/mips/ralink/irq.c                        | 2 +-
 arch/powerpc/kernel/pci-common.c              | 2 +-
 arch/powerpc/kvm/book3s_xive.c                | 2 +-
 arch/powerpc/platforms/44x/ppc476.c           | 4 ++--
 arch/powerpc/platforms/cell/interrupt.c       | 4 ++--
 arch/powerpc/platforms/cell/iommu.c           | 3 ++-
 arch/powerpc/platforms/cell/pmu.c             | 2 +-
 arch/powerpc/platforms/cell/spider-pic.c      | 2 +-
 arch/powerpc/platforms/cell/spu_manage.c      | 6 +++---
 arch/powerpc/platforms/maple/pci.c            | 2 +-
 arch/powerpc/platforms/pasemi/dma_lib.c       | 5 +++--
 arch/powerpc/platforms/pasemi/msi.c           | 2 +-
 arch/powerpc/platforms/pasemi/setup.c         | 4 ++--
 arch/powerpc/platforms/powermac/pci.c         | 2 +-
 arch/powerpc/platforms/powermac/pic.c         | 2 +-
 arch/powerpc/platforms/powermac/smp.c         | 2 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c | 5 +++--
 arch/powerpc/platforms/powernv/pci.c          | 2 +-
 arch/powerpc/platforms/powernv/vas.c          | 2 +-
 arch/powerpc/platforms/ps3/interrupt.c        | 2 +-
 arch/powerpc/platforms/pseries/ibmebus.c      | 2 +-
 arch/powerpc/platforms/pseries/msi.c          | 2 +-
 arch/powerpc/sysdev/fsl_mpic_err.c            | 2 +-
 arch/powerpc/sysdev/fsl_msi.c                 | 2 +-
 arch/powerpc/sysdev/mpic.c                    | 3 ++-
 arch/powerpc/sysdev/mpic_u3msi.c              | 2 +-
 arch/powerpc/sysdev/xics/xics-common.c        | 2 +-
 arch/powerpc/sysdev/xive/common.c             | 2 +-
 arch/sh/boards/mach-se/7343/irq.c             | 2 +-
 arch/sh/boards/mach-se/7722/irq.c             | 2 +-
 arch/sh/boards/mach-x3proto/gpio.c            | 2 +-
 arch/xtensa/kernel/perf_event.c               | 2 +-
 arch/xtensa/kernel/smp.c                      | 2 +-
 arch/xtensa/kernel/time.c                     | 2 +-
 drivers/ata/pata_macio.c                      | 2 +-
 drivers/base/regmap/regmap-irq.c              | 2 +-
 drivers/bus/moxtet.c                          | 2 +-
 drivers/clocksource/ingenic-timer.c           | 2 +-
 drivers/clocksource/timer-riscv.c             | 2 +-
 drivers/extcon/extcon-max8997.c               | 3 ++-
 drivers/gpio/gpio-bcm-kona.c                  | 2 +-
 drivers/gpio/gpio-brcmstb.c                   | 2 +-
 drivers/gpio/gpio-davinci.c                   | 2 +-
 drivers/gpio/gpio-em.c                        | 3 ++-
 drivers/gpio/gpio-grgpio.c                    | 2 +-
 drivers/gpio/gpio-mockup.c                    | 2 +-
 drivers/gpio/gpio-mpc8xxx.c                   | 2 +-
 drivers/gpio/gpio-mvebu.c                     | 2 +-
 drivers/gpio/gpio-tb10x.c                     | 2 +-
 drivers/gpio/gpio-tegra.c                     | 2 +-
 drivers/gpio/gpio-wm831x.c                    | 2 +-
 drivers/gpio/gpiolib.c                        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       | 3 ++-
 drivers/gpu/ipu-v3/ipu-common.c               | 2 +-
 drivers/hid/hid-rmi.c                         | 2 +-
 drivers/i2c/busses/i2c-cht-wc.c               | 2 +-
 drivers/i2c/i2c-core-base.c                   | 2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 2 +-
 drivers/ide/pmac.c                            | 2 +-
 drivers/iio/dummy/iio_dummy_evgen.c           | 3 ++-
 drivers/input/rmi4/rmi_bus.c                  | 2 +-
 drivers/irqchip/irq-ath79-misc.c              | 3 ++-
 drivers/irqchip/irq-bcm2835.c                 | 3 ++-
 drivers/irqchip/irq-csky-mpintc.c             | 2 +-
 drivers/irqchip/irq-eznps.c                   | 2 +-
 drivers/irqchip/irq-mips-gic.c                | 8 +++++---
 drivers/irqchip/irq-mmp.c                     | 4 ++--
 drivers/irqchip/irq-versatile-fpga.c          | 2 +-
 drivers/irqchip/irq-vic.c                     | 2 +-
 drivers/macintosh/macio_asic.c                | 2 +-
 drivers/memory/omap-gpmc.c                    | 2 +-
 drivers/mfd/ab8500-core.c                     | 2 +-
 drivers/mfd/arizona-irq.c                     | 5 +++--
 drivers/mfd/db8500-prcmu.c                    | 2 +-
 drivers/mfd/mfd-core.c                        | 2 +-
 drivers/mfd/stmpe.c                           | 5 +++--
 drivers/mfd/tc3589x.c                         | 2 +-
 drivers/mfd/tps6586x.c                        | 2 +-
 drivers/mfd/wm8994-irq.c                      | 5 +++--
 drivers/misc/cxl/irq.c                        | 2 +-
 drivers/misc/ocxl/afu_irq.c                   | 2 +-
 drivers/misc/ocxl/link.c                      | 2 +-
 drivers/net/dsa/mv88e6xxx/chip.c              | 2 +-
 drivers/net/dsa/mv88e6xxx/global2.c           | 2 +-
 drivers/net/dsa/qca/ar9331.c                  | 2 +-
 drivers/net/dsa/rtl8366rb.c                   | 3 ++-
 drivers/net/ethernet/ibm/ibmvnic.c            | 4 ++--
 drivers/net/usb/lan78xx.c                     | 2 +-
 drivers/pci/controller/pci-ftpci100.c         | 2 +-
 drivers/pci/controller/pci-tegra.c            | 2 +-
 drivers/pci/controller/pcie-rcar-host.c       | 2 +-
 drivers/pci/controller/pcie-xilinx-cpm.c      | 4 ++--
 drivers/pci/controller/pcie-xilinx.c          | 2 +-
 drivers/pinctrl/mediatek/mtk-eint.c           | 2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c      | 3 ++-
 drivers/pinctrl/pinctrl-at91-pio4.c           | 3 ++-
 drivers/pinctrl/pinctrl-rockchip.c            | 2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
 drivers/power/supply/lp8788-charger.c         | 2 +-
 drivers/rtc/rtc-lp8788.c                      | 2 +-
 drivers/rtc/rtc-max8997.c                     | 3 ++-
 drivers/rtc/rtc-max8998.c                     | 3 ++-
 drivers/scsi/cxlflash/ocxl_hw.c               | 2 +-
 drivers/ssb/driver_gpio.c                     | 4 ++--
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 2 +-
 drivers/staging/octeon-usb/octeon-hcd.c       | 2 +-
 drivers/tty/hvc/hvsi.c                        | 2 +-
 drivers/tty/serial/pmac_zilog.c               | 6 +++---
 drivers/watchdog/octeon-wdt-main.c            | 2 +-
 include/linux/irqdomain.h                     | 3 ++-
 kernel/irq/irqdomain.c                        | 8 +++++---
 sound/soc/codecs/rt5677.c                     | 2 +-
 123 files changed, 171 insertions(+), 146 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 5cda19d0aa91..dc647deadaa1 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -181,9 +181,9 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 	irq_set_default_host(root_domain);
 
 #ifdef CONFIG_SMP
-	irq_create_mapping(root_domain, IPI_IRQ);
+	irq_create_mapping(root_domain, IPI_IRQ, NULL);
 #endif
-	irq_create_mapping(root_domain, SOFTIRQ_IRQ);
+	irq_create_mapping(root_domain, SOFTIRQ_IRQ, NULL);
 
 	return 0;
 }
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index abf9398cc333..23261e94964a 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -409,7 +409,7 @@ idu_of_init(struct device_node *intc, struct device_node *parent)
 		 * however we need it to get the parent virq and set IDU handler
 		 * as first level isr
 		 */
-		virq = irq_create_mapping(NULL, i + FIRST_EXT_IRQ);
+		virq = irq_create_mapping(NULL, i + FIRST_EXT_IRQ, NULL);
 		BUG_ON(!virq);
 		irq_set_chained_handler_and_data(virq, idu_cascade_isr, domain);
 	}
diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index f89c1ea327a2..1b2a8b4447d0 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -193,7 +193,7 @@ static struct sa1111_dev_info sa1111_devices[] = {
 
 static int sa1111_map_irq(struct sa1111 *sachip, irq_hw_number_t hwirq)
 {
-	return irq_create_mapping(sachip->irqdomain, hwirq);
+	return irq_create_mapping(sachip->irqdomain, hwirq, NULL);
 }
 
 static void sa1111_handle_irqdomain(struct irq_domain *irqdomain, int irq)
diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
index 79b5f19af7a5..2e98dc1b3c09 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c/irq-s3c24xx.c
@@ -1201,7 +1201,8 @@ static int s3c24xx_irq_xlate_of(struct irq_domain *d, struct device_node *n,
 		parent_irq_data->sub_bits |= (1UL << intspec[2]);
 
 		/* parent_intc is always s3c_intc[0], so no offset */
-		irqno = irq_create_mapping(parent_intc->domain, intspec[1]);
+		irqno = irq_create_mapping(parent_intc->domain, intspec[1],
+					   NULL);
 		if (irqno < 0) {
 			pr_err("irq: could not map parent interrupt\n");
 			return irqno;
diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 734f0be4f14a..8699eaad88fa 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -225,7 +225,7 @@ static int orion_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 
 	return irq_create_mapping(ochip->domain,
-				  ochip->secondary_irq_base + pin);
+				  ochip->secondary_irq_base + pin, NULL);
 }
 
 /*
diff --git a/arch/mips/ath25/ar2315.c b/arch/mips/ath25/ar2315.c
index 9dbed7b5ea76..f3bc26e877f4 100644
--- a/arch/mips/ath25/ar2315.c
+++ b/arch/mips/ath25/ar2315.c
@@ -154,7 +154,7 @@ void __init ar2315_arch_init_irq(void)
 	if (!domain)
 		panic("Failed to add IRQ domain");
 
-	irq = irq_create_mapping(domain, AR2315_MISC_IRQ_AHB);
+	irq = irq_create_mapping(domain, AR2315_MISC_IRQ_AHB, NULL);
 	if (request_irq(irq, ar2315_ahb_err_handler, 0, "ar2315-ahb-error",
 			NULL))
 		pr_err("Failed to register ar2315-ahb-error interrupt\n");
@@ -327,7 +327,7 @@ static struct resource ar2315_pci_res[] = {
 void __init ar2315_arch_init(void)
 {
 	unsigned irq = irq_create_mapping(ar2315_misc_irq_domain,
-					  AR2315_MISC_IRQ_UART0);
+					  AR2315_MISC_IRQ_UART0, NULL);
 
 	ath25_serial_setup(AR2315_UART0_BASE, irq, ar2315_apb_frequency());
 
diff --git a/arch/mips/ath25/ar5312.c b/arch/mips/ath25/ar5312.c
index 23c879f4b734..578bffe23ff2 100644
--- a/arch/mips/ath25/ar5312.c
+++ b/arch/mips/ath25/ar5312.c
@@ -149,7 +149,7 @@ void __init ar5312_arch_init_irq(void)
 	if (!domain)
 		panic("Failed to add IRQ domain");
 
-	irq = irq_create_mapping(domain, AR5312_MISC_IRQ_AHB_PROC);
+	irq = irq_create_mapping(domain, AR5312_MISC_IRQ_AHB_PROC, NULL);
 	if (request_irq(irq, ar5312_ahb_err_handler, 0, "ar5312-ahb-error",
 			NULL))
 		pr_err("Failed to register ar5312-ahb-error interrupt\n");
@@ -385,7 +385,7 @@ void __init ar5312_plat_mem_setup(void)
 void __init ar5312_arch_init(void)
 {
 	unsigned irq = irq_create_mapping(ar5312_misc_irq_domain,
-					  AR5312_MISC_IRQ_UART0);
+					  AR5312_MISC_IRQ_UART0, NULL);
 
 	ath25_serial_setup(AR5312_UART0_BASE, irq, ar5312_sys_frequency());
 }
diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index df8eed3875f6..fa53d6046bc7 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -381,7 +381,7 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 		&irq_domain_ops, 0);
 
 	/* tell oprofile which irq to use */
-	ltq_perfcount_irq = irq_create_mapping(ltq_domain, LTQ_PERF_IRQ);
+	ltq_perfcount_irq = irq_create_mapping(ltq_domain, LTQ_PERF_IRQ, NULL);
 
 	/* the external interrupts are optional and xway only */
 	eiu_node = of_find_compatible_node(NULL, NULL, "lantiq,eiu-xway");
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index 0b15730cef88..1cdd8539692f 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -395,7 +395,8 @@ static void ar2315_pci_irq_init(struct ar2315_pci_ctrl *apc)
 	ar2315_pci_reg_mask(apc, AR2315_PCI_IMR, (AR2315_PCI_INT_ABORT |
 			    AR2315_PCI_INT_EXT), 0);
 
-	apc->irq_ext = irq_create_mapping(apc->domain, AR2315_PCI_IRQ_EXT);
+	apc->irq_ext = irq_create_mapping(apc->domain, AR2315_PCI_IRQ_EXT,
+					  NULL);
 
 	irq_set_chained_handler_and_data(apc->irq, ar2315_pci_irq_handler,
 					 apc);
diff --git a/arch/mips/pic32/pic32mzda/time.c b/arch/mips/pic32/pic32mzda/time.c
index 7174e9abbb1b..5722a1cf8f00 100644
--- a/arch/mips/pic32/pic32mzda/time.c
+++ b/arch/mips/pic32/pic32mzda/time.c
@@ -39,7 +39,7 @@ static unsigned int pic32_xlate_core_timer_irq(void)
 
 default_map:
 
-	return irq_create_mapping(NULL, DEFAULT_CORE_TIMER_INTERRUPT);
+	return irq_create_mapping(NULL, DEFAULT_CORE_TIMER_INTERRUPT, NULL);
 }
 
 unsigned int get_c0_compare_int(void)
diff --git a/arch/mips/ralink/irq.c b/arch/mips/ralink/irq.c
index 220ca0cd7945..45db6620d151 100644
--- a/arch/mips/ralink/irq.c
+++ b/arch/mips/ralink/irq.c
@@ -186,7 +186,7 @@ static int __init intc_of_init(struct device_node *node,
 	irq_set_chained_handler_and_data(irq, ralink_intc_irq_handler, domain);
 
 	/* tell the kernel which irq is used for performance monitoring */
-	rt_perfcount_irq = irq_create_mapping(domain, 9);
+	rt_perfcount_irq = irq_create_mapping(domain, 9, NULL);
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..666c1ec92c91 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -387,7 +387,7 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 		pr_debug(" No map ! Using line %d (pin %d) from PCI config\n",
 			 line, pin);
 
-		virq = irq_create_mapping(NULL, line);
+		virq = irq_create_mapping(NULL, line, NULL);
 		if (virq)
 			irq_set_irq_type(virq, IRQ_TYPE_LEVEL_LOW);
 	}
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 85215e79db42..56e0c636e7fe 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -185,7 +185,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
 		return 0;
 
 	/* Hook up the escalation interrupt */
-	xc->esc_virq[prio] = irq_create_mapping(NULL, q->esc_irq);
+	xc->esc_virq[prio] = irq_create_mapping(NULL, q->esc_irq, NULL);
 	if (!xc->esc_virq[prio]) {
 		pr_err("Failed to map escalation interrupt for queue %d of VCPU %d\n",
 		       prio, xc->server_num);
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index 07f7e3ce67b5..9616906279ae 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -255,10 +255,10 @@ static void ppc47x_pci_irq_fixup(struct pci_dev *dev)
 	if (dev->vendor == 0x1033 && (dev->device == 0x0035 ||
 				      dev->device == 0x00e0)) {
 		if (board_rev == 0) {
-			dev->irq = irq_create_mapping(NULL, 47);
+			dev->irq = irq_create_mapping(NULL, 47, NULL);
 			pr_info("%s: Mapping irq %d\n", __func__, dev->irq);
 		} else if (board_rev == 2) {
-			dev->irq = irq_create_mapping(NULL, 49);
+			dev->irq = irq_create_mapping(NULL, 49, NULL);
 			pr_info("%s: Mapping irq %d\n", __func__, dev->irq);
 		} else {
 			pr_alert("%s: Unknown board revision\n", __func__);
diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index c0ab62ba6f16..3194bf4e7660 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -178,7 +178,7 @@ static void iic_request_ipi(int msg)
 {
 	int virq;
 
-	virq = irq_create_mapping(iic_host, iic_msg_to_irq(msg));
+	virq = irq_create_mapping(iic_host, iic_msg_to_irq(msg), NULL);
 	if (!virq) {
 		printk(KERN_ERR
 		       "iic: failed to map IPI %s\n", smp_ipi_name[msg]);
@@ -332,7 +332,7 @@ static int __init setup_iic(void)
 		cascade = node << IIC_IRQ_NODE_SHIFT;
 		cascade |= 1 << IIC_IRQ_CLASS_SHIFT;
 		cascade |= IIC_UNIT_IIC;
-		cascade = irq_create_mapping(iic_host, cascade);
+		cascade = irq_create_mapping(iic_host, cascade, NULL);
 		if (!cascade)
 			continue;
 		/*
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 2124831cf57c..02a2f15084fe 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -397,7 +397,8 @@ static void cell_iommu_enable_hardware(struct cbe_iommu *iommu)
 			IOC_IO_ExcpMask_PFE | IOC_IO_ExcpMask_SFE);
 
 	virq = irq_create_mapping(NULL,
-			IIC_IRQ_IOEX_ATI | (iommu->nid << IIC_IRQ_NODE_SHIFT));
+			IIC_IRQ_IOEX_ATI | (iommu->nid << IIC_IRQ_NODE_SHIFT),
+			NULL);
 	BUG_ON(!virq);
 
 	ret = request_irq(virq, ioc_interrupt, 0, iommu->name, iommu);
diff --git a/arch/powerpc/platforms/cell/pmu.c b/arch/powerpc/platforms/cell/pmu.c
index 35bbd15582af..63f404b43860 100644
--- a/arch/powerpc/platforms/cell/pmu.c
+++ b/arch/powerpc/platforms/cell/pmu.c
@@ -371,7 +371,7 @@ static int __init cbe_init_pm_irq(void)
 
 	for_each_online_node(node) {
 		irq = irq_create_mapping(NULL, IIC_IRQ_IOEX_PMI |
-					       (node << IIC_IRQ_NODE_SHIFT));
+					 (node << IIC_IRQ_NODE_SHIFT), NULL);
 		if (!irq) {
 			printk("ERROR: Unable to allocate irq for node %d\n",
 			       node);
diff --git a/arch/powerpc/platforms/cell/spider-pic.c b/arch/powerpc/platforms/cell/spider-pic.c
index 210785f59271..9772ddac792c 100644
--- a/arch/powerpc/platforms/cell/spider-pic.c
+++ b/arch/powerpc/platforms/cell/spider-pic.c
@@ -267,7 +267,7 @@ static unsigned int __init spider_find_cascade_and_node(struct spider_pic *pic)
 	virq = irq_create_mapping(NULL,
 				  (pic->node_id << IIC_IRQ_NODE_SHIFT) |
 				  (2 << IIC_IRQ_CLASS_SHIFT) |
-				  unit);
+				  unit, NULL);
 	if (!virq)
 		printk(KERN_ERR "spider_pic: failed to map cascade !");
 	return virq;
diff --git a/arch/powerpc/platforms/cell/spu_manage.c b/arch/powerpc/platforms/cell/spu_manage.c
index 8e9ef65240c3..fe15f1505621 100644
--- a/arch/powerpc/platforms/cell/spu_manage.c
+++ b/arch/powerpc/platforms/cell/spu_manage.c
@@ -88,9 +88,9 @@ static int __init spu_map_interrupts_old(struct spu *spu,
 	isrc |= nid << IIC_IRQ_NODE_SHIFT;
 
 	/* Now map interrupts of all 3 classes */
-	spu->irqs[0] = irq_create_mapping(NULL, IIC_IRQ_CLASS_0 | isrc);
-	spu->irqs[1] = irq_create_mapping(NULL, IIC_IRQ_CLASS_1 | isrc);
-	spu->irqs[2] = irq_create_mapping(NULL, IIC_IRQ_CLASS_2 | isrc);
+	spu->irqs[0] = irq_create_mapping(NULL, IIC_IRQ_CLASS_0 | isrc, NULL);
+	spu->irqs[1] = irq_create_mapping(NULL, IIC_IRQ_CLASS_1 | isrc, NULL);
+	spu->irqs[2] = irq_create_mapping(NULL, IIC_IRQ_CLASS_2 | isrc, NULL);
 
 	/* Right now, we only fail if class 2 failed */
 	if (!spu->irqs[2])
diff --git a/arch/powerpc/platforms/maple/pci.c b/arch/powerpc/platforms/maple/pci.c
index c86a66d5e998..64a5adb7faae 100644
--- a/arch/powerpc/platforms/maple/pci.c
+++ b/arch/powerpc/platforms/maple/pci.c
@@ -548,7 +548,7 @@ void maple_pci_irq_fixup(struct pci_dev *dev)
 	if (u4_pcie != NULL && dev->bus->number == 0 &&
 	    pci_bus_to_host(dev->bus) == u4_pcie) {
 		printk(KERN_DEBUG "Fixup U4 PCIe IRQ\n");
-		dev->irq = irq_create_mapping(NULL, 1);
+		dev->irq = irq_create_mapping(NULL, 1, NULL);
 		if (dev->irq)
 			irq_set_irq_type(dev->irq, IRQ_TYPE_LEVEL_LOW);
 	}
diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 270fa3c0d372..e1dd83f310f0 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -188,13 +188,14 @@ void *pasemi_dma_alloc_chan(enum pasemi_dmachan_type type,
 		chno = pasemi_alloc_rx_chan();
 		chan->chno = chno;
 		chan->irq = irq_create_mapping(NULL,
-					       base_hw_irq + num_txch + chno);
+					       base_hw_irq + num_txch + chno,
+					       NULL);
 		chan->status = &dma_status->rx_sta[chno];
 		break;
 	case TXCHAN:
 		chno = pasemi_alloc_tx_chan(type);
 		chan->chno = chno;
-		chan->irq = irq_create_mapping(NULL, base_hw_irq + chno);
+		chan->irq = irq_create_mapping(NULL, base_hw_irq + chno, NULL);
 		chan->status = &dma_status->tx_sta[chno];
 		break;
 	}
diff --git a/arch/powerpc/platforms/pasemi/msi.c b/arch/powerpc/platforms/pasemi/msi.c
index d38944a1e258..0e442111ab35 100644
--- a/arch/powerpc/platforms/pasemi/msi.c
+++ b/arch/powerpc/platforms/pasemi/msi.c
@@ -103,7 +103,7 @@ static int pasemi_msi_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 			return hwirq;
 		}
 
-		virq = irq_create_mapping(msi_mpic->irqhost, hwirq);
+		virq = irq_create_mapping(msi_mpic->irqhost, hwirq, NULL);
 		if (!virq) {
 			pr_debug("pasemi_msi: failed mapping hwirq 0x%x\n",
 				  hwirq);
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index b612474f8f8e..4602c9172520 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -223,7 +223,7 @@ static void nemo_init_IRQ(struct mpic *mpic)
 	i8259_init(np, 0);
 	of_node_put(np);
 
-	gpio_virq = irq_create_mapping(NULL, 3);
+	gpio_virq = irq_create_mapping(NULL, 3, NULL);
 	irq_set_irq_type(gpio_virq, IRQ_TYPE_LEVEL_HIGH);
 	irq_set_chained_handler(gpio_virq, sb600_8259_cascade);
 	mpic_unmask_irq(irq_get_irq_data(gpio_virq));
@@ -292,7 +292,7 @@ static __init void pas_init_IRQ(void)
 	mpic_init(mpic);
 	/* The NMI/MCK source needs to be prio 15 */
 	if (nmiprop) {
-		nmi_virq = irq_create_mapping(NULL, *nmiprop);
+		nmi_virq = irq_create_mapping(NULL, *nmiprop, NULL);
 		mpic_irq_set_priority(nmi_virq, 15);
 		irq_set_irq_type(nmi_virq, IRQ_TYPE_EDGE_RISING);
 		mpic_unmask_irq(irq_get_irq_data(nmi_virq));
diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
index e35eaa9cf938..576b2ceb1520 100644
--- a/arch/powerpc/platforms/powermac/pci.c
+++ b/arch/powerpc/platforms/powermac/pci.c
@@ -866,7 +866,7 @@ void pmac_pci_irq_fixup(struct pci_dev *dev)
 	if (has_second_ohare &&
 	    dev->vendor == PCI_VENDOR_ID_DEC &&
 	    dev->device == PCI_DEVICE_ID_DEC_TULIP_PLUS) {
-		dev->irq = irq_create_mapping(NULL, 60);
+		dev->irq = irq_create_mapping(NULL, 60, NULL);
 		irq_set_irq_type(dev->irq, IRQ_TYPE_LEVEL_LOW);
 	}
 #endif /* CONFIG_PPC32 */
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 4921bccf0376..9b0be4803e21 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -378,7 +378,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 
 	printk(KERN_INFO "irq: System has %d possible interrupts\n", max_irqs);
 #ifdef CONFIG_XMON
-	i = irq_create_mapping(NULL, 20);
+	i = irq_create_mapping(NULL, 20, NULL);
 	if (request_irq(i, xmon_irq, IRQF_NO_THREAD, "NMI - XMON", NULL))
 		pr_err("Failed to register NMI-XMON interrupt\n");
 #endif
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 74ebe664b016..63b05eac23ec 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -407,7 +407,7 @@ static void __init smp_psurge_setup_cpu(int cpu_nr)
 	/* reset the entry point so if we get another intr we won't
 	 * try to startup again */
 	out_be32(psurge_start, 0x100);
-	irq = irq_create_mapping(NULL, 30);
+	irq = irq_create_mapping(NULL, 30, NULL);
 	if (request_irq(irq, psurge_ipi_intr, flags, "primary IPI", NULL))
 		printk(KERN_ERR "Couldn't get primary IPI interrupt");
 }
diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
index c164419e254d..1296debc742f 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -246,7 +246,7 @@ int __init opal_event_init(void)
 			}
 			of_property_read_string_index(opal_node, "opal-interrupts-names",
 						      i, &name);
-			virq = irq_create_mapping(NULL, hw_irq);
+			virq = irq_create_mapping(NULL, hw_irq, NULL);
 			if (!virq) {
 				pr_warn("Failed to map OPAL irq 0x%x\n", hw_irq);
 				continue;
@@ -308,6 +308,7 @@ int opal_event_request(unsigned int opal_event_nr)
 	if (WARN_ON_ONCE(!opal_event_irqchip.domain))
 		return 0;
 
-	return irq_create_mapping(opal_event_irqchip.domain, opal_event_nr);
+	return irq_create_mapping(opal_event_irqchip.domain, opal_event_nr,
+				  NULL);
 }
 EXPORT_SYMBOL(opal_event_request);
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 9b9bca169275..af94772e8a92 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -187,7 +187,7 @@ int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 				pci_name(pdev));
 			return -ENOSPC;
 		}
-		virq = irq_create_mapping(NULL, phb->msi_base + hwirq);
+		virq = irq_create_mapping(NULL, phb->msi_base + hwirq, NULL);
 		if (!virq) {
 			pr_warn("%s: Failed to map MSI to linux irq\n",
 				pci_name(pdev));
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index 598e4cd563fb..7ac568718d7f 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -110,7 +110,7 @@ static int init_vas_instance(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	vinst->virq = irq_create_mapping(NULL, hwirq);
+	vinst->virq = irq_create_mapping(NULL, hwirq, NULL);
 	if (!vinst->virq) {
 		pr_err("Inst%d: Unable to map global irq %d\n",
 				vinst->vas_id, hwirq);
diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/ps3/interrupt.c
index 78f2339ed5cb..63bca596ed39 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -178,7 +178,7 @@ static int ps3_virq_setup(enum ps3_cpu_binding cpu, unsigned long outlet,
 
 	pd = &per_cpu(ps3_private, cpu);
 
-	*virq = irq_create_mapping(NULL, outlet);
+	*virq = irq_create_mapping(NULL, outlet, NULL);
 
 	if (!*virq) {
 		FAIL("%s:%d: irq_create_mapping failed: outlet %lu\n",
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 8c6e509f6967..122cecfaf7b5 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -229,7 +229,7 @@ int ibmebus_request_irq(u32 ist, irq_handler_t handler,
 			unsigned long irq_flags, const char *devname,
 			void *dev_id)
 {
-	unsigned int irq = irq_create_mapping(NULL, ist);
+	unsigned int irq = irq_create_mapping(NULL, ist, NULL);
 
 	if (!irq)
 		return -EINVAL;
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 133f6adcb39c..42ba08eaea91 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -458,7 +458,7 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int type)
 			return hwirq;
 		}
 
-		virq = irq_create_mapping(NULL, hwirq);
+		virq = irq_create_mapping(NULL, hwirq, NULL);
 
 		if (!virq) {
 			pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);
diff --git a/arch/powerpc/sysdev/fsl_mpic_err.c b/arch/powerpc/sysdev/fsl_mpic_err.c
index 13583bbc3e8e..a35a7f845c10 100644
--- a/arch/powerpc/sysdev/fsl_mpic_err.c
+++ b/arch/powerpc/sysdev/fsl_mpic_err.c
@@ -128,7 +128,7 @@ void mpic_err_int_init(struct mpic *mpic, irq_hw_number_t irqnum)
 	unsigned int virq;
 	int ret;
 
-	virq = irq_create_mapping(mpic->irqhost, irqnum);
+	virq = irq_create_mapping(mpic->irqhost, irqnum, NULL);
 	if (!virq) {
 		pr_err("Error interrupt setup failed\n");
 		return;
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 808e7118abfc..b4597be5e794 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -243,7 +243,7 @@ static int fsl_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 			goto out_free;
 		}
 
-		virq = irq_create_mapping(msi_data->irqhost, hwirq);
+		virq = irq_create_mapping(msi_data->irqhost, hwirq, NULL);
 
 		if (!virq) {
 			dev_err(&pdev->dev, "fail mapping hwirq %i\n", hwirq);
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index b0426f28946a..b3e008f2a9fa 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1850,7 +1850,8 @@ void mpic_request_ipis(void)
 
 	for (i = 0; i < 4; i++) {
 		unsigned int vipi = irq_create_mapping(mpic->irqhost,
-						       mpic->ipi_vecs[0] + i);
+						       mpic->ipi_vecs[0] + i,
+						       NULL);
 		if (!vipi) {
 			printk(KERN_ERR "Failed to map %s\n", smp_ipi_name[i]);
 			continue;
diff --git a/arch/powerpc/sysdev/mpic_u3msi.c b/arch/powerpc/sysdev/mpic_u3msi.c
index 3861023d378a..75152e754ffa 100644
--- a/arch/powerpc/sysdev/mpic_u3msi.c
+++ b/arch/powerpc/sysdev/mpic_u3msi.c
@@ -149,7 +149,7 @@ static int u3msi_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 		msg.address_lo = addr & 0xFFFFFFFF;
 		msg.address_hi = addr >> 32;
 
-		virq = irq_create_mapping(msi_mpic->irqhost, hwirq);
+		virq = irq_create_mapping(msi_mpic->irqhost, hwirq, NULL);
 		if (!virq) {
 			pr_debug("u3msi: failed mapping hwirq 0x%x\n", hwirq);
 			msi_bitmap_free_hwirqs(&msi_mpic->msi_bitmap, hwirq, 1);
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index 7e4305c01bac..adbec8cf75fe 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -126,7 +126,7 @@ static void xics_request_ipi(void)
 {
 	unsigned int ipi;
 
-	ipi = irq_create_mapping(xics_host, XICS_IPI);
+	ipi = irq_create_mapping(xics_host, XICS_IPI, NULL);
 	BUG_ON(!ipi);
 
 	/*
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index a80440af491a..44574e2f896c 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1142,7 +1142,7 @@ static void __init xive_request_ipi(void)
 		return;
 
 	/* Initialize it */
-	virq = irq_create_mapping(xive_irq_domain, 0);
+	virq = irq_create_mapping(xive_irq_domain, 0, NULL);
 	xive_ipi_irq = virq;
 
 	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
diff --git a/arch/sh/boards/mach-se/7343/irq.c b/arch/sh/boards/mach-se/7343/irq.c
index 1aedbfe32654..85f1df61d576 100644
--- a/arch/sh/boards/mach-se/7343/irq.c
+++ b/arch/sh/boards/mach-se/7343/irq.c
@@ -55,7 +55,7 @@ static void __init se7343_domain_init(void)
 	}
 
 	for (i = 0; i < SE7343_FPGA_IRQ_NR; i++) {
-		int irq = irq_create_mapping(se7343_irq_domain, i);
+		int irq = irq_create_mapping(se7343_irq_domain, i, NULL);
 
 		if (unlikely(irq == 0)) {
 			printk("Failed to allocate IRQ %d\n", i);
diff --git a/arch/sh/boards/mach-se/7722/irq.c b/arch/sh/boards/mach-se/7722/irq.c
index 6d34592767f8..0ea80e22d58f 100644
--- a/arch/sh/boards/mach-se/7722/irq.c
+++ b/arch/sh/boards/mach-se/7722/irq.c
@@ -54,7 +54,7 @@ static void __init se7722_domain_init(void)
 	}
 
 	for (i = 0; i < SE7722_FPGA_IRQ_NR; i++) {
-		int irq = irq_create_mapping(se7722_irq_domain, i);
+		int irq = irq_create_mapping(se7722_irq_domain, i, NULL);
 
 		if (unlikely(irq == 0)) {
 			printk("Failed to allocate IRQ %d\n", i);
diff --git a/arch/sh/boards/mach-x3proto/gpio.c b/arch/sh/boards/mach-x3proto/gpio.c
index efc992f641a6..a37f92a2d091 100644
--- a/arch/sh/boards/mach-x3proto/gpio.c
+++ b/arch/sh/boards/mach-x3proto/gpio.c
@@ -50,7 +50,7 @@ static int x3proto_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 	int virq;
 
 	if (gpio < chip->ngpio)
-		virq = irq_create_mapping(x3proto_irq_domain, gpio);
+		virq = irq_create_mapping(x3proto_irq_domain, gpio, NULL);
 	else
 		virq = -ENXIO;
 
diff --git a/arch/xtensa/kernel/perf_event.c b/arch/xtensa/kernel/perf_event.c
index a0d05c8598d0..a25f7e3ffaa2 100644
--- a/arch/xtensa/kernel/perf_event.c
+++ b/arch/xtensa/kernel/perf_event.c
@@ -414,7 +414,7 @@ static int xtensa_pmu_setup(unsigned int cpu)
 static int __init xtensa_pmu_init(void)
 {
 	int ret;
-	int irq = irq_create_mapping(NULL, XCHAL_PROFILING_INTERRUPT);
+	int irq = irq_create_mapping(NULL, XCHAL_PROFILING_INTERRUPT, NULL);
 
 	ret = cpuhp_setup_state(CPUHP_AP_PERF_XTENSA_STARTING,
 				"perf/xtensa:starting", xtensa_pmu_setup,
diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index cd85a7a2722b..bcdb78f02ab3 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -56,7 +56,7 @@ static irqreturn_t ipi_interrupt(int irq, void *dev_id);
 
 void ipi_init(void)
 {
-	unsigned irq = irq_create_mapping(NULL, IPI_IRQ);
+	unsigned int irq = irq_create_mapping(NULL, IPI_IRQ, NULL);
 	if (request_irq(irq, ipi_interrupt, IRQF_PERCPU, "ipi", NULL))
 		pr_err("Failed to request irq %u (ipi)\n", irq);
 }
diff --git a/arch/xtensa/kernel/time.c b/arch/xtensa/kernel/time.c
index 77971fe4cc95..ef442f886e0d 100644
--- a/arch/xtensa/kernel/time.c
+++ b/arch/xtensa/kernel/time.c
@@ -137,7 +137,7 @@ void local_timer_setup(unsigned cpu)
 	snprintf(timer->name, sizeof(timer->name), "ccount_clockevent_%u", cpu);
 	clockevent->name = timer->name;
 	clockevent->cpumask = cpumask_of(cpu);
-	clockevent->irq = irq_create_mapping(NULL, LINUX_TIMER_INT);
+	clockevent->irq = irq_create_mapping(NULL, LINUX_TIMER_INT, NULL);
 	if (WARN(!clockevent->irq, "error: can't map timer irq"))
 		return;
 	clockevents_config_and_register(clockevent, ccount_freq,
diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index e47a28271f5b..172228e50626 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -1171,7 +1171,7 @@ static int pata_macio_attach(struct macio_dev *mdev,
 	if (macio_irq_count(mdev) == 0) {
 		dev_warn(&mdev->ofdev.dev,
 			 "No interrupts for controller, using 13\n");
-		irq = irq_create_mapping(NULL, 13);
+		irq = irq_create_mapping(NULL, 13, NULL);
 	} else
 		irq = macio_irq(mdev, 0);
 
diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index ad5c2de395d1..85839f1218ec 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -1056,7 +1056,7 @@ int regmap_irq_get_virq(struct regmap_irq_chip_data *data, int irq)
 	if (!data->chip->irqs[irq].mask)
 		return -EINVAL;
 
-	return irq_create_mapping(data->domain, irq);
+	return irq_create_mapping(data->domain, irq, NULL);
 }
 EXPORT_SYMBOL_GPL(regmap_irq_get_virq);
 
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index b20fdcbd035b..878d52417c20 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -749,7 +749,7 @@ static int moxtet_irq_setup(struct moxtet *moxtet)
 
 	for (i = 0; i < MOXTET_NIRQS; ++i)
 		if (moxtet->irq.exists & BIT(i))
-			irq_create_mapping(moxtet->irq.domain, i);
+			irq_create_mapping(moxtet->irq.domain, i, NULL);
 
 	moxtet->irq.chip = moxtet_irq_chip;
 	moxtet->irq.masked = ~0;
diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 58fd9189fab7..7b47c4bd3da6 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -167,7 +167,7 @@ static int ingenic_tcu_setup_cevt(unsigned int cpu)
 		goto err_clk_disable;
 	}
 
-	timer_virq = irq_create_mapping(domain, timer->channel);
+	timer_virq = irq_create_mapping(domain, timer->channel, NULL);
 	if (!timer_virq) {
 		err = -EINVAL;
 		goto err_clk_disable;
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index c51c5ed15aa7..17af7cd27522 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -125,7 +125,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return -ENODEV;
 	}
 
-	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
+	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER, NULL);
 	if (!riscv_clock_event_irq) {
 		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
 		return -ENODEV;
diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
index 337b0eea4e62..0c7b6737e3d3 100644
--- a/drivers/extcon/extcon-max8997.c
+++ b/drivers/extcon/extcon-max8997.c
@@ -651,7 +651,8 @@ static int max8997_muic_probe(struct platform_device *pdev)
 		struct max8997_muic_irq *muic_irq = &muic_irqs[i];
 		unsigned int virq = 0;
 
-		virq = irq_create_mapping(max8997->irq_domain, muic_irq->irq);
+		virq = irq_create_mapping(max8997->irq_domain, muic_irq->irq,
+					  NULL);
 		if (!virq) {
 			ret = -EINVAL;
 			goto err_irq;
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 1e6b427f2c4a..36890ea81ca5 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -255,7 +255,7 @@ static int bcm_kona_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 	kona_gpio = gpiochip_get_data(chip);
 	if (gpio >= kona_gpio->gpio_chip.ngpio)
 		return -ENXIO;
-	return irq_create_mapping(kona_gpio->irq_domain, gpio);
+	return irq_create_mapping(kona_gpio->irq_domain, gpio, NULL);
 }
 
 static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index fcfc1a1f1a5c..b37dd41f94c5 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -132,7 +132,7 @@ static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 
 	if (hwirq >= priv->num_gpios)
 		return -ENXIO;
-	return irq_create_mapping(priv->irq_domain, hwirq);
+	return irq_create_mapping(priv->irq_domain, hwirq, NULL);
 }
 
 /* -------------------- IRQ chip functions -------------------- */
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 6f2138503726..7973eb04923e 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -382,7 +382,7 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
 
 	if (d->irq_domain)
-		return irq_create_mapping(d->irq_domain, offset);
+		return irq_create_mapping(d->irq_domain, offset, NULL);
 	else
 		return -ENXIO;
 }
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 17a243c528ad..bfa617640894 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -224,7 +224,8 @@ static int em_gio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_create_mapping(gpio_to_priv(chip)->irq_domain, offset);
+	return irq_create_mapping(gpio_to_priv(chip)->irq_domain, offset,
+				  NULL);
 }
 
 static int em_gio_request(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index f954359c9544..839df23c2fd9 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -109,7 +109,7 @@ static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	if (priv->lirqs[offset].index < 0)
 		return -ENXIO;
 
-	return irq_create_mapping(priv->domain, offset);
+	return irq_create_mapping(priv->domain, offset, NULL);
 }
 
 /* -------------------- IRQ chip functions -------------------- */
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 67ed4f238d43..9205bee9c14a 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -247,7 +247,7 @@ static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	return irq_create_mapping(chip->irq_sim_domain, offset);
+	return irq_create_mapping(chip->irq_sim_domain, offset, NULL);
 }
 
 static void gpio_mockup_free(struct gpio_chip *gc, unsigned int offset)
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 6dfca83bcd90..69cb9a8b77d2 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -102,7 +102,7 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
 
 	if (mpc8xxx_gc->irq && offset < MPC8XXX_GPIO_PINS)
-		return irq_create_mapping(mpc8xxx_gc->irq, offset);
+		return irq_create_mapping(mpc8xxx_gc->irq, offset, NULL);
 	else
 		return -ENXIO;
 }
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 433e2c3f3fd5..92c2968136d5 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -393,7 +393,7 @@ static int mvebu_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 
-	return irq_create_mapping(mvchip->domain, pin);
+	return irq_create_mapping(mvchip->domain, pin, NULL);
 }
 
 /*
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 866201cf5f65..5498963aec9d 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -76,7 +76,7 @@ static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 
-	return irq_create_mapping(tb10x_gpio->domain, offset);
+	return irq_create_mapping(tb10x_gpio->domain, offset, NULL);
 }
 
 static int tb10x_gpio_irq_set_type(struct irq_data *data, unsigned int type)
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 86568154cdb3..5f38e39f8bea 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -655,7 +655,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	for (gpio = 0; gpio < tgi->gc.ngpio; gpio++) {
-		int irq = irq_create_mapping(tgi->irq_domain, gpio);
+		int irq = irq_create_mapping(tgi->irq_domain, gpio, NULL);
 		/* No validity check; all Tegra GPIOs are valid IRQs */
 
 		bank = &tgi->bank_info[GPIO_BANK(gpio)];
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index a3a32a77041f..8d4d38587000 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -94,7 +94,7 @@ static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 
 	return irq_create_mapping(wm831x->irq_domain,
-				  WM831X_IRQ_GPIO_1 + offset);
+				  WM831X_IRQ_GPIO_1 + offset, NULL);
 }
 
 static int wm831x_gpio_set_debounce(struct wm831x *wm831x, unsigned offset,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 089ddcaa9bc6..19e71ce86c68 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1414,7 +1414,7 @@ static int gpiochip_to_irq(struct gpio_chip *gc, unsigned offset)
 	}
 #endif
 
-	return irq_create_mapping(domain, offset);
+	return irq_create_mapping(domain, offset, NULL);
 }
 
 static int gpiochip_irq_reqres(struct irq_data *d)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 300ac73b4738..3473077ed529 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -696,7 +696,8 @@ void amdgpu_irq_remove_domain(struct amdgpu_device *adev)
  */
 unsigned amdgpu_irq_create_mapping(struct amdgpu_device *adev, unsigned src_id)
 {
-	adev->irq.virq[src_id] = irq_create_mapping(adev->irq.domain, src_id);
+	adev->irq.virq[src_id] = irq_create_mapping(adev->irq.domain, src_id,
+						    NULL);
 
 	return adev->irq.virq[src_id];
 }
diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index d166ee262ce4..f734092e3483 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1051,7 +1051,7 @@ int ipu_map_irq(struct ipu_soc *ipu, int irq)
 
 	virq = irq_linear_revmap(ipu->domain, irq);
 	if (!virq)
-		virq = irq_create_mapping(ipu->domain, irq);
+		virq = irq_create_mapping(ipu->domain, irq, NULL);
 
 	return virq;
 }
diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 311eee599ce9..3fb82a59cbbd 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -632,7 +632,7 @@ static int rmi_setup_irq_domain(struct hid_device *hdev)
 	if (ret)
 		return ret;
 
-	hdata->rmi_irq = irq_create_mapping(hdata->domain, 0);
+	hdata->rmi_irq = irq_create_mapping(hdata->domain, 0, NULL);
 	if (hdata->rmi_irq <= 0) {
 		hid_err(hdev, "Can't allocate an IRQ\n");
 		return hdata->rmi_irq < 0 ? hdata->rmi_irq : -ENXIO;
diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index f80d79e973cd..b0130e051cb8 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -355,7 +355,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	if (!adap->irq_domain)
 		return -ENOMEM;
 
-	adap->client_irq = irq_create_mapping(adap->irq_domain, 0);
+	adap->client_irq = irq_create_mapping(adap->irq_domain, 0, NULL);
 	if (!adap->client_irq) {
 		ret = -ENOMEM;
 		goto remove_irq_domain;
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 573b5da145d1..6795a4122987 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -431,7 +431,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 	if (client->flags & I2C_CLIENT_TEN)
 		return -EINVAL;
 
-	irq = irq_create_mapping(adap->host_notify_domain, client->addr);
+	irq = irq_create_mapping(adap->host_notify_domain, client->addr, NULL);
 
 	return irq > 0 ? irq : -ENXIO;
 }
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 4ad665757dd8..5e793ea91e86 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -364,7 +364,7 @@ static int pca954x_irq_setup(struct i2c_mux_core *muxc)
 		return -ENODEV;
 
 	for (c = 0; c < data->chip->nchans; c++) {
-		irq = irq_create_mapping(data->irq, c);
+		irq = irq_create_mapping(data->irq, c, NULL);
 		if (!irq) {
 			dev_err(&client->dev, "failed irq create map\n");
 			return -EINVAL;
diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
index ea0b064b5f56..70e26a44f46d 100644
--- a/drivers/ide/pmac.c
+++ b/drivers/ide/pmac.c
@@ -1162,7 +1162,7 @@ static int pmac_ide_macio_attach(struct macio_dev *mdev,
 	if (macio_irq_count(mdev) == 0) {
 		printk(KERN_WARNING "ide-pmac: no intrs for device %pOF, using "
 				    "13\n", mdev->ofdev.dev.of_node);
-		irq = irq_create_mapping(NULL, 13);
+		irq = irq_create_mapping(NULL, 13, NULL);
 	} else
 		irq = macio_irq(mdev, 0);
 
diff --git a/drivers/iio/dummy/iio_dummy_evgen.c b/drivers/iio/dummy/iio_dummy_evgen.c
index 5a0072727ba4..e616aeb1b6ec 100644
--- a/drivers/iio/dummy/iio_dummy_evgen.c
+++ b/drivers/iio/dummy/iio_dummy_evgen.c
@@ -82,7 +82,8 @@ int iio_dummy_evgen_get_irq(void)
 	mutex_lock(&iio_evgen->lock);
 	for (i = 0; i < IIO_EVENTGEN_NO; i++) {
 		if (!iio_evgen->inuse[i]) {
-			ret = irq_create_mapping(iio_evgen->irq_sim_domain, i);
+			ret = irq_create_mapping(iio_evgen->irq_sim_domain, i,
+						 NULL);
 			iio_evgen->inuse[i] = true;
 			break;
 		}
diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index 47d1b97ed6cf..fda260b3f2cf 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -180,7 +180,7 @@ static int rmi_create_function_irq(struct rmi_function *fn,
 		set_bit(fn->irq_pos + i, fn->irq_mask);
 
 		fn->irq[i] = irq_create_mapping(drvdata->irqdomain,
-						fn->irq_pos + i);
+						fn->irq_pos + i, NULL);
 
 		irq_set_chip_data(fn->irq[i], fn);
 		irq_set_chip_and_handler(fn->irq[i], &rmi_irq_chip,
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 3d641bb6f3f1..31a3985d60f7 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -119,7 +119,8 @@ static void __init ath79_misc_intc_domain_init(
 {
 	void __iomem *base = domain->host_data;
 
-	ath79_perfcount_irq = irq_create_mapping(domain, ATH79_MISC_PERF_IRQ);
+	ath79_perfcount_irq = irq_create_mapping(domain, ATH79_MISC_PERF_IRQ,
+						 NULL);
 
 	/* Disable and clear all interrupts */
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
diff --git a/drivers/irqchip/irq-bcm2835.c b/drivers/irqchip/irq-bcm2835.c
index a1e004af23e7..72f877efe73d 100644
--- a/drivers/irqchip/irq-bcm2835.c
+++ b/drivers/irqchip/irq-bcm2835.c
@@ -153,7 +153,8 @@ static int __init armctrl_of_init(struct device_node *node,
 		intc.disable[b] = base + reg_disable[b];
 
 		for (i = 0; i < bank_irqs[b]; i++) {
-			irq = irq_create_mapping(intc.domain, MAKE_HWIRQ(b, i));
+			irq = irq_create_mapping(intc.domain,
+						 MAKE_HWIRQ(b, i), NULL);
 			BUG_ON(irq <= 0);
 			irq_set_chip_and_handler(irq, &armctrl_chip,
 				handle_level_irq);
diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-mpintc.c
index a1534edef7fa..272d1fdb0d86 100644
--- a/drivers/irqchip/irq-csky-mpintc.c
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -269,7 +269,7 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 	set_handle_irq(&csky_mpintc_handler);
 
 #ifdef CONFIG_SMP
-	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ);
+	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ, NULL);
 	if (!ipi_irq)
 		return -EIO;
 
diff --git a/drivers/irqchip/irq-eznps.c b/drivers/irqchip/irq-eznps.c
index 2a7a38830a8d..a8f29fbfaaf3 100644
--- a/drivers/irqchip/irq-eznps.c
+++ b/drivers/irqchip/irq-eznps.c
@@ -157,7 +157,7 @@ static int __init nps400_of_init(struct device_node *node,
 	irq_set_default_host(nps400_root_domain);
 
 #ifdef CONFIG_SMP
-	irq_create_mapping(nps400_root_domain, NPS_IPI_IRQ);
+	irq_create_mapping(nps400_root_domain, NPS_IPI_IRQ, NULL);
 #endif
 
 	return 0;
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 215885962bb0..45999710cf7d 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -117,7 +117,8 @@ int gic_get_c0_compare_int(void)
 	if (!gic_local_irq_is_routable(GIC_LOCAL_INT_TIMER))
 		return MIPS_CPU_IRQ_BASE + cp0_compare_irq;
 	return irq_create_mapping(gic_irq_domain,
-				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_TIMER));
+				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_TIMER),
+				  NULL);
 }
 
 int gic_get_c0_perfcount_int(void)
@@ -129,7 +130,8 @@ int gic_get_c0_perfcount_int(void)
 		return MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
 	}
 	return irq_create_mapping(gic_irq_domain,
-				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_PERFCTR));
+				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_PERFCTR),
+				  NULL);
 }
 
 int gic_get_c0_fdc_int(void)
@@ -142,7 +144,7 @@ int gic_get_c0_fdc_int(void)
 	}
 
 	return irq_create_mapping(gic_irq_domain,
-				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_FDC));
+				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_FDC), NULL);
 }
 
 static void gic_handle_shared_int(bool chained)
diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 4a74ac7b7c42..837dd2eadfc0 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -391,7 +391,7 @@ static int __init mmp_init_bases(struct device_node *node)
 						   &mmp_irq_domain_ops,
 						   &icu_data[0]);
 	for (irq = 0; irq < nr_irqs; irq++) {
-		ret = irq_create_mapping(icu_data[0].domain, irq);
+		ret = irq_create_mapping(icu_data[0].domain, irq, NULL);
 		if (!ret) {
 			pr_err("Failed to mapping hwirq\n");
 			goto err;
@@ -521,7 +521,7 @@ static int __init mmp2_mux_of_init(struct device_node *node,
 						   &mmp_irq_domain_ops,
 						   &icu_data[i]);
 	for (irq = 0; irq < nr_irqs; irq++) {
-		ret = irq_create_mapping(icu_data[i].domain, irq);
+		ret = irq_create_mapping(icu_data[i].domain, irq, NULL);
 		if (!ret) {
 			pr_err("Failed to mapping hwirq\n");
 			goto err;
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index f1386733d3bc..853a245661f6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -177,7 +177,7 @@ void __init fpga_irq_init(void __iomem *base, const char *name, int irq_start,
 	for (i = 0; i < fls(valid); i++)
 		if (valid & BIT(i)) {
 			if (!irq_start)
-				irq_create_mapping(f->domain, i);
+				irq_create_mapping(f->domain, i, NULL);
 			f->used_irqs++;
 		}
 
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e46036374227..4e015e2f9704 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -295,7 +295,7 @@ static void __init vic_register(void __iomem *base, unsigned int parent_irq,
 	/* create an IRQ mapping for each valid IRQ */
 	for (i = 0; i < fls(valid_sources); i++)
 		if (valid_sources & (1 << i))
-			irq_create_mapping(v->domain, i);
+			irq_create_mapping(v->domain, i, NULL);
 	/* If no base IRQ was passed, figure out our allocated base */
 	if (irq)
 		v->irq = irq;
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 49af60bdac92..e850591c4a24 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -231,7 +231,7 @@ static void macio_create_fixup_irq(struct macio_dev *dev, int index,
 {
 	unsigned int irq;
 
-	irq = irq_create_mapping(NULL, line);
+	irq = irq_create_mapping(NULL, line, NULL);
 	if (!irq) {
 		dev->interrupt[index].start = irq;
 		dev->interrupt[index].flags = IORESOURCE_IRQ;
diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index cfa730cfd145..459438b67b15 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1236,7 +1236,7 @@ int gpmc_get_client_irq(unsigned int irq_config)
 	if (irq_config >= GPMC_NR_NAND_IRQS)
 		return 0;
 
-	return irq_create_mapping(gpmc_irq_domain, irq_config);
+	return irq_create_mapping(gpmc_irq_domain, irq_config, NULL);
 }
 
 static int gpmc_irq_endis(unsigned long hwirq, bool endis)
diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index a3bac9da8cbb..ce902b5160cd 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -493,7 +493,7 @@ static int ab8500_handle_hierarchical_line(struct ab8500 *ab8500,
 		if (line == AB8540_INT_GPIO43F || line == AB8540_INT_GPIO44F)
 			line += 1;
 
-		handle_nested_irq(irq_create_mapping(ab8500->domain, line));
+		handle_nested_irq(irq_create_mapping(ab8500->domain, line, NULL));
 	}
 
 	return 0;
diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index 077d9ab112b7..2629d31a28d3 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -321,7 +321,8 @@ int arizona_irq_init(struct arizona *arizona)
 	}
 
 	if (aod) {
-		virq = irq_create_mapping(arizona->virq, ARIZONA_AOD_IRQ_INDEX);
+		virq = irq_create_mapping(arizona->virq,
+					  ARIZONA_AOD_IRQ_INDEX, NULL);
 		if (!virq) {
 			dev_err(arizona->dev, "Failed to map AOD IRQs\n");
 			ret = -EINVAL;
@@ -337,7 +338,7 @@ int arizona_irq_init(struct arizona *arizona)
 		}
 	}
 
-	virq = irq_create_mapping(arizona->virq, ARIZONA_MAIN_IRQ_INDEX);
+	virq = irq_create_mapping(arizona->virq, ARIZONA_MAIN_IRQ_INDEX, NULL);
 	if (!virq) {
 		dev_err(arizona->dev, "Failed to map main IRQs\n");
 		ret = -EINVAL;
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index a5983d515db0..53c4c7a712cb 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2619,7 +2619,7 @@ static int db8500_irq_init(struct device_node *np)
 
 	/* All wakeups will be used, so create mappings for all */
 	for (i = 0; i < NUM_PRCMU_WAKEUPS; i++)
-		irq_create_mapping(db8500_irq_domain, i);
+		irq_create_mapping(db8500_irq_domain, i, NULL);
 
 	return 0;
 }
diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index fc00aaccb5f7..ee0a2d3814f7 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -261,7 +261,7 @@ static int mfd_add_device(struct device *parent, int id,
 				WARN_ON(cell->resources[r].start !=
 					cell->resources[r].end);
 				res[r].start = res[r].end = irq_create_mapping(
-					domain, cell->resources[r].start);
+					domain, cell->resources[r].start, NULL);
 			} else {
 				res[r].start = irq_base +
 					cell->resources[r].start;
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 1aee3b3253fc..d4fb9039a441 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1091,7 +1091,7 @@ static irqreturn_t stmpe_irq(int irq, void *data)
 
 	if (variant->id_val == STMPE801_ID ||
 	    variant->id_val == STMPE1600_ID) {
-		int base = irq_create_mapping(stmpe->domain, 0);
+		int base = irq_create_mapping(stmpe->domain, 0, NULL);
 
 		handle_nested_irq(base);
 		return IRQ_HANDLED;
@@ -1119,7 +1119,8 @@ static irqreturn_t stmpe_irq(int irq, void *data)
 		while (status) {
 			int bit = __ffs(status);
 			int line = bank * 8 + bit;
-			int nestedirq = irq_create_mapping(stmpe->domain, line);
+			int nestedirq = irq_create_mapping(stmpe->domain,
+							   line, NULL);
 
 			handle_nested_irq(nestedirq);
 			status &= ~(1 << bit);
diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 7882a37ffc35..57e82ecb605f 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -187,7 +187,7 @@ static irqreturn_t tc3589x_irq(int irq, void *data)
 
 	while (status) {
 		int bit = __ffs(status);
-		int virq = irq_create_mapping(tc3589x->domain, bit);
+		int virq = irq_create_mapping(tc3589x->domain, bit, NULL);
 
 		handle_nested_irq(virq);
 		status &= ~(1 << bit);
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index c36597797ddd..8153da3bbdfe 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -202,7 +202,7 @@ int tps6586x_irq_get_virq(struct device *dev, int irq)
 {
 	struct tps6586x *tps6586x = dev_to_tps6586x(dev);
 
-	return irq_create_mapping(tps6586x->irq_domain, irq);
+	return irq_create_mapping(tps6586x->irq_domain, irq, NULL);
 }
 EXPORT_SYMBOL_GPL(tps6586x_irq_get_virq);
 
diff --git a/drivers/mfd/wm8994-irq.c b/drivers/mfd/wm8994-irq.c
index 6c3a619e2628..a30cb9dba355 100644
--- a/drivers/mfd/wm8994-irq.c
+++ b/drivers/mfd/wm8994-irq.c
@@ -154,7 +154,8 @@ static irqreturn_t wm8994_edge_irq(int irq, void *data)
 	struct wm8994 *wm8994 = data;
 
 	while (gpio_get_value_cansleep(wm8994->pdata.irq_gpio))
-		handle_nested_irq(irq_create_mapping(wm8994->edge_irq, 0));
+		handle_nested_irq(irq_create_mapping(wm8994->edge_irq, 0,
+						     NULL));
 
 	return IRQ_HANDLED;
 }
@@ -219,7 +220,7 @@ int wm8994_irq_init(struct wm8994 *wm8994)
 
 		ret = regmap_add_irq_chip(wm8994->regmap,
 					  irq_create_mapping(wm8994->edge_irq,
-							     0),
+							     0, NULL),
 					  IRQF_ONESHOT,
 					  wm8994->irq_base, &wm8994_irq_chip,
 					  &wm8994->irq_data);
diff --git a/drivers/misc/cxl/irq.c b/drivers/misc/cxl/irq.c
index 4cb829d5d873..ff2efd84966d 100644
--- a/drivers/misc/cxl/irq.c
+++ b/drivers/misc/cxl/irq.c
@@ -227,7 +227,7 @@ unsigned int cxl_map_irq(struct cxl *adapter, irq_hw_number_t hwirq,
 	int result;
 
 	/* IRQ Domain? */
-	virq = irq_create_mapping(NULL, hwirq);
+	virq = irq_create_mapping(NULL, hwirq, NULL);
 	if (!virq) {
 		dev_warn(&adapter->dev, "cxl_map_irq: irq_create_mapping failed\n");
 		return 0;
diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
index ecdcfae025b7..da251f654367 100644
--- a/drivers/misc/ocxl/afu_irq.c
+++ b/drivers/misc/ocxl/afu_irq.c
@@ -70,7 +70,7 @@ static int setup_afu_irq(struct ocxl_context *ctx, struct afu_irq *irq)
 {
 	int rc;
 
-	irq->virq = irq_create_mapping(NULL, irq->hw_irq);
+	irq->virq = irq_create_mapping(NULL, irq->hw_irq, NULL);
 	if (!irq->virq) {
 		pr_err("irq_create_mapping failed\n");
 		return -ENOMEM;
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index fd73d3bc0eb6..f2cc66465feb 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -291,7 +291,7 @@ static int setup_xsl_irq(struct pci_dev *dev, struct ocxl_link *link)
 	 * At some point, we'll need to look into allowing a higher
 	 * number of interrupts. Could we have an IRQ domain per link?
 	 */
-	spa->virq = irq_create_mapping(NULL, hwirq);
+	spa->virq = irq_create_mapping(NULL, hwirq, NULL);
 	if (!spa->virq) {
 		dev_err(&dev->dev,
 			"irq_create_mapping failed for translation interrupt\n");
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 34cca0a4b31c..348d89e0c75a 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -288,7 +288,7 @@ static int mv88e6xxx_g1_irq_setup_common(struct mv88e6xxx_chip *chip)
 		return -ENOMEM;
 
 	for (irq = 0; irq < chip->g1_irq.nirqs; irq++)
-		irq_create_mapping(chip->g1_irq.domain, irq);
+		irq_create_mapping(chip->g1_irq.domain, irq, NULL);
 
 	chip->g1_irq.chip = mv88e6xxx_g1_irq_chip;
 	chip->g1_irq.masked = ~0;
diff --git a/drivers/net/dsa/mv88e6xxx/global2.c b/drivers/net/dsa/mv88e6xxx/global2.c
index 75b227d0f73b..efc9bcec292d 100644
--- a/drivers/net/dsa/mv88e6xxx/global2.c
+++ b/drivers/net/dsa/mv88e6xxx/global2.c
@@ -1111,7 +1111,7 @@ int mv88e6xxx_g2_irq_setup(struct mv88e6xxx_chip *chip)
 		return -ENOMEM;
 
 	for (irq = 0; irq < 16; irq++)
-		irq_create_mapping(chip->g2_irq.domain, irq);
+		irq_create_mapping(chip->g2_irq.domain, irq, NULL);
 
 	chip->g2_irq.chip = mv88e6xxx_g2_irq_chip;
 
diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index e24a99031b80..da12c7e05dd6 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -598,7 +598,7 @@ static int ar9331_sw_irq_init(struct ar9331_sw_priv *priv)
 		return -EINVAL;
 	}
 
-	irq_set_parent(irq_create_mapping(priv->irqdomain, 0), irq);
+	irq_set_parent(irq_create_mapping(priv->irqdomain, 0, NULL), irq);
 
 	return 0;
 }
diff --git a/drivers/net/dsa/rtl8366rb.c b/drivers/net/dsa/rtl8366rb.c
index cfe56960f44b..d2073e0c5d47 100644
--- a/drivers/net/dsa/rtl8366rb.c
+++ b/drivers/net/dsa/rtl8366rb.c
@@ -566,7 +566,8 @@ static int rtl8366rb_setup_cascaded_irq(struct realtek_smi *smi)
 		goto out_put_node;
 	}
 	for (i = 0; i < smi->num_ports; i++)
-		irq_set_parent(irq_create_mapping(smi->irqdomain, i), irq);
+		irq_set_parent(irq_create_mapping(smi->irqdomain, i, NULL),
+			       irq);
 
 out_put_node:
 	of_node_put(intc);
diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index da15913879f8..b83914fd483f 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3188,7 +3188,7 @@ static int init_sub_crq_irqs(struct ibmvnic_adapter *adapter)
 		netdev_dbg(adapter->netdev, "Initializing tx_scrq[%d] irq\n",
 			   i);
 		scrq = adapter->tx_scrq[i];
-		scrq->irq = irq_create_mapping(NULL, scrq->hw_irq);
+		scrq->irq = irq_create_mapping(NULL, scrq->hw_irq, NULL);
 
 		if (!scrq->irq) {
 			rc = -EINVAL;
@@ -3213,7 +3213,7 @@ static int init_sub_crq_irqs(struct ibmvnic_adapter *adapter)
 		netdev_dbg(adapter->netdev, "Initializing rx_scrq[%d] irq\n",
 			   i);
 		scrq = adapter->rx_scrq[i];
-		scrq->irq = irq_create_mapping(NULL, scrq->hw_irq);
+		scrq->irq = irq_create_mapping(NULL, scrq->hw_irq, NULL);
 		if (!scrq->irq) {
 			rc = -EINVAL;
 			dev_err(dev, "Error mapping irq\n");
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 65b315bc60ab..a4a687fe79f9 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1959,7 +1959,7 @@ static int lan78xx_setup_irq_domain(struct lan78xx_net *dev)
 					  &chip_domain_ops, &dev->domain_data);
 	if (irqdomain) {
 		/* create mapping for PHY interrupt */
-		irqmap = irq_create_mapping(irqdomain, INT_EP_PHY);
+		irqmap = irq_create_mapping(irqdomain, INT_EP_PHY, NULL);
 		if (!irqmap) {
 			irq_domain_remove(irqdomain);
 
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index da3cd216da00..0d40d7888470 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -370,7 +370,7 @@ static int faraday_pci_setup_cascaded_irq(struct faraday_pci *p)
 	irq_set_chained_handler_and_data(irq, faraday_pci_irq_handler, p);
 
 	for (i = 0; i < 4; i++)
-		irq_create_mapping(p->irqdomain, i);
+		irq_create_mapping(p->irqdomain, i, NULL);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8fcabed7c6a6..a6196eb4e405 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1636,7 +1636,7 @@ static int tegra_msi_setup_irq(struct msi_controller *chip,
 	if (hwirq < 0)
 		return hwirq;
 
-	irq = irq_create_mapping(msi->domain, hwirq);
+	irq = irq_create_mapping(msi->domain, hwirq, NULL);
 	if (!irq) {
 		tegra_msi_free(msi, hwirq);
 		return -EINVAL;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index cdc0963f154e..b2b184aa28e5 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -717,7 +717,7 @@ static int rcar_pcie_enable_msi(struct rcar_pcie_host *host)
 	}
 
 	for (i = 0; i < INT_PCI_MSI_NR; i++)
-		irq_create_mapping(msi->domain, i);
+		irq_create_mapping(msi->domain, i, NULL);
 
 	/* Two irqs are for MSI, but they are also used for non-MSI irqs */
 	err = devm_request_irq(dev, msi->irq1, rcar_pcie_msi_irq,
diff --git a/drivers/pci/controller/pcie-xilinx-cpm.c b/drivers/pci/controller/pcie-xilinx-cpm.c
index f92e0152e65e..f1486f4d0a96 100644
--- a/drivers/pci/controller/pcie-xilinx-cpm.c
+++ b/drivers/pci/controller/pcie-xilinx-cpm.c
@@ -425,7 +425,7 @@ static int xilinx_cpm_setup_irq(struct xilinx_cpm_pcie_port *port)
 		if (!intr_cause[i].str)
 			continue;
 
-		irq = irq_create_mapping(port->cpm_domain, i);
+		irq = irq_create_mapping(port->cpm_domain, i, NULL);
 		if (!irq) {
 			dev_err(dev, "Failed to map interrupt\n");
 			return -ENXIO;
@@ -440,7 +440,7 @@ static int xilinx_cpm_setup_irq(struct xilinx_cpm_pcie_port *port)
 	}
 
 	port->intx_irq = irq_create_mapping(port->cpm_domain,
-					    XILINX_CPM_PCIE_INTR_INTX);
+					    XILINX_CPM_PCIE_INTR_INTX, NULL);
 	if (!port->intx_irq) {
 		dev_err(dev, "Failed to map INTx interrupt\n");
 		return -ENXIO;
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 8523be61bba5..4d5f14949770 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -275,7 +275,7 @@ static int xilinx_pcie_msi_setup_irq(struct msi_controller *chip,
 	if (hwirq < 0)
 		return hwirq;
 
-	irq = irq_create_mapping(port->msi_domain, hwirq);
+	irq = irq_create_mapping(port->msi_domain, hwirq, NULL);
 	if (!irq)
 		return -EINVAL;
 
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 22736f60c16c..93d048ca252e 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -488,7 +488,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 
 	mtk_eint_hw_init(eint);
 	for (i = 0; i < eint->hw->ap_num; i++) {
-		int virq = irq_create_mapping(eint->domain, i);
+		int virq = irq_create_mapping(eint->domain, i, NULL);
 
 		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
 					 handle_level_irq);
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 7aa534576a45..e68fa90e79d2 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -229,7 +229,8 @@ static int abx500_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 			 * into the cluster information table.
 			 */
 			hwirq = gpio - cluster->start + cluster->to_irq;
-			return irq_create_mapping(pct->parent->domain, hwirq);
+			return irq_create_mapping(pct->parent->domain, hwirq,
+						  NULL);
 		}
 	}
 
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 578b387100d9..1d266c4e1456 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1142,7 +1142,8 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 	atmel_pioctrl->irq_domain->name = "atmel gpio";
 
 	for (i = 0; i < atmel_pioctrl->npins; i++) {
-		int irq = irq_create_mapping(atmel_pioctrl->irq_domain, i);
+		int irq = irq_create_mapping(atmel_pioctrl->irq_domain, i,
+					     NULL);
 
 		irq_set_chip_and_handler(irq, &atmel_gpio_irq_chip,
 					 handle_simple_irq);
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index aa1a1c850d05..4d04e2c45f83 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3156,7 +3156,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 		return -ENXIO;
 
 	clk_enable(bank->clk);
-	virq = irq_create_mapping(bank->domain, offset);
+	virq = irq_create_mapping(bank->domain, offset, NULL);
 	clk_disable(bank->clk);
 
 	return (virq) ? : -ENXIO;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 608eb5a07248..5fffade3e8ba 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -660,7 +660,7 @@ static int samsung_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	if (!bank->irq_domain)
 		return -ENXIO;
 
-	virq = irq_create_mapping(bank->irq_domain, offset);
+	virq = irq_create_mapping(bank->irq_domain, offset, NULL);
 
 	return (virq) ? : -ENXIO;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 8e792f8e2dc9..8a9c73c1fdda 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1548,7 +1548,7 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 	}
 
 	for (i = 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
-		int irqno = irq_create_mapping(pctl->domain, i);
+		int irqno = irq_create_mapping(pctl->domain, i, NULL);
 
 		irq_set_chip_and_handler(irqno, &sunxi_pinctrl_edge_irq_chip,
 					 handle_edge_irq);
diff --git a/drivers/power/supply/lp8788-charger.c b/drivers/power/supply/lp8788-charger.c
index e7931ffb7151..7236dee8b326 100644
--- a/drivers/power/supply/lp8788-charger.c
+++ b/drivers/power/supply/lp8788-charger.c
@@ -494,7 +494,7 @@ static int lp8788_set_irqs(struct platform_device *pdev,
 	for (i = irq_start; i <= irq_end; i++) {
 		nr_irq = pchg->num_irqs;
 
-		virq = irq_create_mapping(irqdm, i);
+		virq = irq_create_mapping(irqdm, i, NULL);
 		pchg->irqs[nr_irq].virq = virq;
 		pchg->irqs[nr_irq].which = i;
 		pchg->num_irqs++;
diff --git a/drivers/rtc/rtc-lp8788.c b/drivers/rtc/rtc-lp8788.c
index c0b8fbce1082..3bb3baad1ab1 100644
--- a/drivers/rtc/rtc-lp8788.c
+++ b/drivers/rtc/rtc-lp8788.c
@@ -272,7 +272,7 @@ static int lp8788_alarm_irq_register(struct platform_device *pdev,
 	else
 		irq = r->end;
 
-	rtc->irq = irq_create_mapping(irqdm, irq);
+	rtc->irq = irq_create_mapping(irqdm, irq, NULL);
 
 	return devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				lp8788_alarm_irq_handler,
diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index 20e50d9fdf88..44449ac5d44c 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -484,7 +484,8 @@ static int max8997_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	virq = irq_create_mapping(max8997->irq_domain, MAX8997_PMICIRQ_RTCA1);
+	virq = irq_create_mapping(max8997->irq_domain, MAX8997_PMICIRQ_RTCA1,
+				  NULL);
 	if (!virq) {
 		dev_err(&pdev->dev, "Failed to create mapping alarm IRQ\n");
 		ret = -ENXIO;
diff --git a/drivers/rtc/rtc-max8998.c b/drivers/rtc/rtc-max8998.c
index c873b4509b3c..11f4b350282e 100644
--- a/drivers/rtc/rtc-max8998.c
+++ b/drivers/rtc/rtc-max8998.c
@@ -274,7 +274,8 @@ static int max8998_rtc_probe(struct platform_device *pdev)
 	if (!max8998->irq_domain)
 		goto no_irq;
 
-	info->irq = irq_create_mapping(max8998->irq_domain, MAX8998_IRQ_ALARM0);
+	info->irq = irq_create_mapping(max8998->irq_domain,
+				       MAX8998_IRQ_ALARM0, NULL);
 	if (!info->irq) {
 		dev_warn(&pdev->dev, "Failed to map alarm IRQ\n");
 		goto no_irq;
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index e4e0d767b98e..71411d9457b8 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -192,7 +192,7 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
 	}
 
 	irq = &ctx->irqs[num];
-	virq = irq_create_mapping(NULL, irq->hwirq);
+	virq = irq_create_mapping(NULL, irq->hwirq, NULL);
 	if (unlikely(!virq)) {
 		dev_err(dev, "%s: irq_create_mapping failed\n", __func__);
 		rc = -ENOMEM;
diff --git a/drivers/ssb/driver_gpio.c b/drivers/ssb/driver_gpio.c
index 66a76fd83248..6a3a9d947eb9 100644
--- a/drivers/ssb/driver_gpio.c
+++ b/drivers/ssb/driver_gpio.c
@@ -154,7 +154,7 @@ static int ssb_gpio_irq_chipco_domain_init(struct ssb_bus *bus)
 		goto err_irq_domain;
 	}
 	for (gpio = 0; gpio < chip->ngpio; gpio++) {
-		int irq = irq_create_mapping(bus->irq_domain, gpio);
+		int irq = irq_create_mapping(bus->irq_domain, gpio, NULL);
 
 		irq_set_chip_data(irq, bus);
 		irq_set_chip_and_handler(irq, &ssb_gpio_irq_chipco_chip,
@@ -351,7 +351,7 @@ static int ssb_gpio_irq_extif_domain_init(struct ssb_bus *bus)
 		goto err_irq_domain;
 	}
 	for (gpio = 0; gpio < chip->ngpio; gpio++) {
-		int irq = irq_create_mapping(bus->irq_domain, gpio);
+		int irq = irq_create_mapping(bus->irq_domain, gpio, NULL);
 
 		irq_set_chip_data(irq, bus);
 		irq_set_chip_and_handler(irq, &ssb_gpio_irq_extif_chip,
diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 64b30d263c8d..a5125287e846 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -274,7 +274,7 @@ static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
 	}
 
 	for (i = 0; i < HISI_IRQ_NUM; i++) {
-		virq = irq_create_mapping(pmic->domain, i);
+		virq = irq_create_mapping(pmic->domain, i, NULL);
 		if (!virq) {
 			dev_err(dev, "Failed mapping hwirq\n");
 			ret = -ENOSPC;
diff --git a/drivers/staging/octeon-usb/octeon-hcd.c b/drivers/staging/octeon-usb/octeon-hcd.c
index e2f8b6b67f75..9a3a2714f285 100644
--- a/drivers/staging/octeon-usb/octeon-hcd.c
+++ b/drivers/staging/octeon-usb/octeon-hcd.c
@@ -3595,7 +3595,7 @@ static int octeon_usb_probe(struct platform_device *pdev)
 		/* Defective device tree, but we know how to fix it. */
 		irq_hw_number_t hwirq = usb_num ? (1 << 6) + 17 : 56;
 
-		irq = irq_create_mapping(NULL, hwirq);
+		irq = irq_create_mapping(NULL, hwirq, NULL);
 	}
 
 	/*
diff --git a/drivers/tty/hvc/hvsi.c b/drivers/tty/hvc/hvsi.c
index e8c58f9bd263..fe08b5a92a23 100644
--- a/drivers/tty/hvc/hvsi.c
+++ b/drivers/tty/hvc/hvsi.c
@@ -1192,7 +1192,7 @@ static int __init hvsi_console_init(void)
 		hp->inbuf_end = hp->inbuf;
 		hp->state = HVSI_CLOSED;
 		hp->vtermno = be32_to_cpup(vtermno);
-		hp->virq = irq_create_mapping(NULL, be32_to_cpup(irq));
+		hp->virq = irq_create_mapping(NULL, be32_to_cpup(irq), NULL);
 		if (hp->virq == 0) {
 			printk(KERN_ERR "%s: couldn't create irq mapping for 0x%x\n",
 			       __func__, be32_to_cpup(irq));
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 063484b22523..0a93649f615d 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1505,9 +1505,9 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	    np->parent && np->parent->parent &&
 	    of_device_is_compatible(np->parent->parent, "gatwick")) {
 		/* IRQs on gatwick are offset by 64 */
-		uap->port.irq = irq_create_mapping(NULL, 64 + 15);
-		uap->tx_dma_irq = irq_create_mapping(NULL, 64 + 4);
-		uap->rx_dma_irq = irq_create_mapping(NULL, 64 + 5);
+		uap->port.irq = irq_create_mapping(NULL, 64 + 15, NULL);
+		uap->tx_dma_irq = irq_create_mapping(NULL, 64 + 4, NULL);
+		uap->rx_dma_irq = irq_create_mapping(NULL, 64 + 5, NULL);
 	}
 
 	/* Setup some valid baud rate information in the register
diff --git a/drivers/watchdog/octeon-wdt-main.c b/drivers/watchdog/octeon-wdt-main.c
index fde9e739b436..05e6df2dc016 100644
--- a/drivers/watchdog/octeon-wdt-main.c
+++ b/drivers/watchdog/octeon-wdt-main.c
@@ -366,7 +366,7 @@ static int octeon_wdt_cpu_online(unsigned int cpu)
 
 		/* Get a irq for the wd intsn (hardware interrupt) */
 		hwirq = WD_BLOCK_NUMBER << 12 | 0x200 | core;
-		irq = irq_create_mapping(domain, hwirq);
+		irq = irq_create_mapping(domain, hwirq, NULL);
 		irqd_set_trigger_type(irq_get_irq_data(irq),
 				      IRQ_TYPE_EDGE_RISING);
 	} else
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 71535e87109f..0cdaf7fc5b64 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -385,7 +385,8 @@ extern void irq_domain_disassociate(struct irq_domain *domain,
 				    unsigned int irq);
 
 extern unsigned int irq_create_mapping(struct irq_domain *host,
-				       irq_hw_number_t hwirq);
+				       irq_hw_number_t hwirq,
+				       const struct irq_affinity_desc *affinity);
 extern unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
 extern void irq_dispose_mapping(unsigned int virq);
 
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index cf8b374b892d..e4d3f4c87013 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -634,7 +634,8 @@ EXPORT_SYMBOL_GPL(irq_create_direct_mapping);
  * on the number returned from that call.
  */
 unsigned int irq_create_mapping(struct irq_domain *domain,
-				irq_hw_number_t hwirq)
+				irq_hw_number_t hwirq,
+				const struct irq_affinity_desc *affinity)
 {
 	struct device_node *of_node;
 	int virq;
@@ -660,7 +661,8 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 	}
 
 	/* Allocate a virtual interrupt number */
-	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node), NULL);
+	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node),
+				      affinity);
 	if (virq <= 0) {
 		pr_debug("-> virq allocation failed\n");
 		return 0;
@@ -814,7 +816,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 			return 0;
 	} else {
 		/* Create mapping */
-		virq = irq_create_mapping(domain, hwirq);
+		virq = irq_create_mapping(domain, hwirq, NULL);
 		if (!virq)
 			return virq;
 	}
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 9e449d35fc28..1efe5c20a1ce 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4857,7 +4857,7 @@ static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
 		return -ENXIO;
 	}
 
-	return irq_create_mapping(rt5677->domain, irq);
+	return irq_create_mapping(rt5677->domain, irq, NULL);
 }
 
 static const struct gpio_chip rt5677_template_chip = {
-- 
2.28.0

