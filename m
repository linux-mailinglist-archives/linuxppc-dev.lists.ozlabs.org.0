Return-Path: <linuxppc-dev+bounces-8483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC0AB214F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 May 2025 07:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvZKD57W9z30Vs;
	Sat, 10 May 2025 15:33:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746855200;
	cv=none; b=fbK0cbZlw1IFk5Ba6vrbQupsCqlWMyYw5xt2D+ubFJc05du48xG2q7CX8lsgtw8TGYhAh2ia58grzQCtObaF3Nq3YZpJ4gWC7veuThSuaPeF9LGKCZqbYea/UWL0HrAg+fCpkrK68iJZV7Li3UvOadVFJY5yM1KwgotNbIzYM4T3I6JFX0g5SK3STGYidSFzjyZxBc3x1oYAEjS5ooCoEaih0So/q+QfL7jlNWp1JwOx834MmT3LxrnsgPx8txhxzDK0cuGP66AHzUNLCkN4//p2TxvUBCaQK2LBxV1nH7SqbHmY5c7FSTZJ82b5Ywx68eC/Scbnnd7bFH3CgH4SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746855200; c=relaxed/relaxed;
	bh=592lGltBXqQPQysW4vBUW9UTU0hc8Fb4LKlTCPPCZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI2iMwOG27S3UTM6GSGtAdxJ6KtdnMBGVjgcKpUlxX5EQIZDShT/oCA299cOBLUCG5M32GRAd3ZbZAABH+cwkIcZeL5If9eKL9zfkxwK2LaxE+hPpLqL0upbSfD+RCsg6A8rKeaR9wbnRXQe4ofqQuvRtlO8X5pCitEwQKcWcjlDW9k1Ej4AR7nEr/nEp+0q4Shbupn7/6kS2IArPf7UNwWovRcYxn8nvA/azvVc/ieRtTbUg1NJ2NcCoegNthA44ktqwI3K9MfouTmBh1a4K4X9KX1ZmU0NeLTsIPJPQkd+BfZAvf5qjR38U61aGyuRv2TmLbJ/tXHNsZjrO/uG3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UghYKtZq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UghYKtZq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvZKB2r7Sz2ygn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 15:33:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F1F4A4C05A;
	Sat, 10 May 2025 05:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31F6C4CEE2;
	Sat, 10 May 2025 05:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746855195;
	bh=VwjCQphGqjKITLICjAVqlj79IxthuExL0Y5AvgVDJU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UghYKtZqXQYjNWAk8+/MO9TguERN1zSS1OX2UKvq+++BWeW155VDvZB5lAX6SwuRS
	 6YHwRdC4LVNNcRpvnTMCqHDwxMSALkXC7isHi9uTIKAHWcQxyhLbw/zEskzOHSrbM4
	 F+KXQsoZgPCMh1m7IWKBg+n9qm068VxwwgcoQ+YZYubEt5A6shRs5LeREoXtXeJ/CS
	 l+a/I+iDF9aWnPMoCyqlq74APfPYiXNt0VeRaW1dxBNdxMG0Z5JP0iEMzNAJ9N6t8U
	 XG3Pj6KEwAttW+e+IqPfmKAg2wEaaO8nJWRl8UrecFU42UlrlrEhIDjRz/8soBYqgH
	 sBX6/LQ64pPug==
Date: Fri, 9 May 2025 22:33:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <20250510053308.GB505731@sol>
References: <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
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
In-Reply-To: <aB7fvi_FBdnmLUON@gondor.apana.org.au>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 10, 2025 at 01:10:22PM +0800, Herbert Xu wrote:
> On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
> >
> > This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> > failing.
> 
> You're right.  I'll revert this and apply the following patch
> instead.
> 
> BTW this thing is still hopelessly broken if it's called from
> softirq context because there is no SIMD fallback.  Yes I removed
> the SIMD check but it was already broken before that as it simply
> switched from the 4-block version to the 1-block version if SIMD
> is not available rather than actually doing something that is
> safe in softirq context.
> 
> Perhaps we should just remove this altogether until it's fixed.

Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
default from include/asm-generic/simd.h which returns false in softirq context).
Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
PowerPC folks (Cc'ed) a chance to fix this before removing the code.

- Eric

