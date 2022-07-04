Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF4565287
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 12:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc2Q93qDFz3c1Z
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 20:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EdhFPHDu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EdhFPHDu;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc2PV1X2fz308w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 20:39:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53716615AF;
	Mon,  4 Jul 2022 10:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8953EC3411E;
	Mon,  4 Jul 2022 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656931194;
	bh=gR4HOPhNO5setZ4ev2cNXDckzoZRVCBhi+LR6P6HMRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdhFPHDuRzi+zPT235s/h9K5aCIQFAvAd61Bj76J+WVdYsr/M23YGQBvFADpKiHRx
	 U2rZ05ZIm/1MWGgQ9b9pz03fitYc1tqE9zpEtRi9tz/aSqzz7/w7qi5Oh8bOzeP4HF
	 uYucsLWs1VLADAJLyoTU7wh7uL8qHVnuXpV9CYSBqVOQkmXhvrmd/nFlhWgqv6MtfJ
	 b+Ay4I6uGr2tae6Ekqp7BuJ9j7qG+2XL0uO+6hPRjzkRvQ+stkxIpJmw/En9bKGlpn
	 IW60usuMxvOHAihAst3QBkeDfHoDdB4Z+5vzz/LenciQJuG2Nt55577UX2hs2lOzU/
	 /AxfC0qq+cOeA==
Received: by pali.im (Postfix)
	id 27EB66E8; Mon,  4 Jul 2022 12:39:51 +0200 (CEST)
Date: Mon, 4 Jul 2022 12:39:51 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220704103951.nm4m4kpgnus3ucqo@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 04 July 2022 20:23:29 Michael Ellerman wrote:
> On 2 July 2022 7:44:05 pm AEST, "Pali Rohár" <pali@kernel.org> wrote:
> >On Tuesday 24 May 2022 11:39:39 Pali Rohár wrote:
> >> gcc e500 compiler does not support -mcpu=powerpc option. When it is
> >> specified then gcc throws compile error:
> >> 
> >>   gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
> >>   gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> >> 
> >> So do not set -mcpu=powerpc option when CONFIG_E500 is set. Correct option
> >> -mcpu=8540 for CONFIG_E500 is set few lines below in that Makefile.
> >> 
> >> Signed-off-by: Pali Rohár <pali@kernel.org>
> >> Cc: stable@vger.kernel.org
> >
> >Michael, do you have any objections about this patch?
> 
> I don't particularly like it :)
> 
> From the discussion with Segher, it sounds like this is a problem with a specific build of gcc that you're using, not a general problem with gcc built with e500 support.

Well, the "full" build of gcc for e500 cores with SPE does not support
-mcpu=powerpc option. So I think this is a general problem. I do not
think that this is "specific build" as this is the correct build of gcc
for these processors with e500 cores.

"stripped". build of gcc without SPE support for e500 cores does not
have this problem...

> Keying it off CONFIG_E500 means it will fix your problem, but not anyone else who has a different non-e500 compiler that also doesn't support -mcpu=powerpc (for whatever reason).
> 
> So I wonder if a better fix is to use cc-option when setting -mcpu=powerpc.
> 
> cheers

Comment for that code which adds -mpcu=powerpc says:

  they are needed to set a sane 32-bit cpu target for the 64-bit cross
  compiler which may default to the wrong ISA.

So I'm not sure how to handle this in other way. GCC uses -mpcu=8540
option for specifying to compile code for e500 cores and seems that
-mcpu=8540 is supported by all e500 compilers...

Few lines below is code

  CFLAGS-$(CONFIG_E500) += $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)

which for e500 kernel builds user either -mcpu=8540 or -mcpu=powerpc
(probably as a fallback if -mcpu=8540 is not supported).

So for me it looks like that problematic code

  KBUILD_CFLAGS		+= -mcpu=powerpc
  KBUILD_AFLAGS		+= -mcpu=powerpc

needs to be somehow skipped when compiling for CONFIG_E500.

My change which skips that code base on ifndef CONFIG_E500 should be
fine as when CONFIG_E500 is disabled it does nothing and when it is
enabled then code

  CFLAGS-$(CONFIG_E500) += $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)

is called which sets -mcpu option suitable for e500.


If somebody has non-e500 compiler which does not support -mcpu=8540 nor
-mpcu=powerpc then it would not be able to compile kernel -- and this
behavior is correct, as without neither of these options, kernel binary
would not run on e500 core.

And for non-e500 builds with other non-e500 compiler, this my change
does not have any function change. So I think it should be safe.


Anyway, it you have any other idea how to fix and improve this, let me
know.
