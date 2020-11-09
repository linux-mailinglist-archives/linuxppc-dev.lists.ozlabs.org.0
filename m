Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB62AB5AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 12:01:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CV7NJ5HZyzDqnB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 22:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=EmqH2qT3; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CV7LN6NCwzDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 21:59:50 +1100 (AEDT)
Received: by mail-ej1-x642.google.com with SMTP id za3so11599648ejb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Nov 2020 02:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ruaNltBs3n4ReZ7qtry1zJWkwGVwkbCyN/j1d4uX4Q=;
 b=EmqH2qT3O8RzVOVblDRRsUlaOElWE9bKkCYLgOBkn3F8K4nVWoAeQPr5dMEcrwn5J4
 e2FJdTle4sTd7BqiBFy2R/RVyZ2otE49NALtt4NVh4o0wD7FgCmVHjC9odt/90g+Ob06
 bjQQe9frQgi/nX2prBsYGK/G33rFPeSGyACCu3ARd0oZv0sUMx7WNPqVf9p4T0UbCx+e
 irX98xWvLzfcKVlw9fvuKvO/TrGDN2l36Hz+DsAFj2mgGR9VSp+pachGTT1kvWBHllZe
 J+15oZNZgbUE/56wJd5Dk48N+Av0n6qI3sLIksXFaB2dO7Kx3dwXbjrSrJT04gu92/7a
 8PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2ruaNltBs3n4ReZ7qtry1zJWkwGVwkbCyN/j1d4uX4Q=;
 b=Z6DLHFw23jp5rRTlPt8+SCmkzvDhd0y73av1q0GLcCc88GtPAeshoLw8Q3pNrnbh8Q
 7kEOma/NDREy+EAKSHbNjbiDQ3Truf3sI5sWDVXHjhdqHjaIvWRPbyLuVb6xzGqvzhBt
 TnncluqY1EmNsPk7pF22fLsm2odHd3tb3gDxYRbESQHrtsJV4P9L2+dwEpuOpYEtBoZO
 pjG+ZLD4wuXBKObfJPCdhPE+/UQS1uHBFWzsipiKtoB8tlzPyDiB62hvz3jZLAqi1os4
 CLRaZVOnZjHIGAecEXkhwkPg7daDb8xHv8C/7abupHMQDxVXTyF3Yu7nfusSApsuoj+m
 EaNg==
X-Gm-Message-State: AOAM530xcZa2HJvt4nmNWbyahlO40XItu+qTlSVn4JV6isnUphsDbIyf
 Q7+Z3aZutXOgvcvMwR0NPyjnjg==
X-Google-Smtp-Source: ABdhPJxHpyXN4C9Pr0zZrfeQ8pwqHBwqstHg0Djn/JVov6DAvvAwqQZ7x+D6kDPh/dOP86qJAEl/xw==
X-Received: by 2002:a17:906:39d1:: with SMTP id
 i17mr13968058eje.284.1604919586913; 
 Mon, 09 Nov 2020 02:59:46 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id o31sm8570288edd.94.2020.11.09.02.59.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Nov 2020 02:59:46 -0800 (PST)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com
Subject: [PATCH] xsysace: Remove SYSACE driver
Date: Mon,  9 Nov 2020 11:59:41 +0100
Message-Id: <ee1fe969905f641f5f97d812ee0cac44c12fe0f6.1604919578.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Jens Axboe <axboe@kernel.dk>, devicetree@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Rob Herring <robh+dt@kernel.org>,
 linux-block@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sysace IP is no longer used on Xilinx PowerPC 405/440 and Microblaze
systems. The driver is not regularly tested and very likely not working for
quite a long time that's why remove it.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Based on discussion
https://lore.kernel.org/linux-arm-kernel/5ab9a2a1-20e3-c7b2-f666-2034df436e74@kernel.dk/

I have grepped the kernel and found any old ppc platform. I have included
it in this patch to have a discussion about it.

---
 MAINTAINERS                             |    1 -
 arch/microblaze/boot/dts/system.dts     |    8 -
 arch/powerpc/boot/dts/icon.dts          |    7 -
 arch/powerpc/configs/44x/icon_defconfig |    1 -
 drivers/block/Kconfig                   |    6 -
 drivers/block/Makefile                  |    1 -
 drivers/block/xsysace.c                 | 1273 -----------------------
 7 files changed, 1297 deletions(-)
 delete mode 100644 drivers/block/xsysace.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cba8ddf87a08..38556c009758 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2741,7 +2741,6 @@ T:	git https://github.com/Xilinx/linux-xlnx.git
 F:	Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
 F:	Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
 F:	arch/arm/mach-zynq/
-F:	drivers/block/xsysace.c
 F:	drivers/clocksource/timer-cadence-ttc.c
 F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/edac/synopsys_edac.c
diff --git a/arch/microblaze/boot/dts/system.dts b/arch/microblaze/boot/dts/system.dts
index 5b236527176e..b7ee1056779e 100644
--- a/arch/microblaze/boot/dts/system.dts
+++ b/arch/microblaze/boot/dts/system.dts
@@ -310,14 +310,6 @@ RS232_Uart_1: serial@84000000 {
 			xlnx,odd-parity = <0x0>;
 			xlnx,use-parity = <0x0>;
 		} ;
-		SysACE_CompactFlash: sysace@83600000 {
-			compatible = "xlnx,xps-sysace-1.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 4 2 >;
-			reg = < 0x83600000 0x10000 >;
-			xlnx,family = "virtex5";
-			xlnx,mem-width = <0x10>;
-		} ;
 		debug_module: debug@84400000 {
 			compatible = "xlnx,mdm-1.00.d";
 			reg = < 0x84400000 0x10000 >;
diff --git a/arch/powerpc/boot/dts/icon.dts b/arch/powerpc/boot/dts/icon.dts
index fbaa60b8f87a..4fd7a4fbb4fb 100644
--- a/arch/powerpc/boot/dts/icon.dts
+++ b/arch/powerpc/boot/dts/icon.dts
@@ -197,13 +197,6 @@ partition@fa0000 {
 						reg = <0x00fa0000 0x00060000>;
 					};
 				};
-
-				SysACE_CompactFlash: sysace@1,0 {
-					compatible = "xlnx,sysace";
-					interrupt-parent = <&UIC2>;
-					interrupts = <24 0x4>;
-					reg = <0x00000001 0x00000000 0x10000>;
-				};
 			};
 
 			UART0: serial@f0000200 {
diff --git a/arch/powerpc/configs/44x/icon_defconfig b/arch/powerpc/configs/44x/icon_defconfig
index 930948a1da76..fb9a15573546 100644
--- a/arch/powerpc/configs/44x/icon_defconfig
+++ b/arch/powerpc/configs/44x/icon_defconfig
@@ -28,7 +28,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_XILINX_SYSACE=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_CONSTANTS=y
diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index ecceaaa1a66f..9cb02861298d 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -388,12 +388,6 @@ config SUNVDC
 
 source "drivers/s390/block/Kconfig"
 
-config XILINX_SYSACE
-	tristate "Xilinx SystemACE support"
-	depends on 4xx || MICROBLAZE
-	help
-	  Include support for the Xilinx SystemACE CompactFlash interface
-
 config XEN_BLKDEV_FRONTEND
 	tristate "Xen virtual block device support"
 	depends on XEN
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index e1f63117ee94..5ddd9370972a 100644
--- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_ATARI_FLOPPY)	+= ataflop.o
 obj-$(CONFIG_AMIGA_Z2RAM)	+= z2ram.o
 obj-$(CONFIG_BLK_DEV_RAM)	+= brd.o
 obj-$(CONFIG_BLK_DEV_LOOP)	+= loop.o
-obj-$(CONFIG_XILINX_SYSACE)	+= xsysace.o
 obj-$(CONFIG_CDROM_PKTCDVD)	+= pktcdvd.o
 obj-$(CONFIG_SUNVDC)		+= sunvdc.o
 obj-$(CONFIG_BLK_DEV_SKD)	+= skd.o
diff --git a/drivers/block/xsysace.c b/drivers/block/xsysace.c
deleted file mode 100644
index eb8ef65778c3..000000000000
--- a/drivers/block/xsysace.c
+++ /dev/null
@@ -1,1273 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Xilinx SystemACE device driver
- *
- * Copyright 2007 Secret Lab Technologies Ltd.
- */
-
-/*
- * The SystemACE chip is designed to configure FPGAs by loading an FPGA
- * bitstream from a file on a CF card and squirting it into FPGAs connected
- * to the SystemACE JTAG chain.  It also has the advantage of providing an
- * MPU interface which can be used to control the FPGA configuration process
- * and to use the attached CF card for general purpose storage.
- *
- * This driver is a block device driver for the SystemACE.
- *
- * Initialization:
- *    The driver registers itself as a platform_device driver at module
- *    load time.  The platform bus will take care of calling the
- *    ace_probe() method for all SystemACE instances in the system.  Any
- *    number of SystemACE instances are supported.  ace_probe() calls
- *    ace_setup() which initialized all data structures, reads the CF
- *    id structure and registers the device.
- *
- * Processing:
- *    Just about all of the heavy lifting in this driver is performed by
- *    a Finite State Machine (FSM).  The driver needs to wait on a number
- *    of events; some raised by interrupts, some which need to be polled
- *    for.  Describing all of the behaviour in a FSM seems to be the
- *    easiest way to keep the complexity low and make it easy to
- *    understand what the driver is doing.  If the block ops or the
- *    request function need to interact with the hardware, then they
- *    simply need to flag the request and kick of FSM processing.
- *
- *    The FSM itself is atomic-safe code which can be run from any
- *    context.  The general process flow is:
- *    1. obtain the ace->lock spinlock.
- *    2. loop on ace_fsm_dostate() until the ace->fsm_continue flag is
- *       cleared.
- *    3. release the lock.
- *
- *    Individual states do not sleep in any way.  If a condition needs to
- *    be waited for then the state much clear the fsm_continue flag and
- *    either schedule the FSM to be run again at a later time, or expect
- *    an interrupt to call the FSM when the desired condition is met.
- *
- *    In normal operation, the FSM is processed at interrupt context
- *    either when the driver's tasklet is scheduled, or when an irq is
- *    raised by the hardware.  The tasklet can be scheduled at any time.
- *    The request method in particular schedules the tasklet when a new
- *    request has been indicated by the block layer.  Once started, the
- *    FSM proceeds as far as it can processing the request until it
- *    needs on a hardware event.  At this point, it must yield execution.
- *
- *    A state has two options when yielding execution:
- *    1. ace_fsm_yield()
- *       - Call if need to poll for event.
- *       - clears the fsm_continue flag to exit the processing loop
- *       - reschedules the tasklet to run again as soon as possible
- *    2. ace_fsm_yieldirq()
- *       - Call if an irq is expected from the HW
- *       - clears the fsm_continue flag to exit the processing loop
- *       - does not reschedule the tasklet so the FSM will not be processed
- *         again until an irq is received.
- *    After calling a yield function, the state must return control back
- *    to the FSM main loop.
- *
- *    Additionally, the driver maintains a kernel timer which can process
- *    the FSM.  If the FSM gets stalled, typically due to a missed
- *    interrupt, then the kernel timer will expire and the driver can
- *    continue where it left off.
- *
- * To Do:
- *    - Add FPGA configuration control interface.
- *    - Request major number from lanana
- */
-
-#undef DEBUG
-
-#include <linux/module.h>
-#include <linux/ctype.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/blk-mq.h>
-#include <linux/mutex.h>
-#include <linux/ata.h>
-#include <linux/hdreg.h>
-#include <linux/platform_device.h>
-#if defined(CONFIG_OF)
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-#endif
-
-MODULE_AUTHOR("Grant Likely <grant.likely@secretlab.ca>");
-MODULE_DESCRIPTION("Xilinx SystemACE device driver");
-MODULE_LICENSE("GPL");
-
-/* SystemACE register definitions */
-#define ACE_BUSMODE (0x00)
-
-#define ACE_STATUS (0x04)
-#define ACE_STATUS_CFGLOCK      (0x00000001)
-#define ACE_STATUS_MPULOCK      (0x00000002)
-#define ACE_STATUS_CFGERROR     (0x00000004)	/* config controller error */
-#define ACE_STATUS_CFCERROR     (0x00000008)	/* CF controller error */
-#define ACE_STATUS_CFDETECT     (0x00000010)
-#define ACE_STATUS_DATABUFRDY   (0x00000020)
-#define ACE_STATUS_DATABUFMODE  (0x00000040)
-#define ACE_STATUS_CFGDONE      (0x00000080)
-#define ACE_STATUS_RDYFORCFCMD  (0x00000100)
-#define ACE_STATUS_CFGMODEPIN   (0x00000200)
-#define ACE_STATUS_CFGADDR_MASK (0x0000e000)
-#define ACE_STATUS_CFBSY        (0x00020000)
-#define ACE_STATUS_CFRDY        (0x00040000)
-#define ACE_STATUS_CFDWF        (0x00080000)
-#define ACE_STATUS_CFDSC        (0x00100000)
-#define ACE_STATUS_CFDRQ        (0x00200000)
-#define ACE_STATUS_CFCORR       (0x00400000)
-#define ACE_STATUS_CFERR        (0x00800000)
-
-#define ACE_ERROR (0x08)
-#define ACE_CFGLBA (0x0c)
-#define ACE_MPULBA (0x10)
-
-#define ACE_SECCNTCMD (0x14)
-#define ACE_SECCNTCMD_RESET      (0x0100)
-#define ACE_SECCNTCMD_IDENTIFY   (0x0200)
-#define ACE_SECCNTCMD_READ_DATA  (0x0300)
-#define ACE_SECCNTCMD_WRITE_DATA (0x0400)
-#define ACE_SECCNTCMD_ABORT      (0x0600)
-
-#define ACE_VERSION (0x16)
-#define ACE_VERSION_REVISION_MASK (0x00FF)
-#define ACE_VERSION_MINOR_MASK    (0x0F00)
-#define ACE_VERSION_MAJOR_MASK    (0xF000)
-
-#define ACE_CTRL (0x18)
-#define ACE_CTRL_FORCELOCKREQ   (0x0001)
-#define ACE_CTRL_LOCKREQ        (0x0002)
-#define ACE_CTRL_FORCECFGADDR   (0x0004)
-#define ACE_CTRL_FORCECFGMODE   (0x0008)
-#define ACE_CTRL_CFGMODE        (0x0010)
-#define ACE_CTRL_CFGSTART       (0x0020)
-#define ACE_CTRL_CFGSEL         (0x0040)
-#define ACE_CTRL_CFGRESET       (0x0080)
-#define ACE_CTRL_DATABUFRDYIRQ  (0x0100)
-#define ACE_CTRL_ERRORIRQ       (0x0200)
-#define ACE_CTRL_CFGDONEIRQ     (0x0400)
-#define ACE_CTRL_RESETIRQ       (0x0800)
-#define ACE_CTRL_CFGPROG        (0x1000)
-#define ACE_CTRL_CFGADDR_MASK   (0xe000)
-
-#define ACE_FATSTAT (0x1c)
-
-#define ACE_NUM_MINORS 16
-#define ACE_SECTOR_SIZE (512)
-#define ACE_FIFO_SIZE (32)
-#define ACE_BUF_PER_SECTOR (ACE_SECTOR_SIZE / ACE_FIFO_SIZE)
-
-#define ACE_BUS_WIDTH_8  0
-#define ACE_BUS_WIDTH_16 1
-
-struct ace_reg_ops;
-
-struct ace_device {
-	/* driver state data */
-	int id;
-	int media_change;
-	int users;
-	struct list_head list;
-
-	/* finite state machine data */
-	struct tasklet_struct fsm_tasklet;
-	uint fsm_task;		/* Current activity (ACE_TASK_*) */
-	uint fsm_state;		/* Current state (ACE_FSM_STATE_*) */
-	uint fsm_continue_flag;	/* cleared to exit FSM mainloop */
-	uint fsm_iter_num;
-	struct timer_list stall_timer;
-
-	/* Transfer state/result, use for both id and block request */
-	struct request *req;	/* request being processed */
-	void *data_ptr;		/* pointer to I/O buffer */
-	int data_count;		/* number of buffers remaining */
-	int data_result;	/* Result of transfer; 0 := success */
-
-	int id_req_count;	/* count of id requests */
-	int id_result;
-	struct completion id_completion;	/* used when id req finishes */
-	int in_irq;
-
-	/* Details of hardware device */
-	resource_size_t physaddr;
-	void __iomem *baseaddr;
-	int irq;
-	int bus_width;		/* 0 := 8 bit; 1 := 16 bit */
-	struct ace_reg_ops *reg_ops;
-	int lock_count;
-
-	/* Block device data structures */
-	spinlock_t lock;
-	struct device *dev;
-	struct request_queue *queue;
-	struct gendisk *gd;
-	struct blk_mq_tag_set tag_set;
-	struct list_head rq_list;
-
-	/* Inserted CF card parameters */
-	u16 cf_id[ATA_ID_WORDS];
-};
-
-static DEFINE_MUTEX(xsysace_mutex);
-static int ace_major;
-
-/* ---------------------------------------------------------------------
- * Low level register access
- */
-
-struct ace_reg_ops {
-	u16(*in) (struct ace_device * ace, int reg);
-	void (*out) (struct ace_device * ace, int reg, u16 val);
-	void (*datain) (struct ace_device * ace);
-	void (*dataout) (struct ace_device * ace);
-};
-
-/* 8 Bit bus width */
-static u16 ace_in_8(struct ace_device *ace, int reg)
-{
-	void __iomem *r = ace->baseaddr + reg;
-	return in_8(r) | (in_8(r + 1) << 8);
-}
-
-static void ace_out_8(struct ace_device *ace, int reg, u16 val)
-{
-	void __iomem *r = ace->baseaddr + reg;
-	out_8(r, val);
-	out_8(r + 1, val >> 8);
-}
-
-static void ace_datain_8(struct ace_device *ace)
-{
-	void __iomem *r = ace->baseaddr + 0x40;
-	u8 *dst = ace->data_ptr;
-	int i = ACE_FIFO_SIZE;
-	while (i--)
-		*dst++ = in_8(r++);
-	ace->data_ptr = dst;
-}
-
-static void ace_dataout_8(struct ace_device *ace)
-{
-	void __iomem *r = ace->baseaddr + 0x40;
-	u8 *src = ace->data_ptr;
-	int i = ACE_FIFO_SIZE;
-	while (i--)
-		out_8(r++, *src++);
-	ace->data_ptr = src;
-}
-
-static struct ace_reg_ops ace_reg_8_ops = {
-	.in = ace_in_8,
-	.out = ace_out_8,
-	.datain = ace_datain_8,
-	.dataout = ace_dataout_8,
-};
-
-/* 16 bit big endian bus attachment */
-static u16 ace_in_be16(struct ace_device *ace, int reg)
-{
-	return in_be16(ace->baseaddr + reg);
-}
-
-static void ace_out_be16(struct ace_device *ace, int reg, u16 val)
-{
-	out_be16(ace->baseaddr + reg, val);
-}
-
-static void ace_datain_be16(struct ace_device *ace)
-{
-	int i = ACE_FIFO_SIZE / 2;
-	u16 *dst = ace->data_ptr;
-	while (i--)
-		*dst++ = in_le16(ace->baseaddr + 0x40);
-	ace->data_ptr = dst;
-}
-
-static void ace_dataout_be16(struct ace_device *ace)
-{
-	int i = ACE_FIFO_SIZE / 2;
-	u16 *src = ace->data_ptr;
-	while (i--)
-		out_le16(ace->baseaddr + 0x40, *src++);
-	ace->data_ptr = src;
-}
-
-/* 16 bit little endian bus attachment */
-static u16 ace_in_le16(struct ace_device *ace, int reg)
-{
-	return in_le16(ace->baseaddr + reg);
-}
-
-static void ace_out_le16(struct ace_device *ace, int reg, u16 val)
-{
-	out_le16(ace->baseaddr + reg, val);
-}
-
-static void ace_datain_le16(struct ace_device *ace)
-{
-	int i = ACE_FIFO_SIZE / 2;
-	u16 *dst = ace->data_ptr;
-	while (i--)
-		*dst++ = in_be16(ace->baseaddr + 0x40);
-	ace->data_ptr = dst;
-}
-
-static void ace_dataout_le16(struct ace_device *ace)
-{
-	int i = ACE_FIFO_SIZE / 2;
-	u16 *src = ace->data_ptr;
-	while (i--)
-		out_be16(ace->baseaddr + 0x40, *src++);
-	ace->data_ptr = src;
-}
-
-static struct ace_reg_ops ace_reg_be16_ops = {
-	.in = ace_in_be16,
-	.out = ace_out_be16,
-	.datain = ace_datain_be16,
-	.dataout = ace_dataout_be16,
-};
-
-static struct ace_reg_ops ace_reg_le16_ops = {
-	.in = ace_in_le16,
-	.out = ace_out_le16,
-	.datain = ace_datain_le16,
-	.dataout = ace_dataout_le16,
-};
-
-static inline u16 ace_in(struct ace_device *ace, int reg)
-{
-	return ace->reg_ops->in(ace, reg);
-}
-
-static inline u32 ace_in32(struct ace_device *ace, int reg)
-{
-	return ace_in(ace, reg) | (ace_in(ace, reg + 2) << 16);
-}
-
-static inline void ace_out(struct ace_device *ace, int reg, u16 val)
-{
-	ace->reg_ops->out(ace, reg, val);
-}
-
-static inline void ace_out32(struct ace_device *ace, int reg, u32 val)
-{
-	ace_out(ace, reg, val);
-	ace_out(ace, reg + 2, val >> 16);
-}
-
-/* ---------------------------------------------------------------------
- * Debug support functions
- */
-
-#if defined(DEBUG)
-static void ace_dump_mem(void *base, int len)
-{
-	const char *ptr = base;
-	int i, j;
-
-	for (i = 0; i < len; i += 16) {
-		printk(KERN_INFO "%.8x:", i);
-		for (j = 0; j < 16; j++) {
-			if (!(j % 4))
-				printk(" ");
-			printk("%.2x", ptr[i + j]);
-		}
-		printk(" ");
-		for (j = 0; j < 16; j++)
-			printk("%c", isprint(ptr[i + j]) ? ptr[i + j] : '.');
-		printk("\n");
-	}
-}
-#else
-static inline void ace_dump_mem(void *base, int len)
-{
-}
-#endif
-
-static void ace_dump_regs(struct ace_device *ace)
-{
-	dev_info(ace->dev,
-		 "    ctrl:  %.8x  seccnt/cmd: %.4x      ver:%.4x\n"
-		 "    status:%.8x  mpu_lba:%.8x  busmode:%4x\n"
-		 "    error: %.8x  cfg_lba:%.8x  fatstat:%.4x\n",
-		 ace_in32(ace, ACE_CTRL),
-		 ace_in(ace, ACE_SECCNTCMD),
-		 ace_in(ace, ACE_VERSION),
-		 ace_in32(ace, ACE_STATUS),
-		 ace_in32(ace, ACE_MPULBA),
-		 ace_in(ace, ACE_BUSMODE),
-		 ace_in32(ace, ACE_ERROR),
-		 ace_in32(ace, ACE_CFGLBA), ace_in(ace, ACE_FATSTAT));
-}
-
-static void ace_fix_driveid(u16 *id)
-{
-#if defined(__BIG_ENDIAN)
-	int i;
-
-	/* All half words have wrong byte order; swap the bytes */
-	for (i = 0; i < ATA_ID_WORDS; i++, id++)
-		*id = le16_to_cpu(*id);
-#endif
-}
-
-/* ---------------------------------------------------------------------
- * Finite State Machine (FSM) implementation
- */
-
-/* FSM tasks; used to direct state transitions */
-#define ACE_TASK_IDLE      0
-#define ACE_TASK_IDENTIFY  1
-#define ACE_TASK_READ      2
-#define ACE_TASK_WRITE     3
-#define ACE_FSM_NUM_TASKS  4
-
-/* FSM state definitions */
-#define ACE_FSM_STATE_IDLE               0
-#define ACE_FSM_STATE_REQ_LOCK           1
-#define ACE_FSM_STATE_WAIT_LOCK          2
-#define ACE_FSM_STATE_WAIT_CFREADY       3
-#define ACE_FSM_STATE_IDENTIFY_PREPARE   4
-#define ACE_FSM_STATE_IDENTIFY_TRANSFER  5
-#define ACE_FSM_STATE_IDENTIFY_COMPLETE  6
-#define ACE_FSM_STATE_REQ_PREPARE        7
-#define ACE_FSM_STATE_REQ_TRANSFER       8
-#define ACE_FSM_STATE_REQ_COMPLETE       9
-#define ACE_FSM_STATE_ERROR             10
-#define ACE_FSM_NUM_STATES              11
-
-/* Set flag to exit FSM loop and reschedule tasklet */
-static inline void ace_fsm_yieldpoll(struct ace_device *ace)
-{
-	tasklet_schedule(&ace->fsm_tasklet);
-	ace->fsm_continue_flag = 0;
-}
-
-static inline void ace_fsm_yield(struct ace_device *ace)
-{
-	dev_dbg(ace->dev, "%s()\n", __func__);
-	ace_fsm_yieldpoll(ace);
-}
-
-/* Set flag to exit FSM loop and wait for IRQ to reschedule tasklet */
-static inline void ace_fsm_yieldirq(struct ace_device *ace)
-{
-	dev_dbg(ace->dev, "ace_fsm_yieldirq()\n");
-
-	if (ace->irq > 0)
-		ace->fsm_continue_flag = 0;
-	else
-		ace_fsm_yieldpoll(ace);
-}
-
-static bool ace_has_next_request(struct request_queue *q)
-{
-	struct ace_device *ace = q->queuedata;
-
-	return !list_empty(&ace->rq_list);
-}
-
-/* Get the next read/write request; ending requests that we don't handle */
-static struct request *ace_get_next_request(struct request_queue *q)
-{
-	struct ace_device *ace = q->queuedata;
-	struct request *rq;
-
-	rq = list_first_entry_or_null(&ace->rq_list, struct request, queuelist);
-	if (rq) {
-		list_del_init(&rq->queuelist);
-		blk_mq_start_request(rq);
-	}
-
-	return NULL;
-}
-
-static void ace_fsm_dostate(struct ace_device *ace)
-{
-	struct request *req;
-	u32 status;
-	u16 val;
-	int count;
-
-#if defined(DEBUG)
-	dev_dbg(ace->dev, "fsm_state=%i, id_req_count=%i\n",
-		ace->fsm_state, ace->id_req_count);
-#endif
-
-	/* Verify that there is actually a CF in the slot. If not, then
-	 * bail out back to the idle state and wake up all the waiters */
-	status = ace_in32(ace, ACE_STATUS);
-	if ((status & ACE_STATUS_CFDETECT) == 0) {
-		ace->fsm_state = ACE_FSM_STATE_IDLE;
-		ace->media_change = 1;
-		set_capacity(ace->gd, 0);
-		dev_info(ace->dev, "No CF in slot\n");
-
-		/* Drop all in-flight and pending requests */
-		if (ace->req) {
-			blk_mq_end_request(ace->req, BLK_STS_IOERR);
-			ace->req = NULL;
-		}
-		while ((req = ace_get_next_request(ace->queue)) != NULL)
-			blk_mq_end_request(req, BLK_STS_IOERR);
-
-		/* Drop back to IDLE state and notify waiters */
-		ace->fsm_state = ACE_FSM_STATE_IDLE;
-		ace->id_result = -EIO;
-		while (ace->id_req_count) {
-			complete(&ace->id_completion);
-			ace->id_req_count--;
-		}
-	}
-
-	switch (ace->fsm_state) {
-	case ACE_FSM_STATE_IDLE:
-		/* See if there is anything to do */
-		if (ace->id_req_count || ace_has_next_request(ace->queue)) {
-			ace->fsm_iter_num++;
-			ace->fsm_state = ACE_FSM_STATE_REQ_LOCK;
-			mod_timer(&ace->stall_timer, jiffies + HZ);
-			if (!timer_pending(&ace->stall_timer))
-				add_timer(&ace->stall_timer);
-			break;
-		}
-		del_timer(&ace->stall_timer);
-		ace->fsm_continue_flag = 0;
-		break;
-
-	case ACE_FSM_STATE_REQ_LOCK:
-		if (ace_in(ace, ACE_STATUS) & ACE_STATUS_MPULOCK) {
-			/* Already have the lock, jump to next state */
-			ace->fsm_state = ACE_FSM_STATE_WAIT_CFREADY;
-			break;
-		}
-
-		/* Request the lock */
-		val = ace_in(ace, ACE_CTRL);
-		ace_out(ace, ACE_CTRL, val | ACE_CTRL_LOCKREQ);
-		ace->fsm_state = ACE_FSM_STATE_WAIT_LOCK;
-		break;
-
-	case ACE_FSM_STATE_WAIT_LOCK:
-		if (ace_in(ace, ACE_STATUS) & ACE_STATUS_MPULOCK) {
-			/* got the lock; move to next state */
-			ace->fsm_state = ACE_FSM_STATE_WAIT_CFREADY;
-			break;
-		}
-
-		/* wait a bit for the lock */
-		ace_fsm_yield(ace);
-		break;
-
-	case ACE_FSM_STATE_WAIT_CFREADY:
-		status = ace_in32(ace, ACE_STATUS);
-		if (!(status & ACE_STATUS_RDYFORCFCMD) ||
-		    (status & ACE_STATUS_CFBSY)) {
-			/* CF card isn't ready; it needs to be polled */
-			ace_fsm_yield(ace);
-			break;
-		}
-
-		/* Device is ready for command; determine what to do next */
-		if (ace->id_req_count)
-			ace->fsm_state = ACE_FSM_STATE_IDENTIFY_PREPARE;
-		else
-			ace->fsm_state = ACE_FSM_STATE_REQ_PREPARE;
-		break;
-
-	case ACE_FSM_STATE_IDENTIFY_PREPARE:
-		/* Send identify command */
-		ace->fsm_task = ACE_TASK_IDENTIFY;
-		ace->data_ptr = ace->cf_id;
-		ace->data_count = ACE_BUF_PER_SECTOR;
-		ace_out(ace, ACE_SECCNTCMD, ACE_SECCNTCMD_IDENTIFY);
-
-		/* As per datasheet, put config controller in reset */
-		val = ace_in(ace, ACE_CTRL);
-		ace_out(ace, ACE_CTRL, val | ACE_CTRL_CFGRESET);
-
-		/* irq handler takes over from this point; wait for the
-		 * transfer to complete */
-		ace->fsm_state = ACE_FSM_STATE_IDENTIFY_TRANSFER;
-		ace_fsm_yieldirq(ace);
-		break;
-
-	case ACE_FSM_STATE_IDENTIFY_TRANSFER:
-		/* Check that the sysace is ready to receive data */
-		status = ace_in32(ace, ACE_STATUS);
-		if (status & ACE_STATUS_CFBSY) {
-			dev_dbg(ace->dev, "CFBSY set; t=%i iter=%i dc=%i\n",
-				ace->fsm_task, ace->fsm_iter_num,
-				ace->data_count);
-			ace_fsm_yield(ace);
-			break;
-		}
-		if (!(status & ACE_STATUS_DATABUFRDY)) {
-			ace_fsm_yield(ace);
-			break;
-		}
-
-		/* Transfer the next buffer */
-		ace->reg_ops->datain(ace);
-		ace->data_count--;
-
-		/* If there are still buffers to be transfers; jump out here */
-		if (ace->data_count != 0) {
-			ace_fsm_yieldirq(ace);
-			break;
-		}
-
-		/* transfer finished; kick state machine */
-		dev_dbg(ace->dev, "identify finished\n");
-		ace->fsm_state = ACE_FSM_STATE_IDENTIFY_COMPLETE;
-		break;
-
-	case ACE_FSM_STATE_IDENTIFY_COMPLETE:
-		ace_fix_driveid(ace->cf_id);
-		ace_dump_mem(ace->cf_id, 512);	/* Debug: Dump out disk ID */
-
-		if (ace->data_result) {
-			/* Error occurred, disable the disk */
-			ace->media_change = 1;
-			set_capacity(ace->gd, 0);
-			dev_err(ace->dev, "error fetching CF id (%i)\n",
-				ace->data_result);
-		} else {
-			ace->media_change = 0;
-
-			/* Record disk parameters */
-			set_capacity(ace->gd,
-				ata_id_u32(ace->cf_id, ATA_ID_LBA_CAPACITY));
-			dev_info(ace->dev, "capacity: %i sectors\n",
-				ata_id_u32(ace->cf_id, ATA_ID_LBA_CAPACITY));
-		}
-
-		/* We're done, drop to IDLE state and notify waiters */
-		ace->fsm_state = ACE_FSM_STATE_IDLE;
-		ace->id_result = ace->data_result;
-		while (ace->id_req_count) {
-			complete(&ace->id_completion);
-			ace->id_req_count--;
-		}
-		break;
-
-	case ACE_FSM_STATE_REQ_PREPARE:
-		req = ace_get_next_request(ace->queue);
-		if (!req) {
-			ace->fsm_state = ACE_FSM_STATE_IDLE;
-			break;
-		}
-
-		/* Okay, it's a data request, set it up for transfer */
-		dev_dbg(ace->dev,
-			"request: sec=%llx hcnt=%x, ccnt=%x, dir=%i\n",
-			(unsigned long long)blk_rq_pos(req),
-			blk_rq_sectors(req), blk_rq_cur_sectors(req),
-			rq_data_dir(req));
-
-		ace->req = req;
-		ace->data_ptr = bio_data(req->bio);
-		ace->data_count = blk_rq_cur_sectors(req) * ACE_BUF_PER_SECTOR;
-		ace_out32(ace, ACE_MPULBA, blk_rq_pos(req) & 0x0FFFFFFF);
-
-		count = blk_rq_sectors(req);
-		if (rq_data_dir(req)) {
-			/* Kick off write request */
-			dev_dbg(ace->dev, "write data\n");
-			ace->fsm_task = ACE_TASK_WRITE;
-			ace_out(ace, ACE_SECCNTCMD,
-				count | ACE_SECCNTCMD_WRITE_DATA);
-		} else {
-			/* Kick off read request */
-			dev_dbg(ace->dev, "read data\n");
-			ace->fsm_task = ACE_TASK_READ;
-			ace_out(ace, ACE_SECCNTCMD,
-				count | ACE_SECCNTCMD_READ_DATA);
-		}
-
-		/* As per datasheet, put config controller in reset */
-		val = ace_in(ace, ACE_CTRL);
-		ace_out(ace, ACE_CTRL, val | ACE_CTRL_CFGRESET);
-
-		/* Move to the transfer state.  The systemace will raise
-		 * an interrupt once there is something to do
-		 */
-		ace->fsm_state = ACE_FSM_STATE_REQ_TRANSFER;
-		if (ace->fsm_task == ACE_TASK_READ)
-			ace_fsm_yieldirq(ace);	/* wait for data ready */
-		break;
-
-	case ACE_FSM_STATE_REQ_TRANSFER:
-		/* Check that the sysace is ready to receive data */
-		status = ace_in32(ace, ACE_STATUS);
-		if (status & ACE_STATUS_CFBSY) {
-			dev_dbg(ace->dev,
-				"CFBSY set; t=%i iter=%i c=%i dc=%i irq=%i\n",
-				ace->fsm_task, ace->fsm_iter_num,
-				blk_rq_cur_sectors(ace->req) * 16,
-				ace->data_count, ace->in_irq);
-			ace_fsm_yield(ace);	/* need to poll CFBSY bit */
-			break;
-		}
-		if (!(status & ACE_STATUS_DATABUFRDY)) {
-			dev_dbg(ace->dev,
-				"DATABUF not set; t=%i iter=%i c=%i dc=%i irq=%i\n",
-				ace->fsm_task, ace->fsm_iter_num,
-				blk_rq_cur_sectors(ace->req) * 16,
-				ace->data_count, ace->in_irq);
-			ace_fsm_yieldirq(ace);
-			break;
-		}
-
-		/* Transfer the next buffer */
-		if (ace->fsm_task == ACE_TASK_WRITE)
-			ace->reg_ops->dataout(ace);
-		else
-			ace->reg_ops->datain(ace);
-		ace->data_count--;
-
-		/* If there are still buffers to be transfers; jump out here */
-		if (ace->data_count != 0) {
-			ace_fsm_yieldirq(ace);
-			break;
-		}
-
-		/* bio finished; is there another one? */
-		if (blk_update_request(ace->req, BLK_STS_OK,
-		    blk_rq_cur_bytes(ace->req))) {
-			/* dev_dbg(ace->dev, "next block; h=%u c=%u\n",
-			 *      blk_rq_sectors(ace->req),
-			 *      blk_rq_cur_sectors(ace->req));
-			 */
-			ace->data_ptr = bio_data(ace->req->bio);
-			ace->data_count = blk_rq_cur_sectors(ace->req) * 16;
-			ace_fsm_yieldirq(ace);
-			break;
-		}
-
-		ace->fsm_state = ACE_FSM_STATE_REQ_COMPLETE;
-		break;
-
-	case ACE_FSM_STATE_REQ_COMPLETE:
-		ace->req = NULL;
-
-		/* Finished request; go to idle state */
-		ace->fsm_state = ACE_FSM_STATE_IDLE;
-		break;
-
-	default:
-		ace->fsm_state = ACE_FSM_STATE_IDLE;
-		break;
-	}
-}
-
-static void ace_fsm_tasklet(unsigned long data)
-{
-	struct ace_device *ace = (void *)data;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ace->lock, flags);
-
-	/* Loop over state machine until told to stop */
-	ace->fsm_continue_flag = 1;
-	while (ace->fsm_continue_flag)
-		ace_fsm_dostate(ace);
-
-	spin_unlock_irqrestore(&ace->lock, flags);
-}
-
-static void ace_stall_timer(struct timer_list *t)
-{
-	struct ace_device *ace = from_timer(ace, t, stall_timer);
-	unsigned long flags;
-
-	dev_warn(ace->dev,
-		 "kicking stalled fsm; state=%i task=%i iter=%i dc=%i\n",
-		 ace->fsm_state, ace->fsm_task, ace->fsm_iter_num,
-		 ace->data_count);
-	spin_lock_irqsave(&ace->lock, flags);
-
-	/* Rearm the stall timer *before* entering FSM (which may then
-	 * delete the timer) */
-	mod_timer(&ace->stall_timer, jiffies + HZ);
-
-	/* Loop over state machine until told to stop */
-	ace->fsm_continue_flag = 1;
-	while (ace->fsm_continue_flag)
-		ace_fsm_dostate(ace);
-
-	spin_unlock_irqrestore(&ace->lock, flags);
-}
-
-/* ---------------------------------------------------------------------
- * Interrupt handling routines
- */
-static int ace_interrupt_checkstate(struct ace_device *ace)
-{
-	u32 sreg = ace_in32(ace, ACE_STATUS);
-	u16 creg = ace_in(ace, ACE_CTRL);
-
-	/* Check for error occurrence */
-	if ((sreg & (ACE_STATUS_CFGERROR | ACE_STATUS_CFCERROR)) &&
-	    (creg & ACE_CTRL_ERRORIRQ)) {
-		dev_err(ace->dev, "transfer failure\n");
-		ace_dump_regs(ace);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static irqreturn_t ace_interrupt(int irq, void *dev_id)
-{
-	u16 creg;
-	struct ace_device *ace = dev_id;
-
-	/* be safe and get the lock */
-	spin_lock(&ace->lock);
-	ace->in_irq = 1;
-
-	/* clear the interrupt */
-	creg = ace_in(ace, ACE_CTRL);
-	ace_out(ace, ACE_CTRL, creg | ACE_CTRL_RESETIRQ);
-	ace_out(ace, ACE_CTRL, creg);
-
-	/* check for IO failures */
-	if (ace_interrupt_checkstate(ace))
-		ace->data_result = -EIO;
-
-	if (ace->fsm_task == 0) {
-		dev_err(ace->dev,
-			"spurious irq; stat=%.8x ctrl=%.8x cmd=%.4x\n",
-			ace_in32(ace, ACE_STATUS), ace_in32(ace, ACE_CTRL),
-			ace_in(ace, ACE_SECCNTCMD));
-		dev_err(ace->dev, "fsm_task=%i fsm_state=%i data_count=%i\n",
-			ace->fsm_task, ace->fsm_state, ace->data_count);
-	}
-
-	/* Loop over state machine until told to stop */
-	ace->fsm_continue_flag = 1;
-	while (ace->fsm_continue_flag)
-		ace_fsm_dostate(ace);
-
-	/* done with interrupt; drop the lock */
-	ace->in_irq = 0;
-	spin_unlock(&ace->lock);
-
-	return IRQ_HANDLED;
-}
-
-/* ---------------------------------------------------------------------
- * Block ops
- */
-static blk_status_t ace_queue_rq(struct blk_mq_hw_ctx *hctx,
-				 const struct blk_mq_queue_data *bd)
-{
-	struct ace_device *ace = hctx->queue->queuedata;
-	struct request *req = bd->rq;
-
-	if (blk_rq_is_passthrough(req)) {
-		blk_mq_start_request(req);
-		return BLK_STS_IOERR;
-	}
-
-	spin_lock_irq(&ace->lock);
-	list_add_tail(&req->queuelist, &ace->rq_list);
-	spin_unlock_irq(&ace->lock);
-
-	tasklet_schedule(&ace->fsm_tasklet);
-	return BLK_STS_OK;
-}
-
-static unsigned int ace_check_events(struct gendisk *gd, unsigned int clearing)
-{
-	struct ace_device *ace = gd->private_data;
-	dev_dbg(ace->dev, "ace_check_events(): %i\n", ace->media_change);
-
-	return ace->media_change ? DISK_EVENT_MEDIA_CHANGE : 0;
-}
-
-static void ace_media_changed(struct ace_device *ace)
-{
-	unsigned long flags;
-
-	dev_dbg(ace->dev, "requesting cf id and scheduling tasklet\n");
-
-	spin_lock_irqsave(&ace->lock, flags);
-	ace->id_req_count++;
-	spin_unlock_irqrestore(&ace->lock, flags);
-
-	tasklet_schedule(&ace->fsm_tasklet);
-	wait_for_completion(&ace->id_completion);
-
-	dev_dbg(ace->dev, "revalidate complete\n");
-}
-
-static int ace_open(struct block_device *bdev, fmode_t mode)
-{
-	struct ace_device *ace = bdev->bd_disk->private_data;
-	unsigned long flags;
-
-	dev_dbg(ace->dev, "ace_open() users=%i\n", ace->users + 1);
-
-	mutex_lock(&xsysace_mutex);
-	spin_lock_irqsave(&ace->lock, flags);
-	ace->users++;
-	spin_unlock_irqrestore(&ace->lock, flags);
-
-	if (bdev_check_media_change(bdev) && ace->media_change)
-		ace_media_changed(ace);
-	mutex_unlock(&xsysace_mutex);
-
-	return 0;
-}
-
-static void ace_release(struct gendisk *disk, fmode_t mode)
-{
-	struct ace_device *ace = disk->private_data;
-	unsigned long flags;
-	u16 val;
-
-	dev_dbg(ace->dev, "ace_release() users=%i\n", ace->users - 1);
-
-	mutex_lock(&xsysace_mutex);
-	spin_lock_irqsave(&ace->lock, flags);
-	ace->users--;
-	if (ace->users == 0) {
-		val = ace_in(ace, ACE_CTRL);
-		ace_out(ace, ACE_CTRL, val & ~ACE_CTRL_LOCKREQ);
-	}
-	spin_unlock_irqrestore(&ace->lock, flags);
-	mutex_unlock(&xsysace_mutex);
-}
-
-static int ace_getgeo(struct block_device *bdev, struct hd_geometry *geo)
-{
-	struct ace_device *ace = bdev->bd_disk->private_data;
-	u16 *cf_id = ace->cf_id;
-
-	dev_dbg(ace->dev, "ace_getgeo()\n");
-
-	geo->heads	= cf_id[ATA_ID_HEADS];
-	geo->sectors	= cf_id[ATA_ID_SECTORS];
-	geo->cylinders	= cf_id[ATA_ID_CYLS];
-
-	return 0;
-}
-
-static const struct block_device_operations ace_fops = {
-	.owner = THIS_MODULE,
-	.open = ace_open,
-	.release = ace_release,
-	.check_events = ace_check_events,
-	.getgeo = ace_getgeo,
-};
-
-static const struct blk_mq_ops ace_mq_ops = {
-	.queue_rq	= ace_queue_rq,
-};
-
-/* --------------------------------------------------------------------
- * SystemACE device setup/teardown code
- */
-static int ace_setup(struct ace_device *ace)
-{
-	u16 version;
-	u16 val;
-	int rc;
-
-	dev_dbg(ace->dev, "ace_setup(ace=0x%p)\n", ace);
-	dev_dbg(ace->dev, "physaddr=0x%llx irq=%i\n",
-		(unsigned long long)ace->physaddr, ace->irq);
-
-	spin_lock_init(&ace->lock);
-	init_completion(&ace->id_completion);
-	INIT_LIST_HEAD(&ace->rq_list);
-
-	/*
-	 * Map the device
-	 */
-	ace->baseaddr = ioremap(ace->physaddr, 0x80);
-	if (!ace->baseaddr)
-		goto err_ioremap;
-
-	/*
-	 * Initialize the state machine tasklet and stall timer
-	 */
-	tasklet_init(&ace->fsm_tasklet, ace_fsm_tasklet, (unsigned long)ace);
-	timer_setup(&ace->stall_timer, ace_stall_timer, 0);
-
-	/*
-	 * Initialize the request queue
-	 */
-	ace->queue = blk_mq_init_sq_queue(&ace->tag_set, &ace_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(ace->queue)) {
-		rc = PTR_ERR(ace->queue);
-		ace->queue = NULL;
-		goto err_blk_initq;
-	}
-	ace->queue->queuedata = ace;
-
-	blk_queue_logical_block_size(ace->queue, 512);
-	blk_queue_bounce_limit(ace->queue, BLK_BOUNCE_HIGH);
-
-	/*
-	 * Allocate and initialize GD structure
-	 */
-	ace->gd = alloc_disk(ACE_NUM_MINORS);
-	if (!ace->gd)
-		goto err_alloc_disk;
-
-	ace->gd->major = ace_major;
-	ace->gd->first_minor = ace->id * ACE_NUM_MINORS;
-	ace->gd->fops = &ace_fops;
-	ace->gd->events = DISK_EVENT_MEDIA_CHANGE;
-	ace->gd->queue = ace->queue;
-	ace->gd->private_data = ace;
-	snprintf(ace->gd->disk_name, 32, "xs%c", ace->id + 'a');
-
-	/* set bus width */
-	if (ace->bus_width == ACE_BUS_WIDTH_16) {
-		/* 0x0101 should work regardless of endianess */
-		ace_out_le16(ace, ACE_BUSMODE, 0x0101);
-
-		/* read it back to determine endianess */
-		if (ace_in_le16(ace, ACE_BUSMODE) == 0x0001)
-			ace->reg_ops = &ace_reg_le16_ops;
-		else
-			ace->reg_ops = &ace_reg_be16_ops;
-	} else {
-		ace_out_8(ace, ACE_BUSMODE, 0x00);
-		ace->reg_ops = &ace_reg_8_ops;
-	}
-
-	/* Make sure version register is sane */
-	version = ace_in(ace, ACE_VERSION);
-	if ((version == 0) || (version == 0xFFFF))
-		goto err_read;
-
-	/* Put sysace in a sane state by clearing most control reg bits */
-	ace_out(ace, ACE_CTRL, ACE_CTRL_FORCECFGMODE |
-		ACE_CTRL_DATABUFRDYIRQ | ACE_CTRL_ERRORIRQ);
-
-	/* Now we can hook up the irq handler */
-	if (ace->irq > 0) {
-		rc = request_irq(ace->irq, ace_interrupt, 0, "systemace", ace);
-		if (rc) {
-			/* Failure - fall back to polled mode */
-			dev_err(ace->dev, "request_irq failed\n");
-			ace->irq = rc;
-		}
-	}
-
-	/* Enable interrupts */
-	val = ace_in(ace, ACE_CTRL);
-	val |= ACE_CTRL_DATABUFRDYIRQ | ACE_CTRL_ERRORIRQ;
-	ace_out(ace, ACE_CTRL, val);
-
-	/* Print the identification */
-	dev_info(ace->dev, "Xilinx SystemACE revision %i.%i.%i\n",
-		 (version >> 12) & 0xf, (version >> 8) & 0x0f, version & 0xff);
-	dev_dbg(ace->dev, "physaddr 0x%llx, mapped to 0x%p, irq=%i\n",
-		(unsigned long long) ace->physaddr, ace->baseaddr, ace->irq);
-
-	ace->media_change = 1;
-	ace_media_changed(ace);
-
-	/* Make the sysace device 'live' */
-	add_disk(ace->gd);
-
-	return 0;
-
-err_read:
-	/* prevent double queue cleanup */
-	ace->gd->queue = NULL;
-	put_disk(ace->gd);
-err_alloc_disk:
-	blk_cleanup_queue(ace->queue);
-	blk_mq_free_tag_set(&ace->tag_set);
-err_blk_initq:
-	iounmap(ace->baseaddr);
-err_ioremap:
-	dev_info(ace->dev, "xsysace: error initializing device at 0x%llx\n",
-		 (unsigned long long) ace->physaddr);
-	return -ENOMEM;
-}
-
-static void ace_teardown(struct ace_device *ace)
-{
-	if (ace->gd) {
-		del_gendisk(ace->gd);
-		put_disk(ace->gd);
-	}
-
-	if (ace->queue) {
-		blk_cleanup_queue(ace->queue);
-		blk_mq_free_tag_set(&ace->tag_set);
-	}
-
-	tasklet_kill(&ace->fsm_tasklet);
-
-	if (ace->irq > 0)
-		free_irq(ace->irq, ace);
-
-	iounmap(ace->baseaddr);
-}
-
-static int ace_alloc(struct device *dev, int id, resource_size_t physaddr,
-		     int irq, int bus_width)
-{
-	struct ace_device *ace;
-	int rc;
-	dev_dbg(dev, "ace_alloc(%p)\n", dev);
-
-	/* Allocate and initialize the ace device structure */
-	ace = kzalloc(sizeof(struct ace_device), GFP_KERNEL);
-	if (!ace) {
-		rc = -ENOMEM;
-		goto err_alloc;
-	}
-
-	ace->dev = dev;
-	ace->id = id;
-	ace->physaddr = physaddr;
-	ace->irq = irq;
-	ace->bus_width = bus_width;
-
-	/* Call the setup code */
-	rc = ace_setup(ace);
-	if (rc)
-		goto err_setup;
-
-	dev_set_drvdata(dev, ace);
-	return 0;
-
-err_setup:
-	dev_set_drvdata(dev, NULL);
-	kfree(ace);
-err_alloc:
-	dev_err(dev, "could not initialize device, err=%i\n", rc);
-	return rc;
-}
-
-static void ace_free(struct device *dev)
-{
-	struct ace_device *ace = dev_get_drvdata(dev);
-	dev_dbg(dev, "ace_free(%p)\n", dev);
-
-	if (ace) {
-		ace_teardown(ace);
-		dev_set_drvdata(dev, NULL);
-		kfree(ace);
-	}
-}
-
-/* ---------------------------------------------------------------------
- * Platform Bus Support
- */
-
-static int ace_probe(struct platform_device *dev)
-{
-	int bus_width = ACE_BUS_WIDTH_16; /* FIXME: should not be hard coded */
-	resource_size_t physaddr;
-	struct resource *res;
-	u32 id = dev->id;
-	int irq;
-	int i;
-
-	dev_dbg(&dev->dev, "ace_probe(%p)\n", dev);
-
-	/* device id and bus width */
-	if (of_property_read_u32(dev->dev.of_node, "port-number", &id))
-		id = 0;
-	if (of_find_property(dev->dev.of_node, "8-bit", NULL))
-		bus_width = ACE_BUS_WIDTH_8;
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
-	physaddr = res->start;
-	if (!physaddr)
-		return -ENODEV;
-
-	irq = platform_get_irq_optional(dev, 0);
-
-	/* Call the bus-independent setup code */
-	return ace_alloc(&dev->dev, id, physaddr, irq, bus_width);
-}
-
-/*
- * Platform bus remove() method
- */
-static int ace_remove(struct platform_device *dev)
-{
-	ace_free(&dev->dev);
-	return 0;
-}
-
-#if defined(CONFIG_OF)
-/* Match table for of_platform binding */
-static const struct of_device_id ace_of_match[] = {
-	{ .compatible = "xlnx,opb-sysace-1.00.b", },
-	{ .compatible = "xlnx,opb-sysace-1.00.c", },
-	{ .compatible = "xlnx,xps-sysace-1.00.a", },
-	{ .compatible = "xlnx,sysace", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, ace_of_match);
-#else /* CONFIG_OF */
-#define ace_of_match NULL
-#endif /* CONFIG_OF */
-
-static struct platform_driver ace_platform_driver = {
-	.probe = ace_probe,
-	.remove = ace_remove,
-	.driver = {
-		.name = "xsysace",
-		.of_match_table = ace_of_match,
-	},
-};
-
-/* ---------------------------------------------------------------------
- * Module init/exit routines
- */
-static int __init ace_init(void)
-{
-	int rc;
-
-	ace_major = register_blkdev(ace_major, "xsysace");
-	if (ace_major <= 0) {
-		rc = -ENOMEM;
-		goto err_blk;
-	}
-
-	rc = platform_driver_register(&ace_platform_driver);
-	if (rc)
-		goto err_plat;
-
-	pr_info("Xilinx SystemACE device driver, major=%i\n", ace_major);
-	return 0;
-
-err_plat:
-	unregister_blkdev(ace_major, "xsysace");
-err_blk:
-	printk(KERN_ERR "xsysace: registration failed; err=%i\n", rc);
-	return rc;
-}
-module_init(ace_init);
-
-static void __exit ace_exit(void)
-{
-	pr_debug("Unregistering Xilinx SystemACE driver\n");
-	platform_driver_unregister(&ace_platform_driver);
-	unregister_blkdev(ace_major, "xsysace");
-}
-module_exit(ace_exit);
-- 
2.29.2

