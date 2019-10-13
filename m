Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC27D577B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 20:58:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rrYJ3HZYzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 05:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="R2olzMav"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rrWT2DdPzDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 05:56:20 +1100 (AEDT)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A38DA205F4;
 Sun, 13 Oct 2019 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570992977;
 bh=Y9kxwWDyqUSoQ1/hVR+Wp28960MjO8KOIQpmQnogB4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R2olzMavVH+qC0T7OxCVESf//NIWEs0WcIaxqnE2ZkfIwTB2CPZ/t7H/X0YNV56Dm
 worBxqumuIPcpXaJZouxzD++jtL/s0ymNr8YVo+hcV0nABuPn9JUqkfmmOP8pSpZRp
 yh0tDzAh0MGSsALO20cMgczJ1Qa65crdzi8UagkI=
Date: Sun, 13 Oct 2019 11:56:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 0/4] crypto: nx - convert to skcipher API
Message-ID: <20191013185616.GA10007@sol.localdomain>
Mail-Followup-To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
References: <20191013043918.337113-1-ebiggers@kernel.org>
 <CAKv+Gu8nN48aWoeW-aA_1OA_s8Qw0nUbyg+GCZ9DsUA3tDNprg@mail.gmail.com>
 <CAKv+Gu-PEemQvXv=kqxfqb4RvmpdU2h7TZHKps2FKTBUTKFehQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-PEemQvXv=kqxfqb4RvmpdU2h7TZHKps2FKTBUTKFehQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 13, 2019 at 05:31:31PM +0200, Ard Biesheuvel wrote:
> On Sun, 13 Oct 2019 at 08:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > On Sun, 13 Oct 2019 at 06:40, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > This series converts the PowerPC Nest (NX) implementations of AES modes
> > > from the deprecated "blkcipher" API to the "skcipher" API.  This is
> > > needed in order for the blkcipher API to be removed.
> > >
> > > This patchset is compile-tested only, as I don't have this hardware.
> > > If anyone has this hardware, please test this patchset with
> > > CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.
> > >
> > > Eric Biggers (4):
> > >   crypto: nx - don't abuse blkcipher_desc to pass iv around
> > >   crypto: nx - convert AES-ECB to skcipher API
> > >   crypto: nx - convert AES-CBC to skcipher API
> > >   crypto: nx - convert AES-CTR to skcipher API
> > >
> > >  drivers/crypto/nx/nx-aes-cbc.c | 81 ++++++++++++++-----------------
> > >  drivers/crypto/nx/nx-aes-ccm.c | 40 ++++++----------
> > >  drivers/crypto/nx/nx-aes-ctr.c | 87 +++++++++++++++-------------------
> > >  drivers/crypto/nx/nx-aes-ecb.c | 76 +++++++++++++----------------
> > >  drivers/crypto/nx/nx-aes-gcm.c | 24 ++++------
> > >  drivers/crypto/nx/nx.c         | 64 ++++++++++++++-----------
> > >  drivers/crypto/nx/nx.h         | 19 ++++----
> > >  7 files changed, 176 insertions(+), 215 deletions(-)
> > >
> >
> > Hi Eric,
> >
> > Thanks for taking this on. I'll look in more detail at these patches
> > during the week. In the meantime, I may have a stab at converting ccp,
> > virtio-crypto and omap aes/des myself, since i have the hardware to
> > test those.
> >
> 
> OK, I got a bit carried away, and converted a bunch of platforms in
> drivers/crypto (build tested only, except for the virtio driver)
> 
> crypto: qce - switch to skcipher API
> crypto: rockchip - switch to skcipher API
> crypto: stm32 - switch to skcipher API
> crypto: sahara - switch to skcipher API
> crypto: picoxcell - switch to skcipher API
> crypto: mediatek - switch to skcipher API
> crypto: mxs - switch to skcipher API
> crypto: ixp4xx - switch to skcipher API
> crypto: hifn - switch to skcipher API
> crypto: chelsio - switch to skcipher API
> crypto: cavium/cpt - switch to skcipher API
> crypto: nitrox - remove cra_type reference to ablkcipher
> crypto: bcm-spu - switch to skcipher API
> crypto: atmel-tdes - switch to skcipher API
> crypto: atmel-aes - switch to skcipher API
> crypto: s5p - switch to skcipher API
> crypto: ux500 - switch to skcipher API
> crypto: omap - switch to skcipher API
> crypto: virtio - switch to skcipher API
> crypto: virtio - deal with unsupported input sizes
> crypto: virtio - implement missing support for output IVs
> crypto: ccp - switch from ablkcipher to skcipher
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=ablkcipher-removal
> 
> I pushed the branch to kernelci, so hopefully we'll get some automated
> results, but I think only a small subset of these are boot tested atm.

Awesome, thanks for doing this!  I was just planning to do "blkcipher" for now,
but your patches will take care of almost all of "ablkcipher" too.

A few things I noticed from quickly skimming through your patches:

"ecb-des3-omap", "cbc-des3-omap", "atmel-ecb-tdes", "atmel-cbc-tdes", and
"atmel-ofb-tdes" had their min and/or max key size incorrectly changed to 8
(DES_BLOCK_SIZE or DES3_EDE_BLOCK_SIZE) rather than left as 24
(DES3_EDE_KEY_SIZE or 3*DES_KEY_SIZE).

cra_blocksize for "atmel-cfb64-aes" was changed from CFB64_BLOCK_SIZE to
AES_BLOCKSIZE.  Intentional?

cra_blocksize for "stm32-ctr-aes" and for "cfb-aes-mtk" was changed from 1 to
AES_BLOCK_SIZE.  Intentional?

CRYPTO_ALG_NEED_FALLBACK was added to "cbc-des-picoxcell" and "ecb-des-picoxcell".
Intentional?

In drivers/crypto/ixp4xx_crypto.c, .walksize was set on "rfc3686(ctr(aes))"
rather than .chunksize.  Intentional?

In drivers/crypto/qce/, CRYPTO_ALG_TYPE_ABLKCIPHER should be replaced with
CRYPTO_ALG_TYPE_SKCIPHER.

In drivers/crypto/stm32/, could rename crypto_algs[] to skcipher_algs[].

Thanks!

- Eric
