Return-Path: <linuxppc-dev+bounces-5005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA1A09574
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56v1FKvz3cYg;
	Sat, 11 Jan 2025 02:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522679;
	cv=none; b=RU/NV7E+q18TTVQOlhRxvNVtIOv7gfrQRTpB4+skaeRfAIo/1fgZHCuabbzLB9T1Z8YNBGnAt3VbCMmMjaJrfbcRCyYhhuWc3U1JqZ9745fGcXXO0ikWz35vDyHlPI7kZNz9mEnwafDVi6XY5ZjBv/LJZtJhLiyw7Oo+NfLXVKUcTokturkS1KMQP975tr+hg3Usl6Fc2qJQ4nkd3IzFqbQw3xJG+ybOWFvdq9+38lob3k5U4AdlJHCC25Rhskn85pN6JOn+9UVhfkuWyigqf/UJCyd3x6S916Q4tOFwXbR+Qb/Rn3v9xwPbXjQRVhXk7gw5txlnmdbf+H9HCxt7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522679; c=relaxed/relaxed;
	bh=2aeRASE5AXLAeqfRdhKAra/5MXNROVaC721h8tLiqCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifL7vIo429NjUgrvusaReV4oeQm9DnHPNYyZk5BMC7bO6HoWDthva3YzqtWdzdleQcmUBHH8hCXcpppg867UV1N+pIbQy31vJoUJVATIS/8b9EJTPlbhz51jWGsvbL0aqhfH9idrBi9Fi/3Yx6azJAJh3VXZctXCI7GpKZPYYvw32y3lf4dLgkTSv9uKM1iyVDk17a/K8DT11Btl8IEaQmgFUNRccaBkFGcG9oCmCj4Kjffq88qXpTjHwzu2ywQmDFRJzIn5g+KIc5da5cNhLfJMxICb4XT5BMVv5jiazFrcgSzGTyW08jpAXmvXWohNTkBhp7Hunffcv5UT349BcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hym/avwP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hym/avwP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV56t0bRWz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32D365C4779;
	Fri, 10 Jan 2025 15:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CCEC4CEE0;
	Fri, 10 Jan 2025 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736522675;
	bh=jorlm+xDAVk8B2sOdzLzRlCm30bRxtIDYEa4t02Ylw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hym/avwPN/kU+pinShJ3oJwHYpvcDD4wzc0qTrCjKAowF3FHTIyCKy/+6HzWxcUJt
	 nSg03OWO5XqskSJLzAFfsNquEVJnQ7W49WfdsRjfHX4+L3JUTaw8ySeIzWR6pxgU6u
	 TCSyQ1rQzUBlP2KZ5wmwKgKxUCsevW7Ibctl0CaroXsgXZQT14TR14Ql490OJcWUmv
	 I2H82O5axK29nwqRsxBdqx9FUMBn4qaD6tG3tBLkWB6KiD/w3G94KEg5eyBm4KuG6G
	 6UjVc7B4QqU3PjvYd9C65/0ev3Co+j0DDHxHgONj1o1JZTwfFplhbz1cSboJMucw0p
	 cRgBpxR2v0DsA==
Message-ID: <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>
Date: Fri, 10 Jan 2025 16:24:27 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
To: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
>  arch/powerpc/boot/dts/Makefile          |   1 +
>  arch/powerpc/boot/dts/lancom-nwapp2.dts | 276 ++++++++++++++++++++++++++++++++
>  2 files changed, 277 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> index 6aee895d5baaa2c978d4b1c82a6d198d9e166ea2..43e20d8b776b1716a91e6ec8e135c0a45c8e8c77 100644
> --- a/arch/powerpc/boot/dts/Makefile
> +++ b/arch/powerpc/boot/dts/Makefile
> @@ -6,5 +6,6 @@ dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.
>  
>  dtb-$(CONFIG_MPC831x) += \
>  	kmeter1.dtb \
> +	lancom-nwapp2.dtb \
>  	mpc8313erdb.dtb \
>  	mpc8315erdb.dtb
> diff --git a/arch/powerpc/boot/dts/lancom-nwapp2.dts b/arch/powerpc/boot/dts/lancom-nwapp2.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..d46d94c27ecb91db32c8acb4136cb6e8d0df52f5
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/lancom-nwapp2.dts
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2024 J. Neuschäfer
> +//
> +// LANCOM NWAPP2, marketed as:
> +// - LANCOM L-321agn Wireless (R2)
> +// - LANCOM L-322agn dual Wireless (R2)
> +// - LANCOM L-322E Wireless
> +#include "mpc8314e.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	compatible = "lancom,nwapp2", "fsl,mpc8314e";

Missing bindings. Please run scripts/checkpatch.pl and fix reported
warnings. After that, run also `scripts/checkpatch.pl --strict` and
(probably) fix more warnings. Some warnings can be ignored, especially
from --strict run, but the code here looks like it needs a fix. Feel
free to get in touch if the warning is not clear.


> +	model = "LANCOM NWAPP2";
> +
> +	memory {
> +		reg = <0x00000000 0x08000000>;	// 128MB at 0
> +	};

...

> +
> +	led-power-top {
> +		label = "multicolor:power-top";
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_MULTI>;
> +		function = LED_FUNCTION_POWER;
> +		leds = <&led_power_top_red>, <&led_power_top_green>;
> +	};
> +
> +	led-wlan-top {
> +		label = "multicolor:wlan-top";
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_MULTI>;
> +		leds = <&led_wlan_top_red>, <&led_wlan_top_green>;
> +	};
> +};
> +
> +&gpio {
> +	gpio-line-names =
> +		/*  0 -  7 */ "DEBUG#", "RESET_BTN#", "", "EXP_LATCH", "", "", "", "PCIE_RST#",
> +		/*  8 - 15 */ "", "", "BOARD_RST", "", "", "", "", "",
> +		/* 16 - 23 */ "", "", "WDT_TOGGLE", "", "", "", "PHY_RST#", "",
> +		/* 24 - 31 */ "", "", "", "", "", "", "", "";
> +};
> +
> +&localbus {
> +	status = "okay";
> +	ranges = <0x0 0x0 0xfe000000 0x00008000>;
> +
> +	nand@0,0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "fsl,mpc8315-fcm-nand",

Compatible is always the first property.

> +			     "fsl,elbc-fcm-nand";
> +		reg = <0x0 0x0 0x2000>;

reg follows.

> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +



Best regards,
Krzysztof

