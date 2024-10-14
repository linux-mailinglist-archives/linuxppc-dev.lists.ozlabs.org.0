Return-Path: <linuxppc-dev+bounces-2229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D099D38E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 17:39:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS1ck5FXDz2y64;
	Tue, 15 Oct 2024 02:39:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728920374;
	cv=none; b=AEYGabKc+FKYDD575t8A0rJUYcymhm0+3TduwnLNkNMk/9oA50jrVd0QR5QH4Yj0hlCbaGfoVMG9ZG74SvgYr4Z0rB3GHei3IYXjtAAvRz0KGrvmR2QullMECKlQvsIHgIz03yuoz/+PXCJP9ZA1V22BxAwxYzeiAmPfEiUagg0g4/jHTCbviCP5yX5R/rKyayzYzG5qltTP7ur3K3/MD9WDQJPcDX4PZJbrYmiHijVDXhRgy/q1ORjSLfNN6kmw3smWyW1APKxELHTMHKVgwo4DN5erdh67ARHtt+DL7x+WRPkuRGjUwHG0NHeEbHbV7PKjQNJbZmQ4kI0I8UVkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728920374; c=relaxed/relaxed;
	bh=gfM9f+hWey0CtNaI1SUKa6vEq+PwT8U4friQEoRedHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjbm66r4+PzG9s1Xdr6O/DOF7MeAHxuiycMsUWkChBBLikMtFudhcLTptk8FsYbxIrRKm3R2e9TmFrvOp+fpROF1zCI0qUJp8sKKtR3yY1IH7RDXq4kCPQIQ8lkVM8PQNPn6C66N6UoGFt28FIFR96z+9Oy40IgciqP65yOVLk9sMbDmoWHfqK43stsg7A97/shPhDQxzcOFEfMvretOIMyAwtUnQXMjdae2O2ebBUaZ6/W5P01gGQxz3QVEk37BztUEPskIywJkWCcHnpNVzwdjxGjU6a7JFV4aPjoeAjf7gt+fZ+11hIgfEJVmpKJtdOOj5JvLSA4f8bJ5ki+k8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=vaoCAk4R; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=cloud.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=vaoCAk4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS1cj1Nrlz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 02:39:31 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99f646ff1bso294351766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 08:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728920369; x=1729525169; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gfM9f+hWey0CtNaI1SUKa6vEq+PwT8U4friQEoRedHw=;
        b=vaoCAk4RJpI0Cx5rtwkMwiLetNQTT4kqgEdrcPTWmLaIdPl+Npp9KMJuzd5pior4CL
         dpYZ5y+ARRnTqhvdRpiKtw15efP6l9kAY7UfGSExheQOMp67WI4RBmMIdFbAcvzy6vT9
         Lo7v12MF6n9zJZ5s8PZu1pMmgfKJMoMSKUMrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728920369; x=1729525169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfM9f+hWey0CtNaI1SUKa6vEq+PwT8U4friQEoRedHw=;
        b=p5QvlQQDm2KsRjIIcluvay1Y8on/Ya9eUO1Q1M8clYNq1Ohm4dPX/ysB0nJBmRpVKP
         mzxDO1gaaxcBNeGqa0y6DJzCalWUP28jB8TrizPerEZi6fdybBvXN0XfCCrKvHGQX1U8
         XMG5LBhzRy2oAE+YMapguHgaIWORtuAz5A3k/wBdB+IhNV1FG4yMnH/D4r7KjS49comC
         iFWvAUMfNVEKHLpIni9LN9BuYPvvpmxAylp22QF+r+6HAOTbf214t+M+So5HXfXMQLmP
         v4B+RcMo2nIp0yimZaplTBMRvJramZW/0fOw3qjnbVwbNVndnr5zxMeGF+fkODZ5QeMm
         c7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD7X9bXQTpr+TGCJKEhHMjY2dp4FHLfigsDGo1xb0j7t35raTA0gX/N7GJojd4eYHhRuJoqI9yG8K/BNA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxV7hYKeJPNJukPiegWlau7j0o4Lv5qnV/Y4maNygBnuWhKOvgs
	sHgEGoqlTliNNkaH33cNSfPBW0/JMaN/n3QvhpBylibBEKA3tnHjrpMJ9+2vuz8=
X-Google-Smtp-Source: AGHT+IEzUkVjO7ncb9ymw9qcsq6DJz0zGwRlwK1wbI5e9q3GQVf5RuvEP2gGBmEbBrLkvl05AASo0w==
X-Received: by 2002:a17:907:9451:b0:a99:5baf:12a4 with SMTP id a640c23a62f3a-a99b937b0bdmr953417366b.17.1728920369027;
        Mon, 14 Oct 2024 08:39:29 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0046932csm258956366b.127.2024.10.14.08.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 08:39:28 -0700 (PDT)
Message-ID: <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
Date: Mon, 14 Oct 2024 16:39:26 +0100
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
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14/10/2024 1:30 pm, Kirill A. Shutemov wrote:
> On Sun, Oct 13, 2024 at 11:50:55PM -0700, Linus Torvalds wrote:
>> Anyway, the attached patch
>>
>> diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
>> index d066aecf8aeb..7d5730aa18b8 100644
>> --- a/arch/x86/lib/getuser.S
>> +++ b/arch/x86/lib/getuser.S
>> @@ -37,11 +37,17 @@
>>  
>>  #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
>>  
>> +#define X86_CANONICAL_MASK ALTERNATIVE \
>> +	"movq $0x80007fffffffffff,%rdx", \
>> +	"movq $0x80ffffffffffffff,%rdx", X86_FEATURE_LA57
>> +
>>  .macro check_range size:req
>>  .if IS_ENABLED(CONFIG_X86_64)
>>  	mov %rax, %rdx
>>  	sar $63, %rdx
>>  	or %rdx, %rax
>> +	X86_CANONICAL_MASK
>> +	and %rdx,%rax
>>  .else
>>  	cmp $TASK_SIZE_MAX-\size+1, %eax
>>  	jae .Lbad_get_user
> Given that LAM enforces bit 47/56 to be equal to bit 63 I think we can do
> this unconditionally instead of masking:
>
> diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
> index d066aecf8aeb..86d4511520b1 100644
> --- a/arch/x86/lib/getuser.S
> +++ b/arch/x86/lib/getuser.S
> @@ -37,9 +37,14 @@
>  
>  #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
>  
> +#define SHIFT_LEFT_TO_MSB ALTERNATIVE \
> +	"shl $(64 - 48), %rdx", \
> +	"shl $(64 - 57), %rdx", X86_FEATURE_LA57
> +
>  .macro check_range size:req
>  .if IS_ENABLED(CONFIG_X86_64)
>  	mov %rax, %rdx
> +	SHIFT_LEFT_TO_MSB
>  	sar $63, %rdx
>  	or %rdx, %rax
>  .else

That looks like it ought to DTRT in some cases, but I'll definitely ask
AMD for confirmation.

But, I expect it will malfunction on newer hardware when
CONFIG_X86_5LEVEL=n, because it causes Linux to explicitly ignore the
LA57 bit.  That can be fixed by changing how CONFIG_X86_5LEVEL works.

I also expect it will malfunction under virt on an LA57-capable system
running a VM in LA48 mode (this time, Linux doesn't get to see the
relevant uarch detail), and I have no good suggestion here.

~Andrew

