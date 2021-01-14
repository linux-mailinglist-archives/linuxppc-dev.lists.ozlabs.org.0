Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CE2F59B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 05:00:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGVvv0sxfzDrhd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 15:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dC/f3XPA; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGVt35XsGzDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 14:58:47 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id c132so2898715pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 19:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=soCk39Hbp4BQXp4gbhqcrhvVUxMccSQmgu3kXasBHUA=;
 b=dC/f3XPAE6bJkEnIQJSXoDiKp8uzhG57SIV6PoP8KFmWqxRuZH2KmY+l0YbqvPZ4ZM
 Fe+H6kKbJ7Z7bQ1OnzpEpfYExxI7s+8EgZdlRCu9RxyHVMAXkDNZNIHMCrf3dKXVcMSm
 iWgUbN8Z9hVb5WbxteRPuKM7UxtZuNlAmfBw2RnChHhXsla87L7mXUIHJXjOXuNfyp+a
 JDpkRWuaqhoOwqsLLuSNY3zjWqJaXYpmGnNlaWVd4SfTXIUgYHetjOiX9YcDWKo2EM2A
 lFWvLWqav9SzjLbvW1SnnzZo/fFGr8oscs4zpp1lAk6N1qHPVPiGDL5Uq0jIWJvUqv3M
 rd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=soCk39Hbp4BQXp4gbhqcrhvVUxMccSQmgu3kXasBHUA=;
 b=WkLaznb6NukAUTtXmRj/nOBsVLx7RJd6LxqBxkF6HW8alLfdll+W41+UDEgrOyosl4
 4zIEtAt2Z6Qt9j8e8xgFFRJs7PnCIa71wdG3cPGLmmIObtrkX/u4sWm/jlopO41Y931+
 DBf283eEgXB7NyPBYpJPmdK2S4eZHCQ32GjlB7XWMbaK08yFBbBl15194C+DcWsDUcBx
 ilYlQWSolevtecfnCtbYGItP9HyQWg/x7qoew7Hoda0n7qsER4dLrPNcCAmSoVoCl+ar
 X8kGuM3XLGGjSsXh9lcR1ptI1psXtpnu8cHc8khhd5p09Ne21eKTI7MXarxFOGXLAXHy
 YK6A==
X-Gm-Message-State: AOAM533CzjCOlXD/KiverSFFG8VHWtrv0/7VLoRhQS+eEtLu+VzL6+V4
 FjMTMAsya2bk7AIuAny7s+c=
X-Google-Smtp-Source: ABdhPJy2KRGuShRihuH7aS9d8YgUeYNp0vnEdT1+jz8bA47/LhtDHhRBYZz7/3TOrpwajdFnqDpq2w==
X-Received: by 2002:a62:920c:0:b029:1ae:89f2:8c69 with SMTP id
 o12-20020a62920c0000b02901ae89f28c69mr5661381pfd.56.1610596723179; 
 Wed, 13 Jan 2021 19:58:43 -0800 (PST)
Received: from localhost ([1.132.230.89])
 by smtp.gmail.com with ESMTPSA id x1sm3787940pfc.112.2021.01.13.19.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 19:58:42 -0800 (PST)
Date: Thu, 14 Jan 2021 13:58:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 17/21] powerpc/64: entry cpu time accounting in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-18-npiggin@gmail.com>
 <3304762a-d6d6-df70-5546-e7e4dc2d3380@csgroup.eu>
In-Reply-To: <3304762a-d6d6-df70-5546-e7e4dc2d3380@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610596381.is1o9lsf5s.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 14, 2021 1:05 am:
>=20
>=20
> Le 13/01/2021 =C3=A0 08:32, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need for this to be in asm, use the new intrrupt entry wrapp=
er.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/interrupt.h |  7 +++++++
>>   arch/powerpc/include/asm/ppc_asm.h   | 24 ------------------------
>>   arch/powerpc/kernel/exceptions-64e.S |  1 -
>>   arch/powerpc/kernel/exceptions-64s.S |  5 -----
>>   4 files changed, 7 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 6eba7c489753..e278dffe7657 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -4,6 +4,7 @@
>>  =20
>>   #include <linux/context_tracking.h>
>>   #include <linux/hardirq.h>
>> +#include <asm/cputime.h>
>>   #include <asm/ftrace.h>
>>  =20
>>   struct interrupt_state {
>> @@ -25,6 +26,9 @@ static inline void interrupt_enter_prepare(struct pt_r=
egs *regs, struct interrup
>>   	if (user_mode(regs)) {
>>   		CT_WARN_ON(ct_state() !=3D CONTEXT_USER);
>>   		user_exit_irqoff();
>> +
>> +		account_cpu_user_entry();
>=20
> Are interrupts still disabled here ? Otherwise you risk getting IRQ time =
accounted on user.

Yes. Only the handlers themselves will enable interrupts, with
interrupt_cond_local_irq_enable.

>=20
>> +		account_stolen_time();
>>   	} else {
>>   		/*
>>   		 * CT_WARN_ON comes here via program_check_exception,
>> @@ -38,6 +42,9 @@ static inline void interrupt_enter_prepare(struct pt_r=
egs *regs, struct interrup
>>   #ifdef CONFIG_PPC_BOOK3E_64
>>   	state->ctx_state =3D exception_enter();
>>   #endif
>> +
>> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) && user_mode(regs))
>> +		account_cpu_user_entry();
>=20
> Isn't this interrupt_enter_prepare() function called also on PPC32 ?
> Have you removed the ACCOUNT_CPU_USER_ENTRY() from entry_32.S ?

Yes and no, I was thinking of 64 only :( I can make that for 64E. 32-bit
could be another patch if you want it.

Thanks,
Nick
