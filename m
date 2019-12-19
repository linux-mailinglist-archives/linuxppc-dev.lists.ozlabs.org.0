Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F912621C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 13:24:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47drfJ1XZNzDqtS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 23:24:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Q2Nkm6fd"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47drbf6Dw9zDql5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 23:22:06 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id z3so2477006plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 04:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KUZMCzJDajvAWgOwIGaMCQmEpud/sI+HWwVZ5z66PfA=;
 b=Q2Nkm6fdrRQpsyMzF0E8SO5CnpATIDAngezGXzkbVg5FM5gqp/USZdvjuLOyqxGhob
 vUVMUdsruXOTvNCGsO9w+cBW7pumbWreW9u7bHeP80rb+z1Nq3yZJJbt7fsXy8VTPJaX
 fqxmb822HcBIF6ENlq0AC91lSpDppRPi5JuRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=KUZMCzJDajvAWgOwIGaMCQmEpud/sI+HWwVZ5z66PfA=;
 b=EkvsAiwFBe7PtWzfIrwnNGZm7PdQJ0m3aXSnUc3LkeWYTeKsHjbFuRYl8ZSjioHpU6
 SP7oiXFhufoXfw1a46xTDJWjYyP26FixGLnOUCx9perQB0anOtXH47hNOy/dzKvzkfCt
 7QSeWzAvJjaDJgLuhLIbd1+pzflxEAsP5PvbCzdiFTfj+38R6s83KoJkFOSIibIhuKle
 Gd6o0vJ283fXDYhb4Z39j8fnKn06w478GdQ1TP7ztLgJzm9RMRGOii1wGnLDAv37UA5v
 5u2lanHAOE3lfQ4SzCMInGJLUnZpyNJx3jr7XzmxdJvB/EYqfDqFaAZHWEt+49flwM0e
 Hqhg==
X-Gm-Message-State: APjAAAV14Ew4C8pB2g4pkbJNXVEzkJTUrF1LvrqhsQyOefaL8lAT5cgm
 cs0dZwd+jyIYo1SnqGLEiUBO+g==
X-Google-Smtp-Source: APXvYqysLbNRk7kADvF4EGeP94sXjr/+8KOzk3Rc0H00Sz8ZwQESSep5znZgXFDiN+AamxRSsQtyGg==
X-Received: by 2002:a17:90a:1992:: with SMTP id
 18mr9506461pji.46.1576758122786; 
 Thu, 19 Dec 2019 04:22:02 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-b05d-cbfe-b2ee-de17.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b05d:cbfe:b2ee:de17])
 by smtp.gmail.com with ESMTPSA id x4sm8347303pfx.68.2019.12.19.04.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 04:22:01 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v4 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <4f2fffb3-5fb6-b5ea-a951-a7910f2439b8@c-s.fr>
References: <20191219003630.31288-1-dja@axtens.net>
 <20191219003630.31288-5-dja@axtens.net>
 <c4d37067-829f-cd7d-7e94-0ec2223cce71@c-s.fr>
 <87bls4tzjn.fsf@dja-thinkpad.axtens.net>
 <4f2fffb3-5fb6-b5ea-a951-a7910f2439b8@c-s.fr>
Date: Thu, 19 Dec 2019 23:21:59 +1100
Message-ID: <877e2stsig.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 19/12/2019 =C3=A0 10:50, Daniel Axtens a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>=20
>>> On 12/19/2019 12:36 AM, Daniel Axtens wrote:
>>>> KASAN support on Book3S is a bit tricky to get right:
>>>>
>>>>    - It would be good to support inline instrumentation so as to be ab=
le to
>>>>      catch stack issues that cannot be caught with outline mode.
>>>>
>>>>    - Inline instrumentation requires a fixed offset.
>>>>
>>>>    - Book3S runs code in real mode after booting. Most notably a lot o=
f KVM
>>>>      runs in real mode, and it would be good to be able to instrument =
it.
>>>>
>>>>    - Because code runs in real mode after boot, the offset has to poin=
t to
>>>>      valid memory both in and out of real mode.
>>>>
>>>>       [ppc64 mm note: The kernel installs a linear mapping at effective
>>>>       address c000... onward. This is a one-to-one mapping with physic=
al
>>>>       memory from 0000... onward. Because of how memory accesses work =
on
>>>>       powerpc 64-bit Book3S, a kernel pointer in the linear map access=
es the
>>>>       same memory both with translations on (accessing as an 'effective
>>>>       address'), and with translations off (accessing as a 'real
>>>>       address'). This works in both guests and the hypervisor. For more
>>>>       details, see s5.7 of Book III of version 3 of the ISA, in partic=
ular
>>>>       the Storage Control Overview, s5.7.3, and s5.7.5 - noting that t=
his
>>>>       KASAN implementation currently only supports Radix.]
>>>>
>>>> One approach is just to give up on inline instrumentation. This way all
>>>> checks can be delayed until after everything set is up correctly, and =
the
>>>> address-to-shadow calculations can be overridden. However, the feature=
s and
>>>> speed boost provided by inline instrumentation are worth trying to do
>>>> better.
>>>>
>>>> If _at compile time_ it is known how much contiguous physical memory a
>>>> system has, the top 1/8th of the first block of physical memory can be=
 set
>>>> aside for the shadow. This is a big hammer and comes with 3 big
>>>> consequences:
>>>>
>>>>    - there's no nice way to handle physically discontiguous memory, so=
 only
>>>>      the first physical memory block can be used.
>>>>
>>>>    - kernels will simply fail to boot on machines with less memory than
>>>>      specified when compiling.
>>>>
>>>>    - kernels running on machines with more memory than specified when
>>>>      compiling will simply ignore the extra memory.
>>>>
>>>> Implement and document KASAN this way. The current implementation is R=
adix
>>>> only.
>>>>
>>>> Despite the limitations, it can still find bugs,
>>>> e.g. http://patchwork.ozlabs.org/patch/1103775/
>>>>
>>>> At the moment, this physical memory limit must be set _even for outline
>>>> mode_. This may be changed in a later series - a different implementat=
ion
>>>> could be added for outline mode that dynamically allocates shadow at a
>>>> fixed offset. For example, see https://patchwork.ozlabs.org/patch/7952=
11/
>>>>
>>>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix ver=
sion
>>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr> # ppc32 version
>>>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>>>
>>>> ---
>>>> Changes since v3:
>>>>    - Address further feedback from Christophe.
>>>>    - Drop changes to stack walking, it looks like the issue I observed=
 is
>>>>      related to that particular stack, not stack-walking generally.
>>>>
>>>> Changes since v2:
>>>>
>>>>    - Address feedback from Christophe around cleanups and docs.
>>>>    - Address feedback from Balbir: at this point I don't have a good s=
olution
>>>>      for the issues you identify around the limitations of the inline =
implementation
>>>>      but I think that it's worth trying to get the stack instrumentati=
on support.
>>>>      I'm happy to have an alternative and more flexible outline mode -=
 I had
>>>>      envisoned this would be called 'lightweight' mode as it imposes f=
ewer restrictions.
>>>>      I've linked to your implementation. I think it's best to add it i=
n a follow-up series.
>>>>    - Made the default PHYS_MEM_SIZE_FOR_KASAN value 1024MB. I think mo=
st people have
>>>>      guests with at least that much memory in the Radix 64s case so it=
's a much
>>>>      saner default - it means that if you just turn on KASAN without r=
eading the
>>>>      docs you're much more likely to have a bootable kernel, which you=
 will never
>>>>      have if the value is set to zero! I'm happy to bikeshed the value=
 if we want.
>>>>
>>>> Changes since v1:
>>>>    - Landed kasan vmalloc support upstream
>>>>    - Lots of feedback from Christophe.
>>>>
>>>> Changes since the rfc:
>>>>
>>>>    - Boots real and virtual hardware, kvm works.
>>>>
>>>>    - disabled reporting when we're checking the stack for exception
>>>>      frames. The behaviour isn't wrong, just incompatible with KASAN.
>>>>
>>>>    - Documentation!
>>>>
>>>>    - Dropped old module stuff in favour of KASAN_VMALLOC.
>>>>
>>>> The bugs with ftrace and kuap were due to kernel bloat pushing
>>>> prom_init calls to be done via the plt. Because we did not have
>>>> a relocatable kernel, and they are done very early, this caused
>>>> everything to explode. Compile with CONFIG_RELOCATABLE!
>>>> ---
>>>>    Documentation/dev-tools/kasan.rst            |   8 +-
>>>>    Documentation/powerpc/kasan.txt              | 112 ++++++++++++++++=
++-
>>>>    arch/powerpc/Kconfig                         |   2 +
>>>>    arch/powerpc/Kconfig.debug                   |  21 ++++
>>>>    arch/powerpc/Makefile                        |  11 ++
>>>>    arch/powerpc/include/asm/book3s/64/hash.h    |   4 +
>>>>    arch/powerpc/include/asm/book3s/64/pgtable.h |   7 ++
>>>>    arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
>>>>    arch/powerpc/include/asm/kasan.h             |  21 +++-
>>>>    arch/powerpc/kernel/prom.c                   |  61 +++++++++-
>>>>    arch/powerpc/mm/kasan/Makefile               |   1 +
>>>>    arch/powerpc/mm/kasan/init_book3s_64.c       |  70 ++++++++++++
>>>>    arch/powerpc/platforms/Kconfig.cputype       |   1 +
>>>>    13 files changed, 316 insertions(+), 8 deletions(-)
>>>>    create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c
>>>>
>>>> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/a=
sm/kasan.h
>>>> index 296e51c2f066..f18268cbdc33 100644
>>>> --- a/arch/powerpc/include/asm/kasan.h
>>>> +++ b/arch/powerpc/include/asm/kasan.h
>>>> @@ -2,6 +2,9 @@
>>>>    #ifndef __ASM_KASAN_H
>>>>    #define __ASM_KASAN_H
>>>>=20=20=20=20
>>>> +#include <asm/page.h>
>>>> +#include <asm/pgtable.h>
>>>
>>> What do you need asm/pgtable.h for ?
>>>
>>> Build failure due to circular inclusion of asm/pgtable.h:
>>=20
>> I see there's a lot of ppc32 stuff, I clearly need to bite the bullet
>> and get a ppc32 toolchain so I can squash these without chewing up any
>> more of your time. I'll sort that out and send a new spin.
>>=20
>
> I'm using a powerpc64 toolchain to build both ppc32 and ppc64 kernels=20
> (from https://mirrors.edge.kernel.org/pub/tools/crosstool/ )

I am now using the distro toolchain that Ubuntu provides, and I've
reproduced and fixed the 32bit issues you identifed.

> Another thing, did you test PTDUMP stuff with KASAN ? It looks like=20
> KASAN address markers don't depend on PPC32, but are only initialised by=
=20
> populate_markers() for PPC32.

Hmm, OK. This is my last workday for the year, so I will look at this
and the simplifications to kasan.h early next year.

Thanks,
Daniel

>
> Regarding kasan.h, I think we should be able to end up with something=20
> where the definition of KASAN_SHADOW_OFFSET should only depend on the=20
> existence of CONFIG_KASAN_SHADOW_OFFSET, and where only=20
> KASAN_SHADOW_SIZE should depend on the target (ie PPC32 or BOOK3S64)
> Everything else should be common. KASAN_END should be START+SIZE.
>
> It looks like what you have called KASAN_SHADOW_SIZE is not similar to=20
> what is called KASAN_SHADOW_SIZE for PPC32, as yours only covers the=20
> SHADOW_SIZE for linear mem while PPC32 one covers the full space.
>
> Christophe
