Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6149B509972
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 09:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkV4l2Q3vz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 17:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gvMx8c1m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkV461qnqz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 17:47:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gvMx8c1m; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KkV4217nTz4xR9;
 Thu, 21 Apr 2022 17:46:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650527220;
 bh=6Zuyw245iK0ZvmsIInOVF3tD0phZx7klr4ZSZDE0lfk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gvMx8c1mKZEk9360t6GcgeT3JWfOTmnYz6GvFDessBmf39sJEx44Q0Z+x1hpFTrWy
 t4auQPIRwi6TLOC5KSsg8QKX3p9zEXuShyq0uHBYu1erlGHlaMvzSTd0+fj7RWiYgU
 tCzURkRfAPImrkXcC+sBl+rheKPkeC/rMcEJM3EKRQvK2lB4MuBgaPGGYpPPbVTHfA
 it8ioLrKDEww3YE+8lIiJlY2K/OnNQ2eKwRmuZIRJLwcYGC9rXuKHeESQprOyINdKY
 7lCkeruyA9hybz/N8O7uCdsQXVrHra8+jOKydxL26BYWOsvAHnHDfhh6wid+ljGafu
 32UOBCm0c47oQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
In-Reply-To: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
References: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
Date: Thu, 21 Apr 2022 17:46:52 +1000
Message-ID: <877d7ig9oz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> Hi Greg, Sasha, and Michael,
>
> Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
> a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
> versions of ld.lld [1]. Additionally, it resolves a separate boot
> failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
> reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
> problems, and does not appear to cause any other issues in my testing
> for both trees but I was curious what Michael's opinion was, as I am far
> from a PowerPC expert.
>
> This change does apply cleanly to 5.10 (I did not try earlier branches)
> but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
> kernels in that branch so to avoid any regressions, I think it is safe
> to just focus on 5.15 and 5.17.

I considered tagging it for stable, but I wanted it to get a bit of
testing first, it's a reasonably big patch.

I think we're reasonably confident it doesn't introduce any new bugs,
but more testing time is always good.

So I guess I'd be inclined to wait another week or so before requesting
a stable backport?

cheers
