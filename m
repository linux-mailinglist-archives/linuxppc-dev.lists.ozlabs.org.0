Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F512C513F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 10:30:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChXYR3hMszDrBH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 20:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChXWx5dWMzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 20:29:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=paB0u4QE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChXWx3KGmz9s0b;
 Thu, 26 Nov 2020 20:29:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606382957;
 bh=wz9IJD3wVTiQJ1uDGDdFQ4Un8AMsji96OHrKZwic9wc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=paB0u4QEQVSfkjI0/Qkm3Bez5gplzTkMz+yMuBNgKYxLilowb5NfYZminHppW6jbL
 cSU9UqmG9s40J728b/ZGd2GK1s6IUIuSf1+m+6GGtbdOyFpY8dg0WVxWyuu4Iww+4d
 pETeBmTXrAVuB0MiAhagy0h63mAMMW0TVCM0Ah551Eq2Uvu0KN/wzrU7WzSsV5+35I
 K/fH0j+pNRBkT4nYiHCgmuSIKOjw7W6H5zzQ8DGNZPtE1l8TZiqlGqo69VT4q65pJE
 oZG7r3dErkuJugYsE6CApcCz7om+RP4taHop4sgEPIia4LQUONfNDhIpR/91cASYAw
 f8BBruc8oTfuQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 16/22] powerpc/book3s64/kuap: Improve error reporting
 with KUAP
In-Reply-To: <87h7pctvdl.fsf@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-17-aneesh.kumar@linux.ibm.com>
 <bd854266-6cb5-3a04-ae80-a53e03f1e1d3@csgroup.eu>
 <87h7pctvdl.fsf@linux.ibm.com>
Date: Thu, 26 Nov 2020 20:29:16 +1100
Message-ID: <87r1ogxy8j.fsf@mpe.ellerman.id.au>
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>
>> Le 25/11/2020 =C3=A0 06:16, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>>> With hash translation use DSISR_KEYFAULT to identify a wrong access.
>>> With Radix we look at the AMR value and type of fault.
>>>=20
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/book3s/32/kup.h     |  4 +--
>>>   arch/powerpc/include/asm/book3s/64/kup.h     | 27 ++++++++++++++++----
>>>   arch/powerpc/include/asm/kup.h               |  4 +--
>>>   arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 +--
>>>   arch/powerpc/mm/fault.c                      |  2 +-
>>>   5 files changed, 29 insertions(+), 12 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/in=
clude/asm/book3s/32/kup.h
>>> index 32fd4452e960..b18cd931e325 100644
>>> --- a/arch/powerpc/include/asm/book3s/32/kup.h
>>> +++ b/arch/powerpc/include/asm/book3s/32/kup.h
>>> @@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned lon=
g flags)
>>>   		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
>>>   }
>>>=20=20=20
>>> -static inline bool
>>> -bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_wr=
ite)
>>> +static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long =
address,
>>> +				  bool is_write, unsigned long error_code)
>>>   {
>>>   	unsigned long begin =3D regs->kuap & 0xf0000000;
>>>   	unsigned long end =3D regs->kuap << 28;
>>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/in=
clude/asm/book3s/64/kup.h
>>> index 4a3d0d601745..2922c442a218 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>>> @@ -301,12 +301,29 @@ static inline void set_kuap(unsigned long value)
>>>   	isync();
>>>   }
>>>=20=20=20
>>> -static inline bool
>>> -bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_wr=
ite)
>>> +#define RADIX_KUAP_BLOCK_READ	UL(0x4000000000000000)
>>> +#define RADIX_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
>>> +
>>> +static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long =
address,
>>> +				  bool is_write, unsigned long error_code)
>>>   {
>>> -	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
>>> -		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_=
READ)),
>>> -		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>>> +	if (!mmu_has_feature(MMU_FTR_KUAP))
>>> +		return false;
>>> +
>>> +	if (radix_enabled()) {
>>> +		/*
>>> +		 * Will be a storage protection fault.
>>> +		 * Only check the details of AMR[0]
>>> +		 */
>>> +		return WARN((regs->kuap & (is_write ? RADIX_KUAP_BLOCK_WRITE : RADIX=
_KUAP_BLOCK_READ)),
>>> +			    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>>
>> I think it is pointless to keep the WARN() here.
>>
>> I have a series aiming at removing them. See=20
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cc9129bdda1dbc2f=
0a09cf45fece7d0b0e690784.1605541983.git.christophe.leroy@csgroup.eu/
>
> Can we do this as a spearate patch as you posted above? We can drop the
> WARN in that while keeping the hash branch to look at DSISR value.

Yeah we can reconcile Christophe's series with yours later.

I'm still not 100% convinced I want to drop that WARN.

cheers
