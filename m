Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99A67C7B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2bRQ3y6Zz3fDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hy5EFgaQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hy5EFgaQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2bQV4twWz3cdC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 20:44:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 81D3BB81D19;
	Thu, 26 Jan 2023 09:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE18C433EF;
	Thu, 26 Jan 2023 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674726270;
	bh=FrtbMbb4OIfAtJoYv7TEP+YBKTKU1Lf54MZlFwjBe6A=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Hy5EFgaQhwX3N4yDoBbMnHTcYfaJfeEgtGdqkcfEHctzYAo8Qq7Myv9Tv8TzVuLuM
	 ROAUtf239yFs19rqtlZgSZG/JxAfdmb5z9I5l5WfzVa3OIDNlEscQKjhofqiflry3G
	 KullkN/j3Flnws0eL2CvaC+IfBWOHQ8N//Rl8mmiLPwx0Ljcq9H8rSpcFIXJDxP5jH
	 Us13tuORrc8mkcLbAX+7mCdzAApXq+Tyi/Lst5UfUP4/UKIkwLbALK6h6T7kPPPwAZ
	 Bee4ghiMFv4sZRARfmnPe47PBCyqsbBeKrDMdSdZADpAnr9eDOtqv0YCwga6c7Qyo1
	 Wfe//ovSMetRw==
Date: Thu, 26 Jan 2023 17:44:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 02/10] ARM: dts: ls1021a: add TQ-Systems MBLS102xA
 device tree
Message-ID: <20230126094415.GE20713@T480>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
 <20230120133455.3962413-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120133455.3962413-3-alexander.stein@ew.tq-group.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 02:34:47PM +0100, Alexander Stein wrote:
> Add device tree for the MBLS102xA mainboard with TQMLS1021A SoM.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Remove unnecessary status = "okay"
> * Remove underscore from node names
> * Move reg direct below compatiblefor i2c devices
> * Remove i2c device nodes without software support
>   Add a comment about existance for the device though
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 406 ++++++++++++++++++
>  arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     |  81 ++++
>  3 files changed, 488 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
>  create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0c07867aeabe..44b5ed44b13d6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -802,6 +802,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>  	ls1021a-iot.dtb \
>  	ls1021a-moxa-uc-8410a.dtb \
>  	ls1021a-qds.dtb \
> +	ls1021a-tqmls1021a-mbls1021a.dtb \
>  	ls1021a-tsn.dtb \
>  	ls1021a-twr.dtb
>  dtb-$(CONFIG_SOC_VF610) += \
> diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
> new file mode 100644
> index 0000000000000..aa8b605344655
> --- /dev/null
> +++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/leds/leds-pca9532.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "ls1021a-tqmls1021a.dtsi"
> +
> +/ {
> +	model = "TQMLS102xA SOM on MBLS102xA";
> +	compatible = "tq,ls1021a-tqmls1021a-mbls102xa", "tq,ls1021a-tqmls1021a", "fsl,ls1021a";
> +
> +	audio_mclk: audio-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};
> +
> +	backlight_dcu: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&pca9530 0 GPIO_ACTIVE_LOW>;
> +		status = "disabled";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		switch-1 {
> +			label = "S6";
> +			linux,code = <BTN_0>;
> +			gpios = <&pca9554_0 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		btn2: switch-2 {
> +			label = "S7";
> +			linux,code = <BTN_1>;
> +			gpios = <&pca9554_0 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		switch-3 {
> +			label = "S8";
> +			linux,code = <BTN_2>;
> +			gpios = <&pca9554_0 2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio_leds: gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <0>;
> +			gpios = <&pca9554_2 4 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "default-on";
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
> +			gpios = <&pca9554_2 5 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "default-on";
> +		};
> +
> +		led-2 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <2>;
> +			gpios = <&pca9554_2 6 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "default-on";
> +		};
> +
> +		led-3 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			function-enumerator = <0>;
> +			gpios = <&pca9554_2 7 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	lvds_encoder: lvds-encoder {
> +		compatible = "ti,sn75lvds83", "lvds-encoder";
> +		power-supply = <&reg_3p3v>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lvds_encoder_in: endpoint {};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				lvds_encoder_out: endpoint {};
> +			};
> +		};
> +	};
> +
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_3p3v>;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	hdmi_out: hdmi {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +		ddc-i2c-bus = <&i2c0>;
> +		status = "disabled";
> +
> +		port {
> +			hdmi_in: endpoint {
> +				remote-endpoint = <&sii9022a_out>;
> +			};
> +		};
> +	};
> +
> +	display: panel {
> +		backlight = <&backlight_dcu>;
> +		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> +		status = "disabled";
> +
> +		port {
> +			panel_in: endpoint {};
> +		};
> +	};
> +
> +	sound {
> +		compatible = "fsl,imx-audio-tlv320aic32x4";
> +		model = "ls1021a-mbls1021a-tlv320aic32";
> +		ssi-controller = <&sai1>;
> +		audio-codec = <&tlv320aic32x4>;
> +	};
> +
> +};
> +
> +&can0 {
> +	status = "okay";
> +	xceiver-supply = <&reg_3p3v>;

We generally end property list with 'status'.

> +};
> +
> +&can1 {
> +	status = "okay";
> +	xceiver-supply = <&reg_3p3v>;
> +};
> +
> +&dspi0 {
> +	bus-num = <0>;
> +	status = "okay";
> +};
> +
> +&enet0 {
> +	phy-handle = <&rgmii_phy0c>;
> +	phy-mode = "rgmii-id";
> +	mac-address = [ 00 00 00 00 00 00 ];
> +	status = "okay";
> +};
> +
> +&enet1 {
> +	tbi-handle = <&tbi1>;
> +	phy-handle = <&sgmii_phy03>;
> +	phy-mode = "sgmii";
> +	mac-address = [ 00 00 00 00 00 00 ];
> +	status = "okay";
> +};
> +
> +&enet2 {
> +	phy-handle = <&rgmii_phy04>;
> +	phy-mode = "rgmii-id";
> +	mac-address = [ 00 00 00 00 00 00 ];
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	tlv320aic32x4: audio-codec@18 {
> +		compatible = "ti,tlv320aic32x4";
> +		reg = <0x18>;
> +		clocks = <&audio_mclk>;
> +		clock-names = "mclk";
> +		ldoin-supply = <&reg_3p3v>;
> +		iov-supply = <&reg_3p3v>;
> +	};
> +
> +	pca9554_0: gpio-expander@20 {
> +		compatible = "nxp,pca9554";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		vcc-supply = <&reg_3p3v>;
> +		gpio-line-names = "BUTTON0", "BUTTON1",
> +				  "BUTTON2", "EMMC_SEL",
> +				  "DIP2", "DIP3",
> +				  "EXT_TOUCH_INT", "GPIO_1";
> +	};
> +
> +	pca9554_1: gpio-expander@21 {
> +		compatible = "nxp,pca9554";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		vcc-supply = <&reg_3p3v>;
> +		gpio-line-names = "PCIE_PWR_EN", "MPCIE_DISABLE#",
> +				  "MPCIE_WAKE#", "LCD_BLT_EN",
> +				  "LCD_PWR_EN", "EC1_PHY_PWDN",
> +				  "EC3_PHY_PWDN", "SGMII_PHY_PWDN";
> +	};
> +
> +	pca9554_2: gpio-expander@22 {
> +		compatible = "nxp,pca9554";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&extirq>;
> +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		vcc-supply = <&reg_3p3v>;
> +		gpio-line-names = "MUX_SEL0", "MUX_SEL1",
> +				  "MUX_SEL2", "MUX_SEL3",
> +				  "V95", "V96", "V97", "V98";
> +	};
> +
> +	sii9022a: hdmi-transmitter@3b {
> +		compatible = "sil,sii9022";
> +		reg = <0x3b>;
> +		iovcc-supply = <&reg_3p3v>;
> +		cvcc12-supply = <&reg_1p2v>;
> +		interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
> +		#sound-dai-cells = <0>;
> +		sil,i2s-data-lanes = <0>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				sii9022a_in: endpoint {};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				sii9022a_out: endpoint {
> +					remote-endpoint = <&hdmi_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	stmpe811: touchscreen@41 {
> +		compatible = "st,stmpe811";
> +		reg = <0x41>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
> +		vcc-supply = <&reg_3p3v>;
> +		vio-supply = <&reg_3p3v>;
> +
> +		gpio {
> +			compatible = "st,stmpe-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			/* GPIO 5-7 used for touch */
> +			st,norequest-mask = <0xf0>;
> +			gpio-line-names = "GPIO_ADC_I2C1_1",
> +					  "GPIO_ADC_I2C1_2",
> +					  "GPIO_ADC_I2C1_3",
> +					  "GPIO_ADC_I2C1_4";
> +		};
> +
> +		touchscreen {
> +			compatible = "st,stmpe-ts";
> +			status = "disabled";
> +		};
> +	};
> +
> +	pca9530: leds@60 {
> +		compatible = "nxp,pca9530";
> +		reg = <0x60>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "PWM_0", "PWM_1";
> +
> +		led-0 {
> +			type = <PCA9532_TYPE_GPIO>;
> +		};
> +
> +		led-1 {
> +			type = <PCA9532_TYPE_GPIO>;
> +		};
> +	};
> +
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&lpuart0 {
> +	status = "okay";
> +	linux,rs485-enabled-at-boot-time;
> +};
> +
> +&mdio0 {
> +	sgmii_phy03: ethernet-phy@3 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x03>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,dp83867-rxctrl-strap-quirk;
> +	};
> +
> +	rgmii_phy04: ethernet-phy@4 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x04>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +	};
> +
> +	rgmii_phy0c: ethernet-phy@c {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x0c>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +	};
> +};
> +
> +&pwm6 {
> +	status = "okay";
> +};
> +
> +&pwm7 {
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	status = "okay";
> +};
> +
> +&sata {
> +	/delete-property/ dma-coherent;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&usb3 {
> +	/*
> +	 * Although DR connector, VBUS is always driven, so
> +	 * restrict to host mode.
> +	 */
> +	dr_mode = "host";
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
> new file mode 100644
> index 0000000000000..24ad4a76fe597
> --- /dev/null
> +++ b/arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include "ls1021a.dtsi"
> +
> +/ {
> +	model = "TQMLS102xA SOM";
> +	compatible = "tq,ls1021a-tqmls1021a", "fsl,ls1021a";
> +
> +	reg_3p3v_som: regulator-3p3v-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V_SOM";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&esdhc {
> +	compatible = "fsl,esdhc", "fsl,ls1021a-esdhc";

We usually order compatibles from the specific to the generic.

Shawn

> +	/* e-MMC over 8 data lines */
> +	bus-width = <8>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	/* MC34VR500 DC/DC regulator at 0x8 */
> +	/* On-board PMC at 0x11 */
> +
> +	sa56004: temperature-sensor@4c {
> +		compatible = "nxp,sa56004";
> +		reg = <0x4c>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +
> +	rtc0: rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
> +	};
> +
> +	m24c64_54: eeprom@54 {
> +		compatible = "atmel,24c64";
> +		reg = <0x54>;
> +		pagesize = <32>;
> +		read-only;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +};
> +
> +&mdio0 {
> +	tbi1: tbi-phy@8 {
> +		reg = <0x8>;
> +		device_type = "tbi-phy";
> +	};
> +};
> +
> +&scfg {
> +	reg = <0x0 0x1570000 0x0 0x0e00>;
> +};
> +
> +&qspi {
> +	status = "okay";
> +
> +	qflash0: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <20000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		reg = <0>;
> +	};
> +};
> -- 
> 2.34.1
> 
