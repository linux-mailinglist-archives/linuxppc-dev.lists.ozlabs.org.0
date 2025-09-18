Return-Path: <linuxppc-dev+bounces-12380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B0B85F21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 18:19:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSLSm3mQ9z2ypV;
	Fri, 19 Sep 2025 02:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758212392;
	cv=none; b=ijpA8qyaezOY+rwJXKNQTV0NsGRtN12OjMDcqcZUI/i7iUGfvFjiV5lihuPRE0gNRHfYgZH/5nPOPp3AB55PDqwsqpBb9T1gzeADsViFRQQDAMypaOzQMrqWfvx/U4vXp5bZUsFuLR1x0ZIVGZWdTD4yloVlkY8GCe5jf6OPR47Xf1vCBwvjbYD6pjkXj+745IUb40pR+mEtsY4pxrB95tnfHVIdUqYEscKXbOgvti3fydQrptgY+29I5OxFTHVH1/LbMl8pG94A01H/lGmWIJaC/sChcnB5nJL24zJdCIBgt7xj6elDnkM+0+FNqfkLPxOg1AzP5S0qEaehdxDOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758212392; c=relaxed/relaxed;
	bh=38/rCwSMtrHS1XhEyEmJU8dDMKN5M+1f4ne5L4D3Jo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCI9bPsgWNR/3aon+EBJa065AqYFm0T1G/cLNEk0qcokFQAB8DgJI72p3OaJhLtQotJInXMmxuZslkrbzvbB34oav4m90zjW/m6Q1z/Z8E1C3mre3RFDuXdwtCm79a2EcXB3aZD1w+DvsTcRiQImKY4q2GiSRdsdoVg+LDCSScwCut80362LqcuXjWT7DgJ0NVJiaAYwjRUTmz8KVB0+NU02HRAulXzlAZmhra1w4asH4Lz2PISov+6qhMb2jy0RO5ezgjyjH0CWdmEk6k2uUAUj+4RIvgfCTUmQ0Rxx/i4jU0h4dPVC96/xrmavemmGFhWshpQo7PnbKfz6BdBnQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jnpukQS5; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jnpukQS5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSLSl5hjCz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 02:19:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259F2435CD;
	Thu, 18 Sep 2025 16:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94223C4CEE7;
	Thu, 18 Sep 2025 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758212389;
	bh=/Bp4ayrRI8DCfRd7XTDaDzrA4t4torLE5+3IaHn/8PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jnpukQS51J4MYt0Wcat87Vh/X9PimHXG8pf0rXYEekNeImXxN/4kKsRRdZQo2RHJa
	 8Mee5HOoMypPugX2YINMABeW2ETswBaoAZTT3BhBkkRD/5HgkTqlFPaUk6S3VW5o3B
	 mQ4SkbGOjub4VUsqodTzS1HBhQ3VJ1C9n78NGGuE=
Date: Thu, 18 Sep 2025 18:19:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: cell: make spu_subsys const
Message-ID: <2025091830-deeply-crave-728d@gregkh>
References: <20250918141633.339803-1-abarnas@google.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918141633.339803-1-abarnas@google.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025 at 02:16:33PM +0000, Adrian Barnaś wrote:
> Because driver core can properly handle constant struct bus_type,
> move the spu_subsys to be a constant structure as well, placing it into
> read-only memory which can not be modified at runtime.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/powerpc/platforms/cell/spu_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
> index 2c07387201d0..733b512992c0 100644
> --- a/arch/powerpc/platforms/cell/spu_base.c
> +++ b/arch/powerpc/platforms/cell/spu_base.c
> @@ -464,7 +464,7 @@ void spu_init_channels(struct spu *spu)
>  }
>  EXPORT_SYMBOL_GPL(spu_init_channels);
>  
> -static struct bus_type spu_subsys = {
> +static const struct bus_type spu_subsys = {
>  	.name = "spu",
>  	.dev_name = "spu",
>  };
> -- 
> 2.51.0.470.ga7dc726c21-goog
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

