Return-Path: <linuxppc-dev+bounces-9068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4CBACA10C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 01:00:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XWS3tkLz2yF1;
	Mon,  2 Jun 2025 09:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748818836;
	cv=none; b=lW3hVjphXaTHEC4EyxZfCft67e024HgGQ/uI+0sZSlBudjT9PwXhpbnf/GwNKDmQXMY1QxLhEiNZeZRSU5y0LhX/VmOrzQ0hUtYjp/KT0sVdeX0ZsR9D8/PK7zD6mV8DlvT6i/NfBZ6dczcVqoHhODJ/VYnTdH0V6s51/w+7ZFHzJWOoEogV4wQ22Jup0Tuvrz/J+Q6O65S9qeG17N4mv5jNQVZOdMwd9Wo7cfo1ggLBs7nP1BUbvmd4IfC6YLbrGEY0cNDqqKAUTysX6mzKbLbh3lAOyh4Rfcx1loii3OKeQ+cDPVGDsAlqu+nWGyBUmLjGCQFNAH7JwuOlVKmywg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748818836; c=relaxed/relaxed;
	bh=VLdinv37uoJCg/NqMkaiZgFpI3acFDq5XCKcz59TcpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcuyGJFIzGaxL4XXBCe2eU3c4N5f0MPVxUogLS6qfYpzkjXMJVIuwCOcYBTOoNCRkARgZRGfbeqGz1Jg6pdwx9JHtXIIjSGvDYNFtmDUYtoMIZzVnKPc91pB+xUNzV4+my1kCyDFg59DIAjvZ3/Iywy7oqWOr6GyaZBH2UZQIEJpzPF2S2NFDU13+Vp8U54xCpUeGb4p+62dH9fNe4/4oVpU77iSjvthvY6t4XQNzAkFHeydnfzvpgAJiuyXFLAIfQmO1DVnBvlniaFenjkplDVpbgVdkmTcc7ZHagMrStVweeX2F3eDCdrYBScmjiBV0gzTCBpEVwr5dkXZ8LKwjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vHFxc2VE; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vHFxc2VE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XWR5Hqdz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 09:00:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA61F60EDF;
	Sun,  1 Jun 2025 23:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CC5C4CEE7;
	Sun,  1 Jun 2025 23:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748818833;
	bh=9iuAqFgWuAM8zbaClmJE1PWkDiz9aDszJI49BnUralg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHFxc2VElAHlFA2+p6pUxtFWEe5J4xv+o56KAxPCmT8t7sop9JD+tvRSV5M6+149b
	 3yslurmUrK9306e+AjqkjU66ZE4+J12qO4pfC9GKOwcLYIKirbFU/Rg2oRbbVA43ns
	 5uDfSlrlHs9e9hvwYN9GazeDaNtZ3XeMSpkJHQHb3lkfbDihKnyqOzItzJyKZ/V5SA
	 kll91RZkjqNe9evwrPUGhmeKBh/iuKFMYirrTrajg0Qa5HWH48c/p5D7scSRNhf3bP
	 g9JW0K0QMuooWlvxhFXufeAQiYS/ENsn141k7rnLZBFnOMguZuObdXNfv/1/r4saJT
	 S2ckVl3S2NSgA==
Date: Sun, 1 Jun 2025 16:00:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250601230014.GB1228@sol>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol>
 <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com>
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
In-Reply-To: <20250530001858.GD3840196@google.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 12:18:58AM +0000, Eric Biggers wrote:
> On Thu, May 29, 2025 at 04:54:34PM -0700, Linus Torvalds wrote:
> > On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> > > similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> > > symbol.
> > 
> > Yes, I think that's a good example.
> > 
> > I think it's an example of something that "works", but it certainly is
> > a bit hacky.
> > 
> > Wouldn't it be nicer if just plain "crc32c()" did the right thing,
> > instead of users having to do strange hacks just to get the optimized
> > version that they are looking for?
> 
> For crc32c() that's exactly how it works (since v6.14, when I implemented it).
> The users call crc32c() which is an inline function, which then calls
> crc32c_arch() or crc32c_base() depending on the kconfig.  So that's why I said
> the symbol dependency is currently on crc32c_arch.  Sorry if I wasn't clear.
> The SHA-256, ChaCha, and Poly1305 library code now has a similar design too.
> 
> If we merged the arch and generic modules together, then the symbol would become
> crc32c.  But in either case crc32c() is the API that all the users call.
> 
> - Eric
> 

I implemented my proposal, for lib/crc first, in
https://lore.kernel.org/lkml/20250601224441.778374-1-ebiggers@kernel.org.
I think it's strictly better than the status quo, and once applied to lib/crypto
it will solve some of the problems we've been having there too.  But let me know
if you still have misgivings.

- Eric

