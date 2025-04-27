Return-Path: <linuxppc-dev+bounces-8037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22495A9DE92
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 04:09:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlVPV5941z2ydl;
	Sun, 27 Apr 2025 12:09:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745719742;
	cv=none; b=Pw1VXW3ezrKXCxR4MPff1ir7reRCa51LGQdzNJKsIMOXlpd5Mqi3JPgLWnATKPL7r7F/7grDea7n+xe/3/VFRYRYPHcWov0ggqCUMLa+A1kuh0WnAM7CxsSW9hz6/wN9dWNNLHikblscoG3J708RY6uj5AD76jCY5YymePc2oj6DqOxhkTvpzBz8V3iXb24CSrpdUv6EjXbflZtIaK0t4n53b5EI8Bo6yC4T7/UeEgeVZmclHXaNc2I7FO0PVDEkXTSY2xT86hFD6Yd/GV6a3C4RkUICg+D71EcevOSmBwOf2cuhj2CUZOX+/EIXm2FqGBweH6aJ4BiiTQDdaZaXog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745719742; c=relaxed/relaxed;
	bh=mCSGe0hd9nC0wheXB+gSEHvBf5j2sNZqM+duHcgxviI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOm9fmU6FKFI4VpOr8HL+J33rkKws/W+AmpVdrNcqHL+x+a7Gf99R2Kpk+/FfEweZ0oHqIkcXTx7OgDF5Z8H6cnMDIw+GHG1582OZ4uzBAXUYDdrje79KsgdbqM84wXUpxwqwgVVSYmImTPZ4GSRjazMO4rR5216r6Cc4lgIc2Ne9S7ynQvN1w1tQIhPK485WE7nw91Gpr7MXuaeRQjYTdJNDQbVqIOi6SjRH9CybI4/UZ2b8ZHlEgW9uHV0fSQv4FqDc7096stOLFO1m3LZ4WNM4ze+M99kzhjzuHbvy2KvaLS7O4k28FAY38neqvQAvqjAA12+jg8ptZuzbe77tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=bL/C1Qcv; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=bL/C1Qcv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlVPV02CCz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 12:09:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mCSGe0hd9nC0wheXB+gSEHvBf5j2sNZqM+duHcgxviI=; b=bL/C1Qcvgn5BWiPkJ27+dJ7Es8
	wwSoSEMzq4YcvjJsWSmMepkvcU0C+LR+JcK4d4+iSMjdzlqhOGHE3AF2kMOhQHHx5zatXSJemRQUa
	+4h6wO0WkFQUX9WdKq6GRaJ9/mZ17PlsiqC0wdJhCc9trhF25UN90ckF1QyCHeZRx0n89B0uSwkLG
	uUSof0rmZhN5waLKmnv8FlDyjrKsMtYRIDRqFgglTsQWEPgcKsVVxKbPbA5yOE0L7Ivk2Ohmjs+Gm
	LWKBoqlKkfHG+z5IZWuBDTy+jUSYT0zXWKQ2YQGCxsKc4gNCr1zLOsKj79gKZojc877uD54ab34ip
	84RfoZpA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8rRz-001Jud-1b;
	Sun, 27 Apr 2025 10:09:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 10:08:59 +0800
Date: Sun, 27 Apr 2025 10:08:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <aA2Ru1SHXRB-ZAc3@gondor.apana.org.au>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
 <20250427015041.GF68006@quark>
 <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
 <20250427020550.GG68006@quark>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427020550.GG68006@quark>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 26, 2025 at 07:05:50PM -0700, Eric Biggers wrote:
>
> Why?  And how is that relevant here, when the export format should just be

Because I want to be able to fall back from an ahash to shash in
the middle of a hash, i.e., I need to be able to export from the
ahash, import it into an shash, and then continue hashing.

> struct sha256_state, as it was before?

Because I've already changed the shash export format to use a
generic partial buffer for all algorithms and it's not the same
as struct sha256_state.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

