Return-Path: <linuxppc-dev+bounces-9025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DDAAC859E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 02:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7kPM70tHz2xTh;
	Fri, 30 May 2025 10:19:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748564343;
	cv=none; b=IvMXbTb0SDbA7R9HLn31nkKpm+P8rDhPO3zWDS0WzHFN3rTtHDJErjmUSNryADYKP2y0J6Vcyx8tQep56rB2eyBTkvbOvX0ByZo1aWnz8PaEhM8hubdpT7IkgIb+LXSVSFTes1XaZB51dTpz5dOs4wiHkUhqj7KGImVCuFl/pc3j0LaDo/IzVnm7hr7sBPovbP8HYFKeo1eYsPdcAqg+/THGlaV3MA2abBh+Is7bVGv45zcX9TgcCBJIlcVZW1+VrQ1dHNvf8ltmpzRu2aaSUUuO1YCPMPyCHCKj3gEbqxnIIzCOBS7cRCkYfithhDUV8kyj0ZFEgCP0G2Qht76r2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748564343; c=relaxed/relaxed;
	bh=qSORobQUsksrrT6/MFqYr3pO5h8TKDtXq4FbETiyXsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ypue/Oc5YjMTVLz3LGrM4ltAZeTBtNfZL4/FiiuwE8zdf6R17YTb+PiAnFRNpkyBqNRlBDJu/i4lMPKCWWIxQ0nZ93F8IW71iWjUvhw3OYAEjgXTZwuz23tffg36cJWMNwKIm8tBla4PIbAuH0VnNtte1LrdR7GXi7Y7t3LpzWiQhih8rXpTGOqOEa4Khj4TMT5wMAcKeSerJovFLkdJrlHRb1nIolgGfUiOB58oS2j2Zx8JTwAVkobmSd9xPfkT+s05XDDxLumq+dujpwonSjxgI1A1OzSjMDAEvwNPTDicHX2JhTAb6gTwvLK8gDDUbP53MQYrmryqkwHWYKUfmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=orABEw9G; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=orABEw9G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7kPM16lqz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 10:19:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BABE1434CE;
	Fri, 30 May 2025 00:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1318DC4CEE7;
	Fri, 30 May 2025 00:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748564340;
	bh=fzOvslZ2yd+4RFEep1dbc5ORhnJiU65cwMbwzfxOuJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orABEw9GW8hha5WEfX4nOeo6UClo8SCkt06HiIxuvuXY7GIfYcPzgNE32XTnhzdfX
	 kKMuYGPwMqs+WLu0Qj8v4D5q6qNBKBDogc8zbaCiVXEQrnWp9+f4G6a49QkyH5AQMF
	 dDx8VrJ3wVC7iECbcZX0SpWm8aiThHGfvOpkVjVWpDL+74WBH03Q2Ykt1cb+GFASa2
	 NU60WR7MaU4No+If0hsqwvEwuY0P3bfo2S5jzwxo83RXY/5/tgfmwQm04dF8NWmBDR
	 v1DbNr/Hjp64FvFbXKbCNsalVpnA3MSbZXY5ojWWQl9zts6A8OtUTG4mPMeo4MMzkm
	 Ln6fC4JypHUAQ==
Date: Fri, 30 May 2025 00:18:58 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250530001858.GD3840196@google.com>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol>
 <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
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
In-Reply-To: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:54:34PM -0700, Linus Torvalds wrote:
> On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> > similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> > symbol.
> 
> Yes, I think that's a good example.
> 
> I think it's an example of something that "works", but it certainly is
> a bit hacky.
> 
> Wouldn't it be nicer if just plain "crc32c()" did the right thing,
> instead of users having to do strange hacks just to get the optimized
> version that they are looking for?

For crc32c() that's exactly how it works (since v6.14, when I implemented it).
The users call crc32c() which is an inline function, which then calls
crc32c_arch() or crc32c_base() depending on the kconfig.  So that's why I said
the symbol dependency is currently on crc32c_arch.  Sorry if I wasn't clear.
The SHA-256, ChaCha, and Poly1305 library code now has a similar design too.

If we merged the arch and generic modules together, then the symbol would become
crc32c.  But in either case crc32c() is the API that all the users call.

- Eric

