Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61149977DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 13:23:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D4zG22SLzDr6c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 21:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="m+KSDE8s"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D4wd01Z4zDqwt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 21:21:03 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v12so1221398pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YU8hngxd9Y6vV6+91bY1+WLXg1qM6s2g8v9aYsikrX0=;
 b=m+KSDE8sanJJkhEaqC2X8t3NIh2wq10abqwO5HRkztdpKQkTgXw5ni5pTL08uSKu2T
 Sd3mj3haMQVmhD5KtMGBX+HKdataiw79y7lqJJRX9nt+Rv4wZYMTcyKWJoTKidYdPBT/
 XqFfwYFpd3lgtyGWSP0h3IrOA9eKQ7iltx3CPChoThxpWZo9eK6fUEbzAMrmLlcQGh83
 VWo5GMEvJ/o2uZOWdU/lN1AzKZuL8/fP8FEdV69p+zWU4XeXGUxqJiNFLFHOFHG7WY2v
 wIr+bn3LkIR77NRpNb3k5qATR0rPH7mEsXUQGmlqcOAj2Qzzm1BQCoTs5FmZJhEwq7zJ
 T+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=YU8hngxd9Y6vV6+91bY1+WLXg1qM6s2g8v9aYsikrX0=;
 b=kdxZ6rpHBA0UgKDg/w2CaYA3WAA2zHG+J9iq+8xMirGulS4SWcTwjDy3dOA0WhSR9+
 qoBXlFsSjgwEzPGvaxyWFWWBOR6/B8splNlULsFdaqZP7JzfCtSxkdaWgFyTFZzZNdPv
 cTjWk96H0qXwYC6L1Y0JxWj0d3g5r7ii+VXilyY/9eWfw7VGxhgZyPXsNKVOsqDT3VXS
 K726Yre8XOMys9EWEKBlb55ZRe7F5+khkm/WcPL9jbI0RTRH89lpo3ZrQ9Kum4oeApsp
 uFE9GYKe93YSdQG19IlmFMlKb9rcQBAhY0YsNOr9wdMKXe+z9NScU3iaIsNc6FakKdoV
 pzDA==
X-Gm-Message-State: APjAAAXOkDeQtMjUVlkV5EPuvBmREk1fwehMxN8k9k5myyzKiShqxr+7
 /77IXW2tVEQO0eVLYSgVrQ99Xw==
X-Google-Smtp-Source: APXvYqxb50XJQ3zhnSwFQFdxrXp7+1GjTeexBMe3PgVLtyNETbM4gTwtZiKjvVRtdg3EEnQ2nuCfsA==
X-Received: by 2002:a62:ab13:: with SMTP id p19mr35196784pff.20.1566386461520; 
 Wed, 21 Aug 2019 04:21:01 -0700 (PDT)
Received: from localhost ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id g36sm39398217pgb.78.2019.08.21.04.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 04:21:00 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
In-Reply-To: <3724e1ba-d0f8-7247-73c2-6d83a3dbd040@c-s.fr>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
 <3724e1ba-d0f8-7247-73c2-6d83a3dbd040@c-s.fr>
Date: Wed, 21 Aug 2019 16:50:58 +0530
Message-ID: <874l2apxwl.fsf@santosiv.in.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 21/08/2019 =C3=A0 11:29, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> __get_datapage() is only a few instructions to retrieve the
>> address of the page where the kernel stores data to the VDSO.
>>=20
>> By inlining this function into its users, a bl/blr pair and
>> a mflr/mtlr pair is avoided, plus a few reg moves.
>>=20
>> clock-gettime-monotonic: syscall: 514 nsec/call  396 nsec/call
>> clock-gettime-monotonic:    libc: 25 nsec/call   24 nsec/call
>> clock-gettime-monotonic:    vdso: 20 nsec/call   20 nsec/call
>> clock-getres-monotonic: syscall: 347 nsec/call   372 nsec/call
>> clock-getres-monotonic:    libc: 19 nsec/call    19 nsec/call
>> clock-getres-monotonic:    vdso: 10 nsec/call    10 nsec/call
>> clock-gettime-monotonic-coarse: syscall: 511 nsec/call   396 nsec/call
>> clock-gettime-monotonic-coarse:    libc: 23 nsec/call    21 nsec/call
>> clock-gettime-monotonic-coarse:    vdso: 15 nsec/call    13 nsec/call
>> clock-gettime-realtime: syscall: 526 nsec/call   405 nsec/call
>> clock-gettime-realtime:    libc: 24 nsec/call    23 nsec/call
>> clock-gettime-realtime:    vdso: 18 nsec/call    18 nsec/call
>> clock-getres-realtime: syscall: 342 nsec/call    372 nsec/call
>> clock-getres-realtime:    libc: 19 nsec/call     19 nsec/call
>> clock-getres-realtime:    vdso: 10 nsec/call     10 nsec/call
>> clock-gettime-realtime-coarse: syscall: 515 nsec/call    373 nsec/call
>> clock-gettime-realtime-coarse:    libc: 23 nsec/call     22 nsec/call
>> clock-gettime-realtime-coarse:    vdso: 14 nsec/call     13 nsec/call
>
> I think you should only put the measurements on vdso calls, and only the=
=20
> ones that are impacted by the change. For exemple, getres function=20
> doesn't use __get_datapage so showing it here is pointless.
>
> gettimeofday should be shown there as it uses __get_datapage()
>
>
>>=20
>> Based on the patch by Christophe Leroy <christophe.leroy@c-s.fr> for vds=
o32.
>>=20
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>>=20
>> except for a couple of calls (1 or 2 nsec reduction), there are no
>> improvements in the call times. Or is 10 nsec the minimum granularity??
>
> Maybe the ones that show no improvements are the ones that don't use=20
> __get_datapage() at all ...

Yes makes sense.

>
>>=20
>> So I don't know if its even worth updating vdso64 except to keep vdso32 =
and
>> vdso64 equal.
>
> 2ns on a 15ns call is 13% so it is worth it I think.

true. Since datapage.h is the same for both 32 and 64, may be we should put
it in include/asm.

Thanks,
Santosh
>
> Christophe
>
>
>>=20
>>=20
>>   arch/powerpc/kernel/vdso64/cacheflush.S   | 10 ++++----
>>   arch/powerpc/kernel/vdso64/datapage.S     | 29 ++++-------------------
>>   arch/powerpc/kernel/vdso64/datapage.h     | 10 ++++++++
>>   arch/powerpc/kernel/vdso64/gettimeofday.S |  8 ++++---
>>   4 files changed, 24 insertions(+), 33 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/vdso64/datapage.h
>>=20
>> diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kern=
el/vdso64/cacheflush.S
>> index 3f92561a64c4..30e8b0d29bea 100644
>> --- a/arch/powerpc/kernel/vdso64/cacheflush.S
>> +++ b/arch/powerpc/kernel/vdso64/cacheflush.S
>> @@ -10,6 +10,8 @@
>>   #include <asm/vdso.h>
>>   #include <asm/asm-offsets.h>
>>=20=20=20
>> +#include "datapage.h"
>> +
>>   	.text
>>=20=20=20
>>   /*
>> @@ -24,14 +26,12 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>>     .cfi_startproc
>>   	mflr	r12
>>     .cfi_register lr,r12
>> -	mr	r11,r3
>> -	bl	V_LOCAL_FUNC(__get_datapage)
>> +	get_datapage	r11, r0
>>   	mtlr	r12
>> -	mr	r10,r3
>>=20=20=20
>>   	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
>>   	addi	r5,r7,-1
>> -	andc	r6,r11,r5		/* round low to line bdy */
>> +	andc	r6,r3,r5		/* round low to line bdy */
>>   	subf	r8,r6,r4		/* compute length */
>>   	add	r8,r8,r5		/* ensure we get enough */
>>   	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
>> @@ -48,7 +48,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>>=20=20=20
>>   	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
>>   	addi	r5,r7,-1
>> -	andc	r6,r11,r5		/* round low to line bdy */
>> +	andc	r6,r3,r5		/* round low to line bdy */
>>   	subf	r8,r6,r4		/* compute length */
>>   	add	r8,r8,r5
>>   	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
>> diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel=
/vdso64/datapage.S
>> index dc84f5ae3802..8712f57c931c 100644
>> --- a/arch/powerpc/kernel/vdso64/datapage.S
>> +++ b/arch/powerpc/kernel/vdso64/datapage.S
>> @@ -11,34 +11,13 @@
>>   #include <asm/unistd.h>
>>   #include <asm/vdso.h>
>>=20=20=20
>> +#include "datapage.h"
>> +
>>   	.text
>>   .global	__kernel_datapage_offset;
>>   __kernel_datapage_offset:
>>   	.long	0
>>=20=20=20
>> -V_FUNCTION_BEGIN(__get_datapage)
>> -  .cfi_startproc
>> -	/* We don't want that exposed or overridable as we want other objects
>> -	 * to be able to bl directly to here
>> -	 */
>> -	.protected __get_datapage
>> -	.hidden __get_datapage
>> -
>> -	mflr	r0
>> -  .cfi_register lr,r0
>> -
>> -	bcl	20,31,data_page_branch
>> -data_page_branch:
>> -	mflr	r3
>> -	mtlr	r0
>> -	addi	r3, r3, __kernel_datapage_offset-data_page_branch
>> -	lwz	r0,0(r3)
>> -  .cfi_restore lr
>> -	add	r3,r0,r3
>> -	blr
>> -  .cfi_endproc
>> -V_FUNCTION_END(__get_datapage)
>> -
>>   /*
>>    * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
>>    *
>> @@ -53,7 +32,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
>>   	mflr	r12
>>     .cfi_register lr,r12
>>   	mr	r4,r3
>> -	bl	V_LOCAL_FUNC(__get_datapage)
>> +	get_datapage	r3, r0
>>   	mtlr	r12
>>   	addi	r3,r3,CFG_SYSCALL_MAP64
>>   	cmpldi	cr0,r4,0
>> @@ -75,7 +54,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
>>     .cfi_startproc
>>   	mflr	r12
>>     .cfi_register lr,r12
>> -	bl	V_LOCAL_FUNC(__get_datapage)
>> +	get_datapage	r3, r0
>>   	ld	r3,CFG_TB_TICKS_PER_SEC(r3)
>>   	mtlr	r12
>>   	crclr	cr0*4+so
>> diff --git a/arch/powerpc/kernel/vdso64/datapage.h b/arch/powerpc/kernel=
/vdso64/datapage.h
>> new file mode 100644
>> index 000000000000..f2f0da0f65f3
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/vdso64/datapage.h
>> @@ -0,0 +1,10 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +.macro get_datapage ptr, tmp
>> +	bcl	20,31,888f
>> +888:
>> +	mflr	\ptr
>> +	addi	\ptr, \ptr, __kernel_datapage_offset - 888b
>> +	lwz	\tmp, 0(\ptr)
>> +	add	\ptr, \tmp, \ptr
>> +.endm
>> diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/ke=
rnel/vdso64/gettimeofday.S
>> index 07bfe33fe874..7bcc879392cc 100644
>> --- a/arch/powerpc/kernel/vdso64/gettimeofday.S
>> +++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
>> @@ -12,6 +12,8 @@
>>   #include <asm/asm-offsets.h>
>>   #include <asm/unistd.h>
>>=20=20=20
>> +#include "datapage.h"
>> +
>>   	.text
>>   /*
>>    * Exact prototype of gettimeofday
>> @@ -26,7 +28,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
>>=20=20=20
>>   	mr	r11,r3			/* r11 holds tv */
>>   	mr	r10,r4			/* r10 holds tz */
>> -	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
>> +	get_datapage	r3, r0
>>   	cmpldi	r11,0			/* check if tv is NULL */
>>   	beq	2f
>>   	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
>> @@ -71,7 +73,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
>>   	mflr	r12			/* r12 saves lr */
>>     .cfi_register lr,r12
>>   	mr	r11,r4			/* r11 saves tp */
>> -	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
>> +	get_datapage	r3, r0		/* get data page */
>>   	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
>>   	ori	r7,r7,NSEC_PER_SEC@l
>>   	beq	cr5,70f
>> @@ -218,7 +220,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>>     .cfi_register lr,r12
>>=20=20=20
>>   	mr	r11,r3			/* r11 holds t */
>> -	bl	V_LOCAL_FUNC(__get_datapage)
>> +	get_datapage	r3, r0
>>=20=20=20
>>   	ld	r4,STAMP_XTIME+TSPC64_TV_SEC(r3)
>>=20=20=20
>>=20
