Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7625353611
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 02:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCZxW5BNZz3c2T
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 10:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fqX4IDNY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fqX4IDNY; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCZx56JpGz2xgM
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Apr 2021 10:51:37 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso4188991pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Apr 2021 17:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=f078oh1g39w4WziWK7gA8cApPdqcfS6s3f3bv1Rg6UU=;
 b=fqX4IDNYyG1oHhpmKKIOae3C9SIlk4gb0bCin3Faa01WY9h1/UZcOdgUhOyb6MrDfq
 7dttbJrvcUoKe0/3DC0ndWIEhIKB0YmARgErD5uHS0UVxmDo5NLNb1lDIZcluDYm70kg
 4eM5P59dfbbpzuhPjFw4R7bBKNCwpOmas6yqd5XXUzli1PvSj1TAnhYJAIpAV/bxLqn/
 3M0CtqxvkHIS5Bzyc1EYMOifB6pz9aodfA9V00v9CRoiH58cSKof3PoMWFU7Kc1xjnSg
 tp01IgoaWQoFmzNbsUe/LwtZRwmJJXNj43h2fWX0bFp8yUrKuEGXfk00Ko5a4BQH4DZF
 BDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=f078oh1g39w4WziWK7gA8cApPdqcfS6s3f3bv1Rg6UU=;
 b=mXmsTa5obbjMgIkIPiUKRZt4PnktupejSKU8adxRmsyEEUXWR8wTacRfm9wizWjinY
 RfG5I2Ne4S6a194yG0+Wx13LrlNSd83y9ymDVUvjXOsTYTGCzjYEMjwqLR8e86XYasI3
 XM40nt3FGUgWhyXSqw19FfsYDp2g5K/pJdQmBQpNTtR3OCgcGtHcCsy8Nu8e2uAAYoNl
 ryguSBsYYs1TnMVKDwMGrvRxrngNfpR8FRMoFHMzK2mUMtpC4nuhmYxoqu/CmMxevTeO
 MGWu2pGqrJKtfdBTl3LqK88m7uKyI5aopkH1iC10Tbqhjw99MSiKmU5sqDazyF9h92YO
 krZA==
X-Gm-Message-State: AOAM5323rcHBfUqi55pQwF0i5tk1xU3TcclTnVMKiY8oTzIjulj7exnK
 KaCfKiGd3GtET7i1I18aMASWa1BpniebwQ==
X-Google-Smtp-Source: ABdhPJzOZkXdCYqLMHBohZ7uMZvJAE6SjJEHVSUsD1xXvIhUuaTwa2lz01MCVkuT3Zq6kASTnxBj/Q==
X-Received: by 2002:a17:902:b908:b029:e6:3e0a:b3cc with SMTP id
 bf8-20020a170902b908b02900e63e0ab3ccmr18590950plb.68.1617497494480; 
 Sat, 03 Apr 2021 17:51:34 -0700 (PDT)
Received: from localhost ([1.132.158.137])
 by smtp.gmail.com with ESMTPSA id l19sm11596213pjt.16.2021.04.03.17.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Apr 2021 17:51:34 -0700 (PDT)
Date: Sun, 04 Apr 2021 10:51:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 04/14] powerpc/64s: avoid reloading (H)SRR registers if
 they are still valid
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-5-npiggin@gmail.com>
 <874kgo14qw.fsf@mpe.ellerman.id.au>
In-Reply-To: <874kgo14qw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1617497387.f97fep67d5.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of April 3, 2021 12:28 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_=
64.S
>> index ccf913cedd29..b466b3e1bb3f 100644
>> --- a/arch/powerpc/kernel/entry_64.S
>> +++ b/arch/powerpc/kernel/entry_64.S
>> @@ -64,6 +64,30 @@ exception_marker:
>>  	.section	".text"
>>  	.align 7
>> =20
>> +.macro DEBUG_SRR_VALID srr
>> +#ifdef CONFIG_PPC_RFI_SRR_DEBUG
>> +	.ifc \srr,srr
>> +	mfspr	r11,SPRN_SRR0
>> +	ld	r12,_NIP(r1)
>> +100:	tdne	r11,r12
>> +	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
>=20
> This always points at *this* line, not the caller. Works better with the
> patch below.

Good thinking.

Thanks,
Nick

>=20
> cheers
>=20
>=20
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_6=
4.S
> index b466b3e1bb3f..ada76b1279f9 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -64,26 +64,26 @@
>  	.section	".text"
>  	.align 7
> =20
> -.macro DEBUG_SRR_VALID srr
> +.macro DEBUG_SRR_VALID srr line
>  #ifdef CONFIG_PPC_RFI_SRR_DEBUG
>  	.ifc \srr,srr
>  	mfspr	r11,SPRN_SRR0
>  	ld	r12,_NIP(r1)
>  100:	tdne	r11,r12
> -	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
> +	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
>  	mfspr	r11,SPRN_SRR1
>  	ld	r12,_MSR(r1)
>  100:	tdne	r11,r12
> -	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
> +	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
>  	.else
>  	mfspr	r11,SPRN_HSRR0
>  	ld	r12,_NIP(r1)
>  100:	tdne	r11,r12
> -	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
> +	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
>  	mfspr	r11,SPRN_HSRR1
>  	ld	r12,_MSR(r1)
>  100:	tdne	r11,r12
> -	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
> +	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
>  	.endif
>  #endif
>  .endm
> @@ -358,7 +358,7 @@ END_BTB_FLUSH_SECTION
>  	mtspr	SPRN_SRR0,r4
>  	mtspr	SPRN_SRR1,r5
>  1:
> -	DEBUG_SRR_VALID srr
> +	DEBUG_SRR_VALID srr __LINE__
> =20
>  BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1			/* to clear the reservation */
> @@ -753,7 +753,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	stb	r4,PACAHSRR_VALID(r13)
>  #endif
>  	.endif
> -	DEBUG_SRR_VALID \srr
> +	DEBUG_SRR_VALID \srr __LINE__
> =20
>  BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1		/* to clear the reservation */
> @@ -825,7 +825,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS=
)
>  	stb	r4,PACAHSRR_VALID(r13)
>  #endif
>  	.endif
> -	DEBUG_SRR_VALID \srr
> +	DEBUG_SRR_VALID \srr __LINE__
> =20
>  BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1		/* to clear the reservation */
>=20
