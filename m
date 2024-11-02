Return-Path: <linuxppc-dev+bounces-2772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13489B9F29
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 12:09:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgZjk4F6Zz2xHx;
	Sat,  2 Nov 2024 22:08:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730545738;
	cv=none; b=oU8Lyzd+EWa+9CUUNwU3Y/DJpfXTsu3v/GJR7jjdRiKSzp/hwrvgMSlMIl9H2UryenlVHCPrrjlCUlq/A9qRkceGpWciHzLahl8c3e4L/jnA8siX6oKa3iyTfzjJUY+dkVK5I4+aZZmQ50MtIAX+ymQI45mZjoK5CTB0Vt8/1J5a7aXUqbeokO92ZNUPY25K8eTqv1yxqqjV5yPXAvnZTw/2ZxtJ/Ez6T0sWYJ8qxDHhbvEw5RWLB+UE2ZLri/W3A8Yl6vAv+mO35NPl42aLYCQNnI703Rd0H4UtlO67fUH7iX3GwbDGsF0RSH0XO5yJre1thvWZLWrSSuQOEgErbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730545738; c=relaxed/relaxed;
	bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/O9Yzjwz3mLzfZsMrXD+yBpSO0txFAFiO0FoZBdjhY/AD8ORaArizb8/asoKcrM0eqJF6A0+CpaTDHPNVMpJ0mfCl8L/wNHyP2/s7GB9vnSV6nOL6EQkLyGe4miBN9eP24/Ab3WWIgFShQrPAu7lKsMdpn5u0cH1cl2SyhGbYxXl7IzRAVs7MFOtD7DPLGGOi3Lbk/tFHxfWT4WxzgT6C//LXVZLz2BD+z1YSlcZY/vvztQfB4M1qWuMl2plzx/9uV7+ZLVwNYrDcf8DmQ9MGxD/3Zh9bjTKcGq/mDGfo5OZp3GP0le0qi1XNH1eJFMk3r2DTBIQ6aPPKbxZvURpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=ZL/lvV/0; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=ZL/lvV/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgZjh3xmZz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 22:08:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=; b=ZL/lvV/0NG+jnrygJ/ulUipBlK
	qP9nNwqVQWNXM6Mo4bBB3wTvXS6oRzgEKSHf55UXhXhzl6CQWDcLaKiJVFPLfJWGDYzgQucVtLoXu
	EdgtwDpESedu90LNlQ/3ESKbF6ZllB13v5NTAUox4RYWGiwG0gPbhcB9nhH9k15mZ/+NFfBDzBZhT
	ZXkVWdsMEUU+MuBkn0bvppo0elNwSfGET6JHSBcIK+uM55LY9FOpzK7dAKO7wfzB9TVAXeFIWaCKY
	of25XbcMJoe7WP1/TZrB8M9THZkyGx/lpgRJ1Zogfa/NIqKJhYAzvuJg9eOUYUwS6oN1RCWC7zQ1Z
	rIC9NpXA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t7Bzn-00DyOZ-3A;
	Sat, 02 Nov 2024 19:08:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 02 Nov 2024 19:08:43 +0800
Date: Sat, 2 Nov 2024 19:08:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
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
In-Reply-To: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
>
> The only issue resulting from *not* taking this patch is that btrfs
> may misidentify the CRC32 implementation as being 'slow' and take an
> alternative code path, which does not necessarily result in worse
> performance.

If we were removing crc32* (or at least crc32*-arch) from the Crypto
API then these patches would be redundant.  But if we're keeping them
because btrfs uses them then we should definitely make crc32*-arch
do the right thing.  IOW they should not be registered if they're
the same as crc32*-generic.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

