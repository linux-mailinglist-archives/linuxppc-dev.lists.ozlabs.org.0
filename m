Return-Path: <linuxppc-dev+bounces-10622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA99B1A8F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 20:09:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwl205kNzz3bkT;
	Tue,  5 Aug 2025 04:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754330968;
	cv=none; b=D9THUfrhWaT+m35RKjqWQYskCmMPmldm3E2QOEq3Se/dUXWnQm6zTDsfBN7kJdb9T31aNiOWxtyDluQoRaj/uGgNwsOUIZ/TOxEcRqEKgvo/EyxQNDafpJs00dmiGMnpnq597uS/3E1hzyLV4r+GjlgvMwnsxweLnord+0K8jJbcU7dF5X6lPK9ST3j0Y6ToOZeJaab3SaQ9t3BH1pIz0LYrzffx/7dvAJDAkQMrDdyALeLhBiJfyglbyNhrhMrD4x34mkmBxNhOHehg/EcehAZasjDiqyxyCZbMIYi63FyH7rfcngF/6TYm+TaEMWqOUOfu0WEPpy1Q0ftPRzXDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754330968; c=relaxed/relaxed;
	bh=5tIc4IC9X+cqDVzFfjxmM9fUbkE8jQq7GwuLQorj1/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVIZxA3EUdw/ON046t33Qke4RXtfr4BNYp4oo+H3IR7eITxgW/TSMSbrxEAA0r7JriL2W82vVF3uHEzmVEPv/bKVe3ZYMrl20LkD/r8cnBrBOdPfywuh1hAbMx/Vh4CkpCZxJLLpq/AggAMNmNaVLOR05R7klkF6Dqtp/j9JNt1L46iQw+Xc+qTRrgIeAA/tQy9aJA4JIFBcUsmIspXpDySYKfUppRNGb46M6/aobrE67dX5jkrxNV6HKJhaHLpCEYwa0CiQ9vbtye8DcEUDX/b6IDiRGuImVyJ0L4sK3m9ouRmJN4vQc03W7i2LIQxhIZcbMX3tZk76WJZi2VgCoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YwFZeR2y; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YwFZeR2y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwl2019kvz3bjG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 04:09:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BBAF6A55A8C;
	Mon,  4 Aug 2025 18:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CB2C4CEE7;
	Mon,  4 Aug 2025 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754330965;
	bh=0USMjK4bFmBT5ziPLDKoVgtPQA2WM1TCditG8vsffFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwFZeR2ylLcX8iKjBZdrv/xsDlU4RzJk5JNW/pE1qNLR3PjUiyCRipLrRS1T2Ks1Q
	 u+1Mad1+GvBVd2ZhwNTNqKa33qXWkgZDKLPA8ngsNPYCjFco/7lKHWiH0x5Z5OwHbA
	 1cRJKHKlGMx7pq//xfetHA8plhXIV8R+XQMRlwgu64bOsXG12bRF/wM1HhURXe8D6g
	 aawxFa1qktm708BX44aw2ghH4wrnNRGYaaNfl94x4+Ss+sTvaJhX2+xtIQPSdy4FWY
	 dSWTO6C/cC+z0/gXR5HahHC8MjdN/sy5wnFovMxE3xyOWYbPezrb70vxOL64E02cV6
	 QQk8qeWV9t7Vg==
Date: Mon, 4 Aug 2025 18:09:23 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250804180923.GA54248@google.com>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
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
In-Reply-To: <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
> 
> 
> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
> > MD5 is insecure, is no longer commonly used, and has never been
> > optimized for the most common architectures in the kernel.  Only mips,
> > powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
> > only the powerpc one is actually testable in QEMU.  The mips one works
> > only on Cavium Octeon SoCs.
> > 
> > Taken together, it's clear that it's time to retire these additional MD5
> > implementations, and focus maintenance on the MD5 generic C code.
> 
> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
> several applications that use MD5 for various reasons on our boards.
> 
> I ran the test on kernel v6.16 with following file:
> 
> # ls -l avion.au
> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
> 
> With CONFIG_CRYPTO_MD5_PPC:
> 
> # time md5sum avion.au
> 6513851d6109d42477b20cd56bf57f28  avion.au
> real    0m 1.02s
> user    0m 0.01s
> sys     0m 1.01s
> 
> Without CONFIG_CRYPTO_MD5_PPC:
> 
> # time md5sum avion.au
> 6513851d6109d42477b20cd56bf57f28  avion.au
> real    0m 1.35s
> user    0m 0.01s
> sys     0m 1.34s
> 
> I think the difference is big enough to consider keeping optimised MD5 code.

But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
it has any effect on md5sum.  The difference you saw must be due to an
unrelated reason like I/O caching, CPU frequency, etc.  Try running your
test multiple times to eliminate other sources of variation.

- Eric

