Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0766D60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 14:30:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lXLr57hrzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 22:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lX9Y0L6tzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 22:22:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45lX9X2f0Cz9sPX;
 Fri, 12 Jul 2019 22:22:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
Subject: Re: [PATCH v2] powerpc/book3s/mm: Update Oops message to print the
 correct translation in use
In-Reply-To: <a9efab7b-0c61-5224-f936-82db1039d159@c-s.fr>
References: <20190711145814.17970-1-aneesh.kumar@linux.ibm.com>
 <8736jbg46p.fsf@concordia.ellerman.id.au>
 <a9efab7b-0c61-5224-f936-82db1039d159@c-s.fr>
Date: Fri, 12 Jul 2019 22:22:07 +1000
Message-ID: <87r26ve93k.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 12/07/2019 =C3=A0 08:25, Michael Ellerman a =C3=A9crit=C2=A0:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
...
>>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>>> index 11caa0291254..b181d6860f28 100644
>>> --- a/arch/powerpc/kernel/traps.c
>>> +++ b/arch/powerpc/kernel/traps.c
>>> @@ -250,15 +250,22 @@ static void oops_end(unsigned long flags, struct =
pt_regs *regs,
>>>   }
>>>   NOKPROBE_SYMBOL(oops_end);
>>>=20=20=20
>>> +static char *get_mmu_str(void)
>>> +{
>>> +	if (early_radix_enabled())
>>> +		return " MMU=3DRadix";
>>> +	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
>>> +		return " MMU=3DHash";
>>> +	return "";
>>> +}
>>=20
>> We don't change MMU once we're up, so just do this logic once and stash
>> it into a static string, rather than rechecking on every oops.
>
> Do we really have oops so often that we have to worry about that ?

Sometimes :)

But no I don't mean it's a performance issue, it just seems simpler to
compute the value once and store it. In fact for most platforms it can
just be a static string at compile time, it's only 64-bit Book3S that
needs to do anything at runtime.

cheers
