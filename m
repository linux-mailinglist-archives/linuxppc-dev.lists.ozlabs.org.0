Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A770D9E587
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:16:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HlCV1KhxzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZ1swkBk"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hl945ZfrzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:14:32 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id e11so12420105pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 03:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=CH3EstjZ56aVSr8vcOwyjGDQYZghRxePlso3gOtXfmg=;
 b=gZ1swkBkl7S+W98f0pt1Dgn5OvYzP7pYACKBvAx0JQKuKhR09dBBa9ytdLgUDc8ZNV
 o/GgopOYSbOB1MduuQ6CVoGb9cH0CAFdjyL9P1lTwax4Pak+6lDnW310yKbv4uQSb3ha
 Jg4TolhWfstGd5HYlZ+TW4RLjwkqC1zC/jRz+MXE6InfPF+kRjNK20Tv6nB1ZyFv2p9k
 HvN826CNx4Pgcxt74sqxouuIfVKwFvgiz06t2xIrPth9cH7ZTr6FY4bGd8QlsyNB/kmw
 R5NBQ36LlzYeMBbE3XfqSEuD83fZkxskX6erZd/ujtgK++CMnUF4Kyjrl1UcE5VYN80s
 z0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=CH3EstjZ56aVSr8vcOwyjGDQYZghRxePlso3gOtXfmg=;
 b=BWA0cF7CLeAOdcEKY7zBpI5V6BhfFrMYFqDEU2Z7huNEai3yODDtylSRkML6vk20Zl
 tGZ7/W4/QG0SH4Muw8R1mx7CYEPWX/sMdKhatzUjBOfIvWBDxkHTz2U3rG5CtCenC/o0
 ylPd3wdqG9ahhbgqbtC0V/mtvPvAly0dYTWDmnS8JQh/2ltCYdodZBI3NdgJxlgCAzcq
 GtoiICtowRs4+55F25eZ9DMjw0eViOCHff1gY6GgOgF4X+B1sK7MDpCJtzYJohMa/lCF
 iRvYkLp4KXeCew8FQsoDlTxdTNz1n3AasOMd+owakTwPmiTfgAOHUxUSn4SlnVEiS/ra
 Ul9Q==
X-Gm-Message-State: APjAAAX8u2R+UQMBM0PayBhNRSeiwQp4JJ+cxixQo1oK0rCHNjo2NdjT
 FSQZZsTCzd85C/RsMAR+RWjo2qQN
X-Google-Smtp-Source: APXvYqwLl77t5/RdFxKCkU+Dwuk6LzMz9KUvweRJ5+fGQgsBvtlqp6kFMFMygtW06KDE16QMpMRrxQ==
X-Received: by 2002:a65:6547:: with SMTP id a7mr20267812pgw.65.1566900870210; 
 Tue, 27 Aug 2019 03:14:30 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id s125sm28056185pfc.133.2019.08.27.03.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:14:29 -0700 (PDT)
Date: Tue, 27 Aug 2019 20:13:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] powerpc: convert to copy_thread_tls
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-2-npiggin@gmail.com>
 <70171357-45e3-3fde-9713-d93b95cc1beb@c-s.fr>
In-Reply-To: <70171357-45e3-3fde-9713-d93b95cc1beb@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566900777.qmrn17gypm.astroid@bobo.none>
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

Christophe Leroy's on August 27, 2019 4:07 pm:
>=20
>=20
> Le 27/08/2019 =C3=A0 05:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Commit 3033f14ab78c3 ("clone: support passing tls argument via C rather
>> than pt_regs magic") introduced the HAVE_COPY_THREAD_TLS option. Use it
>> to avoid a subtle assumption about the argument ordering of clone type
>> syscalls.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig          | 1 +
>>   arch/powerpc/kernel/process.c | 9 +++++----
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index d8dcd8820369..7477a3263225 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -182,6 +182,7 @@ config PPC
>>   	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector=
-guard=3Dtls -mstack-protector-guard-reg=3Dr13)
>>   	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector=
-guard=3Dtls -mstack-protector-guard-reg=3Dr2)
>>   	select HAVE_CONTEXT_TRACKING		if PPC64
>> +	select HAVE_COPY_THREAD_TLS
>>   	select HAVE_DEBUG_KMEMLEAK
>>   	select HAVE_DEBUG_STACKOVERFLOW
>>   	select HAVE_DYNAMIC_FTRACE
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process=
.c
>> index 8fc4de0d22b4..24621e7e5033 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -1600,8 +1600,9 @@ static void setup_ksp_vsid(struct task_struct *p, =
unsigned long sp)
>>   /*
>>    * Copy architecture-specific thread state
>>    */
>> -int copy_thread(unsigned long clone_flags, unsigned long usp,
>> -		unsigned long kthread_arg, struct task_struct *p)
>> +int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>> +		unsigned long kthread_arg, struct task_struct *p,
>> +		unsigned long tls)
>>   {
>>   	struct pt_regs *childregs, *kregs;
>>   	extern void ret_from_fork(void);
>> @@ -1642,10 +1643,10 @@ int copy_thread(unsigned long clone_flags, unsig=
ned long usp,
>>   		if (clone_flags & CLONE_SETTLS) {
>>   #ifdef CONFIG_PPC64
>=20
> is_32bit_task() exists and always returns 1 on PPC32 so this gross ifdef=20
> in the middle of an if/else is pointless, it should be dropped.

I could do that as another patch in the series.

Thanks,
Nick
=
