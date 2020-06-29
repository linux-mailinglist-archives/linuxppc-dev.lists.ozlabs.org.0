Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B36EF20CC91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 06:52:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wFTs1Pp1zDqYL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 14:52:33 +1000 (AEST)
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
 header.s=20161025 header.b=V1HprWoP; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wFSG1gy6zDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 14:51:08 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id l6so4434186pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 21:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=LEQvNKw5DwU9G0VTJj3Mv6sAcui8a8Omb3EiRHjYCLM=;
 b=V1HprWoPp96YuB1djJIg1pH4gOiN3auBMPWFa93n/C4cVzm+r47sWFgey74blHEJ7q
 ndQke/M3bPnLyxwGevqaq/R6XrprkcoxSFM9YGWDQlgcd2oczg85uXGFVf/S4augFvmg
 Qfj79TxDDaKlnWhOXN94ALlEociRHhxBDXalHdq/IrcNgxaPcAoJRgX0IN5zlXFxsEnX
 TE0PV9tP+JQ1pT3vUVcdRwFYmH5onoZS7NC0bFM1hja6Z7P8aQ+XK6ZIyCScKrY1YxkP
 JAV1dGSPwe+HLqnsd7jAIw0RKtVIkgC7sWcRNmlFK49vW/JON1vpfdCFbGdxMGYX2KiD
 t1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LEQvNKw5DwU9G0VTJj3Mv6sAcui8a8Omb3EiRHjYCLM=;
 b=c/Rb8F117J2TrPGuhOotd0FLiCkQQMYnl9CEbAGYeBx0jS3Ljh3XNQeV7TvYvhb910
 4Xz9jZ09pGGTvKojUcmCfjwpDZwv6VtzUOwzKuGRwlkp+PyHGelxk7ednR33yFG7BPgR
 c5jY76IvUsgXsMDzm42ptOpA4AbYPY3PGXNTIOL3C/KbWBPXpPB3tqF1SubqmOhfzk1W
 RxkAqyWEzSgW45BaOlXIwrDddynT0H/BtFnDU158LTC300nhTr7Nq5NbQiLxb89bpwWb
 yB2yBma0rRxxt3nKt/ahHdmiCKka8NWwCSYYYJe5ydJ3K9kdHckUqAshkRCExSC4H+1d
 7y+Q==
X-Gm-Message-State: AOAM531kL9AP5K9z6VCKTVKadSvNf/wgVR0QAJohGuG3ByjOai8Nz7XG
 xjgSrKTqh7e9Bc0i8qtZidxyeFFE
X-Google-Smtp-Source: ABdhPJxq6O3KdOrMrVnHVZimRvVFS36zSFc8jmXzzjm9+zLFYi06y3So9vtcBaW4qBMQ/Iuq86F1qw==
X-Received: by 2002:a17:902:fe85:: with SMTP id
 x5mr3859718plm.282.1593406264776; 
 Sun, 28 Jun 2020 21:51:04 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id e18sm1757921pff.37.2020.06.28.21.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 21:51:04 -0700 (PDT)
Date: Mon, 29 Jun 2020 14:50:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: remove PROT_SAO support
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200607120209.463501-1-npiggin@gmail.com>
 <87d064g692.fsf@mpe.ellerman.id.au>
In-Reply-To: <87d064g692.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1593404274.m02qxr29yf.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of June 12, 2020 4:14 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> ISA v3.1 does not support the SAO storage control attribute required to
>> implement PROT_SAO. PROT_SAO was used by specialised system software
>> (Lx86) that has been discontinued for about 7 years, and is not thought
>> to be used elsewhere, so removal should not cause problems.
>>
>> We rather remove it than keep support for older processors, because
>> live migrating guest partitions to newer processors may not be possible
>> if SAO is in use.
>=20

Thakns for the review, sorry got distracted...

> They key details being:
>  - you don't remove PROT_SAO from the uapi header, so code using the
>    definition will still build.
>  - you change arch_validate_prot() to reject PROT_SAO, which means code
>    using it will see a failure from mmap() at runtime.

Yes.

> This obviously risks breaking userspace, even if we think it won't in
> practice. I guess we don't really have any option given the hardware
> support is being dropped.
>=20
> Can you repost with a wider Cc list, including linux-mm and linux-arch?

Will do.

> I wonder if we should add a comment to the uapi header, eg?
>=20
> diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/=
uapi/asm/mman.h
> index c0c737215b00..d4fdbe768997 100644
> --- a/arch/powerpc/include/uapi/asm/mman.h
> +++ b/arch/powerpc/include/uapi/asm/mman.h
> @@ -11,7 +11,7 @@
>  #include <asm-generic/mman-common.h>
> =20
> =20
> -#define PROT_SAO	0x10		/* Strong Access Ordering */
> +#define PROT_SAO	0x10		/* Unsupported since v5.9 */
> =20
>  #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
>  #define MAP_NORESERVE   0x40            /* don't reserve swap pages */

Yeah that makes sense.

>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc=
/include/asm/book3s/64/pgtable.h
>> index f17442c3a092..d9e92586f8dc 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -20,9 +20,13 @@
>>  #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
>>  #define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
>>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
>> -#define _PAGE_SAO		0x00010 /* Strong access order */
>> +
>> +#define _PAGE_CACHE_CTL		0x00030 /* Bits for the folowing cache modes *=
/
>> +			/*	No bits set is normal cacheable memory */
>> +			/*	0x00010 unused, is SAO bit on radix POWER9 */
>>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
>>  #define _PAGE_TOLERANT		0x00030 /* tolerant memory, cache inhibited */
>> +
>=20
> Why'd you do it that way vs just dropping _PAGE_SAO from the or below?

Just didn't like _PAGE_CACHE_CTL depending on values of the variants=20
that we use.

>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/=
asm/cputable.h
>> index bac2252c839e..c7e923b0000a 100644
>> --- a/arch/powerpc/include/asm/cputable.h
>> +++ b/arch/powerpc/include/asm/cputable.h
>> @@ -191,7 +191,6 @@ static inline void cpu_feature_keys_init(void) { }
>>  #define CPU_FTR_SPURR			LONG_ASM_CONST(0x0000000001000000)
>>  #define CPU_FTR_DSCR			LONG_ASM_CONST(0x0000000002000000)
>>  #define CPU_FTR_VSX			LONG_ASM_CONST(0x0000000004000000)
>> -#define CPU_FTR_SAO			LONG_ASM_CONST(0x0000000008000000)
>=20
> Can you do:
>=20
> +// Free				LONG_ASM_CONST(0x0000000008000000)

Yes.

>=20
>> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/inc=
lude/asm/kvm_book3s_64.h
>> index 9bb9bb370b53..579c9229124b 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
>> @@ -400,7 +400,8 @@ static inline bool hpte_cache_flags_ok(unsigned long=
 hptel, bool is_ci)
>> =20
>>  	/* Handle SAO */
>>  	if (wimg =3D=3D (HPTE_R_W | HPTE_R_I | HPTE_R_M) &&
>> -	    cpu_has_feature(CPU_FTR_ARCH_206))
>> +	    cpu_has_feature(CPU_FTR_ARCH_206) &&
>> +	    !cpu_has_feature(CPU_FTR_ARCH_31))
>>  		wimg =3D HPTE_R_M;
>=20
> Shouldn't it reject that combination if the host can't support it?
>=20
> Or I guess it does, but yikes that code is not clear.

Yeah, took me a bit to work that out.

>> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/=
mman.h
>> index d610c2e07b28..43a62f3e21a0 100644
>> --- a/arch/powerpc/include/asm/mman.h
>> +++ b/arch/powerpc/include/asm/mman.h
>> @@ -13,38 +13,24 @@
>>  #include <linux/pkeys.h>
>>  #include <asm/cpu_has_feature.h>
>> =20
>> -/*
>> - * This file is included by linux/mman.h, so we can't use cacl_vm_prot_=
bits()
>> - * here.  How important is the optimization?
>> - */
>=20
> This comment seems confused, but also unrelated to this patch?

Yeah.
=20
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_=
cpu_ftrs.c
>> index 3a409517c031..8d2e4043702f 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -622,7 +622,7 @@ static struct dt_cpu_feature_match __initdata
>>  	{"processor-control-facility-v3", feat_enable_dbell, CPU_FTR_DBELL},
>>  	{"processor-utilization-of-resources-register", feat_enable_purr, 0},
>>  	{"no-execute", feat_enable, 0},
>> -	{"strong-access-ordering", feat_enable, CPU_FTR_SAO},
>> +	{"strong-access-ordering", feat_enable, 0},
>=20
> Would it make more sense to drop it entirely? Or leave it commented out.

Probably would, yes.

Thanks,
Nick
