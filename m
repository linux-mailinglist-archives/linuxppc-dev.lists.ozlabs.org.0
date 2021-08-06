Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114B3E289A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 12:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh1wJ3jf0z3dDZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 20:30:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kUD4D07x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kUD4D07x; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh1vq259pz3cHR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 20:30:31 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so22081011pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=RSDCfwLxda4JpCU9SjlXf92juYjOfQEJMYSTxW+15xM=;
 b=kUD4D07x+GoFnNJR/kR0xqNnaCH7E1uTYDEGdPNmsuEHY0LCF6MU+d13cs1kLUJIFl
 72NsHqHrXA3qGcGTPnWzVIBvY/Tlq2YL4xA2hahSisgC1/va7F/JnEVQP4RfLNRUZ1fz
 ZS7OlqLwphfFwpyGDHCnSlvsNWKru46EmGJhuFZ9a+CEp1zaRp79ud8jk91yz00Hegmm
 groDRCrIw1rYNTXmYwL/g0SEn5hiPjsaLnRnzf1r+BFQKFrbP7yQwYZ9cc51ijlNSgnp
 2FfoDKBh8V6+sBAJfnK0GlMii6kTeNqvaQG3xpo6MjnQRrgQ91o7UUL5iW/fQTrDSV7/
 cwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RSDCfwLxda4JpCU9SjlXf92juYjOfQEJMYSTxW+15xM=;
 b=MmKido52Q+dtw436DNHV+2IJf3MpRKCnvR8J64vVHHegX0PIVLEEfQOsqDtN/xk9A0
 P8KP7UdzCjKYpMy7bDIcHF0jWp1pedVV6GgU7/oHlug2Ik2LAYrbhKMLuL9pzkHd3s6X
 syeSiJ7YuMxMPGVcR/m4g3fXT6cxFlfZhnyIEMfTJZwYx6uIbu0HGBUdkmmL+0+m4NxY
 uU5+72mcc4GM3hK2zF4eQTzgs9hmG7G7tjbj7amFs7UYw+0F57HygOAk6o61OTOtoFCt
 q6uV7jIK8JaHmEPRTNc6bM2i24gc2alKMoeKLczNn5uh5H3bHzDU+4GRheWExN+q9KUu
 5MZQ==
X-Gm-Message-State: AOAM532064pkJU1y9HN8a7rpAerLN2HjQLOtUCCHtCeb7clGHXz8zCfk
 YKfS2cnL9dgy3Qc8pfMVPUw=
X-Google-Smtp-Source: ABdhPJwydmFwOIF+vnPQj4lcCIlUTmo6ga7SRfz5YCZ2K3b3EHhBlYn+S9L4fDxvj0oda0+r8avJfA==
X-Received: by 2002:a63:4916:: with SMTP id w22mr301713pga.339.1628245828078; 
 Fri, 06 Aug 2021 03:30:28 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id gw4sm8947551pjb.1.2021.08.06.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:30:27 -0700 (PDT)
Date: Fri, 06 Aug 2021 20:30:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 11/55] powerpc/time: add API for KVM to re-arm the host
 timer/decrementer
To: Christophe Leroy <christophe.leroy@csgroup.eu>, kvm-ppc@vger.kernel.org
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-12-npiggin@gmail.com>
 <370398a9-4429-285e-4a0f-33759f39b2fc@csgroup.eu>
In-Reply-To: <370398a9-4429-285e-4a0f-33759f39b2fc@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1628245629.4fpdbi6ce8.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of August 5, 2021 5:22 pm:
>=20
>=20
> Le 26/07/2021 =C3=A0 05:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Rather than have KVM look up the host timer and fiddle with the
>> irq-work internal details, have the powerpc/time.c code provide a
>> function for KVM to re-arm the Linux timer code when exiting a
>> guest.
>>=20
>> This is implementation has an improvement over existing code of
>> marking a decrementer interrupt as soft-pending if a timer has
>> expired, rather than setting DEC to a -ve value, which tended to
>> cause host timers to take two interrupts (first hdec to exit the
>> guest, then the immediate dec).
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/time.h | 16 +++-------
>>   arch/powerpc/kernel/time.c      | 52 +++++++++++++++++++++++++++------
>>   arch/powerpc/kvm/book3s_hv.c    |  7 ++---
>>   3 files changed, 49 insertions(+), 26 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/=
time.h
>> index 69b6be617772..924b2157882f 100644
>> --- a/arch/powerpc/include/asm/time.h
>> +++ b/arch/powerpc/include/asm/time.h
>> @@ -99,18 +99,6 @@ extern void div128_by_32(u64 dividend_high, u64 divid=
end_low,
>>   extern void secondary_cpu_time_init(void);
>>   extern void __init time_init(void);
>>  =20
>> -#ifdef CONFIG_PPC64
>> -static inline unsigned long test_irq_work_pending(void)
>> -{
>> -	unsigned long x;
>> -
>> -	asm volatile("lbz %0,%1(13)"
>> -		: "=3Dr" (x)
>> -		: "i" (offsetof(struct paca_struct, irq_work_pending)));
>> -	return x;
>> -}
>> -#endif
>> -
>>   DECLARE_PER_CPU(u64, decrementers_next_tb);
>>  =20
>>   static inline u64 timer_get_next_tb(void)
>> @@ -118,6 +106,10 @@ static inline u64 timer_get_next_tb(void)
>>   	return __this_cpu_read(decrementers_next_tb);
>>   }
>>  =20
>> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>> +void timer_rearm_host_dec(u64 now);
>> +#endif
>> +
>>   /* Convert timebase ticks to nanoseconds */
>>   unsigned long long tb_to_ns(unsigned long long tb_ticks);
>>  =20
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index 72d872b49167..016828b7401b 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -499,6 +499,16 @@ EXPORT_SYMBOL(profile_pc);
>>    * 64-bit uses a byte in the PACA, 32-bit uses a per-cpu variable...
>>    */
>>   #ifdef CONFIG_PPC64
>> +static inline unsigned long test_irq_work_pending(void)
>> +{
>> +	unsigned long x;
>> +
>> +	asm volatile("lbz %0,%1(13)"
>> +		: "=3Dr" (x)
>> +		: "i" (offsetof(struct paca_struct, irq_work_pending)));
>=20
> Can we just use READ_ONCE() instead of hard coding the read ?

Good question, probably yes. Probably calls for its own patch series,=20
e.g., hw_irq.h has all similar paca accesses.

Thanks,
Nick
