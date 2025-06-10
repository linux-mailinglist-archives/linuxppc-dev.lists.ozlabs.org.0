Return-Path: <linuxppc-dev+bounces-9254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7AAD42AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 21:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGz2D2HNsz307q;
	Wed, 11 Jun 2025 05:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749582756;
	cv=none; b=kX6jY4QcUvdlWQEQjJnbo6Y1/6xXuCIzrNKlkYbR6Rj/RSEDxBl38nV3BrhpXCue8tW9Q892r/iqxDrfKc9fcDDTwxsJ99EkQHVW5BziZlS7ZhOlSe0VEBG+AGLOYfXnRp+2TtXiaYow7u/pJdCN787iQAlA2pz85b8PrCJAnBaCXYtaiH9fv7JwmnkQ9bvhivKrTd9kHpig0NjpWx3aosm8XbnlM+W4XWPlry2MJ+TdsbyOWjsjeXvrs+jGAcOx3hZnsyHEDgSaMG/QdOrwVQGanWJqLq3RQA8vY75plFbk+2a0dy7mknFHWp9mT4Umfz1d2r9K0AcQuDmDEYoqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749582756; c=relaxed/relaxed;
	bh=GotRg1Si1hTKaYuqrLlayWjjPnDKXporodQ26epGM9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VICMPKY+QJmaOe+tLbpQOOwaorzd6clD4huM625GybwBsMhvT7wqpKHi1fW9XXGTVdIKmdt95iGfNFne+MLh0vxntMC7qHtO8dPzWwih482bskkaRV1ayuMTxq/NeXSOjE9zPt2P6nchBhzaq67hGcdvWNc/jqgsYJXa5gxLMlAflWmN9cTR9bAjZQ1Sh7SfYiXJNXhbGFAAJQ9rKCD8rm/tI1REGNOLkQ1e9ikbtW+7ykRUWPFyeyRDf4HPwGbpPJ5Tu5BvSNeIQim5IJ/bPocM9kI0ZipiE/FZjuF80kRkAbUVCxksK7IU7Y6mCMGOSiQoISHKUajkiTLqBc/Jzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VaI2+LQh; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VaI2+LQh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGz2C2VcMz306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 05:12:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9C5644B79;
	Tue, 10 Jun 2025 19:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FAEC4CEED;
	Tue, 10 Jun 2025 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582752;
	bh=eJzXTcGjqeHES133w/mCLelMBBcBENx890a5ygHX1H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VaI2+LQhuUUCHinnXIKNJGDX1SFqmIEkgM49ZG9mFtgdSJtyidxE5kSPaTUdtIRoe
	 x8gwG8h5JFpcv2x49bFujV90PS+vJ0dv/ZdkpuflWTUErcb97YgGQv2W6l9qVPbl16
	 v8SyhbEe0m3HO6534SqykjGShxll+Ne/4t8f1iJYheRExnhSX55A4hNPQKnkRcYq5L
	 hc0Tmlxcb6hRLqfqF7Unr6UlRwwPll4NW5PiZ7zHf35KF4TOdiyOcT86XrweAAiuH8
	 NHMgbbCpwoQbMy2vS7ZoKum77mLaoScoDb3mUTDNNDNTl+qp1ZRyBmI7CkispOKzd9
	 LnPbDInTrzhvw==
Date: Tue, 10 Jun 2025 12:12:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250610191208.GD1649@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aETPdvg8qXv18MDu@zx2c4.com>
 <20250608234817.GG1259@sol>
 <aEhtyvBajGE80_2Z@zx2c4.com>
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
In-Reply-To: <aEhtyvBajGE80_2Z@zx2c4.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 11:39:22AM -0600, Jason A. Donenfeld wrote:
> On Sun, Jun 08, 2025 at 04:48:17PM -0700, Eric Biggers wrote:
> > On Sat, Jun 07, 2025 at 05:47:02PM -0600, Jason A. Donenfeld wrote:
> > > On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> > > > Having arch-specific code outside arch/ was somewhat controversial when
> > > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > > warranted.  It's better from a technical perspective, as it enables the
> > > > improvements mentioned above.  This model is already successfully used
> > > > in other places in the kernel such as lib/raid6/.  The community of each
> > > > architecture still remains free to work on the code, even if it's not in
> > > > arch/.  At the time there was also a desire to put the library code in
> > > > the same files as the old-school crypto API, but that was a mistake; now
> > > > that the library is separate, that's no longer a constraint either.
> > > 
> > > I can't express how happy I am to see this revived. It's clearly the
> > > right way forward and makes it a lot simpler for us to dispatch to
> > > various arch implementations and also is organizationally simpler.
> > > 
> > > Jason
> > 
> > Thanks!  Can I turn that into an Acked-by?
> 
> Took me a little while longer to fully review it. Sure,
> 
>     Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Side note: I wonder about eventually turning some of the static branches
> into static calls.

Yes, Linus was wondering the same thing earlier.  It does run into a couple
issues.  First, only x86 and powerpc implement static_call properly; everywhere
else it's just an indirect call.  Second, there's often some code shared above
the level at which we'd like to do the dispatch.  For example, consider crc32_le
on x86.  If we expand the CRC_PCLMUL macro and inline crc32_le_arch and
crc32_le_base as the compiler does, crc32_le ends up as:

    u32 crc32_le(u32 crc, const u8 *p, size_t len)
    {
            if (len >= 16 && static_branch_likely(&have_pclmulqdq) &&
                crypto_simd_usable()) {
                    const void *consts_ptr;

                    consts_ptr = crc32_lsb_0xedb88320_consts.fold_across_128_bits_consts;
                    kernel_fpu_begin();
                    crc = static_call(crc32_lsb_pclmul)(crc, p, len, consts_ptr);
                    kernel_fpu_end();
                    return crc;
            }
            while (len--)
                    crc = (crc >> 8) ^ crc32table_le[(crc & 255) ^ *p++];
            return crc;
    }

The existing static_call selects between 3 different assembly functions, all of
which require a kernel-mode FPU section and only support len >= 16.

We could instead unconditionally do a static_call upon entry to the function,
with 4 possible targets.  But then we'd have to duplicate the kernel FPU
begin/end sequence in 3 different functions.  Also, it would add an extra
function call for the case where 'len < 16', which is a common case and is
exactly the case where per-call overhead matters the most.

However, if we could actually inline the static call into the *callers* of
crc32_le(), that would make it more worthwhile.  I'm not sure that's possible,
though, especially considering that this code is tristate.

Anyway, this is tangential to this patchset.  Though the new way the code is
organized does make it more feasible to have e.g. a centralized static_call in
the future if we choose to go in that direction.

- Eric

