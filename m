Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230624D2D57
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 11:47:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD85v6hc5z3bcW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 21:47:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ksce+MO2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD85H5lrWz30Dh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 21:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ksce+MO2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KD85J0yKdz4xYy;
 Wed,  9 Mar 2022 21:46:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646822804;
 bh=UNUfMtbu8jQxJ8Ldp1KCgA9gdyw7U6mYfXdtMhAz3JI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ksce+MO22Ocbz72HvCfAJVVGcoiTU526DWQbDfqV/6oa144msQGikKsMAeaAbrg+M
 WIDpNdyWPJVpJU9Vor6F+HsHbxA+GRZXGonPGbI+zNoODL3ZdsTAKZ4iMBKqiCix1L
 /f8tYlw1G/EX94rFMbYwdcdQXsNOiAHbj+2DDnFelgxJ2B7DC0SFB5FeqAKigaB6ap
 LiIHjxR7xKTvJEPzw9Jr8lQ14lLH7g3+UvxGB8f4mJK6ul8+OBMDle5O+LN/UbywQq
 N2PbIj1eWmzBF7C/hasBQKYLcWQnp2otkIuLvzX8EIKYcNVKl5xMvWhpDCZzOdMazg
 d32soOd8EXfeg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Hangyu Hua
 <hbh25y@gmail.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>, "peng.hao2@zte.com.cn"
 <peng.hao2@zte.com.cn>, "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
In-Reply-To: <87b40493-7630-f714-27f4-90ad2a5a7c12@csgroup.eu>
References: <20220223070223.26845-1-hbh25y@gmail.com>
 <87o82fn6yw.fsf@mpe.ellerman.id.au>
 <87b40493-7630-f714-27f4-90ad2a5a7c12@csgroup.eu>
Date: Wed, 09 Mar 2022 21:46:43 +1100
Message-ID: <87ilsnmmi4.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/03/2022 =C3=A0 04:24, Michael Ellerman a =C3=A9crit=C2=A0:
>> Hangyu Hua <hbh25y@gmail.com> writes:
>>> mpc8xx_pic_init() should return -ENOMEM instead of 0 when
>>> irq_domain_add_linear() return NULL. This cause mpc8xx_pics_init to con=
tinue
>>> executing even if mpc8xx_pic_host is NULL.
>>>
>>> Fixes: cc76404feaed ("powerpc/8xx: Fix possible device node reference l=
eak")
>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>> ---
>>>   arch/powerpc/platforms/8xx/pic.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/=
8xx/pic.c
>>> index f2ba837249d6..04a6abf14c29 100644
>>> --- a/arch/powerpc/platforms/8xx/pic.c
>>> +++ b/arch/powerpc/platforms/8xx/pic.c
>>> @@ -153,6 +153,7 @@ int __init mpc8xx_pic_init(void)
>>=20
>> Expanding the context:
>>=20
>> 	siu_reg =3D ioremap(res.start, resource_size(&res));
>> 	if (siu_reg =3D=3D NULL) {
>> 		ret =3D -EINVAL;
>> 		goto out;
>> 	}
>>=20
>> 	mpc8xx_pic_host =3D irq_domain_add_linear(np, 64, &mpc8xx_pic_host_ops,=
 NULL);
>>>   	if (mpc8xx_pic_host =3D=3D NULL) {
>>>   		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
>>>   		ret =3D -ENOMEM;
>>> +		goto out;
>>>   	}
>>>=20=20=20
>>>   	ret =3D 0;
>>>=20=20=20=09
>> out:
>> 	of_node_put(np);
>> 	return ret;
>> }
>>=20
>> Proper error cleanup should also undo the ioremap() if
>> irq_domain_add_linear() fails.
>
> Uh ...
>
> If siu_reg is NULL, you get a serious problem when __do_irq() calls=20
> mpc8xx_get_irq()

Arguably it shouldn't be assigned to ppc_md.get_irq unless
mpc8xx_pic_init() succeeds. See eg. xics_init().

> unsigned int mpc8xx_get_irq(void)
> {
> 	int irq;
>
> 	/* For MPC8xx, read the SIVEC register and shift the bits down
> 	 * to get the irq number.
> 	 */
> 	irq =3D in_be32(&siu_reg->sc_sivec) >> 26;
>
> 	if (irq =3D=3D PIC_VEC_SPURRIOUS)
> 		return 0;
>
>          return irq_linear_revmap(mpc8xx_pic_host, irq);
>
> }
>
>
> So I'll leave siu_reg as is even if irq_domain_add_linear() fails.
>
> Whatever, if we do something about that it should be done in another=20
> patch I think.

Yeah OK, that's becoming a bit of a larger cleanup. I'll take this patch
as-is.

cheers
