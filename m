Return-Path: <linuxppc-dev+bounces-15072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931ACE50A5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 14:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfKxR5bq9z2yF1;
	Mon, 29 Dec 2025 00:31:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766928667;
	cv=none; b=UM6Kvd4kkNF5rxVyLrA95IWCPpZRfCw8MQ0dMmnV3apxlT+xuDyk004t8EnwsgEZXHRaCGMeaXPLqdGDmWaSQTwuXqssNzyScPC/S80nHunYoUyJQ79Lu74t7qTRCG6zydOs/xD1BuU32lTMSlRFT15T5cwJUokWJMdJI9tVKEc4/6nWeJjpM2x4PLySr9cy+tj/Y2EFKBbAZqXLh3JI9TDySgxbASDzGqQzT/1vnCkq6x2idm+FXAzALyYXkSh8jKmoGN2NZY0C3qjWS8lOYKNtOaYqpHpT/X8ZYH4dtjMFeYudLr4+T4UOtrrxxLOb54USQzo7UO8AgAfvxW96HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766928667; c=relaxed/relaxed;
	bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0zspIeH43V2lwG/2xoOMCZgQ968VHOxlfzAlSfutT+4K2oMsHbeCRcBh0N1P56OGmeZXfbTqwVEUTrLAhnrK5MXqHzFmr7QLBjoBrykVUvyd7tBmpa/nfg03lUVOEnYbh0xmuiqy8RpOJ6ALFAOIVgWF5nWzTVsOLjcUx1VZ9yYWERX4eJ2edeFVjxj3TtehUnwL/eGgtRPq/pc+fIGiiR+WeMnG1ROb2DarqNfN6YkXFTwmNjODw4gRJHViBR8cziVbP4yA88bx84vhTNJw+srssnkHJw3sV7uHU3OvBiDwwY8WECIitV64a6cOrpBfWffabaeDMNjE4kyMPA+ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yn8/Kyno; dkim-atps=neutral; spf=pass (client-ip=209.85.167.54; helo=mail-lf1-f54.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yn8/Kyno;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.54; helo=mail-lf1-f54.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfKxK4KRTz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 00:31:00 +1100 (AEDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5959187c5a9so7259879e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 05:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928597; x=1767533397; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=Yn8/Kynobz3sWr7BMVaYnNFzo8NkNP2SWrOxLcoHXcqC/FB5ffdgF2VF1d/xiNVtJH
         pXlli0VvEQbka6oVHIKKqCSjbvilY5FAugu03B+Vb0jOdQNOPj+kuZqBdhb4q3X/9R1E
         iv6BMqJnQafkNlj+kccI3bgEfgojCmPbe85RJ6bXZGyqTSkzpATypfrGVQUalg2SQVmA
         wkKGPovBKP8hU4OkLtoZOuFk/m/4koQLld7NQdmpvoR+QG30XQ/7X74LaIRelkManmf7
         VoBYy54yhVKqkRk6jisAY+l616kIsKhSe50pPMmu3pNywqGJ/OIn3tYXW4tLTr/VI3mT
         Tyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928597; x=1767533397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=njDoo7zy572CCTn5aAO45hWJCg9EdevJ6FILwGMTApbVXOT6C9Gka969t8OhPKwmGP
         ofkwy6dBuo26yL9JKRQh4SZ1Og7kcMHniZ+rk5n2miRMuLiZMYTDrt7VKQU/SLPpr2Tv
         MEdHbQKwJ6l0Hp1r/RfntBeQkiNKeYYfwPZWQIt4FNQ+BIwDZPmm6P8/pSkxjAffEj51
         rXov1+fvJR8bM6gUX4BCeMLqBtj05++Cpc/tzJxdSL0ctAxy/LYmMv31eR3B4Ep8DX47
         rHog3zSdoQm11HFFtp5qYoY9t2QGaKTooEC5XjafecC8gQO5vmzR/3o7LcBVacVZ9090
         5XAg==
X-Forwarded-Encrypted: i=1; AJvYcCXk49sy4fdkjAg7k4NlmNLX9tzwX6SGgZAlVstNo/sMyZz+ptKgcO6uVCzoTZ+O3Cy/ADPKWDCAEADfeZo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1M4iipVcUiCUR9YsgL/U5uG6t5g0JAnM/rm/UNuTIyRT4ajLC
	yTk9xWzKBSZXJJOIM2rgB9pBh7X2A5cpWzsZRgPYZLaHi/5erqWJLRqU
X-Gm-Gg: AY/fxX7B8wAIH7QVbqZjcICXA4FkbqbsOWxWu/43r1W38XWaO/kVkIKy89D4v6iVnnF
	4lLLc7N9pQlG6RXnSwcO1KUiP4uA/suzax1N4Bcu0hd4mYFGilqetlzvwA4rAxfK+ae4PGkZ7bk
	fNl16x9u/oyQI93Ju4B2c9cqmNBoknCEESsA/ZgoZzKPmOQbOL80fY7+YDL4q0IpeH33pP1AjDL
	QTLmPb7ctoD6x0OCw4GRW2IGUxMRZsy+y/XWk8mPbd+HndZu6pSpQQwI0u7sGUcaIxmqA1B3LiZ
	715w7dFWNkYtAJEeEH3fDx725gutEF1THA1rTEWj2lz7PezJ8Yg/2rkHK1zx+yCa+sWXBQBfeZb
	cpOIEOOOfC3xPtoxlVtf/xcPgbBaHFQOzYhGM9HIltAkV/t9G0Ll5jyz/a4ZYkRK00aAtX1Iu4s
	+ISJVBhkHftlId6KqBP0KRoK8CFAJWa3NJGjVsGdeW6Wym2qYSwMxjfC0bMb3N/iMyc7CfowJ3n
	hpcYLSL
X-Google-Smtp-Source: AGHT+IGo/pr+AQ2VNaaG2TyhewLh2BG0nsRAoXdF/d33J1EZZvYOr8FxE2Re2WZCgj4kGCoIAYrr8g==
X-Received: by 2002:a05:6512:3b0c:b0:59a:11b2:2c08 with SMTP id 2adb3069b0e04-59a17dd5fb7mr9312428e87.43.1766928596662;
        Sun, 28 Dec 2025 05:29:56 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:425c:b771:d34f:d055:3147:bcd9? ([2a00:1fa0:425c:b771:d34f:d055:3147:bcd9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d602fsm8238417e87.11.2025.12.28.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:29:55 -0800 (PST)
Message-ID: <d58d6cfa-d9d1-47fd-91e4-533756f3b3bd@gmail.com>
Date: Sun, 28 Dec 2025 16:29:49 +0300
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-26-rppt@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251228124001.3624742-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/28/25 3:39 PM, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
> added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
> HVO style pre-initialization of vmemmap on x86.
> 
> With the ordering of hugetlb reservation vs memory map initiaization
> sorted out in core MM this no longer needs to be an architecture specific
> quirk.
> 
> Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..e2318fa9b1bb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> -		hugetlb_bootmem_alloc();
>  	}

   You need to drop {} now, no? But seeing that this *if* gets dropped
altogether in the next patch, you may as well ignore me... :-)

[...]

MBR, Sergey


