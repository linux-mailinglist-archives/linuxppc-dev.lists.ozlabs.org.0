Return-Path: <linuxppc-dev+bounces-1307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F497772A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 05:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4fDx3SYNz2yfl;
	Fri, 13 Sep 2024 13:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726196417;
	cv=none; b=Ya45tKy7J4T84bk6BFxV95xgofDoPAUIilYT/GDYlbxRsYea23Pj2YacNwXXzLGZm+w5NAQ4ul6cO8+4HxFIoZO2dQLcTdAOhiX3fSQZWWNCIRuFFuCvow7vdni7I4bHegk1QTb1BwK2FxB3KzdSEoisPO2Ggph40LboR2wQz4scgjb0ZQG5wG/3ZfsrSBM/A0hWAQlnpWpDuKAxmM+VBfA/qDWysfYXHGP98rqyy0vFizsVhbdtbIq3Uv7HMWjM1trRaTxd55/XMH2ceKaGTljO3YswJosJgdDJWYr5W7ahCl8qZ3WPrVyXDRg64dD/hY2pJwCWQ8Y1JY7YM5tmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726196417; c=relaxed/relaxed;
	bh=VhEvHeaOii1sg1WCaj1iaRY0Bf+Yt5n42VZMErYucL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ry/VlhWJOAlsC2JM9dHGPEjflorJUGzk0GgG53ho4ZtEYNtWwiTIvLefEzNmj3hid2wYe1FkAaU0AqMzEoRDTefYr5qOEFNSCjWZCxU0mDSzu/+9TNsy14Tj2mSJ6d1/tpu1/e5sVlPRXTPC0BFiXiUjqZMhO0BH9feMHtb+IjiTlzvloIttIOdLDGhO5cabdsIb8qiJwIfBqxyegYAT4fc//KfWjD3kfxrqLL90gyaYCKLU1mvHUxiew9ZIm/4B7+M19Fcvlt263LVVLDvuS5KDsxhDzgm3Kv3pnTDDvdBmsN57/9iYhex0zRkZpGNVUDh5tOH0FPizQAATB9DEag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XI8MblzZ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XI8MblzZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4fDv6g3wz2yfj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 13:00:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726196415;
	bh=VhEvHeaOii1sg1WCaj1iaRY0Bf+Yt5n42VZMErYucL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XI8MblzZWDcLAgT7rI1fbJ9/KgWBSBAfmngFygl/fEKIMKL8TsRZdq4K7rhTAYh2I
	 QNOMH2i+uemDMWG35kp/IgIo9D9FxLtx/IU3iM3Z3QTiA05RbYwc9VVBuVAt3q7yu0
	 SlzY4hbBMns41/2Pq5pJvmSU3kl949tK4pceWfOJVslCAYzU/ilf78Dn09DTJ8XfA7
	 hspqMQuxEd3c4UvqSdZyP1YBaJ0l0Ar8jidyZfJMCHWduZCzJkIIjl7EBaCUXfKX2R
	 kvb1vnLiW9hhU6uxUsbKovn1NoUyzaqrfe/ynS2UAvH98DA1o++dXT6iWSLn4okxBY
	 20S9pWjQJ/A3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4fDv2Brgz4x9D;
	Fri, 13 Sep 2024 13:00:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
 appro@cryptogams.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, ltcgcw@linux.vnet.ibm.com,
 dtsen@us.ibm.com, Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH 1/1] crypto: Fix data mismatch over ipsec tunnel
 encrypted/decrypted with ppc64le AES/GCM module.
In-Reply-To: <20240912174537.1409567-1-dtsen@linux.ibm.com>
References: <20240912174537.1409567-1-dtsen@linux.ibm.com>
Date: Fri, 13 Sep 2024 13:00:13 +1000
Message-ID: <87seu4qmv6.fsf@mail.lhotse>
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

Danny Tsen <dtsen@linux.ibm.com> writes:
> This patch is to fix an issue when simd is not usable that data mismatch
> may occur over ipsec tunnel. The fix is to register algs as SIMD modules
> so that the algorithm is excecuted when SIMD instructions is usable.
>
> A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
> codes with smaller footprints and small performance gain.
>
> This patch has been tested with the kernel crypto module tcrypt.ko and
> has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/Kconfig            |    1 +
>  arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
>  arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
>  3 files changed, 1187 insertions(+), 1376 deletions(-)

As this is a bug fix it should have a Fixes: tag, and probably a stable
Cc as well.

But that diffstat is really large for a bug fix. Is there no way to fix
the issue in a smaller patch? Even if that is just disabling the feature
until it can be fixed in subsequent commits?

cheers

