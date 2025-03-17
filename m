Return-Path: <linuxppc-dev+bounces-7150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AFA6570C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 17:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGfq95RqWz2yqt;
	Tue, 18 Mar 2025 03:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742227301;
	cv=none; b=PG34Tp8vFVbndBhA1BePMumSj8xSeHydypbmp80VbSpoy3tWy6QD/fAZNTKRfMdkb5tEZ5WsKlyndhocIBNlLWM9qpiojm/u52VeHlX9SoLNMqvfGsuulaz6QZq+11vuPP3lyPSIlZkzKuGp5OrT2a21ZusdjJZ7dSk4V3hI9mrH1FmWupT1P+dAcWVMDWiI1cRUYxjAFcybfT6GdatOv2ZKAXUPHjd6GN/T1oMfC7QEQPoi9aR7vRYCiTEkcSnhXpvGfAfIs09TTJK2jRUlQd+ZFOgcqJxD8vX8jtNU1pAMLAciZybZMSXqhyz0CJ0gn7ujaisLenZrN6FtPy7sdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742227301; c=relaxed/relaxed;
	bh=/jDEgJeNohLYgPG9D+YIZRDGOig+nqUiFLdA1X0Tyo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiS0aHweyj35s7o2DWHYJpktUzgQJO9FFshZKacJ1zaqXAyHs9DeDBGge0pQ4zSLnUBv+lpBne+qMpi3mqCP1WjstzOwLYGQZ4WUSV++pZ+uwRMZ9hsJXrF9kUZ8e/Y73gg64eGa8UxUmpWrWjk2sE/qdz240N8Sv5UK5uAmMY7jsVyjUNIE/tb8kxhXQWjlHdmpTmQP+F6WzP0Jo2dtvVhZ8MLIwxEhtVhA+8g1FWVCmIJKyIOZGskAjePFpOINav5AIYLGv+0QFGWfsS876cNVS4w2Si81tjYuC9JVRsSyAO4pJ57Hg19aKBlZbfMDZKNS9Gtf0YyqYlcemeG3Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOJ7aJpI; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOJ7aJpI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGfq90WJ2z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 03:01:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2A9DA453EE;
	Mon, 17 Mar 2025 15:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0905CC4CEE3;
	Mon, 17 Mar 2025 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742227298;
	bh=aJ3IP71SO/W9NfRGjFTM7N+/kwSupocM7aNe9qVRBDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOJ7aJpIQ20nyMCGeBjFqGg1Jhcb2AzJUpo8g1Xhk3a/teE1uMfCJWQCyTiUsL/kf
	 nfEvWaQ8nytoiX5aGxOYplAVtFXJBwQRkAkipwl6rT4SsJNcUbDImnErS3L07tn13r
	 xkKVccxwbT3awyAhXnwDH8c+UJuEz/FfizEUyLDloYZMzzH8NF4uZwyVaEJQZRKLU7
	 ZFh9Id0HGx0/9E5GIq/gfVit0rjVclobVAHZLFx8MtCtfCTUFMCdp+UMzdiaUDF7Sx
	 bt7PUYz9ZSQo9K2hRiZUCPZhvZ8Eh9pWPd53xiJuNAqi/NrLIHKWldelYOv3SS7+f0
	 ot5949uIKvn2Q==
Date: Mon, 17 Mar 2025 11:01:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Crystal Wood <oss@buserror.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
Message-ID: <174222729663.55568.3356685384531262945.robh@kernel.org>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
 <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
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
In-Reply-To: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 13 Mar 2025 22:35:44 +0100, J. Neuschäfer wrote:
> In some scenarios, such as under the Freescale eLBC bus, there are raw
> NAND chips with a unit address that has a comma in it (cs,offset).
> For reasons of compatibility with historical device trees and
> readability of the unit addresses, this format is kept.
> 
> Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> addresses. Unfortunately $nonenames defined in bindings that reference
> raw-nand
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V4:
> - reintroduce patch to silence dtc validation error, after discussion
>   with Rob Herring and Miquèl Raynal
> - add some more detail to the commit message
> - remove unit address format rather than extending it
>   (old pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$")
> 
> V3:
> - remove patch after discussion with Miquèl Raynal
> 
> V2:
> - new patch
> ---
>  Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


