Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB830DC9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 15:24:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW3pW2hgHzF3Rp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 01:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=b6TzmQGy; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW1nh2pgjzDwwq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 23:53:25 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id m6so16600696pfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOtl+4N3n7HC1FTJVHyIZDNqxeDX06oURAfIAKcKhm0=;
 b=b6TzmQGyTZeGrsFIAcz7KusQs/jmT0+vFcqvfxr55jjPJxAol7u0OU0gfk1kgTJ8hI
 VlpH16VqRzmxaOo7ppn/zN/ZGfe5NUZ0KQjKUmmTLGYqbu4mgxp/Xer2ptBT35Za0wzg
 67jt37ic3jN53srVEPGNwlD1ls6cPnMTzbH4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=LOtl+4N3n7HC1FTJVHyIZDNqxeDX06oURAfIAKcKhm0=;
 b=EUBykFhPaAfkWGu3x6k+Upb3N0YiQbCAnsiqJdUo/2kG5I7iIOkQtyHZmdzAZ3n8OX
 W2gGt8f31qqSWSrhK2RnR4LV18V4cy4U0Tfc8AxxoHlnrxVTz85RG/9VnwrdyDKActuJ
 0zJYaYY8U1qayoKwYQedvoY6owbmtEh/yfKT5yaE2/jWXeKxjLSOcvBWO75214D/XIUS
 iO7fjQvxfD1hRBqykjZ+bH1/a+Tm9gfFDxaSh34Te6GRUwB9MCIkP/j1zzTuZ6srniSg
 xNNTmUmj8i1quMPhwf5h1awe3d/wlhf2qEGcMX+se2ty2rmSpTq3x98oFceWc6HFo2q+
 5ZXg==
X-Gm-Message-State: AOAM531OZ54P3gMaoHV3G7NzZ7w6Kma+TyCZaVUE+ber0vKjY4d659Gm
 FTlv/q7gKcZqstLDp+v6+HxuDg==
X-Google-Smtp-Source: ABdhPJxoxaYMqJUUweFxjd8UeCMfbqbN1x4UPxdu1S7fFkwQ6XsD5JnWtAJve9gYCSqzPSGZrPc2TQ==
X-Received: by 2002:a63:ff4f:: with SMTP id s15mr3522513pgk.62.1612356801346; 
 Wed, 03 Feb 2021 04:53:21 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1c59-4eca-f876-fd51.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1c59:4eca:f876:fd51])
 by smtp.gmail.com with ESMTPSA id 9sm2288251pfy.110.2021.02.03.04.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 04:53:20 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v10 6/6] powerpc: Book3S 64-bit outline-only KASAN support
In-Reply-To: <4b790789-052f-76de-a289-726517026efd@csgroup.eu>
References: <20210203115946.663273-1-dja@axtens.net>
 <20210203115946.663273-7-dja@axtens.net>
 <4b790789-052f-76de-a289-726517026efd@csgroup.eu>
Date: Wed, 03 Feb 2021 23:53:17 +1100
Message-ID: <875z39wbwi.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 03/02/2021 =C3=A0 12:59, Daniel Axtens a =C3=A9crit=C2=A0:
>> Implement a limited form of KASAN for Book3S 64-bit machines running und=
er
>> the Radix MMU, supporting only outline mode.
>>=20
>
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process=
.c
>> index a66f435dabbf..9a6fd603f0e7 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -2157,8 +2157,8 @@ void show_stack(struct task_struct *tsk, unsigned =
long *stack,
>>   			break;
>>=20=20=20
>>   		stack =3D (unsigned long *) sp;
>> -		newsp =3D stack[0];
>> -		ip =3D stack[STACK_FRAME_LR_SAVE];
>> +		newsp =3D READ_ONCE_NOCHECK(stack[0]);
>> +		ip =3D READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
>>   		if (!firstframe || ip !=3D lr) {
>>   			printk("%s["REG"] ["REG"] %pS",
>>   				loglvl, sp, ip, (void *)ip);
>> @@ -2176,17 +2176,19 @@ void show_stack(struct task_struct *tsk, unsigne=
d long *stack,
>>   		 * See if this is an exception frame.
>>   		 * We look for the "regshere" marker in the current frame.
>>   		 */
>> -		if (validate_sp(sp, tsk, STACK_INT_FRAME_SIZE)
>> -		    && stack[STACK_FRAME_MARKER] =3D=3D STACK_FRAME_REGS_MARKER) {
>> +		if (validate_sp(sp, tsk, STACK_INT_FRAME_SIZE) &&
>> +		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) =3D=3D
>> +		     STACK_FRAME_REGS_MARKER)) {
>>   			struct pt_regs *regs =3D (struct pt_regs *)
>>   				(sp + STACK_FRAME_OVERHEAD);
>>=20=20=20
>> -			lr =3D regs->link;
>> +			lr =3D READ_ONCE_NOCHECK(regs->link);
>>   			printk("%s--- interrupt: %lx at %pS\n",
>> -			       loglvl, regs->trap, (void *)regs->nip);
>> +			       loglvl, READ_ONCE_NOCHECK(regs->trap),
>> +			       (void *)READ_ONCE_NOCHECK(regs->nip));
>>   			__show_regs(regs);
>>   			printk("%s--- interrupt: %lx\n",
>> -			       loglvl, regs->trap);
>> +			       loglvl, READ_ONCE_NOCHECK(regs->trap));
>>=20=20=20
>>   			firstframe =3D 1;
>>   		}
>
>
> The above changes look like a bug fix not directly related to KASAN. Shou=
ld be split out in another=20
> patch I think.

That code corresponds to the following part of the patch description:

| - Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
|   generic code, arm64, s390 and x86 all do this for similar sorts of
|   reasons: when unwinding a stack, we might touch memory that KASAN has
|   marked as being out-of-bounds. In our case we often get this when
|   checking for an exception frame because we're checking an arbitrary
|   offset into the stack frame.
|
|   See commit 20955746320e ("s390/kasan: avoid false positives during stack
|   unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
|   frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
|   Prevent KASAN false positive warnings") and commit 6e22c8366416
|   ("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer")

include/linux/compiler.h describes it as follows:

/*
 * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need
 * to hide memory access from KASAN.
 */

So I think it is sufficently connected with KASAN to be in this patch.

Kind regards,
Daniel

>
> Christophe
