Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC6D57E2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 21:50:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rskM5hHMzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 06:50:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="oD/LOIwu"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rshX2RN5zDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 06:49:14 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id j11so17250084wrp.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzXFmyngDWBgvgmIQTM6V3XN27zxR9QlMTf8A4TVEF8=;
 b=oD/LOIwu1+A2o+j8TGZqlV8v+zSKsu1vdiCfmsocLS8QKJUCG9P28HlFe4sVhf+pSE
 8oRoSCdcuTogdgoLz45YU9TQkuvbjh7qPMuBjyPXL4FtNCqrdxbFxoIwMPekM4N2Lyvk
 RD+ytm0g+ODdQTRJM6M85onYsfRAuGmjQDnJpMcQZgHo6sYm4BuGFBrVnRkwWqEZvgkX
 y5Unh8RvgjQQNDkdk5lDlVu+opszElAEOGqZ/yCZID7oNRYcxBl70gfZ6r3RbCF7RCIf
 ASMC12DjCvXutTkbF8Phqm56hmYC98GTiuWxeRqlh5iMq4WIURwbWR2utNxchRkvR6L/
 Oeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzXFmyngDWBgvgmIQTM6V3XN27zxR9QlMTf8A4TVEF8=;
 b=EUgar1IZw6CJ4zAmgCKbF2ep2fVoXZiNV03wVfL46WneaERpLbAgeBnjS780YOJppj
 VJjUS8cVFethMj35kBPXVkkfrLSnkPxHCCsYsbbdXJiqXUBuM0pasR0eXGPWSzV22PRw
 FaolKUyBTkD0fV7rOiEw1gZ4yjZOWBogjZlhBX6LrZCXjXQywwXissJnhv4PeClvCLBk
 SZ5hNcRGSRHZIT1IyfWsMIv4FIakQ+eaaipNdVk0NH4Kd0Lwl06Pw8jy1loCeGusAX4+
 e7DJjNxtEQV+kikFp8VxfIG9c7SGP7YHf6KgYmBKJgus9+dfR9/JPDr0U6zCg7nTzOZb
 Fjcw==
X-Gm-Message-State: APjAAAUZ+za8JLk6ZnMFwN2eEfMuIShA/PpVcRFcIjKw46rAc7DUM5FN
 HKOQgL+/eUc/s69Vi7AtEABa8mU3kW3YKA5K9zP0Qg==
X-Google-Smtp-Source: APXvYqwY6WRr3MREi99N5eVbZbe1587LZ/OY3CQJgIRdDFC5qLEVs1jENHgWMuG/3UHFgbnjcAcBmAOYlw2t0FRa9/A=
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr22258746wrr.200.1570996149368; 
 Sun, 13 Oct 2019 12:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191013043918.337113-1-ebiggers@kernel.org>
 <CAKv+Gu8nN48aWoeW-aA_1OA_s8Qw0nUbyg+GCZ9DsUA3tDNprg@mail.gmail.com>
 <CAKv+Gu-PEemQvXv=kqxfqb4RvmpdU2h7TZHKps2FKTBUTKFehQ@mail.gmail.com>
 <20191013185616.GA10007@sol.localdomain>
In-Reply-To: <20191013185616.GA10007@sol.localdomain>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sun, 13 Oct 2019 21:48:58 +0200
Message-ID: <CAKv+Gu_+yG0grjr+Y7rO8KYkvO5xjB-Y7B_AzuMPEHVTaUJB8w@mail.gmail.com>
Subject: Re: [PATCH 0/4] crypto: nx - convert to skcipher API
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 13 Oct 2019 at 20:56, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sun, Oct 13, 2019 at 05:31:31PM +0200, Ard Biesheuvel wrote:
> > On Sun, 13 Oct 2019 at 08:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> > >
> > > On Sun, 13 Oct 2019 at 06:40, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > This series converts the PowerPC Nest (NX) implementations of AES modes
> > > > from the deprecated "blkcipher" API to the "skcipher" API.  This is
> > > > needed in order for the blkcipher API to be removed.
> > > >
> > > > This patchset is compile-tested only, as I don't have this hardware.
> > > > If anyone has this hardware, please test this patchset with
> > > > CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.
> > > >
> > > > Eric Biggers (4):
> > > >   crypto: nx - don't abuse blkcipher_desc to pass iv around
> > > >   crypto: nx - convert AES-ECB to skcipher API
> > > >   crypto: nx - convert AES-CBC to skcipher API
> > > >   crypto: nx - convert AES-CTR to skcipher API
> > > >
> > > >  drivers/crypto/nx/nx-aes-cbc.c | 81 ++++++++++++++-----------------
> > > >  drivers/crypto/nx/nx-aes-ccm.c | 40 ++++++----------
> > > >  drivers/crypto/nx/nx-aes-ctr.c | 87 +++++++++++++++-------------------
> > > >  drivers/crypto/nx/nx-aes-ecb.c | 76 +++++++++++++----------------
> > > >  drivers/crypto/nx/nx-aes-gcm.c | 24 ++++------
> > > >  drivers/crypto/nx/nx.c         | 64 ++++++++++++++-----------
> > > >  drivers/crypto/nx/nx.h         | 19 ++++----
> > > >  7 files changed, 176 insertions(+), 215 deletions(-)
> > > >
> > >
> > > Hi Eric,
> > >
> > > Thanks for taking this on. I'll look in more detail at these patches
> > > during the week. In the meantime, I may have a stab at converting ccp,
> > > virtio-crypto and omap aes/des myself, since i have the hardware to
> > > test those.
> > >
> >
> > OK, I got a bit carried away, and converted a bunch of platforms in
> > drivers/crypto (build tested only, except for the virtio driver)
> >
> > crypto: qce - switch to skcipher API
> > crypto: rockchip - switch to skcipher API
> > crypto: stm32 - switch to skcipher API
> > crypto: sahara - switch to skcipher API
> > crypto: picoxcell - switch to skcipher API
> > crypto: mediatek - switch to skcipher API
> > crypto: mxs - switch to skcipher API
> > crypto: ixp4xx - switch to skcipher API
> > crypto: hifn - switch to skcipher API
> > crypto: chelsio - switch to skcipher API
> > crypto: cavium/cpt - switch to skcipher API
> > crypto: nitrox - remove cra_type reference to ablkcipher
> > crypto: bcm-spu - switch to skcipher API
> > crypto: atmel-tdes - switch to skcipher API
> > crypto: atmel-aes - switch to skcipher API
> > crypto: s5p - switch to skcipher API
> > crypto: ux500 - switch to skcipher API
> > crypto: omap - switch to skcipher API
> > crypto: virtio - switch to skcipher API
> > crypto: virtio - deal with unsupported input sizes
> > crypto: virtio - implement missing support for output IVs
> > crypto: ccp - switch from ablkcipher to skcipher
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=ablkcipher-removal
> >
> > I pushed the branch to kernelci, so hopefully we'll get some automated
> > results, but I think only a small subset of these are boot tested atm.
>
> Awesome, thanks for doing this!  I was just planning to do "blkcipher" for now,
> but your patches will take care of almost all of "ablkcipher" too.
>

Yeah. I thought it was about time we take care of this, and ablkcipher
is much more straightforward anyway.

> A few things I noticed from quickly skimming through your patches:
>

Thanks. These are all mistakes on my part - I went through these at
high speed with lots of mechanical search-replace.

> "ecb-des3-omap", "cbc-des3-omap", "atmel-ecb-tdes", "atmel-cbc-tdes", and
> "atmel-ofb-tdes" had their min and/or max key size incorrectly changed to 8
> (DES_BLOCK_SIZE or DES3_EDE_BLOCK_SIZE) rather than left as 24
> (DES3_EDE_KEY_SIZE or 3*DES_KEY_SIZE).
>
> cra_blocksize for "atmel-cfb64-aes" was changed from CFB64_BLOCK_SIZE to
> AES_BLOCKSIZE.  Intentional?
>
> cra_blocksize for "stm32-ctr-aes" and for "cfb-aes-mtk" was changed from 1 to
> AES_BLOCK_SIZE.  Intentional?
>
> CRYPTO_ALG_NEED_FALLBACK was added to "cbc-des-picoxcell" and "ecb-des-picoxcell".
> Intentional?
>
> In drivers/crypto/ixp4xx_crypto.c, .walksize was set on "rfc3686(ctr(aes))"
> rather than .chunksize.  Intentional?
>
> In drivers/crypto/qce/, CRYPTO_ALG_TYPE_ABLKCIPHER should be replaced with
> CRYPTO_ALG_TYPE_SKCIPHER.
>
> In drivers/crypto/stm32/, could rename crypto_algs[] to skcipher_algs[].
>
> Thanks!
>
> - Eric
