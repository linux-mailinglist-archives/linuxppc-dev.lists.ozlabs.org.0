Return-Path: <linuxppc-dev+bounces-8490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45EBAB25B7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 01:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zw1zS3YTHz2xsM;
	Sun, 11 May 2025 09:19:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746919172;
	cv=none; b=TT3G2b0O25vMkDGmZ+aFkp53pbBfC10QKFPbnPxdyxCRdMFkI8sQEXpOOVTC5IySdHIDycKbCkU+Q2bnp2a0muAHS18KEsSsd1kdzZBzSCbWx6GevmBRm0teLFDSLP/1ibPClqzfEXI01m8Ppo8Ze5b6zYoruUjhSMpet39/2e6kSHagqkgbz1p6PJiSQzynor4qIkeWqwDss8OLMVM+OwOJ0ugIbAWNaKNBB71vGDPbA5cTc3/Jy8o600RJw/VYcESMOrB5dpE5Cx0EmbK9lUdh85vOv5/mgLVjB0KPMckPvBlVHhnqG0wpylVqPg/oZ/+RpnkKois00JJi6zfrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746919172; c=relaxed/relaxed;
	bh=TdGfvwndj+Ck9nMKFxPjLzEDjPLO5YZIDq90oMJ79+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETjKUAaJKyqZW3fvum5ZFFAk2GrVGEyIh6j6VvHrge7vnIGWrIB0DsqCthGHB+U3IGy3D/mVScXR5R03Uhj8Eo3IlP5Xs26fEBErxCJWZiF1Ltz6MGGMEdJ/N6iw0y7bWfnOIGcOfkSGmayO/jIDvqqsskQHxVQ2phDem8I1yR9gMZuy9ftI3abMquRaT8d+xYRuZrOf1mUh9g6wu2c1Nt+VzJOmmbg1t1/RFp0FKMTiBk54zcR1EgpT58q5LCBLz0DZSyYDo69CGZLKpQqa+sy21QrOrKjf70ka69BE4ekcoK6Pen8PkSwOZ3pY/wRlJbi3KoPbvmw6lPfPLeMBjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DzA5zgRn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DzA5zgRn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zw1zR2CT7z2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 May 2025 09:19:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A0485C54FC;
	Sat, 10 May 2025 23:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A78C4CEE2;
	Sat, 10 May 2025 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746919167;
	bh=iiveGFvRtEE/7L3PlB8ltRM+umAKD4sWLRk0CWtxK88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzA5zgRnbzmu65ys4i8cIDvMFKUxDcedu38LS39tncrWGrnxTc1WSJBviejDqIMYS
	 xfpi9BhKWal5+NmiHPmOAPcUtAFV02JxqmuPoaWiUn9Iok0h2siC6Glysve1epO6wq
	 1vh6fNNXdTY6AkGTxT0UYWdjWHuBIezcvjomesHO4flnF9rT+SPTusgGkkQUfGE91b
	 CSU/vhkndUpuWrHR5PFE28tWv+po9JtO5hnwX1cy8tewqYduAfMP0gyPp/32SCKNcS
	 qoJoGBQRjiftuWRfWnC3U+EcTwVkqzrpgcHDMPDFzH6pqSaf9qVrQyZOkFJ8Usbd6I
	 ZpL/8bunEkLqw==
Date: Sat, 10 May 2025 16:19:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <20250510231919.GA134802@quark>
References: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <20250510223401.GK30295@gate.crashing.org>
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
In-Reply-To: <20250510223401.GK30295@gate.crashing.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 10, 2025 at 05:34:01PM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
> > On Sat, May 10, 2025 at 01:10:22PM +0800, Herbert Xu wrote:
> > > On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
> > > >
> > > > This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> > > > failing.
> > > 
> > > You're right.  I'll revert this and apply the following patch
> > > instead.
> > > 
> > > BTW this thing is still hopelessly broken if it's called from
> > > softirq context because there is no SIMD fallback.  Yes I removed
> > > the SIMD check but it was already broken before that as it simply
> > > switched from the 4-block version to the 1-block version if SIMD
> > > is not available rather than actually doing something that is
> > > safe in softirq context.
> > > 
> > > Perhaps we should just remove this altogether until it's fixed.
> > 
> > Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> > crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> > least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> > default from include/asm-generic/simd.h which returns false in softirq context).
> > Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> > PowerPC folks (Cc'ed) a chance to fix this before removing the code.
> 
> What doe "may_use_simd" even *mean*?  At its declaration site it says
> "whether it is allowable at this time to issue SIMD instructions or
> access the SIMD register file", but that is 100% meaningless, you can do
> SIMD in GPRs.
> 
> On PowerPC we have two separate register files dedicated to SIMD-like
> stuff, the VMX and the VSX register files.  Which of those is this
> function supposed to care about?
> 
> It looks like the whole "may_use_simd" thing is a misguided abstraction
> unfortunately :-(

may_use_simd() a.k.a crypto_simd_usable() is supposed to check whether vector /
SIMD registers can be used in the current context, provided that the appropriate
architecture-specific functions like kernel_fpu_begin() and kernel_fpu_end() are
used.  In the case of architectures that support the use of multiple sets of
vector / SIMD registers in kernel mode, it would have to check for the
intersection of the calling context requirements for all of them, since it
doesn't specify a particular set.

The reason that may_use_simd() a.k.a. crypto_simd_usable() got pulled out into
an abstraction shared across all architectures is that it's used by
non-architecture-specific code, such as crypto/simd.c, and also the crypto
self-tests which inject 'false' return values to test the no-SIMD code paths.

I think the users other than the self-tests are on the way out, though.  Most of
the users of crypto/simd.c just got removed, with CRYPTO_AES_GCM_P10 being the
last one.  A new non-architecture-specific user of crypto_simd_usable() just got
added in include/crypto/internal/sha2.h for some reason (despite me nacking the
patch), but that should be reverted.

So if it's really the case that VMX and VSX are both supported for kernel-mode
use but have different requirements on the calling context, you could make the
PowerPC crypto code use more precise checks like may_use_vsx().  Just the crypto
self-tests won't be able to test the no-SIMD code paths that way, unfortunately.

- Eric

