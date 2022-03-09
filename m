Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC914D3D79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 00:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDSkw2npTz3bd6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 10:16:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tox6HNem;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDSkJ12n4z2xs7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 10:16:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Tox6HNem; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KDSkH09Tlz4xx3;
 Thu, 10 Mar 2022 10:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646867783;
 bh=Qx5nL3KtcBwJsIZmEK2vtpUJ0CdyKjqtHR6qU3wIfts=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Tox6HNemqhfK1PRiuzY5swKoSEfuyeg3lD0H0npSnDjboSQ4zUHfGrIY0b6ZqA6wq
 tjYzzRu1qagBZ5WTrJofOmoDOqto0bshj+N2QgGXPBauXAyoscjIE2aI3MM42r3pLV
 LKmhrJsI1de0MUC6YrFTclQsxDaRBSg9MFSL1gg1gNaNkvvJ8b/vIpR+CEyBh22exb
 yMdnAkzpVvKAAH12QEKeD4lEE6/hhVLwhlAIrNlGR4B0322nUUtNcS8sQZC6zOqjfG
 0XQIisOKo/uo88B2PZYNql4hzWDskVOn0zxQPBnw4y6TK1TIL2LfUPGlUQRG0tzLvG
 0QKyBBQ/cR7eA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Hangyu Hua
 <hbh25y@gmail.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>, "peng.hao2@zte.com.cn"
 <peng.hao2@zte.com.cn>, "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
In-Reply-To: <867e5b54-5990-578e-bfae-b638efce2a8a@csgroup.eu>
References: <20220223070223.26845-1-hbh25y@gmail.com>
 <87o82fn6yw.fsf@mpe.ellerman.id.au>
 <87b40493-7630-f714-27f4-90ad2a5a7c12@csgroup.eu>
 <87ilsnmmi4.fsf@mpe.ellerman.id.au>
 <867e5b54-5990-578e-bfae-b638efce2a8a@csgroup.eu>
Date: Thu, 10 Mar 2022 10:16:18 +1100
Message-ID: <87fsnqn2d9.fsf@mpe.ellerman.id.au>
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
> Le 09/03/2022 =C3=A0 11:46, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 09/03/2022 =C3=A0 04:24, Michael Ellerman a =C3=A9crit=C2=A0:
>>>> Hangyu Hua <hbh25y@gmail.com> writes:
>>>>> mpc8xx_pic_init() should return -ENOMEM instead of 0 when
>>>>> irq_domain_add_linear() return NULL. This cause mpc8xx_pics_init to c=
ontinue
>>>>> executing even if mpc8xx_pic_host is NULL.
>>>>>
>>>>> Fixes: cc76404feaed ("powerpc/8xx: Fix possible device node reference=
 leak")
>>>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>>>> ---
>>>>>    arch/powerpc/platforms/8xx/pic.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platform=
s/8xx/pic.c
>>>>> index f2ba837249d6..04a6abf14c29 100644
>>>>> --- a/arch/powerpc/platforms/8xx/pic.c
>>>>> +++ b/arch/powerpc/platforms/8xx/pic.c
>>>>> @@ -153,6 +153,7 @@ int __init mpc8xx_pic_init(void)
>>>>
>>>> Expanding the context:
>>>>
>>>> 	siu_reg =3D ioremap(res.start, resource_size(&res));
>>>> 	if (siu_reg =3D=3D NULL) {
>>>> 		ret =3D -EINVAL;
>>>> 		goto out;
>>>> 	}
>>>>
>>>> 	mpc8xx_pic_host =3D irq_domain_add_linear(np, 64, &mpc8xx_pic_host_op=
s, NULL);
>>>>>    	if (mpc8xx_pic_host =3D=3D NULL) {
>>>>>    		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
>>>>>    		ret =3D -ENOMEM;
>>>>> +		goto out;
>>>>>    	}
>>>>>=20=20=20=20
>>>>>    	ret =3D 0;
>>>>>=20=20=20=20=09
>>>> out:
>>>> 	of_node_put(np);
>>>> 	return ret;
>>>> }
>>>>
>>>> Proper error cleanup should also undo the ioremap() if
>>>> irq_domain_add_linear() fails.
>>>
>>> Uh ...
>>>
>>> If siu_reg is NULL, you get a serious problem when __do_irq() calls
>>> mpc8xx_get_irq()
>>=20
>> Arguably it shouldn't be assigned to ppc_md.get_irq unless
>> mpc8xx_pic_init() succeeds. See eg. xics_init().
>
> I agree with that, but it's a huge work I guess. Most platforms set=20
> .get_irq in ppc_md() at buildtime. See the generic mpic_get_irq() which=20
> has a BUG_ON() in call mpic_primary is NULL. There are 50 platforms with=
=20
> buildtime assignment.
=20
Yes I agree. And __do_irq() will just oops if ppc_md.get_irq() is NULL,
so it's a bit of a mess.

> That would however be a good opportunity to switch get_irq() to a static=
=20
> call. I'll open a github issue to follow it.

Thanks.

cheers
