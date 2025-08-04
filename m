Return-Path: <linuxppc-dev+bounces-10626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659CB1AB24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 00:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwsSC50T5z2y06;
	Tue,  5 Aug 2025 08:59:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754348347;
	cv=none; b=TDRNOS+wLrBh6+xIVO3WyB0OuU4GMak7tEFHm0U0MTFDe5D01Dohlcie1Z698RplsklyyqbqIfloM+8O9Ty4qT9Q8BhMpimSsMEaAINDJS+VVhf10QKenaWN2UImAfS3/6AasuzmDYVPnD05B7nzdPznyWXsOudrvf2x76enMkhJaNYU2CsJNBjH/mhavf3FKPnCbntziMFmjgtOjqgVJbNsnOsp2n/0Zwqbrps+QWewJAR42t2sI3yRe3gBIN0jKQer+Zx6kwu4IOMSJ69HeDgvoFIIKpmlLBQwn8WFVVoIXlRWZbQEFGxyoUgOb88WmeujWNEBfJ8IetNpB9h8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754348347; c=relaxed/relaxed;
	bh=LOusB7E2ipWXlpFnhc/xxWJI0lBauNCSq8Kfjxk3Ero=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCwvOGFLhy8G0qVWdp7AI6CGxI1X1OJd+xWxkqRHUOgkcZaRRhYj4x7uCZd0fivBMYsI2LGrzWxN7YUv92Fd0QyXyV8un856BtlWhalzoQbZMEQKCwjwc0z8lFVM+FT/1ePORGnxpvE2zdFPTitT99Ze6TMW6way20lWB6w6nFBkgt25xsp9IhUOY/QrJ8UTzU74nIunJDdSZgXjZqGSa6b3ydS9OXx7RHTX7xc098GNx/xXSZIbWUHcS8XKcb5OgB0UTe/FIp+sf7waenjnTG/yQsbzuVRFzVxIHkbfpIV5gTi1ktjaSDZenazhbp1T38h6GwottjNqVR1kjxUwxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ivRrWtSu; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ivRrWtSu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwsSB5CRPz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 08:59:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC569A55AD8;
	Mon,  4 Aug 2025 22:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D22C4CEE7;
	Mon,  4 Aug 2025 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754348343;
	bh=/qER347ubgNca1vJIVA2EJEZhgWxYnA/KKlAgCOFShg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivRrWtSu26qH9LsU+sZqAxs0R5VKnScPCpe/hlDYz3+kjmAdIz4GZ0hNGHyYVEU0Y
	 6Na+FfGvs+1pk89tUEGobWEvx6P4HhoMO3oOMOlhjbH9ayzsnBDu8lJfN8gFeJuMh0
	 uvafDyWsKHBW+gKZimM1Dd/KSXE6/pdL9c0Z5ckmol50aJZ3rLTVIVMCphlrpzuMxR
	 Q6J9UJoura3IETnH9tL7elgUGjmPvdDrBKsmVW8vGqchMmxy2LS+5L6eJ0ZKcY6DNt
	 MRbJm2D5YrAHczg0H2wcjHfRmrw8GDMJ2eqim+8DwtLcdXUUKJZImZyW3JHFvsUWoj
	 xVcLdaCwTLzmA==
Date: Mon, 4 Aug 2025 22:59:01 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250804225901.GC54248@google.com>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
> 
> 
> Le 04/08/2025 à 20:09, Eric Biggers a écrit :
> > On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 03/08/2025 à 22:44, Eric Biggers a écrit :
> > > > MD5 is insecure, is no longer commonly used, and has never been
> > > > optimized for the most common architectures in the kernel.  Only mips,
> > > > powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
> > > > only the powerpc one is actually testable in QEMU.  The mips one works
> > > > only on Cavium Octeon SoCs.
> > > > 
> > > > Taken together, it's clear that it's time to retire these additional MD5
> > > > implementations, and focus maintenance on the MD5 generic C code.
> > > 
> > > Sorry, for me it is not that clear. Even if MD5 is depracated we still have
> > > several applications that use MD5 for various reasons on our boards.
> > > 
> > > I ran the test on kernel v6.16 with following file:
> > > 
> > > # ls -l avion.au
> > > -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
> > > 
> > > With CONFIG_CRYPTO_MD5_PPC:
> > > 
> > > # time md5sum avion.au
> > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > real    0m 1.02s
> > > user    0m 0.01s
> > > sys     0m 1.01s
> > > 
> > > Without CONFIG_CRYPTO_MD5_PPC:
> > > 
> > > # time md5sum avion.au
> > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > real    0m 1.35s
> > > user    0m 0.01s
> > > sys     0m 1.34s
> > > 
> > > I think the difference is big enough to consider keeping optimised MD5 code.
> > 
> > But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
> > it has any effect on md5sum.  The difference you saw must be due to an
> > unrelated reason like I/O caching, CPU frequency, etc.  Try running your
> > test multiple times to eliminate other sources of variation.
> 
> md5sum uses the kernel's MD5 code:

What?  That's crazy.  Userspace MD5 code would be faster and more
reliable.  No need to make syscalls, transfer data to and from the
kernel, have an external dependency, etc.  Is this the coreutils md5sum?
We need to get this reported and fixed.

- Eric

