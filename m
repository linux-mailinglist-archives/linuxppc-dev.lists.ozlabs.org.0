Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE953975B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 16:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvZd40L8pz303n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 00:42:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=XWES3O+i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=XWES3O+i; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvZcd3NGYz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 00:42:07 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 jz2-20020a17090b14c2b0290162cf0b5a35so1531762pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jun 2021 07:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=g1SoAE64xXP0ozqgBwlWSdkAycLuZY+SSCoJ8hssJgw=;
 b=XWES3O+ix+pIyBEfkQ9QWlpHZLBDerJ6G5ArqlGnmmJb9ijV3spOxvie6x8dqd5sla
 hF3n+JYdrQoai98r2qGgBUJHViMoVyHme9ZC54vnJur8qRboFD61iwtx6k1RFsi7zqHA
 ++zBGcy0WRh+BOXKUn3Tps6hrvI4ylG/TCFog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=g1SoAE64xXP0ozqgBwlWSdkAycLuZY+SSCoJ8hssJgw=;
 b=UNQgjxAjrf/78pswVwuFm4LZ6lTx43CxIB/5lSJrOLiwyFVOfdfsKXqmxGMgoaj/14
 flZkkuB43hx1pp492MspZEsQf8jE9kgyufrHzhQtujzV7WzZnWQGs5TGsFaeKB8t9JaQ
 a+yklVzCPgmAf+R/2KEVwaUrxidOBX6tFmtr3srFobONUTLUx2dKSUICKobjQyt3rU7D
 iTRZwv8o2BKa1JVCvA72VilLKwrFTisRW9w1LrPqH916lt7UjfdjhchGtduHP0GtBEmH
 t1hN9zejj0NOLcB+xHRPFTpt0PE7lA+WZUBIswgOufQYekCD4km7y4TbwiUDC5YmGJ0N
 IOGA==
X-Gm-Message-State: AOAM533eGnDu7KsZsk8VLuJ+R5n/gJ9ZyXIElIeDN1iem9tBFzFsJSTV
 a/vemlibPL6dt6SzWhba8ZAW2w==
X-Google-Smtp-Source: ABdhPJxS2/C395/CpEufwla4aWTxaVVwc5HSTSjRzEXatVXr0Wcb3gTro93V6IpgGorXqiU1HSn0jg==
X-Received: by 2002:a17:90b:689:: with SMTP id m9mr243555pjz.102.1622558523820; 
 Tue, 01 Jun 2021 07:42:03 -0700 (PDT)
Received: from localhost ([101.178.215.23])
 by smtp.gmail.com with ESMTPSA id m12sm13586079pjq.53.2021.06.01.07.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:42:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, christophe.leroy@csgroup.eu,
 kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: make show_stack's stack walking KASAN-safe
In-Reply-To: <1622539981.k2ctwb25pa.naveen@linux.ibm.com>
References: <20210528074806.1311297-1-dja@axtens.net>
 <1622539981.k2ctwb25pa.naveen@linux.ibm.com>
Date: Wed, 02 Jun 2021 00:42:00 +1000
Message-ID: <87y2bty7d3.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:

> Daniel Axtens wrote:
>> Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
>> generic code, arm64, s390 and x86 all do this for similar sorts of
>> reasons: when unwinding a stack, we might touch memory that KASAN has
>> marked as being out-of-bounds. In ppc64 KASAN development, I hit this
>> sometimes when checking for an exception frame - because we're checking
>> an arbitrary offset into the stack frame.
>> 
>> See commit 20955746320e ("s390/kasan: avoid false positives during stack
>> unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
>> frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
>> Prevent KASAN false positive warnings") and commit 6e22c8366416
>> ("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer").
>> 
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> ---
>>  arch/powerpc/kernel/process.c | 16 +++++++++-------
>>  1 file changed, 9 insertions(+), 7 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>> index 89e34aa273e2..430cf06f9406 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -2151,8 +2151,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>>  			break;
>>  
>>  		stack = (unsigned long *) sp;
>> -		newsp = stack[0];
>> -		ip = stack[STACK_FRAME_LR_SAVE];
>> +		newsp = READ_ONCE_NOCHECK(stack[0]);
>> +		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
>
> Just curious:
> Given that we validate the stack pointer before these accesses, can we 
> annotate show_stack() with __no_sanitize_address instead?
>
> I ask because we have other places where we walk the stack: 
> arch_stack_walk(), as well as in perf callchain. Similar changes will be 
> needed there as well.

Oh good points. Yes, it probably makes most sense to mark all the
functions with __no_sanitize_address, that resolves Christophe's issue
as well. I'll send a v2.

Kind regards,
Daniel

>
>
> - Naveen
