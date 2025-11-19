Return-Path: <linuxppc-dev+bounces-14338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2437DC6D990
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 10:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBFzp18Zmz3bnD;
	Wed, 19 Nov 2025 20:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763543382;
	cv=none; b=O3xyVWTMLb3A+Veaa1NDCKIznRkQnUCjjkcIi4VJ61Oc9pbGsebChHG4OP1ZsG8lR3eRhdxZfn6jGqQ2sGXVCRi4amEqIcpxI4IoXJ0Q+ZYt4ysQ+tM4AaDtDjxVjo314O8xnWlvc5KY6rl+W3D6MFikClZE1OlaCfOKuLlTHm3aRe1EjDNSZhY/8sLgmTDQcXn+J5SifCGrOnfft1NYLfPHk2OH0H1Ep0ocStwXG9JN6/O0CIQ9u7zJdXzuOHi8SzHgPDoQwqE6LtsK4PCopaKH18V068G4/71z/bwhe7dfkFJr/3Vm9+v828yWKPNa1qgkSuoUIm/NAwv0g4ypyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763543382; c=relaxed/relaxed;
	bh=6F8h0badWHqaEHBYoYsgrczI/5Y8Q0+3xAwVAVpeL70=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oQm8KOw7l5VdBocXFGOLGHv/FkJBP7uCSt9mHaCaE/zO4jb9xa2pqpFdNvpVxief3+c38Kn1gsV5Rdg9mjSG+5jPjvjBKnz0+r8R6V8YRAhKuDvUwY1juBdDPfpZBQwVomFNh7zq8GLiIJDm9JvkgVMTDouPb5ghka7yt0a7G4/riu09RwtoH94A8HByzHX3jFzHRhwkjDNJTV8uMdC0yclTuVTQNqKgV9oicYMXZd6L39jPICOI6mlaXm9wL9qkHvSHzzQbTdhpncSPK/IxZsPpdP+42ehaegQrvwXEqJMeML9LTI47vqNgSHwzqmQ2HURx/pqzR3iHvBwlM3tlfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=p9eXW8pV; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=p9eXW8pV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBFzl54Llz3bkd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 20:09:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6F8h0badWHqaEHBYoYsgrczI/5Y8Q0+3xAwVAVpeL70=; b=p9eXW8pV5xert0HQ8/YFer4SeZ
	cWzUOfwQjWu98bOemrOTzxm55iXPFQ6S5eGnwwpFS7OfU23vnI2vO0AurIzf6loo8H6lSvdosqBhE
	c6I71k3NZzRq9qfm6HdGoiL2Wmr8yq9XhBw4v8+8ol+yoPiHbF1gH9G8cz/7k3p4IrcdixNBb+dGE
	bTuRK7hjNzELMMiDUqEQ2UKcn/J0BywuxiyQJBQV4Qe3OrHC97Y/H4Lm0/TurED8LjNyIwUHkAPbj
	Lc5jpsrlomG1mIT8At1wRiYU4y6yDTJnLRiGlMWjI0MZkdmm121PV3Sc2L39Z8+zxyP55Rd0jKqSh
	nmk6Wptw==;
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH V2] ppc64/lv1call: Fix PS3 LV1 clobbering SRR
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <d6a8c0bc-c9d6-40e8-b2e0-559c7bae3b00@csgroup.eu>
Date: Wed, 19 Nov 2025 10:09:31 +0100
Cc: linuxppc-dev@lists.ozlabs.org,
 Geoff Levand <geoff@infradead.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB15828B-5394-40DD-ADF9-51D162FA82DE@exactco.de>
References: <20251118.184901.486820791149579338.rene@exactco.de>
 <d6a8c0bc-c9d6-40e8-b2e0-559c7bae3b00@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

> On 19. Nov 2025, at 09:08, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
> Le 18/11/2025 =C3=A0 18:49, Ren=C3=A9 Rebe a =C3=A9crit :
>> For a while, likely since 6eaaf9de3599 ("powerpc/64s/interrupt: Check
>> and fix srr_valid without crashing") booting a PS3 instantly yields:
>=20
> Can you confirm the 'likely' ?

I could, it =E2=80=9Conly=E2=80=9D takes some hours ;-)

> checkout 6eaaf9de3599 and confirm the bug is there.
> checkout 6eaaf9de3599~ and confirm the bug is not there.

Given 6eaaf9de3599 introduced the check without debug, this
will =E2=80=9Clikely=E2=80=9D confirm it. However, I would find it more =
interesting
to test if enabling the previous DEBUG option for that already
uncovered this, or if applying this check to such a slightly or
much older kernel would already have notified about this long
before.

Actually looking more into git log of powerpc, the original sin
appears to be likely 59dc5bfca0cb ("powerpc/64s: avoid reloading
(H)SRR registers if they are still valid=E2=80=9D)

Either way testing this 100% will be a bit of work. Do we think this
is really necessary for (PS3) or just stick a Fixes: label onto it?

Thanks,
	Ren=C3=A9

>> <4>SRR0 was: c0000000000971b4 should be: c0000000002d55c4
>> <4>SRR1 was: 8000000000008032 should be: 8000000000008032
>> Fix LV1 HV clobbering SRR by srr_regs_clobbered() each lv1 call.
>> Attribute srr_regs_clobbered __always_inline as used by modules.
>> Fixes: 6eaaf9de3599 ("powerpc/64s/interrupt: Check and fix srr_valid =
without crashing")
>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>=20
>> ---
>> v2: use __always_inline, ppc64, Fixes:
>> ---
>>  arch/powerpc/include/asm/interrupt.h | 1 +
>>  arch/powerpc/include/asm/lv1call.h   | 3 ++-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>> diff --git a/arch/powerpc/include/asm/interrupt.h =
b/arch/powerpc/include/asm/interrupt.h
>> index eb0e4a20b818..783c6f32a395 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -106,6 +106,6 @@ static inline bool is_implicit_soft_masked(struct =
pt_regs *regs)
>>   return search_kernel_soft_mask_table(regs->nip);
>>  }
>>  -static inline void srr_regs_clobbered(void)
>> +static __always_inline void srr_regs_clobbered(void)
>>  {
>>   local_paca->srr_valid =3D 0;
>>   local_paca->hsrr_valid =3D 0;
>> diff --git a/arch/powerpc/include/asm/lv1call.h =
b/arch/powerpc/include/asm/lv1call.h
>> index ae70120953a8..48dd55a2b72e 100644
>> --- a/arch/powerpc/include/asm/lv1call.h
>> +++ b/arch/powerpc/include/asm/lv1call.h
>> @@ -14,6 +14,7 @@
>>    #include <linux/types.h>
>>  #include <linux/export.h>
>> +#include <asm/interrupt.h>
>>    /* lv1 call declaration macros */
>>  @@ -208,7 +209,7 @@
>>  #define LV1_CALL(name, in, out, num)                               \
>>    extern s64 _lv1_##name(LV1_##in##_IN_##out##_OUT_ARG_DECL);      \
>>    static inline int lv1_##name(LV1_##in##_IN_##out##_OUT_ARG_DECL) \
>> -    {return _lv1_##name(LV1_##in##_IN_##out##_OUT_ARGS);}
>> +    {srr_regs_clobbered(); return =
_lv1_##name(LV1_##in##_IN_##out##_OUT_ARGS);}
>>  #endif
>>    #endif /* !defined(__ASSEMBLER__) */
>=20

--=20
https://exactco.de - https://t2linux.com - https://rene.rebe.de


