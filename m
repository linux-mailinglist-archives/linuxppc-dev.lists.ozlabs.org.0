Return-Path: <linuxppc-dev+bounces-9206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E3AD15FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 01:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFsD03spJz2yZS;
	Mon,  9 Jun 2025 09:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749426432;
	cv=none; b=Wr2UYh0eYracIW/zIy9fMJoyIILa/i4zbLDf27jH/Yit85NMjjwW/7O4sabAcFUz97hiEVc+0KXa0zaCwWptfiaiXkIPQg4bVBJ/37C2pLQejZic8z/pnnYMFio39BiX/mjHW8F0IMuz4NoMM2nbTVa9iRHRcTngrs+j0WmR9CnsaY7BwvjCdxgMmYSd5wLFP+R5xCq9l4o5LY/9wAWQ6l3pffN8qBGac+41fZzEEpwk2yFs5qSA7qzoD5oxli1Ucw37wSswck2R+PS4mRRcdAVjHuTdzakh1dv7KRLPVKvnMZevSdXo/xPq0LW0Qt6pjjRgYZyUzEluakOG06EEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749426432; c=relaxed/relaxed;
	bh=koeyGqy9geqWWGboYYe/s1BFD6/F+f/laW8jqXjMlgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fvdq1IbuXmtXYejXjEfqp+hDVl3AJ5kYr29QOKjNwFHCm/8y8eZt1Zkv4LTT5jYSDlIlXfrDbWJx/mzRprcEAqclKmjT9/Y2MX+9xK/VT1V5rUcpl0HOV5a1iL2EV3yIt0VzBuYSwnuT2CHpB/EMcpf0PMJQQlRWAWFSLVdQs1zobiVGLQVnI1hzGmEqWx0oGAGbSflK8z6sj22v6xTklPL9NIJOWtN/HgVhB0p5dBd778Jm9HlUpOVJkjbhXOexuuI0ACaQZk1GWHG1DTJwDH/lgd/Zoxx0zh3slEmCwg55nzwyTGo50OVjzunFFesgQDLw/uhvhc//8Py8M49itA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EPyWCyBV; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EPyWCyBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFsCz2dWGz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 09:47:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C5A0A4F6B4;
	Sun,  8 Jun 2025 23:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8491AC4CEEE;
	Sun,  8 Jun 2025 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749426428;
	bh=He/qqF7BxEbAQ+KhVIwOAYIjY3DpawZEJHr+Xte/K6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPyWCyBVPXpu72efvExgg8gLAw9penLyFzlo1qRsspsqyd4JZoFxW7hHQvlnEtIIa
	 1BxGaS04c9RuFEve+dtCt1LEb2SSISR2VgjLm0WYXRDHNt8nXsOorMQAj8PjQpmAB0
	 F5rfSxl/09kNUJny72FkrWqXDDqrWHkySwoyI3r23w9s9UZxhxYgVcxmIH21znQLYr
	 RAY4VaCbmTRnWUl2bEewz1enz7kzJYX9fFC9W66bUVBifTQ9wgF652vwOiRoE9mHCR
	 SyixTBnJQbaXXeJQKz8gWyl2YRqW1kNgBMYmIhv1mCruOadbFAPFkGtBFHhXGzcMB6
	 +EWaHxDKp/9YA==
Date: Sun, 8 Jun 2025 16:46:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/13] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250608234646.GE1259@sol>
References: <20250601224441.778374-1-ebiggers@kernel.org>
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
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jun 01, 2025 at 03:44:28PM -0700, Eric Biggers wrote:
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
> 
> As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
> 
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
> 
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.
> 
> Patches 1 and 2, which I previously sent out by themselves, are
> prerequisites because they eliminate the need for the CRC32 library API
> to expose the generic functions.
> 
> Eric Biggers (13):
>   crypto/crc32: register only one shash_alg
>   crypto/crc32c: register only one shash_alg

Applied the first 2 patches to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

The remaining patches have new versions in the v2 series.

- Eric

