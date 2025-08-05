Return-Path: <linuxppc-dev+bounces-10669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA3B1B84B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 18:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxJVw3bzDz3bmy;
	Wed,  6 Aug 2025 02:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754410680;
	cv=none; b=K/45ZOP4iT36N3vjMLxaH2IapHkzZAb3cb6T3YRaEtk2Ei5FBt2teNXg9jS2Hmauk4RxXYoX6FiIb9Z1PEtEKc2FKRx6tNU3mVHyW8hRtEO9n3arvOPcjGpbTzaje26o5p2STr1uNmYtoBbjW1yWZ8YDhsBCyAYXy6JZdwjRpAYiuciVYzqZJnMVc6RQ8CEs37As/Af3lxsKmUF6oZf1G9B4wnLBJU6G5JGq+jc3NWqz3UX2rjD7/kyuXjbEoTG0pMahs6lTa6BmMxCCMkpwsjAczFcucHuuYa9c5Y9uiGYCcWGDJ//Z6RolnLe1gulnf9JJP24ZMsst2e3eTk5K0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754410680; c=relaxed/relaxed;
	bh=mHXO8IlN+QUNSY+1isM85Y1ycRa50jDhXn2mJOFKUiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmbgpUO6LiKm8xzqElsItTkr2X/fvTNw5pGphicpqSHXp02o4fk/OBYlj694Yt56oBipbTSI3rJraG3JkipiqlHb0rPswC8XbexC7XJpKeW79kFASCjs5Xt/K0f0tFQ3K/FnDaiZe7rSE9tYAFzdrcaFjgu+S387JRvQwdKtvme6w1G706siTAj4zqfbJp3mgtY367h/BNIB+Bg5bhDmsymsVLyoRthrr87WEaRAtuHgEoeS0XaDlO0C0FSWoKNF/BWH/hkDALqYIhsKnWRn/BS+h+css1xjVL3g8Tz/lpWowhD0y9VMGTegF5lRQbvcme0aes8sw8uT00BHzeVreQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RGWeO0hS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RGWeO0hS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxJVv4n2fz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 02:17:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3778A55F86;
	Tue,  5 Aug 2025 16:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A72C4CEF0;
	Tue,  5 Aug 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754410676;
	bh=VEaguF/ogsUg8LpFDpHstynmmvNIK3mlr/svELCRauQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGWeO0hStuckHs5WZfjGH0bLLJm+w5iCYk2zGYNrIOgwN/hcs/wFYIwMndWkVSbgo
	 qgZvcmHQt3X/4fCvF/UxmvF9KqJCb7RoFN65U30toLVfyxtkuV+mO9Mh7PK/CD+SIp
	 rb0R8NkR0piFdJdCTdNpHJ1wVhc2jMioJOWGM8UvJEgOvqOnNhgyGBpn8ExFh7rzTA
	 8WZOI8KC63QKsfGbeUrG2MMTHhbwktV9EAxdhBE5COUv5dgdB4B9LkDBeU/H4Ym88L
	 KPaUsNEWXXm0EafpSZ0drDrttdXQ363VINQYNGlWx/xPmS9CDpv+cRMVtTaI81ArkK
	 i0yUCuBtBwl6A==
Date: Tue, 5 Aug 2025 09:16:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250805161657.GB1286@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu>
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
In-Reply-To: <c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 08:27:14AM +0200, Christophe Leroy wrote:
> > What?  That's crazy.  Userspace MD5 code would be faster and more
> > reliable.  No need to make syscalls, transfer data to and from the
> > kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> > We need to get this reported and fixed.
> 
> Content of files is already buffered inside the kernel. likcapi doesn't
> tranfer data, it uses splice().
> 
> As far as I know, coreutil is not able to use the TALITOS Security engine we
> have on the mpc885 and mpc8321 microcontroleurs. We primarily use libkcapi
> for that.
> 
> In order to keep things consistant, we use the same userspace on boards
> which don't have a security engine, ie the mpc866, we rely on the kernel
> providing an optimised software implementation fallback.

Even if the data is transferred in a zero-copy manner, the AF_ALG
version still has a lot of overhead from system calls.  Running the
exact same PPC optimized code in userspace would of course be faster.

Now, it sounds like you don't have the PPC optimized MD5 code in
userspace, and that's why you're measuring the AF_ALG based md5sum to be
faster.  But that's just the wrong design, and it does not give optimal
performance.  The fact that the kernel allows access to software code
via AF_ALG is basically a bug.

For now we'll keep the PPC optimized MD5 around in the kernel to
accomodate userspace code that is depending on this bug, but for future
reference we don't add new software implementations purely for use by
userspace.  (And BTW this is nothing new; this has already been the
policy for many years.)  Please work to bring the optimized code you
need into userspace.  For example contribute it to OpenSSL.

- Eric

