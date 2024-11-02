Return-Path: <linuxppc-dev+bounces-2773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D62639BA16E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 17:36:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgjzK5db0z2xg3;
	Sun,  3 Nov 2024 03:36:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730565373;
	cv=none; b=EqEDm+IK3ti1U8EmvTodahvHqp78qpnWuX+6EtKc8BwJoljxcer3iK5sbYd0h9XHPCl7pbNMtPwwYgQDoNSHN/q2+StcNNI4V7ZqZWIGAajlMDCJJOcUSSHCH8ERu9rIwQc+mDK60CRGydHmx0DA0NAR4zDtNBa5fuC6tQMNoFZ+bpj/f4Fp6P+FOX/3FVKSn3mEuWJEUYSSTADWP9Izv805q8bgflh3Ykp8Rqrnxbj1zcKVI6b6Eq/iIX7QAakiT6FYQ/2ALigE0rkTeVVkIem9nSOZLsEWSCdpATfE+6IlsFzE2JDdmeGI7Llri3dfd/D0XHFUTkp77Bu1uvjNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730565373; c=relaxed/relaxed;
	bh=k39rYMoWjO6+nGMnJR7eYdIhWn0FMNGEl3Akb1BGe20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5EMkTg29M/1ifawDJqcoVyShs4RWKiEiughSZg17Y4h+WhllaEaQjAfNpR5/KmDloieQvQW2OyIbCjJjmMtKMiFLZunKigsTt0oB2NqVt7ADHNLYG3Rs5H6CEhPIlAEJjDA8XN/fk0SHfQ5CAdDkudRBKcF0hHa5+f/HuMZpwyb79ietG1FN1bMWCgYXhCce1BYGTCOiYNtr8G7DBdJ8Z+x+NfqhBChp3v/DSV7TGD1fA3s8fq99AuTJfu4+Pq3rJxnHRx4m5iVjUZkX5eI2mjnyG38hG6NoOEfYXXC6wrv1ZbrT1ouxxCgY0oN8L6GLv/qICqXEAo9Ja5Q6PiNtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KlpVtnzW; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KlpVtnzW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgjzJ1jb0z2xY0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Nov 2024 03:36:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9844A40E05;
	Sat,  2 Nov 2024 16:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFD1C4CEC3;
	Sat,  2 Nov 2024 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730565367;
	bh=efn4VpG7p6xFb/S4X3ANPIQCQKp6IXfEyCLH0VWZIIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlpVtnzWd/zB5XmFf980RxtRY6lt695NC4d5DAQWzdJq8P9d/vTpUIa9uhRZxXlNg
	 V1d2QzYc2hobwbFxK4fWDOeUmxR84BXOCx0bbPmSs0eqzXhWKKg5gbNDPcqLKd+ItV
	 0pXNaQHtN/eHmbiDg0Z7SgO8wxZv7vCv329kh8IFtCEPWR/9ZVZ4PS1sF2pFzadm7O
	 KR046MH/33qcHZt/KH+f3V2nu048roFu5R/+fD2mNhDgdzzAq87Tul2/R4s/yR1t+w
	 9f2q8hLJXw4bMrhpexvm+tOdexgGWME42h9ZVxDY348o62nZnpHwJGFG+M9IE+WQFR
	 2wSFp9BrXYOKQ==
Date: Sat, 2 Nov 2024 09:36:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <20241102163605.GA28213@sol.localdomain>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
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
In-Reply-To: <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
> On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
> >
> > The only issue resulting from *not* taking this patch is that btrfs
> > may misidentify the CRC32 implementation as being 'slow' and take an
> > alternative code path, which does not necessarily result in worse
> > performance.
> 
> If we were removing crc32* (or at least crc32*-arch) from the Crypto
> API then these patches would be redundant.  But if we're keeping them
> because btrfs uses them then we should definitely make crc32*-arch
> do the right thing.  IOW they should not be registered if they're
> the same as crc32*-generic.
> 
> Thanks,

I would like to eventually remove crc32 and crc32c from the crypto API, but it
will take some time to get all the users converted.  If there are AF_ALG users
it could even be impossible, though the usual culprit, iwd, doesn't appear to
use any CRCs, so hopefully we are fine there.

I will plan to keep this patch, but change it to use a crc32_optimizations()
function instead which was Ard's first suggestion.

I don't think Ard's static_call suggestion would work as-is, since considering
the following:

    static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
    {
            if (IS_ENABLED(CONFIG_CRC32_ARCH))
                    return static_call(crc32_le_arch)(crc, p, len);
            return crc32_le_base(crc, p, len);
    }

... the 'static_call(crc32_le_arch)(crc, p, len)' will be inlined into every
user, which could be a loadable module which gets loaded after crc32-${arch}.ko.
And AFAIK, static calls in that module won't be updated in that case.

That could be avoided by making crc32_le() a non-inline function in lib/crc32.c,
so the static call would only be in that one place.  That has the slight
disadvantage that it would introduce an extra jump into the common case where
the optimized function is enabled.  Considering that some users are passing
small amounts of data into the CRC functions (e.g., 4 bytes), I would like to
minimize the overhead as much as possible.

It could also be avoided by making CRC32 and CRC32_ARCH bool rather than
tristate.  I would prefer not to do that, since there can be situations where
only loadable modules need these functions so they should not have to be built
into the core kernel.

So I plan to go with the crc32_optimizations() solution in v3.

- Eric

