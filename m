Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA731DF17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 19:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgmWq2fYFz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 05:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgmWV0G3nz3bcw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 05:26:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DgmWG55mjz9txLT;
 Wed, 17 Feb 2021 19:26:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8LdVNlMK3cly; Wed, 17 Feb 2021 19:26:18 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DgmWG4G84z9txLS;
 Wed, 17 Feb 2021 19:26:18 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 7DB2E8A0; Wed, 17 Feb 2021 19:29:20 +0100 (CET)
Received: from 37.166.190.229 ([37.166.190.229]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Wed, 17 Feb 2021 19:29:20 +0100
Date: Wed, 17 Feb 2021 19:29:20 +0100
Message-ID: <20210217192920.Horde.P9DT3EDwJqUmN75mokBDNw1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc/uaccess: Move might_fault() into
 user_access_begin()
References: <20210208135717.2618798-1-mpe@ellerman.id.au>
 <20210208135717.2618798-2-mpe@ellerman.id.au>
 <b1d3af99-2d38-0794-0694-95a735fccbe3@csgroup.eu>
 <87czwzv4io.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czwzv4io.fsf@mpe.ellerman.id.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 08/02/2021 =C3=A0 14:57, Michael Ellerman a =C3=A9crit=C2=A0:
>>> We have a might_fault() check in __unsafe_put_user_goto(), but that is
>>> dangerous as it potentially calls lots of code while user access is
>>> enabled.
>>>
>>> It also triggers the check Alexey added to the irq restore path to
>>> catch cases like that:
>>>
>>>    WARNING: CPU: 30 PID: 1 at=20=20
>>>=20arch/powerpc/include/asm/book3s/64/kup.h:324=20=20
>>>=20arch_local_irq_restore+0x160/0x190
>>>    NIP arch_local_irq_restore+0x160/0x190
>>>    LR  lock_is_held_type+0x140/0x200
>>>    Call Trace:
>>>      0xc00000007f392ff8 (unreliable)
>>>      ___might_sleep+0x180/0x320
>>>      __might_fault+0x50/0xe0
>>>      filldir64+0x2d0/0x5d0
>>>      call_filldir+0xc8/0x180
>>>      ext4_readdir+0x948/0xb40
>>>      iterate_dir+0x1ec/0x240
>>>      sys_getdents64+0x80/0x290
>>>      system_call_exception+0x160/0x280
>>>      system_call_common+0xf0/0x27c
>>>
>>> So remove the might fault check from unsafe_put_user().
>>>
>>> Any call to unsafe_put_user() must be inside a region that's had user
>>> access enabled with user_access_begin(), so move the might_fault() in
>>> there. That also allows us to drop the is_kernel_addr() test, because
>>> there should be no code using user_access_begin() in order to access a
>>> kernel address.
>>
>> x86 and mips only have might_fault() on get_user() and put_user(),
>> neither on __get_user() nor on __put_user() nor on the unsafe
>> alternative.
>
> Yeah, that's their choice, or perhaps it's by accident.
>
> arm64 on the other hand has might_fault() in all variants.
>
> A __get_user() can fault just as much as a get_user(), so there's no
> reason the check should be omitted from __get_user(), other than perhaps
> some historical argument about __get_user() being the "fast" case.
>
>> When have might_fault() in __get_user_nocheck() that is used by
>> __get_user() and __get_user_allowed() ie by unsafe_get_user().
>>
>> Shoudln't those be dropped as well ?
>
> That was handled by Alexey's patch, which I ended up merging with this
> one:
>
>   https://git.kernel.org/torvalds/c/7d506ca97b665b95e698a53697dad99fae813=
c1a
>
>
> ie. we still have might_fault() in __get_user_nocheck(), but it's
> guarded by a check of do_allow, so we won't call it for
> __get_user_allowed().
>
> So I think the code (in my next branch) is correct, we don't have any
> might_fault() calls in unsafe regions.
>
> But I'd still be happier if we could simplify our uaccess.h more, it's a
> bit of a rats nest. We could start by making __get/put_user() =3D=3D
> get/put_user() the same way arm64 did.

I agree there are several easy simplifications to do there. I'll look=20=20
at=20that in the coming weeks.

I'm not sure it is good to make __get/put_user equal get/put_user as=20=20
it=20would mean calling access_ok() everytime. But we could most likely=20=
=20
make=20something simpler with get_user() calling access_ok() then=20=20
__get_user().

I=20think we should also audit our use of the _inatomic variants.=20=20
might_fault()=20voids when pagefault is disabled so I think the inatomic=20=
=20
variants=20should be needed. As far as I can see, powerpc is the only=20=20
arch=20having that.

Need to also check why we still need that is_kernel_addr() check=20=20
because=20since the removal of set_fs(), __get/put_user() helpers=20=20
shouldn't=20be used anymore for kernel addresses

Christophe



