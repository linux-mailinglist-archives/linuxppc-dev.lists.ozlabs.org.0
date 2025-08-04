Return-Path: <linuxppc-dev+bounces-10553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10ACB19B53
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 08:09:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwR2d5Y0Nz3069;
	Mon,  4 Aug 2025 16:08:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754287737;
	cv=none; b=IAropplxvE+t0SSllRe4LhTUJGBIMTYBH9NMK9q6N7oaMRS9MUibkPspdP+RmZOTztEj5nNcFK5DjvGiJYYNBh35U3IcTzq4MmmNZ0irP3sZaz4Be+bagxxBZj1ABm+c6lXpCc6IYokMAVHDFNU+aHXyh3UNiOnRQMu2sACmW39NvTO67mVdsYDzkJEOa67Oaxv8WfFKPwB8+DPNRHVdjSagM4m6FJIGyyoHaB2v6GGeaXNBiUhtN7baa5613tlpktqqbdklR+MKzdYNOY4S5vGshVT1v6Hp5MxvCphahe5+MZj92c8w0s0RemGRD8Ud4Ea/3IArw0+CygpUD6XmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754287737; c=relaxed/relaxed;
	bh=MPKQa24PqOP4kWICOSj866CvW2pho+C7bBpsH2p7oxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ndl2PVTB+GsDxNr7ImlQs3LwvlEw6J+gZFHRlMqWYYYVnd4FSPqeGTA2nNRzEvTa/91bIujOx8giCw7LJOg42RrHi55Fb2BtHJ+lx6WeS7NRNVVuucbSZeIsshN0ozSRxBxPQlhfdzY4LPrMbr4qfchjOGUKjS2oYbxgmKVDwUfn+W2SxQwm894qHow2GogkXCLcrn49+BAjSgBhs7pjR/onfeCa6+Bblt8GGvF/zTFHXfnSVcQifNPvxX9oklSKRQ+c4yXcBbDCz02+pXVaddwUfNeiooJd0cPqmDfDRnl3CJkijzu3gO9ICTJD4dNtonG5fRD9uX0mvn2PTPvPyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WB5Ojvzz; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WB5Ojvzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwR2d03Kgz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 16:08:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC3D44A20;
	Mon,  4 Aug 2025 06:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F8CC4CEE7;
	Mon,  4 Aug 2025 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754287734;
	bh=ipRZKPKGvZYye+NbUN1kZp7BEdItabd5U7NljxzHgfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WB5OjvzzZ9vAddGUmIgd58d+GXAOhK71sgg1sPjKZ2V4EdqoOJbqAVclrdZTG/XGi
	 Rv4OLHjfwhr7v2ooiI/Y5m0mdTZlLU2yegwzf+bUDcd7s6iwcEdBh06+6nVz8/Wa/O
	 +nBnfaXt4XJKLaoT1RHqMmETX8rjF2Kmy/dnJIcDEMFfT32WMoSpIh/T72/QhtzayO
	 wodMKqYXABzuIYri2XMu2dcy12w6CtEODa+LxF9rvgQZnWzVvzu9RJJN6NHZ3iDIfB
	 stPKSSjzPiUTU8EaLaIBQafQgp2iiOYNb0jxbpJZIqI9VBJDNEZXHdhqUN4pmoXW8a
	 x2CW/8wn0ESAQ==
Date: Sun, 3 Aug 2025 23:07:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 4/7] crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
Message-ID: <20250804060758.GA108924@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-5-ebiggers@kernel.org>
 <3de7cc4d-cb88-4107-9265-066cbedd4561@hogyros.de>
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
In-Reply-To: <3de7cc4d-cb88-4107-9265-066cbedd4561@hogyros.de>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 01:44:21PM +0900, Simon Richter wrote:
> Hi,
> 
> On 8/4/25 05:44, Eric Biggers wrote:
> 
> > Taken together, it's clear that it's time to retire these additional MD5
> > implementations, and focus maintenance on the MD5 generic C code.
> 
> [...]
> 
> > -	ldd	[%o1 + 0x00], %f8
> > -	ldd	[%o1 + 0x08], %f10
> > -	ldd	[%o1 + 0x10], %f12
> > -	ldd	[%o1 + 0x18], %f14
> > -	ldd	[%o1 + 0x20], %f16
> > -	ldd	[%o1 + 0x28], %f18
> > -	ldd	[%o1 + 0x30], %f20
> > -	ldd	[%o1 + 0x38], %f22
> > -
> > -	MD5
> 
> This is a literal CPU instruction that ingests sixteen registers (f8 to f23)
> and updates the hash state in f0 to f3.

Note that QEMU doesn't support this instruction.  I don't actually know
whether the SPARC64 MD5 code even works, especially after (presumably
untested) refactoring like commit cc1f5bbe428c91.  I don't think anyone
does, TBH.  No one seems to be running the crypto tests on SPARC64.

> I can see the point of removing hand-optimized assembler code when a
> compiler can generate something that runs just as well from generic code,
> but this here is using CPU extensions that were made for this specific
> purpose.

You do realize this is MD5, right?  And also SPARC64?

I'm confused why people are so attached to still having MD5 assembly
code in 2025, and *only for rare platforms*.  It's illogical.

We should just treat MD5 like the other legacy algorithms MD4 and RC4,
for which the kernel just has generic C code.  That works perfectly fine
for the few users that still need those algorithms for compatibility
reasons.

> This is exactly the kind of thing you would point to as an argument why
> asynchronous hardware offload support is unnecessary.

For an algorithm that is actually worthwhile to accelerate, sure.  For
MD5, it's not worthwhile anyway.

- Eric

