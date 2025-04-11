Return-Path: <linuxppc-dev+bounces-7620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A2A86514
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 19:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZ43S557dz3bvd;
	Sat, 12 Apr 2025 03:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744393844;
	cv=none; b=Rrg4Z4vo+FAp5T7/RylQPCJvIVTxQ4Sb6HBKZd2FZApWy9GBnRlnQIzhTMrEHg8qKA/BjFDsLzWeIEWKwDpwrBS1b3ZJ2gxZrT6E73yKnat5KKAcOQ4EI7Mb0GuOmCOrAF/qrBUA6Ren2gR9XBoomX2imEj3mSJkSARsue4j4OexqEZ16xfngaVhKNQqOeG8xODEFcy5IkSP+LJ4i2tuwXRIHM2g6XXiyJZ7TIExEzKCzOxCQr6l/e3/kBFqnQUArPaZhp63DJo6T8IkuShwVGgKsnnhp7Y0Z/FBMVdcfVgfL/ywJuvA/RGx435ZTnbd8/KCMg+/hDcS60HoAkmJww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744393844; c=relaxed/relaxed;
	bh=tzt555NgMlxfaZba00E+bYleFGUZTLvEiTlhTWiZW5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy98a5AjB65LvBJpxNTLfKF/PPsyn+HWqrajpi+gbsKwUJfBMozFC+UztWGHyYZFeSaSH56i8ywtKcJCii9C0t895Zp7iM8oLatXGO/8ouWMcRvi6LPXSOxLcUUE0FFXpRGPMSYU8jYk/VjkuNJhe6peVETm6aqlgf6tFXUGnjpnCxjqBJjYFcQV5T31NxCBAmnd1hO9FHwaM2SfNfJPiKPAw6ZVZjbBbfpgQnU94lARTz+I97ckcQM7JzWWCkUK9DUJecetA+CrljMUUn2MbfLeFYkTlNbnk9j1qWS33UcqHTJKn/T+bomVvGCDbJOzb2E/Q+hl5nFXvkM+GTrrtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c2H3sjhI; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c2H3sjhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZ43Q4ggMz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Apr 2025 03:50:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C07C44A52A;
	Fri, 11 Apr 2025 17:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C118C4CEE2;
	Fri, 11 Apr 2025 17:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744393837;
	bh=UgYRPhQRBiJ7R4mPcaCowJ6V4uNk97/yxaeTPsWPQMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2H3sjhIOEtN289F9ZQj5HeFpR+hz4IfKJNw6si8S8erQFWjQv9c98j/zZUpOKhf+
	 Ul55hNMKll9NS24QrqUe67u5viMRq2O7a1bFpsDE76FogeK9dVME6w2FvFNUgl/85t
	 l5okiRToNExeTLMnPySMjJI+dziJ79DyEto1JfkUYU9/a9FKxeAGeyq79ZxwOHCBsC
	 kOJTfA6zlkQtxap6bnuEcqQ7i/I6myaqNeaG5L3Fb6rz3GoBWO3sK0lp1nRb0ZLiw3
	 zXinIhrrMzYuSvN8/ZWPjsFjTkucDCb1CFhOsg726ubw/mRvIBbBxAioK6+LTfUtf+
	 N/C5BgJYXiSmA==
Date: Fri, 11 Apr 2025 12:50:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer
 entry
Message-ID: <174439383495.3642695.16910474750574128734.robh@kernel.org>
References: <185e1e06692dc5b08abcde2d3dd137c78e979d08.1744301283.git.geert+renesas@glider.be>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <185e1e06692dc5b08abcde2d3dd137c78e979d08.1744301283.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 10 Apr 2025 18:11:12 +0200, Geert Uytterhoeven wrote:
> make dt_binding_check:
> 
>     Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
> 	    from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> 
> Fix this by adding Frank's email address.
> 
> Fixes: 9ca5a7d9d2e05de6 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


