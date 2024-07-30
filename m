Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8369420E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 21:44:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h16IfaV0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYQf41M70z3d2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 05:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h16IfaV0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYQdP1JT0z3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 05:43:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FB14CE11EA;
	Tue, 30 Jul 2024 19:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED71C32782;
	Tue, 30 Jul 2024 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368613;
	bh=7ZWS8u9aPiBFISBPRpifvY/WoT4OE1+Bi2YojbT+WFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h16IfaV09C1EP1HeYxv9Lfjjb2QZyn6y/AGl00vvL51gux3ZdTtCtkgu1PIeevz3U
	 YrtJ9cB2kTu+C92kK9ODdHm62FWdQ9kRPww0iYG2WF2JZNknNKf7OJ4pBS+3Ra3ZUm
	 TLrcthVrzu2tpe2tHmCZayfZLHjFltdbNsnyxOaO4LmqVyj1w+bYWGy8ONNaxa3MT3
	 BqEVfWi00ONraIbPRf+advZiGJIkjyui2jnFDq/0hSCCWxMoRgmjqyHGJfDjvgL0dF
	 78gLkeyOjG83pes5QNqVGE+uugTbXEdwA/Ewsoz0mC6xJ4W6104pzswLOYoh/YY9Q2
	 rBxV0kM3qlooA==
Date: Tue, 30 Jul 2024 13:43:32 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <20240730194332.GA2029820-robh@kernel.org>
References: <20240729191143.1826125-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729191143.1826125-1-Frank.Li@nxp.com>
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, open list <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>, "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2024 at 03:11:42PM -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |  2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 91 +++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 --------------
>  3 files changed, 92 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> index 388102ae30cd8..3ec111f2fdc40 100644
> --- a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> +++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
> @@ -42,7 +42,7 @@ properties:
>          minItems: 1
>      description:
>        phandle to rcpm node, Please refer
> -      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +      Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
>  
>    big-endian:
>      $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> new file mode 100644
> index 0000000000000..6c6cda7f2b220
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Run Control and Power Management
> +
> +description:
> +  The RCPM performs all device-level tasks associated with device run control
> +  and power management.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,ls1012a-rcpm
> +          - fsl,ls1021a-rcpm
> +          - fsl,ls1028a-rcpm
> +          - fsl,ls1043a-rcpm
> +          - fsl,ls1045a-rcpm
> +          - fsl,p2041-rcpm
> +          - fsl,p5020-rcpm
> +          - fsl,t4240-rcpm
> +      - enum:
> +          - fsl,qoriq-rcpm-1.0
> +          - fsl,qoriq-rcpm-2.0
> +          - fsl,qoriq-rcpm-2.1
> +          - fsl,qoriq-rcpm-2.1+

You can't just allow any combination.

> +    minItems: 1
> +    description: |
> +      All references to "1.0" and "2.0" refer to the QorIQ chassis version to
> +      which the chip complies.
> +      Chassis Version         Example Chips
> +      ---------------         -------------------------------
> +      1.0                     p4080, p5020, p5040, p2041, p3041
> +      2.0                     t4240, b4860, b4420
> +      2.1                     t1040,
> +      2.1+                    ls1021a, ls1012a, ls1043a, ls1046a

The compatible lists above needs to match this.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#fsl,rcpm-wakeup-cells":
> +    description: |
> +      The number of IPPDEXPCR register cells in the
> +      fsl,rcpm-wakeup property.
> +
> +      Freescale RCPM Wakeup Source Device Tree Bindings
> +
> +      Required fsl,rcpm-wakeup property should be added to a device node if
> +      the device can be used as a wakeup source.
> +
> +      fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
> +      register cells. The number of IPPDEXPCR register cells is defined in
> +      "#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
> +      the bit mask that should be set in IPPDEXPCR0, and the second register
> +      cell is for IPPDEXPCR1, and so on.
> +
> +      Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
> +      mechanism for keeping certain blocks awake during STANDBY and MEM, in
> +      order to use them as wake-up sources.
> +
> +  little-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      RCPM register block is Little Endian. Without it RCPM
> +      will be Big Endian (default case).
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    rcpm: global-utilities@e2000 {
> +          compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
> +          reg = <0xe2000 0x1000>;
> +          #fsl,rcpm-wakeup-cells = <2>;
> +    };
> +
> +    serial@2950000 {
> +         compatible = "fsl,ls1021a-lpuart";
> +         reg = <0x2950000 0x1000>;
> +         interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +         clocks = <&sysclk>;
> +         clock-names = "ipg";
> +         fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
> +    };
