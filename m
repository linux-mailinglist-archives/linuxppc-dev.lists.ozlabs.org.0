Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FABC14EBC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 12:33:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488FTD4zXNzDqdT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 22:33:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y8agtGWd; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488FQn3bVczDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 22:30:56 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id c5so5097764qtj.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 03:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nfio+ysRqI89fPGTGmNEiXhSf5UYaEJrWGYmETmZHYk=;
 b=Y8agtGWdvq+C0nlPC31mR202WvKDcM9LbYVmM5vfjAcHkYvZQR16SVECFDQMYTzjd6
 1t+o5DnnR1pI6SOQUpZd/jexYF1o80V/L1Y2Sa/uzZokKUoR6dstEWBM6bWRiP8tA/61
 pdJ3turASJmJQ3WQl0dAv38yftAcXpIDW7RFnnIXnMlmWHnYo5v+wtE3DDhjUxQhX1A3
 R1YozCQapWjfIm5BVfxH/cTemuCCN9jg2IoHOQia6dn3UX2H1jU2lhQlc8mDM5AeOtn7
 8F7K1S3xk5atETqFSuDI/lmQEsuXWu//h4nJ6gxGHOeowQGpEal2lX19Gi9oHPf+FFyY
 q71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nfio+ysRqI89fPGTGmNEiXhSf5UYaEJrWGYmETmZHYk=;
 b=ijk34MuglcJnUIHRGKyJObQBqmNTVKTLepsBSm7EDkAMlYCeDXS8NP5OKwVTRM85kB
 ZVh2F7sQtbyDcPg1+PbIJpIX/xkwfnxE7aU2H0aunaVQ5DRgEisTZNCK7xdSU2+g+/sI
 fwtSNO+WrOHacfrfVBW3wsOR/MmFdNn2XOqBfmFPZgtDLOK9Vta4Bzpj6PmkOnzoki/E
 luCKMTYElZcFkfHgMQjM29icdxca1b8xHuPqCqK6mFTOmtxpkOhPUGoi+ejnt/M58LdG
 X8bKmvKPsz1KaTbPwkCuQ7/qM42vXfaK2cwcdlVUavxhDLYSTGO5Td9KtsMGzyXWJDsL
 VEUQ==
X-Gm-Message-State: APjAAAVCgYS786duQKX7Pwhrt+cINfKAJVfHbA1d+Jxp+WBh/e5QfUTR
 L2nBCxJVqdfFwSp173avQOm4/w==
X-Google-Smtp-Source: APXvYqxm1OSouMpGMRGKA+Tee34oCK+pycnHRZ3LhuvWFn9DqOUucu7uuF93q16CqisAVq08I6iKzA==
X-Received: by 2002:aed:31e2:: with SMTP id 89mr10313816qth.35.1580470249666; 
 Fri, 31 Jan 2020 03:30:49 -0800 (PST)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id s42sm4730259qtk.87.2020.01.31.03.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 03:30:49 -0800 (PST)
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200128200133.GJ22482@gate.crashing.org>
 <87wo9a8cc8.fsf@oldenburg2.str.redhat.com>
 <20200129162947.GN22482@gate.crashing.org>
 <87imku8ac5.fsf@oldenburg2.str.redhat.com>
 <20200129175104.GO22482@gate.crashing.org>
 <87k1595iok.fsf@oldenburg2.str.redhat.com>
 <20200130112512.GS22482@gate.crashing.org>
 <87y2tp40d2.fsf@oldenburg2.str.redhat.com>
 <20200130135030.GV22482@gate.crashing.org>
 <f46bafbd-c553-565a-38a4-73d81cc5a8d2@linaro.org>
 <20200130214105.GX22482@gate.crashing.org>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
Message-ID: <7568c170-55ef-d3b0-fe85-e5bec68c1fe1@linaro.org>
Date: Fri, 31 Jan 2020 08:30:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130214105.GX22482@gate.crashing.org>
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
Cc: Florian Weimer <fweimer@redhat.com>, libc-alpha@sourceware.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/01/2020 18:41, Segher Boessenkool wrote:
> Hi!
> 
> On Thu, Jan 30, 2020 at 02:04:51PM -0300, Adhemerval Zanella wrote:
>> On 30/01/2020 10:50, Segher Boessenkool wrote:
>>> On Thu, Jan 30, 2020 at 01:03:53PM +0100, Florian Weimer wrote:
>>>>> This is why that *is* the only supported use.  The documentation could
>>>>> use a touch-up, I think.  Unless we still have problems here?
>>>>
>>>> I really don't know.  GCC still has *some* support for the old behavior,
>>>> though.
>>>
>>> No.  No support.  It still does some of the same things, but that can
>>> change (and probably should).  But this hasn't been supported since the
>>> dark ages, and the documentation has become gradually more explicit
>>> about it.
>>>
>>
>> I think this might be related to an odd sparc32 issue I am seeing with 
>> newer clock_nanosleep.  The expanded code is:
>>
>> --
>>   register long err __asm__("g1");                                   // INTERNAL_SYSCALL_DECL  (err)
>>   r = ({                                                             // r = INTERNAL_SYSCALL_CANCEL (...)
>> 	 long int sc_ret;
>>          if (SINGLE_THREAD_P)
>> 	   sc_ret = INTERNAL_SYSCALL_CALL (__VA_ARGS__);
>>          else
>>            {
>> 	     int sc_cancel_oldtype = __libc_enable_asynccancel ();
>> 	     sc_ret = INTERNAL_SYSCALL_CALL (__VA_ARGS__);          // It issues the syscall with the asm (...)
>> 	     __librt_disable_asynccancel (sc_cancel_oldtype);
>> 	   }
>>          sc_ret;
>>        });
>>   if ((void) (val), __builtin_expect((err) != 0, 0))                // if (! INTERNAL_SYSCALL_ERROR_P (r, err))
>>     return 0;
>>   if ((-(val)) != ENOSYS)                                           // if (INTERNAL_SYSCALL_ERRNO (r, err) != ENOSYS)
>>     return ((-(val)));                                              //   return INTERNAL_SYSCALL_ERRNO (r, err);
>>
>>   [...]
>>
>>   r = ({                                                             // r = INTERNAL_SYSCALL_CANCEL (...)
>>        [...]
>>       )}
>>   if ((void) (val), __builtin_expect((err) != 0, 0))                // if (! INTERNAL_SYSCALL_ERROR_P (r, err))
>>     {
>>       [...]
>>     }
>>   return ((void) (val), __builtin_expect((err) != 0, 0))            // return (INTERNAL_SYSCALL_ERROR_P (r, err)
>>          ? ((-(val))) : 0;                                          //        ? INTERNAL_SYSCALL_ERRNO (r, err) : 0);
>> --
>>
>> It requires that 'err' (assigned to 'g1')
> 
> What do you mean by "assigned to g1"?

I meant 'err' being a local register variable.

> 
>> be value propagated over
>> functions calls and over different scopes, which I take from your 
>> explanation is not supported and fragile.
> 
> You probably misundertand that, but let me ask: where is err assigned to
> at all in the code you quoted?  I don't see it.  Maybe it's hidden in some
> macro?

Indeed it was not explicit in the example code, it is burried in the
INTERNAL_SYSCALL_CALL macro which calls sparc-defined macros. For instance, 
with 6 argument kernel syscall, it issues:

#define inline_syscall6(string,err,name,arg1,arg2,arg3,arg4,arg5,arg6)  \
({                                                                      \
        register long __o0 __asm__ ("o0") = (long)(arg1);               \
        register long __o1 __asm__ ("o1") = (long)(arg2);               \
        register long __o2 __asm__ ("o2") = (long)(arg3);               \
        register long __o3 __asm__ ("o3") = (long)(arg4);               \
        register long __o4 __asm__ ("o4") = (long)(arg5);               \
        register long __o5 __asm__ ("o5") = (long)(arg6);               \
        err = name;                                                     \
        __asm __volatile (string : "=r" (err), "=r" (__o0) :            \
                          "0" (err), "1" (__o0), "r" (__o1),            \
                          "r" (__o2), "r" (__o3), "r" (__o4),           \
                          "r" (__o5) :                                  \
                          __SYSCALL_CLOBBERS);                          \
        __o0;                                                           \
})

Where 'err' defined by 'INTERNAL_SYSCALL_DECL' should be the 'err' macro
argument.

> 
> Or, maybe some asm writes to g1?  This is explicitly not okay (quote
> from the GCC manual):

Yes, that's the case.

> 
>   Defining a register variable does not reserve the register.  Other than
>   when invoking the Extended 'asm', the contents of the specified register
>   are not guaranteed.  For this reason, the following uses are explicitly
>   _not_ supported.  If they appear to work, it is only happenstance, and
>   may stop working as intended due to (seemingly) unrelated changes in
>   surrounding code, or even minor changes in the optimization of a future
>   version of gcc:
> 
>    * Passing parameters to or from Basic 'asm'
>    * Passing parameters to or from Extended 'asm' without using input or
>      output operands.
>    * Passing parameters to or from routines written in assembler (or
>      other languages) using non-standard calling conventions.
> 
>> It also seems that if I 
>> move the __libc_enable_* calls before 'err' initialization and after
>> its usage the code seems to works, but again it seems this usage
>> is not really supported on gcc.
>>
>> So it seems that the current usage of 'INTERNAL_SYSCALL_DECL' and
>> 'INTERNAL_SYSCALL_ERROR_P' are fragile if the architecture *does*
>> use the 'err' variable and it is defined a register alias (which 
>> its the case only for sparc currently).
>>
>> Although a straightforward for sparc would be redefine 
>> INTERNAL_SYSCALL_DECL to not use a register alias, I still think
>> we should just follow Linux kernel ABI convention where value in 
>> the range between -4095 and -1 indicates an error and handle any 
>> specific symbols that might not strictly follow it with an 
>> arch-specific implementation (as we do for lseek on x32 and
>> mips64n32).  It would allow cleanup a lot of code and avoid such
>> pitfalls.
> 
> I don't really understand what you call a "register alias", either.
> (And i don't know the Sparc ABI well enough to help you with that).

I meant a register variable where its use 'after' the extended asm
is expected to use the define register.

