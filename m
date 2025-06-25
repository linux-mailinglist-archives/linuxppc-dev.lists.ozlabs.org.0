Return-Path: <linuxppc-dev+bounces-9791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05DAE8F39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 22:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSCfY4TdYz307q;
	Thu, 26 Jun 2025 06:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750882357;
	cv=none; b=jAA17z+uJT/5jtW4WuTEn5ibdnwzgg0mDi8Md2cDJvbzzamocs0iD3IZ6UqydClj3OR47DRjbniJNiOgApDfM8YJAk61yViwAK/pQhgQk1389jgPFf3XespedKAhLWOwgZs1VMwaplDqcb9FhFPQkQy9Zz/k9XJS9h+q0Cevgai4/UH/H5KzWqrhWSO8VIBkIlCRD+lPrVaPBllRzLMv3SCF6GM53A5zp0IB7S+NGWi1AfcbzEocRjAyrspqkgG2H8Bv6KXYWr+Zp3Z9USawDvG+cwuO5xBbSiXEVI7H3gUu+1qzENdiUQF+nhX169/Q+4niO5HdsIm5vzSJb3TrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750882357; c=relaxed/relaxed;
	bh=9Sm/T7CYUS/dB3VGB3sR8lrBXoPXRgt5/1BjEHJnRmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zsy4aCSKJY2rYQ9t+27P2PYwAl6q+SAcEtbx28gqqedDR2Zh66qpw+iyHUsz17VNNp7r1AciZjAM0NJda9BHzN900tGs0N7oAksDwTDQCo8b9Y04kaAD0dAGiACj5o2GOQ0LiQPGodNeKIo0rSIyD9UhdKmE57d7auhj3vHUuAJr86fTg7nvQNqk7/lfHGFthyHKB3ZBaLqHaiVLrl+rJ4Gawf4NA+o0cCRULbAcMsErDF26bxSXfuRddTyTYM1WjtuvjSdXCLIC1gzd426xYOCzJafgzjBDUXyK+/JuSmmLSTKvzi1btSfa8/j6mKIN/SNIeCU+FJ4egfDjYJG6sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m0VYGUGi; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m0VYGUGi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSCfX3gWpz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 06:12:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2F2E44E4B;
	Wed, 25 Jun 2025 20:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93B2C4CEEE;
	Wed, 25 Jun 2025 20:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882353;
	bh=vLWZngAGfCDpGI0elXfiXxVDXjZlkopXq/UkheYJOTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0VYGUGimSKzz5DTjTbgWDAi89aTOv4VUsxRCti22j5dEQm1MnHQIyb0sBCzIQCLp
	 LnNOHCd5rUR6uKgcdma8+YvjwTkxcH2hNd8VMtBfbNi9KbTe3DLRLqXKVsqXjoHzD7
	 0ste9wUPwCQD3/CsXpLTReTxttNUagX+ga1odwj1wxDD9nb+GzazO0hCyWaiE7AFyk
	 cohzJXMIEVgTx5pa+vIyJqj/SnLl2V0NJAN6qV1d/G0nl3/3P915Qp/y+nmTYe44uK
	 lB+MzMQ0fJuaf4ei0sFBe9uv2BKfsFadlNkZ41Rcutq7A30Axx7eAR4+Pnc5fujY02
	 DsH+G7yuNqACA==
Date: Wed, 25 Jun 2025 15:12:32 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert
 fsl,mpic-msi to YAML
Message-ID: <20250625201232.GA2128052-robh@kernel.org>
References: <20250611-msipic-yaml-v2-1-f2e174c48802@posteo.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-msipic-yaml-v2-1-f2e174c48802@posteo.net>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 11, 2025 at 11:42:09AM +0200, J. Neuschäfer wrote:
> As part of a larger effort to bring various PowerPC-related bindings
> into the YAML world, this patch converts msi-pic.txt to YAML and moves
> it into the bindings/interrupt-controller/ directory. The conversion may
> necessarily be a bit hard to read because the binding is quite verbose.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Rebase on v6.16-rc1
> - Address Conor Dooley's review comments:
>   - Add multiline marker (|) to preserve formatting
>   - Split 'reg' list in second example
>   - Rewrite version dependent information as an if/else schema
> 
> Link to v1: https://lore.kernel.org/r/20250403-msipic-yaml-v1-1-f4248475714f@posteo.net
> ---
> ---
>  .../interrupt-controller/fsl,mpic-msi.yaml         | 161 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/msi-pic.txt    | 111 --------------
>  2 files changed, 161 insertions(+), 111 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,mpic-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,mpic-msi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..89db7742c28b3650207b361bfa6fbaf4e69ccc45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,mpic-msi.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,mpic-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MSI interrupt controller
> +
> +description: |
> +  The Freescale hypervisor and msi-address-64
> +  -------------------------------------------
> +
> +  Normally, PCI devices have access to all of CCSR via an ATMU mapping.  The
> +  Freescale MSI driver calculates the address of MSIIR (in the MSI register
> +  block) and sets that address as the MSI message address.
> +
> +  In a virtualized environment, the hypervisor may need to create an IOMMU
> +  mapping for MSIIR.  The Freescale ePAPR hypervisor has this requirement
> +  because of hardware limitations of the Peripheral Access Management Unit
> +  (PAMU), which is currently the only IOMMU that the hypervisor supports.
> +  The ATMU is programmed with the guest physical address, and the PAMU
> +  intercepts transactions and reroutes them to the true physical address.
> +
> +  In the PAMU, each PCI controller is given only one primary window.  The
> +  PAMU restricts DMA operations so that they can only occur within a window.
> +  Because PCI devices must be able to DMA to memory, the primary window must
> +  be used to cover all of the guest's memory space.
> +
> +  PAMU primary windows can be divided into 256 subwindows, and each
> +  subwindow can have its own address mapping ("guest physical" to "true
> +  physical").  However, each subwindow has to have the same alignment, which
> +  means they cannot be located at just any address.  Because of these
> +  restrictions, it is usually impossible to create a 4KB subwindow that
> +  covers MSIIR where it's normally located.
> +
> +  Therefore, the hypervisor has to create a subwindow inside the same
> +  primary window used for memory, but mapped to the MSIR block (where MSIIR
> +  lives).  The first subwindow after the end of guest memory is used for
> +  this.  The address specified in the msi-address-64 property is the PCI
> +  address of MSIIR.  The hypervisor configures the PAMU to map that address to
> +  the true physical address of MSIIR.
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,mpic-msi
> +          - fsl,mpic-msi-v4.3
> +          - fsl,ipic-msi
> +          - fsl,vmpic-msi
> +          - fsl,vmpic-msi-v4.3
> +      - items:
> +          - enum:
> +              - fsl,mpc8572-msi
> +              - fsl,mpc8610-msi
> +              - fsl,mpc8641-msi
> +          - const: fsl,mpic-msi
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Address and length of the shared message interrupt
> +          register set
> +      - description: Address of aliased MSIIR or MSIIR1 register for platforms
> +          that have such an alias. If using MSIIR1, the second region must be
> +          added because different MSI group has different MSIIR1 offset.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 16
> +    description:
> +      Each one of the interrupts here is one entry per 32 MSIs, and routed to
> +      the host interrupt controller. The interrupts should be set as edge
> +      sensitive. If msi-available-ranges is present, only the interrupts that
> +      correspond to available ranges shall be present.
> +
> +  msi-available-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: First MSI interrupt in this range
> +        - description: Number of MSI interrupts in this range
> +    description:
> +      Define which MSI interrupt can be used in the 256 MSI interrupts.
> +      If not specified, all the MSI interrupts can be used.
> +      Each available range must begin and end on a multiple of 32 (i.e. no
> +      splitting an individual MSI register or the associated PIC interrupt).
> +
> +  msi-address-64:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      64-bit PCI address of the MSIIR register. The MSIIR register is used for
> +      MSI messaging.  The address of MSIIR in PCI address space is the MSI
> +      message address.
> +
> +      This property may be used in virtualized environments where the hypervisor
> +      has created an alternate mapping for the MSIR block.  See the top-level
> +      description for an explanation.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +anyOf:

allOf

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,mpic-msi-v4.3
> +              - fsl,vmpic-msi-v4.3
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 16

Don't you mean 'minItems: 16'? Otherwise, this schema has no effect.

I can fix these up when applying.

> +          description:
> +            Version 4.3 implies that there are 16 shared interrupts, and they
> +            are configured through MSIIR1.

