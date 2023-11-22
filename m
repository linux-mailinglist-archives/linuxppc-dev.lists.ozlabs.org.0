Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E584B7F3CFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 05:44:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KgVeuHwZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZpZH5nrJz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 15:44:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KgVeuHwZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZpYS0WTjz3cRt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 15:44:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700628250;
	bh=JZ81iXnEsPMLSslmP87FQmq3s2GbIRjMkMphLBxuqOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KgVeuHwZbOrQ/ovgo3Ge006FxWEyRwWOZtDKUJmRZeyvk6xO7n5isRcw+JRnm3E7e
	 DOEo/LgMAnKtZ9XTElqt+ScPDsc7PsVixUqPO3NEEQLKBAtzZcxyKPEpEyiKD2KPHe
	 l8Zq1mIiKO1a0mxjfDs1Mh5IUp/pXAW4OrMJzhMoAQUw9iy+uh35GkiytX/Ec444mQ
	 DwYtprMYgtQ4PhxCHwmy/LUFPULUn0lZdZQqSvs50CX9o/Y3GkojzZNO4SXgUiBz1p
	 bv9agTOs3FjESDV3v2ABnSZYPg1t+gwVV1Wyq4l0hrnpj/FXeZnd1Rvg1Uf/jD+8kc
	 DCafiiRqd3rsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZpYQ4Blkz4xDB;
	Wed, 22 Nov 2023 15:44:10 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
In-Reply-To: <i4zq3tg6gwaptnuoq2ainowffvkols2k5x7rads473zn55r27y@cvdy5yvkmj2p>
References: <20231120235436.1569255-1-mpe@ellerman.id.au>
 <i4zq3tg6gwaptnuoq2ainowffvkols2k5x7rads473zn55r27y@cvdy5yvkmj2p>
Date: Wed, 22 Nov 2023 15:44:07 +1100
Message-ID: <87pm02jt2g.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N Rao <naveen@kernel.org> writes:
> On Tue, Nov 21, 2023 at 10:54:36AM +1100, Michael Ellerman wrote:
>> Building with GCC 13 (which has -array-bounds enabled) there are several
>
> Thanks, gcc13 indeed helps reproduce the warnings.

Actually that part is no longer true since 0da6e5fd6c37 ("gcc: disable
'-Warray-bounds' for gcc-13 too").

>> warnings in sstep.c along the lines of:
>>=20
>>   In function =E2=80=98do_byte_reverse=E2=80=99,
>>       inlined from =E2=80=98do_vec_load=E2=80=99 at arch/powerpc/lib/sst=
ep.c:691:3,
>>       inlined from =E2=80=98emulate_loadstore=E2=80=99 at arch/powerpc/l=
ib/sstep.c:3439:9:
>>   arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside a=
rray bounds of =E2=80=98u8[16]=E2=80=99 {aka =E2=80=98unsigned char[16]=E2=
=80=99} [-Werror=3Darray-bounds=3D]
>>     289 |                 up[2] =3D byterev_8(up[1]);
>>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>>   arch/powerpc/lib/sstep.c: In function =E2=80=98emulate_loadstore=E2=80=
=99:
>>   arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object =E2=80=
=98u=E2=80=99 of size 16
>>     681 |         } u =3D {};
>>         |           ^
>>=20
>> do_byte_reverse() supports a size up to 32 bytes, but in these cases the
>> caller is only passing a 16 byte buffer. In practice there is no bug,
>> do_vec_load() is only called from the LOAD_VMX case in emulate_loadstore=
().
>> That in turn is only reached when analyse_instr() recognises VMX ops,
>> and in all cases the size is no greater than 16:
>>=20
>>   $ git grep -w LOAD_VMX arch/powerpc/lib/sstep.c
>>   arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOA=
D_VMX, 0, 1);
>>   arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOA=
D_VMX, 0, 2);
>>   arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOA=
D_VMX, 0, 4);
>>   arch/powerpc/lib/sstep.c:                        op->type =3D MKOP(LOA=
D_VMX, 0, 16);
>>=20
>> Similarly for do_vec_store().
>>=20
>> Although the warning is incorrect, the code would be safer if it clamped
>> the size from the caller to the known size of the buffer. Do that using
>> min_t().
>
> But, do_vec_load() and do_vec_store() assume that the maximum size is 16=
=20
> (the address_ok() check as an example). So, should we be considering a=20
> bigger hammer to help detect future incorrect use?

Yeah true.

To be honest I don't know how paranoid we want to get, we could end up
putting WARN's all over the kernel :)

In this case I guess if the size is too large we overflow the buffer on
the kernel stack, so we should at least check the size.

But does it need a WARN? I'm not sure. If we had a case that was passing
a out-of-bound size hopefully we would notice in testing? :)

cheers

> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index a4ab8625061a..ac22136032b8 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -680,6 +680,9 @@ static nokprobe_inline int do_vec_load(int rn, unsign=
ed long ea,
>                 u8 b[sizeof(__vector128)];
>         } u =3D {};
>=20=20
> +       if (WARN_ON_ONCE(size > sizeof(u)))
> +               return -EINVAL;
> +
>         if (!address_ok(regs, ea & ~0xfUL, 16))
>                 return -EFAULT;
>         /* align to multiple of size */
> @@ -707,6 +710,9 @@ static nokprobe_inline int do_vec_store(int rn, unsig=
ned long ea,
>                 u8 b[sizeof(__vector128)];
>         } u;
>=20=20
> +       if (WARN_ON_ONCE(size > sizeof(u)))
> +               return -EINVAL;
> +
>         if (!address_ok(regs, ea & ~0xfUL, 16))
>                 return -EFAULT;
>         /* align to multiple of size */
>
>
> - Naveen
