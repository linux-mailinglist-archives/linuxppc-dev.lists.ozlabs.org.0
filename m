Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30819A384
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 04:22:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sVMb45hszDqwf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 13:22:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sVK91lcJzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 13:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=G1Du3hPY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48sVK83tHTz9sSM;
 Wed,  1 Apr 2020 13:20:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585707612;
 bh=y0rpyD+vl0A1FZm6B9bu45b8gnXWbKNKemU2KXkXOJ8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=G1Du3hPY+uld4csqLImov9IQqnryA2879Lxj1S2yA3GeQ2A1NkFhQqiVR2h7/BUrw
 vVpaO7OxxhpBpAJOhCf2qXvMi4d8AsCV61YYdxkv7HJxXLkQtm+28kRHZtoVt5mKdl
 q477yyutAM7y4X2/W7MTPLpHSXtL1/jjSEZHbjE499q4Zi7TSH3D+7pWiW94ggmA3X
 3Wai4IoAgJPXrSGT/PaENnXhl3N3IB5oaoOCHED0hXWtsEVoXJnP3ePca3TDmArJ3Q
 fxc8i/BwAMlh3CUVq35iSmPfG861iy4hZ7n6cDZ7OtZ9UXbEyHuj8hRQWjcNuNPjmf
 3/3Rgk4/ZyRwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 09/11] powerpc/platforms: Move files from 4xx to 44x
In-Reply-To: <74e76b4e-5e4f-f3de-96a8-f6a451b3243a@c-s.fr>
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
 <CAK8P3a3u4y7Zm8w43QScqUk6macBL1wO3S0qPisf9+d9FqSHfw@mail.gmail.com>
 <833d63fe-3b94-a3be-1abb-a629386aa0dd@c-s.fr>
 <CAK8P3a244P38c+JCRnf1EscQOSzaQQNZc6b5F=LFE2a_im8AqQ@mail.gmail.com>
 <74e76b4e-5e4f-f3de-96a8-f6a451b3243a@c-s.fr>
Date: Wed, 01 Apr 2020 13:20:21 +1100
Message-ID: <87d08sueu2.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Michal Simek <michal.simek@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 31/03/2020 =C3=A0 18:04, Arnd Bergmann a =C3=A9crit=C2=A0:
>> On Tue, Mar 31, 2020 at 5:26 PM Christophe Leroy
>> <christophe.leroy@c-s.fr> wrote:
>>> Le 31/03/2020 =C3=A0 17:14, Arnd Bergmann a =C3=A9crit :
>>>> On Tue, Mar 31, 2020 at 9:49 AM Christophe Leroy
>>>> <christophe.leroy@c-s.fr> wrote:
>>>>>
>>>>> Only 44x uses 4xx now, so only keep one directory.
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>>> ---
>>>>>    arch/powerpc/platforms/44x/Makefile           |  9 +++++++-
>>>>>    arch/powerpc/platforms/{4xx =3D> 44x}/cpm.c     |  0
>>>>
>>>> No objections to moving everything into one place, but I wonder if the
>>>> combined name should be 4xx instead of 44x, given that 44x currently
>>>> include 46x and 47x. OTOH your approach has the advantage of
>>>> moving fewer files.
>>>>
>>>
>>> In that case, should we also rename CONFIG_44x to CONFIG_4xx ?
>>=20
>> That has the risk of breaking user's defconfig files, but given the
>> small number of users, it may be nicer for consistency. In either
>> case, the two symbols should probably hang around as synonyms,
>> the question is just which one is user visible.
>>=20
>
> Not sure it is a good idea to keep two synonyms. In the past we made our=
=20
> best to remove synonyms (We had CONFIG_8xx and CONFIG_PPC_8xx being=20
> synonyms, we had CONFIG_6xx and CONFIG_BOOK3S_32 and=20
> CONFIG_PPC_STD_MMU_32 being synonyms).
> I think it is a lot cleaner when we can avoid synonyms.
>
> By the way I already dropped CONFIG_4xx in previous patch (8/11). It was=
=20
> not many 4xx changed to 44x. It would be a lot more in the other way=20
> round I'm afraid.
>
> But I agree with you it might be more natural to change to 4xx.
>
> Michael, any preference ?

I'd say just use 44x, we've had the inconsistency of 476 living in
platforms/44x, and it hasn't really led to much confusion.

I think for most folks they see 4xx/44x and just think "some 32-bit
embedded thing", so the precise distinction between 4xx, 44x, 476 etc.
is not that important to justify renaming the symbol everywhere I think.

cheers
