Return-Path: <linuxppc-dev+bounces-9179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A00ACFA22
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jun 2025 01:44:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bD1JQ6Rltz2yPS;
	Fri,  6 Jun 2025 09:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749167078;
	cv=none; b=gpHKEs4F/F7qurf7Q7Qr/+aKfS8WlMGf/6XqFaTfL5g4ENIAkWFg/jRZVLQzUGv1FhZ6E0hVmut4y4bo3sdMlzEs2WK+YbQH+kM7rEeXHXQiRLn1A6Peh51EYVhkpapFuz7fjOuOxnT+0y33MRdQWkUxq1Stz1z37AuPsa0mLWmh97jX4hzBaP4+sy3PzfnDqG2pPSL1GB++NqPjxBY8kmZHy5UFtpk/lhLluXxLudGel2NSdn3gHLZnxlyxKto6z2muqqX2Hq1z4dz7q+Ksi+7sjgq0LgZFrgHIyW7u0dZCktKefvMALzQq/VOwh43TwYW37tiO4LYSVUdUxwBliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749167078; c=relaxed/relaxed;
	bh=Yj6Vz/uvAqZGn2tlIdZTWqPwE2FqVODDQybTQJtwCoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imJW+ecHALJRqMm36iBX1sggfhhn+j5Lyc6mhttqEG4vSS8FXajUbnKjjqqF0QkphrP65NfS180mH7Ps4734dMWOgT0vIUcV2kcz4snmPRNgYv/Ahs4GtCa/BDjZH3cy/OlygNsE0DVzprGgHoQUygkFT3QG/VsJtgE/TFVYXQ+8Oc6CVu3J5thlLC363r38qjhd7qwLCuOmZ39UiGFGe1htzTGqRPzEugFmX+hcBQdxCGTPjxYFES0Vq9J3melLMsuB5ccCiqh5OuDog75IjqSDz8aONd7e/VbV79fMpeZAS40YBkCsSqzUwsfG0XvPceEnSvpUZk1cQEelFcJ/vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HfK6jviX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HfK6jviX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bD1JQ122kz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jun 2025 09:44:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20D8E61F1D;
	Thu,  5 Jun 2025 23:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E592C4CEE7;
	Thu,  5 Jun 2025 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167074;
	bh=uLnzJMygHu8Tutkf6XRz1D8vcZXOGaOVsErURKnt+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfK6jviX+s81FJV1x7o2MMM+yujt7hf+LRO5tnojRkJ53FvdGAWd0WuV1yY8iK3CM
	 2FSQufCf9T9pVQOqhYkmROLIFrjYbPKa4+AzmJPqtlj/ioV40tWR5zAZ4a4os7B/im
	 /wk3eLBdBlcOUh54GWA2ij/D4okS7KSXg6NI+LDMIOW2qT41vjQVK3wRm1N7rCGkcY
	 14JwtjWwd3+xmZWz/qD/zAldBAY7EmMyDcUPaSq7OjSf1ZuiNzT71/kFMwoUx3bF05
	 e4aTb8qpbq6sS1eQKgo55vj9RK+LJHalRpTLuUNI/ArhwVXoC8dUb7wZ83BmlNBvIR
	 TjD/WiFDnIgRA==
Date: Thu, 5 Jun 2025 18:44:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for
 i.MX23 and i.MX28
Message-ID: <174915544909.3193294.9385556983515352599.robh@kernel.org>
References: <20250528183549.694434-1-Frank.Li@nxp.com>
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
In-Reply-To: <20250528183549.694434-1-Frank.Li@nxp.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 28 May 2025 14:35:48 -0400, Frank Li wrote:
> Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
> warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000:
>     failed to match any schema with compatible: ['fsl,imx23-digctl']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add more description about digctrl hardware module
> - fix double /
> ---
>  .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> 

Applied, thanks!


