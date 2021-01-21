Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A902FE404
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 08:34:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLvKd5gryzDqtt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 18:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=um7p9khj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLvGv0jVLzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 18:32:07 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E106F2396D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611214324;
 bh=q3em4ttxmd/mm5bQE6zL/zuR3Glx3mnZ0Ny4CAvnbkk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=um7p9khjJbhGbtt0RJxEABDbc1l0x9d13FR1vOyaKt4QIpk2hNnUUBfVJEWZf+OcQ
 iKIBpafdwMEmoLo3lopPHAz84vDcApfDCKPQuJhkjY9ydbAZFNQ2a67mGJH2CnT4A2
 jPh04Ki0izdantto4qGzert1HtSZXAv3mInVLzqGpNX7DJ/jJUxb6CRk8+QwLeSeWi
 j0SfIXZNLCvXC/sCdp6w2gT5jSUUpPmdLyJc10CF1JFnGvAbQUqeMza5Ixh9yx+518
 hAgykouFneMKO9PIDjCcZPjJ3ENuJoKmBQdySkbhw5hrkqSrg93+/ECHvto9dAolYd
 lItiFoGMTU9nw==
Received: by mail-ot1-f45.google.com with SMTP id a109so774080otc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 23:32:03 -0800 (PST)
X-Gm-Message-State: AOAM532ooaNJzPlbbnMQJt/crWTgVej6G+vBCbSGeBnzz+5QGC4SrB/k
 OW2diV/YJRf1JkO/6DvCPei1BzJU9Mrfa0xxrfQ=
X-Google-Smtp-Source: ABdhPJwX5S75sDg7kRN312ywLjqyiIco3BWWsXzxEB/auPLbBSN709Hrw+A31zd0V9BIGYEUP/+35z8M6uqwlv2vO9Q=
X-Received: by 2002:a05:6830:1614:: with SMTP id
 g20mr3700710otr.77.1611214323096; 
 Wed, 20 Jan 2021 23:32:03 -0800 (PST)
MIME-Version: 1.0
References: <4b7a870573f485b9fea496b13c9b02d86dd97314.1611169001.git.christophe.leroy@csgroup.eu>
 <CAMj1kXE7B05eAnR7KoDCym09Cw5qnzrV8KfNT2zJrko+mFic+w@mail.gmail.com>
 <6b804eff-bc9f-5e05-d479-f398de4e2b30@csgroup.eu>
In-Reply-To: <6b804eff-bc9f-5e05-d479-f398de4e2b30@csgroup.eu>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 21 Jan 2021 08:31:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHz8LdDgfOcifcB-MBMM9-TbymOU_psT3JBFQfyvQ=EjQ@mail.gmail.com>
Message-ID: <CAMj1kXHz8LdDgfOcifcB-MBMM9-TbymOU_psT3JBFQfyvQ=EjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] crypto: talitos - Work around SEC6 ERRATA (AES-CTR
 mode data size error)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Jan 2021 at 06:35, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 20/01/2021 =C3=A0 23:23, Ard Biesheuvel a =C3=A9crit :
> > On Wed, 20 Jan 2021 at 19:59, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Talitos Security Engine AESU considers any input
> >> data size that is not a multiple of 16 bytes to be an error.
> >> This is not a problem in general, except for Counter mode
> >> that is a stream cipher and can have an input of any size.
> >>
> >> Test Manager for ctr(aes) fails on 4th test vector which has
> >> a length of 499 while all previous vectors which have a 16 bytes
> >> multiple length succeed.
> >>
> >> As suggested by Freescale, round up the input data length to the
> >> nearest 16 bytes.
> >>
> >> Fixes: 5e75ae1b3cef ("crypto: talitos - add new crypto modes")
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >
> > Doesn't this cause the hardware to write outside the given buffer?
>
>
> Only the input length is modified. Not the output length.
>
> The ERRATA says:
>
> The input data length (in the descriptor) can be rounded up to the neares=
t 16B. Set the
> data-in length (in the descriptor) to include X bytes of data beyond the =
payload. Set the
> data-out length to only output the relevant payload (don't need to output=
 the padding).
> SEC reads from memory are not destructive, so the extra bytes included in=
 the AES-CTR
> operation can be whatever bytes are contiguously trailing the payload.

So what happens if the input is not 16 byte aligned, and rounding it
up causes it to extend across a page boundary into a page that is not
mapped by the IOMMU/SMMU?
