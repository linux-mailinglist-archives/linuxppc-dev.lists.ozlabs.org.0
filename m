Return-Path: <linuxppc-dev+bounces-15428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27873D060AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:26:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnGdv4m1gz2yFl;
	Fri, 09 Jan 2026 07:26:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767904003;
	cv=none; b=VulTMpyo/edC7k5PHHYUnnZLdg5Q1Gtu37du0F+qCJ/qs6DezPWPjY++RcrFb9KeBk99rObUjMuL/rDljfVO5XN0LbDZTKltPtx9NeOSEvOl7+1sKPw5hu0cOrx7ggnQtinVIs/7CF/l6vafeXwiUS1r1BR2nOUpIoLBD5vBGTrkYN2VNFZzNqAK55Kiq/l1LGPnLaP9/7n0FxgKVdxy8AkmY/jrg2+XUqRZirnyQrsr+9uWB8597Lxh1NlKsHBAJJ3zqJEWHx/vcTn88IfPwGX8jSWyyP2Gc/nZaam6qKgacKBojREka4as6Xx/xbT6aE5tJA8N2G+A+jel9lrW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767904003; c=relaxed/relaxed;
	bh=t3otNVD7IIfdqZW2Ev5WG9FHN6LT1F9BWrJwjvjMbRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhMTo8SB59K+K6Xdm6hnA+IfZNpZlHzWbrb/am+WlnvV/DZ89fPyZ2dOyCiD9dlCs2QRYQrB6owfj3hFqLYvi/giTkhBDNPO0RKBcTNiVFtfZ+rpKH4WIeu1sLGLwtnP6kPm0ywgsjV3oSuOcu/IE7ng6jy2/3VcJjvZVq1eYOK/PVKSPESG05ThUDaUL1vKDu86Xzn2YRwRSENlCEPMdIwW888f92UIvcZkmSqqO34tWX63c6ZnTk32Al/wx1T6sojKqiR1Uzl2QHFXMBavTjEXAwSBQdbUEoN7EW6FewfALTM/LwZANuz8FVqyVgmsC1DIfPZUXkwc6kZJXaIzJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyNigXEX; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyNigXEX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnGdt3tJzz2xpt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 07:26:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B75804348E;
	Thu,  8 Jan 2026 20:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C48C116C6;
	Thu,  8 Jan 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767904000;
	bh=Lbm1wO5Em7fQQ3GgNoKyxmZwFi9cEzaK6DxC0Hi/YDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyNigXEX0DLMaJG0OfQR4OzGuk/of9r8RZK5qiWkOnEYPPsqT0sO1q1s17KEOINIa
	 NBWSlBfPlmpONGDNCI9fjxzMZ/y80VPpOFRdXRRSXCarUm+xRxIyCQyBO2jMrr/Pje
	 0xSy3IPcI6jBuNEU0eiYYB2+/koWhKmP6dZuRJsMN9+a79OGGH37b3RJ/9LQes/OUF
	 mnBoRj1PnxeL4FC9HPYLvmsv6ugYHZMjQ8aen4EJS9tGlvv2R26hZgQdr3CTeZlyOS
	 YqTHMwNzv2jbc77JdR4R84tXkpLq9i5xMwKqrJCMQwpE/B+HX3bhXiAuLk2eXY560K
	 X0Kk2IgVhopmQ==
Date: Thu, 8 Jan 2026 12:26:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 00/36] AES library improvements
Message-ID: <20260108202618.GA2687@sol>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
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
In-Reply-To: <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 12:32:00PM +0100, Ard Biesheuvel wrote:
> On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > This series applies to libcrypto-next.  It can also be retrieved from:
> >
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
> >
> > This series makes three main improvements to the kernel's AES library:
> >
> >   1. Make it use the kernel's existing architecture-optimized AES code,
> >      including AES instructions, when available.  Previously, only the
> >      traditional crypto API gave access to the optimized AES code.
> >      (As a reminder, AES instructions typically make AES over 10 times
> >      as fast as the generic code.  They also make it constant-time.)
> >
> >   2. Support preparing an AES key for only the forward direction of the
> >      block cipher, using about half as much memory.  This is a helpful
> >      optimization for many common AES modes of operation.  It also helps
> >      keep structs small enough to be allocated on the stack, especially
> >      considering potential future library APIs for AES modes.
> >
> >   3. Replace the library's generic AES implementation with a much faster
> >      one that is almost as fast as "aes-generic", while still keeping
> >      the table size reasonably small and maintaining some constant-time
> >      hardening.  This allows removing "aes-generic", unifying the
> >      current two generic AES implementations in the kernel tree.
> >
> 
> Architectures that support memory operands will be impacted by
> dropping the pre-rotated lookup tables, especially if they have few
> GPRs.
> 
> I suspect that doesn't really matter in practice: if your pre-AESNI
> IA-32 workload has a bottleneck on "aes-generic", you would have
> probably moved it to a different machine by now. But the performance
> delta will likely be noticeable so it is something that deserves a
> mention.

Sure.  I only claimed that the new implementation is "almost as fast" as
aes-generic, not "as fast".

By the way, these are the results I get for crypto_cipher_encrypt_one()
and crypto_cipher_decrypt_one() (averaged together) in a loop on an i386
kernel patched to not use AES-NI:

    aes-fixed-time: 77 MB/s
    aes-generic: 192 MB/s
    aes-lib: 185 MB/s

I'm not sure how relevant these are, considering that this was collected
on a modern CPU, not one of the (very) old ones that would actually be
running i386 non-AESNI code.  But if they are even vaguely
representative, this suggests the new code does quite well: little
slowdown over aes-generic, while adding some constant-time hardening
(which arguably was an undeserved shortcut to not include before) and
also using a lot less dcache.

At the same time, there's clearly a large speedup vs. aes-fixed-time.
So this will actually be a significant performance improvement on
systems that were using aes-fixed-time.  Many people may have been doing
that unintentionally, due to it being set to a higher priority than
aes-generic in the crypto_cipher API.

I'll also note that the state of the art for parallelizable AES modes on
CPUs without AES instructions is bit-slicing with vector registers.  The
kernel has such code for arm and arm64, but not for x86.  If x86 without
AES-NI was actually important, we should be adding that.  But it seems
clear that x86 CPUs have moved on, and hardly anyone cares anymore.  If
for now we can just provide something that's almost as fast as before
(and maybe even a lot faster in some cases!), that seems fine.

- Eric

