Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B951A332
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 17:07:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtgDr26Kdz3by0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 01:07:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZDVvxDUI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZDVvxDUI; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtgDD0l28z3bbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 01:07:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8AE2B8263F;
 Wed,  4 May 2022 15:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D335C385A4;
 Wed,  4 May 2022 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651676838;
 bh=FNwGFZSSghL9KJyuzsHgp8CpQhQa/0a0SraBBTLra4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDVvxDUIhbbvKmGH5qGnShIF1ZmFCdyILLdSTu5IRtMrPoUPUnDmdmWAQ2i951dTy
 sFe7kaYhdE6HyCKFVpsv5Y+USd8z20/mJ3U+O1CMigypiOVKZVoTMINI0BTLJOHXU+
 OuWb26ahdNvM79PpbePCO8CNFmu/34V01YSJLxYw=
Date: Wed, 4 May 2022 17:07:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
Message-ID: <YnKWpUVITMjaUUkt@kroah.com>
References: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
 <877d7ig9oz.fsf@mpe.ellerman.id.au>
 <YmF0iajmlAg6Kj9I@dev-fedora.thelio-3990X>
 <YnGfyLAkB3NG+Ms2@dev-arch.thelio-3990X>
 <87o80eugqj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o80eugqj.fsf@mpe.ellerman.id.au>
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
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 04, 2022 at 01:19:32PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > On Thu, Apr 21, 2022 at 08:13:13AM -0700, Nathan Chancellor wrote:
> >> On Thu, Apr 21, 2022 at 05:46:52PM +1000, Michael Ellerman wrote:
> >> > Nathan Chancellor <nathan@kernel.org> writes:
> >> > > Hi Greg, Sasha, and Michael,
> >> > >
> >> > > Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
> >> > > a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
> >> > > versions of ld.lld [1]. Additionally, it resolves a separate boot
> >> > > failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
> >> > > reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
> >> > > problems, and does not appear to cause any other issues in my testing
> >> > > for both trees but I was curious what Michael's opinion was, as I am far
> >> > > from a PowerPC expert.
> >> > >
> >> > > This change does apply cleanly to 5.10 (I did not try earlier branches)
> >> > > but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
> >> > > kernels in that branch so to avoid any regressions, I think it is safe
> >> > > to just focus on 5.15 and 5.17.
> >> > 
> >> > I considered tagging it for stable, but I wanted it to get a bit of
> >> > testing first, it's a reasonably big patch.
> >> > 
> >> > I think we're reasonably confident it doesn't introduce any new bugs,
> >> > but more testing time is always good.
> >> > 
> >> > So I guess I'd be inclined to wait another week or so before requesting
> >> > a stable backport?
> >> 
> >> Sure, thanks for the response! I'll ping this thread on Monday, May 2nd,
> >> so that we have two more RC releases to try and flush out any lingering
> >> issues. If you do receive any reports of regressions, please let me
> >> know.
> >
> > I decided to wait an extra day just to give people the opportunity to
> > install -rc5 and run it through their tests. I have not heard of any
> > reports yet, are there any further objections?
> 
> No objection.

Now queued up!
