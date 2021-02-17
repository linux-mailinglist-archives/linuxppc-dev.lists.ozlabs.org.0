Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F731D3DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 02:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgLcd3Gmsz3cMT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 12:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nmNC2lji;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nmNC2lji; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgLcF2p7Wz3cJl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 12:59:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DgLc44NGqz9sBy;
 Wed, 17 Feb 2021 12:58:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613527143;
 bh=Zbim9azTDIK4pNSgxrb2aQNpqwOHWiQRq04kQXMlToA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nmNC2lji1Yc/3bXweVE4HitWJ5d7QTRGZLeLE5lcfvtV8I+75sD6xYdw0NaF32X/w
 GTdmY8WBV3uPAOzF2drGjgbQjtA9M4oukNKmTwKb/8X3vf+0HIhYKChpqp9Xqmc9Ok
 Q3wzxXOkiId/LZhySF/Q++mWTJBc2xebedAymHRdW5FmdP69QIav6fEySj4+tC/S3R
 fXXJGuNz8zDJAFNOpqklh/5mFZ1pzNThWhqVhtlOJE2LcfBAXIVa4TSW1ucQHj6U2F
 H1YjNa2ZawpSMo4daRkbhBx0IimWEUyh+r+odfqx6JaFXSCHIqEQNNL88/JhxcQQgB
 NXdDjMY2efulQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/uaccess: Move might_fault() into
 user_access_begin()
In-Reply-To: <b1d3af99-2d38-0794-0694-95a735fccbe3@csgroup.eu>
References: <20210208135717.2618798-1-mpe@ellerman.id.au>
 <20210208135717.2618798-2-mpe@ellerman.id.au>
 <b1d3af99-2d38-0794-0694-95a735fccbe3@csgroup.eu>
Date: Wed, 17 Feb 2021 12:58:55 +1100
Message-ID: <87czwzv4io.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 08/02/2021 =C3=A0 14:57, Michael Ellerman a =C3=A9crit=C2=A0:
>> We have a might_fault() check in __unsafe_put_user_goto(), but that is
>> dangerous as it potentially calls lots of code while user access is
>> enabled.
>>=20
>> It also triggers the check Alexey added to the irq restore path to
>> catch cases like that:
>>=20
>>    WARNING: CPU: 30 PID: 1 at arch/powerpc/include/asm/book3s/64/kup.h:3=
24 arch_local_irq_restore+0x160/0x190
>>    NIP arch_local_irq_restore+0x160/0x190
>>    LR  lock_is_held_type+0x140/0x200
>>    Call Trace:
>>      0xc00000007f392ff8 (unreliable)
>>      ___might_sleep+0x180/0x320
>>      __might_fault+0x50/0xe0
>>      filldir64+0x2d0/0x5d0
>>      call_filldir+0xc8/0x180
>>      ext4_readdir+0x948/0xb40
>>      iterate_dir+0x1ec/0x240
>>      sys_getdents64+0x80/0x290
>>      system_call_exception+0x160/0x280
>>      system_call_common+0xf0/0x27c
>>=20
>> So remove the might fault check from unsafe_put_user().
>>=20
>> Any call to unsafe_put_user() must be inside a region that's had user
>> access enabled with user_access_begin(), so move the might_fault() in
>> there. That also allows us to drop the is_kernel_addr() test, because
>> there should be no code using user_access_begin() in order to access a
>> kernel address.
>
> x86 and mips only have might_fault() on get_user() and put_user(),
> neither on __get_user() nor on __put_user() nor on the unsafe
> alternative.

Yeah, that's their choice, or perhaps it's by accident.

arm64 on the other hand has might_fault() in all variants.

A __get_user() can fault just as much as a get_user(), so there's no
reason the check should be omitted from __get_user(), other than perhaps
some historical argument about __get_user() being the "fast" case.

> When have might_fault() in __get_user_nocheck() that is used by
> __get_user() and __get_user_allowed() ie by unsafe_get_user().
>
> Shoudln't those be dropped as well ?

That was handled by Alexey's patch, which I ended up merging with this
one:

  https://git.kernel.org/torvalds/c/7d506ca97b665b95e698a53697dad99fae813c1a


ie. we still have might_fault() in __get_user_nocheck(), but it's
guarded by a check of do_allow, so we won't call it for
__get_user_allowed().

So I think the code (in my next branch) is correct, we don't have any
might_fault() calls in unsafe regions.

But I'd still be happier if we could simplify our uaccess.h more, it's a
bit of a rats nest. We could start by making __get/put_user() =3D=3D
get/put_user() the same way arm64 did.

cheers
