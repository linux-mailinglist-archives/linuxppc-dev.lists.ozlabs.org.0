Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFD2FE713
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 11:06:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLyhg5pRvzDrQV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 21:06:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jRqPXJRN; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLycC2dy1zDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 21:02:19 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFBFB23975
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611223335;
 bh=Usn9Wh/dmRovxaADPt/skhN4qrNG9qwZMhB/ref6Oig=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jRqPXJRN2P3v7GaKD5LF4yWqM3yUNzbz8N+mgh17JQmRelDkzMeTIsk904RpKa8R2
 gsUSskRX6d2Ft9LH9SX1Bi2QCjGJc8f3Uw2za8ddyrQwi8ynzPN4dDaa2YU68NrkoK
 1rcubIcYc/pkKu23GhK+TjNVbGom5xN0BBDg5Gg7GQF4vOBLCGvA+d2JVuv8Vk8YQC
 5/L+uOpKgsU5Azn2QMfY6WrVE1A0Yuu5oaONhqLfmlDfscUH8LrxodUUrqNmK8GLyx
 FQfxKrTs6HwTmJL4JBweI/ZH5QTgA7sm1S92ljp/89LMaX4M5XAjae9RwD/F435jmm
 GVAqHEFPthQKw==
Received: by mail-ot1-f51.google.com with SMTP id d1so1037297otl.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 02:02:15 -0800 (PST)
X-Gm-Message-State: AOAM533RyVYYwox/8gTN0UjZjqqVl2FUxu+CAMEBXLhawZq+afKbIrG5
 s6aC9qwRtJt8iQB1/IHiblKGPqe2pNa/Pzntacc=
X-Google-Smtp-Source: ABdhPJyiTMZ7F7Ce9f4OLX5nYH3aSt0XLhnadS1cBkE743L07yp87cGVGygXB+Y1HdGWhBM3qoqJaqBUs/p/RjiyCzA=
X-Received: by 2002:a05:6830:1158:: with SMTP id
 x24mr9677454otq.108.1611223334974; 
 Thu, 21 Jan 2021 02:02:14 -0800 (PST)
MIME-Version: 1.0
References: <4b7a870573f485b9fea496b13c9b02d86dd97314.1611169001.git.christophe.leroy@csgroup.eu>
 <CAMj1kXE7B05eAnR7KoDCym09Cw5qnzrV8KfNT2zJrko+mFic+w@mail.gmail.com>
 <6b804eff-bc9f-5e05-d479-f398de4e2b30@csgroup.eu>
 <CAMj1kXHz8LdDgfOcifcB-MBMM9-TbymOU_psT3JBFQfyvQ=EjQ@mail.gmail.com>
 <ecdd07b3-afca-7e26-b6b6-3a3a985bc5a1@csgroup.eu>
In-Reply-To: <ecdd07b3-afca-7e26-b6b6-3a3a985bc5a1@csgroup.eu>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 21 Jan 2021 11:02:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFNZba9T45RaB_W58Z+4sdAyUDVJM_ZZPk+Y6Mf9DZUQw@mail.gmail.com>
Message-ID: <CAMj1kXFNZba9T45RaB_W58Z+4sdAyUDVJM_ZZPk+Y6Mf9DZUQw@mail.gmail.com>
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

On Thu, 21 Jan 2021 at 10:54, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 21/01/2021 =C3=A0 08:31, Ard Biesheuvel a =C3=A9crit :
> > On Thu, 21 Jan 2021 at 06:35, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 20/01/2021 =C3=A0 23:23, Ard Biesheuvel a =C3=A9crit :
> >>> On Wed, 20 Jan 2021 at 19:59, Christophe Leroy
> >>> <christophe.leroy@csgroup.eu> wrote:
> >>>>
> >>>> Talitos Security Engine AESU considers any input
> >>>> data size that is not a multiple of 16 bytes to be an error.
> >>>> This is not a problem in general, except for Counter mode
> >>>> that is a stream cipher and can have an input of any size.
> >>>>
> >>>> Test Manager for ctr(aes) fails on 4th test vector which has
> >>>> a length of 499 while all previous vectors which have a 16 bytes
> >>>> multiple length succeed.
> >>>>
> >>>> As suggested by Freescale, round up the input data length to the
> >>>> nearest 16 bytes.
> >>>>
> >>>> Fixes: 5e75ae1b3cef ("crypto: talitos - add new crypto modes")
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>>
> >>> Doesn't this cause the hardware to write outside the given buffer?
> >>
> >>
> >> Only the input length is modified. Not the output length.
> >>
> >> The ERRATA says:
> >>
> >> The input data length (in the descriptor) can be rounded up to the nea=
rest 16B. Set the
> >> data-in length (in the descriptor) to include X bytes of data beyond t=
he payload. Set the
> >> data-out length to only output the relevant payload (don't need to out=
put the padding).
> >> SEC reads from memory are not destructive, so the extra bytes included=
 in the AES-CTR
> >> operation can be whatever bytes are contiguously trailing the payload.
> >
> > So what happens if the input is not 16 byte aligned, and rounding it
> > up causes it to extend across a page boundary into a page that is not
> > mapped by the IOMMU/SMMU?
> >
>
> What is the IOMMU/SMMU ?
>
> The mpc8xx, mpc82xx and mpc83xx which embed the Talitos Security Engine d=
on't have such thing, the
> security engine uses DMA and has direct access to the memory bus for read=
ing and writing.
>

OK, good. So the only case where this could break is when the DMA
access spills over into a page that does not exist, and I suppose this
could only happen if the transfer involves a buffer located at the
very top of DRAM, right?
