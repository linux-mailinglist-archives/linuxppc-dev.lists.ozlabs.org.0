Return-Path: <linuxppc-dev+bounces-12423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3113DB8A151
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 16:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSwSP03c1z3cdR;
	Sat, 20 Sep 2025 00:51:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758293492;
	cv=none; b=B4pFOyRZRdaknoFKY8OZf/wURTcHl2L9lgvn2eB9rhIJ6qEJ5E7VvLZeapdkmyuDbHvKfICguWs3dxbhRE4/kEmbdQCOJC9wTAKSO4+WM5l2nyAh5zlWmIvMARGERIop0ES4EUJfwFOT1IBrYben7iE6BaPSD40QNGbu+EPq6aJUyukDFfIc7oZsQNG+4UTHJNqYwscKgXlsBCt/9yxi8yscbu082Kof6SUSGPpvik9DLmyTWg/Bv+PkwTeLIw8SW8Ow0dJIRfXpR/uRgNvXA9orAWAeAnyVCwuEYFK3oGiaZ1GJIb/6XtYWrHG4NIBPXDPT7AVq3d7hpHdOh5To5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758293492; c=relaxed/relaxed;
	bh=raGRLi7KUiHui4EIC3GAiX5YcJdKLWe9zemHQCJZ3iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j00A/UJr52KUeUy/kZ+t9U+0c7jDIiD3oftxUkA8cl7BBRdAQLhY0jQXc9Z4PYMFDLYNWBew65CFejXf07jY6ljkZe87Q7CeSBWVwMRnmTYl099OvVTWX8d6LRhA0LhbHSQEff2r+5w2FHdadA7nsIn0CVNkvDAZOaqAbqkmb7lx3UPH2nnwvlOYMABMAQb2KN/KFuTwp4ewMRjqH+zwZtOvTVOFCrJNjfkyZp4Wnm+Zh31PL70qsR2ZIB4ht/5UM05aNPGNY1p7sc6GJ42b+blayPsYY+Kes88zhNSGtQm6HzYU7gwEQfPfN1K5S5Oj5tckEN9FE93Jb6XSWN+iLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MVYAu8fd; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MVYAu8fd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSwSM5jpsz3cd6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 00:51:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0905B60194;
	Fri, 19 Sep 2025 14:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99218C4CEF0;
	Fri, 19 Sep 2025 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293488;
	bh=ltSbKh4n47FzGRqG8/CEVAcFRLma3NAxjpUJcx3cn0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVYAu8fd2IftIHC95aUjjJiEO0whJ69qIM7P7FPm66q/1KYPBQZcRi+FQnrndtgO2
	 bVpjt/Usk9yzCb9XU208L1bGvJEzZlx0yUYq8iyZNZIST/ARjUfNfSTKCHbW33xyL8
	 Pn9VVgK0KUZr1uCxcTcSXz0H2J8JR4jVwaA9NCGHBHfJhzzVuykUUXGPCqM+x1TXNz
	 E6qWOxQ8BfccX49o2P8koeGXZU32rRUplPa3YZclRuSwXkH1p5W+85e/gfb2NJ4O/9
	 NA3VHk7zSBFOqO6G43f74qadqFJNYKBjn4u2OXR4IeVMfuC5kPK23SFq53iIK/NdoI
	 8/uu0CSg55RLQ==
Date: Fri, 19 Sep 2025 09:51:27 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20250919145127.GA852815-robh@kernel.org>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
 <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025 at 06:23:26PM +0200, Christophe Leroy wrote:
> Convert QE QPIO devicetree binding to DT schema.

Why is this in linux-next when it still needs review? Anything in 
linux-next already gets removed from my review queue (patchwork), so 
you're lucky I'm looking at it. It's also not tested probably for the 
same reason that b4 couldn't figure out how to apply the series.

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v6: Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.
> ---
>  .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 49 +++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +---------
>  2 files changed, 50 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..0dd9c0e6ca39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#

Did you test this? No, because this is wrong and the tools will tell you 
so I don't have to.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,chip-qe-pario-bank

You have to list out every <chip>. Lots of examples in the tree, but 
like this:

oneOf:
  - items:
      - enum:
          - fsl,mpc8360-qe-pario-bank
          - fsl,mpc8569-qe-pario-bank
      - const: fsl,mpc8323-qe-pario-bank
  - const: fsl,mpc8323-qe-pario-bank


> +      - const: fsl,mpc8323-qe-pario-bank
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio-controller@1400 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    gpio-controller@1460 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1460 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };

We don't need 2 examples of the same thing.


