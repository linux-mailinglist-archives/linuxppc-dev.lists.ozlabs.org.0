Return-Path: <linuxppc-dev+bounces-5580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B5A1D04A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:41:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhG312p1Dz3028;
	Mon, 27 Jan 2025 15:41:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737952893;
	cv=none; b=btBAizQMt+z8W9HalyWNZkgRVpjEaAYH/K8X3ph7a0YjkTJ/Xt9I7aKFzFZdio7PSb+g8auub/bkJKNnPcAcid/mKSC+Lemnws6Xn/lbJQtFZs9OJgMnjYxQAIuR9hs/R9Bn78rAP4gEBNsLMFeakKtCeRHypkukHXvGwJvjLINAjEjJw2RLR7aWdXe6QPcUuyXUCQWef+JmcJjAmrt0fNmzNUjtLgaixEAEAy8i3f+fZXeOCX+tQEcALVzI1D5THTEMM1SbmyN8krrVmVBV571YR/FgiN5A4fA3bhLEJxGv+nfOvNBuOjaDTRwnJNDtxsOzYvrHBVKJC594Ymqcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737952893; c=relaxed/relaxed;
	bh=g6hpCNOHAkw8FbzTL6GPQVNUkU1WgJvN02tvQb+KODk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caI6d4te5fPGddlWv/Ne1x5TE/Bpfan/w/HAdWG+W479co5w00VxcYEbIKvPVjwOmcvtulhU9sHaen6KmvaGIBaxquNeRkAX0omeHVfOOwS6OOFL50crOHbLXVjPAtDDSLMl9E/KHP5P2HlKZBUEthnVeY1nO23+GnsN+U13ecE/jmeyPbLzj+0DNmguAqrw9udpC6BgJ/qpByM9MOFGcNq+lZYfDdq8tCVvQDNakdYmY/ymcsDoyECKSEGRbS60lC8nZ8pzN8GWgOLa/HdPWCsZ7vKrkLq0q6/l/1RRQPkpd6B/YAAK8RXW2YuQnRmLD2WHFjI4fkMpRPJWF4qtMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/fi1Mi5; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/fi1Mi5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhG3044XLz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:41:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A09D45C2953;
	Mon, 27 Jan 2025 04:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34971C4CED2;
	Mon, 27 Jan 2025 04:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737952889;
	bh=TJLe4DNAGbVSG/1gbOrX3l9JsT0UDft2vaS9TWA7RVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/fi1Mi5Hd8yfuhdgfwsmXpv6HOOJa7czobvfXBf7zbCtn1JOf6VEhp3SolzSBBjd
	 OsRA7WKEapv+TJW8f614Fo1mxhahSRJTtjFRGqSNm9iZ07t4TGjxQZFr5CI3V5AiiW
	 TgThQ1a+WE7xzXEagL+PKuBTojMyfxJvQPZlN4FTBPpBN3K3YqtpxQMH1wOLQzmj4o
	 MsR104p6ZAttj6bY/Oc5g/gzfOoL0qPAXRCJGrzpG8QyhlkfiR7wbucj74eSlFwOac
	 bQ7Xg/S+vACRZfpNuNy78AVL+lsg9WH3xAH75ymPpiDGbdYrLkLnOJ/SRpDk+PHKn3
	 /s4fzmLpIDmPg==
Date: Sun, 26 Jan 2025 22:41:28 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Convert fsl,sec-2.0 binding to
 YAML
Message-ID: <20250127044128.GB3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:58:58PM +0100, J. Neuschäfer wrote:
> Convert the Freescale security engine (crypto accelerator) binding from
> text form to YAML. The list of compatible strings reflects what was
> previously described in prose; not all combinations occur in existing
> devicetrees.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 +++++++++++++++++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
>  2 files changed, 139 insertions(+), 65 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5ae593e60987e175413c3a082c9466f09f642bc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net.
> +
> +properties:
> +  compatible:
> +    description: |

Don't need '|'. I imagine there are more in the series, but will let you 
find the rest.

> +      Should contain entries for this and backward compatible SEC versions,
> +      high to low. Warning: SEC1 and SEC2 are mutually exclusive.
> +    oneOf:
> +      - items:
> +          - const: fsl,sec3.3
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec1.2
> +          - const: fsl,sec1.0
> +      - items:
> +          - const: fsl,sec1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,num-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: An integer representing the number of channels available.

minimum: 1
maximum: ?

> +
> +  fsl,channel-fifo-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      An integer representing the number of descriptor pointers each channel
> +      fetch fifo can hold.

Constraints?

> +
> +  fsl,exec-units-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what execution units (EUs) are available.
> +      EU information should be encoded following the SEC's Descriptor Header
> +      Dword EU_SEL0 field documentation, i.e. as follows:
> +
> +        bit 0  = reserved - should be 0
> +        bit 1  = set if SEC has the ARC4 EU (AFEU)
> +        bit 2  = set if SEC has the DES/3DES EU (DEU)
> +        bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> +        bit 4  = set if SEC has the random number generator EU (RNG)
> +        bit 5  = set if SEC has the public key EU (PKEU)
> +        bit 6  = set if SEC has the AES EU (AESU)
> +        bit 7  = set if SEC has the Kasumi EU (KEU)
> +        bit 8  = set if SEC has the CRC EU (CRCU)
> +        bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> +
> +      remaining bits are reserved for future SEC EUs.

So:

maximum: 0xfff

> +
> +  fsl,descriptor-types-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what descriptors are available. Descriptor type
> +      information should be encoded following the SEC's Descriptor Header Dword
> +      DESC_TYPE field documentation, i.e. as follows:
> +
> +        bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> +        bit 1  = set if SEC supports the ipsec_esp descriptor type
> +        bit 2  = set if SEC supports the common_nonsnoop desc. type
> +        bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> +        bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> +        bit 5  = set if SEC supports the srtp descriptor type
> +        bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> +        bit 7  = set if SEC supports the pkeu_assemble descriptor type
> +        bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> +        bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> +        bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> +        bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> +
> +      ..and so on and so forth.
> +
> +required:
> +  - compatible
> +  - reg
> +  - fsl,num-channels
> +  - fsl,channel-fifo-len
> +  - fsl,exec-units-mask
> +  - fsl,descriptor-types-mask
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* MPC8548E */
> +    crypto@30000 {
> +        compatible = "fsl,sec2.1", "fsl,sec2.0";
> +        reg = <0x30000 0x10000>;
> +        interrupts = <29 2>;
> +        interrupt-parent = <&mpic>;
> +        fsl,num-channels = <4>;
> +        fsl,channel-fifo-len = <24>;
> +        fsl,exec-units-mask = <0xfe>;
> +        fsl,descriptor-types-mask = <0x12b0ebf>;
> +    };
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt b/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> deleted file mode 100644
> index 125f155d00d052eec7d5093b5c5076cbe720417f..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> -
> -Required properties:
> -
> -- compatible : Should contain entries for this and backward compatible
> -  SEC versions, high to low, e.g., "fsl,sec2.1", "fsl,sec2.0" (SEC2/3)
> -                             e.g., "fsl,sec1.2", "fsl,sec1.0" (SEC1)
> -    warning: SEC1 and SEC2 are mutually exclusive
> -- reg : Offset and length of the register set for the device
> -- interrupts : the SEC's interrupt number
> -- fsl,num-channels : An integer representing the number of channels
> -  available.
> -- fsl,channel-fifo-len : An integer representing the number of
> -  descriptor pointers each channel fetch fifo can hold.
> -- fsl,exec-units-mask : The bitmask representing what execution units
> -  (EUs) are available. It's a single 32-bit cell. EU information
> -  should be encoded following the SEC's Descriptor Header Dword
> -  EU_SEL0 field documentation, i.e. as follows:
> -
> -	bit 0  = reserved - should be 0
> -	bit 1  = set if SEC has the ARC4 EU (AFEU)
> -	bit 2  = set if SEC has the DES/3DES EU (DEU)
> -	bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> -	bit 4  = set if SEC has the random number generator EU (RNG)
> -	bit 5  = set if SEC has the public key EU (PKEU)
> -	bit 6  = set if SEC has the AES EU (AESU)
> -	bit 7  = set if SEC has the Kasumi EU (KEU)
> -	bit 8  = set if SEC has the CRC EU (CRCU)
> -	bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> -
> -remaining bits are reserved for future SEC EUs.
> -
> -- fsl,descriptor-types-mask : The bitmask representing what descriptors
> -  are available. It's a single 32-bit cell. Descriptor type information
> -  should be encoded following the SEC's Descriptor Header Dword DESC_TYPE
> -  field documentation, i.e. as follows:
> -
> -	bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> -	bit 1  = set if SEC supports the ipsec_esp descriptor type
> -	bit 2  = set if SEC supports the common_nonsnoop desc. type
> -	bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> -	bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> -	bit 5  = set if SEC supports the srtp descriptor type
> -	bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> -	bit 7  = set if SEC supports the pkeu_assemble descriptor type
> -	bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> -	bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> -	bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> -	bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> -
> -  ..and so on and so forth.
> -
> -Example:
> -
> -	/* MPC8548E */
> -	crypto@30000 {
> -		compatible = "fsl,sec2.1", "fsl,sec2.0";
> -		reg = <0x30000 0x10000>;
> -		interrupts = <29 2>;
> -		interrupt-parent = <&mpic>;
> -		fsl,num-channels = <4>;
> -		fsl,channel-fifo-len = <24>;
> -		fsl,exec-units-mask = <0xfe>;
> -		fsl,descriptor-types-mask = <0x12b0ebf>;
> -	};
> 
> -- 
> 2.48.0.rc1.219.gb6b6757d772
> 

