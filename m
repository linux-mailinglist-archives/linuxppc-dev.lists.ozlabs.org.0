Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA786A9A5D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 16:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSs352Cjtz307t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 02:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XUBMaRMG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XUBMaRMG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSs266kNxz3ccn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 02:14:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81D3D6184D;
	Fri,  3 Mar 2023 15:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00B9C433EF;
	Fri,  3 Mar 2023 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677856443;
	bh=SY8yapFxxlbxxr+YImm1QNyDrMxq689GISGUK9dvGzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUBMaRMGAHRCenjd4RbPqV/bhxgnkH1olWU6j3dlWBghBnruGBN5UDe9zwKa/fyKb
	 QHI0/euHioxKSC5BSqzq3ASq1njWsB+n17cjtNA+19sLHnRqfwteqnCCSte8OjneH9
	 4RwJUm+5zpBUdUZRmVOA4308F9ALarlAACp/dqRo6eUbB19LqpD1tCQV68UsxOw0GO
	 9QnmFWsrQ7csVOffJ8OAYY5A2zSAVjVjT7rAwY/iJ150pJ7wmGIyxhPiGnAU763VtE
	 EaNqwxweAfIhs/Dv/1BWZTTmThYvrPact4rTfCX+ZCVxHZOAxAIK+XkE5evbh5RuIE
	 WcKK8GEuU7MKw==
Date: Fri, 3 Mar 2023 08:14:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
Message-ID: <20230303151400.GA2665@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
 <20230302131656.50626-2-mpe@ellerman.id.au>
 <20230302164324.GB3010526@dev-arch.thelio-3990X>
 <878rgelnhd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rgelnhd.fsf@mpe.ellerman.id.au>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 03, 2023 at 10:53:02AM +1100, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi Michael,
> >
> > Thanks for the workaround and sorry this has come to bite us :/
> >
> > On Fri, Mar 03, 2023 at 12:16:56AM +1100, Michael Ellerman wrote:
> >> For the -mtune option clang doesn't accept power10/9/8, instead it
> >> accepts pwr10/9/8. That will be fixed in future versions of clang, but
> >> the kernel must support the clang versions in the wild.
> >> 
> >> So add support for the "pwr" spelling if clang is in use.
> >> 
> >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> >
> > I think that should actually be
> >
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> I guess yeah.
> 
> >> BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
> >> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks.
> 
> >> ---
> >>  arch/powerpc/platforms/Kconfig.cputype | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> Need to confirm the clang <= 16 statement is correct.
> >
> > Currently, this is indeed the case. It is possible that Nemanja's patch
> > will get applied to release/16.x before 16.0.0 final but it might not.
> >
> > We can always update it later. I think we do want to push to get that
> > patch applied because I forgot that it is only in 16.0.0 that '-mtune'
> > starts to do something on PowerPC:
> >
> > https://github.com/llvm/llvm-project/commit/1dc26b80b872a94c581549a21943756a8c3448a3
> >
> > Prior to that change, '-mtune' was accepted but did nothing. It is only
> > once it was hooked up to the backend that we got the spew of warnings. I
> > think that warrants us trying to get Nemanja's patch into 16.0.0, which
> > may allow us to drop this workaround altogether...
> 
> Aha OK, I missed that the warning was new in 16.
> 
> I'll sit on this for now then until we know if that change will make it
> into clang 16.

It was merged into release/16.x a few hours ago:

https://github.com/llvm/llvm-project/issues/61128

https://github.com/llvm/llvm-project/commit/9b2e09e9fb1aa3bbe3668d7cc585188a3014d1b9

So I think this particular workaround is no longer needed :)

Cheers,
Nathan
