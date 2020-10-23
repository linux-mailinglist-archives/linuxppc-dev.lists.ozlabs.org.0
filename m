Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1729706B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 15:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHlS20fLdzDr3R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 00:28:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHlML2vkhzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 00:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HVTRzlOr; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CHlMH5tt5z9sTD; Sat, 24 Oct 2020 00:24:43 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CHlMH2FhJz9sT6;
 Sat, 24 Oct 2020 00:24:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603459483;
 bh=hME9oNTreDr75GOQEDwJMsQ28M/ie7ep2X7ocErDJDw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HVTRzlOrxC8g7aCCw2okynHoFnQlrJfT16spyWxc6LBdKZlnisdebX11xFh2RMPgE
 SXec4hAl0UiMLZtQHhM/TimvGUNuloTxWnk506qmbbYE1a29i3clAcICZsy2AmcRtk
 v/2UKQiObc5vPa6iSSlMVNqFv7ytGqpE7oOisi5KQXDPgzJrgGd9T7FhZRB/B7rFRJ
 n4dS4X0J+P0FEE4qHws7S49QDDQQm6NfCaQ0+mLeWYCOUqfOPie0BKfeaCTC/8i2rQ
 eRxxyFNYMo4NmKAe+QmfQs034ctcFgrU5B8+Z9ZMw3k5nESCIKLzpIk/pCaqqJ4+XF
 VYoPC0zok7a4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: C vdso
In-Reply-To: <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
 <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
Date: Sat, 24 Oct 2020 00:24:39 +1100
Message-ID: <877drhxeg8.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 24/09/2020 =C3=A0 15:17, Christophe Leroy a =C3=A9crit=C2=A0:
>> Le 17/09/2020 =C3=A0 14:33, Michael Ellerman a =C3=A9crit=C2=A0:
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>
>>>> What is the status with the generic C vdso merge ?
>>>> In some mail, you mentionned having difficulties getting it working on
>>>> ppc64, any progress ? What's the problem ? Can I help ?
>>>
>>> Yeah sorry I was hoping to get time to work on it but haven't been able
>>> to.
>>>
>>> It's causing crashes on ppc64 ie. big endian.
...
>>=20
>> Can you tell what defconfig you are using ? I have been able to setup a =
full glibc PPC64 cross=20
>> compilation chain and been able to test it under QEMU with success, usin=
g Nathan's vdsotest tool.
>
> What config are you using ?

ppc64_defconfig + guest.config

Or pseries_defconfig.

I'm using Ubuntu GCC 9.3.0 mostly, but it happens with other toolchains too.

At a minimum we're seeing relocations in the output, which is a problem:

  $ readelf -r build\~/arch/powerpc/kernel/vdso64/vdso64.so
=20=20
  Relocation section '.rela.dyn' at offset 0x12a8 contains 8 entries:
    Offset          Info           Type           Sym. Value    Sym. Name +=
 Addend
  000000001368  000000000016 R_PPC64_RELATIVE                     7c0
  000000001370  000000000016 R_PPC64_RELATIVE                     9300
  000000001380  000000000016 R_PPC64_RELATIVE                     970
  000000001388  000000000016 R_PPC64_RELATIVE                     9300
  000000001398  000000000016 R_PPC64_RELATIVE                     a90
  0000000013a0  000000000016 R_PPC64_RELATIVE                     9300
  0000000013b0  000000000016 R_PPC64_RELATIVE                     b20
  0000000013b8  000000000016 R_PPC64_RELATIVE                     9300



cheers
