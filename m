Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4DE1DFC0D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 02:02:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49V0lx3YcYzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 10:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49V0kT3zbHzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 10:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BjJdYd+O; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49V0kT3bJbz8sxP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 10:01:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49V0kT3Lltz9sSW; Sun, 24 May 2020 10:01:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BjJdYd+O; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49V0kT01rLz9sRY
 for <linuxppc-dev@ozlabs.org>; Sun, 24 May 2020 10:01:20 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id q24so6678954pjd.1
 for <linuxppc-dev@ozlabs.org>; Sat, 23 May 2020 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tS/+pfo216o12JYeLsn2cmlRknXZtRxuQE9EcAZnnLw=;
 b=BjJdYd+OlLZGCSzWNcfOocFgQLLjM0RVDVU5TCdsrXriybJmvvOLxxckTpBE373gdn
 N3xvC5l2eDIxE13U41zbtpncBqXtO/bZnhrPtCDBibjvWGCtpri3OWUphvgcVk02nQ2v
 faSlhvYpdT3PPvGbtqC+7UGyMKU+Hs5ocd5uOrmjvCOZBugbwTjBA+qu1jfyZdW4bOQg
 E9hA+O1LzYGRTaroH18wP+b7gjJxLAsyAvbE5A0y14vZ8eBepaQJll32wC8ZVhO2exhQ
 WXctSRqWEdL+ey+j1AUGP3qA0BXsbICQ/FKK7VzzqGAeDatLY7HhQm073B+nYMNV2H5N
 AFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tS/+pfo216o12JYeLsn2cmlRknXZtRxuQE9EcAZnnLw=;
 b=OyFc8L8Q4e+3QFf9AdPFYGiIZ7Pzb8JEEEnGt5KOnUMWF3njYgmo1QnVpMfcnwYJ+r
 Gjf8qBBDnaZY3MeG5aYoJ0jvf4X5mnPpAGr8mrq/4Qalckdt3tMezikbAcIQxeyqhFCP
 WmnG/kDubognj5hBdspgxONwlnEXuOthZ1nGCcgD8LsaJynIzbu8vE7/eisRMmPGFvo0
 8j5GHsiqUi7Vuj2U5OcioLhOnaqn9M2uWKA+C1eTi3cSaolP1iXkbI/jM5NV3p36fWmk
 FSPG5EiDvPq4B834HDjh4/buF0kB+bHCOZBbDzUGweeTfNF45YAHCcvbu14eDD4IusDQ
 SOSA==
X-Gm-Message-State: AOAM5307rSmuBUFrgEyq5BSTdso9m7LoIPYIxMQsgDCcJnJ+ky4OEkta
 2Ws6wMf4Q6rELXAozRooyzGgC10t
X-Google-Smtp-Source: ABdhPJygUpWgg+/7m+w82DTigDAZsTjTbfs3dfd7dHsocRjGMjDK7dw6p+7zlJfw8GjGC/5f455jFA==
X-Received: by 2002:a17:90a:7c07:: with SMTP id
 v7mr13107816pjf.124.1590278478545; 
 Sat, 23 May 2020 17:01:18 -0700 (PDT)
Received: from localhost (115-64-212-199.static.tpgi.com.au. [115.64.212.199])
 by smtp.gmail.com with ESMTPSA id
 q18sm8868134pgt.74.2020.05.23.17.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 17:01:18 -0700 (PDT)
Date: Sun, 24 May 2020 10:01:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: Add ppc_inst_next()
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200522133318.1681406-1-mpe@ellerman.id.au>
 <1590277817.8ax5p94lur.astroid@bobo.none>
In-Reply-To: <1590277817.8ax5p94lur.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1590278278.q0bfj10pkn.astroid@bobo.none>
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
Cc: christophe.leroy@c-s.fr, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of May 24, 2020 9:56 am:
> Excerpts from Michael Ellerman's message of May 22, 2020 11:33 pm:
>> In a few places we want to calculate the address of the next
>> instruction. Previously that was simple, we just added 4 bytes, or if
>> using a u32 * we incremented that pointer by 1.
>>=20
>> But prefixed instructions make it more complicated, we need to advance
>> by either 4 or 8 bytes depending on the actual instruction. We also
>> can't do pointer arithmetic using struct ppc_inst, because it is
>> always 8 bytes in size on 64-bit, even though we might only need to
>> advance by 4 bytes.
>>=20
>> So add a ppc_inst_next() helper which calculates the location of the
>> next instruction, if the given instruction was located at the given
>> address. Note the instruction doesn't need to actually be at the
>> address in memory.
>>=20
>> Although it would seem natural for the value to be passed by value,
>> that makes it too easy to write a loop that will read off the end of a
>> page, eg:
>>=20
>> 	for (; src < end; src =3D ppc_inst_next(src, *src),
>> 			  dest =3D ppc_inst_next(dest, *dest))
>>=20
>> As noticed by Christophe and Jordan, if end is the exact end of a
>> page, and the next page is not mapped, this will fault, because *dest
>> will read 8 bytes, 4 bytes into the next page.
>>=20
>> So value is passed by reference, so the helper can be careful to use
>> ppc_inst_read() on it.
>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/include/asm/inst.h   | 13 +++++++++++++
>>  arch/powerpc/kernel/uprobes.c     |  2 +-
>>  arch/powerpc/lib/feature-fixups.c | 15 ++++++++-------
>>  arch/powerpc/xmon/xmon.c          |  2 +-
>>  4 files changed, 23 insertions(+), 9 deletions(-)
>>=20
>> v2: Pass the value as a pointer and use ppc_inst_read() on it.
>>=20
>> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/=
inst.h
>> index d82e0c99cfa1..5b756ba77ed2 100644
>> --- a/arch/powerpc/include/asm/inst.h
>> +++ b/arch/powerpc/include/asm/inst.h
>> @@ -100,6 +100,19 @@ static inline int ppc_inst_len(struct ppc_inst x)
>>  	return ppc_inst_prefixed(x) ? 8 : 4;
>>  }
>> =20
>> +/*
>> + * Return the address of the next instruction, if the instruction @valu=
e was
>> + * located at @location.
>> + */
>> +static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc=
_inst *value)
>> +{
>> +	struct ppc_inst tmp;
>> +
>> +	tmp =3D ppc_inst_read(value);
>> +
>> +	return location + ppc_inst_len(tmp);
>> +}
>> +
>>  int probe_user_read_inst(struct ppc_inst *inst,
>>  			 struct ppc_inst __user *nip);
>> =20
>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes=
.c
>> index 83e883e1a42d..d200e7df7167 100644
>> --- a/arch/powerpc/kernel/uprobes.c
>> +++ b/arch/powerpc/kernel/uprobes.c
>> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe=
, struct pt_regs *regs)
>>  	 * support doesn't exist and have to fix-up the next instruction
>>  	 * to be executed.
>>  	 */
>> -	regs->nip =3D utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn=
));
>> +	regs->nip =3D (unsigned long)ppc_inst_next((void *)utask->vaddr, &aupr=
obe->insn);
>> =20
>>  	user_disable_single_step(current);
>>  	return 0;
>=20
> AFAIKS except for here, there is no need for the void *location arg.
>=20
> I would prefer to drop that and keep this unchanged (it's a slightly=20
> special case anyway).

Ooops, I didn't read the last thread. I don't think insert_bpts needs it=20
though, only this case. Anyway it's a minor nitpick so if it's already=20
been considered, fine.

Thanks,
Nick
