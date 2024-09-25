Return-Path: <linuxppc-dev+bounces-1590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2624798666D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 20:38:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDQVN4s6gz2y92;
	Thu, 26 Sep 2024 04:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727289532;
	cv=none; b=nwOASjBGdkus7duW/rew/bWYfMDllYwkAjzUgPIkm0tY3FKfaUwENTmIIhKyVcK2XVmUexkm39sUHytTuI006mZIcSC+ElXAykhpTlymT71L/XkBZUa8ZQifGO/aDVLY9nFIdB0dCW1upIkRX4BvgHzea9PGPSALz4MZK2PLnEqHp8RsmTKLnvBX07IcQ+SB2+ulg8t343WTz+5gEWwaptP2WSyFshvXG8oQymqZ100vfZ961Zx68paSonWkRucz7G3B9fdIeGgPYrF739/wwjeEcE09BqFyIUY9BhYVKjRz7OGVNgLPnz1LEXNLcOt5cKpr4hEKZGZVYiJCvrT10w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727289532; c=relaxed/relaxed;
	bh=RfOPGOGPmNuKxAdSvWgOg7X4SEiSUn266k2cbW4UshQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfemF3TwCEMmYUcHbysQCEUswONy7xs+nkNiVUaWRUdoQ2B8QgxxAzbZr2Pncx9d5sWGBLNAmZvpWOoLztUlxacCkZNnjI1B5PY5BsVSgCI2+a/xT+IdVvAqdpKJnMzcCei81mPXyWdfLTdXRx99+7sMlKl5PrhzFP9SIx8tG4A0qk421QGon14foa6oHzA4puWfhI3MZHQiW+Q7aG89IX9gY9m5ylUdBBkbFlpllMyxfY6ewHkAuEgXrJWm8d3TTBGmth0QnWbgCgAEqkSrgqvSnMyR/aM67+TURQqNg1UKPTpZfYFUGE9NVfe/dxvmopIMmOZhoQ9WzQ4XE7uUNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=i1scXAhq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=ioc0=qx=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=i1scXAhq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=ioc0=qx=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDQVN3LcPz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 04:38:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B93F25C5C2B;
	Wed, 25 Sep 2024 18:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3DFC4CEC3;
	Wed, 25 Sep 2024 18:38:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="i1scXAhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1727289526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RfOPGOGPmNuKxAdSvWgOg7X4SEiSUn266k2cbW4UshQ=;
	b=i1scXAhqeeGt5mfWZ42aU3HnDg3BwR892j5P2UPLSGn6Qthdq11kH2P5mit5FlcdTTYzrt
	qhBqLU1lkuIUfgCl0Y1tw/jAVUuxQ2RoWeowXOSw9JPnyhUTtbvu8uQpo/xNHboPtMvKLf
	tFKpI+y/IAMhPF8fWy1vnQ3eahwoqP0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 24ee7599 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 25 Sep 2024 18:38:46 +0000 (UTC)
Date: Wed, 25 Sep 2024 20:38:43 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: allow r30 in vDSO code generation of
 getrandom
Message-ID: <ZvRYs-WYz2qHZjhy@zx2c4.com>
References: <20240925175021.1526936-2-Jason@zx2c4.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925175021.1526936-2-Jason@zx2c4.com>

On Wed, Sep 25, 2024 at 07:50:22PM +0200, Jason A. Donenfeld wrote:
> For gettimeofday, -ffixed-r30 was passed to work around a bug in Go
> code, where the vDSO trampoline forgot to save and restore this register
> across function calls. But Go requires a different trampoline for every
> call, and there's no reason that new Go code needs to be broken and add
> more bugs.  So remove -ffixed-r30 for getrandom.

Strangely, I am _unable to_ make the Go code not crash with this patch
applied. I'm not quite sure what I'm doing wrong yet, or if this points
to another issue.

