Return-Path: <linuxppc-dev+bounces-8032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0968FA9DE45
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 03:12:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlT8F4yl5z2yk3;
	Sun, 27 Apr 2025 11:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745716349;
	cv=none; b=nXkPKbZoXuQGSYBJDMbckGQemtd3WsE2SzAn9W0CyuFou7jJtGjwB2OUkQhg30X14FXkadna4YogwGHUgcJdGRnkkFL5JJDH9O+wktqSI2VkdSe4Yr2bWyVWeTaeQGrUk01jhrJbVviFtJRc+rMY7iT1o+9izB6VEk7u2Mm4o49C6LpCuMqFpvRq9AU4SJ9T9kA+AXPIiIeh/MsvTOCV+eEBU1/7YectLpSm12gG0sSUE2z9iAOxCeEOALrqyP78R4IpAq0iFHwCT0eKpoFM+ZGe+qsWvqc5fye+1PeSiRQV7W6iFZQiWyQHlu09MDoxx3eMcdNZHBP9uA5XhkyS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745716349; c=relaxed/relaxed;
	bh=/z6B1Bd4xVYC2gvLvE/46soerbfzyW1n205UZ9uRG/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHfRwrsymAyTesdUKQNKWXlaRHcPQ7TBlFw4jDt7w7WXmZwbV7C61GaWGGAOCJncAjO6GhPoGp9BEuPPq2LiJ/5sozK6c5PaUptlL5PNrxQm67GeIlJGByfdNob8Fi9Ql3OtFQ1agT4Sv5SdoSoSEBMbG3lY8vNpgFotHe/cPAv3i86P0V9uC6g+7uCvuyOZy2o/Fe0fA3jQEc532AyiZZaO6AJvVv6WYRXuEKg+IRD92lY0vdeIt7IKZcdf5YvvloQbzEk2ejZ+lxxm37dlShlbvdrpGlQBfCN572RRJrxJoQrNNFoMU1cna0VKibLaWtIwRbv9znfpjg/6TKvhrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGr63U24; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tGr63U24;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlT8F05LVz2yjN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 11:12:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00639A400AD;
	Sun, 27 Apr 2025 01:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15DFC4CEE2;
	Sun, 27 Apr 2025 01:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745716345;
	bh=XtR2f2thGcnDYbhl0pb+41JAmRYzjJrz7p093kCXmZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGr63U24Gm8hRXTQSMA4lzYe51LBc4e4LKosvkah6KUyAMJnYCNTl7qlYhU9meJPQ
	 JXkGSHgyHAyGkABiWTxETPK9T9HG/YCslPrpz1C2Rd8U2nORRVXbC4q/iDWve+GK82
	 tKfCzgcrJ9AoZEh29PMKmsJJndXIegAqGM6CXLVC0Jh29/H7Y2m/d6O+p5ZDEL/K1B
	 BsxWASsxCYPCjwizywmWlK+UzpRcqKy6xOMgy1n/V4zXZhtyAWrSPPp7i+Xo/4/X0e
	 Daye4QLiZSXNkXPQd/hQ2xs+4CCmLsIfbjf9n7+azNxdTbZM9lQ7Q5y3du8vu544X9
	 Trq6TtAEEdGeA==
Date: Sat, 26 Apr 2025 18:12:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <20250427011228.GC68006@quark>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
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
In-Reply-To: <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 09:06:51AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > +static int crypto_sha256_update_arch(struct shash_desc *desc, const u8 *data,
> > +                                    unsigned int len)
> > +{
> > +       sha256_update(shash_desc_ctx(desc), data, len);
> > +       return 0;
> > +}
> 
> Please use the block functions directly in the shash implementation.

No, that would be silly.  I'm not doing that.  The full update including the
partial block handling is already needed in the library.  There is no need to
implement it again at the shash level.

- Eric

