Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 728241AC58A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:23:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4931fV5CxWzDr0k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hbNqsvpq; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4931VW2bd7zDrgB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:16:12 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id c63so21433096qke.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2jRFHI5ps3vdsSbzjWk+rLpcuOkC9rFVTgqe62WLobQ=;
 b=hbNqsvpqsSCfz2fIUTF6HLg0dUF+BzLzzLC4HCtgrmBu1Nju8hDzRRwqIipPHfmBNW
 W86NWJETMOZZbjzGsEfeh7E6HCFCOKbDCUNF54OF4GKCau8KKsIkk+I9v7l+sqtSJ88j
 px9R0Ko+PKoZVe6y0x5OatIEiYlt5ImoJh1ZjiECLf74iia5lq2IUSG0Ea9HD/sFm09h
 MsdqyCVHl6D2pNP7a6YgSnuxPyENME9QUy4IKjoFd8EG4xJ7ebSTRXSEAtzosM8J32kF
 zqRkg1IC2lu3YTZTPuXV8cRQiGh115eLor/UF0LQvDimwftxmm3kPAZBYZI7el3PacTY
 Y4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2jRFHI5ps3vdsSbzjWk+rLpcuOkC9rFVTgqe62WLobQ=;
 b=CvyNueaMDYtynGdO6Gbp1HnzNZNxLLBNbZ9juWUv22pOMAFFM7dznh7clBGUtjv6GF
 HlnNTnre8nNL4C2COm1viIaCTm6LkC7ckB3HMWqK0caPSSpBbKeLPQJv8umQjjpjX+5u
 1H4FeNxcPZvNeNZKNjKQq2j+otlwNHfAvc7bYQwB5Qz1DQ4Ou77/KTsHSA5kuTJhGrfp
 nRaJjny0S7f4p/Duqk5rVMgjG3iqS8zGWHTWmUcz4Ym9vydzhGcHMOLsU6cd8zOnknN8
 cGE1G+MNMpAN70Fzj2nS7IAKCoYTt3oF4TlanYiwe+3ooHyaMXkIuqWN6GqqNs+7zlOR
 3ROA==
X-Gm-Message-State: AGi0PuYVMdN3h/xnLyDDwJ0eOHIYZZsBuyBfCQnbGdEvmZSUrbeiPFIY
 IHlrlZJqt8To8zn5N2+FKi5iCg==
X-Google-Smtp-Source: APiQypLDSe5hHXmdzUMIU98nZUyVhdL6HOQ5VbrEfVST3BIp/kewsfhKVQ5xV+GtSPwt0P5uWCVVWA==
X-Received: by 2002:a37:8741:: with SMTP id j62mr29962996qkd.441.1587046568837; 
 Thu, 16 Apr 2020 07:16:08 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id c33sm11547365qtb.76.2020.04.16.07.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 07:16:08 -0700 (PDT)
To: Rich Felker <dalias@libc.org>, Nicholas Piggin <npiggin@gmail.com>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
Date: Thu, 16 Apr 2020 11:16:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415225539.GL11469@brightrain.aerifal.cx>
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
Cc: musl@lists.openwall.com, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/04/2020 19:55, Rich Felker wrote:
> On Thu, Apr 16, 2020 at 07:45:09AM +1000, Nicholas Piggin wrote:
>> I would like to enable Linux support for the powerpc 'scv' instruction,
>> as a faster system call instruction.
>>
>> This requires two things to be defined: Firstly a way to advertise to 
>> userspace that kernel supports scv, and a way to allocate and advertise
>> support for individual scv vectors. Secondly, a calling convention ABI
>> for this new instruction.
>>
>> Thanks to those who commented last time, since then I have removed my
>> answered questions and unpopular alternatives but you can find them
>> here
>>
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-January/203545.html
>>
>> Let me try one more with a wider cc list, and then we'll get something
>> merged. Any questions or counter-opinions are welcome.
>>
>> System Call Vectored (scv) ABI
>> ==============================
>>
>> The scv instruction is introduced with POWER9 / ISA3, it comes with an
>> rfscv counter-part. The benefit of these instructions is performance
>> (trading slower SRR0/1 with faster LR/CTR registers, and entering the
>> kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR 
>> updates. The scv instruction has 128 interrupt entry points (not enough 
>> to cover the Linux system call space).
>>
>> The proposal is to assign scv numbers very conservatively and allocate 
>> them as individual HWCAP features as we add support for more. The zero 
>> vector ('scv 0') will be used for normal system calls, equivalent to 'sc'.
>>
>> Advertisement
>>
>> Linux has not enabled FSCR[SCV] yet, so the instruction will cause a
>> SIGILL in current environments. Linux has defined a HWCAP2 bit 
>> PPC_FEATURE2_SCV for SCV support, but does not set it.
>>
>> When scv instruction support and the scv 0 vector for system calls are 
>> added, PPC_FEATURE2_SCV will indicate support for these. Other vectors 
>> should not be used without future HWCAP bits indicating support, which is
>> how we will allocate them. (Should unallocated ones generate SIGILL, or
>> return -ENOSYS in r3?)
>>
>> Calling convention
>>
>> The proposal is for scv 0 to provide the standard Linux system call ABI 
>> with the following differences from sc convention[1]:
>>
>> - LR is to be volatile across scv calls. This is necessary because the 
>>   scv instruction clobbers LR. From previous discussion, this should be 
>>   possible to deal with in GCC clobbers and CFI.
>>
>> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow the
>>   kernel system call exit to avoid restoring the CR register (although 
>>   we probably still would anyway to avoid information leak).
>>
>> - Error handling: I think the consensus has been to move to using negative
>>   return value in r3 rather than CR0[SO]=1 to indicate error, which matches
>>   most other architectures and is closer to a function call.
>>
>> The number of scratch registers (r9-r12) at kernel entry seems 
>> sufficient that we don't have any costly spilling, patch is here[2].  
>>
>> [1] https://github.com/torvalds/linux/blob/master/Documentation/powerpc/syscall64-abi.rst
>> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204840.html
> 
> My preference would be that it work just like the i386 AT_SYSINFO
> where you just replace "int $128" with "call *%%gs:16" and the kernel
> provides a stub in the vdso that performs either scv or the old
> mechanism with the same calling convention. Then if the kernel doesn't
> provide it (because the kernel is too old) libc would have to provide
> its own stub that uses the legacy method and matches the calling
> convention of the one the kernel is expected to provide.

What about pthread cancellation and the requirement of checking the
cancellable syscall anchors in asynchronous cancellation? My plan is
still to use musl strategy on glibc (BZ#12683) and for i686 it 
requires to always use old int$128 for program that uses cancellation
(static case) or just threads (dynamic mode, which should be more
common on glibc).

Using the i686 strategy of a vDSO bridge symbol would require to always
fallback to 'sc' to still use the same cancellation strategy (and
thus defeating this optimization in such cases).

> Note that any libc that actually makes use of the new functionality is
> not going to be able to make clobbers conditional on support for it;
> branching around different clobbers is going to defeat any gains vs
> always just treating anything clobbered by either method as clobbered.
> Likewise, it's not useful to have different error return mechanisms
> because the caller just has to branch to support both (or the
> kernel-provided stub just has to emulate one for it; that could work
> if you really want to change the bad existing convention).
> 
> Thoughts?
> 
> Rich
> 
