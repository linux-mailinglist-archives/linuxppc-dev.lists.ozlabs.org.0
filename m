Return-Path: <linuxppc-dev+bounces-8173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B286FAA4104
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 04:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnLwf1GYtz3bV6;
	Wed, 30 Apr 2025 12:38:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745980738;
	cv=none; b=gv5M/6LdZ3XcieyR3S/GTYUHearSjyRhZFV3KaJd5YXRbQ1eC7IZK92BxHU4psA+91ailFcPC3yXHF+Kg0xWqehfwxnRWyh5XCGFLw9uf6catQhxwmDPP/Ldul/ELvgevgAEqvqBPFWwQhuFJ3EKrAUQjnn8uW/cDoTxVph+MHJE+lmzMzqCmL7doVP9Mvyhef6nkrlvrAQ/isGft9Eqc5+NVLBA36SDmbeqbsPid4SXYHkQ1oQKT+doEPfZsAe5Hcj1Y1ulvOi0ZOGpxq+dAEjn62Uf7BQTmd0mW+O+7LiUqqn6ET+y7OoG8Gjk8n6Pb71+zosM4awwmka2hvIrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745980738; c=relaxed/relaxed;
	bh=E+daFW9TiG3MY86ROFX8OX7W5wH95uIZXeb14ntCkmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKwjLLJRZvdsGnxOdPIdr4IqMYPx6J1I3p6Hq8AOETfVG3h+UBCyUKcjqFx4U5dNE8Osl7co638Ya8n2MwuXQzqZEob4nPuBa6TKnZo8fgwbTv+M5BPn9/mQf7rp2lIT3nFbd8R08vWkWqesXMgMhuSrkLOCa9npeedkFquTDlr1JoJZ6pN7kvH8cfCYffCI9wv3S2Wjj0UVyLvNTD3j0LpgrrOlpm5mjihrehMhONzCpio+T/qFvEW9qj5Bcq5JDRMSf8yUV2vGGSmTLTAQsAc/s7M6KTveZFDtukufWDq3r7ll9ewzKDBasLTNi/hQ8sWmrQ/G9MjlunN+34wcVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rKbKJ7nI; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rKbKJ7nI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnLwc5DHtz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 12:38:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60BA368462;
	Wed, 30 Apr 2025 02:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05435C4CEE3;
	Wed, 30 Apr 2025 02:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745980731;
	bh=TxucFTFDsaAfXHIM/UmDu7tlSHNslTip/1/i68IYLNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKbKJ7nIpStk8OVO+UghSaA/PHyCumrXyBYGMhec+zz6zGnR725ui8YU/d2He5FZH
	 l3ZysS7wQNq2XykORQq3s6X96GzzDVMLzqg6xRB5oJgw8D/zjnr70FZaqFzpxo/ux6
	 slCd0ewtZDB+TImi79ATUnbFJj1sgEXGWWW0acjg+O3tQjOUW+BcbpUUPzocAdj7Wk
	 bf3XVBXfA5+WHNpc7JRkd7HigULuV18BqxGLAsXHYHc0FuMwOxf5OyajzjpK9zNSxR
	 ZbplbfUya7mHSj39ujX+ycEmi0q7WWaUSaSesTjTADwli278a+F9qyBiH7pdqlnuWf
	 klgtVgYRokWjQ==
Date: Tue, 29 Apr 2025 19:38:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v3 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250430023849.GA275186@sol.localdomain>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
 <20250429165749.GC1743@sol.localdomain>
 <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
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
In-Reply-To: <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 30, 2025 at 10:27:15AM +0800, Herbert Xu wrote:
> On Tue, Apr 29, 2025 at 09:57:49AM -0700, Eric Biggers wrote:
> >
> > To be clear, the objections I have on your v2 patchset still hold.  Your
> > unsolicited changes to my patches add unnecessary complexity and redundancy,
> > make the crypto_shash API even harder to use correctly, and also break the build
> > for several architectures.  If you're going to again use your maintainer
> > privileges to push these out anyway over my objections, I'd appreciate it if you
> > at least made your dubious changes as incremental patches using your own
> > authorship so that they can be properly reviewed/blamed.
> 
> Well the main problem is that your patch introduces a regression
> in the shash sha256 code by making its export format differ from
> other shash sha256 implementations (e.g., padlock-sha).
> 
> So your first patch cannot stand as is.  What I could do is split up
> the first patch so that the lib/crypto sha stuff goes in by itself
> followed by a separate patch replacing the crypto/sha256 code.
> 
> > Please also note that I've sent a v4 which fixes the one real issue that my v1
> > patchset had: https://lore.kernel.org/r/20250428170040.423825-1-ebiggers@kernel.org
> 
> Yes I've seen it but it still has the same issue of changing the
> shash sha256 export format.

Nothing requires that the export formats be consistent, but also the fact that
padlock-sha uses a weird format in the first place is an artificial problem that
you introduced just a couple weeks ago.  And even if we *must* use the same
format as padlock-sha, that can be done by using your crypto_sha256_export_lib
and crypto_sha256_import_lib, without all your other changes.

- Eric

