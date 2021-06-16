Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFB3AA68F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 00:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G507F2vcPz3c16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 08:22:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=kxfJFZ5z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=kxfJFZ5z; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G506p6rnvz306b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:22:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G506n6Sf1z9sT6; Thu, 17 Jun 2021 08:22:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G506n5s82z9sW6; Thu, 17 Jun 2021 08:22:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623882145; bh=+lSA81CndlpGSed8SbLpxLrZxMpTOqab6xHIrCRS9yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxfJFZ5zS0BOUnLCK014Mqk4qbpHVSC7q72nPM3/Cg7jZudlbRw88F6fUhCsSjKY/
 Qa0SB6T03VypunQipHxqRwNSD8hV2mVhd0f7Y45wGSELzP66yMqpHKBzv86oKlQTZq
 F1nROHgSQf2ZWllVS0FIc9PDaKCRrkWYHu6dvbrCl6H1bNNp6cHRPeCHq20PTszM7A
 7jzuYHzFhEth+aao4MJV/SQP/GhjDmGSh2PxGIIV9gWJRqCV9Ka3akIT3dh5h2TDu8
 1MflGQueVWRbBviIgF2EozSr2fGSrkAcqdctmjwykcJ/hHYrGxLmg6Xp4zC3z6gggH
 0cCN/SjIWg+Jw==
Date: Thu, 17 Jun 2021 08:22:16 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 07/11] powerpc: Add support for microwatt's hardware
 random number generator
Message-ID: <YMp5mLe3K0DODyoa@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMff6iLDiCbFQmrW@thinks.paulus.ozlabs.org>
 <1623720368.eqmkro3mgw.astroid@bobo.none>
 <87bl86rlv1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bl86rlv1.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021 at 11:16:02PM +1000, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > I would be happier if you didn't change this (or at least put it in its 
> > own patch explaining why it's not going to slow down other platforms).
> 
> It would essentially be a revert of 01c9348c7620 ("powerpc: Use hardware
> RNG for arch_get_random_seed_* not arch_get_random_*")
> 
> Which would be ironic :)

You expect me to remember things I did 6 years ago? :)

I'll take this part out.  My thinking originally was that since darn
on Microwatt is a single-cycle instruction, it would be faster to use
darn every time rather than run a software PRNG seeded from darn.
It's not critical though.

Paul.
