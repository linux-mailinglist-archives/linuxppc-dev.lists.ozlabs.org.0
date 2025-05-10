Return-Path: <linuxppc-dev+bounces-8489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE55AB259C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 00:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zw12T1J7Sz2yK9;
	Sun, 11 May 2025 08:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746916625;
	cv=none; b=T6SqRlOtnmWlNWbitSixVLp+dBXzmqUZuLCZA79TFM48JqpWK3tkthBhP7jd+1mO5fDpqNDeAHp3J61DX7v0UlRTBBxLJGQO8MmTK0pYIFFkBRqNPSSmcf9AevWt1sun3cqEwhINDTopiqHK5+ccKeZXl+vqEbPFhkHbQGLVM05uF6HN+FfiAqLfjtqGQLnlZGRNbFqB/cLQw9Puw9FZ/uNIiafx2FD/bwKYPdPMA1s9oyM0fa7v40u6Xhsww45xO/6SVY9DP8QX2+2jsDT/yr4m0/I0E0rZJ1qMAg1K2amnDpaLZIPojV4pu1n50r6Kz3uS11fKAAvwuG9AO9Eppw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746916625; c=relaxed/relaxed;
	bh=w4NKgkQc4x4HcUB4pq3vBBlY6jjQ8zZNWGIisjBEyrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVmOLb3L26DVxdqNBqLKS2Zwr6/VnHADMFYEjBdkJRcve4wPp58PhnJ2MbEL9yWgvhpjbqn6m1uQjcx14R6UTI43gW3k6hCvJ5klU3H2dBja69naNTROrMNTV4nX8CtdqaraYYoZhooNebl9cfKpDtQqbmQ7ZkXhSGeAE1J7JT0k+fZ2Jt99K0gGd3tj4OEphmV93JDrTY1hazpJjH7GrlBgfjgQHJ848OUHVfVEyyPpirYgb95ttbkykLqAle2qoVqNwBCQnApdvctSibZfjs7jMKZYVEbfiXTMXwtu4qasq1loTuI7b5bzFRlhVD06EIcaGUaFe7DJx5cMdXeY4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zw12S0jWNz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 May 2025 08:37:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 54AMY5A8009132;
	Sat, 10 May 2025 17:34:05 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 54AMY1Rq009126;
	Sat, 10 May 2025 17:34:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 10 May 2025 17:34:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch wrapper
Message-ID: <20250510223401.GK30295@gate.crashing.org>
References: <aBtF2jVZQwxGiHVk@gondor.apana.org.au> <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com> <aByX_Y64C6lVRR8M@gondor.apana.org.au> <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com> <aByiNZNxqyTerdYG@gondor.apana.org.au> <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com> <aB31DI4QBBZuQObQ@gondor.apana.org.au> <20250510044450.GA505731@sol> <aB7fvi_FBdnmLUON@gondor.apana.org.au> <20250510053308.GB505731@sol>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510053308.GB505731@sol>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
> On Sat, May 10, 2025 at 01:10:22PM +0800, Herbert Xu wrote:
> > On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
> > >
> > > This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> > > failing.
> > 
> > You're right.  I'll revert this and apply the following patch
> > instead.
> > 
> > BTW this thing is still hopelessly broken if it's called from
> > softirq context because there is no SIMD fallback.  Yes I removed
> > the SIMD check but it was already broken before that as it simply
> > switched from the 4-block version to the 1-block version if SIMD
> > is not available rather than actually doing something that is
> > safe in softirq context.
> > 
> > Perhaps we should just remove this altogether until it's fixed.
> 
> Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> default from include/asm-generic/simd.h which returns false in softirq context).
> Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> PowerPC folks (Cc'ed) a chance to fix this before removing the code.

What doe "may_use_simd" even *mean*?  At its declaration site it says
"whether it is allowable at this time to issue SIMD instructions or
access the SIMD register file", but that is 100% meaningless, you can do
SIMD in GPRs.

On PowerPC we have two separate register files dedicated to SIMD-like
stuff, the VMX and the VSX register files.  Which of those is this
function supposed to care about?

It looks like the whole "may_use_simd" thing is a misguided abstraction
unfortunately :-(


Segher

