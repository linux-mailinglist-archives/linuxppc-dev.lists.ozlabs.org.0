Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6350A3C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 17:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kkgzj5tBBz3bd9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 01:13:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LojKH+Ya;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LojKH+Ya; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kkgz34x8lz2yHD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 01:13:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B6A461AC3;
 Thu, 21 Apr 2022 15:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10985C385A5;
 Thu, 21 Apr 2022 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650553995;
 bh=6WCbXgBpxcPU3GtPzWHW8qUC4r+/Rl9mlE4qE4NMb/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LojKH+YaOy0AvxtLV5mRs47dd+/pJStciB7OVGgv+y3tVNFG+VbRdavc3z3lkq8LF
 587eZ0ZwZ4W5M+Nj0bNjMKDfPalp7MnpQ7u4K/YapXOYkikLy6MK4bxTXZk3wLWJrO
 Svsgghr6SbEOszSCJpXLfh+A43RiJx5zyhzzfQB6ua6MS+esFgMDWrFkaVXG2Bni+m
 Kid3QFkGJCpzqAwrFf2MNMTIEVfQChE8hVSLFT6VZYj7svBrOgMjL0tVnX0r/nlF1n
 qi0X7qToE/Ww1oecw+JqweEJhtDEs6BDfjszLFvEOot8wctqAh4t0zBFcNroMPo51H
 OSLZJ4LiIdefA==
Date: Thu, 21 Apr 2022 08:13:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
Message-ID: <YmF0iajmlAg6Kj9I@dev-fedora.thelio-3990X>
References: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
 <877d7ig9oz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d7ig9oz.fsf@mpe.ellerman.id.au>
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
Cc: Sasha Levin <sashal@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 05:46:52PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi Greg, Sasha, and Michael,
> >
> > Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
> > a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
> > versions of ld.lld [1]. Additionally, it resolves a separate boot
> > failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
> > reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
> > problems, and does not appear to cause any other issues in my testing
> > for both trees but I was curious what Michael's opinion was, as I am far
> > from a PowerPC expert.
> >
> > This change does apply cleanly to 5.10 (I did not try earlier branches)
> > but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
> > kernels in that branch so to avoid any regressions, I think it is safe
> > to just focus on 5.15 and 5.17.
> 
> I considered tagging it for stable, but I wanted it to get a bit of
> testing first, it's a reasonably big patch.
> 
> I think we're reasonably confident it doesn't introduce any new bugs,
> but more testing time is always good.
> 
> So I guess I'd be inclined to wait another week or so before requesting
> a stable backport?

Sure, thanks for the response! I'll ping this thread on Monday, May 2nd,
so that we have two more RC releases to try and flush out any lingering
issues. If you do receive any reports of regressions, please let me
know.

Cheers,
Nathan
