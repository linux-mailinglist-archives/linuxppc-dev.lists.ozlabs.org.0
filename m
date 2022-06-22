Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C3554A1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 14:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSjYh5Lfgz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 22:36:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nQsjjSq9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nQsjjSq9;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSjY23HD1z3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 22:36:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6219CB81E82;
	Wed, 22 Jun 2022 12:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DBCC34114;
	Wed, 22 Jun 2022 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655901361;
	bh=CDBvDpZuxE6FJsrujdMwq119xnuW60OiMkQB6x7mZDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQsjjSq9JRzDE0embHFEYPmZ9rqyKGU+LqC5S/3p0fPBkrtfFzmNOQ4/SI1w02HGR
	 q110ISYB/9JEv3owbAIe8entPmH3ehT6aOedlp9dQ8bK5DYhU3OjI9/Iui5JIlCApy
	 ojmg547gHZRZ97ht3jRECQqdIKvWg+h4MxRxHlN14hAq7KKX6Uhuq6++NOAbKITV9F
	 pOgueCr67WkviSLq2uFRoPDn5RDOa9wPMhKbUqNC2ovs7OCei0Olx2Ia3H1EWilB8q
	 I+UQ87pVoIqTSDORS/fHeWorR8dNHws+vpQDuh4fpmlOz6t1QlfC0GsTJJSyHtYku7
	 tNZWdUu519XRw==
Received: by pali.im (Postfix)
	id 8763F87A; Wed, 22 Jun 2022 14:35:57 +0200 (CEST)
Date: Wed, 22 Jun 2022 14:35:57 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
Message-ID: <20220622123557.2av3cfutpnd6iaqf@pali>
References: <20220511143712.22550-1-pali@kernel.org>
 <20220524092332.dgbgti5d2lyh4g32@pali>
 <20220609101900.ie5hki3ojeyvcnsz@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609101900.ie5hki3ojeyvcnsz@pali>
User-Agent: NeoMutt/20180716
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
Cc: devicetree@vger.kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Marek Behun <marek.behun@nic.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 09 June 2022 12:19:00 Pali Rohár wrote:
> On Tuesday 24 May 2022 11:23:32 Pali Rohár wrote:
> > On Wednesday 11 May 2022 16:37:12 Pali Rohár wrote:
> > > CZ.NIC Turris 1.0 and 1.1 are open source routers, they have dual-core
> > > PowerPC Freescale P2020 CPU and are based on Freescale P2020RDB-PC-A board.
> > > Hardware design is fully open source, all firmware and hardware design
> > > files are available at Turris project website:
> > > 
> > > https://docs.turris.cz/hw/turris-1x/turris-1x/
> > > https://project.turris.cz/en/hardware.html
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > ---
> > >  arch/powerpc/boot/dts/turris1x.dts | 470 +++++++++++++++++++++++++++++
> > >  1 file changed, 470 insertions(+)
> > >  create mode 100644 arch/powerpc/boot/dts/turris1x.dts
> > 
> > Michael, Rob: PING?
> 
> PING?

PING?

> > > diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
> > > new file mode 100644
> > > index 000000000000..2a624f117586
> > > --- /dev/null
> > > +++ b/arch/powerpc/boot/dts/turris1x.dts
> > > @@ -0,0 +1,470 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Turris 1.x Device Tree Source
> > > + *
> > > + * Copyright 2013 - 2022 CZ.NIC z.s.p.o. (http://www.nic.cz/)
> > > + *
> > > + * Pinout, Schematics and Altium hardware design files are open source
> > > + * and available at: https://docs.turris.cz/hw/turris-1x/turris-1x/
> > > + */
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +/include/ "fsl/p2020si-pre.dtsi"
> > > +
> > > +/ {
> > > +	model = "Turris 1.x";
> > > +	compatible = "cznic,turris1x", "fsl,P2020RDB-PC"; /* fsl,P2020RDB-PC is required for booting Linux */
> > > +
> > > +	aliases {
> > > +		ethernet0 = &enet0;
> > > +		ethernet1 = &enet1;
> > > +		ethernet2 = &enet2;
> > > +		serial0 = &serial0;
> > > +		serial1 = &serial1;
> > > +		pci0 = &pci0;
> > > +		pci1 = &pci1;
> > > +		pci2 = &pci2;
> > > +		spi0 = &spi0;
> > > +	};
> > > +
> > > +	memory {
> > > +		device_type = "memory";
> > > +	};
> > > +
> > > +	soc: soc@ffe00000 {
> > > +		ranges = <0x0 0x0 0xffe00000 0x00100000>;
> > > +
> > > +		i2c@3000 {
> > > +			/* PCA9557PW GPIO controller for boot config */
> > > +			gpio-controller@18 {
> > > +				compatible = "nxp,pca9557";
> > > +				label = "bootcfg";
> > > +				reg = <0x18>;
> > > +				#gpio-cells = <2>;
> > > +				gpio-controller;
> > > +				polarity = <0x00>;
> > > +			};
> > > +
> > > +			/* STM32F030R8T6 MCU for power control */
> > > +			power-control@32 {
> > > +				/*
> > > +				 * Turris Power Control firmware runs on STM32F0 MCU.
> > > +				 * This firmware is open source and available at:
> > > +				 * https://gitlab.nic.cz/turris/hw/turris_power_control
> > > +				 */
> > > +				reg = <0x32>;
> > > +			};
> > > +
> > > +			/* SA56004ED temperature control */
> > > +			temperature-sensor@4c {
> > > +				compatible = "nxp,sa56004";
> > > +				reg = <0x4c>;
> > > +				interrupt-parent = <&gpio>;
> > > +				interrupts = <12 IRQ_TYPE_LEVEL_LOW>, /* GPIO12 - ALERT pin */
> > > +					     <13 IRQ_TYPE_LEVEL_LOW>; /* GPIO13 - CRIT pin */
> > > +			};
> > > +
> > > +			/* DDR3 SPD/EEPROM */
> > > +			eeprom@52 {
> > > +				compatible = "atmel,spd";
> > > +				reg = <0x52>;
> > > +			};
> > > +
> > > +			/* ATSHA204-TH-DA-T crypto module */
> > > +			crypto@64 {
> > > +				compatible = "atmel,atsha204";
> > > +				reg = <0x64>;
> > > +			};
> > > +
> > > +			/* IDT6V49205BNLGI clock generator */
> > > +			clock-generator@69 {
> > > +				compatible = "idt,6v49205b";
> > > +				reg = <0x69>;
> > > +			};
> > > +
> > > +			/* MCP79402-I/ST Protected EEPROM */
> > > +			eeprom@57 {
> > > +				reg = <0x57>;
> > > +			};
> > > +
> > > +			/* MCP79402-I/ST RTC */
> > > +			rtc@6f {
> > > +				compatible = "microchip,mcp7940x";
> > > +				reg = <0x6f>;
> > > +				interrupt-parent = <&gpio>;
> > > +				interrupts = <14 0>; /* GPIO14 - MFP pin */
> > > +			};
> > > +		};
> > > +
> > > +		/* SPI on connector P1 */
> > > +		spi0: spi@7000 {
> > > +		};
> > > +
> > > +		gpio: gpio-controller@fc00 {
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +		};
> > > +
> > > +		/* Connected to SMSC USB2412-DZK 2-Port USB 2.0 Hub Controller */
> > > +		usb@22000 {
> > > +			phy_type = "ulpi";
> > > +			dr_mode = "host";
> > > +		};
> > > +
> > > +		enet0: ethernet@24000 {
> > > +			/* Connected to port 6 of QCA8337N-AL3C switch */
> > > +			phy-connection-type = "rgmii-id";
> > > +
> > > +			fixed-link {
> > > +				speed = <1000>;
> > > +				full-duplex;
> > > +			};
> > > +		};
> > > +
> > > +		mdio@24520 {
> > > +			/* QCA8337N-AL3C switch with integrated ethernet PHYs for LAN ports */
> > > +			switch@10 {
> > > +				compatible = "qca,qca8337";
> > > +				interrupts = <2 1 0 0>;
> > > +				reg = <0x10>;
> > > +
> > > +				ports {
> > > +					#address-cells = <1>;
> > > +					#size-cells = <0>;
> > > +
> > > +					port@0 {
> > > +						reg = <0>;
> > > +						label = "cpu1";
> > > +						ethernet = <&enet1>;
> > > +						phy-mode = "rgmii-id";
> > > +
> > > +						fixed-link {
> > > +							speed = <1000>;
> > > +							full-duplex;
> > > +						};
> > > +					};
> > > +
> > > +					port@1 {
> > > +						reg = <1>;
> > > +						label = "lan5";
> > > +					};
> > > +
> > > +					port@2 {
> > > +						reg = <2>;
> > > +						label = "lan4";
> > > +					};
> > > +
> > > +					port@3 {
> > > +						reg = <3>;
> > > +						label = "lan3";
> > > +					};
> > > +
> > > +					port@4 {
> > > +						reg = <4>;
> > > +						label = "lan2";
> > > +					};
> > > +
> > > +					port@5 {
> > > +						reg = <5>;
> > > +						label = "lan1";
> > > +					};
> > > +
> > > +					port@6 {
> > > +						reg = <6>;
> > > +						label = "cpu0";
> > > +						ethernet = <&enet0>;
> > > +						phy-mode = "rgmii-id";
> > > +
> > > +						fixed-link {
> > > +							speed = <1000>;
> > > +							full-duplex;
> > > +						};
> > > +					};
> > > +				};
> > > +			};
> > > +
> > > +			/* KSZ9031RNXCA ethernet phy for WAN port */
> > > +			phy: ethernet-phy@7 {
> > > +				interrupts = <3 1 0 0>;
> > > +				reg = <0x7>;
> > > +			};
> > > +		};
> > > +
> > > +		ptp_clock@24e00 {
> > > +			fsl,tclk-period = <5>;
> > > +			fsl,tmr-prsc = <200>;
> > > +			fsl,tmr-add = <0xcccccccd>;
> > > +			fsl,tmr-fiper1 = <0x3b9ac9fb>;
> > > +			fsl,tmr-fiper2 = <0x0001869b>;
> > > +			fsl,max-adj = <249999999>;
> > > +		};
> > > +
> > > +		enet1: ethernet@25000 {
> > > +			/* Connected to port 0 of QCA8337N-AL3C switch */
> > > +			phy-connection-type = "rgmii-id";
> > > +
> > > +			fixed-link {
> > > +				speed = <1000>;
> > > +				full-duplex;
> > > +			};
> > > +		};
> > > +
> > > +		mdio@25520 {
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		enet2: ethernet@26000 {
> > > +			/* Connected to KSZ9031RNXCA ethernet phy (WAN port) */
> > > +			label = "wan";
> > > +			phy-handle = <&phy>;
> > > +			phy-connection-type = "rgmii-id";
> > > +		};
> > > +
> > > +		mdio@26520 {
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		sdhc@2e000 {
> > > +			bus-width = <4>;
> > > +			cd-gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
> > > +		};
> > > +	};
> > > +
> > > +	lbc: localbus@ffe05000 {
> > > +		reg = <0 0xffe05000 0 0x1000>;
> > > +
> > > +		ranges = <0x0 0x0 0x0 0xef000000 0x01000000>, /* NOR */
> > > +			 <0x1 0x0 0x0 0xff800000 0x00040000>, /* NAND */
> > > +			 <0x3 0x0 0x0 0xffa00000 0x00020000>; /* CPLD */
> > > +
> > > +		/* S29GL128P90TFIR10 NOR */
> > > +		nor@0,0 {
> > > +			compatible = "cfi-flash";
> > > +			reg = <0x0 0x0 0x01000000>;
> > > +			bank-width = <2>;
> > > +			device-width = <1>;
> > > +
> > > +			partitions {
> > > +				compatible = "fixed-partitions";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <1>;
> > > +
> > > +				partition@0 {
> > > +					/* 128 kB for Device Tree Blob */
> > > +					reg = <0x00000000 0x00020000>;
> > > +					label = "dtb";
> > > +				};
> > > +
> > > +				partition@20000 {
> > > +					/* 1.7 MB for Rescue Linux Kernel Image */
> > > +					reg = <0x00020000 0x001a0000>;
> > > +					label = "rescue-kernel";
> > > +				};
> > > +
> > > +				partition@1c0000 {
> > > +					/* 1.5 MB for Rescue JFFS2 Root File System */
> > > +					reg = <0x001c0000 0x00180000>;
> > > +					label = "rescue-rootfs";
> > > +				};
> > > +
> > > +				partition@340000 {
> > > +					/* 11 MB for TAR.XZ Backup with content of NAND Root File System */
> > > +					reg = <0x00340000 0x00b00000>;
> > > +					label = "backup-rootfs";
> > > +				};
> > > +
> > > +				partition@e40000 {
> > > +					/* 768 kB for Certificates JFFS2 File System */
> > > +					reg = <0x00e40000 0x000c0000>;
> > > +					label = "certificates";
> > > +				};
> > > +
> > > +				/* free unused space 0x00f00000-0x00f20000 */
> > > +
> > > +				partition@f20000 {
> > > +					/* 128 kB for U-Boot Environment Variables */
> > > +					reg = <0x00f20000 0x00020000>;
> > > +					label = "u-boot-env";
> > > +				};
> > > +
> > > +				partition@f40000 {
> > > +					/* 768 kB for U-Boot Bootloader Image */
> > > +					reg = <0x00f40000 0x000c0000>;
> > > +					label = "u-boot";
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		/* MT29F2G08ABAEAWP:E NAND */
> > > +		nand@1,0 {
> > > +			compatible = "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
> > > +			reg = <0x1 0x0 0x00040000>;
> > > +			nand-ecc-mode = "soft";
> > > +			nand-ecc-algo = "bch";
> > > +
> > > +			partitions {
> > > +				compatible = "fixed-partitions";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <1>;
> > > +
> > > +				partition@0 {
> > > +					/* 256 MB for UBI with one volume: UBIFS Root File System */
> > > +					reg = <0x00000000 0x10000000>;
> > > +					label = "rootfs";
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		/* LCMXO1200C-3FTN256C FPGA */
> > > +		cpld@3,0 {
> > > +			/*
> > > +			 * Turris CPLD firmware which runs on this Lattice FPGA,
> > > +			 * is extended version of P1021RDB-PC CPLD v4.1 firmware.
> > > +			 * It is backward compatible with its original version
> > > +			 * and the only extension is support for Turris LEDs.
> > > +			 * Turris CPLD firmware is open source and available at:
> > > +			 * https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> > > +			 */
> > > +			compatible = "cznic,turris1x-cpld", "fsl,p1021rdb-pc-cpld", "simple-bus";
> > > +			reg = <0x3 0x0 0x30>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +			ranges = <0x0 0x3 0x0 0x00020000>;
> > > +
> > > +			/* MAX6370KA+T watchdog */
> > > +			watchdog@2 {
> > > +				/*
> > > +				 * CPLD firmware maps SET0, SET1 and SET2
> > > +				 * input logic of MAX6370KA+T chip to CPLD
> > > +				 * memory space at byte offset 0x2. WDI
> > > +				 * input logic is outside of the CPLD and
> > > +				 * connected via external GPIO.
> > > +				 */
> > > +				compatible = "maxim,max6370";
> > > +				reg = <0x02 0x01>;
> > > +				gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
> > > +			};
> > > +
> > > +			led-controller@13 {
> > > +				/*
> > > +				 * LEDs are controlled by CPLD firmware.
> > > +				 * All five LAN LEDs share common RGB settings
> > > +				 * and so it is not possible to set different
> > > +				 * colors on different LAN ports.
> > > +				 */
> > > +				compatible = "cznic,turris1x-leds";
> > > +				reg = <0x13 0x1d>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				multi-led@0 {
> > > +					reg = <0x0>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_WAN;
> > > +				};
> > > +
> > > +				multi-led@1 {
> > > +					reg = <0x1>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_LAN;
> > > +					function-enumerator = <5>;
> > > +				};
> > > +
> > > +				multi-led@2 {
> > > +					reg = <0x2>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_LAN;
> > > +					function-enumerator = <4>;
> > > +				};
> > > +
> > > +				multi-led@3 {
> > > +					reg = <0x3>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_LAN;
> > > +					function-enumerator = <3>;
> > > +				};
> > > +
> > > +				multi-led@4 {
> > > +					reg = <0x4>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_LAN;
> > > +					function-enumerator = <2>;
> > > +				};
> > > +
> > > +				multi-led@5 {
> > > +					reg = <0x5>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_LAN;
> > > +					function-enumerator = <1>;
> > > +				};
> > > +
> > > +				multi-led@6 {
> > > +					reg = <0x6>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_WLAN;
> > > +				};
> > > +
> > > +				multi-led@7 {
> > > +					reg = <0x7>;
> > > +					color = <LED_COLOR_ID_RGB>;
> > > +					function = LED_FUNCTION_POWER;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +
> > > +	pci2: pcie@ffe08000 {
> > > +		/*
> > > +		 * PCIe bus for on-board TUSB7340RKM USB 3.0 xHCI controller.
> > > +		 * This xHCI controller is available only on Turris 1.1 boards.
> > > +		 * Turris 1.0 boards have nothing connected to this PCIe bus,
> > > +		 * so system would see only PCIe Root Port of this PCIe Root
> > > +		 * Complex. TUSB7340RKM xHCI controller has four SuperSpeed
> > > +		 * channels. Channel 0 is connected to the front USB 3.0 port,
> > > +		 * channel 1 (but only USB 2.0 subset) to USB 2.0 pins on mPCIe
> > > +		 * slot 1 (CN5), channels 2 and 3 to connector P600.
> > > +		 *
> > > +		 * P2020 PCIe Root Port uses 1MB of PCIe MEM and xHCI controller
> > > +		 * uses 64kB + 8kB of PCIe MEM. No PCIe IO is used or required.
> > > +		 * So allocate 2MB of PCIe MEM for this PCIe bus.
> > > +		 */
> > > +		reg = <0 0xffe08000 0 0x1000>;
> > > +		ranges = <0x02000000 0x0 0xc0000000 0 0xc0000000 0x0 0x00200000>, /* MEM */
> > > +			 <0x01000000 0x0 0x00000000 0 0xffc20000 0x0 0x00010000>; /* IO */
> > > +
> > > +		pcie@0 {
> > > +			ranges;
> > > +		};
> > > +	};
> > > +
> > > +	pci1: pcie@ffe09000 {
> > > +		/* PCIe bus on mPCIe slot 2 (CN6) for expansion mPCIe card */
> > > +		reg = <0 0xffe09000 0 0x1000>;
> > > +		ranges = <0x02000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000>, /* MEM */
> > > +			 <0x01000000 0x0 0x00000000 0 0xffc10000 0x0 0x00010000>; /* IO */
> > > +
> > > +		pcie@0 {
> > > +			ranges;
> > > +		};
> > > +	};
> > > +
> > > +	pci0: pcie@ffe0a000 {
> > > +		/*
> > > +		 * PCIe bus on mPCIe slot 1 (CN5) for expansion mPCIe card.
> > > +		 * Turris 1.1 boards have in this mPCIe slot additional USB 2.0
> > > +		 * pins via channel 1 of TUSB7340RKM xHCI controller and also
> > > +		 * additional SIM card slot, both for USB-based WWAN cards.
> > > +		 */
> > > +		reg = <0 0xffe0a000 0 0x1000>;
> > > +		ranges = <0x02000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000>, /* MEM */
> > > +			 <0x01000000 0x0 0x00000000 0 0xffc00000 0x0 0x00010000>; /* IO */
> > > +
> > > +		pcie@0 {
> > > +			ranges;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +/include/ "fsl/p2020si-post.dtsi"
> > > -- 
> > > 2.20.1
> > > 
