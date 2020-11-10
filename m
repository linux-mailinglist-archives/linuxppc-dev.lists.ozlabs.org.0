Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 636622AD191
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:45:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVhJl1cVdzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S9UN78V1; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVhH31VSlzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:43:57 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id 62so9537008pgg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 00:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=nU28X/2goC9bhKTGyai/OKb8F8//CkVk7/If+Z36/f4=;
 b=S9UN78V13gm2p9tZ9XCsnwgad08eGcMfIoPX2XILIYS+lHH9YusRjCXADZWaK9rakd
 kxPmagRBlDDSciqKGbDl9+7uppPSPjF0+fWHlcmKAI/JZ8xMuP6aBdm9wwi584Fsxa2d
 VnuomE78KZRDJuOk2RL6Er2ppodGrqM4YKrUEqyPTo3lyyMrB4vYEk3AvTTy8Eh1n/5M
 WdMHmjA8QtQKhMkQZ631zNmPwauue4M7k81MveqccuDYwlGX1wuju/dwSlvAfXRAdSq8
 qgh8qkZiOIH2cnbmff5gxihzVTBT3GySqQZw6O+xIU6f0ESyeQd+6SpRclc/IW2yoW07
 wmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nU28X/2goC9bhKTGyai/OKb8F8//CkVk7/If+Z36/f4=;
 b=VUmLT4FOK0toeaHTPbF1ijCTqPTspRau8DvUsb/P3P3poO2BZFpBrnXDXKNGhodTOa
 11CsyRpZDcS3NmiE4DQZpK7K4VvA8OUIrYCw7cI7xNaRdYXSJ6ZyToENB4Ju0JgGQzak
 98CuZQy6Ijz9hitQqKBLev1Ume9pScpgd79Uh5j4asHHggNSZvMn5JfHnvfWbWZFQEGq
 LGHzZOXDVrS+3UdzT/pZTcYjoHAFSG2ZmwqBbu/BI+HBAHkeDO+EiKnGYp7IhtObc0Z7
 Po3rcuB8EHnlfobeJL+89bQBui0s0j5ZkNGVvqr9roZkuyzegO/Z2ZJNHcpX5t2z88eU
 u05Q==
X-Gm-Message-State: AOAM533T7btrANdKlCIjQ3nkBOgu9zMfOoiTXZi//+97HrdeWMj18XEI
 BBAP+EggO89C5Ry84x8iaWY=
X-Google-Smtp-Source: ABdhPJyWg5P0GSOfHjyvas8HFAZqd9dwIMABSfNnfj5Jr6pF53261vuOdz50yzwyf3Ay4DcbK0mi/Q==
X-Received: by 2002:a17:90a:1d09:: with SMTP id
 c9mr3912741pjd.80.1604997834147; 
 Tue, 10 Nov 2020 00:43:54 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a12sm2114969pjh.48.2020.11.10.00.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 00:43:53 -0800 (PST)
Date: Tue, 10 Nov 2020 18:43:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 18/18] powerpc/64s: move power4 idle entirely to C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-19-npiggin@gmail.com>
 <7de6fd21-da79-fe8f-5db4-f99ee0dd7d23@csgroup.eu>
In-Reply-To: <7de6fd21-da79-fe8f-5db4-f99ee0dd7d23@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1604997329.cf7j9ms575.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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

Excerpts from Christophe Leroy's message of November 7, 2020 7:43 pm:
>=20
>=20
> Le 05/11/2020 =C3=A0 15:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe asked about doing this, most of the code is still in
>> asm but maybe it's slightly nicer? I don't know if it's worthwhile.
>=20
> Heu... I don't think I was asking for that, but why not, see later commen=
ts.
>=20
> At first I was just asking to write the following in C:
>=20
> +
> +	.globl power4_idle_nap_return
> +power4_idle_nap_return:
> +	blr
>=20
>=20
> In extenso, instead of the above do somewhere something like:
>=20
> void power4_idle_nap_return(void)
> {
> }

Ah! Well either was a good question. I don't mind attempting it :)

>> ---
>>   arch/powerpc/kernel/idle.c        | 25 ++++++++++++++++++++-----
>>   arch/powerpc/kernel/idle_book3s.S | 22 ----------------------
>>   2 files changed, 20 insertions(+), 27 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
>> index ae0e2632393d..849e77a45915 100644
>> --- a/arch/powerpc/kernel/idle.c
>> +++ b/arch/powerpc/kernel/idle.c
>> @@ -72,6 +72,9 @@ int powersave_nap;
>>   #ifdef CONFIG_PPC_970_NAP
>>   void power4_idle(void)
>>   {
>> +	unsigned long msr_idle =3D MSR_KERNEL|MSR_EE|MSR_POW;
>> +	unsigned long tmp1, tmp2;
>> +
>>   	if (!cpu_has_feature(CPU_FTR_CAN_NAP))
>>   		return;
>>  =20
>> @@ -84,13 +87,25 @@ void power4_idle(void)
>>   	if (cpu_has_feature(CPU_FTR_ALTIVEC))
>>   		asm volatile("DSSALL ; sync" ::: "memory");
>>  =20
>> -	power4_idle_nap();
>> -
>> +	asm volatile(
>> +"	ld	%0,PACA_THREAD_INFO(r13)		\n"
>> +"	ld	%1,TI_LOCAL_FLAGS(%0)			\n"
>> +"	ori	%1,%1,_TLF_NAPPING			\n"
>> +"	std	%1,TI_LOCAL_FLAGS(%0)			\n"
>=20
> Can't this just be:
>=20
> 	current_thread_info()->local_flags |=3D _TLF_NAPPING;
>=20
>>   	/*
>> -	 * power4_idle_nap returns with interrupts enabled (soft and hard).
>> -	 * to our caller with interrupts enabled (soft and hard). Our caller
>> -	 * can cope with either interrupts disabled or enabled upon return.
>> +	 * NAPPING bit is set, from this point onward nap_adjust_return()
>> +	 * will cause interrupts to return to power4_idle_nap_return.
>>   	 */
>> +"1:	sync						\n"
>> +"	isync						\n"
>> +"	mtmsrd	%2					\n"
>> +"	isync						\n"
>> +"	b	1b					\n"
>=20
> And this:
>=20
> 	for (;;) {
> 		mb();
> 		isync();
> 		mtmsr(MSR_KERNEL|MSR_EE|MSR_POW);
> 		isync();
> 	}

I was hoping something nicer like this but I think not because as soon=20
as we set _TLF_NAPPING, we might take an interrupt which returns=20
somewhere else, and you aren't allowed to do that in C code (mainly=20
because the stack and register state would be unknown). Even going=20
immediately to blr or end of function might miss restoring NVGPRs etc.

There might be some tricks we could play with soft-masking interrupts,=20
using MSR[EE]=3D0, and then doing all this and returning to right after=20
the mtmsr POW with a flag set...  But it's a bit of tricky churn for an=20
old CPU that works okay.

Thanks,
Nick

>=20
>=20
>> +"	.globl power4_idle_nap_return			\n"
>> +"power4_idle_nap_return:				\n"
>> +	: "=3Dr"(tmp1), "=3Dr"(tmp2)
>> +	: "r"(msr_idle)
>> +	);
>>   }
>>   #endif
>>  =20
>=20
> Christophe
>=20
