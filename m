Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4421508D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 02:33:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0RP65jxzzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 10:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZChIgkEh; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0RKz1szHzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 10:30:14 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id md7so1105538pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 17:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=SiLUZ4upHaLyrogPRVRHW5icqN9xUKW8UG99tlD0o1w=;
 b=ZChIgkEh86/XjbL568B54v/+xUqg8dRxDHfP0F2txCazr/ay2G0gwdJ8PQfDaOYadl
 RSBC7AxSAzzk+5hNHcDCmTEf87pIkaz9EdJiV1gBnhrpwODw1O8kNb+gIWfEZib6R/nv
 3EBIhvq3HVyNAEtEpgNNV/sU5imC6rVyAYWyIuNC0TshQKJK7xOW0Nal4bQcIfLuW4E7
 xs/i78gs7bVGourp3tbhKRy66izcSw5q4f+joq28W1GbjqFSVVLQpuW66DMg1Eg6bcG1
 8i5+R2ZYW++2vXO4ov6gCxPcQDVxqLw0wYVi6qNiWXxB4MacdGFgBV+2F+WkPs13xaWm
 g2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=SiLUZ4upHaLyrogPRVRHW5icqN9xUKW8UG99tlD0o1w=;
 b=g3ssFkNliyj2IWyBJHWJPQkoyvtjmJ//3FxV1t3i54JUEWHXsvzXRn7Hm4iVYttdc9
 xaQFMUk4MPROLhM52cexf6azHAnNlg+wA7vXw45euAedgjY4kU1dAA1SbUTRGLfAbpuO
 FCwrZqLrPTTIlTgvCKnBmGfh9dkANdsw0bcqp+RKUxhAVZRgBRRRyWD3CUE/ORNyVSIW
 8DA9LwMzvA3oWx1gdqI+IAuHoMY41/twmMANuOTxzV9rtuAd2jPlPDyoOvFE6Tjcx17N
 +SB5fJ9/QMc2QgSUOIWZ1vGgkD5x+/OoUmj34FWwBp4H00lUZqsp4tShk96OLyFFjEu1
 i1mA==
X-Gm-Message-State: AOAM530N1ITA+4f6se+Lo3SL5U+Bj4mkshtu0CTnKB7xIdCxEoYbM53Q
 WYZuFOWb0IzDjZ5/sDPK0Aw=
X-Google-Smtp-Source: ABdhPJyswqCW+lIyGMKfHWg+k/xcX0xp3O7ypSRKMWd1CxCr9iuV5ZKPGSUPZi+UcDnz9fiQ/+enbg==
X-Received: by 2002:a17:90a:89:: with SMTP id a9mr5354677pja.171.1593995411484; 
 Sun, 05 Jul 2020 17:30:11 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id x10sm17583932pfp.80.2020.07.05.17.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 17:30:10 -0700 (PDT)
Date: Mon, 06 Jul 2020 10:30:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Waiman Long <longman@redhat.com>
References: <20200703073516.1354108-1-npiggin@gmail.com>
 <20200703073516.1354108-6-npiggin@gmail.com>
 <81d9981b-8a20-729c-b861-c7229e40bb65@redhat.com>
In-Reply-To: <81d9981b-8a20-729c-b861-c7229e40bb65@redhat.com>
MIME-Version: 1.0
Message-Id: <1593994632.syt8hwimv9.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Waiman Long's message of July 6, 2020 5:00 am:
> On 7/3/20 3:35 AM, Nicholas Piggin wrote:
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/paravirt.h           | 28 ++++++++++
>>   arch/powerpc/include/asm/qspinlock.h          | 55 +++++++++++++++++++
>>   arch/powerpc/include/asm/qspinlock_paravirt.h |  5 ++
>>   arch/powerpc/platforms/pseries/Kconfig        |  5 ++
>>   arch/powerpc/platforms/pseries/setup.c        |  6 +-
>>   include/asm-generic/qspinlock.h               |  2 +
>>   6 files changed, 100 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
>>
>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/=
asm/paravirt.h
>> index 7a8546660a63..f2d51f929cf5 100644
>> --- a/arch/powerpc/include/asm/paravirt.h
>> +++ b/arch/powerpc/include/asm/paravirt.h
>> @@ -29,6 +29,16 @@ static inline void yield_to_preempted(int cpu, u32 yi=
eld_count)
>>   {
>>   	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_co=
unt);
>>   }
>> +
>> +static inline void prod_cpu(int cpu)
>> +{
>> +	plpar_hcall_norets(H_PROD, get_hard_smp_processor_id(cpu));
>> +}
>> +
>> +static inline void yield_to_any(void)
>> +{
>> +	plpar_hcall_norets(H_CONFER, -1, 0);
>> +}
>>   #else
>>   static inline bool is_shared_processor(void)
>>   {
>> @@ -45,6 +55,19 @@ static inline void yield_to_preempted(int cpu, u32 yi=
eld_count)
>>   {
>>   	___bad_yield_to_preempted(); /* This would be a bug */
>>   }
>> +
>> +extern void ___bad_yield_to_any(void);
>> +static inline void yield_to_any(void)
>> +{
>> +	___bad_yield_to_any(); /* This would be a bug */
>> +}
>> +
>> +extern void ___bad_prod_cpu(void);
>> +static inline void prod_cpu(int cpu)
>> +{
>> +	___bad_prod_cpu(); /* This would be a bug */
>> +}
>> +
>>   #endif
>>  =20
>>   #define vcpu_is_preempted vcpu_is_preempted
>> @@ -57,5 +80,10 @@ static inline bool vcpu_is_preempted(int cpu)
>>   	return false;
>>   }
>>  =20
>> +static inline bool pv_is_native_spin_unlock(void)
>> +{
>> +     return !is_shared_processor();
>> +}
>> +
>>   #endif /* __KERNEL__ */
>>   #endif /* __ASM_PARAVIRT_H */
>> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include=
/asm/qspinlock.h
>> index c49e33e24edd..0960a0de2467 100644
>> --- a/arch/powerpc/include/asm/qspinlock.h
>> +++ b/arch/powerpc/include/asm/qspinlock.h
>> @@ -3,9 +3,36 @@
>>   #define _ASM_POWERPC_QSPINLOCK_H
>>  =20
>>   #include <asm-generic/qspinlock_types.h>
>> +#include <asm/paravirt.h>
>>  =20
>>   #define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
>>  =20
>> +#ifdef CONFIG_PARAVIRT_SPINLOCKS
>> +extern void native_queued_spin_lock_slowpath(struct qspinlock *lock, u3=
2 val);
>> +extern void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 =
val);
>> +
>> +static __always_inline void queued_spin_lock_slowpath(struct qspinlock =
*lock, u32 val)
>> +{
>> +	if (!is_shared_processor())
>> +		native_queued_spin_lock_slowpath(lock, val);
>> +	else
>> +		__pv_queued_spin_lock_slowpath(lock, val);
>> +}
>=20
> In a previous mail, I said that:

Hey, yeah I read that right after sending the series out. Thanks for the=20
thorough review.

> You may need to match the use of __pv_queued_spin_lock_slowpath() with=20
> the corresponding __pv_queued_spin_unlock(), e.g.
>=20
> #define queued_spin_unlock queued_spin_unlock
> static inline queued_spin_unlock(struct qspinlock *lock)
> {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!is_shared_processor())
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 smp_store_release(&lock->locked, 0);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __pv_queued_spin_unlock(lock);
> }
>=20
> Otherwise, pv_kick() will never be called.
>=20
> Maybe PowerPC HMT is different that the shared cpus can still process=20
> instruction, though slower, that cpu kicking like what was done in kvm=20
> is not really necessary. If that is the case, I think we should document=20
> that.

It does stop dispatch, but it will wake up by itself after all other=20
vCPUs have had a chance to dispatch. I will re-test with the fix in
place and see if there's any significant performance differences.

Thanks,
Nick

