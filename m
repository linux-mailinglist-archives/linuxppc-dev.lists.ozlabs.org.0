Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD272F59A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 04:53:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGVld29r3zDrgD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:53:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gyf1sn0f; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGVjk3jS2zDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 14:51:37 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id m6so2572562pfm.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 19:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=Z59kpsn0kwVq6Jw4ySXwn5eLL+MHffeM9hkiv7v9EqM=;
 b=Gyf1sn0fTteBwrOCVMvI3AQ0UxZlkvwPuEECwCdbQxYsGgkzAi37lFwhb8yxCEny6V
 7ik51tx4Qzd3JQ8M+/SDeHtWxJ3VRLpGct3AnhZQvEsrS5YDkcsMf3JSnlhdspv6jVZL
 yIeJpy4vr/UNMEvIX59XGcxLa47F/0mMS4ZJUoEXQa4VPgY+qHXtEwLo1vFC2yXlP/c4
 +wqBYPc7tGRktDgAjOxL94/vZ+vGnZLb2MdE+OPlg6uNI345U7ARbfHRrTXdJ0VzU1UB
 +WTdNqajFbhnxiyDvQVhjQuKth1JC0qWQi2zM+muIw/WjLcgvkypChJJXGoTrrHfQbv7
 ecUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Z59kpsn0kwVq6Jw4ySXwn5eLL+MHffeM9hkiv7v9EqM=;
 b=UoI8TZvOgXKnPkdQMMh86FWD0ilfD5en+7JwygJCgWfSoDux6X1Y6zI0OLj3uBgKYv
 jEf0kZ+dhnL/bJrNGEMVx9Wp7B5isqwiFSIruP/dEft1DcDUcG/mr/OKIyvpR0P6/NYU
 xtzBI1FKJvgSm1p/GZjcLMmHNv0wwSog9RtmhL8urzNOTa38WvWYPPI6n9XjlLnXhJtV
 4Q2KbxAC1giYI/R4ZdIITu40GpcQOu/OcT9OH5GKe6pVyS5wN+oltbIbJqkmIFslE2Nh
 CBcWn425jHPzNGwUWAFJ+X9u6W9TSLfFITPaZwSDfmCFDe6bcsFphbJ4zEptYLjCvZlo
 YalQ==
X-Gm-Message-State: AOAM533yh78Sk3yDKPRlFbjDjfy2wMMUnMCP9ZhrjoVkaFaM5f6NU+PK
 nj1/4KLHNeuEhbnee7KSp3BORvGYcDcGdw==
X-Google-Smtp-Source: ABdhPJy9knrgypiTd2kpQunoRkBbpJnik95IBAcEd1HeSyokU6ZXG+wm+3ZsW/uRBjxVFqx5U1/2tQ==
X-Received: by 2002:a63:5124:: with SMTP id f36mr5242476pgb.106.1610596294758; 
 Wed, 13 Jan 2021 19:51:34 -0800 (PST)
Received: from localhost ([1.132.233.134])
 by smtp.gmail.com with ESMTPSA id y6sm41657523pjl.0.2021.01.13.19.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 19:51:34 -0800 (PST)
Date: Thu, 14 Jan 2021 13:51:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 15/21] powerpc/64s: reconcile interrupts in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-16-npiggin@gmail.com>
 <c035e8cc-642b-819a-343e-f7d0b0307315@csgroup.eu>
In-Reply-To: <c035e8cc-642b-819a-343e-f7d0b0307315@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610596142.u2hro9xxcp.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 14, 2021 12:54 am:
>=20
>=20
> Le 13/01/2021 =C3=A0 08:32, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need for this to be in asm, use the new intrrupt entry wrapp=
er.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/interrupt.h | 15 +++++++++++----
>>   arch/powerpc/kernel/exceptions-64s.S | 26 --------------------------
>>   2 files changed, 11 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 34d7cca2cb2e..6eba7c489753 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -14,11 +14,14 @@ struct interrupt_state {
>>  =20
>>   static inline void interrupt_enter_prepare(struct pt_regs *regs, struc=
t interrupt_state *state)
>>   {
>> -#ifdef CONFIG_PPC_BOOK3E_64
>> -	state->ctx_state =3D exception_enter();
>> -#endif
>> -
>=20
> Can't the above stay on top of the function ?

It could but I prefer to do it this way because exception_enter
needs the irq soft-mask state to be set up. It is E vs S, but it
reads better this way (and one day I hope to get E to use C
interrupt returns).

Thanks,
Nick
