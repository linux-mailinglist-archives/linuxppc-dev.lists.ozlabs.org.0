Return-Path: <linuxppc-dev+bounces-11642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EECB40F57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 23:25:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGf0G3gSpz3050;
	Wed,  3 Sep 2025 07:25:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756848302;
	cv=none; b=UYOGOaFquvtnhYXN1VWQ8eg4mE6+MfYMq6xsiy+ITQhEfAM1xXpFIcmjyCoUNHgNdZwhJvDhp/UQSdXBvVbfpMZsO+1MAWBPZi+lesdcb2GzJbMbQfRuroGEU5fA9ZlEaDnzphifYDzDTwT7asWiwZsSAn9j2hNFIOfn8in7nnvOZoyig9qdqBkBelk0ihSkn2GLFea2ef+WdYRCUMcnUNjtoWscHG7pGlKXJkVMd7h690c5NZ7E+SxkeuG1Q/Hf0C6KKydqSFKyV0LcQwyQLfs1SCz9s6xZkVc0ctrXB9TPU7MzJFpzvVQY4a89BThsnFi9IgUZm20whI7e7WO+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756848302; c=relaxed/relaxed;
	bh=kLNJNXAhbpZp8f92ANlBR1Z3x7HxYh/GbYA3fzeJAq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqdXGN/dVgC6ZEJAes2FW6DQH4eeCAsOAFsWgqLD69Y60u1fL0J9N/uzVQJDCCT1qljaZmvNfCJf62oH8kAkW+/I2lvieZNtPBu772dzm+peYOMdFD2SPVnwn4pboJkYk1BZpsrmxRQM+c7gMxlnsnXSDTm6FMZkoSxC3cnHzeoFalvuds2QFk13PlajFWzLraCRH2Uj2ZQ0eEyrlj3RAybIcajYsSmsabVIfg1UDPiuf92En6fQRrAzb/Xh8PJJ46/u2/ogDJzbi6kDzA9DukW1H77S2p61ARE4MLHhsMtM4Y9SmM314OTgKoJaihVAdIhFT15+N8pPRCXlZ7cgAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s+keo995; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s+keo995;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGf0F4d8zz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 07:25:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4C7D441F1;
	Tue,  2 Sep 2025 21:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772A0C4CEED;
	Tue,  2 Sep 2025 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756848299;
	bh=pIkxlL/RsKrNHjL9bzr/Ff/bVEvw0mwr+CfKjwjIOWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+keo995h383ZM6+v2G9KoeMPR42keu0j33nhQxYc6hfkUa2nW0X1VT4IikS1jlju
	 7BpXG4Tr+rbHR9sLEMO6qebGvsnUgQALfJ6iuUQLYwdm/TsGaL6hhJphBF5jk3cPFs
	 pmH9ySG+xHDliQ0PVjLWLx3URJVjO8AuyvndLsSqL40j750mGjHLoRYacugUjGiPSe
	 KrQQXllhd8pbTgz09P95VO70njQKboE5y8wbztLV+yerxWcae9AtTJYPPM0v0CnnYY
	 xTTqopJeLy+spwriyMqSMLmU67yEsqcWHy517VjzNj5OlTBErvr8WGdQmucpEQApWr
	 gGia+LdgY2fuA==
Date: Tue, 2 Sep 2025 16:24:58 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20250902212458.GA1184537-robh@kernel.org>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
> Convert QE QPIO devicetree binding to DT schema.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v5: New
> ---
>  .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 53 +++++++++++++++++++

This should move to bindings/gpio/

>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +--------
>  2 files changed, 54 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..e6ba319a75c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +description:
> +  Bindings for the Freescale QUICC Engine Parallel I/O (PARIO) GPIO controller.

Just drop if nothing more to say than 'title'.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,chip-qe-pario-bank
> +      - const: fsl,mpc8323-qe-pario-bank
> +
> +  reg:
> +    maxItems: 1
> +    description: Offset to the register set and its length.

Drop the description. That's every reg.

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
> +    qe_pio_a: gpio-controller@1400 {

Drop unused labels.

> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";

Doesn't match the schema. 

> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    qe_pio_e: gpio-controller@1460 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1460 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };

