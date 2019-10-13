Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7FAD569F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 17:33:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rm1H4SCnzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 02:33:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="jO212bsL"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rlzT2bpczDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 02:31:48 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id 3so14361529wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=un6QLRuM9urISafHkBqQN+FKjxq2aO4SrSF2GfFXUuo=;
 b=jO212bsLMmv0ZCk3bSEoPmBHjHkwY+ZyJCGSVM+RHzjAkXms5PqkK3+8/0ZhT6F9vA
 XZ/YEWhAdg1askw8jWLcj6mM6rjij8eyC9izRQ0gklJsdRq0M3vmUlbo+kI0agXtyUwY
 Z1Yxms9xpAxmORR5EclpvtscwIZrTcqDg4DIRFprxDBarvvaTz+7tOaFS7/kX2u8zBt+
 3fFBPmSWOXGlx2qz8HqJfwbhVU3W+EsFYGpnkUzZPyVH6AKg3jMjghqnO79KAZ8nM+PF
 BHT9+9ktOjESkkVaJ427f5XmPmf7y4+hYgCKurmEslwnNa3/onzm6/IVenkiK6F8YTtH
 VNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=un6QLRuM9urISafHkBqQN+FKjxq2aO4SrSF2GfFXUuo=;
 b=otfNcwxik2J6Ocq0AFNNxl+Skyu8KXWPk9OjkfmsKt1x75DvutD7B4aHViuQ2qUoyx
 JJyIouuY/hr+/ld7V+2tfWUy8E5DPZqdjCz588gN5igBfuijw1n1KZkIi4rOdks2mXl/
 LdHmS4wiomjMQ8p54Dk+0xpeQPQ3WnbQr2gYQFJFCRrfOD5zRind3qcRjUV+6DhPFPyK
 i9ee61uqFcaoMjaaB4pMdGPYhIIxTysG3Ki1kZVe3NGHmY+WnTvcRtpKcI0BYagDK/97
 /E7lc23C8FQLJ4Klt6e9Colc0D9T54j4VY/MTWWGqNg1OqAtYS/bdaOGEV0tgj5DWD9w
 57SQ==
X-Gm-Message-State: APjAAAW9GbPzXbYUMCQ0i3Rdm2jHlyQ9HB9XeZ7upNBmZWJdp7wljjPT
 nlREAo2pvrZ52nL62CisqER1dJRRK27nHZL3H2xhJg==
X-Google-Smtp-Source: APXvYqw5e3GV0VJAjB0u7VuHOCiMhakyp+ejLPtjBvbRRrigL7S24yII+ua3CNj1igfmSmdSLJMk/+FuYmI5Z48gEcE=
X-Received: by 2002:a1c:a9c5:: with SMTP id s188mr10638905wme.61.1570980704091; 
 Sun, 13 Oct 2019 08:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191013043918.337113-1-ebiggers@kernel.org>
 <CAKv+Gu8nN48aWoeW-aA_1OA_s8Qw0nUbyg+GCZ9DsUA3tDNprg@mail.gmail.com>
In-Reply-To: <CAKv+Gu8nN48aWoeW-aA_1OA_s8Qw0nUbyg+GCZ9DsUA3tDNprg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sun, 13 Oct 2019 17:31:31 +0200
Message-ID: <CAKv+Gu-PEemQvXv=kqxfqb4RvmpdU2h7TZHKps2FKTBUTKFehQ@mail.gmail.com>
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

On Sun, 13 Oct 2019 at 08:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Sun, 13 Oct 2019 at 06:40, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > This series converts the PowerPC Nest (NX) implementations of AES modes
> > from the deprecated "blkcipher" API to the "skcipher" API.  This is
> > needed in order for the blkcipher API to be removed.
> >
> > This patchset is compile-tested only, as I don't have this hardware.
> > If anyone has this hardware, please test this patchset with
> > CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.
> >
> > Eric Biggers (4):
> >   crypto: nx - don't abuse blkcipher_desc to pass iv around
> >   crypto: nx - convert AES-ECB to skcipher API
> >   crypto: nx - convert AES-CBC to skcipher API
> >   crypto: nx - convert AES-CTR to skcipher API
> >
> >  drivers/crypto/nx/nx-aes-cbc.c | 81 ++++++++++++++-----------------
> >  drivers/crypto/nx/nx-aes-ccm.c | 40 ++++++----------
> >  drivers/crypto/nx/nx-aes-ctr.c | 87 +++++++++++++++-------------------
> >  drivers/crypto/nx/nx-aes-ecb.c | 76 +++++++++++++----------------
> >  drivers/crypto/nx/nx-aes-gcm.c | 24 ++++------
> >  drivers/crypto/nx/nx.c         | 64 ++++++++++++++-----------
> >  drivers/crypto/nx/nx.h         | 19 ++++----
> >  7 files changed, 176 insertions(+), 215 deletions(-)
> >
>
> Hi Eric,
>
> Thanks for taking this on. I'll look in more detail at these patches
> during the week. In the meantime, I may have a stab at converting ccp,
> virtio-crypto and omap aes/des myself, since i have the hardware to
> test those.
>

OK, I got a bit carried away, and converted a bunch of platforms in
drivers/crypto (build tested only, except for the virtio driver)

crypto: qce - switch to skcipher API
crypto: rockchip - switch to skcipher API
crypto: stm32 - switch to skcipher API
crypto: sahara - switch to skcipher API
crypto: picoxcell - switch to skcipher API
crypto: mediatek - switch to skcipher API
crypto: mxs - switch to skcipher API
crypto: ixp4xx - switch to skcipher API
crypto: hifn - switch to skcipher API
crypto: chelsio - switch to skcipher API
crypto: cavium/cpt - switch to skcipher API
crypto: nitrox - remove cra_type reference to ablkcipher
crypto: bcm-spu - switch to skcipher API
crypto: atmel-tdes - switch to skcipher API
crypto: atmel-aes - switch to skcipher API
crypto: s5p - switch to skcipher API
crypto: ux500 - switch to skcipher API
crypto: omap - switch to skcipher API
crypto: virtio - switch to skcipher API
crypto: virtio - deal with unsupported input sizes
crypto: virtio - implement missing support for output IVs
crypto: ccp - switch from ablkcipher to skcipher

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=ablkcipher-removal

I pushed the branch to kernelci, so hopefully we'll get some automated
results, but I think only a small subset of these are boot tested atm.
