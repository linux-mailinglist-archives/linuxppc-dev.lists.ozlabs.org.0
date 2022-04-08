Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEA4F8CE6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 06:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZPj75tWCz3bXq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:02:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VfwoAqc5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZPhT38tqz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 14:02:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VfwoAqc5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KZPhN3zhCz4xQt;
 Fri,  8 Apr 2022 14:01:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649390518;
 bh=A2daiLR29kPBS0/Of/FIMCpQE2nWeaHom3WVPWAyukM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VfwoAqc587d1hrh+C4vbrMPnEEmLgiDy613EyM5q7B+nwYULD8sVf24LnZUD67u9h
 I5ebxG585UQ5aY9e7bTi8blgaomSAHakCXVooLbsbFlBs7ZjPrcf8x5CCGTF4dpCgj
 ncNGAMhNlfiicBd5ZrjHmUxA3ebOPC4VJQO7d4Mhmwsc0uVFS2QjjLDZfCBGjNa+bR
 vu61y9rY7UxVEIDEnVAsn+ybLez0h9Z0pEjeQtiSArHI0RCvvplEQqrZs+WKLcAFE0
 cYVCgSFU8f9ZGBzImMAZ1/esidYSGZXrNSCfpPB27yOwvwI3kVCFNbv5cNyHl/jeYj
 TURShglGcNMWA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5/6] powerpc/64: Only WARN if __pa()/__va() called with
 bad addresses
In-Reply-To: <7381978d-26d1-4abb-e539-d28247a93d9b@csgroup.eu>
References: <20220406145802.538416-1-mpe@ellerman.id.au>
 <20220406145802.538416-5-mpe@ellerman.id.au>
 <7381978d-26d1-4abb-e539-d28247a93d9b@csgroup.eu>
Date: Fri, 08 Apr 2022 14:01:50 +1000
Message-ID: <87zgkw6x5d.fsf@mpe.ellerman.id.au>
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
Cc: "erhard_f@mailbox.org" <erhard_f@mailbox.org>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 06/04/2022 =C3=A0 16:58, Michael Ellerman a =C3=A9crit=C2=A0:
>> We added checks to __pa() / __va() to ensure they're only called with
>> appropriate addresses. But using BUG_ON() is too strong, it means
>> virt_addr_valid() will BUG when DEBUG_VIRTUAL is enabled.
>>=20
>> Instead switch them to warnings, arm64 does the same.
>>=20
>> Fixes: 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va and=
 __pa addresses")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/include/asm/page.h | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/=
page.h
>> index f2c5c26869f1..40a27a56ee40 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -216,6 +216,12 @@ static inline bool pfn_valid(unsigned long pfn)
>>   #define __pa(x) ((phys_addr_t)(unsigned long)(x) - VIRT_PHYS_OFFSET)
>>   #else
>>   #ifdef CONFIG_PPC64
>> +
>> +#ifdef CONFIG_DEBUG_VIRTUAL
>> +#define VIRTUAL_WARN_ON(x)	WARN_ON(x)
>> +#else
>> +#define VIRTUAL_WARN_ON(x)
>> +#endif
>
> Could be:
>
> #define VIRTUAL_WARN_ON(x)	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x=
))
>
>>   /*
>>    * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
>>    * with -mcmodel=3Dmedium, so we use & and | instead of - and + on 64-=
bit.
>> @@ -223,13 +229,13 @@ static inline bool pfn_valid(unsigned long pfn)
>>    */
>>   #define __va(x)								\
>>   ({									\
>> -	VIRTUAL_BUG_ON((unsigned long)(x) >=3D PAGE_OFFSET);		\
>> +	VIRTUAL_WARN_ON((unsigned long)(x) >=3D PAGE_OFFSET);		\
>>   	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
>>   })
>>=20=20=20
>>   #define __pa(x)								\
>>   ({									\
>> -	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
>> +	VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);		\
>>   	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
>>   })
>>=20=20=20
>
> Isn't it dangerous to WARN (or BUG) here ? __pa() can be used very early=
=20
> during boot, like in prom_init.c

Yes. WARN is a bit less dangerous though :)

> Some other architectures have a __pa_nodebug(). The __pa() does the=20
> WARN() then calls __pa_nodebug(). Early users call __pa_nodebug() directl=
y.

Yeah I saw that, we could go that way.

I think possibly the better option is for __pa() to have no checks,
instead the checks go in the higher level routines like virt_to_phys()
and phys_to_virt().

And then we can check uses of __pa() and any that are *not* early boot
or low level stuff can be converted to virt_to_phys().

cheers
