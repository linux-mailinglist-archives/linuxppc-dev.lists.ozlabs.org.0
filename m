Return-Path: <linuxppc-dev+bounces-10670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0030B1B916
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 19:17:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxKq01qlfz3bm3;
	Wed,  6 Aug 2025 03:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754414220;
	cv=none; b=NwNR7sYBUwKD8EPqZYHyhU+pXttk/c8LBMyIFIHmdxN4Guq+MpLxjmfcjUQ4msTYFMTx7JFnB3/oU2L/zaS1JKbVOjvbd1OHdCo/TW6wKHipnyqehkciBkMR4Vudg6xT3BOsSI7bZzAHs5apWLp1Gzsiepam35tWCNsZ9eDqo7GUE+gL33/ZBIaLN7iJjXgcuhnmP8ClCsTrmDAmZ1xShagxniWo9Vg53euuci6og8ues4XrW/N6JATBV1D8si1dZWTqftI4fp+Ewfo2gj3loLIH7zSG+DN7f3V4Hxxm7R/mBNY6jQq3Bm3sdv/5zWpXH8eHeMnfWopHQHY9NhOaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754414220; c=relaxed/relaxed;
	bh=uKPi72BuxvGsuOTv4GjFc1VedVIqjRIDcfUOlRGE73g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYIZqgSTM9osM/hd4AjUk5h/yC8j+/eTgqBl9kutDKJKACvCmkVoDn7UHdUCQXPheGyw0w9UCNseC0t0tKQTcL8O3Uj7q5Hx/G7f6/YwhISVApLBKfyV3X3d53QLKRm+qZkESZwm02M3E5mt/PASx6DVVHHh2rRR5cXHIwD3sRwlv74CKavckFbVxFbWEsxIHzgLX9Id94UIHSpCaKByDoKPnYdiXAU9Ss07PYN48kNmeHutCK2uxzaSrFaMAzXBXd/MjFJnXwqTS7VDa3NwL8zEMpcLfr0BiZ1KgeEjjdaWYOE+eiFOpo/dFy+ECJ/GGw7oiGOlfhn82usZT6eqrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRYG99sc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRYG99sc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxKpz2ZjVz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 03:16:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 212B75C660D;
	Tue,  5 Aug 2025 17:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762CBC4CEF0;
	Tue,  5 Aug 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414216;
	bh=YfPLugcY/4DNYLvJWGV+HUVg0Siur4tr4bhOtIjPq3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRYG99scX5PpcPD92+lXtvbuNPsFs1I6wKB5/PXi/6ldu2DQpZe+ntBllKw1dCqu0
	 vztlgCn9/cBqwNnXtFy8Q91/UQlNGVdl/iqdUNSoOqhbryjPDerQBCxto3nwMfh6Uw
	 xY5kn00Yt0nPi71vufuyf74O2qgJhSKRtDhcV80MMAVGMIzU6bjyX43oroScX1yKmp
	 B3v/Fq+/VCem8zYFbOPxA+GPZ+QSdQine5wA9kEprm9h0V6fRk2qjFhmDILnPWWOqW
	 GSZV4xr71jAJtUnusPCPxeKZZ2hChxgvS6z9PbfRVR8IPA58TMq5pEtz5ZrMhteDPp
	 Pfob2koRbbVJA==
Date: Tue, 5 Aug 2025 10:15:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: Crypto use cases
Message-ID: <20250805171558.GC1286@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
 <20250805045846.GA10695@sol>
 <854efc41-c40f-46c9-b8ae-84bda9d17faa@hogyros.de>
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
In-Reply-To: <854efc41-c40f-46c9-b8ae-84bda9d17faa@hogyros.de>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 04:17:49PM +0900, Simon Richter wrote:
> Hi,
> 
> On 8/5/25 13:58, Eric Biggers wrote:
> 
> > What does this have to do with this thread, which is about the PowerPC
> > optimized MD5 code?
> 
> Hence the new subject. It is still related to removal of code, but asks
> about the bigger picture.
> 
> The code removal changes you've been pushing lately absolutely make sense in
> the context of "the crypto subsystem is for internal use by the kernel, and
> all known users will only ever submit small work items."
> 
> However, there is also the userspace API, and hardware accelerators also
> register with the crypto subsystem, so it is *also* the way for userspace to
> use specialized hardware.
> 
> If these are separate, then it makes sense to acknowledge that the kernel
> will never use asynchronous transforms for anything, simplify the internal
> API, and move all the hardware support to a separate registry that is for
> userspace applications only.

I think you're grouping together different things that aren't actually
very related.  For example this patch series proposed removing some
software code, not async drivers.  The only async driver I removed
recently is one of the crc32c ones.

Doesn't lib/crypto/ largely accomplish what you're thinking of as
"separate registries"?  As we migrate more in-kernel users to
lib/crypto/, the old-school crypto API becomes more focused just on
accomodating AF_ALG users.  However, that is, and will continue to be, a
long process.  In the mean time we still have many in-kernel users of
the old-school crypto API to decide what to do with.

> I'm also not convinced that fscrypt cannot ever learn to submit a single
> large request or a large batch of small requests if it is asked to decrypt a
> large file, so in my opinion the common registry makes more sense.

It's certainly never going to be the entire file or a single batch.
That's just not how filesystems work.

As for offloading entire I/O requests, fscrypt already supports that,
just for inline crypto engines instead of the old-school separate ones.
Inline encryption is fundamentally much more efficient.  The same
efficiency can't be achieved with a separate engine, even with a large
batch.  If people would like to continue to explore that approach
anyway, they're free to do so, but it's not a promising approach, at
least not on any of the platforms I examined.  (And pointing to
irrelevant data, like for compression, is not helpful.)

> Making sure that hardware support actually works and is tested is the
> responsibility of the driver and port maintainers. We understand that
> subsystem maintainers do not have all the hardware available, but the same
> goes for all the other subsystems -- the DRM maintainers routinely merge
> drivers for hardware they do not own, because the changes come from people
> who *do* own the hardware, and have tested the changes.
> 
> The latter is a project management issue, mostly: if there is a lack of
> working relationships with driver and port maintainers, then that needs to
> be fixed, not assumed to be an unchangeable part of the environment that
> technical decisions are made in.

This significantly understates the challenge that exists with a large
number of drivers, including orphaned drivers and architectures, as well
as the high standard of correctness that cryptography code needs to have
vs. more everyday device drivers.  And also the fact that async offload
drivers are fundamentally much harder to get correct than software code.
The odds are really stacked against everyone here, and I think calling
it a "project management issue" largely misses the point.

- Eric

