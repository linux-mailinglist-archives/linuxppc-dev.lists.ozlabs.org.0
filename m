Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F28AE1CA3A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:09:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JKg83R3jzDqyx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JKdQ5X5tzDqyh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 16:08:24 +1000 (AEST)
Received: from gwarestrin.me.apana.org.au ([192.168.0.7]
 helo=gwarestrin.arnor.me.apana.org.au)
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1jWw4W-00055R-7Y; Fri, 08 May 2020 16:01:21 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 08 May 2020 16:07:59 +1000
Date: Fri, 8 May 2020 16:07:59 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/7] sha1 library cleanup
Message-ID: <20200508060759.GA24982@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502182427.104383-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Jason@zx2c4.com, tytso@mit.edu,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-crypto@vger.kernel.org, pabeni@redhat.com, mptcp@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric Biggers <ebiggers@kernel.org> wrote:
> <linux/cryptohash.h> sounds very generic and important, like it's the
> header to include if you're doing cryptographic hashing in the kernel.
> But actually it only includes the library implementation of the SHA-1
> compression function (not even the full SHA-1).  This should basically
> never be used anymore; SHA-1 is no longer considered secure, and there
> are much better ways to do cryptographic hashing in the kernel.
> 
> Also the function is named just "sha_transform()", which makes it
> unclear which version of SHA is meant.
> 
> Therefore, this series cleans things up by moving these SHA-1
> declarations into <crypto/sha.h> where they better belong, and changing
> the names to say SHA-1 rather than just SHA.
> 
> As future work, we should split sha.h into sha1.h and sha2.h and try to
> remove the remaining uses of SHA-1.  For example, the remaining use in
> drivers/char/random.c is probably one that can be gotten rid of.
> 
> This patch series applies to cryptodev/master.
> 
> Eric Biggers (7):
>  mptcp: use SHA256_BLOCK_SIZE, not SHA_MESSAGE_BYTES
>  crypto: powerpc/sha1 - remove unused temporary workspace
>  crypto: powerpc/sha1 - prefix the "sha1_" functions
>  crypto: s390/sha1 - prefix the "sha1_" functions
>  crypto: lib/sha1 - rename "sha" to "sha1"
>  crypto: lib/sha1 - remove unnecessary includes of linux/cryptohash.h
>  crypto: lib/sha1 - fold linux/cryptohash.h into crypto/sha.h
> 
> Documentation/security/siphash.rst          |  2 +-
> arch/arm/crypto/sha1_glue.c                 |  1 -
> arch/arm/crypto/sha1_neon_glue.c            |  1 -
> arch/arm/crypto/sha256_glue.c               |  1 -
> arch/arm/crypto/sha256_neon_glue.c          |  1 -
> arch/arm/kernel/armksyms.c                  |  1 -
> arch/arm64/crypto/sha256-glue.c             |  1 -
> arch/arm64/crypto/sha512-glue.c             |  1 -
> arch/microblaze/kernel/microblaze_ksyms.c   |  1 -
> arch/mips/cavium-octeon/crypto/octeon-md5.c |  1 -
> arch/powerpc/crypto/md5-glue.c              |  1 -
> arch/powerpc/crypto/sha1-spe-glue.c         |  1 -
> arch/powerpc/crypto/sha1.c                  | 33 ++++++++++-----------
> arch/powerpc/crypto/sha256-spe-glue.c       |  1 -
> arch/s390/crypto/sha1_s390.c                | 12 ++++----
> arch/sparc/crypto/md5_glue.c                |  1 -
> arch/sparc/crypto/sha1_glue.c               |  1 -
> arch/sparc/crypto/sha256_glue.c             |  1 -
> arch/sparc/crypto/sha512_glue.c             |  1 -
> arch/unicore32/kernel/ksyms.c               |  1 -
> arch/x86/crypto/sha1_ssse3_glue.c           |  1 -
> arch/x86/crypto/sha256_ssse3_glue.c         |  1 -
> arch/x86/crypto/sha512_ssse3_glue.c         |  1 -
> crypto/sha1_generic.c                       |  5 ++--
> drivers/char/random.c                       |  8 ++---
> drivers/crypto/atmel-sha.c                  |  1 -
> drivers/crypto/chelsio/chcr_algo.c          |  1 -
> drivers/crypto/chelsio/chcr_ipsec.c         |  1 -
> drivers/crypto/omap-sham.c                  |  1 -
> fs/f2fs/hash.c                              |  1 -
> include/crypto/sha.h                        | 10 +++++++
> include/linux/cryptohash.h                  | 14 ---------
> include/linux/filter.h                      |  4 +--
> include/net/tcp.h                           |  1 -
> kernel/bpf/core.c                           | 18 +++++------
> lib/crypto/chacha.c                         |  1 -
> lib/sha1.c                                  | 24 ++++++++-------
> net/core/secure_seq.c                       |  1 -
> net/ipv6/addrconf.c                         | 10 +++----
> net/ipv6/seg6_hmac.c                        |  1 -
> net/mptcp/crypto.c                          |  4 +--
> 41 files changed, 69 insertions(+), 104 deletions(-)
> delete mode 100644 include/linux/cryptohash.h
> 
> 
> base-commit: 12b3cf9093542d9f752a4968815ece836159013f

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
