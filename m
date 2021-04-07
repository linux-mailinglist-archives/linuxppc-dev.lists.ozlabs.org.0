Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6269E356BDA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 14:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFjx22P5Jz3bt8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 22:13:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RBmXSHj2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RBmXSHj2; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFjwb6GnSz2y69
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 22:13:35 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d124so3926359pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=kCWo1oPFtEjSCHUVywJ1PjEZUh1ejummtSMQ7lPEqxY=;
 b=RBmXSHj2yFLSHpeveeI9YTqBd68rxJWjKaKOeAOe9Y1BKT0Kh3AJ0+IOJJQYgE4F3b
 3+k7MhV4JQNxrL3F94rVNMuOxmlP2zt0xxKbwPDSVXHLdVq4TLmDByhXoSigzDyo0vs0
 +CafbYmJansE5HTFhHHKGE8jI00Z8gvgnIMVrWiCJJaPFUscVTP296JjbMgXkmQkQgqh
 RxSQ1hG4ylw+wBTSUO0hN9yoDZvboerKmhx7eEoo6g11AW7bzjKkcS9zZCwdw/6t11X5
 YS7JoTVooHpOgCZFMHlc+GGruoqgZsQINMM2d74NBot9OlHC7x4AFODJtMiqiuFqgt/K
 k8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=kCWo1oPFtEjSCHUVywJ1PjEZUh1ejummtSMQ7lPEqxY=;
 b=bjT0fbU8j+6f9y98lIYpgN2RTkSmmn2E/0tkOj+/HT2dEgYjGRT5KDKJ8Zy0knRR/n
 gPiCXFhICXehW5WuZa/sUZ1C7rSDbxQnVK4jfOLaCkWp+/zjV4xr2w0n6dq85ekUqQcL
 +Frjdc+R0xnYaeYib3vOyupCSFHVRJcwO5b/zNCe4Jc+/p9CAnYzavL3X5xZ8GlcmQ4N
 SYcDAPELk2SN2D1fZC5WdkpsSKc2fS7wYjPESEEik14gUnpuTPI7pWu7wLgBoYsY4Mr4
 c//vxo4or0zTZYqkDOa/250sBHRJf8koyNuVYh8hVgyI8vRqDQHcOzihd8VA8thJV9QZ
 FcQA==
X-Gm-Message-State: AOAM532gWqg65nh5ptoyc1qc+lb58HoSr0Uh1iMTCf2gttFOfNWcBa5G
 dmkuMfv4hiAKlRD3vxYH9On0P2gvtVCgcA==
X-Google-Smtp-Source: ABdhPJzcUnSI4713cKmpsza/i/kiE7/j/zuR4uNzW6PMo6eKCi1W/MgkcycDgCYO9Kbs+H9ksM2thw==
X-Received: by 2002:a63:5361:: with SMTP id t33mr3011949pgl.439.1617797612219; 
 Wed, 07 Apr 2021 05:13:32 -0700 (PDT)
Received: from localhost ([1.132.149.34])
 by smtp.gmail.com with ESMTPSA id m9sm21723581pgt.65.2021.04.07.05.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 05:13:31 -0700 (PDT)
Date: Wed, 07 Apr 2021 22:13:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1
 processors
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210402024124.545826-1-npiggin@gmail.com>
 <87v98ye3cn.fsf@mpe.ellerman.id.au>
In-Reply-To: <87v98ye3cn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1617797140.zqn9fqbd4y.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of April 7, 2021 9:33 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Starting with ISA v3.1, LPCR[AIL] no longer controls the interrupt
>> mode for HV=3D1 interrupts. Instead, a new LPCR[HAIL] bit is defined
>> which behaves like AIL=3D3 for HV interrupts when set.
>>
>> Set HAIL on bare metal to give us mmu-on interrupts and improve
>> performance.
>>
>> This also fixes an scv bug: we don't implement scv real mode (AIL=3D0)
>> vectors because they are at an inconvenient location, so we just
>> disable scv support when AIL can not be set. However powernv assumes
>> that LPCR[AIL] will enable AIL mode so it enables scv support despite
>> HV interrupts being AIL=3D0, which causes scv interrupts to go off into
>> the weeds.
>=20
> Should we tag this as fixing the initial P10 support, or the scv
> support? Or neither?

Good question. It does fix a nasty crash with scv so at least it should
be tagged I guess.

I don't know of anything else that assumes AIL on bare metal, so I don't=20
know of a crashy bug it fixes with initial P10 support. But it is a bit=20
odd for a HV OS running a v3.1 processor to set the old LPCR AIL bits,=20
so it is some kind of bug fix (performance at least).

Could go either way I guess.

Thanks,
Nick


>=20
> cheers
>=20
>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/r=
eg.h
>> index 1be20bc8dce2..9086a2644c89 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -441,6 +441,7 @@
>>  #define   LPCR_VRMA_LP1		ASM_CONST(0x0000800000000000)
>>  #define   LPCR_RMLS		0x1C000000	/* Implementation dependent RMO limit s=
el */
>>  #define   LPCR_RMLS_SH		26
>> +#define   LPCR_HAIL		ASM_CONST(0x0000000004000000)   /* HV AIL (ISAv3.1=
) */
>>  #define   LPCR_ILE		ASM_CONST(0x0000000002000000)   /* !HV irqs set MSR=
:LE */
>>  #define   LPCR_AIL		ASM_CONST(0x0000000001800000)	/* Alternate interrup=
t location */
>>  #define   LPCR_AIL_0		ASM_CONST(0x0000000000000000)	/* MMU off exceptio=
n offset 0x0 */
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_=
64.c
>> index 04a31586f760..671192afcdfd 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -233,10 +233,23 @@ static void cpu_ready_for_interrupts(void)
>>  	 * If we are not in hypervisor mode the job is done once for
>>  	 * the whole partition in configure_exceptions().
>>  	 */
>> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
>> -	    cpu_has_feature(CPU_FTR_ARCH_207S)) {
>> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>>  		unsigned long lpcr =3D mfspr(SPRN_LPCR);
>> -		mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
>> +		unsigned long new_lpcr =3D lpcr;
>> +
>> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +			/* P10 DD1 does not have HAIL */
>> +			if (pvr_version_is(PVR_POWER10) &&
>> +					(mfspr(SPRN_PVR) & 0xf00) =3D=3D 0x100)
>> +				new_lpcr |=3D LPCR_AIL_3;
>> +			else
>> +				new_lpcr |=3D LPCR_HAIL;
>> +		} else if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
>> +			new_lpcr |=3D LPCR_AIL_3;
>> +		}
>> +
>> +		if (new_lpcr !=3D lpcr)
>> +			mtspr(SPRN_LPCR, new_lpcr);
>>  	}
>> =20
>>  	/*
>> --=20
>> 2.23.0
>=20
