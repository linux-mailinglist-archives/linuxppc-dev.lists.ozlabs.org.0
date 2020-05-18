Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 625631D776E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:38:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QcV64hcszDqRN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QcSD53BGzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:37:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=c2mKFEGd; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QcS93j2Jz9sTC;
 Mon, 18 May 2020 21:37:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589801835;
 bh=sVwnIBZtE1XIU+cSVfb2AfLRaR5qbpYzuQwbYj/q+m0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=c2mKFEGd8gslESqqwyOhLqXMUh1eHhIqYtyIVao0KterI88UjafJ4vhk7YLcftmkE
 l/ebSBzr+IGn3Gg2bWU/4jX8nwYGdbRLjLZe0AyMQGT83o0J5GVTbHTSiN6ORWijcV
 iRJj78qVj1nnHPNiqYkHqniyOg5cqG1aIrrwLXJJycCaF3AFQCd/ypHTYp8vXSh+7l
 YdqArB4aSFZVZPLbUaHV+7iP/Td0Z5wJQxukfEwezPiUh5OIIUfdPfmKslafDJW7bR
 AzLYDJFulCwRUubVjFb4mmd4V6D6gse8kgdnv3eL8yFJNzQ4Z4haIHeo6S85v7OnGr
 UMA3Br6o/ybWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jiri Kosina <jikos@kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/sysdev: fix compile errors
In-Reply-To: <nycvar.YFH.7.76.2005181232140.25812@cbobk.fhfr.pm>
References: <20200302053801.26027-1-wenhu.wang@vivo.com>
 <62251ec1-dd42-6522-dcb2-613838cd5504@c-s.fr>
 <nycvar.YFH.7.76.2005181228480.25812@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2005181232140.25812@cbobk.fhfr.pm>
Date: Mon, 18 May 2020 21:37:33 +1000
Message-ID: <878shpa2yq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 wenhu.pku@gmail.com, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 WANG Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jiri Kosina <jikos@kernel.org> writes:
> On Mon, 18 May 2020, Jiri Kosina wrote:
>> > > Include linux/io.h into fsl_85xx_cache_sram.c to fix the
>> > > implicit-declaration compile errors when building Cache-Sram.
>> > >=20
>> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c: In function
>> > > =E2=80=98instantiate_cache_sram=E2=80=99:
>> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:26: error: implicit dec=
laration
>> > > of function =E2=80=98ioremap_coherent=E2=80=99; did you mean =E2=80=
=98bitmap_complement=E2=80=99?
>> > > [-Werror=3Dimplicit-function-declaration]
>> > >    cache_sram->base_virt =3D ioremap_coherent(cache_sram->base_phys,
>> > >                            ^~~~~~~~~~~~~~~~
>> > >                            bitmap_complement
>> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:24: error: assignment m=
akes
>> > > pointer from integer without a cast [-Werror=3Dint-conversion]
>> > >    cache_sram->base_virt =3D ioremap_coherent(cache_sram->base_phys,
>> > >                          ^
>> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c:123:2: error: implicit dec=
laration
>> > > of function =E2=80=98iounmap=E2=80=99; did you mean =E2=80=98roundup=
=E2=80=99?
>> > > [-Werror=3Dimplicit-function-declaration]
>> > >    iounmap(cache_sram->base_virt);
>> > >    ^~~~~~~
>> > >    roundup
>> > > cc1: all warnings being treated as errors
>> > >=20
>> > > Fixed: commit 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
>> > > Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
>> >=20
>> > Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>=20
>> As this doesn't seem to have been picked up for linux-next yet, I am=20
>> picking it up now.
>
> Only now I've noticed that this is actually a dead code o_O as this file=
=20
> can't be built by any combination of config options. So I am dropping the=
=20
> patch again, but why do we keep it in the tree in the first place?

Yeah, sigh.

As Christophe pointed out, it has been dead code for a long time but
there is a series in flight that's trying to make it usable.

cheers
