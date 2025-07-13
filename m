Return-Path: <linuxppc-dev+bounces-10233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2222B03237
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 18:54:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgBPD0SZpz3bgw;
	Mon, 14 Jul 2025 02:54:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752425647;
	cv=none; b=jl19b3dRtGr78ZQz3kw5yPp38jItME0Qn67RXRcM/fB7q3h6xE1LaWKqEPzvD6pLThDmBTBqDuuXQv+9n+xNB/3SeOvNAhN4+DcbcDj0sP0TB9KM3IvXcy7PDgPfAQXubQedM/yR+Kdu/U2pUwz3ekm29In8MduG+6LnnhN6fy4VhONx0WzX5xMo/kOCvW6/OogK1Vmbq/Lv/zAt3Fl0uBOQIO4+nB09Txkl/zzLDT5mXth9lp7u0qHc80MsD1Jpq69HAWpB3CGiBj8EFUBE3z6XGKz5mrnfdv8rYYEO4zfqmL9lhGe4z5GDWDAxl2rfPwzoDwFm/DeBF1Vg82c4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752425647; c=relaxed/relaxed;
	bh=iSlq3w/NWZiDr688hgN1b6ijc9WOIvCGvW1QO0Zr6Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJV/n+yCydQvx9FXEvCmz/PLWqS6gUTbCAW1A6MPS6epSNtE93wC8jZ7xFKZG2VDbmbxT69JDJ22d7/QL5oFGGdemwslLddqWT9TVfc171SlHf5iowXOokMIg8nTWCEsketpqdjoxaheFzenPSwO/CPPPS4P1NWVyChsjV2Ci2+yQiwlEfjmQ7F8QsCbs1sRa7xAzqeQEal6uketw8Jmup0/2NNCMe1hqcqLart2QMFjM0BPZai0AfeZiIBGcFUTdlX9ikQDmInIeyu0cyqM+RfVGn2JcTGKxHKMEsccV1fiLwNkPajrAAhUBxe24+bmr7FhtFw+LL/FBBBJK6GZSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psBeNjv+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psBeNjv+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgBPC1r0jz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 02:54:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D42FC43AFC;
	Sun, 13 Jul 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5CC4CEE3;
	Sun, 13 Jul 2025 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752425644;
	bh=Ow06yQH+u1TUlWbbAwuQ6n6w8NZPq6HcKp1HGVfdQHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psBeNjv+mOu40r53jPAVUKkDWtOk29oQIjMtjuLacb0tSv7EYhwPGGy6ZIDNaeC5J
	 KLGDmHHNB6+CME4dLYfequUVCrgryGgkQH3/ZtSzl4Yh3rWI+TLRdtDli+cU7oBIR9
	 zTOcoykL/TuRZrmJp07fl9qyX5HaP+gNdLKl1Qkj21ZJxQ4c34NFHgWsvkF1Yvqpac
	 eXeBG/x7hXS2z+QMZ9oYTXXdBknoip3I9nOkH1YdWeRxSH9ljLerT2DjATvVmjB0kV
	 z3v7vio7962xSabdWzzE4DRFI1u18UTLVjtmdSYnSdykM0mDtU6xhHaZqh0NBwhRGn
	 IFi7rHIUzSk7Q==
Date: Sun, 13 Jul 2025 09:54:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
Message-ID: <20250713165401.GA1773@quark>
References: <20250712232329.818226-1-ebiggers@kernel.org>
 <20250712232329.818226-4-ebiggers@kernel.org>
 <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
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
In-Reply-To: <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jul 13, 2025 at 03:05:16PM +0000, Elliott, Robert (Servers) wrote:
> > -----Original Message-----
> > From: Eric Biggers <ebiggers@kernel.org>
> > Sent: Saturday, July 12, 2025 6:23 PM
> > Subject: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
> ...
> > +static void __maybe_unused sha1_blocks_generic(struct sha1_block_state
> > *state,
> > +					       const u8 *data, size_t nblocks)
> > +{
> > +	u32 workspace[SHA1_WORKSPACE_WORDS];
> > +
> > +	do {
> > +		sha1_transform(state->h, data, workspace);
> > +		data += SHA1_BLOCK_SIZE;
> > +	} while (--nblocks);
> > +
> > +	memzero_explicit(workspace, sizeof(workspace));
> > +}
> 
> That assumes the caller will never pass nblocks of 0... should that be
> checked first?

No.  This is a static function, and it's easy to verify that all callers
pass a positive nblocks.  All these code paths are also well-covered by
sha1_kunit.  Also, lib/crypto/sha256.c and lib/crypto/sha512.c do the
exact same thing.  Also, most of the architecture-specfiic
implementations of sha{1,256,512}_blocks() assume positive nblocks too.

- Eric

