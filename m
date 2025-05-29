Return-Path: <linuxppc-dev+bounces-9020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39795AC8265
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 21:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7bLc0XGqz2xDD;
	Fri, 30 May 2025 05:01:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748545271;
	cv=none; b=nHztQI0Us5MiOeIxSrHXpKekypovDbgoD39O8bh4apJMUrVWQNeUKeBzA66vukg/hGM+tGmEzkAUO9MAFxVFvw3dbeLqnZJDKGOWOf0e75c3cTw5K9ileYv6h6BGXiIXvkPnpf6nwuAsxGUwTyf3x9WnS1l0rwjkfrtyf9KsJSwtO58MO+4BDQyGd8eJ/1vZlfL+TFc1ik2iC+SpxwhvRdd1YwJR8qXUqMNcb/WL4iS8BiEnsGKpDenxEsWzeNBLj2ysx9ruySypYWFijhYBdFINqL0waDgph+rLEFUl3uHSz46doHQZy4Q+onrp2ASOJ2u1U91S0KesA0OR7pFaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748545271; c=relaxed/relaxed;
	bh=C4OQQiEapNElJG/QIf+DgO1xfoV1fkZfJR1iX1tkGgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tf6w06KyOjQWKMvEyDsCRxWRqO+qawC5Ap0TUaR2fK2NDx0kj8HUwDnFjKZYCfD3VvWv6cDrAVSmkDHm5Bl+Cakjn1GMilLsbiJ42Oy7V+mRUz9xIyakDiFWiQ/xF9Q316ik7bcRkEyArRGA6RMumClIqN7OYt0EmI8MOTcnRj6WUijg955mDxrGwU0ni4vaaEjg1hW9u079khqD4FOUxWWdEE3kGx7V5sUicRz0KX/BcTqPz7fFys6xHiFxHMUkwps0tpYWI/0iKyzkoFMMBaOgD/2oUBMtwFgW2Kos9QyDt+krvDt4pwabUqi0AeDhLFkOgkeQJGwYva7fK6O6/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UyWCGQH8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UyWCGQH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7bLY1sd0z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 05:01:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BAA05C68F5;
	Thu, 29 May 2025 18:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDDBC4CEE7;
	Thu, 29 May 2025 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748545266;
	bh=HpaSpxKPSTcKVq++ch2t3YrzhRTS1hIvLrLQoyh88o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyWCGQH8aj3D49i85BBT7NPpHwUvBNW7d1DfFwr/mwzpOzC5U7+XTtZFiWWAe14Ze
	 nhqUnY10VFWI+BKCwfDErzkzVF4tXKboIXWPiF3WPOTJTPo6c+6cM21vYBpUrO9/mN
	 sMPsJ3m64/v4Q+P8hT3rYcwitHqZ5dt7G3sw8nq+u/W/ReCZeRlJwpyZh0Wsr22aAX
	 xQCMSf21bnDaIcGcTdDvZ4CZK1D78q6RaISBNlaQveskEp46EPZFsHeJR4y/IBHKmc
	 NYuNP8oMHiKaatq8+i4kWnfFu6o59oSDZxsb5ZVDoCGlE7dj6qoySYQY8lweYQvnUH
	 TG5FI1zL6wzOg==
Date: Thu, 29 May 2025 12:00:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250529190048.GA23614@sol>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
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
In-Reply-To: <20250529173702.GA3840196@google.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 05:37:02PM +0000, Eric Biggers wrote:
> On Thu, May 29, 2025 at 11:05:26AM -0600, Alex Williamson wrote:
> > On Mon, 28 Apr 2025 10:00:33 -0700
> > Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Instead of providing crypto_shash algorithms for the arch-optimized
> > > SHA-256 code, instead implement the SHA-256 library.  This is much
> > > simpler, it makes the SHA-256 library functions be arch-optimized, and
> > > it fixes the longstanding issue where the arch-optimized SHA-256 was
> > > disabled by default.  SHA-256 still remains available through
> > > crypto_shash, but individual architectures no longer need to handle it.
> > 
> > I can get to the following error after this patch, now merged as commit
> > b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):
> > 
> > error: the following would cause module name conflict:
> >   crypto/sha256.ko
> >   arch/s390/lib/crypto/sha256.ko
> 
> Thanks for reporting this.  For now the s390 one should be renamed to
> sha256-s390, similar to how the other architectures' sha256 modules are named.
> I'll send a patch.
> 
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.  So instead of e.g. libsha256.ko,
> libsha256-generic.ko, and sha256-s390.ko (all of which get loaded when the
> SHA-256 library is needed), we'd just have libsha256.ko.  (Or just sha256.ko,
> with the old-school crypto API one renamed to sha256-cryptoapi.ko.)  A lot of
> these weird build problems we've been having are caused by the unnecessary
> separation into multiple modules.
> 
> - Eric
> 

Patch sent: https://lore.kernel.org/r/20250529185913.25091-1-ebiggers@kernel.org

- Eric

