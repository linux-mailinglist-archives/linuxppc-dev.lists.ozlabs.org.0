Return-Path: <linuxppc-dev+bounces-15452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B4D081A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 10:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnbYD1LG9z2xc8;
	Fri, 09 Jan 2026 20:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767949728;
	cv=none; b=V2EDXo4EEZP6LRXervAoLf2Jge93HwAAkSyZ9CM3chAfFNbIcN/T4vGg+Ifsv2WeI6y2rre3HmSMhMGIpw6aFgXPPPENId045F0px5fTpLTU9pN1gYsVSJi70uOAduj2WW60Wog3Nm1W/LmJ4xA7PFlW1B2hdsejJYsv9WetvLQYtWYLQ0eHNhgkKCB0H+2aLU5aOtUL9UD3AtwXtm3cUjUaTIcYHHOClqB1RU9y53GDdEkXRBYt731wqNflk08ROuR/d7L/fQJClrnR/w2jbD4r4wFYD/M/Bjuj1+6y3kVJDXp039myuWHV5qo8KEqVElUVZoqvObah5rB2C2zIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767949728; c=relaxed/relaxed;
	bh=0gw1T6NAb6pFc9kh0Lb8Qk8uoHDdU63opjMEO4YOEio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIf+CusgPeTFKqlZeKTca1SpP4+NzZDSpxP2kob8rN2m2OAwlS/+rDwcTFRqEV/ZiCdCnlYUBHXrg/07pxk2ijSab1VSyfjlPOGh47NmeD91wzo6PEf5bo4Q9nuaaOnQGB0dtb2iuJy8Lcc7pkBLtGStirdUoyiIoC3UTwHJyfA+FMIuBDgsgpy3mYM2iOJrVcUeLEaV3+zqiP+TnBCVnXlf8297X6WBu4NtaepVYfqAXjpb7FVH6mgXjR9kjX50FdYcBAu6RFQw4NRsbyFjn5ars91uk8k4QeCyhiXyPWIqzu/s8+n3n/yxmWKwV5Cuyv4NHPDkxzFybXHsyBx43A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WIGhG3sg; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WIGhG3sg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnbYC0xdPz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 20:08:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA23143E77
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jan 2026 09:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC887C2BCB2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jan 2026 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767949694;
	bh=goiI1ZxyIEI3mcfeHTSEAz7enxjoJAjvK6SpyVAMJNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WIGhG3sgki+KEoz1vXOR2kR3tB1EB73l3CF5edZGAclsEhVnW+MFWjTMXqfV7GEI6
	 zQgT4YjabyJ7LWa0lp7M6x6hfaA8DQNCTQN1NNYT+o3fm+w2JaH0NLp6PEIx3bf1q1
	 TzO5jLn7lUUx5vFHwxyMbeTKV0azO209foiogdr0ZA5CoY0r4o64woui0oxNWJLL20
	 HYsni/IYgPj253gmaaKlTFuIDAiebwcY1Cx6bE0IzDPaAr+W4Ihox47gg0cM/Npeev
	 rhL2V31+zMVTkjz233e1ZBCunhubLUJiaYIL2QcP5QJ56aXMlRzVsvhA666bTqMHu8
	 vvLYrbMRF3uYw==
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so2494978a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 01:08:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQC08JDqnjlfMGocobga6TF3Vle1mya39WTuz7eU1irTLMtAh622GPWml8P/ttfAgLkkA4rOMW8e2mFq8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxS9kVjNXCGdgUZF+1loZIyvNysSzUXaJrwU+YMq6G/u4DPEiBF
	DFoN3XG7NzSWxfGtJNQXEpXGwt5eEnP80plIltFbXrHzBr7FBA2BuJXcTqmzIDF0jWOd8kJpLdc
	wXWil7+SZEnR9H9HQ8J8aPfbx560Jyzw=
X-Google-Smtp-Source: AGHT+IFcD0rfNOJ4GvG+wPYTAWMVc/s2zy/BvRbkZK4bJO5tmt19sPbsMOldrWreI07DtS/l8EUtweFn+GaepdyG9dA=
X-Received: by 2002:a17:90b:3a8d:b0:34a:adf1:677d with SMTP id
 98e67ed59e1d1-34f68b64d7cmr8233808a91.9.1767949694052; Fri, 09 Jan 2026
 01:08:14 -0800 (PST)
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
References: <20260105051311.1607207-1-ebiggers@kernel.org> <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
 <20260108202618.GA2687@sol> <20260109012712.GA730896@google.com>
In-Reply-To: <20260109012712.GA730896@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 Jan 2026 10:08:02 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGQae+SWEgvZTHvoTJueScbqfei1ie_HSC9WyByOwvJUw@mail.gmail.com>
X-Gm-Features: AQt7F2ruRWMLxfzcb-WM7H3sakD6ZAGLYL1ZhftKy0m5nypWRiiegTKEJVDmsew
Message-ID: <CAMj1kXGQae+SWEgvZTHvoTJueScbqfei1ie_HSC9WyByOwvJUw@mail.gmail.com>
Subject: Re: [PATCH 00/36] AES library improvements
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Holger Dengler <dengler@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 9 Jan 2026 at 02:27, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Jan 08, 2026 at 12:26:18PM -0800, Eric Biggers wrote:
> > On Thu, Jan 08, 2026 at 12:32:00PM +0100, Ard Biesheuvel wrote:
> > > On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > This series applies to libcrypto-next.  It can also be retrieved from:
> > > >
> > > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
> > > >
> > > > This series makes three main improvements to the kernel's AES library:
> > > >
> > > >   1. Make it use the kernel's existing architecture-optimized AES code,
> > > >      including AES instructions, when available.  Previously, only the
> > > >      traditional crypto API gave access to the optimized AES code.
> > > >      (As a reminder, AES instructions typically make AES over 10 times
> > > >      as fast as the generic code.  They also make it constant-time.)
> > > >
> > > >   2. Support preparing an AES key for only the forward direction of the
> > > >      block cipher, using about half as much memory.  This is a helpful
> > > >      optimization for many common AES modes of operation.  It also helps
> > > >      keep structs small enough to be allocated on the stack, especially
> > > >      considering potential future library APIs for AES modes.
> > > >
> > > >   3. Replace the library's generic AES implementation with a much faster
> > > >      one that is almost as fast as "aes-generic", while still keeping
> > > >      the table size reasonably small and maintaining some constant-time
> > > >      hardening.  This allows removing "aes-generic", unifying the
> > > >      current two generic AES implementations in the kernel tree.
> > > >
> > >
> > > Architectures that support memory operands will be impacted by
> > > dropping the pre-rotated lookup tables, especially if they have few
> > > GPRs.
> > >
> > > I suspect that doesn't really matter in practice: if your pre-AESNI
> > > IA-32 workload has a bottleneck on "aes-generic", you would have
> > > probably moved it to a different machine by now. But the performance
> > > delta will likely be noticeable so it is something that deserves a
> > > mention.
> >
> > Sure.  I only claimed that the new implementation is "almost as fast" as
> > aes-generic, not "as fast".
> >
> > By the way, these are the results I get for crypto_cipher_encrypt_one()
> > and crypto_cipher_decrypt_one() (averaged together) in a loop on an i386
> > kernel patched to not use AES-NI:
> >
> >     aes-fixed-time: 77 MB/s
> >     aes-generic: 192 MB/s
> >     aes-lib: 185 MB/s
> >
> > I'm not sure how relevant these are, considering that this was collected
> > on a modern CPU, not one of the (very) old ones that would actually be
> > running i386 non-AESNI code.  But if they are even vaguely
> > representative, this suggests the new code does quite well: little
> > slowdown over aes-generic, while adding some constant-time hardening
> > (which arguably was an undeserved shortcut to not include before) and
> > also using a lot less dcache.
> >
> > At the same time, there's clearly a large speedup vs. aes-fixed-time.
> > So this will actually be a significant performance improvement on
> > systems that were using aes-fixed-time.  Many people may have been doing
> > that unintentionally, due to it being set to a higher priority than
> > aes-generic in the crypto_cipher API.
> >
> > I'll also note that the state of the art for parallelizable AES modes on
> > CPUs without AES instructions is bit-slicing with vector registers.  The
> > kernel has such code for arm and arm64, but not for x86.  If x86 without
> > AES-NI was actually important, we should be adding that.  But it seems
> > clear that x86 CPUs have moved on, and hardly anyone cares anymore.  If
> > for now we can just provide something that's almost as fast as before
> > (and maybe even a lot faster in some cases!), that seems fine.
>
> It's also worth emphasizing that there are likely to be systems that
> support AES instructions but are not using them due to the corresponding
> kconfig options (e.g. CONFIG_CRYPTO_AES_NI_INTEL) not being set to 'y'.
> As we know, missing the crypto optimization kconfig options is a common
> mistake.  This series fixes that for single-block AES.
>
> So (in addition to the aes-fixed-time case) that's another case that
> just gets faster, and where the difference between aes-generic and the
> new generic code isn't actually relevant.
>

Fair enough. Thanks for the elaboration.

