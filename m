Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E11ACF84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 20:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4936y85T9czDsGt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ga3s9lwV; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4936tL5PSSzDrQ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 04:18:50 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id d6so1037961qvy.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Qi0HDVWGPJkXfVEyxRCoZzpUqh/lrO9FkaHwrFFh24=;
 b=ga3s9lwVFZ0AmT7MfpsD/6A4JkjXxM7BTdNRZVPmAlGCq6AMmonwyJSBUciYNS3aej
 g5eh1UD4cqsMvHvXp6Tz8q4jLruWwT7KG5cuKXSzUrnPkyTd3N41O9ZKTk1YJPhViFdx
 rBcgF0zOA0jxJGJ09+zudIcKix0ZXC7QxiMPi1H/og9SstgBo/QTFctO6buvdH9DATnM
 ziCbvIgBacFUS3AdtUXZyULiyc+RPICwuaDv4WyvtAU5Did1VLkOLyQ4/IyNplUeS7Ge
 IXaIIqEOdVvzcTczOpMBQiU+IQA5FczHynAiYmSc8y97IeqzKLVSlYYTIjOgMeQQMHqY
 r5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0Qi0HDVWGPJkXfVEyxRCoZzpUqh/lrO9FkaHwrFFh24=;
 b=XFc0dDjeX8soxj26uUwF7NiW6AwZZcIUB7bY2Gvepijie1VQX+4Z8Bf1jj26c63ddG
 rNx6xxEW0WbtMcIeaOcCfirNUr04QEmxsjoVQuBBJftZgMWZRqI8FKoWYOVbcSQ4mI37
 qAAQDvaSBVJ3uWNTR1vPChtrZREPsCigWB9ubnMkdXoRCN+o5XKQ0LhF1gL6YBzXw5iA
 2ARl4fLtigAv1mfk84Qp6ALxfXTHVJWYPzS0pXA8c+L3V+Uiks6EmukNKNkb0mKWMq/p
 VqXZigew7S8h6MuRIOuM/ayx9yvbFd7IW/CVpD6eCuj7HTvdbG4tJPeClpnIE/wbGoFS
 6Khw==
X-Gm-Message-State: AGi0PubpFUqfTy3KaNCUQDYh48G+rdD3ThmxXrfldIb4HZJNyJlIx9TS
 lHpZoFFtMQJ9w6qNymxlcMeKhw==
X-Google-Smtp-Source: APiQypLZZaaGyAoCR+wNWbAK6Mh0agBqM55xQz9k4JUpJU4xveM5VRf/8OWz+NxJgSSDPz3+9HaHVg==
X-Received: by 2002:a0c:aa51:: with SMTP id e17mr11101535qvb.95.1587061126159; 
 Thu, 16 Apr 2020 11:18:46 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id 60sm15571409qtb.95.2020.04.16.11.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 11:18:45 -0700 (PDT)
To: Rich Felker <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
Date: Thu, 16 Apr 2020 15:18:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416175932.GZ11469@brightrain.aerifal.cx>
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
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/04/2020 14:59, Rich Felker wrote:
> On Thu, Apr 16, 2020 at 02:50:18PM -0300, Adhemerval Zanella wrote:
>>
>>
>> On 16/04/2020 12:37, Rich Felker wrote:
>>> On Thu, Apr 16, 2020 at 11:16:04AM -0300, Adhemerval Zanella wrote:
>>>>> My preference would be that it work just like the i386 AT_SYSINFO
>>>>> where you just replace "int $128" with "call *%%gs:16" and the kernel
>>>>> provides a stub in the vdso that performs either scv or the old
>>>>> mechanism with the same calling convention. Then if the kernel doesn't
>>>>> provide it (because the kernel is too old) libc would have to provide
>>>>> its own stub that uses the legacy method and matches the calling
>>>>> convention of the one the kernel is expected to provide.
>>>>
>>>> What about pthread cancellation and the requirement of checking the
>>>> cancellable syscall anchors in asynchronous cancellation? My plan is
>>>> still to use musl strategy on glibc (BZ#12683) and for i686 it 
>>>> requires to always use old int$128 for program that uses cancellation
>>>> (static case) or just threads (dynamic mode, which should be more
>>>> common on glibc).
>>>>
>>>> Using the i686 strategy of a vDSO bridge symbol would require to always
>>>> fallback to 'sc' to still use the same cancellation strategy (and
>>>> thus defeating this optimization in such cases).
>>>
>>> Yes, I assumed it would be the same, ignoring the new syscall
>>> mechanism for cancellable syscalls. While there are some exceptions,
>>> cancellable syscalls are generally not hot paths but things that are
>>> expected to block and to have significant amounts of work to do in
>>> kernelspace, so saving a few tens of cycles is rather pointless.
>>>
>>> It's possible to do a branch/multiple versions of the syscall asm for
>>> cancellation but would require extending the cancellation handler to
>>> support checking against multiple independent address ranges or using
>>> some alternate markup of them.
>>
>> The main issue is at least for glibc dynamic linking is way more common
>> than static linking and once the program become multithread the fallback
>> will be always used.
> 
> I'm not relying on static linking optimizing out the cancellable
> version. I'm talking about how cancellable syscalls are pretty much
> all "heavy" operations to begin with where a few tens of cycles are in
> the realm of "measurement noise" relative to the dominating time
> costs.

Yes I am aware, but at same time I am not sure how it plays on real world.
For instance, some workloads might issue kernel query syscalls, such as
recv, where buffer copying might not be dominant factor. So I see that if
the idea is optimizing syscall mechanism, we should try to leverage it
as whole in libc.

> 
>> And besides the cancellation performance issue, a new bridge vDSO mechanism
>> will still require to setup some extra bridge for the case of the older
>> kernel.  In the scheme you suggested:
>>
>>   __asm__("indirect call" ... with common clobbers);
>>
>> The indirect call will be either the vDSO bridge or an libc provided that
>> fallback to 'sc' for !PPC_FEATURE2_SCV. I am not this is really a gain
>> against:
>>
>>    if (hwcap & PPC_FEATURE2_SCV) {
>>      __asm__(... with some clobbers);
>>    } else {
>>      __asm__(... with different clobbers);
>>    }
> 
> If the indirect call can be made roughly as efficiently as the sc
> sequence now (which already have some cost due to handling the nasty
> error return convention, making the indirect call likely just as small
> or smaller), it's O(1) additional code size (and thus icache usage)
> rather than O(n) where n is number of syscall points.
> 
> Of course it would work just as well (for avoiding O(n) growth) to
> have a direct call to out-of-line branch like you suggested.

Yes, but does it really matter to optimize this specific usage case
for size? glibc, for instance, tries to leverage the syscall mechanism 
by adding some complex pre-processor asm directives.  It optimizes
the syscall code size in most cases.  For instance, kill in static case 
generates on x86_64:

0000000000000000 <__kill>:
   0:   b8 3e 00 00 00          mov    $0x3e,%eax
   5:   0f 05                   syscall 
   7:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
   d:   0f 83 00 00 00 00       jae    13 <__kill+0x13>
  13:   c3                      retq   

While on musl:

0000000000000000 <kill>:
   0:	48 83 ec 08          	sub    $0x8,%rsp
   4:	48 63 ff             	movslq %edi,%rdi
   7:	48 63 f6             	movslq %esi,%rsi
   a:	b8 3e 00 00 00       	mov    $0x3e,%eax
   f:	0f 05                	syscall 
  11:	48 89 c7             	mov    %rax,%rdi
  14:	e8 00 00 00 00       	callq  19 <kill+0x19>
  19:	5a                   	pop    %rdx
  1a:	c3                   	retq   

But I hardly think it pays off the required code complexity.  Some
for providing a O(1) bridge: this will require additional complexity
to write it and setup correctly.

> 
>> Specially if 'hwcap & PPC_FEATURE2_SCV' could be optimized with a 
>> TCB member (as we do on glibc) and if we could make the asm clever
>> enough to not require different clobbers (although not sure if
>> it would be possible).
> 
> The easy way not to require different clobbers is just using the union
> of the clobbers, no? Does the proposed new method clobber any
> call-saved registers that would make it painful (requiring new call
> frames to save them in)?

As far I can tell, it should be ok.
