Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1DF18DE43
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 07:37:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48krXv1TLnzF0Rt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 17:37:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uXEDPIL1; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48krW215pfzF0RF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 17:35:41 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id j1so1782888pfe.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=cj5JZH6NLKeR3jp8xSSiPMY0AsvJqWinaGAxtllavYE=;
 b=uXEDPIL15WHAdOTJnCp5nxiUSCfLD5WFd/md1toC4fQSG+6ykXSFdbh4dUEnrAI9vX
 JwlrH1tsx157lQQs2sHioYiEa/MGMMBkwuXG57CuQsVBkv8Szb7HaqZiKJ60upnX7B8a
 X1IvKZCDntyN7pL1B/4pJs7TKLNUhbBLY8IZ9b5TpY07riyWBo1e8Ou3HXQ5WJFwCuG3
 bJVOzlzolJ0kuB8naIV5KIivC9Lfr4cc9rzV+jjdLbzDFZBh+Y/WKCimWClkHBzSn1WR
 HcTikBAC5ccjcGFCbd4ADi9WWSCLsPrlMxaEgQg0n0LA1ARWEM6SMyzsAYH3z9SxrC57
 3P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=cj5JZH6NLKeR3jp8xSSiPMY0AsvJqWinaGAxtllavYE=;
 b=JGA5yzFSfU8yhDiL1c24XdfkPqHFFitXRM2Ir2n3GDh5mzxsypohvY/CnYCKthYQ99
 xr2yaCwagZPjtqj0POWv2LqNScEa2NVk3Y8cUVwWO7VUlCcjaIYBp81NZtUOJ4RnrFc/
 SDfMneRvd1/xgljYGcj17+HO1INwfigrexPUQZL/7A0XLjlBPDZttkewJdB0OauyUFZc
 a3siv4PRKpQeD/cTFI/BRfAIdxqTN65RlIGzzsu1VAgtgd0hPkAu0tCx3NI2BF62zsdW
 D/fO6nO5rqEfv1npE6Z0P+YmZSTdjEdcCIMiD1Hk+9KlakLo6Pmeh6a0GncbMeuHIg79
 NigA==
X-Gm-Message-State: ANhLgQ0kuXLdYMcIQE2RqU/aPePYA07mzAHVb9Ucj9L6vXGNcZJ7LOm8
 xr2ZIU1UARqH2BYNI0l08vmB/0Tq
X-Google-Smtp-Source: ADFU+vtX3EUa4XG4Gi0DxyesvYglYazzEZjIE2Wxr1pI4/ekBSSXgOQ1hJqo9mWvXXvUF6JuINDpHA==
X-Received: by 2002:a65:424b:: with SMTP id d11mr11583323pgq.17.1584772537630; 
 Fri, 20 Mar 2020 23:35:37 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id l2sm6348824pjn.27.2020.03.20.23.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 23:35:36 -0700 (PDT)
Date: Sat, 21 Mar 2020 16:32:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: ftrace don't trace real mode
To: linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
References: <20200320152551.1468983-1-npiggin@gmail.com>
 <1584728788.91gvyrzbi3.naveen@linux.ibm.com>
In-Reply-To: <1584728788.91gvyrzbi3.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584759479.7ueu8qvhgs.astroid@bobo.none>
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

Naveen N. Rao's on March 21, 2020 4:39 am:
> Hi Nick,
>=20
> Nicholas Piggin wrote:
>> This warns and prevents tracing attempted in a real-mode context.
>=20
> Is this something you're seeing often? Last time we looked at this, KVM=20
> was the biggest offender and we introduced paca->ftrace_enabled as a way=20
> to disable ftrace while in KVM code.

Not often but it has a tendancy to blow up the least tested code at the
worst times :)

Machine check is bad, I'm sure HMI too but I haven't tested that yet.

I've fixed up most of it with annotations, this is obviously an extra
safety not something to rely on like ftrace_enabled. Probably even the
WARN_ON here is dangerous here, but I don't want to leave these bugs
in there.

Although the machine check and hmi code touch a fair bit of stuff and
annotating is a bit fragile. It might actually be better if the
paca->ftrace_enabled could be a nesting counter, then we could use it
in machine checks too and avoid a lot of annotations.

> While this is cheap when handling ftrace_regs_caller() as done in this=20
> patch, for simple function tracing (see below), we will have to grab the=20
> MSR which will slow things down slightly.

mfmsr is not too bad these days.=20


>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kernel/trace/ftrace.c            |  3 +++
>>  .../powerpc/kernel/trace/ftrace_64_mprofile.S | 19 +++++++++++++++----
>>  2 files changed, 18 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tr=
ace/ftrace.c
>> index 7ea0ca044b65..ef965815fcb9 100644
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -949,6 +949,9 @@ unsigned long prepare_ftrace_return(unsigned long pa=
rent, unsigned long ip,
>>  {
>>  	unsigned long return_hooker;
>>=20
>> +	if (WARN_ON_ONCE((mfmsr() & (MSR_IR|MSR_DR)) !=3D (MSR_IR|MSR_DR)))
>> +		goto out;
>> +
>=20
> This is called on function entry to redirect function return to a=20
> trampoline if needed. I am not sure if we have (or will have) too many C=20
> functions that disable MSR_IR|MSR_DR. Unless the number of such=20
> functions is large, it might be preferable to mark specific functions as=20
> notrace.
>=20
>>  	if (unlikely(ftrace_graph_is_dead()))
>>  		goto out;
>>=20
>> diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/power=
pc/kernel/trace/ftrace_64_mprofile.S
>> index f9fd5f743eba..6205f15cb603 100644
>> --- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
>> +++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
>> @@ -51,16 +51,21 @@ _GLOBAL(ftrace_regs_caller)
>>  	SAVE_10GPRS(12, r1)
>>  	SAVE_10GPRS(22, r1)
>>=20
>> -	/* Save previous stack pointer (r1) */
>> -	addi	r8, r1, SWITCH_FRAME_SIZE
>> -	std	r8, GPR1(r1)
>> -
>>  	/* Load special regs for save below */
>>  	mfmsr   r8
>>  	mfctr   r9
>>  	mfxer   r10
>>  	mfcr	r11
>>=20
>> +	/* Shouldn't be called in real mode */
>> +	andi.	r3,r8,(MSR_IR|MSR_DR)
>> +	cmpdi	r3,(MSR_IR|MSR_DR)
>> +	bne	ftrace_bad_realmode
>> +
>> +	/* Save previous stack pointer (r1) */
>> +	addi	r8, r1, SWITCH_FRAME_SIZE
>> +	std	r8, GPR1(r1)
>> +
>=20
> This stomps on the MSR value in r8, which is saved into pt_regs further=20
> below.
>=20
> You'll also have to handle ftrace_caller() which is used for simple=20
> function tracing. We don't read the MSR there today, but that will be=20
> needed if we want to suppress tracing.

Oops, thanks good catch.

Thanks,
Nick
=
