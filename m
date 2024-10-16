Return-Path: <linuxppc-dev+bounces-2329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532D9A1581
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 00:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTQ2M075Cz2yj3;
	Thu, 17 Oct 2024 09:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::341"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729116186;
	cv=none; b=FEoAHrJ0K5zi62JGAOgxO4ZWNjQILsK37r2+NUDDi/tC2zqyPsbDtCICPVWEczCCgqwoDl9Iny2Zh/gi4XesZ9YP/LZF0oRlXzknhSu4xYTXYhvnJVRgSUGvkDLm3ODGx8BSwLXaX8R7CCRAY9uscKAWgV7QUIYe/pfZTUVwUX7Wn5J2oHFKs9L6xuj9GhXwADPmCIS0fzNuzDHTc8FLmNUc1SDxHm1SnYAKtIGq1EfSAD2Ue8CdHEhJBNZ8lMkOjl87cT0qlYQGtyhblQK1p4lxl6PyPPPeQjLuirJ9hRkVbqV7YQzV0dtf8GpSu4enzJ0olw1Gb80F20MBTpukHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729116186; c=relaxed/relaxed;
	bh=lw+G++VSvmxcxeeZ0mJONNsOnCMyraOAzUktdYVG68M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=De1Zee/Lq4bxkcBMegHd7UAysH4F6W9EmNiqWeOBx7tJW2WpOzea4CcI1nY2O0nc/bi+M5RRW6cuObhw8Zq7qxzPg81ZO3Cast1gbyqy/jehxFZGt1ITW0LPj06Is4fSL+HQOnIS635th2M8IKBDeQgBWP215J8dwDnosHE8BnIdnaJE0VToTWpUa9wQT6tc6CFmhowoEns+e4GXSzuMUKy5W2A6dcFMHHbQUBzVWIiuqoeZoGM23tBH57z96LSnG73gNdnM0vg/RfAhg7Yz92LdvC81Q/9NbePphbMjeV6uI6RJQyjr41kLjF4ZoIHtDL3/BCcBmXbnm6j6j5otfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=INb6OjHJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=cloud.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=INb6OjHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTQ2K1jC3z2xjY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 09:03:03 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4311420b675so3049105e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 15:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729116178; x=1729720978; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lw+G++VSvmxcxeeZ0mJONNsOnCMyraOAzUktdYVG68M=;
        b=INb6OjHJ/8eFssl/tRqTBV8uKlRV3n+K39LfbZ3H6s8E8CtrUYfeQuouW1CGjUPVn6
         xjWdgT1L50L0IsCTOTT8ItsE0MZ/EiaD9V8Ym5de6F3hhz0eRvquJu4hygRZmKcsdLas
         ERRSWMAvzwAZSf6dyBN4veG+OPmPUI08votbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729116178; x=1729720978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw+G++VSvmxcxeeZ0mJONNsOnCMyraOAzUktdYVG68M=;
        b=LoVYd703aUIETUHw0fCVj2BrSrAF3rmuybe35MI2Y2MsBR6Cx8LWxNjzokmilUhXyM
         sHgb07D+C+88EptJO6eLKxAh38GA3EmmTMTqgOhfTJXf4nEd8k6qQMUjWmjG22waIdle
         gDSDyNYXOFZ/UGO+dwhw+SRGWOHRafM+/O/L3qeCszSbPC1VTEFOpjoAs9luI4Jr6wDS
         Nn5N8SvE80Y0WA/4/CKwT2Vr6gi2eIDQN+gSEFuzyJnQ3zO+EhdxpqPszRh5rlRqe20X
         6uNeLJCUsRF/0u5vJl7ZUcYCieyKEEKEiaCIT1iXPN2EPIRpNNpGP9wbliHdv+E5FQwC
         timA==
X-Forwarded-Encrypted: i=1; AJvYcCWY3gRHWOA50Vb2PhqmzS4kgWMrpah+tBugN/P/MkEnTFYWPfJxDhdm/oQCbY9ltv1USKsmRlxhnVD0i/I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpthBUvzrPj9o87CYmkwyRFb8E3Fp0EXFVzEoCDcQYYeDxeduo
	O/XB6kz3ehBlICoqPKZLbgV/0HpFK0nzWYQBCSrOzAMOHiwkIOCDVSN9SeCdH4w=
X-Google-Smtp-Source: AGHT+IFNsUAHTzlxA7306agUGXD14h99F0kq7yZIZc/FM7H7WZhCBdhkEV0dsZ7po53HWZCmDocK3w==
X-Received: by 2002:a05:600c:4f05:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4314a381618mr40978255e9.23.1729116178104;
        Wed, 16 Oct 2024 15:02:58 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c3bdfbsm6008665e9.11.2024.10.16.15.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 15:02:57 -0700 (PDT)
Message-ID: <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
Date: Wed, 16 Oct 2024 23:02:56 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 16/10/2024 5:10 pm, Linus Torvalds wrote:
>   --- a/arch/x86/lib/getuser.S
>   +++ b/arch/x86/lib/getuser.S
>   @@ -37,11 +37,14 @@
>
>    #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
>
>   +#define X86_CANONICAL_MASK ALTERNATIVE \
>   +     "movq $0x80007fffffffffff,%rdx", \
>   +     "movq $0x80ffffffffffffff,%rdx", X86_FEATURE_LA57
>   +
>    .macro check_range size:req
>    .if IS_ENABLED(CONFIG_X86_64)
>   -     mov %rax, %rdx
>   -     sar $63, %rdx
>   -     or %rdx, %rax
>   +     X86_CANONICAL_MASK      /* mask into %rdx */
>   +     and %rdx,%rax

That doesn't have the same semantics, does it?

Consider userspace passing an otherwise-good pointer with bit 60 set. 
Previously that would have resulted in a failure, whereas now it will
succeed.


If AMD think it's appropriate, then what you probably want is the real
branch as per before (to maintain architectural user behaviour), and
then use a trick such as this one in place of the LFENCE for speed in
the common case.

> But in (related) news, the address masking trick really does matter:
>
>    https://lore.kernel.org/all/202410161557.5b87225e-oliver.sang@intel.com/
>
> which reports that ridiculous 6.8% improvement just from avoiding the
> barrier in user_access_begin().
>
> So that barrier really *is* very expensive. Surprisingly so.

7% performance is what it costs to maintain the security barrier we were
sold originally.

Then it's a lot of time, arguing in public, and wild guesswork over
explicitly undocumented properties that the vendors would prefer not to
discuss, to try and claw some of that 7% back while keeping the security
barrier intact for the benefit of users who want it both secure and fast.

Forgive me if I think that we (the SW people) are getting the raw end of
the deal here, while vendors keep selling more and more expensive chips
that don't work safely.

~Andrew

