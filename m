Return-Path: <linuxppc-dev+bounces-1195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94D9726AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 03:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2mk12DCkz2y8r;
	Tue, 10 Sep 2024 11:45:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725932729;
	cv=none; b=KBYwlAhbTI3frVcfzc+N3U5vSjBzSpWjfL9mUfyB50Kuuok1SJdrmRkJfgo4PVi+FOtlsQwX9d8nXiMvGmVqrcytrO+AsdnYhyaxEG+kvSeGIZeNRzyYXN0J5oaGYBTO06gfIV+hFGZtXpIoaqoKBuFqKh3nN+kGlIVob8EOvUHhP/W4qztiDEgvT4ZwyXHe9Pimo3MUNWhznu5pf8mL0C+r4Cmi2sjNeurscxBOtLD5cyKolaBSdUPXqHPlBO6iR1uCDW44Gat/AOvKG+L6qD2o/NR8f9O0wE/0Qe1RmjDnElSKLJA1wDs/osAzIJfAAZgHWrHAZbrhCVWug75c9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725932729; c=relaxed/relaxed;
	bh=4MyIEvaNoI0x5VxCOyrD1q602eBtrMeu8HymkhNfiWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d4Olfr8m6+UdA0VLr0PytYqIjmduMLw+Zx8Ljz7FXFT8WpJf/51LaAfEA+bl56fgjb2Y/xr8U4K1xNoZeIvfylCoBatCsTQ/gPORbKKK9LZ0KEzt/0Jp6QrP0igoqH8LESSVc0ZQiFfA83zfAJgdeirzYhGsvp3Vc1mr6FLM3prVy2h9AYHJifgOunwL3r6lASKQRdJvI+pKagK/w1Tc0CpUATtQNp5kqefSvnFUG4q7w29NBvhfCfG4y9H08iV8jjwcXHq6ftBxFSvu1DlYkTKPi6ShPW/U6iaJbnWuELzl0HkeyQyFYJac8iF7YUsYUAZqoRPp/6bMkDSAr+h9CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bZIK3MJd; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bZIK3MJd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2mk03qZqz2y8h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 11:45:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725932722;
	bh=4MyIEvaNoI0x5VxCOyrD1q602eBtrMeu8HymkhNfiWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bZIK3MJdJvVU4NIP9rZpQIk66MeIxyJOztBrdLGv/mBzpXZ4eIVHYZTG1YfD6q/X3
	 9gEWxDE6EPv6Q4WObECGi8e5rLyixUEhkmuN64KpGW0j7ZfNC/Gz4/nTkpRE7e3bKK
	 uytzmdKGkHhWBruWmVuxY0P9xdM0ydG3SNshyTk6H2jlBYMRxjrobozVZhKQc69IXv
	 eIPsX48By2xfFCbHlPwoBWKGQdIHICzYc7boUGK6VQQ1JzwVmsasAVnWALeCVyHi/X
	 w/XHQ+h0RJAG3dJXys6EFuIsW/tv+UdWbJufiojKu7JxtOfR3vZOfFNhwKmPhDBALJ
	 wWTFd0RQFe4hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2mjs2z7fz4wp0;
	Tue, 10 Sep 2024 11:45:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, cuigaosheng1@huawei.com,
 wangweiyang2@huawei.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH -next,v2] MIPS: Remove the obsoleted code for
 include/linux/mv643xx.h
In-Reply-To: <20240909134753.489171-1-cuigaosheng1@huawei.com>
References: <20240909134753.489171-1-cuigaosheng1@huawei.com>
Date: Tue, 10 Sep 2024 11:45:19 +1000
Message-ID: <87zfog2seo.fsf@mail.lhotse>
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

Gaosheng Cui <cuigaosheng1@huawei.com> writes:
> Most of the drivers which used this header have been deleted, most
> of these code is obsoleted, move the only defines that are actually
> used into arch/powerpc/platforms/chrp/pegasos_eth.c and delete the
> file completely.
>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v2: Delete the header file include/linux/mv643xx.h completely.
> v1: Remove obsoleted declaration for mv64340_irq_init
>  MAINTAINERS                               |   1 -
>  arch/powerpc/platforms/chrp/pegasos_eth.c |   7 +-
>  include/linux/mv643xx.h                   | 921 ----------------------
>  3 files changed, 5 insertions(+), 924 deletions(-)
>  delete mode 100644 include/linux/mv643xx.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0a3d9e17295a..2b5dbf7f3cd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13708,7 +13708,6 @@ M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/ethernet/marvell/mv643xx_eth.*
> -F:	include/linux/mv643xx.h
  
You need to Cc netdev and Sebastian.

cheers

