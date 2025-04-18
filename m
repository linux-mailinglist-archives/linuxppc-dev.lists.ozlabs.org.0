Return-Path: <linuxppc-dev+bounces-7783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 829CCA9311A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 06:09:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf1Vq1ddHz3c3g;
	Fri, 18 Apr 2025 14:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744949379;
	cv=none; b=FveUPoSSq2lMHEN/MjYPnBS4CxB41/i2/m8e8Gnvb+kmoaI+xSNibPPKjkTRDqeToKSYgvfFn4C5j2Baau3OcIsF4VZNurusyPm2G9onpDVxsbtNBPwWPh0VHiP3uRcdEhYCE/hFxiwYVB5zC9QRk08WeYM7i5oMs7C5Qmk/qfSPUmWfGJcwuB4tXMPBeyVfCxFsPAodTamCcg1ubX0X1lDeGePUa2pckQqa9pLaUEyo51ZRR2OFM6v9ZYoPksz6OTBmFlRFQIq38afdmH5gI9OWFU1VuqP+Kp7AVfG+ahk90NEowlnkjKP/prb6pcw7XszmHgMnV3zOycqlstOEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744949379; c=relaxed/relaxed;
	bh=SIFSwc7XDuTG9PRBFfqSSrQ+KkySnv+n/+/xZV7nfBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxfQFiILIECppm8j+qyyge6aL1Z0B2WOrbPW5PJnP1ldP0MlXgZQxE7nVOvhYTjBUp8Z6btgWnt9/W8OsD+3Dnx5Rog7Rcs1skjwLgpbntrzihAWZTs19qARtyIjVZipshd7yf6g/UjSHapCVn9b1guauJDicQ6F6zdlmt/Vwhmf3+IH2lMjFliSAUZOS1Yn/LKMnJY0eRlyyqX9nGajymsl3wu9n8DCd/qauWB5kh0hFTR6NFn7DhUE4JKrUpj2pcmvtKw21ZdJvtsmmnFyYtxLBuBcMxxeHMvbkMwuOnZKGrXEf0Y4djjmOK+7PaFlBVCltTXsvgq4gLJy/xu4YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qvEGyPSl; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qvEGyPSl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf1Vp1zVjz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 14:09:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 422A95C59A2;
	Fri, 18 Apr 2025 04:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4682C4CEE2;
	Fri, 18 Apr 2025 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744949375;
	bh=X9HWpDJKGelzlCUQTDiF/+gV2vBAm2QsT8zUpHUuxwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvEGyPSlADMpXrpDb39mtYQWbsr4vDvXWgXhOxwVcm+1/ZyO98L2tTR17xtXq7F5/
	 3Qnp7bu0pCI8eUyKzpE8NMQIi8gQ7qzp2jVxGCRMaZi9PCDQfEcJUTXYSl6qD5k3Iw
	 EW8ujRSii79rvabBW6nRoZ47tshuQ22cty32TIYzGvaDdlUR0EKwklKONC+9qeq+Mr
	 xCahi/xTQTtPwJOoE1tuLuQ5EqHwUPXxKn09ORAOZJk0Tt9BgDXFTBTWPPu9KfOry+
	 P8NwdCgERlt1WKwblR+V1KrFCxMo1RXDgXojcv40y0KcrjrcWMgsjFNPaCTnlktyKU
	 TMqgU5iBTFq8w==
Date: Thu, 17 Apr 2025 21:09:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418040931.GD38960@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
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
In-Reply-To: <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 11:38:46AM +0800, Herbert Xu wrote:
> On Thu, Apr 17, 2025 at 08:32:36PM -0700, Eric Biggers wrote:
> >
> > I don't think that would be better.  The 'if' would be up to 400 lines long, and
> > it would be easy for people to miss the context when editing the file.
> 
> We should separate the symbols for Crypto API options and the library
> options.  If you're worried about people missing the if statement,
> how about splitting the file into two? One for Crypto API symbols
> and one for the library symbols.
> 
> In fact we could move the library files into a different directory,
> e.g., arch/x86/crypto/lib or arch/x86/lib/crypto.

arch/$ARCH/lib/crypto/ is the "right" way to do it, mirroring lib/crypto/.  I
was just hoping to avoid a 4-deep directory.  But we can do it.

- Eric

