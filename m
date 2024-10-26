Return-Path: <linuxppc-dev+bounces-2615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893C9B1486
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2024 06:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xb5lg12Zwz2xy2;
	Sat, 26 Oct 2024 15:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729915807;
	cv=none; b=QgwpWGnLdUm/H8zxaA7B1jZiO3GOW0vooMctORoktXDjPdM46YhrDXe7+7yemHWHJs4ydAIci0a+8K5tojS+wVI9cXaGZuZbN74RekbTEBIbXM+KkuHhNEEYbjbqGHY4qaQjrNN+IDs2tN+5HdUsgK3sGdGN761/P5AL/Oe8JEYk70KyRaQ6tAanchKg33fK5y22qoyB0fZuyfFHJ/d2qTdOrsl9HCnVCDKrPADhnR6Dw0NI9/QKBjJBVaSp/i+EAle3mJk11qWZH2n/b0Hv4EKCS1ECemLU+qzw+JPYk5c189YtkcHlyBJmBs38l/034u+WijUJFP8QHkbKtEU6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729915807; c=relaxed/relaxed;
	bh=jySHzZ8/vGp5shiphRLX2u48Y+EMwjM/czZOmM2fFT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChIZ+W6+R/up6rKA6hm44RaFhQNJM/S4bNMSDsWegV+qV5nCsQuLagSG8hdEgUN1S2q8cLCBjHWcBA9luxjqQXFNWL1a8NRUcCFcCggmNgF9LnS76yKM5W6DCDz2uCo702GcTcZTsKwqKniQiYMA+XdOfUuU2CcEW5m2z6HSlhu4t10IRSGNGRvyNcMJk1DyZLltNI8QZuYjw8SKP69HfD00C31AV6L0/GfpZDSCUBWMCxeGh27r7FULKJtU/+A1DL0gs/PDRf89lgWeotf4K3OdP4lXxum0i/XD2ZRMQf+Q0D/xhMCnZDZZgz7Bkbs659q9gMqc8XJG1ztqNO6yOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dKuSS0eB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dKuSS0eB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xb5lc69qpz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 15:10:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87A2BA40220;
	Sat, 26 Oct 2024 04:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16197C4CEC6;
	Sat, 26 Oct 2024 04:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729915800;
	bh=lF+GZ34WavKbRCh+8SpENUkvMTOj0nNu/+wtL6EWAuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKuSS0eBaRI/CXii2QB5Wp13VN5M0EyqE+pRWQ0FIrWhJKg/vIHpdl8T4W8QxNuij
	 T0CG7+FxcgukLYYess7ilgKdACYxJyTQbvNYi5tggRwq+/XFBRGniANM7V3triPr8F
	 UUsS6muPo9iWYwGQFgwiv9w4YPPRVc28KYUlaAdjilM3SQfI6maVNNNlOFU9fEDXsq
	 Gk3BBORntTohGffZpXt1Y890883/3runspv9c8/UKZctcqZ0RsPobpG7rjK4cA5CnO
	 8NZmDph5HkYR8xfmcMREDDHLdj4UGjCSN4dQNMDqTidBJmggOvZ+kQyIdFd4kqd50G
	 JFBNHlz+eaPyA==
Date: Fri, 25 Oct 2024 21:09:58 -0700
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
Message-ID: <20241026040958.GA34351@sol.localdomain>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
 <20241025220239.GB2637569@google.com>
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
In-Reply-To: <20241025220239.GB2637569@google.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
> On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > > the arch-specific code was built, only register them when that code was
> > > built *and* is not falling back to the base implementation at runtime.
> > >
> > > This avoids confusing users like btrfs which checks the shash driver
> > > name to determine whether it is crc32c-generic.
> > >
> > 
> > I think we agree that 'generic' specifically means a C implementation
> > that is identical across all architectures, which is why I updated my
> > patch to export -arch instead of wrapping the C code in yet another
> > driver just for the fuzzing tests.
> > 
> > So why is this a problem? If no optimizations are available at
> > runtime, crc32-arch and crc32-generic are interchangeable, and so it
> > shouldn't matter whether you use one or the other.
> > 
> > You can infer from the driver name whether the C code is being used,
> > not whether or not the implementation is 'fast', and the btrfs hack is
> > already broken on arm64.
> > 
> > > (It would also make sense to change btrfs to test the crc32_optimization
> > > flags itself, so that it doesn't have to use the weird hack of parsing
> > > the driver name.  This change still makes sense either way though.)
> > >
> > 
> > Indeed. That hack is very dubious and I'd be inclined just to ignore
> > this. On x86 and arm64, it shouldn't make a difference, given that
> > crc32-arch will be 'fast' in the vast majority of cases. On other
> > architectures, btrfs may use the C implementation while assuming it is
> > something faster, and if anyone actually notices the difference, we
> > can work with the btrfs devs to do something more sensible here.
> 
> Yes, we probably could get away without this.  It's never really been
> appropriate to use the crypto driver names for anything important.  And btrfs
> probably should just assume CRC32C == fast unconditionally, like what it does
> with xxHash64, or even do a quick benchmark to measure the actual speed of its
> hash algorithm (which can also be sha256 or blake2b which can be very fast too).
> 
> Besides the btrfs case, my concern was there may be advice floating around about
> checking /proc/crypto to check what optimized code is being used.  Having
> crc32-$arch potentially be running the generic code would make that misleading.
> It might make sense to keep it working similar to how it did before.
> 
> But I do agree that we could probably get away without this.

While testing this patchset I notice that none of the crypto API drivers for
crc32 or crc32c even need to be loaded on my system anymore, as everything on my
system that uses those algorithms (such as ext4) just uses the library APIs now.
That makes the "check /proc/crypto" trick stop working anyway.

I think you're right that we shouldn't bother with patches 3-4, and I'll plan to
go back to leaving them out in the next version, unless someone yells.

- Eric

