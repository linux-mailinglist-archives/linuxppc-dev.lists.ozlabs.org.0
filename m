Return-Path: <linuxppc-dev+bounces-8034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E927A9DE78
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 03:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlV0K16fFz2ymg;
	Sun, 27 Apr 2025 11:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745718641;
	cv=none; b=Cc09e39kAMVCGOriJT8klowwy9v56c+8JQskfDnVB+m9ixuGes2DGf7gCJk8xwTCj8Dgs1temDGEd4vI7vjbrXg02ToE1FSjGcWRjQBAFbYoJPHwi+EyfYNqylfz70Xzt8oFk6+TUhUwWvi14L6R56Bchx6EkBkw1LtFrYaPWmEuAMwOPdWHTSbqmuDLUrdjhdrPLpxyQsKXuXJ70QW5JVT+22Vo7FJwAxX+4dnwEix9UOHYChFuzCGlUbIrXObbS7knjwnlSSbbqM7piP1JTMpqIBJShvo0VOPhsehfswDJbAjSkDQHIMYQ3G45kcw32RGPwiccfitSmhhP+Q687A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745718641; c=relaxed/relaxed;
	bh=8nXUMIvgWAeZmH0GaKW1gBwUr2XT4Syvd7F811vqAbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUQ+yPLHov1oOgA5wNeL1iD8L8jtqroQUYP1RC0xJ1EDxXv6dBQLxD8y+OdhL1s2XDPhOj/g1Ng9jSg7hgkA+/12L4qnsJ8HOnMsiaybyGfPxUMeRmbRkWV0PUPZgmACOKNp/wqzSvw+Lg3S2z3TNeHJhh0rU1T64GdSapksMp/8I/v8m7XBfg5wUTCHjTc1S5fd2DpE/LA7DgIzP4xh7UgxnxmxAfloPQEa6EVeUMSpz+d2KersOCvUDZrVBgkWSDpSo+7CPn89JGeFNeRHSVHtVSxX1nDp/xSwffV8qCw7aq9r9VJt82FGjab639611UBodD24S16RxmbMsqUe7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A3hPlaXq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A3hPlaXq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlV0J11pFz2ylr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 11:50:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 289895C34C0;
	Sun, 27 Apr 2025 01:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A863C4CEE2;
	Sun, 27 Apr 2025 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745718637;
	bh=e/U2hXsUieq0eplDUQMGjtnd+RdUdFnygdx2mCJfSjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3hPlaXqbKMOOByqg0xO9XDGFN1r/8wVmxH9kT35oxzYfPaLGXzTgbk9sGuMRtTvt
	 44bXMlBlBZQMn8Ipp3JoqeVYAXxD538C1X82i3+WBwshE/qw9nPHmadZjz3sDag3pe
	 JEMPB13QpuEDebnwb5LL7f1z8/SGor7fWyhIXtEz2xGDz/C8I7rNgHiUFkybydeuCe
	 Ro3xou/0TbbO2aRPHU0DEuogQgtgdvMdA5WHna4/b4PQ7kTpgKpaJar1ue9GFDud7L
	 58cp3jMvLW6iFrbLOFJHG9nwrGeuGyAlLwD3YpV4I/HWA3G9v2H3W2WGYZSzk4OmcU
	 KiZ54jDdhgXpw==
Date: Sat, 26 Apr 2025 18:50:41 -0700
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
Message-ID: <20250427015041.GF68006@quark>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
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
In-Reply-To: <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 09:17:28AM +0800, Herbert Xu wrote:
> On Sat, Apr 26, 2025 at 06:12:28PM -0700, Eric Biggers wrote:
> >
> > No, that would be silly.  I'm not doing that.  The full update including the
> > partial block handling is already needed in the library.  There is no need to
> > implement it again at the shash level.
> 
> shash implements a lot more algorithms than the lib/crypto interface.
> If you won't do this then I'll just do it instead.

But this one does have a lib/crypto/ interface now.  There's no reason not to
use it here.

- Eric

