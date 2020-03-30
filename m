Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEABF197D2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 15:42:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rYYH680ZzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 00:42:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=q3HwXhw/; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rYKq1QklzDqdZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 00:32:30 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id t128so1540772wma.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZjWbXNPNDso2IbgPyxZDNMmgqiaWWsLO5DMmS/dNW8=;
 b=q3HwXhw/AoV7n2wIO9x24v8x13bFRDR2z2GZqCS2IkG8I3zVDUs4KRsGpYJSJI3GZo
 AS4MdAto3ksAghXxMSsFE709ifzUngBFdr2mj6JELM3mbvtvgfz/XBaJpA9LNWj8h3oT
 rXERqJABuMhMqNpdM3Fij6EzncUMtMUS1voHtyoazKdvoMhR5+hzlg6A/K+DTt3prNdB
 v9H/VOap7sxHYgBHiXzCqJXlhCuTvLA1nRYdtNjGXvu76LZf1dIXLbhRF+GMOgwASC9t
 K1PpR742k7SkIXnTk5COju+a0oayJGGexHBa9pdmfgwJOQaVzhZikfpxdbcei6EBE/gh
 ybPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JZjWbXNPNDso2IbgPyxZDNMmgqiaWWsLO5DMmS/dNW8=;
 b=MjJ7RmbAGrvxOdUIBVen64POF+c8KsNkZ14+etOOLzxhTTjvOteXfLZic7lZt3TElM
 ZSZkGc0SB7jPOODjiFrjnJVWLri5i3JA0mVubF9jz3MwgFDk9VgI0QDJ4r77jaLNNMsD
 TL2rSkiLzvcgGr6UsJaK1Axp9UZedI68bw7ufEiftHx4fdQn2+P0IXgP6S3yoq6m04BG
 AE3SV2Je0egAK8RvWV0dSyTZ3p4VEL760IZf/O8ilNtbpo8Ly0zkdaU1aUA6ZuQe18NB
 s91vIknIQYWtb3S0y/M9O9RhMxLlK/dO9LnqK83hrJgmpK0IXyueQUmsejdkI3xQhJ+r
 C/QA==
X-Gm-Message-State: ANhLgQ01ity3Isc0XqmYuWBmjzgCcVV97c/U2i6ICMWEDLnGwFVfM+sm
 3kosan/XUxLPfJisZgVpY5LTfA==
X-Google-Smtp-Source: ADFU+vvdniTqidjqKrMGa9gHW4sCz71LV5HX5iRN3VuFZfL4RO0xpQctSwCLMHA8IbQM2YVqrJhXTA==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr13689917wmi.90.1585575143402; 
 Mon, 30 Mar 2020 06:32:23 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id l12sm21742475wrt.73.2020.03.30.06.32.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 06:32:22 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, sfr@canb.auug.org.au, maz@kernel.org
Subject: [PATCH v2 2/2] powerpc: Remove Xilinx PPC405/PPC440 support
Date: Mon, 30 Mar 2020 15:32:17 +0200
Message-Id: <9c3e02ffa9812c6f046708b45932d40f33e8817a.1585575111.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1585575111.git.michal.simek@xilinx.com>
References: <cover.1585575111.git.michal.simek@xilinx.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The latest Xilinx design tools called ISE and EDK has been released in
October 2013. New tool doesn't support any PPC405/PPC440 new designs.
These platforms are no longer supported and tested.

PowerPC 405/440 port is orphan from 2013 by
commit cdeb89943bfc ("MAINTAINERS: Fix incorrect status tag") and
commit 19624236cce1 ("MAINTAINERS: Update Grant's email address and maintainership")
that's why it is time to remove the support fot these platforms.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---

Changes in v2:
- Based on my chat with Arnd I removed arch/powerpc/xmon/ changes done in
  v1 to keep them the same as before. (kbuild reported some issues with it
  too)

 Documentation/devicetree/bindings/xilinx.txt | 143 ------
 Documentation/powerpc/bootwrapper.rst        |  28 +-
 MAINTAINERS                                  |   6 -
 arch/powerpc/Kconfig.debug                   |   2 +-
 arch/powerpc/boot/Makefile                   |   7 +-
 arch/powerpc/boot/dts/Makefile               |   1 -
 arch/powerpc/boot/dts/virtex440-ml507.dts    | 406 ----------------
 arch/powerpc/boot/dts/virtex440-ml510.dts    | 466 -------------------
 arch/powerpc/boot/ops.h                      |   1 -
 arch/powerpc/boot/serial.c                   |   5 -
 arch/powerpc/boot/uartlite.c                 |  79 ----
 arch/powerpc/boot/virtex.c                   |  97 ----
 arch/powerpc/boot/virtex405-head.S           |  31 --
 arch/powerpc/boot/wrapper                    |   8 -
 arch/powerpc/configs/40x/virtex_defconfig    |  75 ---
 arch/powerpc/configs/44x/virtex5_defconfig   |  74 ---
 arch/powerpc/configs/ppc40x_defconfig        |   8 -
 arch/powerpc/configs/ppc44x_defconfig        |   8 -
 arch/powerpc/include/asm/xilinx_intc.h       |  16 -
 arch/powerpc/include/asm/xilinx_pci.h        |  21 -
 arch/powerpc/kernel/cputable.c               |  39 --
 arch/powerpc/platforms/40x/Kconfig           |  31 --
 arch/powerpc/platforms/40x/Makefile          |   1 -
 arch/powerpc/platforms/40x/virtex.c          |  54 ---
 arch/powerpc/platforms/44x/Kconfig           |  37 --
 arch/powerpc/platforms/44x/Makefile          |   2 -
 arch/powerpc/platforms/44x/virtex.c          |  60 ---
 arch/powerpc/platforms/44x/virtex_ml510.c    |  30 --
 arch/powerpc/platforms/Kconfig               |   4 -
 arch/powerpc/sysdev/Makefile                 |   2 -
 arch/powerpc/sysdev/xilinx_intc.c            |  88 ----
 arch/powerpc/sysdev/xilinx_pci.c             | 132 ------
 drivers/char/Kconfig                         |   2 +-
 drivers/video/fbdev/Kconfig                  |   2 +-
 34 files changed, 7 insertions(+), 1959 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml507.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml510.dts
 delete mode 100644 arch/powerpc/boot/uartlite.c
 delete mode 100644 arch/powerpc/boot/virtex.c
 delete mode 100644 arch/powerpc/boot/virtex405-head.S
 delete mode 100644 arch/powerpc/configs/40x/virtex_defconfig
 delete mode 100644 arch/powerpc/configs/44x/virtex5_defconfig
 delete mode 100644 arch/powerpc/include/asm/xilinx_intc.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_pci.h
 delete mode 100644 arch/powerpc/platforms/40x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex_ml510.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_intc.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_pci.c

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index d058ace29345..28199b31fe5e 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -86,149 +86,6 @@
 		xlnx,use-parity = <0>;
 	};
 
-   Some IP cores actually implement 2 or more logical devices.  In
-   this case, the device should still describe the whole IP core with
-   a single node and add a child node for each logical device.  The
-   ranges property can be used to translate from parent IP-core to the
-   registers of each device.  In addition, the parent node should be
-   compatible with the bus type 'xlnx,compound', and should contain
-   #address-cells and #size-cells, as with any other bus.  (Note: this
-   makes the assumption that both logical devices have the same bus
-   binding.  If this is not true, then separate nodes should be used
-   for each logical device).  The 'cell-index' property can be used to
-   enumerate logical devices within an IP core.  For example, the
-   following is the system.mhs entry for the dual ps2 controller found
-   on the ml403 reference design.
-
-	BEGIN opb_ps2_dual_ref
-		PARAMETER INSTANCE = opb_ps2_dual_ref_0
-		PARAMETER HW_VER = 1.00.a
-		PARAMETER C_BASEADDR = 0xA9000000
-		PARAMETER C_HIGHADDR = 0xA9001FFF
-		BUS_INTERFACE SOPB = opb_v20_0
-		PORT Sys_Intr1 = ps2_1_intr
-		PORT Sys_Intr2 = ps2_2_intr
-		PORT Clkin1 = ps2_clk_rx_1
-		PORT Clkin2 = ps2_clk_rx_2
-		PORT Clkpd1 = ps2_clk_tx_1
-		PORT Clkpd2 = ps2_clk_tx_2
-		PORT Rx1 = ps2_d_rx_1
-		PORT Rx2 = ps2_d_rx_2
-		PORT Txpd1 = ps2_d_tx_1
-		PORT Txpd2 = ps2_d_tx_2
-	END
-
-   It would result in the following device tree nodes:
-
-	opb_ps2_dual_ref_0: opb-ps2-dual-ref@a9000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "xlnx,compound";
-		ranges = <0 a9000000 2000>;
-		// If this device had extra parameters, then they would
-		// go here.
-		ps2@0 {
-			compatible = "xlnx,opb-ps2-dual-ref-1.00.a";
-			reg = <0 40>;
-			interrupt-parent = <&opb_intc_0>;
-			interrupts = <3 0>;
-			cell-index = <0>;
-		};
-		ps2@1000 {
-			compatible = "xlnx,opb-ps2-dual-ref-1.00.a";
-			reg = <1000 40>;
-			interrupt-parent = <&opb_intc_0>;
-			interrupts = <3 0>;
-			cell-index = <0>;
-		};
-	};
-
-   Also, the system.mhs file defines bus attachments from the processor
-   to the devices.  The device tree structure should reflect the bus
-   attachments.  Again an example; this system.mhs fragment:
-
-	BEGIN ppc405_virtex4
-		PARAMETER INSTANCE = ppc405_0
-		PARAMETER HW_VER = 1.01.a
-		BUS_INTERFACE DPLB = plb_v34_0
-		BUS_INTERFACE IPLB = plb_v34_0
-	END
-
-	BEGIN opb_intc
-		PARAMETER INSTANCE = opb_intc_0
-		PARAMETER HW_VER = 1.00.c
-		PARAMETER C_BASEADDR = 0xD1000FC0
-		PARAMETER C_HIGHADDR = 0xD1000FDF
-		BUS_INTERFACE SOPB = opb_v20_0
-	END
-
-	BEGIN opb_uart16550
-		PARAMETER INSTANCE = opb_uart16550_0
-		PARAMETER HW_VER = 1.00.d
-		PARAMETER C_BASEADDR = 0xa0000000
-		PARAMETER C_HIGHADDR = 0xa0001FFF
-		BUS_INTERFACE SOPB = opb_v20_0
-	END
-
-	BEGIN plb_v34
-		PARAMETER INSTANCE = plb_v34_0
-		PARAMETER HW_VER = 1.02.a
-	END
-
-	BEGIN plb_bram_if_cntlr
-		PARAMETER INSTANCE = plb_bram_if_cntlr_0
-		PARAMETER HW_VER = 1.00.b
-		PARAMETER C_BASEADDR = 0xFFFF0000
-		PARAMETER C_HIGHADDR = 0xFFFFFFFF
-		BUS_INTERFACE SPLB = plb_v34_0
-	END
-
-	BEGIN plb2opb_bridge
-		PARAMETER INSTANCE = plb2opb_bridge_0
-		PARAMETER HW_VER = 1.01.a
-		PARAMETER C_RNG0_BASEADDR = 0x20000000
-		PARAMETER C_RNG0_HIGHADDR = 0x3FFFFFFF
-		PARAMETER C_RNG1_BASEADDR = 0x60000000
-		PARAMETER C_RNG1_HIGHADDR = 0x7FFFFFFF
-		PARAMETER C_RNG2_BASEADDR = 0x80000000
-		PARAMETER C_RNG2_HIGHADDR = 0xBFFFFFFF
-		PARAMETER C_RNG3_BASEADDR = 0xC0000000
-		PARAMETER C_RNG3_HIGHADDR = 0xDFFFFFFF
-		BUS_INTERFACE SPLB = plb_v34_0
-		BUS_INTERFACE MOPB = opb_v20_0
-	END
-
-   Gives this device tree (some properties removed for clarity):
-
-	plb@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "xlnx,plb-v34-1.02.a";
-		device_type = "ibm,plb";
-		ranges; // 1:1 translation
-
-		plb_bram_if_cntrl_0: bram@ffff0000 {
-			reg = <ffff0000 10000>;
-		}
-
-		opb@20000000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <20000000 20000000 20000000
-				  60000000 60000000 20000000
-				  80000000 80000000 40000000
-				  c0000000 c0000000 20000000>;
-
-			opb_uart16550_0: serial@a0000000 {
-				reg = <a00000000 2000>;
-			};
-
-			opb_intc_0: interrupt-controller@d1000fc0 {
-				reg = <d1000fc0 20>;
-			};
-		};
-	};
-
    That covers the general approach to binding xilinx IP cores into the
    device tree.  The following are bindings for specific devices:
 
diff --git a/Documentation/powerpc/bootwrapper.rst b/Documentation/powerpc/bootwrapper.rst
index a6292afba573..cdfa2bc8425f 100644
--- a/Documentation/powerpc/bootwrapper.rst
+++ b/Documentation/powerpc/bootwrapper.rst
@@ -70,28 +70,6 @@ Currently, the following image format targets exist:
 			kernel with this image type and it depends entirely on
 			the embedded device tree for all information.
 
-			The simpleImage is useful for booting systems with
-			an unknown firmware interface or for booting from
-			a debugger when no firmware is present (such as on
-			the Xilinx Virtex platform).  The only assumption that
-			simpleImage makes is that RAM is correctly initialized
-			and that the MMU is either off or has RAM mapped to
-			base address 0.
-
-			simpleImage also supports inserting special platform
-			specific initialization code to the start of the bootup
-			sequence.  The virtex405 platform uses this feature to
-			ensure that the cache is invalidated before caching
-			is enabled.  Platform specific initialization code is
-			added as part of the wrapper script and is keyed on
-			the image target name.  For example, all
-			simpleImage.virtex405-* targets will add the
-			virtex405-head.S initialization code (This also means
-			that the dts file for virtex405 targets should be
-			named (virtex405-<board>.dts).  Search the wrapper
-			script for 'virtex405' and see the file
-			arch/powerpc/boot/virtex405-head.S for details.
-
    treeImage.%;		Image format for used with OpenBIOS firmware found
 			on some ppc4xx hardware.  This image embeds a device
 			tree blob inside the image.
@@ -116,10 +94,8 @@ Image types which embed a device tree blob (simpleImage, dtbImage, treeImage,
 and cuImage) all generate the device tree blob from a file in the
 arch/powerpc/boot/dts/ directory.  The Makefile selects the correct device
 tree source based on the name of the target.  Therefore, if the kernel is
-built with 'make treeImage.walnut simpleImage.virtex405-ml403', then the
-build system will use arch/powerpc/boot/dts/walnut.dts to build
-treeImage.walnut and arch/powerpc/boot/dts/virtex405-ml403.dts to build
-the simpleImage.virtex405-ml403.
+built with 'make treeImage.walnut', then the build system will use
+arch/powerpc/boot/dts/walnut.dts to build treeImage.walnut.
 
 Two special targets called 'zImage' and 'zImage.initrd' also exist.  These
 targets build all the default images as selected by the kernel configuration.
diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..842a9bbc2013 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9668,12 +9668,6 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/platforms/8xx/
 
-LINUX FOR POWERPC EMBEDDED XILINX VIRTEX
-L:	linuxppc-dev@lists.ozlabs.org
-S:	Orphan
-F:	arch/powerpc/*/*virtex*
-F:	arch/powerpc/*/*/*virtex*
-
 LINUX FOR POWERPC PA SEMI PWRFICIENT
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Orphan
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 0b063830eea8..b88900f4832f 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -230,7 +230,7 @@ config PPC_EARLY_DEBUG_40x
 	help
 	  Select this to enable early debugging for IBM 40x chips via the
 	  inbuilt serial port. This works on chips with a 16550 compatible
-	  UART. Xilinx chips with uartlite cannot use this option.
+	  UART.
 
 config PPC_EARLY_DEBUG_CPM
 	bool "Early serial debugging for Freescale CPM-based serial ports"
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index c53a1b8bba8b..d8077b7071dd 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -79,7 +79,6 @@ $(obj)/treeboot-walnut.o: BOOTCFLAGS += -mcpu=405
 $(obj)/treeboot-iss4xx.o: BOOTCFLAGS += -mcpu=405
 $(obj)/treeboot-currituck.o: BOOTCFLAGS += -mcpu=405
 $(obj)/treeboot-akebono.o: BOOTCFLAGS += -mcpu=405
-$(obj)/virtex405-head.o: BOOTAFLAGS += -mcpu=405
 
 # The pre-boot decompressors pull in a lot of kernel headers and other source
 # files. This creates a bit of a dependency headache since we need to copy
@@ -129,14 +128,12 @@ src-wlib-$(CONFIG_44x) += 4xx.c ebony.c bamboo.c
 src-wlib-$(CONFIG_PPC_8xx) += mpc8xx.c planetcore.c fsl-soc.c
 src-wlib-$(CONFIG_PPC_82xx) += pq2.c fsl-soc.c planetcore.c
 src-wlib-$(CONFIG_EMBEDDED6xx) += ugecon.c fsl-soc.c
-src-wlib-$(CONFIG_XILINX_VIRTEX) += uartlite.c
 src-wlib-$(CONFIG_CPM) += cpm-serial.c
 
 src-plat-y := of.c epapr.c
 src-plat-$(CONFIG_40x) += fixed-head.S ep405.c cuboot-hotfoot.c \
 				treeboot-walnut.c cuboot-acadia.c \
-				cuboot-kilauea.c simpleboot.c \
-				virtex405-head.S virtex.c
+				cuboot-kilauea.c simpleboot.c
 src-plat-$(CONFIG_44x) += treeboot-ebony.c cuboot-ebony.c treeboot-bamboo.c \
 				cuboot-bamboo.c cuboot-sam440ep.c \
 				cuboot-sequoia.c cuboot-rainier.c \
@@ -144,7 +141,7 @@ src-plat-$(CONFIG_44x) += treeboot-ebony.c cuboot-ebony.c treeboot-bamboo.c \
 				cuboot-warp.c cuboot-yosemite.c \
 				treeboot-iss4xx.c treeboot-currituck.c \
 				treeboot-akebono.c \
-				simpleboot.c fixed-head.S virtex.c
+				simpleboot.c fixed-head.S
 src-plat-$(CONFIG_PPC_8xx) += cuboot-8xx.c fixed-head.S ep88xc.c redboot-8xx.c
 src-plat-$(CONFIG_PPC_MPC52xx) += cuboot-52xx.c
 src-plat-$(CONFIG_PPC_82xx) += cuboot-pq2.c fixed-head.S ep8248e.c cuboot-824x.c
diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 1cbc0e4ce857..fb335d05aae8 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -4,4 +4,3 @@ subdir-y += fsl
 
 dtstree		:= $(srctree)/$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
-dtb-$(CONFIG_XILINX_VIRTEX440_GENERIC_BOARD) += virtex440-ml507.dtb virtex440-ml510.dtb
diff --git a/arch/powerpc/boot/dts/virtex440-ml507.dts b/arch/powerpc/boot/dts/virtex440-ml507.dts
deleted file mode 100644
index 66f1c6312de6..000000000000
--- a/arch/powerpc/boot/dts/virtex440-ml507.dts
+++ /dev/null
@@ -1,406 +0,0 @@
-/*
- * This file supports the Xilinx ML507 board with the 440 processor.
- * A reference design for the FPGA is provided at http://git.xilinx.com.
- *
- * (C) Copyright 2008 Xilinx, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- *
- * ---
- *
- * Device Tree Generator version: 1.1
- *
- * CAUTION: This file is automatically generated by libgen.
- * Version: Xilinx EDK 10.1.03 EDK_K_SP3.6
- *
- * XPS project directory: ml507_ppc440_emb_ref
- */
-
-/dts-v1/;
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "xlnx,virtex440";
-	dcr-parent = <&ppc440_0>;
-	model = "testing";
-	DDR2_SDRAM: memory@0 {
-		device_type = "memory";
-		reg = < 0 0x10000000 >;
-	} ;
-	chosen {
-		bootargs = "console=ttyS0 root=/dev/ram";
-		stdout-path = &RS232_Uart_1;
-	} ;
-	cpus {
-		#address-cells = <1>;
-		#cpus = <1>;
-		#size-cells = <0>;
-		ppc440_0: cpu@0 {
-			clock-frequency = <400000000>;
-			compatible = "PowerPC,440", "ibm,ppc440";
-			d-cache-line-size = <0x20>;
-			d-cache-size = <0x8000>;
-			dcr-access-method = "native";
-			dcr-controller ;
-			device_type = "cpu";
-			i-cache-line-size = <0x20>;
-			i-cache-size = <0x8000>;
-			model = "PowerPC,440";
-			reg = <0>;
-			timebase-frequency = <400000000>;
-			xlnx,apu-control = <1>;
-			xlnx,apu-udi-0 = <0>;
-			xlnx,apu-udi-1 = <0>;
-			xlnx,apu-udi-10 = <0>;
-			xlnx,apu-udi-11 = <0>;
-			xlnx,apu-udi-12 = <0>;
-			xlnx,apu-udi-13 = <0>;
-			xlnx,apu-udi-14 = <0>;
-			xlnx,apu-udi-15 = <0>;
-			xlnx,apu-udi-2 = <0>;
-			xlnx,apu-udi-3 = <0>;
-			xlnx,apu-udi-4 = <0>;
-			xlnx,apu-udi-5 = <0>;
-			xlnx,apu-udi-6 = <0>;
-			xlnx,apu-udi-7 = <0>;
-			xlnx,apu-udi-8 = <0>;
-			xlnx,apu-udi-9 = <0>;
-			xlnx,dcr-autolock-enable = <1>;
-			xlnx,dcu-rd-ld-cache-plb-prio = <0>;
-			xlnx,dcu-rd-noncache-plb-prio = <0>;
-			xlnx,dcu-rd-touch-plb-prio = <0>;
-			xlnx,dcu-rd-urgent-plb-prio = <0>;
-			xlnx,dcu-wr-flush-plb-prio = <0>;
-			xlnx,dcu-wr-store-plb-prio = <0>;
-			xlnx,dcu-wr-urgent-plb-prio = <0>;
-			xlnx,dma0-control = <0>;
-			xlnx,dma0-plb-prio = <0>;
-			xlnx,dma0-rxchannelctrl = <0x1010000>;
-			xlnx,dma0-rxirqtimer = <0x3ff>;
-			xlnx,dma0-txchannelctrl = <0x1010000>;
-			xlnx,dma0-txirqtimer = <0x3ff>;
-			xlnx,dma1-control = <0>;
-			xlnx,dma1-plb-prio = <0>;
-			xlnx,dma1-rxchannelctrl = <0x1010000>;
-			xlnx,dma1-rxirqtimer = <0x3ff>;
-			xlnx,dma1-txchannelctrl = <0x1010000>;
-			xlnx,dma1-txirqtimer = <0x3ff>;
-			xlnx,dma2-control = <0>;
-			xlnx,dma2-plb-prio = <0>;
-			xlnx,dma2-rxchannelctrl = <0x1010000>;
-			xlnx,dma2-rxirqtimer = <0x3ff>;
-			xlnx,dma2-txchannelctrl = <0x1010000>;
-			xlnx,dma2-txirqtimer = <0x3ff>;
-			xlnx,dma3-control = <0>;
-			xlnx,dma3-plb-prio = <0>;
-			xlnx,dma3-rxchannelctrl = <0x1010000>;
-			xlnx,dma3-rxirqtimer = <0x3ff>;
-			xlnx,dma3-txchannelctrl = <0x1010000>;
-			xlnx,dma3-txirqtimer = <0x3ff>;
-			xlnx,endian-reset = <0>;
-			xlnx,generate-plb-timespecs = <1>;
-			xlnx,icu-rd-fetch-plb-prio = <0>;
-			xlnx,icu-rd-spec-plb-prio = <0>;
-			xlnx,icu-rd-touch-plb-prio = <0>;
-			xlnx,interconnect-imask = <0xffffffff>;
-			xlnx,mplb-allow-lock-xfer = <1>;
-			xlnx,mplb-arb-mode = <0>;
-			xlnx,mplb-awidth = <0x20>;
-			xlnx,mplb-counter = <0x500>;
-			xlnx,mplb-dwidth = <0x80>;
-			xlnx,mplb-max-burst = <8>;
-			xlnx,mplb-native-dwidth = <0x80>;
-			xlnx,mplb-p2p = <0>;
-			xlnx,mplb-prio-dcur = <2>;
-			xlnx,mplb-prio-dcuw = <3>;
-			xlnx,mplb-prio-icu = <4>;
-			xlnx,mplb-prio-splb0 = <1>;
-			xlnx,mplb-prio-splb1 = <0>;
-			xlnx,mplb-read-pipe-enable = <1>;
-			xlnx,mplb-sync-tattribute = <0>;
-			xlnx,mplb-wdog-enable = <1>;
-			xlnx,mplb-write-pipe-enable = <1>;
-			xlnx,mplb-write-post-enable = <1>;
-			xlnx,num-dma = <1>;
-			xlnx,pir = <0xf>;
-			xlnx,ppc440mc-addr-base = <0>;
-			xlnx,ppc440mc-addr-high = <0xfffffff>;
-			xlnx,ppc440mc-arb-mode = <0>;
-			xlnx,ppc440mc-bank-conflict-mask = <0xc00000>;
-			xlnx,ppc440mc-control = <0xf810008f>;
-			xlnx,ppc440mc-max-burst = <8>;
-			xlnx,ppc440mc-prio-dcur = <2>;
-			xlnx,ppc440mc-prio-dcuw = <3>;
-			xlnx,ppc440mc-prio-icu = <4>;
-			xlnx,ppc440mc-prio-splb0 = <1>;
-			xlnx,ppc440mc-prio-splb1 = <0>;
-			xlnx,ppc440mc-row-conflict-mask = <0x3ffe00>;
-			xlnx,ppcdm-asyncmode = <0>;
-			xlnx,ppcds-asyncmode = <0>;
-			xlnx,user-reset = <0>;
-			DMA0: sdma@80 {
-				compatible = "xlnx,ll-dma-1.00.a";
-				dcr-reg = < 0x80 0x11 >;
-				interrupt-parent = <&xps_intc_0>;
-				interrupts = < 10 2 11 2 >;
-			} ;
-		} ;
-	} ;
-	plb_v46_0: plb@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "xlnx,plb-v46-1.03.a", "simple-bus";
-		ranges ;
-		DIP_Switches_8Bit: gpio@81460000 {
-			compatible = "xlnx,xps-gpio-1.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 7 2 >;
-			reg = < 0x81460000 0x10000 >;
-			xlnx,all-inputs = <1>;
-			xlnx,all-inputs-2 = <0>;
-			xlnx,dout-default = <0>;
-			xlnx,dout-default-2 = <0>;
-			xlnx,family = "virtex5";
-			xlnx,gpio-width = <8>;
-			xlnx,interrupt-present = <1>;
-			xlnx,is-bidir = <1>;
-			xlnx,is-bidir-2 = <1>;
-			xlnx,is-dual = <0>;
-			xlnx,tri-default = <0xffffffff>;
-			xlnx,tri-default-2 = <0xffffffff>;
-		} ;
-		FLASH: flash@fc000000 {
-			bank-width = <2>;
-			compatible = "xlnx,xps-mch-emc-2.00.a", "cfi-flash";
-			reg = < 0xfc000000 0x2000000 >;
-			xlnx,family = "virtex5";
-			xlnx,include-datawidth-matching-0 = <0x1>;
-			xlnx,include-datawidth-matching-1 = <0x0>;
-			xlnx,include-datawidth-matching-2 = <0x0>;
-			xlnx,include-datawidth-matching-3 = <0x0>;
-			xlnx,include-negedge-ioregs = <0x0>;
-			xlnx,include-plb-ipif = <0x1>;
-			xlnx,include-wrbuf = <0x1>;
-			xlnx,max-mem-width = <0x10>;
-			xlnx,mch-native-dwidth = <0x20>;
-			xlnx,mch-plb-clk-period-ps = <0x2710>;
-			xlnx,mch-splb-awidth = <0x20>;
-			xlnx,mch0-accessbuf-depth = <0x10>;
-			xlnx,mch0-protocol = <0x0>;
-			xlnx,mch0-rddatabuf-depth = <0x10>;
-			xlnx,mch1-accessbuf-depth = <0x10>;
-			xlnx,mch1-protocol = <0x0>;
-			xlnx,mch1-rddatabuf-depth = <0x10>;
-			xlnx,mch2-accessbuf-depth = <0x10>;
-			xlnx,mch2-protocol = <0x0>;
-			xlnx,mch2-rddatabuf-depth = <0x10>;
-			xlnx,mch3-accessbuf-depth = <0x10>;
-			xlnx,mch3-protocol = <0x0>;
-			xlnx,mch3-rddatabuf-depth = <0x10>;
-			xlnx,mem0-width = <0x10>;
-			xlnx,mem1-width = <0x20>;
-			xlnx,mem2-width = <0x20>;
-			xlnx,mem3-width = <0x20>;
-			xlnx,num-banks-mem = <0x1>;
-			xlnx,num-channels = <0x2>;
-			xlnx,priority-mode = <0x0>;
-			xlnx,synch-mem-0 = <0x0>;
-			xlnx,synch-mem-1 = <0x0>;
-			xlnx,synch-mem-2 = <0x0>;
-			xlnx,synch-mem-3 = <0x0>;
-			xlnx,synch-pipedelay-0 = <0x2>;
-			xlnx,synch-pipedelay-1 = <0x2>;
-			xlnx,synch-pipedelay-2 = <0x2>;
-			xlnx,synch-pipedelay-3 = <0x2>;
-			xlnx,tavdv-ps-mem-0 = <0x1adb0>;
-			xlnx,tavdv-ps-mem-1 = <0x3a98>;
-			xlnx,tavdv-ps-mem-2 = <0x3a98>;
-			xlnx,tavdv-ps-mem-3 = <0x3a98>;
-			xlnx,tcedv-ps-mem-0 = <0x1adb0>;
-			xlnx,tcedv-ps-mem-1 = <0x3a98>;
-			xlnx,tcedv-ps-mem-2 = <0x3a98>;
-			xlnx,tcedv-ps-mem-3 = <0x3a98>;
-			xlnx,thzce-ps-mem-0 = <0x88b8>;
-			xlnx,thzce-ps-mem-1 = <0x1b58>;
-			xlnx,thzce-ps-mem-2 = <0x1b58>;
-			xlnx,thzce-ps-mem-3 = <0x1b58>;
-			xlnx,thzoe-ps-mem-0 = <0x1b58>;
-			xlnx,thzoe-ps-mem-1 = <0x1b58>;
-			xlnx,thzoe-ps-mem-2 = <0x1b58>;
-			xlnx,thzoe-ps-mem-3 = <0x1b58>;
-			xlnx,tlzwe-ps-mem-0 = <0x88b8>;
-			xlnx,tlzwe-ps-mem-1 = <0x0>;
-			xlnx,tlzwe-ps-mem-2 = <0x0>;
-			xlnx,tlzwe-ps-mem-3 = <0x0>;
-			xlnx,twc-ps-mem-0 = <0x2af8>;
-			xlnx,twc-ps-mem-1 = <0x3a98>;
-			xlnx,twc-ps-mem-2 = <0x3a98>;
-			xlnx,twc-ps-mem-3 = <0x3a98>;
-			xlnx,twp-ps-mem-0 = <0x11170>;
-			xlnx,twp-ps-mem-1 = <0x2ee0>;
-			xlnx,twp-ps-mem-2 = <0x2ee0>;
-			xlnx,twp-ps-mem-3 = <0x2ee0>;
-			xlnx,xcl0-linesize = <0x4>;
-			xlnx,xcl0-writexfer = <0x1>;
-			xlnx,xcl1-linesize = <0x4>;
-			xlnx,xcl1-writexfer = <0x1>;
-			xlnx,xcl2-linesize = <0x4>;
-			xlnx,xcl2-writexfer = <0x1>;
-			xlnx,xcl3-linesize = <0x4>;
-			xlnx,xcl3-writexfer = <0x1>;
-		} ;
-		Hard_Ethernet_MAC: xps-ll-temac@81c00000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "xlnx,compound";
-			ethernet@81c00000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "xlnx,xps-ll-temac-1.01.b";
-				device_type = "network";
-				interrupt-parent = <&xps_intc_0>;
-				interrupts = < 5 2 >;
-				llink-connected = <&DMA0>;
-				local-mac-address = [ 02 00 00 00 00 00 ];
-				reg = < 0x81c00000 0x40 >;
-				xlnx,bus2core-clk-ratio = <1>;
-				xlnx,phy-type = <1>;
-				xlnx,phyaddr = <1>;
-				xlnx,rxcsum = <1>;
-				xlnx,rxfifo = <0x1000>;
-				xlnx,temac-type = <0>;
-				xlnx,txcsum = <1>;
-				xlnx,txfifo = <0x1000>;
-                                phy-handle = <&phy7>;
-                                clock-frequency = <100000000>;
-                                phy7: phy@7 {
-                                          compatible = "marvell,88e1111";
-                                          reg = <7>;
-                                } ;
-			} ;
-		} ;
-		IIC_EEPROM: i2c@81600000 {
-			compatible = "xlnx,xps-iic-2.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 6 2 >;
-			reg = < 0x81600000 0x10000 >;
-			xlnx,clk-freq = <0x5f5e100>;
-			xlnx,family = "virtex5";
-			xlnx,gpo-width = <0x1>;
-			xlnx,iic-freq = <0x186a0>;
-			xlnx,scl-inertial-delay = <0x0>;
-			xlnx,sda-inertial-delay = <0x0>;
-			xlnx,ten-bit-adr = <0x0>;
-		} ;
-		LEDs_8Bit: gpio@81400000 {
-			compatible = "xlnx,xps-gpio-1.00.a";
-			reg = < 0x81400000 0x10000 >;
-			xlnx,all-inputs = <0>;
-			xlnx,all-inputs-2 = <0>;
-			xlnx,dout-default = <0>;
-			xlnx,dout-default-2 = <0>;
-			xlnx,family = "virtex5";
-			xlnx,gpio-width = <8>;
-			xlnx,interrupt-present = <0>;
-			xlnx,is-bidir = <1>;
-			xlnx,is-bidir-2 = <1>;
-			xlnx,is-dual = <0>;
-			xlnx,tri-default = <0xffffffff>;
-			xlnx,tri-default-2 = <0xffffffff>;
-		} ;
-		LEDs_Positions: gpio@81420000 {
-			compatible = "xlnx,xps-gpio-1.00.a";
-			reg = < 0x81420000 0x10000 >;
-			xlnx,all-inputs = <0>;
-			xlnx,all-inputs-2 = <0>;
-			xlnx,dout-default = <0>;
-			xlnx,dout-default-2 = <0>;
-			xlnx,family = "virtex5";
-			xlnx,gpio-width = <5>;
-			xlnx,interrupt-present = <0>;
-			xlnx,is-bidir = <1>;
-			xlnx,is-bidir-2 = <1>;
-			xlnx,is-dual = <0>;
-			xlnx,tri-default = <0xffffffff>;
-			xlnx,tri-default-2 = <0xffffffff>;
-		} ;
-		Push_Buttons_5Bit: gpio@81440000 {
-			compatible = "xlnx,xps-gpio-1.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 8 2 >;
-			reg = < 0x81440000 0x10000 >;
-			xlnx,all-inputs = <1>;
-			xlnx,all-inputs-2 = <0>;
-			xlnx,dout-default = <0>;
-			xlnx,dout-default-2 = <0>;
-			xlnx,family = "virtex5";
-			xlnx,gpio-width = <5>;
-			xlnx,interrupt-present = <1>;
-			xlnx,is-bidir = <1>;
-			xlnx,is-bidir-2 = <1>;
-			xlnx,is-dual = <0>;
-			xlnx,tri-default = <0xffffffff>;
-			xlnx,tri-default-2 = <0xffffffff>;
-		} ;
-		RS232_Uart_1: serial@83e00000 {
-			clock-frequency = <100000000>;
-			compatible = "xlnx,xps-uart16550-2.00.b", "ns16550";
-			current-speed = <9600>;
-			device_type = "serial";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 9 2 >;
-			reg = < 0x83e00000 0x10000 >;
-			reg-offset = <0x1003>;
-			reg-shift = <2>;
-			xlnx,family = "virtex5";
-			xlnx,has-external-rclk = <0>;
-			xlnx,has-external-xin = <0>;
-			xlnx,is-a-16550 = <1>;
-		} ;
-		SysACE_CompactFlash: sysace@83600000 {
-			compatible = "xlnx,xps-sysace-1.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 4 2 >;
-			reg = < 0x83600000 0x10000 >;
-			xlnx,family = "virtex5";
-			xlnx,mem-width = <0x10>;
-		} ;
-		xps_bram_if_cntlr_1: xps-bram-if-cntlr@ffff0000 {
-			compatible = "xlnx,xps-bram-if-cntlr-1.00.a";
-			reg = < 0xffff0000 0x10000 >;
-			xlnx,family = "virtex5";
-		} ;
-		xps_intc_0: interrupt-controller@81800000 {
-			#interrupt-cells = <2>;
-			compatible = "xlnx,xps-intc-1.00.a";
-			interrupt-controller ;
-			reg = < 0x81800000 0x10000 >;
-			xlnx,num-intr-inputs = <0xc>;
-		} ;
-		xps_timebase_wdt_1: xps-timebase-wdt@83a00000 {
-			compatible = "xlnx,xps-timebase-wdt-1.00.b";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 2 0 1 2 >;
-			reg = < 0x83a00000 0x10000 >;
-			xlnx,family = "virtex5";
-			xlnx,wdt-enable-once = <0>;
-			xlnx,wdt-interval = <0x1e>;
-		} ;
-		xps_timer_1: timer@83c00000 {
-			compatible = "xlnx,xps-timer-1.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 3 2 >;
-			reg = < 0x83c00000 0x10000 >;
-			xlnx,count-width = <0x20>;
-			xlnx,family = "virtex5";
-			xlnx,gen0-assert = <1>;
-			xlnx,gen1-assert = <1>;
-			xlnx,one-timer-only = <1>;
-			xlnx,trig0-assert = <1>;
-			xlnx,trig1-assert = <1>;
-		} ;
-	} ;
-}  ;
diff --git a/arch/powerpc/boot/dts/virtex440-ml510.dts b/arch/powerpc/boot/dts/virtex440-ml510.dts
deleted file mode 100644
index 3b736ca26ddc..000000000000
--- a/arch/powerpc/boot/dts/virtex440-ml510.dts
+++ /dev/null
@@ -1,466 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Xilinx ML510 Reference Design support
- *
- * This DTS file was created for the ml510_bsb1_pcores_ppc440 reference design.
- * The reference design contains a bug which prevent PCI DMA from working
- * properly.  A description of the bug is given in the plbv46_pci section. It
- * needs to be fixed by the user until Xilinx updates their reference design.
- *
- * Copyright 2009, Roderick Colenbrander
- */
-
-/dts-v1/;
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "xlnx,ml510-ref-design", "xlnx,virtex440";
-	dcr-parent = <&ppc440_0>;
-	DDR2_SDRAM_DIMM0: memory@0 {
-		device_type = "memory";
-		reg = < 0x0 0x20000000 >;
-	} ;
-	alias {
-		ethernet0 = &Hard_Ethernet_MAC;
-		serial0 = &RS232_Uart_1;
-	} ;
-	chosen {
-		bootargs = "console=ttyS0 root=/dev/ram";
-		stdout-path = "/plb@0/serial@83e00000";
-	} ;
-	cpus {
-		#address-cells = <1>;
-		#cpus = <0x1>;
-		#size-cells = <0>;
-		ppc440_0: cpu@0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			clock-frequency = <300000000>;
-			compatible = "PowerPC,440", "ibm,ppc440";
-			d-cache-line-size = <0x20>;
-			d-cache-size = <0x8000>;
-			dcr-access-method = "native";
-			dcr-controller ;
-			device_type = "cpu";
-			i-cache-line-size = <0x20>;
-			i-cache-size = <0x8000>;
-			model = "PowerPC,440";
-			reg = <0>;
-			timebase-frequency = <300000000>;
-			xlnx,apu-control = <0x2000>;
-			xlnx,apu-udi-0 = <0x0>;
-			xlnx,apu-udi-1 = <0x0>;
-			xlnx,apu-udi-10 = <0x0>;
-			xlnx,apu-udi-11 = <0x0>;
-			xlnx,apu-udi-12 = <0x0>;
-			xlnx,apu-udi-13 = <0x0>;
-			xlnx,apu-udi-14 = <0x0>;
-			xlnx,apu-udi-15 = <0x0>;
-			xlnx,apu-udi-2 = <0x0>;
-			xlnx,apu-udi-3 = <0x0>;
-			xlnx,apu-udi-4 = <0x0>;
-			xlnx,apu-udi-5 = <0x0>;
-			xlnx,apu-udi-6 = <0x0>;
-			xlnx,apu-udi-7 = <0x0>;
-			xlnx,apu-udi-8 = <0x0>;
-			xlnx,apu-udi-9 = <0x0>;
-			xlnx,dcr-autolock-enable = <0x1>;
-			xlnx,dcu-rd-ld-cache-plb-prio = <0x0>;
-			xlnx,dcu-rd-noncache-plb-prio = <0x0>;
-			xlnx,dcu-rd-touch-plb-prio = <0x0>;
-			xlnx,dcu-rd-urgent-plb-prio = <0x0>;
-			xlnx,dcu-wr-flush-plb-prio = <0x0>;
-			xlnx,dcu-wr-store-plb-prio = <0x0>;
-			xlnx,dcu-wr-urgent-plb-prio = <0x0>;
-			xlnx,dma0-control = <0x0>;
-			xlnx,dma0-plb-prio = <0x0>;
-			xlnx,dma0-rxchannelctrl = <0x1010000>;
-			xlnx,dma0-rxirqtimer = <0x3ff>;
-			xlnx,dma0-txchannelctrl = <0x1010000>;
-			xlnx,dma0-txirqtimer = <0x3ff>;
-			xlnx,dma1-control = <0x0>;
-			xlnx,dma1-plb-prio = <0x0>;
-			xlnx,dma1-rxchannelctrl = <0x1010000>;
-			xlnx,dma1-rxirqtimer = <0x3ff>;
-			xlnx,dma1-txchannelctrl = <0x1010000>;
-			xlnx,dma1-txirqtimer = <0x3ff>;
-			xlnx,dma2-control = <0x0>;
-			xlnx,dma2-plb-prio = <0x0>;
-			xlnx,dma2-rxchannelctrl = <0x1010000>;
-			xlnx,dma2-rxirqtimer = <0x3ff>;
-			xlnx,dma2-txchannelctrl = <0x1010000>;
-			xlnx,dma2-txirqtimer = <0x3ff>;
-			xlnx,dma3-control = <0x0>;
-			xlnx,dma3-plb-prio = <0x0>;
-			xlnx,dma3-rxchannelctrl = <0x1010000>;
-			xlnx,dma3-rxirqtimer = <0x3ff>;
-			xlnx,dma3-txchannelctrl = <0x1010000>;
-			xlnx,dma3-txirqtimer = <0x3ff>;
-			xlnx,endian-reset = <0x0>;
-			xlnx,generate-plb-timespecs = <0x1>;
-			xlnx,icu-rd-fetch-plb-prio = <0x0>;
-			xlnx,icu-rd-spec-plb-prio = <0x0>;
-			xlnx,icu-rd-touch-plb-prio = <0x0>;
-			xlnx,interconnect-imask = <0xffffffff>;
-			xlnx,mplb-allow-lock-xfer = <0x1>;
-			xlnx,mplb-arb-mode = <0x0>;
-			xlnx,mplb-awidth = <0x20>;
-			xlnx,mplb-counter = <0x500>;
-			xlnx,mplb-dwidth = <0x80>;
-			xlnx,mplb-max-burst = <0x8>;
-			xlnx,mplb-native-dwidth = <0x80>;
-			xlnx,mplb-p2p = <0x0>;
-			xlnx,mplb-prio-dcur = <0x2>;
-			xlnx,mplb-prio-dcuw = <0x3>;
-			xlnx,mplb-prio-icu = <0x4>;
-			xlnx,mplb-prio-splb0 = <0x1>;
-			xlnx,mplb-prio-splb1 = <0x0>;
-			xlnx,mplb-read-pipe-enable = <0x1>;
-			xlnx,mplb-sync-tattribute = <0x0>;
-			xlnx,mplb-wdog-enable = <0x1>;
-			xlnx,mplb-write-pipe-enable = <0x1>;
-			xlnx,mplb-write-post-enable = <0x1>;
-			xlnx,num-dma = <0x0>;
-			xlnx,pir = <0xf>;
-			xlnx,ppc440mc-addr-base = <0x0>;
-			xlnx,ppc440mc-addr-high = <0x1fffffff>;
-			xlnx,ppc440mc-arb-mode = <0x0>;
-			xlnx,ppc440mc-bank-conflict-mask = <0x1800000>;
-			xlnx,ppc440mc-control = <0xf810008f>;
-			xlnx,ppc440mc-max-burst = <0x8>;
-			xlnx,ppc440mc-prio-dcur = <0x2>;
-			xlnx,ppc440mc-prio-dcuw = <0x3>;
-			xlnx,ppc440mc-prio-icu = <0x4>;
-			xlnx,ppc440mc-prio-splb0 = <0x1>;
-			xlnx,ppc440mc-prio-splb1 = <0x0>;
-			xlnx,ppc440mc-row-conflict-mask = <0x7ffe00>;
-			xlnx,ppcdm-asyncmode = <0x0>;
-			xlnx,ppcds-asyncmode = <0x0>;
-			xlnx,user-reset = <0x0>;
-		} ;
-	} ;
-	plb_v46_0: plb@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "xlnx,plb-v46-1.03.a", "simple-bus";
-		ranges ;
-		FLASH: flash@fc000000 {
-			bank-width = <2>;
-			compatible = "xlnx,xps-mch-emc-2.00.a", "cfi-flash";
-			reg = < 0xfc000000 0x2000000 >;
-			xlnx,family = "virtex5";
-			xlnx,include-datawidth-matching-0 = <0x1>;
-			xlnx,include-datawidth-matching-1 = <0x0>;
-			xlnx,include-datawidth-matching-2 = <0x0>;
-			xlnx,include-datawidth-matching-3 = <0x0>;
-			xlnx,include-negedge-ioregs = <0x0>;
-			xlnx,include-plb-ipif = <0x1>;
-			xlnx,include-wrbuf = <0x1>;
-			xlnx,max-mem-width = <0x10>;
-			xlnx,mch-native-dwidth = <0x20>;
-			xlnx,mch-plb-clk-period-ps = <0x2710>;
-			xlnx,mch-splb-awidth = <0x20>;
-			xlnx,mch0-accessbuf-depth = <0x10>;
-			xlnx,mch0-protocol = <0x0>;
-			xlnx,mch0-rddatabuf-depth = <0x10>;
-			xlnx,mch1-accessbuf-depth = <0x10>;
-			xlnx,mch1-protocol = <0x0>;
-			xlnx,mch1-rddatabuf-depth = <0x10>;
-			xlnx,mch2-accessbuf-depth = <0x10>;
-			xlnx,mch2-protocol = <0x0>;
-			xlnx,mch2-rddatabuf-depth = <0x10>;
-			xlnx,mch3-accessbuf-depth = <0x10>;
-			xlnx,mch3-protocol = <0x0>;
-			xlnx,mch3-rddatabuf-depth = <0x10>;
-			xlnx,mem0-width = <0x10>;
-			xlnx,mem1-width = <0x20>;
-			xlnx,mem2-width = <0x20>;
-			xlnx,mem3-width = <0x20>;
-			xlnx,num-banks-mem = <0x1>;
-			xlnx,num-channels = <0x2>;
-			xlnx,priority-mode = <0x0>;
-			xlnx,synch-mem-0 = <0x0>;
-			xlnx,synch-mem-1 = <0x0>;
-			xlnx,synch-mem-2 = <0x0>;
-			xlnx,synch-mem-3 = <0x0>;
-			xlnx,synch-pipedelay-0 = <0x2>;
-			xlnx,synch-pipedelay-1 = <0x2>;
-			xlnx,synch-pipedelay-2 = <0x2>;
-			xlnx,synch-pipedelay-3 = <0x2>;
-			xlnx,tavdv-ps-mem-0 = <0x1adb0>;
-			xlnx,tavdv-ps-mem-1 = <0x3a98>;
-			xlnx,tavdv-ps-mem-2 = <0x3a98>;
-			xlnx,tavdv-ps-mem-3 = <0x3a98>;
-			xlnx,tcedv-ps-mem-0 = <0x1adb0>;
-			xlnx,tcedv-ps-mem-1 = <0x3a98>;
-			xlnx,tcedv-ps-mem-2 = <0x3a98>;
-			xlnx,tcedv-ps-mem-3 = <0x3a98>;
-			xlnx,thzce-ps-mem-0 = <0x88b8>;
-			xlnx,thzce-ps-mem-1 = <0x1b58>;
-			xlnx,thzce-ps-mem-2 = <0x1b58>;
-			xlnx,thzce-ps-mem-3 = <0x1b58>;
-			xlnx,thzoe-ps-mem-0 = <0x1b58>;
-			xlnx,thzoe-ps-mem-1 = <0x1b58>;
-			xlnx,thzoe-ps-mem-2 = <0x1b58>;
-			xlnx,thzoe-ps-mem-3 = <0x1b58>;
-			xlnx,tlzwe-ps-mem-0 = <0x88b8>;
-			xlnx,tlzwe-ps-mem-1 = <0x0>;
-			xlnx,tlzwe-ps-mem-2 = <0x0>;
-			xlnx,tlzwe-ps-mem-3 = <0x0>;
-			xlnx,twc-ps-mem-0 = <0x1adb0>;
-			xlnx,twc-ps-mem-1 = <0x3a98>;
-			xlnx,twc-ps-mem-2 = <0x3a98>;
-			xlnx,twc-ps-mem-3 = <0x3a98>;
-			xlnx,twp-ps-mem-0 = <0x11170>;
-			xlnx,twp-ps-mem-1 = <0x2ee0>;
-			xlnx,twp-ps-mem-2 = <0x2ee0>;
-			xlnx,twp-ps-mem-3 = <0x2ee0>;
-			xlnx,xcl0-linesize = <0x4>;
-			xlnx,xcl0-writexfer = <0x1>;
-			xlnx,xcl1-linesize = <0x4>;
-			xlnx,xcl1-writexfer = <0x1>;
-			xlnx,xcl2-linesize = <0x4>;
-			xlnx,xcl2-writexfer = <0x1>;
-			xlnx,xcl3-linesize = <0x4>;
-			xlnx,xcl3-writexfer = <0x1>;
-		} ;
-		Hard_Ethernet_MAC: xps-ll-temac@81c00000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "xlnx,compound";
-			ethernet@81c00000 {
-				compatible = "xlnx,xps-ll-temac-1.01.b";
-				device_type = "network";
-				interrupt-parent = <&xps_intc_0>;
-				interrupts = < 8 2 >;
-				llink-connected = <&Hard_Ethernet_MAC_fifo>;
-				local-mac-address = [ 02 00 00 00 00 00 ];
-				reg = < 0x81c00000 0x40 >;
-				xlnx,bus2core-clk-ratio = <0x1>;
-				xlnx,phy-type = <0x3>;
-				xlnx,phyaddr = <0x1>;
-				xlnx,rxcsum = <0x0>;
-				xlnx,rxfifo = <0x8000>;
-				xlnx,temac-type = <0x0>;
-				xlnx,txcsum = <0x0>;
-				xlnx,txfifo = <0x8000>;
-			} ;
-		} ;
-		Hard_Ethernet_MAC_fifo: xps-ll-fifo@81a00000 {
-			compatible = "xlnx,xps-ll-fifo-1.01.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 6 2 >;
-			reg = < 0x81a00000 0x10000 >;
-			xlnx,family = "virtex5";
-		} ;
-		IIC_EEPROM: i2c@81600000 {
-			compatible = "xlnx,xps-iic-2.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 9 2 >;
-			reg = < 0x81600000 0x10000 >;
-			xlnx,clk-freq = <0x5f5e100>;
-			xlnx,family = "virtex5";
-			xlnx,gpo-width = <0x1>;
-			xlnx,iic-freq = <0x186a0>;
-			xlnx,scl-inertial-delay = <0x5>;
-			xlnx,sda-inertial-delay = <0x5>;
-			xlnx,ten-bit-adr = <0x0>;
-		} ;
-		LCD_OPTIONAL: gpio@81420000 {
-			compatible = "xlnx,xps-gpio-1.00.a";
-			reg = < 0x81420000 0x10000 >;
-			xlnx,all-inputs = <0x0>;
-			xlnx,all-inputs-2 = <0x0>;
-			xlnx,dout-default = <0x0>;
-			xlnx,dout-default-2 = <0x0>;
-			xlnx,family = "virtex5";
-			xlnx,gpio-width = <0xb>;
-			xlnx,interrupt-present = <0x0>;
-			xlnx,is-bidir = <0x1>;
-			xlnx,is-bidir-2 = <0x1>;
-			xlnx,is-dual = <0x0>;
-			xlnx,tri-default = <0xffffffff>;
-			xlnx,tri-default-2 = <0xffffffff>;
-		} ;
-		LEDs_4Bit: gpio@81400000 {
-			compatible = "xlnx,xps-gpio-1.00.a";
-			reg = < 0x81400000 0x10000 >;
-			xlnx,all-inputs = <0x0>;
-			xlnx,all-inputs-2 = <0x0>;
-			xlnx,dout-default = <0x0>;
-			xlnx,dout-default-2 = <0x0>;
-			xlnx,family = "virtex5";
-			xlnx,gpio-width = <0x4>;
-			xlnx,interrupt-present = <0x0>;
-			xlnx,is-bidir = <0x1>;
-			xlnx,is-bidir-2 = <0x1>;
-			xlnx,is-dual = <0x0>;
-			xlnx,tri-default = <0xffffffff>;
-			xlnx,tri-default-2 = <0xffffffff>;
-		} ;
-		RS232_Uart_1: serial@83e00000 {
-			clock-frequency = <100000000>;
-			compatible = "xlnx,xps-uart16550-2.00.b", "ns16550";
-			current-speed = <9600>;
-			device_type = "serial";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 11 2 >;
-			reg = < 0x83e00000 0x10000 >;
-			reg-offset = <0x1003>;
-			reg-shift = <2>;
-			xlnx,family = "virtex5";
-			xlnx,has-external-rclk = <0x0>;
-			xlnx,has-external-xin = <0x0>;
-			xlnx,is-a-16550 = <0x1>;
-		} ;
-		SPI_EEPROM: xps-spi@feff8000 {
-			compatible = "xlnx,xps-spi-2.00.b";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 10 2 >;
-			reg = < 0xfeff8000 0x80 >;
-			xlnx,family = "virtex5";
-			xlnx,fifo-exist = <0x1>;
-			xlnx,num-ss-bits = <0x1>;
-			xlnx,num-transfer-bits = <0x8>;
-			xlnx,sck-ratio = <0x80>;
-		} ;
-		SysACE_CompactFlash: sysace@83600000 {
-			compatible = "xlnx,xps-sysace-1.00.a";
-			interrupt-parent = <&xps_intc_0>;
-			interrupts = < 7 2 >;
-			reg = < 0x83600000 0x10000 >;
-			xlnx,family = "virtex5";
-			xlnx,mem-width = <0x10>;
-		} ;
-		plbv46_pci_0: plbv46-pci@85e00000 {
-			#size-cells = <2>;
-			#address-cells = <3>;
-			compatible = "xlnx,plbv46-pci-1.03.a";
-			device_type = "pci";
-			reg = < 0x85e00000 0x10000 >;
-
-			/*
-			 * The default ML510 BSB has C_IPIFBAR2PCIBAR_0 set to
-			 * 0 which means that a read/write to the memory mapped
-			 * i/o region (which starts at 0xa0000000) for pci
-			 * bar 0 on the plb side translates to 0.
-			 * It is important to set this value to 0xa0000000, so
-			 * that inbound and outbound pci transactions work
-			 * properly including DMA.
-			 */
-			ranges = <0x02000000 0 0xa0000000 0xa0000000 0 0x20000000
-				  0x01000000 0 0x00000000 0xf0000000 0 0x00010000>;
-
-			#interrupt-cells = <1>;
-			interrupt-parent = <&xps_intc_0>;
-			interrupt-map-mask = <0xff00 0x0 0x0 0x7>;
-			interrupt-map = <
-				/* IRQ mapping for pci slots and ALI M1533
-				 * periperhals. In total there are 5 interrupt
-				 * lines connected to a xps_intc controller.
-				 * Four of them are PCI IRQ A, B, C, D and
-				 * which correspond to respectively xpx_intc
-				 * 5, 4, 3 and 2.  The fifth interrupt line is
-				 * connected to the south bridge and this one
-				 * uses irq 1 and is active high instead of
-				 * active low.
-				 *
-				 * The M1533 contains various peripherals
-				 * including AC97 audio, a modem, USB, IDE and
-				 * some power management stuff. The modem
-				 * isn't connected on the ML510 and the power
-				 * management core also isn't used.
-				 */
-
-				/* IDSEL 0x16 / dev=6, bus=0 / PCI slot 3 */
-				0x3000 0 0 1 &xps_intc_0 3 2
-				0x3000 0 0 2 &xps_intc_0 2 2
-				0x3000 0 0 3 &xps_intc_0 5 2
-				0x3000 0 0 4 &xps_intc_0 4 2
-
-				/* IDSEL 0x13 / dev=3, bus=1 / PCI slot 4 */
-				/*
-				0x11800 0 0 1 &xps_intc_0 5 0 2
-				0x11800 0 0 2 &xps_intc_0 4 0 2
-				0x11800 0 0 3 &xps_intc_0 3 0 2
-				0x11800 0 0 4 &xps_intc_0 2 0 2
-				*/
-
-				/* According to the datasheet + schematic
-				 * ABCD [FPGA] of slot 5 is mapped to DABC.
-				 * Testing showed that at least A maps to B,
-				 * the mapping of the other pins is a guess
-				 * and for that reason the lines have been
-				 * commented out.
-				 */
-				/* IDSEL 0x15 / dev=5, bus=0 / PCI slot 5 */
-				0x2800 0 0 1 &xps_intc_0 4 2
-				/*
-				0x2800 0 0 2 &xps_intc_0 3 2
-				0x2800 0 0 3 &xps_intc_0 2 2
-				0x2800 0 0 4 &xps_intc_0 5 2
-				*/
-
-				/* IDSEL 0x12 / dev=2, bus=1 / PCI slot 6 */
-				/*
-				0x11000 0 0 1 &xps_intc_0 4 0 2
-				0x11000 0 0 2 &xps_intc_0 3 0 2
-				0x11000 0 0 3 &xps_intc_0 2 0 2
-				0x11000 0 0 4 &xps_intc_0 5 0 2
-				*/
-
-				/* IDSEL 0x11 / dev=1, bus=0 / AC97 audio */
-				0x0800 0 0 1 &i8259 7 2
-
-				/* IDSEL 0x1b / dev=11, bus=0 / IDE */
-				0x5800 0 0 1 &i8259 14 2
-
-				/* IDSEL 0x1f / dev 15, bus=0 / 2x USB 1.1 */
-				0x7800 0 0 1 &i8259 7 2
-			>;
-			ali_m1533 {
-				#size-cells = <1>;
-				#address-cells = <2>;
-				i8259: interrupt-controller@20 {
-					reg = <1 0x20 2
-							1 0xa0 2
-							1 0x4d0 2>;
-					interrupt-controller;
-					device_type = "interrupt-controller";
-					#address-cells = <0>;
-					#interrupt-cells = <2>;
-					compatible = "chrp,iic";
-
-					/* south bridge irq is active high */
-					interrupts = <1 3>;
-					interrupt-parent = <&xps_intc_0>;
-				};
-			};
-		} ;
-		xps_bram_if_cntlr_1: xps-bram-if-cntlr@ffff0000 {
-			compatible = "xlnx,xps-bram-if-cntlr-1.00.a";
-			reg = < 0xffff0000 0x10000 >;
-			xlnx,family = "virtex5";
-		} ;
-		xps_intc_0: interrupt-controller@81800000 {
-			#interrupt-cells = <0x2>;
-			compatible = "xlnx,xps-intc-1.00.a";
-			interrupt-controller ;
-			reg = < 0x81800000 0x10000 >;
-			xlnx,num-intr-inputs = <0xc>;
-		} ;
-		xps_tft_0: tft@86e00000 {
-			compatible = "xlnx,xps-tft-1.00.a";
-			reg = < 0x86e00000 0x10000 >;
-			xlnx,dcr-splb-slave-if = <0x1>;
-			xlnx,default-tft-base-addr = <0x0>;
-			xlnx,family = "virtex5";
-			xlnx,i2c-slave-addr = <0x76>;
-			xlnx,mplb-awidth = <0x20>;
-			xlnx,mplb-dwidth = <0x80>;
-			xlnx,mplb-native-dwidth = <0x40>;
-			xlnx,mplb-smallest-slave = <0x20>;
-			xlnx,tft-interface = <0x1>;
-		} ;
-	} ;
-}  ;
diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
index e0606766480f..6455fc9a244f 100644
--- a/arch/powerpc/boot/ops.h
+++ b/arch/powerpc/boot/ops.h
@@ -88,7 +88,6 @@ int serial_console_init(void);
 int ns16550_console_init(void *devp, struct serial_console_data *scdp);
 int cpm_console_init(void *devp, struct serial_console_data *scdp);
 int mpc5200_psc_console_init(void *devp, struct serial_console_data *scdp);
-int uartlite_console_init(void *devp, struct serial_console_data *scdp);
 int opal_console_init(void *devp, struct serial_console_data *scdp);
 void *simple_alloc_init(char *base, unsigned long heap_size,
 			unsigned long granularity, unsigned long max_allocs);
diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
index 9457863147f9..0bfa7e87e546 100644
--- a/arch/powerpc/boot/serial.c
+++ b/arch/powerpc/boot/serial.c
@@ -132,11 +132,6 @@ int serial_console_init(void)
 	else if (dt_is_compatible(devp, "fsl,mpc5200-psc-uart"))
 		rc = mpc5200_psc_console_init(devp, &serial_cd);
 #endif
-#ifdef CONFIG_XILINX_VIRTEX
-	else if (dt_is_compatible(devp, "xlnx,opb-uartlite-1.00.b") ||
-		 dt_is_compatible(devp, "xlnx,xps-uartlite-1.00.a"))
-		rc = uartlite_console_init(devp, &serial_cd);
-#endif
 #ifdef CONFIG_PPC64_BOOT_WRAPPER
 	else if (dt_is_compatible(devp, "ibm,opal-console-raw"))
 		rc = opal_console_init(devp, &serial_cd);
diff --git a/arch/powerpc/boot/uartlite.c b/arch/powerpc/boot/uartlite.c
deleted file mode 100644
index 46bed69b4169..000000000000
--- a/arch/powerpc/boot/uartlite.c
+++ /dev/null
@@ -1,79 +0,0 @@
-/*
- * Xilinx UARTLITE bootloader driver
- *
- * Copyright (C) 2007 Secret Lab Technologies Ltd.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#include <stdarg.h>
-#include <stddef.h>
-#include "types.h"
-#include "string.h"
-#include "stdio.h"
-#include "io.h"
-#include "ops.h"
-
-#define ULITE_RX		0x00
-#define ULITE_TX		0x04
-#define ULITE_STATUS		0x08
-#define ULITE_CONTROL		0x0c
-
-#define ULITE_STATUS_RXVALID	0x01
-#define ULITE_STATUS_TXFULL	0x08
-
-#define ULITE_CONTROL_RST_RX	0x02
-
-static void * reg_base;
-
-static int uartlite_open(void)
-{
-	/* Clear the RX FIFO */
-	out_be32(reg_base + ULITE_CONTROL, ULITE_CONTROL_RST_RX);
-	return 0;
-}
-
-static void uartlite_putc(unsigned char c)
-{
-	u32 reg = ULITE_STATUS_TXFULL;
-	while (reg & ULITE_STATUS_TXFULL) /* spin on TXFULL bit */
-		reg = in_be32(reg_base + ULITE_STATUS);
-	out_be32(reg_base + ULITE_TX, c);
-}
-
-static unsigned char uartlite_getc(void)
-{
-	u32 reg = 0;
-	while (!(reg & ULITE_STATUS_RXVALID)) /* spin waiting for RXVALID bit */
-		reg = in_be32(reg_base + ULITE_STATUS);
-	return in_be32(reg_base + ULITE_RX);
-}
-
-static u8 uartlite_tstc(void)
-{
-	u32 reg = in_be32(reg_base + ULITE_STATUS);
-	return reg & ULITE_STATUS_RXVALID;
-}
-
-int uartlite_console_init(void *devp, struct serial_console_data *scdp)
-{
-	int n;
-	unsigned long reg_phys;
-
-	n = getprop(devp, "virtual-reg", &reg_base, sizeof(reg_base));
-	if (n != sizeof(reg_base)) {
-		if (!dt_xlate_reg(devp, 0, &reg_phys, NULL))
-			return -1;
-
-		reg_base = (void *)reg_phys;
-	}
-
-	scdp->open = uartlite_open;
-	scdp->putc = uartlite_putc;
-	scdp->getc = uartlite_getc;
-	scdp->tstc = uartlite_tstc;
-	scdp->close = NULL;
-	return 0;
-}
diff --git a/arch/powerpc/boot/virtex.c b/arch/powerpc/boot/virtex.c
deleted file mode 100644
index f731cbb4bff0..000000000000
--- a/arch/powerpc/boot/virtex.c
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * The platform specific code for virtex devices since a boot loader is not
- * always used.
- *
- * (C) Copyright 2008 Xilinx, Inc.
- */
-
-#include "ops.h"
-#include "io.h"
-#include "stdio.h"
-
-#define UART_DLL		0	/* Out: Divisor Latch Low */
-#define UART_DLM		1	/* Out: Divisor Latch High */
-#define UART_FCR		2	/* Out: FIFO Control Register */
-#define UART_FCR_CLEAR_RCVR 	0x02 	/* Clear the RCVR FIFO */
-#define UART_FCR_CLEAR_XMIT	0x04 	/* Clear the XMIT FIFO */
-#define UART_LCR		3	/* Out: Line Control Register */
-#define UART_MCR		4	/* Out: Modem Control Register */
-#define UART_MCR_RTS		0x02 	/* RTS complement */
-#define UART_MCR_DTR		0x01 	/* DTR complement */
-#define UART_LCR_DLAB		0x80 	/* Divisor latch access bit */
-#define UART_LCR_WLEN8		0x03 	/* Wordlength: 8 bits */
-
-static int virtex_ns16550_console_init(void *devp)
-{
-	unsigned char *reg_base;
-	u32 reg_shift, reg_offset, clk, spd;
-	u16 divisor;
-	int n;
-
-	if (dt_get_virtual_reg(devp, (void **)&reg_base, 1) < 1)
-		return -1;
-
-	n = getprop(devp, "reg-offset", &reg_offset, sizeof(reg_offset));
-	if (n == sizeof(reg_offset))
-		reg_base += reg_offset;
-
-	n = getprop(devp, "reg-shift", &reg_shift, sizeof(reg_shift));
-	if (n != sizeof(reg_shift))
-		reg_shift = 0;
-
-	n = getprop(devp, "current-speed", (void *)&spd, sizeof(spd));
-	if (n != sizeof(spd))
-		spd = 9600;
-
-	/* should there be a default clock rate?*/
-	n = getprop(devp, "clock-frequency", (void *)&clk, sizeof(clk));
-	if (n != sizeof(clk))
-		return -1;
-
-	divisor = clk / (16 * spd);
-
-	/* Access baud rate */
-	out_8(reg_base + (UART_LCR << reg_shift), UART_LCR_DLAB);
-
-	/* Baud rate based on input clock */
-	out_8(reg_base + (UART_DLL << reg_shift), divisor & 0xFF);
-	out_8(reg_base + (UART_DLM << reg_shift), divisor >> 8);
-
-	/* 8 data, 1 stop, no parity */
-	out_8(reg_base + (UART_LCR << reg_shift), UART_LCR_WLEN8);
-
-	/* RTS/DTR */
-	out_8(reg_base + (UART_MCR << reg_shift), UART_MCR_RTS | UART_MCR_DTR);
-
-	/* Clear transmitter and receiver */
-	out_8(reg_base + (UART_FCR << reg_shift),
-				UART_FCR_CLEAR_XMIT | UART_FCR_CLEAR_RCVR);
-	return 0;
-}
-
-/* For virtex, the kernel may be loaded without using a bootloader and if so
-   some UARTs need more setup than is provided in the normal console init
-*/
-int platform_specific_init(void)
-{
-	void *devp;
-	char devtype[MAX_PROP_LEN];
-	char path[MAX_PATH_LEN];
-
-	devp = finddevice("/chosen");
-	if (devp == NULL)
-		return -1;
-
-	if (getprop(devp, "linux,stdout-path", path, MAX_PATH_LEN) > 0) {
-		devp = finddevice(path);
-		if (devp == NULL)
-			return -1;
-
-		if ((getprop(devp, "device_type", devtype, sizeof(devtype)) > 0)
-				&& !strcmp(devtype, "serial")
-				&& (dt_is_compatible(devp, "ns16550")))
-				virtex_ns16550_console_init(devp);
-	}
-	return 0;
-}
diff --git a/arch/powerpc/boot/virtex405-head.S b/arch/powerpc/boot/virtex405-head.S
deleted file mode 100644
index 00bab7d7c48c..000000000000
--- a/arch/powerpc/boot/virtex405-head.S
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include "ppc_asm.h"
-
-	.text
-	.global _zimage_start
-_zimage_start:
-
-	/* PPC errata 213: needed by Virtex-4 FX */
-	mfccr0  0
-	oris    0,0,0x50000000@h
-	mtccr0  0
-
-	/*
-	 * Invalidate the data cache if the data cache is turned off.
-	 * - The 405 core does not invalidate the data cache on power-up
-	 *   or reset but does turn off the data cache. We cannot assume
-	 *   that the cache contents are valid.
-	 * - If the data cache is turned on this must have been done by
-	 *   a bootloader and we assume that the cache contents are
-	 *   valid.
-	 */
-	mfdccr	r9
-	cmplwi	r9,0
-	bne	2f
-	lis	r9,0
-	li	r8,256
-	mtctr	r8
-1:	dccci	r0,r9
-	addi	r9,r9,0x20
-	bdnz	1b
-2:	b	_zimage_start_lib
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index ed6266367bc0..de5fd5a047e8 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -323,14 +323,6 @@ adder875-redboot)
     platformo="$object/fixed-head.o $object/redboot-8xx.o"
     binary=y
     ;;
-simpleboot-virtex405-*)
-    platformo="$object/virtex405-head.o $object/simpleboot.o $object/virtex.o"
-    binary=y
-    ;;
-simpleboot-virtex440-*)
-    platformo="$object/fixed-head.o $object/simpleboot.o $object/virtex.o"
-    binary=y
-    ;;
 simpleboot-*)
     platformo="$object/fixed-head.o $object/simpleboot.o"
     binary=y
diff --git a/arch/powerpc/configs/40x/virtex_defconfig b/arch/powerpc/configs/40x/virtex_defconfig
deleted file mode 100644
index 5e7c61d1d7d0..000000000000
--- a/arch/powerpc/configs/40x/virtex_defconfig
+++ /dev/null
@@ -1,75 +0,0 @@
-CONFIG_40x=y
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_WALNUT is not set
-CONFIG_XILINX_VIRTEX_GENERIC_BOARD=y
-CONFIG_PREEMPT=y
-CONFIG_MATH_EMULATION=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE=""
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_NETFILTER=y
-CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_MANGLE=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_XILINX_SYSACE=y
-CONFIG_NETDEVICES=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_XILINX_XPS_PS2=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-CONFIG_XILINX_HWICAP=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_XILINX=y
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_XILINX=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_ROMFS_FS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_UTF8=m
-CONFIG_CRC_CCITT=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
-CONFIG_FONT_8x16=y
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_KERNEL=y
diff --git a/arch/powerpc/configs/44x/virtex5_defconfig b/arch/powerpc/configs/44x/virtex5_defconfig
deleted file mode 100644
index 1f74079e1703..000000000000
--- a/arch/powerpc/configs/44x/virtex5_defconfig
+++ /dev/null
@@ -1,74 +0,0 @@
-CONFIG_44x=y
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_EBONY is not set
-CONFIG_XILINX_VIRTEX440_GENERIC_BOARD=y
-CONFIG_PREEMPT=y
-CONFIG_MATH_EMULATION=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE=""
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_NETFILTER=y
-CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_MANGLE=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_XILINX_SYSACE=y
-CONFIG_NETDEVICES=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_XILINX_XPS_PS2=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-CONFIG_XILINX_HWICAP=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_XILINX=y
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_XILINX=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_ROMFS_FS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_UTF8=m
-CONFIG_CRC_CCITT=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
-CONFIG_FONT_8x16=y
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_KERNEL=y
diff --git a/arch/powerpc/configs/ppc40x_defconfig b/arch/powerpc/configs/ppc40x_defconfig
index a5f683aed328..88960a72b525 100644
--- a/arch/powerpc/configs/ppc40x_defconfig
+++ b/arch/powerpc/configs/ppc40x_defconfig
@@ -14,7 +14,6 @@ CONFIG_EP405=y
 CONFIG_HOTFOOT=y
 CONFIG_KILAUEA=y
 CONFIG_MAKALU=y
-CONFIG_XILINX_VIRTEX_GENERIC_BOARD=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -37,33 +36,26 @@ CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_XILINX_SYSACE=m
 CONFIG_NETDEVICES=y
 CONFIG_IBM_EMAC=y
 # CONFIG_INPUT is not set
 CONFIG_SERIO=m
 # CONFIG_SERIO_I8042 is not set
 # CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_XILINX_XPS_PS2=m
 # CONFIG_VT is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
-CONFIG_XILINX_HWICAP=m
 CONFIG_I2C=m
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_GPIO=m
 CONFIG_I2C_IBM_IIC=m
-CONFIG_GPIO_XILINX=y
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
 CONFIG_FB=m
-CONFIG_FB_XILINX=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=m
 CONFIG_VFAT_FS=m
diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
index a41eedfe0a5f..8b595f67068c 100644
--- a/arch/powerpc/configs/ppc44x_defconfig
+++ b/arch/powerpc/configs/ppc44x_defconfig
@@ -22,7 +22,6 @@ CONFIG_GLACIER=y
 CONFIG_REDWOOD=y
 CONFIG_EIGER=y
 CONFIG_YOSEMITE=y
-CONFIG_XILINX_VIRTEX440_GENERIC_BOARD=y
 CONFIG_PPC4xx_GPIO=y
 CONFIG_MATH_EMULATION=y
 CONFIG_NET=y
@@ -46,7 +45,6 @@ CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_XILINX_SYSACE=m
 CONFIG_SCSI=m
 CONFIG_BLK_DEV_SD=m
 # CONFIG_SCSI_LOWLEVEL is not set
@@ -57,7 +55,6 @@ CONFIG_IBM_EMAC=y
 CONFIG_SERIO=m
 # CONFIG_SERIO_I8042 is not set
 # CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_XILINX_XPS_PS2=m
 # CONFIG_VT is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -65,18 +62,13 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
-CONFIG_XILINX_HWICAP=m
 CONFIG_I2C=m
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_GPIO=m
 CONFIG_I2C_IBM_IIC=m
-CONFIG_GPIO_XILINX=y
 # CONFIG_HWMON is not set
 CONFIG_FB=m
-CONFIG_FB_XILINX=m
 CONFIG_USB=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_OHCI_HCD=m
diff --git a/arch/powerpc/include/asm/xilinx_intc.h b/arch/powerpc/include/asm/xilinx_intc.h
deleted file mode 100644
index ca9aa162fb09..000000000000
--- a/arch/powerpc/include/asm/xilinx_intc.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Xilinx intc external definitions
- *
- * Copyright 2007 Secret Lab Technologies Ltd.
- */
-#ifndef _ASM_POWERPC_XILINX_INTC_H
-#define _ASM_POWERPC_XILINX_INTC_H
-
-#ifdef __KERNEL__
-
-extern void __init xilinx_intc_init_tree(void);
-extern unsigned int xintc_get_irq(void);
-
-#endif /* __KERNEL__ */
-#endif /* _ASM_POWERPC_XILINX_INTC_H */
diff --git a/arch/powerpc/include/asm/xilinx_pci.h b/arch/powerpc/include/asm/xilinx_pci.h
deleted file mode 100644
index 7a8275caf6af..000000000000
--- a/arch/powerpc/include/asm/xilinx_pci.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Xilinx pci external definitions
- *
- * Copyright 2009 Roderick Colenbrander
- * Copyright 2009 Secret Lab Technologies Ltd.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#ifndef INCLUDE_XILINX_PCI
-#define INCLUDE_XILINX_PCI
-
-#ifdef CONFIG_XILINX_PCI
-extern void __init xilinx_pci_init(void);
-#else
-static inline void __init xilinx_pci_init(void) { return; }
-#endif
-
-#endif /* INCLUDE_XILINX_PCI */
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 245be4fafe13..2dff9041bcdc 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1385,32 +1385,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_4xx,
 		.platform		= "ppc405",
 	},
-	{	/* Xilinx Virtex-II Pro  */
-		.pvr_mask		= 0xfffff000,
-		.pvr_value		= 0x20010000,
-		.cpu_name		= "Virtex-II Pro",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* Xilinx Virtex-4 FX */
-		.pvr_mask		= 0xfffff000,
-		.pvr_value		= 0x20011000,
-		.cpu_name		= "Virtex-4 FX",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
 	{	/* 405EP */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x51210000,
@@ -1800,19 +1774,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_440A,
 		.platform		= "ppc440",
 	},
-	{ /* 440 in Xilinx Virtex-5 FXT */
-		.pvr_mask		= 0xfffffff0,
-		.pvr_value		= 0x7ff21910,
-		.cpu_name		= "440 in Virtex-5 FXT",
-		.cpu_features		= CPU_FTRS_44X,
-		.cpu_user_features	= COMMON_USER_BOOKE,
-		.mmu_features		= MMU_FTR_TYPE_44x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_440x5,
-		.machine_check		= machine_check_440A,
-		.platform		= "ppc440",
-	},
 	{ /* 460EX */
 		.pvr_mask		= 0xffff0006,
 		.pvr_value		= 0x13020002,
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index 6da813b65b42..d06ca51e8443 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -55,23 +55,6 @@ config WALNUT
 	help
 	  This option enables support for the IBM PPC405GP evaluation board.
 
-config XILINX_VIRTEX_GENERIC_BOARD
-	bool "Generic Xilinx Virtex board"
-	depends on 40x
-	select XILINX_VIRTEX_II_PRO
-	select XILINX_VIRTEX_4_FX
-	select XILINX_INTC
-	help
-	  This option enables generic support for Xilinx Virtex based boards.
-
-	  The generic virtex board support matches any device tree which
-	  specifies 'xilinx,virtex' in its compatible field.  This includes
-	  the Xilinx ML3xx and ML4xx reference designs using the powerpc
-	  core.
-
-	  Most Virtex designs should use this unless it needs to do some
-	  special configuration at board probe time.
-
 config OBS600
 	bool "OpenBlockS 600"
 	depends on 40x
@@ -109,20 +92,6 @@ config 405EZ
 	select IBM_EMAC_MAL_CLR_ICINTSTAT if IBM_EMAC
 	select IBM_EMAC_MAL_COMMON_ERR if IBM_EMAC
 
-config XILINX_VIRTEX
-	bool
-	select DEFAULT_UIMAGE
-
-config XILINX_VIRTEX_II_PRO
-	bool
-	select XILINX_VIRTEX
-	select IBM405_ERR77
-	select IBM405_ERR51
-
-config XILINX_VIRTEX_4_FX
-	bool
-	select XILINX_VIRTEX
-
 config STB03xxx
 	bool
 	select IBM405_ERR77
diff --git a/arch/powerpc/platforms/40x/Makefile b/arch/powerpc/platforms/40x/Makefile
index 828d78340dd9..e9386deed505 100644
--- a/arch/powerpc/platforms/40x/Makefile
+++ b/arch/powerpc/platforms/40x/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_WALNUT)				+= walnut.o
-obj-$(CONFIG_XILINX_VIRTEX_GENERIC_BOARD)	+= virtex.o
 obj-$(CONFIG_EP405)				+= ep405.o
 obj-$(CONFIG_PPC40x_SIMPLE)		+= ppc40x_simple.o
diff --git a/arch/powerpc/platforms/40x/virtex.c b/arch/powerpc/platforms/40x/virtex.c
deleted file mode 100644
index e3d5e095846b..000000000000
--- a/arch/powerpc/platforms/40x/virtex.c
+++ /dev/null
@@ -1,54 +0,0 @@
-/*
- * Xilinx Virtex (IIpro & 4FX) based board support
- *
- * Copyright 2007 Secret Lab Technologies Ltd.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-#include <asm/machdep.h>
-#include <asm/prom.h>
-#include <asm/time.h>
-#include <asm/xilinx_intc.h>
-#include <asm/xilinx_pci.h>
-#include <asm/ppc4xx.h>
-
-static const struct of_device_id xilinx_of_bus_ids[] __initconst = {
-	{ .compatible = "xlnx,plb-v46-1.00.a", },
-	{ .compatible = "xlnx,plb-v34-1.01.a", },
-	{ .compatible = "xlnx,plb-v34-1.02.a", },
-	{ .compatible = "xlnx,opb-v20-1.10.c", },
-	{ .compatible = "xlnx,dcr-v29-1.00.a", },
-	{ .compatible = "xlnx,compound", },
-	{}
-};
-
-static int __init virtex_device_probe(void)
-{
-	of_platform_bus_probe(NULL, xilinx_of_bus_ids, NULL);
-
-	return 0;
-}
-machine_device_initcall(virtex, virtex_device_probe);
-
-static int __init virtex_probe(void)
-{
-	if (!of_machine_is_compatible("xlnx,virtex"))
-		return 0;
-
-	return 1;
-}
-
-define_machine(virtex) {
-	.name			= "Xilinx Virtex",
-	.probe			= virtex_probe,
-	.setup_arch		= xilinx_pci_init,
-	.init_IRQ		= xilinx_intc_init_tree,
-	.get_irq		= xintc_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
-};
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 25ebe634a661..39e93d23fb38 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -232,33 +232,6 @@ config ICON
 	help
 	  This option enables support for the AMCC PPC440SPe evaluation board.
 
-config XILINX_VIRTEX440_GENERIC_BOARD
-	bool "Generic Xilinx Virtex 5 FXT board support"
-	depends on 44x
-	select XILINX_VIRTEX_5_FXT
-	select XILINX_INTC
-	help
-	  This option enables generic support for Xilinx Virtex based boards
-	  that use a 440 based processor in the Virtex 5 FXT FPGA architecture.
-
-	  The generic virtex board support matches any device tree which
-	  specifies 'xlnx,virtex440' in its compatible field.  This includes
-	  the Xilinx ML5xx reference designs using the powerpc core.
-
-	  Most Virtex 5 designs should use this unless it needs to do some
-	  special configuration at board probe time.
-
-config XILINX_ML510
-	bool "Xilinx ML510 extra support"
-	depends on XILINX_VIRTEX440_GENERIC_BOARD
-	select HAVE_PCI
-	select XILINX_PCI if PCI
-	select PPC_INDIRECT_PCI if PCI
-	select PPC_I8259 if PCI
-	help
-	  This option enables extra support for features on the Xilinx ML510
-	  board.  The ML510 has a PCI bus with ALI south bridge.
-
 config PPC44x_SIMPLE
 	bool "Simple PowerPC 44x board support"
 	depends on 44x
@@ -354,13 +327,3 @@ config 476FPE_ERR46
 config IBM440EP_ERR42
 	bool
 
-# Xilinx specific config options.
-config XILINX_VIRTEX
-	bool
-	select DEFAULT_UIMAGE
-
-# Xilinx Virtex 5 FXT FPGA architecture, selected by a Xilinx board above
-config XILINX_VIRTEX_5_FXT
-	bool
-	select XILINX_VIRTEX
-
diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index 1b78c6af821a..5ba031f57652 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -7,8 +7,6 @@ obj-$(CONFIG_PPC44x_SIMPLE) += ppc44x_simple.o
 obj-$(CONFIG_EBONY)	+= ebony.o
 obj-$(CONFIG_SAM440EP) 	+= sam440ep.o
 obj-$(CONFIG_WARP)	+= warp.o
-obj-$(CONFIG_XILINX_VIRTEX_5_FXT) += virtex.o
-obj-$(CONFIG_XILINX_ML510) += virtex_ml510.o
 obj-$(CONFIG_ISS4xx)	+= iss4xx.o
 obj-$(CONFIG_CANYONLANDS)+= canyonlands.o
 obj-$(CONFIG_CURRITUCK)	+= ppc476.o
diff --git a/arch/powerpc/platforms/44x/virtex.c b/arch/powerpc/platforms/44x/virtex.c
deleted file mode 100644
index 3eb13ed926ee..000000000000
--- a/arch/powerpc/platforms/44x/virtex.c
+++ /dev/null
@@ -1,60 +0,0 @@
-/*
- * Xilinx Virtex 5FXT based board support, derived from
- * the Xilinx Virtex (IIpro & 4FX) based board support
- *
- * Copyright 2007 Secret Lab Technologies Ltd.
- * Copyright 2008 Xilinx, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-#include <asm/machdep.h>
-#include <asm/prom.h>
-#include <asm/time.h>
-#include <asm/xilinx_intc.h>
-#include <asm/xilinx_pci.h>
-#include <asm/reg.h>
-#include <asm/ppc4xx.h>
-#include "44x.h"
-
-static const struct of_device_id xilinx_of_bus_ids[] __initconst = {
-	{ .compatible = "simple-bus", },
-	{ .compatible = "xlnx,plb-v46-1.00.a", },
-	{ .compatible = "xlnx,plb-v46-1.02.a", },
-	{ .compatible = "xlnx,plb-v34-1.01.a", },
-	{ .compatible = "xlnx,plb-v34-1.02.a", },
-	{ .compatible = "xlnx,opb-v20-1.10.c", },
-	{ .compatible = "xlnx,dcr-v29-1.00.a", },
-	{ .compatible = "xlnx,compound", },
-	{}
-};
-
-static int __init virtex_device_probe(void)
-{
-	of_platform_bus_probe(NULL, xilinx_of_bus_ids, NULL);
-
-	return 0;
-}
-machine_device_initcall(virtex, virtex_device_probe);
-
-static int __init virtex_probe(void)
-{
-	if (!of_machine_is_compatible("xlnx,virtex440"))
-		return 0;
-
-	return 1;
-}
-
-define_machine(virtex) {
-	.name			= "Xilinx Virtex440",
-	.probe			= virtex_probe,
-	.setup_arch		= xilinx_pci_init,
-	.init_IRQ		= xilinx_intc_init_tree,
-	.get_irq		= xintc_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.restart		= ppc4xx_reset_system,
-};
diff --git a/arch/powerpc/platforms/44x/virtex_ml510.c b/arch/powerpc/platforms/44x/virtex_ml510.c
deleted file mode 100644
index 349f218b335c..000000000000
--- a/arch/powerpc/platforms/44x/virtex_ml510.c
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <asm/i8259.h>
-#include <linux/pci.h>
-#include "44x.h"
-
-/**
- * ml510_ail_quirk
- */
-static void ml510_ali_quirk(struct pci_dev *dev)
-{
-	/* Enable the IDE controller */
-	pci_write_config_byte(dev, 0x58, 0x4c);
-	/* Assign irq 14 to the primary ide channel */
-	pci_write_config_byte(dev, 0x44, 0x0d);
-	/* Assign irq 15 to the secondary ide channel */
-	pci_write_config_byte(dev, 0x75, 0x0f);
-	/* Set the ide controller in native mode */
-	pci_write_config_byte(dev, 0x09, 0xff);
-
-	/* INTB = disabled, INTA = disabled */
-	pci_write_config_byte(dev, 0x48, 0x00);
-	/* INTD = disabled, INTC = disabled */
-	pci_write_config_byte(dev, 0x4a, 0x00);
-	/* Audio = INT7, Modem = disabled. */
-	pci_write_config_byte(dev, 0x4b, 0x60);
-	/* USB = INT7 */
-	pci_write_config_byte(dev, 0x74, 0x06);
-}
-DECLARE_PCI_FIXUP_EARLY(0x10b9, 0x1533, ml510_ali_quirk);
-
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 1f8025383caa..5e6479d409a0 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -317,8 +317,4 @@ config MCU_MPC8349EMITX
 	  also register MCU GPIOs with the generic GPIO API, so you'll able
 	  to use MCU pins as GPIOs.
 
-config XILINX_PCI
-	bool "Xilinx PCI host bridge support"
-	depends on PCI && XILINX_VIRTEX
-
 endmenu
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index cb5a5bd2cef5..026b3f01a991 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -31,8 +31,6 @@ obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc_cmos_setup.o
 obj-$(CONFIG_PPC_INDIRECT_PCI)	+= indirect_pci.o
 obj-$(CONFIG_PPC_I8259)		+= i8259.o
 obj-$(CONFIG_IPIC)		+= ipic.o
-obj-$(CONFIG_XILINX_VIRTEX)	+= xilinx_intc.o
-obj-$(CONFIG_XILINX_PCI)	+= xilinx_pci.o
 obj-$(CONFIG_OF_RTC)		+= of_rtc.o
 
 obj-$(CONFIG_CPM)		+= cpm_common.o
diff --git a/arch/powerpc/sysdev/xilinx_intc.c b/arch/powerpc/sysdev/xilinx_intc.c
deleted file mode 100644
index 4a86dcff3fcd..000000000000
--- a/arch/powerpc/sysdev/xilinx_intc.c
+++ /dev/null
@@ -1,88 +0,0 @@
-/*
- * Interrupt controller driver for Xilinx Virtex FPGAs
- *
- * Copyright (C) 2007 Secret Lab Technologies Ltd.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- *
- */
-
-/*
- * This is a driver for the interrupt controller typically found in
- * Xilinx Virtex FPGA designs.
- *
- * The interrupt sense levels are hard coded into the FPGA design with
- * typically a 1:1 relationship between irq lines and devices (no shared
- * irq lines).  Therefore, this driver does not attempt to handle edge
- * and level interrupts differently.
- */
-#undef DEBUG
-
-#include <linux/kernel.h>
-#include <linux/irq.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <asm/io.h>
-#include <asm/processor.h>
-#include <asm/i8259.h>
-#include <asm/irq.h>
-#include <linux/irqchip.h>
-
-#if defined(CONFIG_PPC_I8259)
-/*
- * Support code for cascading to 8259 interrupt controllers
- */
-static void xilinx_i8259_cascade(struct irq_desc *desc)
-{
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned int cascade_irq = i8259_irq();
-
-	if (cascade_irq)
-		generic_handle_irq(cascade_irq);
-
-	/* Let xilinx_intc end the interrupt */
-	chip->irq_unmask(&desc->irq_data);
-}
-
-static void __init xilinx_i8259_setup_cascade(void)
-{
-	struct device_node *cascade_node;
-	int cascade_irq;
-
-	/* Initialize i8259 controller */
-	cascade_node = of_find_compatible_node(NULL, NULL, "chrp,iic");
-	if (!cascade_node)
-		return;
-
-	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
-	if (!cascade_irq) {
-		pr_err("virtex_ml510: Failed to map cascade interrupt\n");
-		goto out;
-	}
-
-	i8259_init(cascade_node, 0);
-	irq_set_chained_handler(cascade_irq, xilinx_i8259_cascade);
-
-	/* Program irq 7 (usb/audio), 14/15 (ide) to level sensitive */
-	/* This looks like a dirty hack to me --gcl */
-	outb(0xc0, 0x4d0);
-	outb(0xc0, 0x4d1);
-
- out:
-	of_node_put(cascade_node);
-}
-#else
-static inline void xilinx_i8259_setup_cascade(void) { return; }
-#endif /* defined(CONFIG_PPC_I8259) */
-
-/*
- * Initialize master Xilinx interrupt controller
- */
-void __init xilinx_intc_init_tree(void)
-{
-	irqchip_init();
-	xilinx_i8259_setup_cascade();
-}
diff --git a/arch/powerpc/sysdev/xilinx_pci.c b/arch/powerpc/sysdev/xilinx_pci.c
deleted file mode 100644
index fea5667699ed..000000000000
--- a/arch/powerpc/sysdev/xilinx_pci.c
+++ /dev/null
@@ -1,132 +0,0 @@
-/*
- * PCI support for Xilinx plbv46_pci soft-core which can be used on
- * Xilinx Virtex ML410 / ML510 boards.
- *
- * Copyright 2009 Roderick Colenbrander
- * Copyright 2009 Secret Lab Technologies Ltd.
- *
- * The pci bridge fixup code was copied from ppc4xx_pci.c and was written
- * by Benjamin Herrenschmidt.
- * Copyright 2007 Ben. Herrenschmidt <benh@kernel.crashing.org>, IBM Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#include <linux/ioport.h>
-#include <linux/of.h>
-#include <linux/pci.h>
-#include <mm/mmu_decl.h>
-#include <asm/io.h>
-#include <asm/xilinx_pci.h>
-
-#define XPLB_PCI_ADDR 0x10c
-#define XPLB_PCI_DATA 0x110
-#define XPLB_PCI_BUS  0x114
-
-#define PCI_HOST_ENABLE_CMD PCI_COMMAND_SERR | PCI_COMMAND_PARITY | PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY
-
-static const struct of_device_id xilinx_pci_match[] = {
-	{ .compatible = "xlnx,plbv46-pci-1.03.a", },
-	{}
-};
-
-/**
- * xilinx_pci_fixup_bridge - Block Xilinx PHB configuration.
- */
-static void xilinx_pci_fixup_bridge(struct pci_dev *dev)
-{
-	struct pci_controller *hose;
-	int i;
-
-	if (dev->devfn || dev->bus->self)
-		return;
-
-	hose = pci_bus_to_host(dev->bus);
-	if (!hose)
-		return;
-
-	if (!of_match_node(xilinx_pci_match, hose->dn))
-		return;
-
-	/* Hide the PCI host BARs from the kernel as their content doesn't
-	 * fit well in the resource management
-	 */
-	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
-		dev->resource[i].start = 0;
-		dev->resource[i].end = 0;
-		dev->resource[i].flags = 0;
-	}
-
-	dev_info(&dev->dev, "Hiding Xilinx plb-pci host bridge resources %s\n",
-		 pci_name(dev));
-}
-DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, xilinx_pci_fixup_bridge);
-
-/**
- * xilinx_pci_exclude_device - Don't do config access for non-root bus
- *
- * This is a hack.  Config access to any bus other than bus 0 does not
- * currently work on the ML510 so we prevent it here.
- */
-static int
-xilinx_pci_exclude_device(struct pci_controller *hose, u_char bus, u8 devfn)
-{
-	return (bus != 0);
-}
-
-/**
- * xilinx_pci_init - Find and register a Xilinx PCI host bridge
- */
-void __init xilinx_pci_init(void)
-{
-	struct pci_controller *hose;
-	struct resource r;
-	void __iomem *pci_reg;
-	struct device_node *pci_node;
-
-	pci_node = of_find_matching_node(NULL, xilinx_pci_match);
-	if(!pci_node)
-		return;
-
-	if (of_address_to_resource(pci_node, 0, &r)) {
-		pr_err("xilinx-pci: cannot resolve base address\n");
-		return;
-	}
-
-	hose = pcibios_alloc_controller(pci_node);
-	if (!hose) {
-		pr_err("xilinx-pci: pcibios_alloc_controller() failed\n");
-		return;
-	}
-
-	/* Setup config space */
-	setup_indirect_pci(hose, r.start + XPLB_PCI_ADDR,
-			   r.start + XPLB_PCI_DATA,
-			   PPC_INDIRECT_TYPE_SET_CFG_TYPE);
-
-	/* According to the xilinx plbv46_pci documentation the soft-core starts
-	 * a self-init when the bus master enable bit is set. Without this bit
-	 * set the pci bus can't be scanned.
-	 */
-	early_write_config_word(hose, 0, 0, PCI_COMMAND, PCI_HOST_ENABLE_CMD);
-
-	/* Set the max latency timer to 255 */
-	early_write_config_byte(hose, 0, 0, PCI_LATENCY_TIMER, 0xff);
-
-	/* Set the max bus number to 255 */
-	pci_reg = of_iomap(pci_node, 0);
-	out_8(pci_reg + XPLB_PCI_BUS, 0xff);
-	iounmap(pci_reg);
-
-	/* Nothing past the root bridge is working right now.  By default
-	 * exclude config access to anything except bus 0 */
-	if (!ppc_md.pci_exclude_device)
-		ppc_md.pci_exclude_device = xilinx_pci_exclude_device;
-
-	/* Register the host bridge with the linux kernel! */
-	pci_process_bridge_OF_ranges(hose, pci_node, 1);
-
-	pr_info("xilinx-pci: Registered PCI host bridge\n");
-}
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 26956c006987..0ccbd6fd6de1 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -316,7 +316,7 @@ config DTLK
 
 config XILINX_HWICAP
 	tristate "Xilinx HWICAP Support"
-	depends on XILINX_VIRTEX || MICROBLAZE
+	depends on MICROBLAZE
 	help
 	  This option enables support for Xilinx Internal Configuration
 	  Access Port (ICAP) driver.  The ICAP is used on Xilinx Virtex
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index f65991a67af2..b174650e0f09 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2007,7 +2007,7 @@ config FB_PS3_DEFAULT_SIZE_M
 
 config FB_XILINX
 	tristate "Xilinx frame buffer support"
-	depends on FB && (XILINX_VIRTEX || MICROBLAZE || ARCH_ZYNQ || ARCH_ZYNQMP)
+	depends on FB && (MICROBLAZE || ARCH_ZYNQ || ARCH_ZYNQMP)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.26.0

