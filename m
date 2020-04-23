Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B721B61BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 19:18:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497PC333WNzDr3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 03:18:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i53lBVKy; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497P8m6Pd5zDr08
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:16:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id e17so2070686qtp.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5BXVGt8IrXWLMSK2GRS/JfPdFF3ur/blx2TC3WrPLDc=;
 b=i53lBVKy4JrYfyemuReQR4AJ4xzGy92QW/4tWe4ccl0YfycnydRVv0ubXPUMLLYaeA
 UNwDv+6JLHOnV3ei7hw06ti0qSGe/Wz8/0AcQp8f+E48ZqBrNn3lQrN3XV/9Qa36F0mY
 qSJ2ftkS6gt1Z+UI4SdG3tdetrTLCxmu505/c7RJZuerQbh1SzWgSeosvYrPaaEZjyMq
 aHmu5a+FDiODxgHcl6hbVBMODk60MJtmocF4EEpIAI+z8+kxKpJCG7Scim3ntqlxXye8
 hP/yOYh3XLfTJQzJvT2XowKItiljAsiESiFW/+u+g5GFe2gb5UAKeEZDNqWodY5aDsuu
 CIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5BXVGt8IrXWLMSK2GRS/JfPdFF3ur/blx2TC3WrPLDc=;
 b=iIQDToZeNyVVzl134CyYybpkUVK9i0EALwNQTq17Sk59rXmOZgzSmuu2rIlwV7bY+0
 HfUyE5hlKTs1waI4vfGV1D0MlYtYhGZG1bpbklC6+SC/MYlJaVnxmKDtDJx3FEEgy1rE
 bp15V/L8SpboMdvred939Tu1l6h1H1rot1rdzr3QCcWp67yxwPP9cWmPfBqlF4BTZ0C+
 X+WgTwmhW4lIbVbCw621z1nrc/q8njlk32cGyxhY3WWqizPEtq3CS1PdjNv8XueF+50W
 a9pYmMxFLq03vIcOexLgFdy0g80nfGFO+iXOQwvhqyjrf3fEUAK+UInYdn+s1ASXJv2g
 5X+g==
X-Gm-Message-State: AGi0PuZhNSRtmXUZW/Fey3S8nfT5zS4mESdcqtn/vfC9ApDFU/ORUr06
 m/JaibPjGJ9a7rPhSbZJJNGXXm2me9TBeg==
X-Google-Smtp-Source: APiQypJ6ghAxj1t1MfOfUpTijCGmfnJcMifDuDP5kCXj/wYBQW8Me8D6HPJcxHt0Ndc2HiqoVI6BHw==
X-Received: by 2002:ac8:189c:: with SMTP id s28mr5106772qtj.65.1587662162421; 
 Thu, 23 Apr 2020 10:16:02 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id v16sm1875776qkf.80.2020.04.23.10.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 10:16:01 -0700 (PDT)
To: Rich Felker <dalias@libc.org>
References: <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
 <20200420172715.GC11469@brightrain.aerifal.cx>
 <1587531042.1qvc287tsc.astroid@bobo.none>
 <20200423023642.GP11469@brightrain.aerifal.cx>
 <a972a0e4-25bd-9cf5-75ec-2eb993ef1b6a@linaro.org>
 <20200423161841.GU11469@brightrain.aerifal.cx>
 <3fe73604-7c92-e073-cbe7-abb4a8ae7c1a@linaro.org>
 <20200423164314.GX11469@brightrain.aerifal.cx>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <64d82a23-1f6e-2e6a-b7a9-0eeab8a53435@linaro.org>
Date: Thu, 23 Apr 2020 14:15:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423164314.GX11469@brightrain.aerifal.cx>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/04/2020 13:43, Rich Felker wrote:
> On Thu, Apr 23, 2020 at 01:35:01PM -0300, Adhemerval Zanella wrote:
>>
>>
>> On 23/04/2020 13:18, Rich Felker wrote:
>>> On Thu, Apr 23, 2020 at 09:13:57AM -0300, Adhemerval Zanella wrote:
>>>>
>>>>
>>>> On 22/04/2020 23:36, Rich Felker wrote:
>>>>> On Wed, Apr 22, 2020 at 04:18:36PM +1000, Nicholas Piggin wrote:
>>>>>> Yeah I had a bit of a play around with musl (which is very nice code I
>>>>>> must say). The powerpc64 syscall asm is missing ctr clobber by the way.  
>>>>>> Fortunately adding it doesn't change code generation for me, but it 
>>>>>> should be fixed. glibc had the same bug at one point I think (probably 
>>>>>> due to syscall ABI documentation not existing -- something now lives in 
>>>>>> linux/Documentation/powerpc/syscall64-abi.rst).
>>>>>
>>>>> Do you know anywhere I can read about the ctr issue, possibly the
>>>>> relevant glibc bug report? I'm not particularly familiar with ppc
>>>>> register file (at least I have to refamiliarize myself every time I
>>>>> work on this stuff) so it'd be nice to understand what's
>>>>> potentially-wrong now.
>>>>
>>>> My understanding is the ctr issue only happens for vDSO calls where it
>>>> fallback to a syscall in case an error (invalid argument, etc. and
>>>> assuming if vDSO does not fallback to a syscall it always succeed).
>>>> This makes the vDSO call on powerpc to have same same ABI constraint
>>>> as a syscall, where it clobbers CR0.
>>>
>>> I think you mean "vsyscall", the old thing glibc used where there are
>>> in-userspace implementations of some syscalls with call interfaces
>>> roughly equivalent to a syscall. musl has never used this. It only
>>> uses the actual exported functions from the vdso which have normal
>>> external function call ABI.
>>
>> I wasn't thinking in vsyscall in fact, which afaik it is a x86 thing.
>> The issue is indeed when calling the powerpc provided functions in 
>> vDSO, which musl might want to do eventually.
> 
> AIUI (at least this is true for all other archs) the functions have
> normal external function call ABI and calling them has nothing to do
> with syscall mechanisms.

My point is powerpc specifically does not follow it, since it issues a
syscall in fallback and its semantic follow kernel syscalls (error
signalled in cr0, r3 being always a positive value):

--
V_FUNCTION_BEGIN(__kernel_clock_gettime)
  .cfi_startproc
        [...]
        /*
         * syscall fallback
         */
99:
        li      r0,__NR_clock_gettime
  .cfi_restore lr
        sc
        blr
  .cfi_endproc
V_FUNCTION_END(__kernel_clock_gettime)


> 
> It looks like we're not using them right now and I'm not sure why. It
> could be that there are ABI mismatch issues (are 32-bit ones
> compatible with secure-plt? are 64-bit ones compatible with ELFv2?) or
> just that nobody proposed adding them. Also as of 5.4 32-bit ppc
> lacked time64 versions of them; not sure if this is fixed yet.

For 64-bit it also have an issue where vDSO does not provide an OPD
for ELFv1, which has bitten glibc while trying to implement an ifunc
optimization. I don't recall any issue for ELFv2.

For 32-bit I am not sure secure-plt will change anything, at least not
on powerpc where we use the same strategy for 64-bit and use a
mtctr/bctr directly.
