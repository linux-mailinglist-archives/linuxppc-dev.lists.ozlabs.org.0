Return-Path: <linuxppc-dev+bounces-2611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159A9B123F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2024 00:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZxbm1Xwmz2ysv;
	Sat, 26 Oct 2024 09:02:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729893764;
	cv=none; b=PZQC5RuZxsgIG7q4yM4pUcRTQ7ORZRReGfuHdpS9MvH+EILTNlmaTW4+Rj3tVKmz7VDqQQKQzT3BJWdkI4l5IAWAWcSmK0rGrB1j56kWy7d4IPCsn0ERMdsX3BtFyro8TaL57Mv27iTKuUkf0OjQaDFjzTmGKw3OxhXI4x4CCUxmTG63qf+6dO3PUF3ulJ9YeTtJM+h/nl90xno2x0J1WaL8qEbI3UyqKcxeeM+J40jXfMnjT13+NTHrrCoxfSHaL9zcDFv5SClkWoTYrL5NxuhaMa5+EwhZfCcXrP9Z400zj9uOEhbnG++LGePeTTVFfc1q/A4kJTY5c5bRbQemqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729893764; c=relaxed/relaxed;
	bh=Qpkv/o79CY52uHe4bP0C2cz6jWIS3ZVo75haFMpKvB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euyfnBU7PwsQdqmNCYZ4MxascdXqCs8HnqlfRh23uocMcWO/Svcir6qKv1vor5sNXmWTXsdzt8gXzuLFzZ+f0mVBvlHBhMCIOTwz8bF5xpmAkBJK5URbYBSNqYRcRynEdAunT39qzlahHuVaXbm0OzRPp7E4wfbgsZa6xbo0rKU8EijQtvn0M8XZZrNMyUQ0oMosWDzaWsBpXbf+EtKXmu399+RbBR9awe/yqVLFwo31/rMJorsblalvBy5dreIQ3kjxxUr15p0EUXJBsKfEincu87Op6qY7kTqTBXpHYHkX0oYhubOfnDvyFKxlowalcTo8qNLTkgt8uRn9YTuT2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nQ+Gvwdd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nQ+Gvwdd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZxbk6nbWz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 09:02:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCB6B5C5B7A;
	Fri, 25 Oct 2024 22:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779EAC4CEC3;
	Fri, 25 Oct 2024 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729893760;
	bh=ehUyipyJYKOHtqA1xl/ASG6Px2MP+X3bw4HigUGDv+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQ+Gvwdd9yysGsp0/7UPqj/qXd3zSzWYpyvhpi0++ZJ5oQTUKoSH0rAiYPTtQ9twV
	 qkHDbr3AJhjxOl6A1njpP1LPsg5esbBqjAK0dw53bkgrilMNsjgC8+SWoctEzkofEe
	 q5umojB4/VPj4s/EOR8drq3xpoD+hK70iS+el1oIMN7x3T4ma4ag8dWhGsBPuFPD08
	 X7fDq4cuocWDtE6fuI3dssWTW6C4FHK/Nv0gXa6ZDOzj9d21s6umvhxfOdT6/qSJJk
	 9Kfr57sbZvF4ubur0lRMtnU0gryP99paij167WI2Z/0vW9vxVu0blssafGUNty8k6B
	 scwlea49za9xA==
Date: Fri, 25 Oct 2024 22:02:39 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <20241025220239.GB2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
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
In-Reply-To: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > the arch-specific code was built, only register them when that code was
> > built *and* is not falling back to the base implementation at runtime.
> >
> > This avoids confusing users like btrfs which checks the shash driver
> > name to determine whether it is crc32c-generic.
> >
> 
> I think we agree that 'generic' specifically means a C implementation
> that is identical across all architectures, which is why I updated my
> patch to export -arch instead of wrapping the C code in yet another
> driver just for the fuzzing tests.
> 
> So why is this a problem? If no optimizations are available at
> runtime, crc32-arch and crc32-generic are interchangeable, and so it
> shouldn't matter whether you use one or the other.
> 
> You can infer from the driver name whether the C code is being used,
> not whether or not the implementation is 'fast', and the btrfs hack is
> already broken on arm64.
> 
> > (It would also make sense to change btrfs to test the crc32_optimization
> > flags itself, so that it doesn't have to use the weird hack of parsing
> > the driver name.  This change still makes sense either way though.)
> >
> 
> Indeed. That hack is very dubious and I'd be inclined just to ignore
> this. On x86 and arm64, it shouldn't make a difference, given that
> crc32-arch will be 'fast' in the vast majority of cases. On other
> architectures, btrfs may use the C implementation while assuming it is
> something faster, and if anyone actually notices the difference, we
> can work with the btrfs devs to do something more sensible here.

Yes, we probably could get away without this.  It's never really been
appropriate to use the crypto driver names for anything important.  And btrfs
probably should just assume CRC32C == fast unconditionally, like what it does
with xxHash64, or even do a quick benchmark to measure the actual speed of its
hash algorithm (which can also be sha256 or blake2b which can be very fast too).

Besides the btrfs case, my concern was there may be advice floating around about
checking /proc/crypto to check what optimized code is being used.  Having
crc32-$arch potentially be running the generic code would make that misleading.
It might make sense to keep it working similar to how it did before.

But I do agree that we could probably get away without this.

- Eric

