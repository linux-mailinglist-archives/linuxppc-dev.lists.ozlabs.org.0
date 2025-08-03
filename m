Return-Path: <linuxppc-dev+bounces-10546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90ABB196B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 00:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwDnl1VgPz2xlL;
	Mon,  4 Aug 2025 08:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754260027;
	cv=none; b=KH1cBMyxxkWLxQAH7Ebbd18mQOrJZoM42PBdSK+RdLaEXUPfqciQs5L5JjOWLlYLbF5vcqgRGGfJAgU/cXscZPEVwnOWhu/zOJpV7fojoePrLzGGvYd1c5ugkFdOB4/sGuXC6uX1f2n+sJK1TyKGa06xCaLKT2k1P3Lzpekm2pGLnsWeaDjo/BQI9NugdWsH3Z58bGe1uhTqgE6p5Hv2CvRbfCLfJLWYbagBZ4Gqhvij6Xr4mMSxxzepnn1eaoAWPWz5v/n1vBawApXdK1njjiZzjBc2nI5iVVUoGqTlSn1QcXDwe9kRWXskSggPEtk1XwPUj8QgKsr7ApmiKcF8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754260027; c=relaxed/relaxed;
	bh=s21PnXNLewgKqMr7W/CtUj8DUKEx41Jj5zDAY56zg+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQZBbA9Ara77pWDjaSETUTeYoywrfIAymglVbmezt7NPAWsNHxBTEyHVvaAj9K7+eMONP2AdyKPybLHq78rdopjSgdn5/b9ypKkIvwllrWuSfEm9vU0BCvGbSgJgXvJbvF7gIZejC3F3vqNk1nh+Q8ryJxWKmkwUImZ1c8LqAwiUibexVyrsouwti6O0WJCnWbBQQzidRnIhoTXuDOV9/+1vPJZ3fcsmSfR7b3WsGLelnId6XBrowVgJHRNob8DoLTXNFoS/FUtmFK7WOEwPTXs73hgaDpt3mRdWXMBKLZeG3Eu09J0RkvkL5IudkP8ZuP43vKkrDlatDf7D5kpUfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwDnk23wbz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 08:27:06 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 573MR2Ob1823279;
	Sun, 3 Aug 2025 17:27:02 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 573MR1Ii1823278;
	Sun, 3 Aug 2025 17:27:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 3 Aug 2025 17:27:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <aI_iNQXxU6wKPEN8@gate>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <aI_djr4v-3nQqG9E@gate>
 <20250803221438.GA119835@quark>
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
In-Reply-To: <20250803221438.GA119835@quark>
X-Spam-Status: No, score=2.3 required=3.0 tests=SPF_HELO_PASS,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 03, 2025 at 03:14:38PM -0700, Eric Biggers wrote:
> On Sun, Aug 03, 2025 at 05:07:10PM -0500, Segher Boessenkool wrote:
> > On Sun, Aug 03, 2025 at 01:44:29PM -0700, Eric Biggers wrote:
> > > MD5 is insecure,
> > 
> > Really?  Have you found an attack?  Can you explain it to the rest of
> > the world?
> > 
> > MD5 is not recommended for future cryptographic purposes, there have
> > been some collission "attacks" on it (quotes because such a thing is
> > never an attack at all, merely an indication that not all is well with
> > it, somewhere in the future an actual vulnerability might be found).
> > 
> > Since there are newer, better, *cheaper* alternatives available, of
> > course you should not use MD5 for anything new anymore.  But claiming it
> > is insecure is FUD.
> 
> Many attacks, including practical attacks, have been found on MD5 over
> the past few decades.  Check out https://en.wikipedia.org/wiki/MD5

There is no new information on that page.  There are no practical
attacks mentioned there, either, just some collission things (which
never can be practical attacks for most applications).

> > > This commit removes the PowerPC optimized MD5 code.
> > 
> > Why?  It would help to have real arguments for it!
> 
> Sure, check out the commit message which mentioned multiple reasons why
> maintaining this code is not worthwhile.

Of course I have read that, but that information went missing, if you
intended to provide it :-(

You are replacing a known-working target implementation by a lower
performance generic implementation.  But is that one known-working at
all?  Does it come with tests?  Was it tested to have the same outputs
as the existing thing, maybe?  Just on a few inputs maybe.

We were not told anything like that.


Segher

