Return-Path: <linuxppc-dev+bounces-5574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7ACA1CF39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 00:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh6zY22V2z2ygY;
	Mon, 27 Jan 2025 10:23:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737933785;
	cv=none; b=NC5BkEmNwLagvAdbZejh24bEfm4hHKsuKchEbhFXFwe3eu/iTSOisjKcjrVvGZuRq5VYTTBBA00YnLph2Kqwwgd5MNkCGWwgNnC+F1SqlPwY/7RD9qFvpN+8lwSmgZ19gsE1lwZPG/0v8MiRFN/zdKegEopCoWka+QtnC7kkKFxMRP3iNs746BbUE64xa3hv+XwRGeli1/Lb6VcfKLmkC5pR80rCcQKlrqXoyhx4AtIXiET+8TvhH1HBkQgFr9gtDSvRu3itL/5kVgFs8U2RaoFUlFcIyxf1Ub+2txdqfP/5JST5K9leJGfHYUTkmdLWerOyubhBwdox/D15DeTD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737933785; c=relaxed/relaxed;
	bh=v2BfypsHQV6lBwX7JDaI8ksDkK9W/jHT9UtUoTeIIIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHcngERb4sgJaIdTDg6EKFBUTDlddI/3mScuuBzPvB7XPRk1pOkZEEOBDpW/XpQdOSKbA/pOLdZnoSf4WT2c6nlpdOApHRD0n57BUiFNOJGGioEefyila9UpQpas3FcziN71E7RpM5m0sEVSD6sjY4LUy2+B+KJstbuo4jmZ7JFKB+Pr5GfIKQxVtaloMyzIom95fKbBqRypNLbABokuSJmJa+QWchM2/mzyLG0/BdFBjp4d8/AExqlEVRI+My2hbxcHMJh5bBVvn9mN3q4pdhJ1GMxOaug9N7slGlzIe1PPOaWK1zl5oIs7uMimQbJWt9cDMNljTxZlnvHrIjuIuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lj+Vkk+v; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lj+Vkk+v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh6zW72bnz2xmS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 10:23:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02AA75C5B98;
	Sun, 26 Jan 2025 23:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D0BC4CED3;
	Sun, 26 Jan 2025 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737933780;
	bh=Da9tXyLwkD2V/78EX2AhOGNwi0AShsbcsReVhEPDEw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lj+Vkk+vGxtjTS6EwdKU1jCUNvNvHFlIxXGAUR41Ztm2bT9SCao1tnEn7EC7CLGtd
	 w+jtJmbIIuCJ5FL+fSDbLf5mLVDCrj9H5WBC9CrqjTCE60bbYBpyJb0zb/G31MLLJB
	 AVohD5ONtpThjzmrIAFkrzdu/Jk0Iu+hNd0m3Dijszk8bBrPT/6dNrMy2+lwzTeHYc
	 OTaKo6NqvTWN9JBqnWIi00M602F730+lnrwNgO6i9tNbQGruumcaMfEi5pFhdEgezb
	 BnL8NHlzXJ9ohaIZxzMzDzk23J9GUNqrrKcbvQVI6FBqMLPEYJy5pNxg8NnNrbe9m6
	 oBhAqEEod6YOA==
Message-ID: <a9df1ae6-8779-4dc0-8f03-eda939c0e533@kernel.org>
Date: Mon, 27 Jan 2025 08:22:55 +0900
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
Subject: Re: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
To: j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 1/27/25 03:58, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Convert the Freescale PowerQUICC SATA controller binding from text form
> to YAML. The list of compatible strings reflects current usage.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/ata/fsl,pq-sata.yaml       | 59 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/ata/fsl-sata.txt | 28 ----------
>  2 files changed, 59 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6af31ffbcad5e9cc83118a0bd8eaf45351a2823f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale 8xxx/3.0 Gb/s SATA nodes
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  SATA nodes are defined to describe on-chip Serial ATA controllers.
> +  Each SATA port should have its own node.

Very unclear. The SATA nodes define ports or controllers ? Normally, a single
controller can have multiple ports, so the distinction is important.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8377-sata
> +              - fsl,mpc8536-sata
> +              - fsl,mpc8315-sata
> +              - fsl,mpc8379-sata
> +          - const: fsl,pq-sata
> +      - const: fsl,pq-sata-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4]
> +    description: |
> +      1 for controller @ 0x18000
> +      2 for controller @ 0x19000
> +      3 for controller @ 0x1a000
> +      4 for controller @ 0x1b000

Are you sure these are different controllers ? Are they not different ports of
the same controller ? Given that the previous text description define this as
"controller index", I suspect these are the port offsets and you SATA nodes
define ports, and not controllers.

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - cell-index
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    sata@18000 {
> +        compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
> +        reg = <0x18000 0x1000>;
> +        cell-index = <1>;
> +        interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-parent = <&ipic>;
> +    };
> diff --git a/Documentation/devicetree/bindings/ata/fsl-sata.txt b/Documentation/devicetree/bindings/ata/fsl-sata.txt
> deleted file mode 100644
> index fd63bb3becc9363c520a8fd06629fdc52c4d4299..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/ata/fsl-sata.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Freescale 8xxx/3.0 Gb/s SATA nodes
> -
> -SATA nodes are defined to describe on-chip Serial ATA controllers.
> -Each SATA port should have its own node.
> -
> -Required properties:
> -- compatible        : compatible list, contains 2 entries, first is
> -		 "fsl,CHIP-sata", where CHIP is the processor
> -		 (mpc8315, mpc8379, etc.) and the second is
> -		 "fsl,pq-sata"
> -- interrupts        : <interrupt mapping for SATA IRQ>
> -- cell-index        : controller index.
> -                          1 for controller @ 0x18000
> -                          2 for controller @ 0x19000
> -                          3 for controller @ 0x1a000
> -                          4 for controller @ 0x1b000
> -
> -Optional properties:
> -- reg               : <registers mapping>
> -
> -Example:
> -	sata@18000 {
> -		compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
> -		reg = <0x18000 0x1000>;
> -		cell-index = <1>;
> -		interrupts = <2c 8>;
> -		interrupt-parent = < &ipic >;
> -	};
> 


-- 
Damien Le Moal
Western Digital Research

