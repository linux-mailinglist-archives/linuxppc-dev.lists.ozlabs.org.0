Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD61033CC3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:44:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzzg063K2z30CK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:44:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FC8kxpQz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FC8kxpQz; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzzfY5TFjz2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:43:48 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d21so1859459pfn.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=pJMqp9EIEi0XFu4H8gDRGASddQ1NcQquoIf0sgZVsck=;
 b=FC8kxpQzZWPyMIpBVv8QnX/o1Xp4rND8Y1f9I595cBz7iAwWgSNXDLqgeAZ/k80prG
 pi0QOsB4MUrDO/hSpBEuS7SxDnDVZ8ZS4FJvZSiOgqwRb8j54wfJzAdtn7uaoFnWQdTp
 Kn1VB2EdzvjeIpmWR2CmOszvq0+LltoHdyzZInRpDVFkJsJSbrDeuTorL1ZCb7fjtFNj
 oY3a7Isx0YfbJ3ms2QTM8FiLDYrV1y81BiuITAudtNQyUFBryb1lUGqz7lG+ilOWF1zd
 CFfn8VXYPbBvkOSyGoZpeSDA74+Fr2NkmLqgZHMBn8pjWqnLM/G9Yp4eeTDyCrWaXhlD
 MEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=pJMqp9EIEi0XFu4H8gDRGASddQ1NcQquoIf0sgZVsck=;
 b=cRIEKQIb8WIrgXOFCsCdSVrNaipBKJTa924ocEsSjHl6TdHofWWVEEBmXiGrgiA9Ss
 b893vNkDUf2D3bIKlCDFpUCq8HVdprKG1VGcEbQzZdn311GITvksi9CLIwrys/l0ygly
 epPg4uyfr36GpCV3YcnKdhvpGwzirMob0gzxwJYl9DbwOyhUJbqEkSzwNgRqqxU+Cjnw
 sX6vdm6S+J3x32fmEbpJ9CHhFg8f2/AK+rsT9Ddqp8JKQi29X6DVHHUiH2rfOH3qYcOF
 Yhl89amkWUl5saNIPVsrV6OnMeB4mM+2E5GCaJd9C/RpX/IL/LtnGRKuk8rkS9s452UP
 0x6A==
X-Gm-Message-State: AOAM533o9SpwXCI3uZmL4adj8x7I3yNhwb3XqJgUUklvtl2sJNXSJAXl
 /VNRAKDTT2gBZP+1YPCkyjo=
X-Google-Smtp-Source: ABdhPJzqCoph7XnqsP4+hZ0QROL33qbqzR7fZiP3cJwDwx7BBugSNkKKNM1hdDQ7XFCb4uIhqQ81hQ==
X-Received: by 2002:a62:8ccc:0:b029:1f6:c5e2:69ff with SMTP id
 m195-20020a628ccc0000b02901f6c5e269ffmr13293916pfd.46.1615866226554; 
 Mon, 15 Mar 2021 20:43:46 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id d20sm1003991pjv.47.2021.03.15.20.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:43:45 -0700 (PDT)
Date: Tue, 16 Mar 2021 13:43:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 12/41] KVM: PPC: Book3S 64: Move hcall early register
 setup to KVM
To: Daniel Axtens <dja@axtens.net>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-13-npiggin@gmail.com>
 <87czw57wn8.fsf@linkitivity.dja.id.au>
In-Reply-To: <87czw57wn8.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1615862463.zij1m644om.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of March 12, 2021 3:45 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> System calls / hcalls have a different calling convention than
>> other interrupts, so there is code in the KVMTEST to massage these
>> into the same form as other interrupt handlers.
>>
>> Move this work into the KVM hcall handler. This means teaching KVM
>> a little more about the low level interrupt handler setup, PACA save
>> areas, etc., although that's not obviously worse than the current
>> approach of coming up with an entirely different interrupt register
>> / save convention.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/exception-64s.h | 13 ++++++++
>>  arch/powerpc/kernel/exceptions-64s.S     | 42 +-----------------------
>>  arch/powerpc/kvm/book3s_64_entry.S       | 17 ++++++++++
>>  3 files changed, 31 insertions(+), 41 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/inc=
lude/asm/exception-64s.h
>> index c1a8aac01cf9..bb6f78fcf981 100644
>> --- a/arch/powerpc/include/asm/exception-64s.h
>> +++ b/arch/powerpc/include/asm/exception-64s.h
>> @@ -35,6 +35,19 @@
>>  /* PACA save area size in u64 units (exgen, exmc, etc) */
>>  #define EX_SIZE		10
>> =20
>> +/* PACA save area offsets */
>> +#define EX_R9		0
>> +#define EX_R10		8
>> +#define EX_R11		16
>> +#define EX_R12		24
>> +#define EX_R13		32
>> +#define EX_DAR		40
>> +#define EX_DSISR	48
>> +#define EX_CCR		52
>> +#define EX_CFAR		56
>> +#define EX_PPR		64
>> +#define EX_CTR		72
>> +
>>  /*
>>   * maximum recursive depth of MCE exceptions
>>   */
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 292435bd80f0..b7092ba87da8 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -21,22 +21,6 @@
>>  #include <asm/feature-fixups.h>
>>  #include <asm/kup.h>
>> =20
>> -/* PACA save area offsets (exgen, exmc, etc) */
>> -#define EX_R9		0
>> -#define EX_R10		8
>> -#define EX_R11		16
>> -#define EX_R12		24
>> -#define EX_R13		32
>> -#define EX_DAR		40
>> -#define EX_DSISR	48
>> -#define EX_CCR		52
>> -#define EX_CFAR		56
>> -#define EX_PPR		64
>> -#define EX_CTR		72
>> -.if EX_SIZE !=3D 10
>> -	.error "EX_SIZE is wrong"
>> -.endif
>> -
>>  /*
>>   * Following are fixed section helper macros.
>>   *
>> @@ -1964,29 +1948,8 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
>> =20
>>  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
>>  TRAMP_REAL_BEGIN(system_call_kvm)
>> -	/*
>> -	 * This is a hcall, so register convention is as above, with these
>> -	 * differences:
>> -	 * r13 =3D PACA
>> -	 * ctr =3D orig r13
>> -	 * orig r10 saved in PACA
>> -	 */
>> -	 /*
>> -	  * Save the PPR (on systems that support it) before changing to
>> -	  * HMT_MEDIUM. That allows the KVM code to save that value into the
>> -	  * guest state (it is the guest's PPR value).
>> -	  */
>> -BEGIN_FTR_SECTION
>> -	mfspr	r10,SPRN_PPR
>> -	std	r10,HSTATE_PPR(r13)
>> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> -	HMT_MEDIUM
>>  	mfctr	r10
>> -	SET_SCRATCH0(r10)
>> -	mfcr	r10
>> -	std	r12,HSTATE_SCRATCH0(r13)
>> -	sldi	r12,r10,32
>> -	ori	r12,r12,0xc00
>> +	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
>=20
> If I've understood correctly, you've saved the _original_/guest r13 in
> SCRATCH0. That makes sense - it just took me a while to follow the
> logic, especially because the parameter to SET_SCRATCH0 is r10, not r13.
>=20
> I would probably expand the comment to say the original or guest r13 (as
> you do in the comment at the start of kvmppc_hcall), but if there's a
> convention here that I've missed that might not be necessary.

There is a convention which is that all kvm interrupts including system
call come in with r13 saved in SCRATCH0, although that's all in a state
of flux throughput this series of course.

I added the comment because I moved the bigger comment here, I think=20
that's okay because you're always referring to interrupted context=20
(i.e., guest in this case) when talking about saved registers.

>=20
>>  #ifdef CONFIG_RELOCATABLE
>>  	/*
>>  	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
>> @@ -1994,15 +1957,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  	 */
>>  	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
>>  	mtctr   r10
>> -	ld	r10,PACA_EXGEN+EX_R10(r13)
>>  	bctr
>>  #else
>> -	ld	r10,PACA_EXGEN+EX_R10(r13)
>>  	b       kvmppc_hcall
>>  #endif
>>  #endif
>> =20
>> -
>>  /**
>>   * Interrupt 0xd00 - Trace Interrupt.
>>   * This is a synchronous interrupt in response to instruction step or
>> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3=
s_64_entry.S
>> index 8cf5e24a81eb..a7b6edd18bc8 100644
>> --- a/arch/powerpc/kvm/book3s_64_entry.S
>> +++ b/arch/powerpc/kvm/book3s_64_entry.S
>> @@ -14,6 +14,23 @@
>>  .global	kvmppc_hcall
>>  .balign IFETCH_ALIGN_BYTES
>>  kvmppc_hcall:
>> +	/*
>> +	 * This is a hcall, so register convention is as
>> +	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
>> +	 * R13		=3D PACA
>> +	 * guest R13 saved in SPRN_SCRATCH0
>> +	 * R10		=3D free
>> +	 */
>> +BEGIN_FTR_SECTION
>> +	mfspr	r10,SPRN_PPR
>> +	std	r10,HSTATE_PPR(r13)
>> +END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>=20
> Do we want to preserve the comment about why we save the PPR?

Wouldn't hurt. I think the reason the comment is there is because it's a=20
difference with system calls. Hcalls preserve the PPR, system calls do not.

Should probably leave the "orig r10 saved in the PACA" comment too.

>=20
>> +	HMT_MEDIUM
>> +	mfcr	r10
>> +	std	r12,HSTATE_SCRATCH0(r13)
>> +	sldi	r12,r10,32
>> +	ori	r12,r12,0xc00
>=20
> I see that this is a direct copy from the earlier code, but it confuses
> me a bit. Looking at exceptions-64s.S, there's the following comment:
>=20
>  * In HPT, sc 1 always goes to 0xc00 real mode. In RADIX, sc 1 can go to
>  * 0x4c00 virtual mode.
>=20
> However, this code uncondionally sets the low bits to be c00, even if
> the exception came in via 4c00. Is this right? Do we need to pass
> that through somehow?

We don't need to. The "trap" numbers are always the real-mode vectors
(except scv which is a bit weird) by convention.

>=20
>> +	ld	r10,PACA_EXGEN+EX_R10(r13)
>>
>=20
> Otherwise, this looks good to me so far.

Thanks,
Nick
