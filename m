Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A025FAFB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 15:07:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlT931QLczDqMx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 23:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fQbxUUIE; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlT6k2JbbzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 23:05:47 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id j7so1644402plk.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Sep 2020 06:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cdao1aToUp9tqG6Wul/FZn7+pu5ebxgTGfoiH5xl6vg=;
 b=fQbxUUIEYFqR2zw8+kisp1ge2cqrAU5xt36cYHPaqScHlhzCzrIYdysfNRAcfvJ+qY
 3z/zG2ZpsBoUR6eM+c6Z9u8P/uxbSNFCWSAybBx3DWOi+USvB2n3/eRFVd42xYnI91SX
 u/YFZIzoT+DA3fp5bCAuw/WQa4HOiPPG6q71zr/r2owtaePX2GIXkQSpMXeeuQW1jJX4
 62ITJsvU4yPC2/AB5xaOOks3WcTStlBC2tbDEta9kF6gefuN1dH+skMwJ8M5+zgvujsD
 kHUAVw6F/epB9HSZ/+dy96zzsyD4RyeZBCG/nWfO/V28H2zuoJk6CDU2V0EK0jKFfENe
 afLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cdao1aToUp9tqG6Wul/FZn7+pu5ebxgTGfoiH5xl6vg=;
 b=DNJaHNQ1TuUbD1NHuJJtWvt7yISGnlCDU/c2DLKCyYmnGBkk6rrooQh/IK4p4BKzKW
 79zzBGNEtaDaRhcdcLLWZ8so++5Bej15GXBxUBrgjW5prPBJAKXcaTJ00WufyIoxvTYy
 puWR72SzTgqgQ+qvLMd3dM4NU5P2pEWRNddRL4cyeR/sVClW1DGdDag4xfvT5rXQDfh8
 TBez1CJrQvL4pKJZAvfl/M42sukqXQKM0oEoLsTJfXEv2BjNe/42YiTVwOrwJq7lmjQG
 n/XoL1GUr0c12mteeTnIwDxGjzMkbUHppZ+klKgGCQ4/4zKFGizjIA+KlGF0jLfBsMqj
 IyXg==
X-Gm-Message-State: AOAM5325VJ24EOgx8DfWCw9a6FrnP/LeDY+VEKsT3SCkostd4RIYHo/x
 QSWnBhMkkbqGWk2U9Iv85a4=
X-Google-Smtp-Source: ABdhPJzGWFRncwjhoRPfCDWNSZFjZjR1rOft3/QG0osWZHrFJ/YO/Mw/lZkhG1ElX0rylMolyTjNog==
X-Received: by 2002:a17:90a:ca98:: with SMTP id
 y24mr20282569pjt.98.1599483943562; 
 Mon, 07 Sep 2020 06:05:43 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id gl17sm4901820pjb.49.2020.09.07.06.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 06:05:43 -0700 (PDT)
Date: Mon, 07 Sep 2020 23:05:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 12/12] powerpc/64s: power4 nap fixup in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-13-npiggin@gmail.com>
 <53f5fa9b-03d4-150e-199b-7ffa75d91666@csgroup.eu>
 <1599450777.weoux16jk2.astroid@bobo.none>
 <9a647445-a438-ae93-f8d5-c177b7fe9662@csgroup.eu>
In-Reply-To: <9a647445-a438-ae93-f8d5-c177b7fe9662@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599464687.9bg2uwl3my.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of September 7, 2020 2:48 pm:
>=20
>=20
> Le 07/09/2020 =C3=A0 06:02, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of September 6, 2020 5:32 pm:
>>>
>>>
>>> Le 05/09/2020 =C3=A0 19:43, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> There is no need for this to be in asm, use the new intrrupt entry wra=
pper.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>>    arch/powerpc/include/asm/interrupt.h   | 14 ++++++++
>>>>    arch/powerpc/include/asm/processor.h   |  1 +
>>>>    arch/powerpc/include/asm/thread_info.h |  6 ++++
>>>>    arch/powerpc/kernel/exceptions-64s.S   | 45 -----------------------=
---
>>>>    arch/powerpc/kernel/idle_book3s.S      |  4 +++
>>>>    5 files changed, 25 insertions(+), 45 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/inclu=
de/asm/processor.h
>>>> index ed0d633ab5aa..3da1dba91386 100644
>>>> --- a/arch/powerpc/include/asm/processor.h
>>>> +++ b/arch/powerpc/include/asm/processor.h
>>>> @@ -424,6 +424,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsi=
gned long psscr_val);
>>>>    extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
>>>>    #ifdef CONFIG_PPC_970_NAP
>>>>    extern void power4_idle_nap(void);
>>>> +extern void power4_idle_nap_return(void);
>>>
>>> Please please please, 'extern' keyword is pointless and deprecated for
>>> function prototypes. Don't add new ones.
>>>
>>> Also, put it outside the #ifdef, so that you can use IS_ENABLED()
>>> instead of #ifdef when using it.
>>=20
>> I just copy paste and forget to remove it. I expect someone will do a
>> "cleanup" patch to get rid of them in one go, I find a random assortment
>> of extern and not extern to be even uglier :(
>=20
> If we don't want to make fixes backporting a huge headache, some=20
> transition with random assortment is the price to pay.
>=20
> One day, when 'extern' have become the minority, we can get rid of the=20
> few last ones.
>=20
> But if someone believe it is not such a problem with backporting, I can=20
> provide a cleanup patch now.

I can't really see declarations being a big problem for backporting
or git history. But maybe Michael won't like a patch.

I will try to remember externs though.

Thanks,
Nick
