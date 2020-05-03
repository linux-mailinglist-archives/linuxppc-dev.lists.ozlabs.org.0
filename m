Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B37741C2DE8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 18:16:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FWMD2H2PzDqhS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 02:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=HUw64GcC; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FWKK5BT8zDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 02:14:45 +1000 (AEST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A60A221835
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588522482;
 bh=v/GdpUiwhUEgyLIQs4iqBWqCrRSiBXU6uSbDJ7XGPiA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HUw64GcCuh4QEKVQzd19hfQ6MuE85JT+aL8V+5myvA/ocJchkFZO3QDIbIZkKgTiO
 hUv4qdIVYpzKt8SY2tlrQA8nwQeSaSYT3HE3luy30EkCF2F7DEU1acSq3puJMyy/fU
 KMX6Ot8zwqoePdKP+366XeRo3Oqq7OXgONx8WNNA=
Received: by mail-il1-f172.google.com with SMTP id w6so9040488ilg.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 May 2020 09:14:42 -0700 (PDT)
X-Gm-Message-State: AGi0Pua98/Un2sNCOe9xKSGcEQxqnvdoryqXimcRy8r6GzyM8R1gOnDW
 nbJsGHXkodsJXZgS9uvuhTixxjnMRQF56rRRwaM=
X-Google-Smtp-Source: APiQypK7cKz3TGzrgiEEmohb3IEejW1GKi071ccK4M2qSXz7GkH9GOLTsLT+pVxFg8EWfCmzjA1ERwmumjj/PshL39U=
X-Received: by 2002:a92:39dd:: with SMTP id h90mr12778366ilf.80.1588522482062; 
 Sun, 03 May 2020 09:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200502182427.104383-1-ebiggers@kernel.org>
In-Reply-To: <20200502182427.104383-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 3 May 2020 18:14:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEBR1FUHOfCo1G2tGVgZDdSsUx8ZrNdLqHbKP6Hw7LfMw@mail.gmail.com>
Message-ID: <CAMj1kXEBR1FUHOfCo1G2tGVgZDdSsUx8ZrNdLqHbKP6Hw7LfMw@mail.gmail.com>
Subject: Re: [PATCH 0/7] sha1 library cleanup
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Theodore Ts'o <tytso@mit.edu>, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, mptcp@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2 May 2020 at 20:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
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
>   mptcp: use SHA256_BLOCK_SIZE, not SHA_MESSAGE_BYTES
>   crypto: powerpc/sha1 - remove unused temporary workspace
>   crypto: powerpc/sha1 - prefix the "sha1_" functions
>   crypto: s390/sha1 - prefix the "sha1_" functions
>   crypto: lib/sha1 - rename "sha" to "sha1"
>   crypto: lib/sha1 - remove unnecessary includes of linux/cryptohash.h
>   crypto: lib/sha1 - fold linux/cryptohash.h into crypto/sha.h
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  Documentation/security/siphash.rst          |  2 +-
>  arch/arm/crypto/sha1_glue.c                 |  1 -
>  arch/arm/crypto/sha1_neon_glue.c            |  1 -
>  arch/arm/crypto/sha256_glue.c               |  1 -
>  arch/arm/crypto/sha256_neon_glue.c          |  1 -
>  arch/arm/kernel/armksyms.c                  |  1 -
>  arch/arm64/crypto/sha256-glue.c             |  1 -
>  arch/arm64/crypto/sha512-glue.c             |  1 -
>  arch/microblaze/kernel/microblaze_ksyms.c   |  1 -
>  arch/mips/cavium-octeon/crypto/octeon-md5.c |  1 -
>  arch/powerpc/crypto/md5-glue.c              |  1 -
>  arch/powerpc/crypto/sha1-spe-glue.c         |  1 -
>  arch/powerpc/crypto/sha1.c                  | 33 ++++++++++-----------
>  arch/powerpc/crypto/sha256-spe-glue.c       |  1 -
>  arch/s390/crypto/sha1_s390.c                | 12 ++++----
>  arch/sparc/crypto/md5_glue.c                |  1 -
>  arch/sparc/crypto/sha1_glue.c               |  1 -
>  arch/sparc/crypto/sha256_glue.c             |  1 -
>  arch/sparc/crypto/sha512_glue.c             |  1 -
>  arch/unicore32/kernel/ksyms.c               |  1 -
>  arch/x86/crypto/sha1_ssse3_glue.c           |  1 -
>  arch/x86/crypto/sha256_ssse3_glue.c         |  1 -
>  arch/x86/crypto/sha512_ssse3_glue.c         |  1 -
>  crypto/sha1_generic.c                       |  5 ++--
>  drivers/char/random.c                       |  8 ++---
>  drivers/crypto/atmel-sha.c                  |  1 -
>  drivers/crypto/chelsio/chcr_algo.c          |  1 -
>  drivers/crypto/chelsio/chcr_ipsec.c         |  1 -
>  drivers/crypto/omap-sham.c                  |  1 -
>  fs/f2fs/hash.c                              |  1 -
>  include/crypto/sha.h                        | 10 +++++++
>  include/linux/cryptohash.h                  | 14 ---------
>  include/linux/filter.h                      |  4 +--
>  include/net/tcp.h                           |  1 -
>  kernel/bpf/core.c                           | 18 +++++------
>  lib/crypto/chacha.c                         |  1 -
>  lib/sha1.c                                  | 24 ++++++++-------
>  net/core/secure_seq.c                       |  1 -
>  net/ipv6/addrconf.c                         | 10 +++----
>  net/ipv6/seg6_hmac.c                        |  1 -
>  net/mptcp/crypto.c                          |  4 +--
>  41 files changed, 69 insertions(+), 104 deletions(-)
>  delete mode 100644 include/linux/cryptohash.h
>
>
> base-commit: 12b3cf9093542d9f752a4968815ece836159013f
> --
> 2.26.2
>
