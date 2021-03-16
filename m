Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3533CF63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F05cK6vFkz30Nc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 19:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=u5u9K26b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u5u9K26b; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F05bs56H0z309v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 19:11:51 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so1032338pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=F8xqTbiIWCj5S5+QVb9DMN9bgThflFjUlHcsXE1G6y8=;
 b=u5u9K26b9adB9I5Sq119hnUBEMMZw789BnRFYSDdbwVrqY+KH3dYJLsT+YSN/tsdUR
 qkCjIxj/RtNV0sG5eEYqtdqVe+aj4hxCcOigtvGyobrMPO/cBS30nY9b+myOve6J3YnA
 SKBJradx1n6iq+u6rr6brBu6jU6C0jA20+FSgS0A+4+GNaSkNZItXtvs59DVtVh0XGen
 /kQGXj7+JMOOdeLtAgcBF9TzjGQ3ZSURE9RbkLmymR7XZAcb0SlnFWP+y5vpSsVlWBYs
 6K+8kQ2MvgFv6UEsL2hZ7Flc1bKPinabfgoQCykWnZ+97fFBfmMAQ+PGOxwRh/8iLF3N
 evhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=F8xqTbiIWCj5S5+QVb9DMN9bgThflFjUlHcsXE1G6y8=;
 b=bcShGh+OY4cARI3+dryQ0NAOxNmp7caag+ZMUYxy9ZvRPdUxGxLl4MSQyNU8t5DLjx
 V/+F84e+63S/J6yFTol40I9rR1DCxRPd9ZFjtfJLZgxc5WnCtMfTFMINWqRIFmW8OuIc
 CoeKsDHlt4H+yYxVVOtz1QJ6yeIQz6POwXOjbo8gGhb/+5AseMoaoxipQomYt8WM0W9T
 oicbnUvBj+nAlAWYoTbenHIa9RDK3Xw3ZKZRigK7+YhEpeoYTPh5T2nb+EoIq86Ttp1i
 GhfhBVKAczA3osUyICM0KbvGDqWymSuG+lhOvWa9MQ1o/FVymcYb5oiPLtjCVfYIo8Vz
 3FqA==
X-Gm-Message-State: AOAM533jTnyXHFIaGL2pIw2HXwVVBFR/2RKDn5wLGzEiyZggQOEm5mBs
 GNRhCeOwBROpw672GqxFi/0RmcC3HBI=
X-Google-Smtp-Source: ABdhPJxjMbE6nOiKsRgLu5ikOYHdljQeKrgvC5EELjI2B3Rf5WhmIZ8lyoUUs74aGs/Wr3AnCQFykw==
X-Received: by 2002:a17:90a:e614:: with SMTP id
 j20mr3579573pjy.184.1615882309587; 
 Tue, 16 Mar 2021 01:11:49 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id r186sm15873865pfr.124.2021.03.16.01.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:11:48 -0700 (PDT)
Date: Tue, 16 Mar 2021 18:11:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <6ab2073b-dd10-ef2c-375d-1300f071ae1a@csgroup.eu>
In-Reply-To: <6ab2073b-dd10-ef2c-375d-1300f071ae1a@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615882185.2o1zpw54nt.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 16, 2021 5:16 pm:
>=20
>=20
> Le 12/03/2021 =C3=A0 02:20, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need for this to be in asm, use the new intrrupt entry wrapp=
er.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> Hopefully this works on a real G5 now, but I couldn't reproduce the
>> problem with QEMU.
>>=20
>> Thanks,
>> Nick
>>=20
>>   arch/powerpc/include/asm/interrupt.h   | 19 +++++++++++
>>   arch/powerpc/include/asm/processor.h   |  1 +
>>   arch/powerpc/include/asm/thread_info.h |  6 ++++
>>   arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>>   arch/powerpc/kernel/idle_book3s.S      |  4 +++
>>   5 files changed, 30 insertions(+), 45 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index aedfba29e43a..ef015d3b5e39 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -9,6 +9,17 @@
>>   #include <asm/kprobes.h>
>>   #include <asm/runlatch.h>
>>  =20
>> +static inline void nap_adjust_return(struct pt_regs *regs)
>> +{
>> +#ifdef CONFIG_PPC_970_NAP
>> +	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
>> +		/* Can avoid a test-and-clear because NMIs do not call this */
>> +		clear_thread_local_flags(_TLF_NAPPING);
>> +		regs->nip =3D (unsigned long)power4_idle_nap_return;
>=20
> Why don't you do regs->nip =3D regs->link like PPC32 instead of going via=
 an intermediate symbol that=20
> does nothing else than branching to LR ?

It is supposed to keep the return branch predictor balanced.

I don't know if these CPUs have one, if it gets lost during nap, or if=20
nap latency is so high it really doesn't matter. But I think it is good
practice to make a habit of keeping things balanced.

Thanks,
Nick
