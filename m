Return-Path: <linuxppc-dev+bounces-1161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD85970CF5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 07:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2Fjr1Qg0z2yJL;
	Mon,  9 Sep 2024 15:28:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725859712;
	cv=none; b=f8L+TdGWO/b8FU8z0HkXxkZRHV6E01wHIF3XQPRei+pYcTDkUeDHOA3Pmdum8580jbkDnmdB6va0nzjf/wW5k+rXKMVWudQ9FzvetnMN+IUhjSvaa5Ji7bvFuJsu/Ga2xBdhxUhPRssQ91oplPSxZ+YqSs4AWM6QhRwg9/Cl5hMAGwdZeOeilWHfa41IN3D8LfR51U2oHb2LW0adbo2BNwuzZIkXDzZIoGRN1WxzlSyrg4Ay7tAEj2TFQeMMpNvUCWakyIae1zEr+VaM/uwGHxBEix4LSaBhGl8G9+TYwJwCQaaT406cjqa4dOQNPrgtruWQ8f2/+Ns9eCxwqrt1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725859712; c=relaxed/relaxed;
	bh=fLPqjRZv8TbImz19Z61gMoOmywpxwhWyT/9UYguMWX4=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=k4QOH5/LveQPxufKSkhnfbf55mUBQhYWZ/y5Pz7CnyyBloCYty6Jtjh0jOqggDBBzE66FbvZp+cvmJ4u54/dlrqnSgbA11pHInj/K+LQ7BCBuvpZOXB1raCT+8wury1Lgkq3f6CVljI4LU5KDYqXBMcrb9m0GmHvnRChR/OIE2vVKBdxvf2bPHPrxPg5b7Iuu6ZqIYJuQz55WlUA8BLeq1Jae8Bvj7tZk94gW1L/H0LwiV5EwUem4GcNdl917hZhNBmdML3i77EhGmH8EopJEhSANwF9omwRk6QZW/phJW8w2JwgVjRri5ZDHT6Fee7P3NcNkAbZoEG5wCKr0jyeCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XeiZdEZr; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XeiZdEZr;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Fjr198xz2xrM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 15:28:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725859711;
	bh=fLPqjRZv8TbImz19Z61gMoOmywpxwhWyT/9UYguMWX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XeiZdEZrV1xAOZngndFEnk9Q15aHKMSmUVvKNr0+k3WK/kOxHRpF9aZ7x2yVnmqB5
	 p0UHLilx4QVpp8QqO2zmn1c8GgQRYH1Xm1IIX5oP9buNQ8sLTkOH2LDz9Dg0rYoxbA
	 GBQK3muxaSxcUWDS5mH69zkOzvKi94xet8cFf1eMl8SxmhEswohR6AsOMO3rS//ggu
	 P8eiAZqr/dxK1a6+wXPgRVcbi1aywBcRcdBya0jYphP6Ed3rX3grM30vNsm6nJC5By
	 BVmK+BHxGjzkBJ/J3X7x3DnlanOci4wQXSO/aw6ahnf4YTIjLZ88mplxZIUkXRqIKm
	 I+6itOqN5rsmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2Fjq0PQzz4wcl;
	Mon,  9 Sep 2024 15:28:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Costa Shulyupin <costa.shul@redhat.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Costa Shulyupin <costa.shul@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: ming.lei@redhat.com
Subject: Re: [PATCH] powerpc/xive: Use cpumask_intersects()
In-Reply-To: <20240906174941.1147197-2-costa.shul@redhat.com>
References: <20240906174941.1147197-2-costa.shul@redhat.com>
Date: Mon, 09 Sep 2024 15:28:30 +1000
Message-ID: <87h6ap4cqp.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:
> Replace `cpumask_any_and(a, b) >= nr_cpu_ids`
> with the more readable `!cpumask_intersects(a, b)`.

I agree it's more readable.

It would be nice if the change log told me that both functions have
similar performance behaviour. I'm not saying this is a super hot path,
but CPU masks can get pretty big, and some cpumask routines compute the
full mask while others short-circuit.

cheers

> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index fa01818c1972c..a6c388bdf5d08 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -726,7 +726,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
>  	pr_debug("%s: irq %d/0x%x\n", __func__, d->irq, hw_irq);
>  
>  	/* Is this valid ? */
> -	if (cpumask_any_and(cpumask, cpu_online_mask) >= nr_cpu_ids)
> +	if (!cpumask_intersects(cpumask, cpu_online_mask))
>  		return -EINVAL;
>  
>  	/*
> -- 
> 2.45.0

