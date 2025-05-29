Return-Path: <linuxppc-dev+bounces-9018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D37AC81B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 19:37:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7YTc5YL7z2xQ6;
	Fri, 30 May 2025 03:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748540228;
	cv=none; b=W7up52HljakgN8KMb56UXMKVVROlEM8BqBUOi6+joeqgajTQLgLOX5+XC2F6AgA1lD43dINCpZst2wDqbpitaMfDYoTRSBS+AHtEBLGJTFQVqfcumPqZwbH3m4Xt1n85i5I3vGNA9DyM/H68+in5EHf/qhcIzs/CKorgKYPlAl7Km/My4IZwsXHEP08EOanBcC/p8SyzBUgvHwt748qtlWqdtUmhm8AYiX1iGUSzgwUtkP7hPx4etFGEnz77cXjNolGxRzxLkhEKDLwVo0YAscE5FP/Y+C6QhMp+2/QnCBHkw4AdRwlB+H7++kO9cLSVYdjRdEpR91dZITYLaPztCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748540228; c=relaxed/relaxed;
	bh=gVwUTgaj25sjMKTStAmjKE9+CrC7e5n2kVvgLBCxltU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dg3/oXbscx/L/NqE8b8clXORwXK7vDcli5qz3d0ghjU/1upk9Iat9uG738QBQnL/uVSuJcGa6ROMSzOZDg2BPcrzInE987xeekqrt8nN+TZdHY9zNI5y0AKZ13ypFPt0RQVbh6rawAA6s6YDrSmkBX6HrU0+Uzyw5I7xemmefCLN+oj25/2XAP6zjDLE1JPdvMZx4SNn5jDDcOBp+4ZYF9XylELbdeMRpPruDWCsFkDENOd1k/foGnvzFzKl34Mb4zqWyodpe5uK3oj9zgPSgYDBHVePHTLwX7LgNPhfw2dwtiou9VEND7fTfAnFiDnCXbiUyrp8fW0BRjupYsyNGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P05+EG6Q; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P05+EG6Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7YTc0XBRz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 03:37:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDB925C66E7;
	Thu, 29 May 2025 17:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1A4C4CEE7;
	Thu, 29 May 2025 17:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748540225;
	bh=0GXm5pTogqSytd7HXCHRBpGcw/KVfKQwmeZU/tPlGeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P05+EG6QuWbLmid658i7wJ4peqnrvmqlgPCljhnLaj4XyclH8hkfrYGL+CRlxzddC
	 hbyeNHzdiUoe6//EBJN0SHtXtGWpoidgCFvB7Nd+c6GGHyDeCN0m7YTZPZj5b0A43P
	 Yt2bBDtjqOAiSVHMGqQPF67AYYacgPSoiHuo7/B03p7Tbyu0TexTB8Tq6SN5kWMndg
	 CKM23WFv/5LhygR8VTeBM9aYW5uyOIlvel/5nWf0c8MhUDD10NZbPKL3v1kbAXKqUe
	 XT3gPdF+TlTtWX4Dy4gUrnrl9Pe40MGx9z4Ewb2voiHEnUaQkami6AjhZ53YldkzTP
	 9yMidZsyEePUQ==
Date: Thu, 29 May 2025 17:37:02 +0000
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
Message-ID: <20250529173702.GA3840196@google.com>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
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
In-Reply-To: <20250529110526.6d2959a9.alex.williamson@redhat.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 11:05:26AM -0600, Alex Williamson wrote:
> On Mon, 28 Apr 2025 10:00:33 -0700
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Instead of providing crypto_shash algorithms for the arch-optimized
> > SHA-256 code, instead implement the SHA-256 library.  This is much
> > simpler, it makes the SHA-256 library functions be arch-optimized, and
> > it fixes the longstanding issue where the arch-optimized SHA-256 was
> > disabled by default.  SHA-256 still remains available through
> > crypto_shash, but individual architectures no longer need to handle it.
> 
> I can get to the following error after this patch, now merged as commit
> b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):
> 
> error: the following would cause module name conflict:
>   crypto/sha256.ko
>   arch/s390/lib/crypto/sha256.ko

Thanks for reporting this.  For now the s390 one should be renamed to
sha256-s390, similar to how the other architectures' sha256 modules are named.
I'll send a patch.

Long-term, I'd like to find a clean way to consolidate the library code for each
algorithm into a single module.  So instead of e.g. libsha256.ko,
libsha256-generic.ko, and sha256-s390.ko (all of which get loaded when the
SHA-256 library is needed), we'd just have libsha256.ko.  (Or just sha256.ko,
with the old-school crypto API one renamed to sha256-cryptoapi.ko.)  A lot of
these weird build problems we've been having are caused by the unnecessary
separation into multiple modules.

- Eric

