Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6A2341234
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 02:39:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1mlr3RKMz3c2b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:39:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qzjqRYG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qzjqRYG3; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1mlR6Mw1z302Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 12:39:14 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id k24so2618002pgl.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 18:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9/JCvkc2+GFS73I1LzE0ANLX1fAxX7gQF69OeejhobM=;
 b=qzjqRYG3NqhG4qVCZz7bn4bwUv8u5dqvuCnWK0eFRwjyA+TyOFWHnvF065cemtDeVZ
 C75SlrCWdhIfp8ZNFV10j3QJUbtp/FOG1Ky/wN6Pe9KZUcL3D549BFZmYOLXUZCVJut2
 vzj08YIouLnCy59RLKBqQccK16DKWHo6jS1PNjp1hQR2v3z1FYC0/8zTwKL6+0o97Pb8
 7p8h13Z36cJm2IbbdpR1xDR8NiE81rlWxFki5MQikMV/ef7hKfpqknvSpIHQDF0hSbKI
 WBnxns9gbz1o8DpJ+OklJ6PtyJs/fFciYZlcCINM+zYixAREHnG4hfxvh0YRbYv22fD6
 UGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9/JCvkc2+GFS73I1LzE0ANLX1fAxX7gQF69OeejhobM=;
 b=HRZcVnJAfzfiDny+3BUud/sUVEVKsxeAEBno57j7VHMcahkAn/EjzjQPaF7xFast2t
 BsjUwYk5Ys3mw++bGnv3Ajt9Wy7wVI6QBLBMKBiKONEGKgepWnFASd1GD+Zxz1PqulkL
 lCKHUG636fZ9oDP2Cb/tf9HyNJET1T1pt/OtKLLrD0hqRoAD1HZyr5zNYTrz5XTQsgvq
 quMK18rUhWjOHAaq/xW7s18XLEiyLi/82WwJehi3ddqtPD1ULTC8Qc7GwdjiEg2a+sCf
 MTAAFHesjfBbGLhdpF/Waxf42dO5qZ7QClGoQv5ZSjxFnlqvwN+wjKEeCTY66FbH9JvB
 8yRg==
X-Gm-Message-State: AOAM530jqBxRVeJuL9ZqzFItRjP6vfZnSRftXQXqcpqcHP283SPOYuoE
 kjiFoj3Or4u/yVzUVrlRtnk=
X-Google-Smtp-Source: ABdhPJzmQS3GZapsmUKZZfLx3EVYOmjsOM/ceT29KB5nJrLRE+ks0SakecdcF4nF92HCPhpsOxnczA==
X-Received: by 2002:a62:8857:0:b029:203:4d7a:ae8d with SMTP id
 l84-20020a6288570000b02902034d7aae8dmr6923783pfd.16.1616117951834; 
 Thu, 18 Mar 2021 18:39:11 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id i7sm3648246pfq.184.2021.03.18.18.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 18:39:11 -0700 (PDT)
Date: Fri, 19 Mar 2021 11:39:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/8] powerpc/ppc_asm: use plain numbers for registers
To: Daniel Axtens <dja@axtens.net>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-5-dja@axtens.net>
 <20210225152547.GE28121@gate.crashing.org>
 <87tupzoffb.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87tupzoffb.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Message-Id: <1616117795.mys33l8084.astroid@bobo.none>
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
Cc: llvmlinux@lists.linuxfoundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of February 26, 2021 10:12 am:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
>=20
>> On Thu, Feb 25, 2021 at 02:10:02PM +1100, Daniel Axtens wrote:
>>> This is dumb but makes the llvm integrated assembler happy.
>>> https://github.com/ClangBuiltLinux/linux/issues/764
>>
>>> -#define	r0	%r0
>>
>>> +#define	r0	0
>>
>> This is a big step back (compare 9a13a524ba37).
>>
>> If you use a new enough GAS, you can use the -mregnames option and just
>> say "r0" directly (so not define it at all, or define it to itself).
>>
>> =3D=3D=3D
>>         addi 3,3,3
>>         addi r3,r3,3
>>         addi %r3,%r3,3
>>
>>         addi 3,3,3
>>         addi r3,r3,r3
>>         addi %r3,%r3,%r3
>> =3D=3D=3D
>>
>> $ as t.s -o t.o -mregnames
>> t.s: Assembler messages:
>> t.s:6: Warning: invalid register expression
>> t.s:7: Warning: invalid register expression
>>
>>
>> Many people do not like bare numbers.  It is a bit like not wearing
>> seatbelts (but so is all assembler code really: you just have to pay
>> attention).  A better argument is that it is harder to read for people
>> not used to assembler code like this.
>>
>> We used to have "#define r0 0" etc., and that was quite problematic.
>> Like that "addi r3,r3,r3" example, but also, people wrote "r0" where
>> only a plain 0 is allowed (like in "lwzx r3,0,r3": "r0" would be
>> misleading there!)
>=20
> So an overarching comment on all of these patches is that they're not
> intended to be ready to merge, nor are they necessarily what I think is
> the best solution. I'm just swinging a big hammer to see how far towards
> LLVM_IAS=3D1 I can get on powerpc, and I accept I'm going to have to come
> back and clean things up.
>=20
> Anyway, noted, I'll push harder on trying to get llvm to accept %rN:
> there was a patch that went in after llvm-11 that should help.

If you put it under ifdef CONFIG_CC_IS_CLANG in the meantime I think=20
that would be okay. Then we get error checking with gcc compiles and
llvm at least builds with its assembler which would be nice.

Thanks,
Nick
