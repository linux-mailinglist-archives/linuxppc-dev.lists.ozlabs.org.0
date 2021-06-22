Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E143AFFA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 10:54:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Kw90gSVz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 18:54:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=G9QndShc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G9QndShc; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Kvh0dPgz2xts
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 18:54:23 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id i4so6389058plt.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=YnutXW8q7xnFXMk3Qg9Qjg1uKHTZx+7Dh5QYuxJ/psU=;
 b=G9QndShcZlHiGhCERPbz38ZaRdt/UjIUzW8e2lioUYtBlXt9cVQ5NmN1KADPKuIFlH
 Ix+paya0VicC2KdHmlpuWLLL3kgffYeQnPDXYVnW+4TYc3Qtbfg+kfj2U0dg75Ycp3Gp
 VrTguHneTIPc3Pipnk+bu2yQFqK/u4WRKa+THEWTN7bTe311tYXfciTqJWvjRzjn0IGz
 jZq5HSvCNjW9KmnN/V8DwKHaXVYb4e932YgIcN+vJm9oGz29e/APVZecuLlq3mu/UBWu
 nC8Vmr73S1JNpeYhZNZlVevEWLU4/x46WVLr0hXIXackTjSQxAKIrJHCALsWY8LDMkUB
 RY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YnutXW8q7xnFXMk3Qg9Qjg1uKHTZx+7Dh5QYuxJ/psU=;
 b=J+USh+v/Wzu2DiK+Vn0kaxplaN8NQbem/uOygQY0Ink0OEesEGpox+r5hM52kfCAOK
 FjF9W2gOE2BvkpqzVK0Gagj0E1lPkFH8MGrv7dQCwWwqu4kbK9jbq/wzBl4e+FUsyQoG
 Rkgpz0NApY5eP0SkLEKL9UjR40WNDdtucKIQ+KU4wY60jqmkDULYOR1KqIT1wrru4zTo
 YMMbI4wpmuf522c6qw4mnjiYfU4Y7QJNBpe2nhgpzCY/9b/EWIPh44a5GZh2A8Ycaijs
 /ms3wIk+bACJrhbBrZ2yCo7QXAEmVhDcfTfSDYP1Je6Xw+IWj06nvCRWg6F8vX6GJw/1
 OyfA==
X-Gm-Message-State: AOAM532gWsOlYkZLeKc9FMnF5zaH1RuZY8b6QDL46nMkliuogzQ32cW1
 Zlkpet393ySp/iHFO7J5yDLJT6kPjyw=
X-Google-Smtp-Source: ABdhPJzxBoitI4e0WhJf4R2vFGOJA6v3j0CbnbBOEDYQ7npaRxRiXFkl6vI0mY1seNDJYNktlaMQEQ==
X-Received: by 2002:a17:90a:f290:: with SMTP id
 fs16mr2854584pjb.202.1624352057730; 
 Tue, 22 Jun 2021 01:54:17 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id h24sm1693799pjv.27.2021.06.22.01.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:54:17 -0700 (PDT)
Date: Tue, 22 Jun 2021 18:54:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64s/interrupt: Check and fix srr_valid
 without crashing
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210622060416.548187-1-npiggin@gmail.com>
 <20210622060416.548187-3-npiggin@gmail.com>
 <21088c39-77fb-97d5-6fe9-76ae4ef4b439@csgroup.eu>
In-Reply-To: <21088c39-77fb-97d5-6fe9-76ae4ef4b439@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1624351871.ezysew4q8c.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of June 22, 2021 4:47 pm:
>=20
>=20
> Le 22/06/2021 =C3=A0 08:04, Nicholas Piggin a =C3=A9crit=C2=A0:
>> The PPC_RFI_SRR_DEBUG check added by patch "powerpc/64s: avoid reloading
>> (H)SRR registers if they are still valid" has a few deficiencies. It
>> does not fix the actual problem, it's not enabled by default, and it
>> causes a program check interrupt which can cause more difficulties.
>>=20
>> However there are a lot of paths which may clobber SRRs or change return
>> regs, and difficult to have a high confidence that all paths are covered
>> without wider testing.
>>=20
>> Add a relatively low overhead always-enabled check that catches most
>> such cases, reports once, and fixes it so the kernel can continue.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/interrupt.c | 58 +++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>=20
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/inter=
rupt.c
>> index 05fa3ae56e25..5920a3e8d1d5 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -231,6 +231,56 @@ static notrace void booke_load_dbcr0(void)
>>   #endif
>>   }
>>  =20
>> +#include <linux/sched/debug.h> /* for show_regs */
>> +static void check_return_regs_valid(struct pt_regs *regs)
>> +{
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	static bool warned =3D false;
>> +
>> +	if (regs->trap =3D=3D 0x980 || regs->trap =3D=3D 0xe00 || regs->trap =
=3D=3D 0xe20 ||
>> +	    regs->trap =3D=3D 0xe40 || regs->trap =3D=3D 0xe60 || regs->trap =
=3D=3D 0xe80 ||
>> +	    regs->trap =3D=3D 0xea0 || regs->trap =3D=3D 0xf80 || regs->trap =
=3D=3D 0x1200 ||
>> +	    regs->trap =3D=3D 0x1500 || regs->trap =3D=3D 0x1600 || regs->trap=
 =3D=3D 0x1800) {
>=20
> Can you use names defined in asm/interrupt.h instead of raw values ?
> Some are already there, others can be added.

Good idea. Could go into a helper too actually.

I wanted to clean up the KVM definitions and unify them with interrupt.h=20
defs but that's a bit of churn. Can I get to that in the next merge or=20
so?

Thanks,
Nick
