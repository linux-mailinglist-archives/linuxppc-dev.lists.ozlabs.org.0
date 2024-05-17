Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45288C89EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 18:19:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rt+eSvxt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgsbX2JqHz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 02:19:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rt+eSvxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgsZk21V4z30T1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 02:18:20 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so1028292e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715962697; x=1716567497; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IstAfylTBNaTxmmaRyk4imp16sEYUHGaznoMjv7UZHs=;
        b=Rt+eSvxtM9HvmB7U8YeQGOnYyEUeo7dVUvTpBKkspKP19AQxOqjfOMOgz2b+WFNPB5
         6ckPlmaVJo0y8YF9HoJ+sRrEg2dvxScJT2ZBurR8yr2wXqn8j/fhKaL6XbgAoHpSYwwG
         cyrum4co1eFSXshWTqj5u5yGX5JUvWBQpCp+oLOfJiqT8ZL53DhE5lix0kkDEym2me4O
         5gwqEeKFGSGku6NRWOgEVST3x+e++0td8uywAtM4uf8vdHvs9NC0rQVNtcK9LI6QQ3FE
         KQ7h+NY69yOYTTuG7eMxgrSC2NF1x6lgF+NZWNVdYg6BGP2TXAIy4NHCGuGz44WJCsZH
         ubcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715962697; x=1716567497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IstAfylTBNaTxmmaRyk4imp16sEYUHGaznoMjv7UZHs=;
        b=V+K+16nS3niGWsLQWlpiz5R1NdG+XvpO8PhQ+33AHJ6BtBqSgscNkw2pDXEh+jIaHg
         xvn6UHqr2VsbyK9iXxNswcGynzmeJGFBAEDY3mJP4OCJpMwVlOUdJmflpMI/sBSmkIXS
         VfiO+q78vy2u69oxRE5SizaqIaqgO98Dj8o0pJTS6A4SJwwR3T8RUVHUa+sqisZtB3vL
         6U9TLP7g/i/KJdxgx0kK1kan2xG8+M+4XnMsjjcZ+uAhVLWvTRwc6WdSDCuHeF8gA+CP
         fu9FFw74ENa2Fgt++a2pDxruFe1c2mmtjz0Me2sqBRDVAw9Ry9OffPm9CQzkeHhIU/pe
         ZTHg==
X-Forwarded-Encrypted: i=1; AJvYcCVQw05g/BAYqBU1zQ8Qkt5t09q26LHjCAPr75YSAWK5OdbqCw7yBwKmK6VyAf9fFrz5MHgX8WWwGz/+Suyvrii1U4Z5cL7uQkowPjCtKQ==
X-Gm-Message-State: AOJu0YwcmNxIP5lYXeSiN+YIlOnAy2ZH43CAAbYIcYyZDoDTwDdhUrzJ
	24G860MSCN/viHKxuAfkHQls3oPekIsGVmZUH+RedHN07QTAKBxF9Z0gfgR7
X-Google-Smtp-Source: AGHT+IHgmwwit2WhgD28ItKwKm0UGYj6mPQDthm9VUXNUEsMkvdnQLGvWiUajRHCK+r/d8TH466Lzg==
X-Received: by 2002:ac2:54b9:0:b0:51f:d72:cd2d with SMTP id 2adb3069b0e04-5220fc7aeb4mr13493469e87.22.1715962185544;
        Fri, 17 May 2024 09:09:45 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:2659:d6e4:5d55:b864? (soda.int.kasm.eu. [2001:678:a5c:1202:2659:d6e4:5d55:b864])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d7ee4sm3314135e87.182.2024.05.17.09.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 09:09:45 -0700 (PDT)
Message-ID: <170eca58-8950-40b5-b2af-3ac3844af3aa@gmail.com>
Date: Fri, 17 May 2024 18:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 16/16] bpf: remove CONFIG_BPF_JIT dependency on
 CONFIG_MODULES of
To: Will Deacon <will@kernel.org>
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-17-rppt@kernel.org>
 <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
 <20240517154632.GA320@willie-the-truck>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20240517154632.GA320@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@lin
 aro.org>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-05-17 17:46, Will Deacon wrote:
> Hi Klara,
> 
> On Fri, May 17, 2024 at 01:00:31AM +0200, Klara Modin wrote:
>>
>> This does not seem to work entirely. If build with BPF_JIT without module
>> support for my Raspberry Pi 3 B I get warnings in my kernel log (easiest way
>> to trigger it seems to be trying to ssh into it, which fails).
> 
> Thanks for the report. I was able to reproduce this using QEMU and it
> looks like the problem is because bpf_arch_text_copy() silently fails
> to write to the read-only area as a result of patch_map() faulting and
> the resulting -EFAULT being chucked away.
> 
> Please can you try the diff below?
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 255534930368..94b9fea65aca 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -36,7 +36,7 @@ static void __kprobes *patch_map(void *addr, int fixmap)
>   
>          if (image)
>                  page = phys_to_page(__pa_symbol(addr));
> -       else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +       else if (IS_ENABLED(CONFIG_EXECMEM))
>                  page = vmalloc_to_page(addr);
>          else
>                  return addr;
> 

This seems to work from my short testing.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>
