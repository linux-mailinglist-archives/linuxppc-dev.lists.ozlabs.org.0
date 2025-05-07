Return-Path: <linuxppc-dev+bounces-8421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD67AAEEFC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 01:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt9rg5rhDz3069;
	Thu,  8 May 2025 09:07:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746659235;
	cv=none; b=N0cBBLxGGJqy0hY6oWfBWk3wCuO9E9kpAJGlmVIjA55IIijBW0t+8HZLPtwVQPvA8ykQsJlEwYx9yoHYVePJlxydcZJ6NFZz1C4qim8XKagSwTpxYnNC+gI+aByVyAIMyg0OTEtScS6uq6bxsMaRikhLlzuuou9MDCAM1rwmTRoSUOGaQGRuq4NhTO9NYQrZp79Cvo614Gy/JRY0HQLxceJSnXJxLaR6VXGnZIOOKM55B7ZKNEpvMISj734aH0CKsovGUDzpRsuF9r44t9mbueOPCebSE1hjV3d/kwLVwVFe4d4P7c572zgK3gMoawckxFwbT4ycAmPpmu4VyD6hjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746659235; c=relaxed/relaxed;
	bh=5F7cfLNuAZihLOMx+uQ090qhwP21WQ0kjiF4tq/FWiY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SGBpBPNFndyMGX7S1m6mrlHLOYin7ehtqtMfcFORzXkB/pxK5sTeKmT/Uul9f9CcskzCe15qEo8Eh7fpZNwy766IZw+r7WTQ89F6HxZma5S+thruF78fQPy9wAPyhdWqT/72+HK47/o+FqPLPSCrJTodygvmW/c5GxufpX4GoGEdcMHVyr8NMVtxb5TFXtMdBTqJR7l3m6iNlF2k1ISfBxwDsysgftISIC4rM/TmeiCR6HIoBSJ6d+pFZJldRmuJmAdlWAZrDIoJZTFbEuISQ0B1JAc43nniYUTYfEY6KofgFqB2XbVVwIaGBlbOAJAUBn4YHxdb1TzFWNa9bBP22g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZdZGur8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZdZGur8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt9rg10ywz305n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 09:07:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A7325C5E9F;
	Wed,  7 May 2025 23:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A39C4CEF0;
	Wed,  7 May 2025 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659232;
	bh=t1gjac8ZPVlmoGA9780a3d1MWtDrwkvDAD9J9rjOIjQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jZdZGur8jMCeo3Gy5nWM9p50FLf8+cXaD0nnyDZkGf5EU3mowxUonqS6tCmMMJq+I
	 V7bSjeM9g3R94xB1jkUCUPVA8Ybr/jshgR0tRaf97DHot/gwiR9tfxzrGWBRa9fQsF
	 9aQpCmzq9BB9uyPYb2MZxUffcCAdpBucSCnY9WNfgKUDjKmz+agQjHAmzw0qg2yx2w
	 C/tJamtdiXTapqT6eLwnuhgNxRgmjSprF5BOL46k5lorRNcLSvWtgbftaBzdUEkPJA
	 FhlW0eSS2oA7hyPBIhObHmWFbEstCHvUon0AwYnp7EkMfgIMtmyj5DlHF/ZycOHzOc
	 417nRVAdGYCpg==
Date: Wed, 07 May 2025 18:07:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215903.2748698-1-robh@kernel.org>
References: <20250507215903.2748698-1-robh@kernel.org>
Message-Id: <174665922811.2893796.9617092031140706801.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 07 May 2025 16:59:02 -0500, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215903.2748698-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


