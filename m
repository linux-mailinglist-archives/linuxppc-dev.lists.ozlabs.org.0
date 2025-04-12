Return-Path: <linuxppc-dev+bounces-7632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FFCA86ED0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 20:37:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZj353Ft1z2xpn;
	Sun, 13 Apr 2025 04:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744483057;
	cv=none; b=LmW3UtchJd5KWQA92vv8MmY3b+2mHwf3HIE8Q7XX5YkCkETUMdHfPZNT6J9OdbiTRDQGvw7t05CbVSMHnXcgbEnh5CEvgwu5QwPrFYwqs8wj4+xL5jUMaF3wWjE3xzkjCbt3pGvSi9Xt5JG6n3Mr8GYMiSVkrZ0wN2RciA7duG0Ipu6jz6SkLD8xwep3nztQ6YdB8q4njw2NP8ATkD+2KABnxuKOcrFKJT+62/DNY4qzNtOw2KID3oxgWLPastZBPacrYHE9/PBGzJKzHpCdb68J+kjHrrNAJ/dYpA2qS564iEHlHJE9w2PzFJgiuiU3NTOsYZJdY8wo+Z/1tJotzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744483057; c=relaxed/relaxed;
	bh=PrNUaPWDjYYhvPGQquqEn7s7dsa0fPnH23NtwLKDWuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEIWlkQBD0yZWcyTEaLR1HQVIxtqNNhtB+MXvAqugKFZPqQt7/QWPwC4CqJsPCWavdpyoscldQd0axB1Zemy7rtqTB7I7g8VlYPcyQPsbDOKITVH1cVYFM2ztRvNsJsl3j/46sly3qf6gLumMjJfx0Zcn+0O7XBuldQUFoQBMkB67ATwzks3j8/YLzr8psydLudIC4xNpwedvoIkjVPdVsccaDapZaAM9T7Byu9RXXMYbgtPT4IsLZKaexExqVDcAt5JMZwyFwyq05j4yuVM0uimR8ZrYqTbgjIh3EeBbdR8VVXcRxqMBmtuAc7Sfg+OEd9luSMl2ddRydgldTFH4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sGY2UJk+; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sGY2UJk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZj342xQXz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 04:37:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB60C61130;
	Sat, 12 Apr 2025 18:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C5BC4CEE3;
	Sat, 12 Apr 2025 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744483053;
	bh=BpK5R2sMEdkLTQEHgR6WN8H07iIrsSB4lh+8YOdW9E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGY2UJk++YQ1QXmgTg8+wiGU2gcjReDVYbJr9JZQvfrf95buap1K864GDorOsjW5Y
	 eJ7/25SeCxcgJocaq8e82rZJ5O8/KHFwePtqbOGPEEtHWvY36KynDfMBDn4qtXptzR
	 twc8Ti6ObYZpmFrMBq5g1mo13eYpqpmr7RYaRcahoVxcXDVlkIKIH/bHK7kwgDjgWj
	 cDwSPYDs1voQFN7COJHN8kjDPiWgyCOde1agQXnZU8K3rOT2GsFpxEnq2WNLFXTJmj
	 ijDXQIMgXK8xx4ScvQNfhXlfgX2rpe+8WKFLbKBTqIdn200Up6jaY0diylNwJo2sP+
	 UZ3SzSyBu8MhQ==
Date: Sat, 12 Apr 2025 13:37:32 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <20250412183732.GA1442430-robh@kernel.org>
References: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 12, 2025 at 02:49:38PM +0200, J. Neuschäfer wrote:
> This patch rewrites pmc.txt into YAML format. Descriptive texts are
> expanded or shortened in a few places to better fit today's conventions.
> 
> The list of compatible strings (and combinations of them) is based on
> existing device trees in arch/powerpc as well as compatible strings
> already mentioned in the plain-text version of the binding.
> 
> One thing I didn't handle are soc-clk@... nodes as seen in
> Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Rebase on v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> ---
> 
> Note: The examples include a consumer (sata@19000), to demonstrate how
> sleep specifiers work. I've heard that "unrelated" nodes in examples are
> generally discouraged, but I'm not sure if it's better to keep it or to
> drop it in this example.

I'd drop. Unless you want to fix the error. There's nothing really 
unique with how 'sleep' property works.

> ---
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 --------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 159 +++++++++++++++++++++
>  2 files changed, 159 insertions(+), 63 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt b/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
> deleted file mode 100644
> index 07256b7ffcaab2ba57b33cf279df45d830ce33b3..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -* Power Management Controller
> -
> -Properties:
> -- compatible: "fsl,<chip>-pmc".
> -
> -  "fsl,mpc8349-pmc" should be listed for any chip whose PMC is
> -  compatible.  "fsl,mpc8313-pmc" should also be listed for any chip
> -  whose PMC is compatible, and implies deep-sleep capability.
> -
> -  "fsl,mpc8548-pmc" should be listed for any chip whose PMC is
> -  compatible.  "fsl,mpc8536-pmc" should also be listed for any chip
> -  whose PMC is compatible, and implies deep-sleep capability.
> -
> -  "fsl,mpc8641d-pmc" should be listed for any chip whose PMC is
> -  compatible; all statements below that apply to "fsl,mpc8548-pmc" also
> -  apply to "fsl,mpc8641d-pmc".
> -
> -  Compatibility does not include bit assignments in SCCR/PMCDR/DEVDISR; these
> -  bit assignments are indicated via the sleep specifier in each device's
> -  sleep property.
> -
> -- reg: For devices compatible with "fsl,mpc8349-pmc", the first resource
> -  is the PMC block, and the second resource is the Clock Configuration
> -  block.
> -
> -  For devices compatible with "fsl,mpc8548-pmc", the first resource
> -  is a 32-byte block beginning with DEVDISR.
> -
> -- interrupts: For "fsl,mpc8349-pmc"-compatible devices, the first
> -  resource is the PMC block interrupt.
> -
> -- fsl,mpc8313-wakeup-timer: For "fsl,mpc8313-pmc"-compatible devices,
> -  this is a phandle to an "fsl,gtm" node on which timer 4 can be used as
> -  a wakeup source from deep sleep.
> -
> -Sleep specifiers:
> -
> -  fsl,mpc8349-pmc: Sleep specifiers consist of one cell.  For each bit
> -  that is set in the cell, the corresponding bit in SCCR will be saved
> -  and cleared on suspend, and restored on resume.  This sleep controller
> -  supports disabling and resuming devices at any time.
> -
> -  fsl,mpc8536-pmc: Sleep specifiers consist of three cells, the third of
> -  which will be ORed into PMCDR upon suspend, and cleared from PMCDR
> -  upon resume.  The first two cells are as described for fsl,mpc8578-pmc.
> -  This sleep controller only supports disabling devices during system
> -  sleep, or permanently.
> -
> -  fsl,mpc8548-pmc: Sleep specifiers consist of one or two cells, the
> -  first of which will be ORed into DEVDISR (and the second into
> -  DEVDISR2, if present -- this cell should be zero or absent if the
> -  hardware does not have DEVDISR2) upon a request for permanent device
> -  disabling.  This sleep controller does not support configuring devices
> -  to disable during system sleep (unless supported by another compatible
> -  match), or dynamically.
> -
> -Example:
> -
> -	power@b00 {
> -		compatible = "fsl,mpc8313-pmc", "fsl,mpc8349-pmc";
> -		reg = <0xb00 0x100 0xa00 0x100>;
> -		interrupts = <80 8>;
> -	};
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bb2db8adb74c54fec5d07393573f156c63a9e886
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Power Management Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  The Power Management Controller in several MPC8xxx SoCs helps save power by
> +  controlling chip-wide low-power states as well as peripheral clock gating.
> +
> +  Sleep of peripheral devices is configured by the `sleep` property, for
> +  example `sleep = <&pmc 0x00000030>`. Any cells after the &pmc phandle are
> +  called a sleep specifier.
> +
> +  For "fsl,mpc8349-pmc", sleep specifiers consist of one cell.  For each bit that
> +  is set in the cell, the corresponding bit in SCCR will be saved and cleared
> +  on suspend, and restored on resume.  This sleep controller supports disabling
> +  and resuming devices at any time.
> +
> +  For "fsl,mpc8536-pmc", sleep specifiers consist of three cells, the third of
> +  which will be ORed into PMCDR upon suspend, and cleared from PMCDR upon
> +  resume.  The first two cells are as described for fsl,mpc8548-pmc.  This
> +  sleep controller only supports disabling devices during system sleep, or
> +  permanently.
> +
> +  For "fsl,mpc8548-pmc" or "fsl,mpc8641d-pmc", Sleep specifiers consist of one
> +  or two cells, the first of which will be ORed into DEVDISR (and the second
> +  into DEVDISR2, if present -- this cell should be zero or absent if the
> +  hardware does not have DEVDISR2) upon a request for permanent device
> +  disabling.  This sleep controller does not support configuring devices to
> +  disable during system sleep (unless supported by another compatible match),
> +  or dynamically.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: fsl,mpc8315-pmc
> +          - const: fsl,mpc8313-pmc
> +          - const: fsl,mpc8349-pmc
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-pmc
> +              - fsl,mpc8323-pmc
> +              - fsl,mpc8360-pmc
> +              - fsl,mpc8377-pmc
> +              - fsl,mpc8378-pmc
> +              - fsl,mpc8379-pmc
> +          - const: fsl,mpc8349-pmc
> +
> +      - items:
> +          - const: fsl,p1022-pmc
> +          - const: fsl,mpc8536-pmc
> +          - const: fsl,mpc8548-pmc
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8536-pmc
> +              - fsl,mpc8568-pmc
> +              - fsl,mpc8569-pmc
> +          - const: fsl,mpc8548-pmc
> +
> +      - const: fsl,mpc8548-pmc
> +
> +      - const: fsl,mpc8641d-pmc

1 enum for these 2.

Rob

