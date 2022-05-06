Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F188751DBEE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvvZc6W8Qz3c99
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 01:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=Stmbmn59;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=Stmbmn59; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvvYx4QG1z3byX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 01:27:01 +1000 (AEST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 246FQfRd011305
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 7 May 2022 00:26:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 246FQfRd011305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651850801;
 bh=LmXHJc7oS/PdyQsdT4vljgxE8B3aIXzCpMb9Ra3kshk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Stmbmn59ldEy+GBFGp+8r7kSYvon0E/wzy4D0iQ2lRVtg6hEUJgtNxNTQFKMaDQrm
 m+SMgUTchbK3NpBkyG1hcqzKzK1WtHSuzytHZLUZqeZzWWP5vn/C9S4O2NH7ZNZ1/m
 xCUnkPrtXhLsinFXJ8I1nRFZC/3BB5Teis5AbuFIwsO/aGi68B7uS/PhGNoS5/e6uz
 OFI3Wdt+dPH+c3jfVNYaJ+ldbu9rgQXAUVVVj+FbKnBWlMarjgEa/+B0dsu8HkcQiM
 nl1Li5jPfifDYYUYsU4VkdTVJGkdbZb3AWkOoy+75h1dasEyUTJcN6i+8qIIs0+LBV
 upgA55hQ194kA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so7024984pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 08:26:41 -0700 (PDT)
X-Gm-Message-State: AOAM533bIdeUsNBcTMXUJcoRtm6LF8TFtQO04IWHhrTafGSqdk2no1xb
 uoultpPNTB1AYdTSdmhAR2g8L1yDzWfnFsiEbtU=
X-Google-Smtp-Source: ABdhPJylpUvnnvUM3y2luvBKZgMp7DeP8Xi0cYmH+fbBhmGmj3nClkerUgf9xMXdQcoZ/35a/cKoEYyH4aK7EMOT7pg=
X-Received: by 2002:a17:90a:e517:b0:1d7:5bbd:f9f0 with SMTP id
 t23-20020a17090ae51700b001d75bbdf9f0mr4681022pjy.77.1651850800724; Fri, 06
 May 2022 08:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220501130749.1123387-1-masahiroy@kernel.org>
 <YnT3GtU975OsXVuN@gondor.apana.org.au>
In-Reply-To: <YnT3GtU975OsXVuN@gondor.apana.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 May 2022 00:25:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkQ_14NYu7K_eEOG4boBMpKEXyrOzDJMOjcT5paC7E1A@mail.gmail.com>
Message-ID: <CAK7LNASkQ_14NYu7K_eEOG4boBMpKEXyrOzDJMOjcT5paC7E1A@mail.gmail.com>
Subject: Re: [PATCH] crypto: vmx - Align the short log with Makefile cleanups
To: Herbert Xu <herbert@gondor.apana.org.au>
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
Cc: Nayna Jain <nayna@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Herbert,



On Fri, May 6, 2022 at 7:23 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sun, May 01, 2022 at 10:07:49PM +0900, Masahiro Yamada wrote:
> > I notieced the log is not properly aligned:
> >
> >   PERL drivers/crypto/vmx/aesp8-ppc.S
> >   CC [M]  fs/xfs/xfs_reflink.o
> >   PERL drivers/crypto/vmx/ghashp8-ppc.S
> >   CC [M]  drivers/crypto/vmx/aes.o
> >
> > Add some spaces after 'PERL'.
> >
> > While I was here, I cleaned up the Makefile:
> >
> >  - Merge the two similar rules
> >
> >  - Remove redundant 'clean-files' (Having 'targets' is enough)
> >
> >  - Move the flavour into the build command
> >
> > This still avoids the build failures fixed by commit 4ee812f6143d
> > ("crypto: vmx - Avoid weird build failures").
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  drivers/crypto/vmx/Makefile | 17 +++--------------
> >  1 file changed, 3 insertions(+), 14 deletions(-)
>
> Patch applied.  Thanks.


Sorry, I just noticed the 0day bot had reported the error.

I sent v2.    (CONFIG_LITTLE_ENDIAN  --> CONFIG_CPU_LITTLE_ENDIAN)

https://lore.kernel.org/lkml/20220506150820.1310802-1-masahiroy@kernel.org/


Could you replace it, or fix it up, please?





--
Best Regards
Masahiro Yamada
