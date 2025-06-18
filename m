Return-Path: <linuxppc-dev+bounces-9436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4AADE159
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 04:52:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMSvz5cvzz30T9;
	Wed, 18 Jun 2025 12:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750215167;
	cv=none; b=FndpUhJuiDGO9lwgaLFLuIL7t79/a7KcBID/4pMDAzw4zF/IzviZB7qsaKEDq14/nzrJf0r6tKsSEWaCYEATwdX91bW5UnLbndL76Hv9JhsnnbfApTV7xYIPfXKH1TucOxVDUCGQze5jCaF2cIhDYimhb7saXCF1YtXhe7X4tKmsMUlj2V0b4yeXvKgj4nZqVpWmWggEevYK1RyleJcd7Fs5y/ElCDedrWi0ZJn+CAjyU5TiBnmFn5elwAhZ3fxrYxDynAvRR5R6NUIpfHMIhggZQup6rSp6eSleZNtAQf3b3D748HK8mZbg5oHYkAt9fWSUv3EkA5aD3sOf+sJqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750215167; c=relaxed/relaxed;
	bh=CQ/BzZOPzT5KSxyMEMI2pQKokDXIaDGUe/G/fZ6UhJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6kGJZVbxipA4CVaUlVgQFu8q7YSJiiSAgcnJorVqquU6K7xvuzGpCuNq9IsqbaEK3dHHJ7YX8+Hwa4GQAKRKsunZ2X4vNb7bk2prVekZ4DHz4FnwvmrRAqLp3nKH6crhtXdVcMzgIzvexWy7qm0dukrDw4nPjTnDdHs2HP2EMC9sKi5Y3Rx6hIWKkJ2fsOUUIVkGnhrbe/HUnavPPiGSLWYcT8ib38oATrQRvugUwP6s+1TRyJwEw0cqhomZ31UOhte6egDigwUyekuQ7e4aBIpY9lE82Btm8KIfpUZxbITUlBlwKY6fjNAlCUEbSm2FiMLvVPuQnlPfeB1MPKXvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mPFoctY2; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mPFoctY2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMSvz0nFFz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 12:52:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95A3BA51528;
	Wed, 18 Jun 2025 02:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC05EC4CEE3;
	Wed, 18 Jun 2025 02:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750215164;
	bh=xibkBkl+LKRXep54JINrCcQx7QYwck9H1g7WJvKYXXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPFoctY2b4YRp0ICParubEBIZbOSf9Vk5KK8uS5PrU68/mm+Tz8vijYy669L9yxjm
	 Jsv6rP0LyKuxoI+O6bOEIwMiUBAvM0LFyxdmzqXTetuviDjXgL79zCa0MkNRe26UZJ
	 nmTPEi+nsnNBnQNcZVTMorAMhKugQ20v2b7tS7R4Wg/qgU1aCe1/KxTNGbXHZNp3s2
	 x1c6uvob6lNCYNLO/miSBxmUGAC6yCJweLgoMx1DbKIQB9lR06t0ghAy3rr9+u8lXf
	 Xpv9Fu6WPFd657Fqb98bOrRaq1+T2zwE7IyENAPdIk0Jvy78IS8GMNY23Rlo0baNFn
	 vSmEyoM6yt63A==
Date: Tue, 17 Jun 2025 19:52:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 8/9] lib/crypto/x86: move arch/x86/lib/crypto/ to
 lib/crypto/x86/
Message-ID: <20250618025213.GA426513@sol>
References: <20250617222726.365148-1-ebiggers@kernel.org>
 <20250617222726.365148-9-ebiggers@kernel.org>
 <983d7906-6510-4867-978f-4f937b29224b@intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983d7906-6510-4867-978f-4f937b29224b@intel.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 17, 2025 at 05:41:09PM -0700, Sohil Mehta wrote:
> On 6/17/2025 3:27 PM, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.
> > 
> > The new code organization makes a lot more sense for how this code
> > actually works and is developed.  In particular, it makes it possible to
> > build each algorithm as a single module, with better inlining and dead
> > code elimination.  For a more detailed explanation, see the patchset
> > which did this for the CRC library code:
> > https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> > Also see the patchset which did this for SHA-512:
> > https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> > 
> > This is just a preparatory commit, which does the move to get the files
> > into their new location but keeps them building the same way as before.
> > Later commits will make the actual improvements to the way the
> > arch-optimized code is integrated for each algorithm.
> > 
> > arch/x86/lib/crypto/.gitignore is intentionally kept for now.  See
> > https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
> > I'll remove it later after some time has passed.
> > 
> 
> After this change, arch/x86/lib/ has a lone empty directory crypto with
> the .gitignore file.
> 
> Instead, would it be cleaner to get rid of the crypto directory
> altogether and update the .gitignore of the parent?
> 
> As per the link above, commit 2df0c02dab82 ("x86 boot build: make git
> ignore stale 'tools' directory") says this:
> 
> "So when removing directories that had special .gitignore patterns, make
> sure to add a new gitignore entry in the parent directory for the no
> longer existing subdirectory."
> 
> With that change,
> 
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Yes, that makes sense.  I'll do it that way.  Thanks!

- Eric

