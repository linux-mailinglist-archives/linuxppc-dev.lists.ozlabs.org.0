Return-Path: <linuxppc-dev+bounces-6850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B9A5958B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 14:02:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBHB33QWPz2yLJ;
	Tue, 11 Mar 2025 00:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741611771;
	cv=none; b=DE6kXsJBNuOC3+WH6dR7eBI0jNJCEN+ZfEnPRDZoyMJGbMa1covEgOAw+28ysMEOD8pwx+6nMrWhFyxRXWdEzjwRiI8dJpeopIzH5us3oBZ6l8TWolUMO1JSFPaHJuIP1rWA+ok7MMWYI3G9mnMPzYkFzJ+uXPVQGd9Bjc+lbNGIh/6QR4YO7WYmRyKxxKxpeKouQLX07UgZJ1zdcJuhHAsF/sPaTAhap1JCVaHHqfjS86EERhMqO/6xK1FOW/cGTTLyO7zSgYORBhDFkP9QA8xFqSG/NL1zYbGDJiB2hWMMvgOakF+KMRdOUO9jFIUV7i8jk8BKffBYNllYtF/NKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741611771; c=relaxed/relaxed;
	bh=r2OK7bKuswLF3fA38xFjBzYyROXOVGj7wD/dA4j35wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogjufPqQoKHPFsEIjzDcLfPVwHeI2u13fYtWCvd93SJZZU0Wg0XrEEj1k4FRS3oe8sZgVT1WFr7xGLd7y9izlTJ4fmMP+SVXx3lt30vV7l4OJEKdJ6DmM/MfvwYdorGXRGAK1gzjgjxtJynxyiBntbBDxQ5w1tKVK/mslDQtZOzsuKCbLnBC6I4XCwnsgeROEQUoHksghnF0s3g4oZZYmhAPmS+jLMepMZJ2LPrgRG7OlqJo6CPBlxq2FoElCFHYEX5uXq8NwS63sVZEairFgbtz1BwkvzvahCJ51jDDz5OqQ2kOpmV8FMR/RRNNoXP+1RKjljFZNxnWykYqm2DHTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tRlts/Zh; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tRlts/Zh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBHB23zjcz2y34
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 00:02:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0E1A5C64E0;
	Mon, 10 Mar 2025 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E466AC4CEE5;
	Mon, 10 Mar 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741611767;
	bh=qyHh1D1vX+68dKTG+EegRL4UgZ0evFBOJqQTycLFst0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRlts/ZhNbYmFlrv133aUmOYU1WOKML75MIEjpre2hEcv3myqd87DyFLQEmRo1fSQ
	 Wt77rGT8CpCxMYXdxnlvGTDS7gVM/oq+0Yabg9KyRwCimrQgMYcva+lH7NZ8Ll9pXT
	 DjBQod9Nx2NN6R9+cyg0tr40cw8i1YvJ/mmVNrRyeTu5NnjxP5g70GRT1QK4r+m/eF
	 Xg1XMXbNVXmVRdwS2el6Qp8uB8QkqKQHLL2d4ouqkJ9uNiSPx5IvzOLHUcAatGa5Sv
	 //U55Hsf/t4AGYvngoH/4h0Px+Rys2VgQFM0d0Bt00bFVLeMhJJrU+h4lJckhhwp48
	 zmChkwQWd2oCg==
Date: Mon, 10 Mar 2025 08:02:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Crystal Wood <oss@buserror.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <174161174500.3899711.4362879691608337681.robh@kernel.org>
References: <20250308-ppcyaml-dma-v4-1-20392ea81ec6@posteo.net>
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
In-Reply-To: <20250308-ppcyaml-dma-v4-1-20392ea81ec6@posteo.net>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Sat, 08 Mar 2025 19:33:39 +0100, J. Neuschäfer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> I considered referencing dma-controller.yaml, but that requires
> the #dma-cells property (via dma-common.yaml), and I'm now sure which
> value it should have, if any. Therefore I did not reference
> dma-controller.yaml.
> 
> V4:
> - switch DMA controller node name (in examples) back to dma@ because the
>   dma-controller.yaml binding is not used.
> 
> V3:
> - Link: https://lore.kernel.org/r/20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net
> - split out as a single patch
> - restructure "description" definitions to use "items:" as much as possible
> - remove useless description of interrupts in fsl,elo3-dma
> - rename DMA controller nodes to dma-controller@...
> - use IRQ_TYPE_* constants in examples
> - define unit address format for DMA channel nodes
> - drop interrupts-parent properties from examples
> 
> V2:
> - part of series [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
>   Link: https://lore.kernel.org/lkml/20250207-ppcyaml-v2-5-8137b0c42526@posteo.net/
> - remove unnecessary multiline markers
> - fix additionalProperties to always be false
> - add description/maxItems to interrupts
> - add missing #address-cells/#size-cells properties
> - convert "Note on DMA channel compatible properties" to YAML by listing
>   fsl,ssi-dma-channel as a valid compatible value
> - fix property ordering in examples: compatible and reg come first
> - add missing newlines in examples
> - trim subject line (remove "bindings")
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 137 ++++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 125 +++++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 132 +++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  4 files changed, 394 insertions(+), 204 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


