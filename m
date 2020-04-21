Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DC1B2B29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:30:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4966vW6lHdzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oQ/X95UQ; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4966FR6SlvzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 01:00:43 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id m67so14699793qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XI/xti7BKULte6iLtw6EFGH1Z+Qa6SNciCFlaJmHJKM=;
 b=oQ/X95UQP4Bx+d2v0PSA/7abKeVQEx9oLvISeTcPsRu+0+ywiCf0QqUqPZ1y060G+0
 rBO1M5gDzBTAnQ43HykYUJOVUs1WhsA/lqr2HjO4gwuyU0zt/MJtBM5ZnzRycLIWDKC1
 sKoLYzOy45w5vCPu/+bo43AcDa9aOmV5aqIh4ve9h4WWIWsqmgqAy+umAjHx75g7HD4J
 KE/i6yMxKRrUnD+J0LoyVV+RO6jtCasljxdw0yQenzmQwmLAQU2uN6dJMeTACCVBMo38
 NVsT6ooIrtW9FD2h5qKJeUbabCBm1Z++zu4KmaGBtEejBgFQRliSVLiP+NkxYAS+4sRL
 GHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XI/xti7BKULte6iLtw6EFGH1Z+Qa6SNciCFlaJmHJKM=;
 b=Xac558mUQIF0C9ggXlXi7JN6kja+Gy3iE5a/Y+GJD1br5UQF8FnFexjDXFcUq2NA1q
 vwAXsNf47jlnpD7i6ZWvuiW4b9BA+lkCJuyAlkQfh/IZhyca1mjf5f+Ug9l9nufNJDX9
 XhuInEMTqAvX214DX8AWLxEbK5N1BvxwFBwqtxNZaXKZgscxTNdpzHeqfCredal21Qwx
 +m61hbIp1T3VQLu/j0f2Byfpf89/bmLb+lNUkcL5scCxGXKEMgvLMSOtFkWjmNM81Axv
 feX/9y8yi9eE3Uops2S1POs4+/iTAL5WK8Q0ii/xyXI5F3yH6QrWQRzb8okp4uRq98UE
 7a1w==
X-Gm-Message-State: AGi0PubAnWajD2BWsKHZLbNs4JaWDWVg/DEn39GRSez0f+1OsPEHT0nE
 eb4mlWeEnSJN4jISIOO8Ss4fhA==
X-Google-Smtp-Source: APiQypKMKXAKVP/8DuVaxatICi0T5TvVtsXkNSejP/fGj7oisNbbh59nJ8buE1kWvGtGuHbB9VbcIw==
X-Received: by 2002:a37:d287:: with SMTP id f129mr21396715qkj.52.1587481235348; 
 Tue, 21 Apr 2020 08:00:35 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id 65sm1869167qkf.79.2020.04.21.08.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 08:00:34 -0700 (PDT)
To: Rich Felker <dalias@libc.org>, David Laight <David.Laight@ACULAB.COM>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
 <20200421143941.GJ11469@brightrain.aerifal.cx>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <960127e0-57a0-55b4-f309-ae0a675c7756@linaro.org>
Date: Tue, 21 Apr 2020 12:00:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421143941.GJ11469@brightrain.aerifal.cx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 'Nicholas Piggin' <npiggin@gmail.com>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/04/2020 11:39, Rich Felker wrote:
> On Tue, Apr 21, 2020 at 12:28:25PM +0000, David Laight wrote:
>> From: Nicholas Piggin
>>> Sent: 20 April 2020 02:10
>> ...
>>>>> Yes, but does it really matter to optimize this specific usage case
>>>>> for size? glibc, for instance, tries to leverage the syscall mechanism
>>>>> by adding some complex pre-processor asm directives.  It optimizes
>>>>> the syscall code size in most cases.  For instance, kill in static case
>>>>> generates on x86_64:
>>>>>
>>>>> 0000000000000000 <__kill>:
>>>>>    0:   b8 3e 00 00 00          mov    $0x3e,%eax
>>>>>    5:   0f 05                   syscall
>>>>>    7:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
>>>>>    d:   0f 83 00 00 00 00       jae    13 <__kill+0x13>
>>
>> Hmmm... that cmp + jae is unnecessary here.
> 
> It's not.. Rather the objdump was just mistakenly done without -r so
> it looks like a nop jump rather than a conditional tail call to the
> function that sets errno.
> 

Indeed, the output with -r is:

0000000000000000 <__kill>:
   0:   b8 3e 00 00 00          mov    $0x3e,%eax
   5:   0f 05                   syscall 
   7:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
   d:   0f 83 00 00 00 00       jae    13 <__kill+0x13>
                        f: R_X86_64_PLT32       __syscall_error-0x4
  13:   c3                      retq   

And for x86_64 __syscall_error is defined as:

0000000000000000 <__syscall_error>:
   0:   48 f7 d8                neg    %rax

0000000000000003 <__syscall_error_1>:
   3:   64 89 04 25 00 00 00    mov    %eax,%fs:0x0
   a:   00
                        7: R_X86_64_TPOFF32     errno
   b:   48 83 c8 ff             or     $0xffffffffffffffff,%rax
   f:   c3                      retq

Different than musl, each architecture defines its own error handling
mechanism (some embedded errno setting in syscall itself, other branches
to a __syscall_error like function as x86_64).  

This is due most likely from the glibc long history.  One of my long 
term plan is to just simplify, get rid of the assembly pre-processor,
implement all syscall in C code, and set error handling mechanism in
a platform neutral way using a tail call (most likely you do on musl).

>> It is also a 32bit offset jump.
>> I also suspect it gets predicted very badly.
> 
> I doubt that. This is a very standard idiom and the size of the offset
> (which is necessarily 32-bit because it has a relocation on it) is
> orthogonal to the condition on the jump.
> 
> FWIW a syscall like kill takes global kernel-side locks to be able to
> address a target process by pid, and the rate of meaningful calls you
> can make to it is very low (since it's bounded by time for target
> process to act on the signal). Trying to optimize it for speed is
> pointless, and even size isn't important locally (although in
> aggregate, lots of wasted small size can add up to more pages = more
> TLB entries = ...).

I agree and I would prefer to focus on code simplicity to have a
platform neutral way to handle error and let the compiler optimize
it than messy with assembly macros to squeeze this kind of
micro-optimizations.

> 
>>>>>   13:   c3                      retq
>>>>>
>>>>> While on musl:
>>>>>
>>>>> 0000000000000000 <kill>:
>>>>>    0:	48 83 ec 08          	sub    $0x8,%rsp
>>>>>    4:	48 63 ff             	movslq %edi,%rdi
>>>>>    7:	48 63 f6             	movslq %esi,%rsi
>>>>>    a:	b8 3e 00 00 00       	mov    $0x3e,%eax
>>>>>    f:	0f 05                	syscall
>>>>>   11:	48 89 c7             	mov    %rax,%rdi
>>>>>   14:	e8 00 00 00 00       	callq  19 <kill+0x19>
>>>>>   19:	5a                   	pop    %rdx
>>>>>   1a:	c3                   	retq
>>>>
>>>> Wow that's some extraordinarily bad codegen going on by gcc... The
>>>> sign-extension is semantically needed and I don't see a good way
>>>> around it (glibc's asm is kinda a hack taking advantage of kernel not
>>>> looking at high bits, I think), but the gratuitous stack adjustment
>>>> and refusal to generate a tail call isn't. I'll see if we can track
>>>> down what's going on and get it fixed.
>>
>> A suitable cast might get rid of the sign extension.
>> Possibly just (unsigned int).
> 
> No, it won't. The problem is that there is no representation of the
> fact that the kernel is only going to inspect the low 32 bits (by
> declaring the kernel-side function as taking an int argument). The
> external kill function receives arguments by the ABI, where the upper
> bits of int args can contain junk, and the asm register constraints
> for syscalls use longs (or rather an abstract syscall-arg type). It
> wouldn't even work to have macro magic detect that the expressions
> passed are ints and use hacks to avoid that, since it's perfectly
> valid to pass an int to a syscall that expects a long argument (e.g.
> offset to mmap), in which case it needs to be sign-extended.
> 
> The only way to avoid this is encoding somewhere the syscall-specific
> knowledge of what arg size the kernel function expects. That's way too
> much redundant effort and too error-prone for the incredibly miniscule
> size benefit you'd get out of it.
> 
> Rich
> 
