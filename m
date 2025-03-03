Return-Path: <linuxppc-dev+bounces-6654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8414A4C60F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 17:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z63YQ1R3wz3bgV;
	Tue,  4 Mar 2025 03:04:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741009327;
	cv=none; b=jFJ/LFzCWOrtATWMcCs2N4Xubd/TaqqJNxJJ6AnQwdc28L14DAW07+DZpnvQ7cYyOmrrXDfn3PWhQ2eGXl6okdXy151B0O0B9+bR/UbhpXBhGk5plf3RQznH6FaUISHGK80YhAnOZ0UrD+xgoOLl+LOzIA9iAzSJ4x9d7gNy0n8JideQepv2Vyol1vqiA/VP+hxgR3upaGLv1PkMkde7myTCytODaDZ9l44lcWn29QPOOdMgdxVzjlw6lK2fs0UsgC6H/oWo3Qad/+pu8Ul8Xxk3ttN68ZnaRiLgbSrOxXqR75LBUEsKr971Mm7p85Gn2QJAPwBZHbb0xdHMEPGeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741009327; c=relaxed/relaxed;
	bh=ejv1eC/zaiZJNsI2RPyFhIf+L8KNg8vO/s9DJl1mCto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1A8GzSr5HesK9PuhatJBgv2464AiPYVkp76GlMjFeM3lxrbRh55IS+L72aNFtdAgRJNC5EMjecOTiFJvpEr+qcs6D4yN2bD3Ij9Kr5eARwY2wYS08XTLUHhm7UrMrgcUsnYuhvtUKWhaEQcdnOTweip5eNdFZr2wk8y7ZOB31neqGTY9ns1hP6KRpWcNfr+UHGImvSN0ZhPCsROgfapcSVMGQkQoiaHtdEKVy5HxntdOvm3kEUdZ4cvuD9/2prJ6bjeRyhfZmbPlrbRTHB5NVdscoYAIHHUhW1Lk9zRg5u8oO7hOxlN0q97RgCZlw9w+gqdkKWV31ZiwpnP3nIjxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k7aarzRr; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k7aarzRr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z60NZ3bk6z2y92
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 00:42:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E85461206;
	Mon,  3 Mar 2025 13:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0938C4CED6;
	Mon,  3 Mar 2025 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741009322;
	bh=vrDxbcIJQqkSw75KhA73NGqZilboXIjAwfnFMaIawGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7aarzRrmLRsznWXpkijE8LUo25+hran6IjEWQuaXLrYb1b+NIPc1PFI8034OPHIe
	 OUOmb1DUuiaYiaDQ7Lo4x1pm3b6YTqdDxrl7lOOgOVWkmCTfCmF2rYgQm/ufqMAvYZ
	 /tdYJhy3fcNeC/ipdmAopssOdyqlYRj1OFY64lr8SazI6kYSqpIbdBQ1B8kiNuqhMc
	 IGgRiIHXYzK3uNjCwRwqdO3yYfV1VOfSoFMfGk+iU8ZTkqgdgRdcz2dN8O/KGtsnkX
	 +L3KCuL6YuHgke59P7VXrbYFqqHQVen5yT7a3Bzkx2rh1ayMvsy9fDETax5XZv3Zff
	 jS/b5faWidrjA==
Date: Mon, 3 Mar 2025 07:42:00 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	dmaengine@vger.kernel.org, Crystal Wood <oss@buserror.net>,
	linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <20250303134200.GA1710704-robh@kernel.org>
References: <20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net>
 <174059099427.2999773.4836262903761680275.robh@kernel.org>
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
In-Reply-To: <174059099427.2999773.4836262903761680275.robh@kernel.org>
X-Spam-Status: No, score=3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,RCVD_IN_XBL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 26, 2025 at 11:29:54AM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 26 Feb 2025 16:57:17 +0100, J. Neuschäfer wrote:
> > The devicetree bindings for Freescale DMA engines have so far existed as
> > a text file. This patch converts them to YAML, and specifies all the
> > compatible strings currently in use in arch/powerpc/boot/dts.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > I considered referencing dma-controller.yaml, but that requires
> > the #dma-cells property (via dma-common.yaml), and I'm now sure which
> > value it should have, if any. Therefore I did not reference
> > dma-controller.yaml.
> > 
> > V3:
> > - split out as a single patch
> > - restructure "description" definitions to use "items:" as much as possible
> > - remove useless description of interrupts in fsl,elo3-dma
> > - rename DMA controller nodes to dma-controller@...
> > - use IRQ_TYPE_* constants in examples
> > - define unit address format for DMA channel nodes
> > - drop interrupts-parent properties from examples
> > 
> > V2:
> > - part of series [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
> >   Link: https://lore.kernel.org/lkml/20250207-ppcyaml-v2-5-8137b0c42526@posteo.net/
> > - remove unnecessary multiline markers
> > - fix additionalProperties to always be false
> > - add description/maxItems to interrupts
> > - add missing #address-cells/#size-cells properties
> > - convert "Note on DMA channel compatible properties" to YAML by listing
> >   fsl,ssi-dma-channel as a valid compatible value
> > - fix property ordering in examples: compatible and reg come first
> > - add missing newlines in examples
> > - trim subject line (remove "bindings")
> > ---
> >  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 137 ++++++++++++++
> >  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 125 +++++++++++++
> >  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 132 +++++++++++++
> >  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
> >  4 files changed, 394 insertions(+), 204 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,elo-dma.example.dtb: dma-controller@82a8: '#dma-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.example.dtb: dma-controller@21300: '#dma-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,elo3-dma.example.dtb: dma-controller@100300: '#dma-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#

Just stick with 'dma' for node name as that's what .dts files are using 
and 'dma-controller' is reserved for users of DMA provider binding.

Rob

