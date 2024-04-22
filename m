Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86D8ACC96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 14:12:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IBrzJJYV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNPJR2wnDz3dLY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 22:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IBrzJJYV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNPHh3N3Gz3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 22:11:43 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4187c47405aso28692815e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713787897; x=1714392697; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCRnuZK0O/QOXHu1Ldkstjl1doP0jCVLWLbPZKH0WnQ=;
        b=IBrzJJYVzACSu3tI4JuOwe2eN5rXIwaBTujEASVN1bUZrYpurHwgoEUI6Ovodo6Gl7
         eaMliJXm3SVV1hjPS4bC1wDbKD5R9wAeDHKeZ4I51pBmtaytS8gqk0z7csLaUz5dAQ3S
         4eDNCgar594VGrHzs0TTyEW3bFmRX7BCeAS9l1Z1XoxWIzg52DBRqtqhZBK8y809qq1a
         Hkfg5fVIhnPW3AhSaodDw6sdkZlOobI4cn36PUNmRjQPWcKonAdhecROYv8K9Mdj8YFX
         xy4aoqj8iHk8Q/1/MMiq/bL/dWbvQmCt5uCiJZ35yjWgS9vAaFpq9WGQ505lBTDjFxLq
         JAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713787897; x=1714392697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCRnuZK0O/QOXHu1Ldkstjl1doP0jCVLWLbPZKH0WnQ=;
        b=UHaaXgkY0odvMnMBpqVRWEYGJ/SM0RSfLWlrt/2JRM9K8H2ltmGbdQkTm1BkraHNKR
         8BAxefrGWbNobvLIMtb5WD/QnVyEfYVLi+Ot2tswfZ/lhUVbsBUyH1vuZGwBth9KWnmP
         mMns/T/Nxpmko1uJ5219twUFonK2WdbMDBcZICdKKDvybKF/ITuwxcnL3cFsChEn+dq/
         cf8UWWNg1fIePmYsEvg5TXpcitjohSqPfG+sQTJ3B9HzgY2PhwdUhLPDn5zYUzRurj5D
         s5yLvu6ZzaHym+3YhQFL8Mja+/hjFif9FAU2nlUbg49G9OssS2sHxgrRhjvFu0RYq932
         k8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVhPu5ZaRrvjEQk2s6c1XQ80y8PbOeqVpGIwPFlTTOHcysfMcutN9lGs8e+qIPUtvq67WqVbn8aHgr0qe56AP6wVL8ymtgOhtqHb7y8jA==
X-Gm-Message-State: AOJu0YwHuIfjXNCsCXqTGF36vw0ZCIPw+wtdep+doTzRmQiOR7INVvb5
	VjWN7uWk3Du1ct9aBWonuvqqeXggJLLn5kgXlUmxRbLApZguJXfOn0grcobIzbE=
X-Google-Smtp-Source: AGHT+IHynTNWSPs7rYJt+CqENDAY0rj5tOUJ3mwkpUrvPfTTqXCsLGZ4LMBMh1xVXt1DdTNJhAB4yQ==
X-Received: by 2002:a05:600c:3552:b0:419:7fd:2fbe with SMTP id i18-20020a05600c355200b0041907fd2fbemr5536580wmq.11.1713787897251;
        Mon, 22 Apr 2024 05:11:37 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr. [83.193.250.196])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c458e00b00417e5b71188sm16503881wmo.34.2024.04.22.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 05:11:36 -0700 (PDT)
Message-ID: <fb942d49-1c72-40a6-8309-ef3331d8f8dc@linaro.org>
Date: Mon, 22 Apr 2024 14:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/15] arch: make execmem setup available regardless of
 CONFIG_MODULES
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
References: <20240422094436.3625171-1-rppt@kernel.org>
 <20240422094436.3625171-12-rppt@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240422094436.3625171-12-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.
 overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/4/24 11:44, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> execmem does not depend on modules, on the contrary modules use
> execmem.
> 
> To make execmem available when CONFIG_MODULES=n, for instance for
> kprobes, split execmem_params initialization out from
> arch/*/kernel/module.c and compile it when CONFIG_EXECMEM=y
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   arch/arm/kernel/module.c       |  43 ----------
>   arch/arm/mm/init.c             |  45 +++++++++++
>   arch/arm64/kernel/module.c     | 140 ---------------------------------
>   arch/arm64/mm/init.c           | 140 +++++++++++++++++++++++++++++++++
>   arch/loongarch/kernel/module.c |  19 -----
>   arch/loongarch/mm/init.c       |  21 +++++
>   arch/mips/kernel/module.c      |  22 ------
>   arch/mips/mm/init.c            |  23 ++++++
>   arch/nios2/kernel/module.c     |  20 -----
>   arch/nios2/mm/init.c           |  21 +++++
>   arch/parisc/kernel/module.c    |  20 -----
>   arch/parisc/mm/init.c          |  23 +++++-
>   arch/powerpc/kernel/module.c   |  63 ---------------
>   arch/powerpc/mm/mem.c          |  64 +++++++++++++++
>   arch/riscv/kernel/module.c     |  44 -----------
>   arch/riscv/mm/init.c           |  45 +++++++++++
>   arch/s390/kernel/module.c      |  27 -------
>   arch/s390/mm/init.c            |  30 +++++++
>   arch/sparc/kernel/module.c     |  19 -----
>   arch/sparc/mm/Makefile         |   2 +
>   arch/sparc/mm/execmem.c        |  21 +++++
>   arch/x86/kernel/module.c       |  27 -------
>   arch/x86/mm/init.c             |  29 +++++++
>   23 files changed, 463 insertions(+), 445 deletions(-)
>   create mode 100644 arch/sparc/mm/execmem.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

