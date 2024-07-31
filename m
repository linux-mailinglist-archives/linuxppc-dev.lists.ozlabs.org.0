Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA92C9437BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 23:20:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9yVd2lX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ4l85WjRz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 07:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9yVd2lX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ4kS4mGBz3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 07:20:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 825FA6255E;
	Wed, 31 Jul 2024 21:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5F3C116B1;
	Wed, 31 Jul 2024 21:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722460812;
	bh=5Fj1Q/lUDhBXjkp75CAf4AT/JrWwYEZL9sY+S+Ln4H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9yVd2lXbkzILnqi9yLyP/0rumTwOpKdrwEGjipJji17psciiK7ak469kCJhYOZLR
	 uiYU3C9cIWIBq3JJwhN/OIQpBxAQ2ydaiSR78/XbcOt8wIDs3KkuPgtsVudU/EoAma
	 HV/BoMPKY8ERxWDf/lpAnXY6FPtHCUHSpO3dDnZXwYv0DEBdsdsh5fKwFJqtVGDSgD
	 DBRNerbRJYhwuHBRuyMham5jD8yvlTWMSJuB43wOvqGiTHlu67dW6ZyM9cE63pnzxH
	 wy/JruOuhf4wRaDHZ6MezB7ltIUbsbKLjLR6tlJhr5CzZy4S4CY1Fc4xqTS+2Me9m1
	 GoKow52eZrq5w==
Date: Wed, 31 Jul 2024 15:20:10 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Message-ID: <20240731212010.GA1918811-robh@kernel.org>
References: <20240731150420.2217925-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731150420.2217925-1-Frank.Li@nxp.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, imx@lists.linux.dev, conor+dt@kernel.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 11:04:20AM -0400, Frank Li wrote:
> Convert dt-binding rcpm from txt to yaml format.
> Add fsl,ls1028a-rcpm compatible string.
> 
> Additional changes:
> - Add missed compatible string fsl,<chip>-rcpm.
> - Remove map fsl,<chip>-rcpm to fsl,qoriq-rcpm-<version>.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - add missed compatible string
> - Remove compatible string map table
> - use oneof Item to align compatible string map table
> - Fix typo 1045a
> ---
>  .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |   2 +-
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 101 ++++++++++++++++++
>  .../devicetree/bindings/soc/fsl/rcpm.txt      |  69 ------------
>  3 files changed, 102 insertions(+), 70 deletions(-)
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
> index 0000000000000..762316ef4d150
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -0,0 +1,101 @@
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
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,ls1012a-rcpm
> +              - fsl,ls1021a-rcpm
> +              - fsl,ls1028a-rcpm
> +              - fsl,ls1043a-rcpm
> +              - fsl,ls1045a-rcpm
> +          - enum:

"const" for the fallbacks.

> +              - fsl,qoriq-rcpm-2.1+


> +        minItems: 1

Why? I don't see any .dts files without the fallback.

> +      - items:
> +          - enum:
> +              - fsl,p2041-rcpm
> +              - fsl,p3041-rcpm
> +              - fsl,p4080-rcpm
> +              - fsl,p5020-rcpm
> +              - fsl,p5040-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-1.0
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,b4420-rcpm
> +              - fsl,b4860-rcpm
> +              - fsl,t4240-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-2.0
> +        minItems: 1
> +      - items:
> +          - enum:
> +              - fsl,t1040-rcpm
> +          - enum:
> +              - fsl,qoriq-rcpm-2.1
> +        minItems: 1
