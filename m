Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2E434481
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 07:08:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYzC70C4Yz2yb7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 16:08:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WAEM778o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WAEM778o; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYzBN0kLCz2yPc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 16:07:21 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id f5so21415984pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=4qRBUl8ilMlL7AbhZCVhfXHYvfLZs40f6ZLuXJgV5AI=;
 b=WAEM778o+/VP+r2gZ2bkH1Jt+KVxf92NQkaEw2iYlfvl77qgYQst421IMaiHbTxulC
 6FOAH2zkxIK6kSL+bBJID9iILSq1Dd4EgtW1R2vgIRjdFavE0CsEvEEFedm5juJa68k7
 GdDcMFp15pLkVpOXtpr+XhECTxrpaUl3gMDMu+AhJYf6PyWMpRR52zEzYu/4sgdhMbQ8
 7tUtBN8i5SwfAxJFVYwDIBgvWNkbKqUdw40L/7pfBUIiauClatiaP1oI6nZoyVBmnnBr
 uZQLlbOp26uTGiNuJnoVQFCaq0Rt7okM3IULuoGRH01BnCcT/ytaH5VpRvgjuDngG/UF
 lzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4qRBUl8ilMlL7AbhZCVhfXHYvfLZs40f6ZLuXJgV5AI=;
 b=DVZkdjFKL2kgV6Uqs8svdHTP5eA6F7+/h25ExIevXFv+nd0muBjM3wvOePDK2cU1Of
 UvPYQrd+nAoyv8wwtoUs0skxRZ78OJF0DX7KLFBKUEWei+81bZFn5tzs0ujQXLKoL6e2
 Zs7Wa0ZKWqA7pfVA/+xCtKqUAEUDz+HU5mz3mz6UmLGEDiktitGqH/Q+KJ7xaUb0a+dj
 G8u5Rq8EaQokBJfjNVLQ5Xjg16BPUUa0LZKMOfTWYPFavQu/zv/BEtqD0aGZLaH/I7T5
 75Va+iqOB+KkFLA3ItwPjhUlOtqmwQAOXD9DdFgmIx42EX3r1HgMfTMTuvkC0yLBLVP9
 Q9Ew==
X-Gm-Message-State: AOAM533Qyo9fjfcca3JnK+E9JEvxrLMygr2h08UD4A3u4PIImVL5G7vq
 /o17SvLACskcPkl30gXJP/sXGYk0v0g=
X-Google-Smtp-Source: ABdhPJzgYvv5sWIZw2yJE7yfdK9XMhuQIeN/E3L//oHL80gvJAWrnhL0dqq/DVL6PMnw1fzjqaR3qQ==
X-Received: by 2002:a63:b007:: with SMTP id h7mr31507596pgf.443.1634706435088; 
 Tue, 19 Oct 2021 22:07:15 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 r31sm4353852pjg.28.2021.10.19.22.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 22:07:14 -0700 (PDT)
Date: Wed, 20 Oct 2021 15:07:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 04/11] powerpc/64s: Move and rename do_bad_slb_fault as
 it is not hash specific
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211015154624.922960-1-npiggin@gmail.com>
 <20211015154624.922960-5-npiggin@gmail.com>
 <80ea8862-0843-02ae-791c-5c921c19803f@csgroup.eu>
In-Reply-To: <80ea8862-0843-02ae-791c-5c921c19803f@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634700588.gkw9nsnrzr.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 19, 2021 3:09 am:
>=20
>=20
> Le 15/10/2021 =C3=A0 17:46, Nicholas Piggin a =C3=A9crit=C2=A0:
>> slb.c is hash-specific SLB management, but do_bad_slb_fault deals with
>> segment interrupts that occur with radix MMU as well.
>> ---
>>   arch/powerpc/include/asm/interrupt.h |  2 +-
>>   arch/powerpc/kernel/exceptions-64s.S |  4 ++--
>>   arch/powerpc/mm/book3s64/slb.c       | 16 ----------------
>>   arch/powerpc/mm/fault.c              | 17 +++++++++++++++++
>>   4 files changed, 20 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index a1d238255f07..3487aab12229 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -564,7 +564,7 @@ DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
>>  =20
>>   /* slb.c */
>>   DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
>> -DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
>> +DECLARE_INTERRUPT_HANDLER(do_bad_segment_interrupt);
>>  =20
>>   /* hash_utils.c */
>>   DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index eaf1f72131a1..046c99e31d01 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -1430,7 +1430,7 @@ MMU_FTR_SECTION_ELSE
>>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>>   	std	r3,RESULT(r1)
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>> -	bl	do_bad_slb_fault
>> +	bl	do_bad_segment_interrupt
>>   	b	interrupt_return_srr
>>  =20
>>  =20
>> @@ -1510,7 +1510,7 @@ MMU_FTR_SECTION_ELSE
>>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>>   	std	r3,RESULT(r1)
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>> -	bl	do_bad_slb_fault
>> +	bl	do_bad_segment_interrupt
>>   	b	interrupt_return_srr
>>  =20
>>  =20
>> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/s=
lb.c
>> index f0037bcc47a0..31f4cef3adac 100644
>> --- a/arch/powerpc/mm/book3s64/slb.c
>> +++ b/arch/powerpc/mm/book3s64/slb.c
>> @@ -868,19 +868,3 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
>>   		return err;
>>   	}
>>   }
>> -
>> -DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
>> -{
>> -	int err =3D regs->result;
>> -
>> -	if (err =3D=3D -EFAULT) {
>> -		if (user_mode(regs))
>> -			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>> -		else
>> -			bad_page_fault(regs, SIGSEGV);
>> -	} else if (err =3D=3D -EINVAL) {
>> -		unrecoverable_exception(regs);
>> -	} else {
>> -		BUG();
>> -	}
>> -}
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index a8d0ce85d39a..53ddcae0ac9e 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -35,6 +35,7 @@
>>   #include <linux/kfence.h>
>>   #include <linux/pkeys.h>
>>  =20
>> +#include <asm/asm-prototypes.h>
>>   #include <asm/firmware.h>
>>   #include <asm/interrupt.h>
>>   #include <asm/page.h>
>> @@ -620,4 +621,20 @@ DEFINE_INTERRUPT_HANDLER(do_bad_page_fault_segv)
>>   {
>>   	bad_page_fault(regs, SIGSEGV);
>>   }
>> +
>> +DEFINE_INTERRUPT_HANDLER(do_bad_segment_interrupt)
>> +{
>> +	int err =3D regs->result;
>> +
>> +	if (err =3D=3D -EFAULT) {
>> +		if (user_mode(regs))
>> +			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>> +		else
>> +			bad_page_fault(regs, SIGSEGV);
>> +	} else if (err =3D=3D -EINVAL) {
>> +		unrecoverable_exception(regs);
>> +	} else {
>> +		BUG();
>> +	}
>> +}
>>   #endif
>>=20
>=20
> You could do something more flat:
>=20
> 	if (err =3D=3D -EINVAL)
> 		unrecoverable_exception(regs);
>=20
> 	BUG_ON(err !=3D -EFAULT);
>=20
> 	if (user_mode(regs))
> 		_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
> 	else
> 		bad_page_fault(regs, SIGSEGV);
>=20
> I know you are just moving existing code but moving code is always an=20
> opportunity to clean it without additional churn.
>=20

Hmm, moving code I prefer not to make any changes. I don't know if it's=20
that big an improvement to make the change here.

Thanks,
Nick
