Return-Path: <linuxppc-dev+bounces-10627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FDB1AB3B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 01:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwshD1rzrz306l;
	Tue,  5 Aug 2025 09:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754348972;
	cv=none; b=a9vYjnLFEXpnDSoYo6QATX/9+e2+3oS+7lL/k5ZdcPDa5YK9Z42GplK0EeWGjnzuhANiFedTtYH9hjx7XYainh8P6odaq6MaRrPq7NfBBy4tUhPeU/npdmxWwohFNur/mUnPhH4Y+oMEKCY0LdfRFsAHatzhIVXznlSzBseGoNd+DUEoOMOCGsNhcZM/VSOa2zn4Pe+t77Pd8JDCfpl7JwaFbLelydH68i4KcR8yplFQ4kjXS033dbC2peqQj2pkR7tjen6yXDbdeuyDJaHdvm14S6MLpgO5HeG80jgCyBma59bDrsKwZy8+Tzjob3rFug8OZyKogBNUSv0JLMs78A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754348972; c=relaxed/relaxed;
	bh=nD6hIfav6sfxMWzbCl5WbepBKF+pWUbdBflveD2sjfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBcFTsH0W8Qof86MxvmIQRjbFN8EUvBB1CQgUugWCSQRT0dkyg6ea+a9pNNrvUkCVdjHNInYWyLvDS9QPi4OIw35KKqdqN1xJUFQqq8DmxIAfz8pmje+KItelAWS57OsrrA2aSmuT1yuXs/KIF5w2RpD6IgqkMq2ZRhhABPdWell5cJiojoDPmMBfFpLnI/fUBC0CANrhYh/47vjiQ9slFGlq9Lxs6v6MdiBn1YN4UG2IISTcv/72fyAUGeMEr1caM7Vu7D7w5QiVC87mX3nKPS4ob95JS4knkwc7djcAelmcq/6FfnjAuocfx9yL/3qMvBTdNBqTwkWZ5ZXcXeVow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EsLAxxIT; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EsLAxxIT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwshC35d5z2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 09:09:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 375ED60008;
	Mon,  4 Aug 2025 23:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34094C4CEE7;
	Mon,  4 Aug 2025 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754348968;
	bh=wYEx1h5rVCSwEkjK7MIqFH7taTkIsjQXMHcC71M4+Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsLAxxIT9ZwgvBbuv3BAKO4M+ZNIygr5J3TkX5LIs9gIczO+D0YxLWOgZ/ykDtYoK
	 6U7EpvB9B1u6DJ+kJtpgn02WfQ2/bDJaWwhiR4Erfu8W/KtXhpj6FOkzDvMKwyJsfj
	 Gb+6JUrjpFLUpauJ/hMSHT/U35N31WaMKcsgh043ubWHaq24IHN9cVrzRBADkIMyVY
	 P1BdOlaqO4WjIH3zjBTyN950LbmW6oubAyvBXOcu/swYiM8jh1dtBWd536Kco2VGH/
	 DvYYzy2Fc7jbbd8eVNqJ+rWN7mJ2JnXbbp+J/GOEfwi9aGCucqIxIYK2iIGXYfqH6Q
	 EZcglPq6m/z2A==
Date: Mon, 4 Aug 2025 23:09:26 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250804230926.GD54248@google.com>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
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
In-Reply-To: <20250804225901.GC54248@google.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 10:59:01PM +0000, Eric Biggers wrote:
> On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
> > 
> > 
> > Le 04/08/2025 à 20:09, Eric Biggers a écrit :
> > > On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
> > > > 
> > > > 
> > > > Le 03/08/2025 à 22:44, Eric Biggers a écrit :
> > > > > MD5 is insecure, is no longer commonly used, and has never been
> > > > > optimized for the most common architectures in the kernel.  Only mips,
> > > > > powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
> > > > > only the powerpc one is actually testable in QEMU.  The mips one works
> > > > > only on Cavium Octeon SoCs.
> > > > > 
> > > > > Taken together, it's clear that it's time to retire these additional MD5
> > > > > implementations, and focus maintenance on the MD5 generic C code.
> > > > 
> > > > Sorry, for me it is not that clear. Even if MD5 is depracated we still have
> > > > several applications that use MD5 for various reasons on our boards.
> > > > 
> > > > I ran the test on kernel v6.16 with following file:
> > > > 
> > > > # ls -l avion.au
> > > > -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
> > > > 
> > > > With CONFIG_CRYPTO_MD5_PPC:
> > > > 
> > > > # time md5sum avion.au
> > > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > > real    0m 1.02s
> > > > user    0m 0.01s
> > > > sys     0m 1.01s
> > > > 
> > > > Without CONFIG_CRYPTO_MD5_PPC:
> > > > 
> > > > # time md5sum avion.au
> > > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > > real    0m 1.35s
> > > > user    0m 0.01s
> > > > sys     0m 1.34s
> > > > 
> > > > I think the difference is big enough to consider keeping optimised MD5 code.
> > > 
> > > But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
> > > it has any effect on md5sum.  The difference you saw must be due to an
> > > unrelated reason like I/O caching, CPU frequency, etc.  Try running your
> > > test multiple times to eliminate other sources of variation.
> > 
> > md5sum uses the kernel's MD5 code:
> >
> > libkcapi.so.1 => /usr/lib/libkcapi.so.1 (0x6ffa0000)    <==

Oh, I think you used the obscure implementation of md5sum from
libkcapi-tools, instead of the normal md5sum.  Why?  Did you check how
the normal md5sum performs too?  Just doing the calculation in userspace
is much more efficient.

- Eric

