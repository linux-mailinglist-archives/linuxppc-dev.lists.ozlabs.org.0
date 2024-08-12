Return-Path: <linuxppc-dev+bounces-37-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CF94F97D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:17:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HBRqNDvB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTR03TD8z2xgv;
	Tue, 13 Aug 2024 08:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HBRqNDvB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjTCx688fz2xHg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 08:07:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7080FCE10B7;
	Mon, 12 Aug 2024 22:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C407C4AF0D;
	Mon, 12 Aug 2024 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723500473;
	bh=hfNQdjFl3+0TDoQHZP71Q8L+ao31aSFSQPDJnD6kSEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBRqNDvBu1wkWO5iTmpwEXJHwLTYVqLkdUtLKnPfldmTxQaOkwkIvgceRz+3ahXbT
	 5Elhh67y1/QLfw58IvNm+owPDkf4rP5J8lF9v35OgDhpvabTMhup33VJGV2xnCQypi
	 Cm/zkh3DvXW3b0sC3HdnuOgfJ+NPUXAWoj7EkBVWFdyWzb0V7Eo0dIqHH3G6imk84R
	 S3F5Et6uCu5zeEeTFizvWpnbX11x3URGZk0lgKZSmA7PL3gsfLyUXxFRlZOvQ/HzcN
	 3uJVicvxi+6qyet7Z90KtXseNkmskOGj0NGk815b+mKgGVryrNWj7306hiYBfoR6H5
	 J90JUrvsQ/gcA==
Date: Mon, 12 Aug 2024 16:07:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: fsl: fsl,rcpm: fix unevaluated
 fsl,rcpm-wakeup property
Message-ID: <172350046483.2314917.7547438885110898301.robh@kernel.org>
References: <20240811153507.126512-1-krzysztof.kozlowski@linaro.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811153507.126512-1-krzysztof.kozlowski@linaro.org>


On Sun, 11 Aug 2024 17:35:07 +0200, Krzysztof Kozlowski wrote:
> Drop the RCPM consumer example from the binding (LPUART device node),
> because:
> 1. Using phandles is typical syntax, thus explaining it is not needed in
>    the provider binding,
> 2. It has 'fsl,rcpm-wakeup' property which is not allowed by LPUART
>    binding so it causes dt_binding_check warning:
> 
>    fsl,rcpm.example.dtb: serial@2950000: Unevaluated properties are not allowed ('fsl,rcpm-wakeup' was unexpected)
>      from schema $id: http://devicetree.org/schemas/serial/fsl-lpuart.yaml#
> 
> Alternatively, this property could be added to LPUART binding
> (fsl-lpuart.yaml), but it looks like none of in-tree DTS use it.
> 
> Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml         | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 

Applied, thanks!


