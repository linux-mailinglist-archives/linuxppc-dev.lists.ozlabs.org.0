Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D26569FEC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:44:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JLRK2kGjzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:43:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NAyRmRQW"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JLPP25BrzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:42:16 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n9so1181635pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=rv3dgBZ7atlQIwLSCKhD8vRyD/NkeOldH3Y7Ei64S+o=;
 b=NAyRmRQWvdoKxQMQVhY+9jclPEvngJLridWfTvnQ+K4c2UOg2QJNLvUwnzu27BZvVG
 1Wp7t7HlDflY9BuZZ8YxIrqje5dlH6KYaBDs7JfaBZ6H6NhaYBZDuaqKZ/YnTU76ly1b
 3CQEoKsZe/xexDtz0yQ3/CZFd2lvWB8AlhUU4ADF1QJ1QAYiy1oRE+QdrWi3RyLMetWt
 gVmZ1HqkHJa6rQJc4dI+s3Y8WFDMzP8WFBiL1snAc94O8zfvPEfhl63qelePDvJ77QZo
 Eu6K7xn90sfjWzJPL7afVbCydvvf6nSwSa4Z9mia5dhmfqbC3405NVKX/R0PZOPmdC29
 3mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=rv3dgBZ7atlQIwLSCKhD8vRyD/NkeOldH3Y7Ei64S+o=;
 b=Ob77xHNNJwQ5HcapeEfuo+aYZL3rPF+sb1Qr5GaxkStmnj3/VEdxwrzb8K//5+4QQe
 ZoHsIjZZvRw5v8yWpb4ZKj8sENszrmoTLv9/cueCUiY8nZWZwkHDIXMOh920+inpBMap
 lIk/D17WhTEMN6BtTMLXs6S5txSiJrDqAWgAKCkRWmjrJUkS3s8hwbEQE9ZBHs9Hrpak
 kequgKP1QDHc3BmfDyjbJq9UGsJWVgYNANnQPnY3BKVNnAwzmLv0mLs00/6EdsEWV1aw
 Knho/43u8apOXqVWYxw7Y86uJplBM/NC0huHNeMCXZ5PPRhxbM+spTGhIcddPSZRm9Hj
 IF9w==
X-Gm-Message-State: APjAAAXLU5m5uj1t0zNhVhfNBG8waOyMZhNjR7Ehy/9CFR8sdSqU6XNe
 9s49X3xIBjPHOBASXuUtelI=
X-Google-Smtp-Source: APXvYqyQGVsunOqhWLtjB4kZe1C/Vad2qyEf6A5/Ed0jJGVY/1G8wWJVvg7CGjwcRylJ0lqxO6LsQQ==
X-Received: by 2002:a17:90a:256d:: with SMTP id
 j100mr3303221pje.126.1566985335054; 
 Wed, 28 Aug 2019 02:42:15 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id y23sm4860606pfr.86.2019.08.28.02.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:42:14 -0700 (PDT)
Date: Wed, 28 Aug 2019 19:41:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] powerpc/64: system call implement the bulk of the
 logic in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <20190827135548.21457-5-npiggin@gmail.com>
 <1015bea4-8b51-ea3b-7e45-8825635261bb@c-s.fr>
In-Reply-To: <1015bea4-8b51-ea3b-7e45-8825635261bb@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566984787.11eqat0ax3.astroid@bobo.none>
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

Christophe Leroy's on August 28, 2019 4:51 pm:
>=20
>=20
> Le 27/08/2019 =C3=A0 15:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>> -#include <asm/reg.h>
>> +#include <asm/mmu.h>
>> +#include <asm/ptrace.h>
>> +
>> +static inline void kuap_check_amr(void)
>> +{
>> +#ifdef CONFIG_PPC_KUAP_DEBUG
>> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
>=20
> Better:
>=20
> 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) &&=20
> mmu_has_feature(MMU_FTR_RADIX_KUAP))

That is better.

>> +		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
>> +#endif
>> +}
>>  =20
>>   /*
>>    * We support individually allowing read or write, but we don't suppor=
t nesting
>> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/a=
sm/cputime.h
>> index 2431b4ada2fa..f3aa9db1a3cc 100644
>> --- a/arch/powerpc/include/asm/cputime.h
>> +++ b/arch/powerpc/include/asm/cputime.h
>> @@ -60,6 +60,28 @@ static inline void arch_vtime_task_switch(struct task=
_struct *prev)
>>   }
>>   #endif
>>  =20
>> +static inline void account_cpu_user_entry(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +
>> +	get_accounting(current)->utime +=3D (tb - get_accounting(current)->sta=
rttime_user);
>> +	get_accounting(current)->starttime =3D tb;
>> +}
>=20
> Can you check the generated assembly ? I remember having bad result with=20
> get_accouting() being used several times in a arch_vtime_task_switch()=20
> before commit 	60f1d2893ee6 ("powerpc/time: inline=20
> arch_vtime_task_switch()")

It's fine on 64s but it's accounting is a constant offset from r13 so
simple load/store can be done.

> Regardless, I think it would look better as:
>=20
> static inline void account_cpu_user_entry(void)
> {
> 	unsigned long tb =3D mftb();
> 	struct cpu_accounting_data *acct =3D get_accounting(current);
>=20
> 	acct->utime +=3D (tb - acct->starttime_user);
> 	acct->starttime =3D tb;
> }

Yeah that's nicer.

>=20
>> +static inline void account_cpu_user_exit(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +
>> +	get_accounting(current)->stime +=3D (tb - get_accounting(current)->sta=
rttime);
>> +	get_accounting(current)->starttime_user =3D tb;
>> +}
>=20
> Same here.

Will do.

Thanks,
Nick

=
