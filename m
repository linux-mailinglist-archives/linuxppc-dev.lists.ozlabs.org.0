Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C587428A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 16:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsLjp2ncMz30PL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 00:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.44; helo=mail-ej1-f44.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsLjK0WRjz3dD7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 00:40:52 +1000 (AEST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-98377c5d53eso90571466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 07:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688049648; x=1690641648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acfeDV6ig1DAYnhU+FrQZ3QnlBZlpv5iySwPYFbbjOg=;
        b=W+dFj4vNv0M4ofBUbJhcf1PvLHyGO2cw745ADrhv5L0iwGcOGAwj3hxrTsnghYJLbG
         DFF0DgYNg4C1f363s0z/LS6vlSMRpSfgPQ/zWfwS6I0wg7N6uu0IhBqxSotT8qpL68P3
         b6VvqRBwdsV4fM9tEzIvTaOb3opKFvDvbemuIXAmlE+UJJEL4KSwIlzpdZB5z51E0X/b
         C28Q/yb1wv1ESD/OO2v1cFvi+A/EhexpP/d7GwIbRpGzMPBKRhsJ87bn9rg1/67c0bbm
         tb7PY045v7hVoXBgNfMzULZvCZWsEOOfuD/KpqD+rqk7bgEaSyTgs/izCv/eE+BxpdUC
         iBIQ==
X-Gm-Message-State: AC+VfDz9WOFuSaJx5weIom2V6dbkVt+3Y2DaX2KjJTFO8KZoAyfgma7X
	bQn6xQ5B0F6ghQaoUDfcf1o=
X-Google-Smtp-Source: ACHHUZ6sA34LKMurP3cV/MCxdjN3zx/QJkMADdp5Xd/K65ilFwG180EmkQLV3tq+R4tttPbzem8Bmw==
X-Received: by 2002:a17:907:2cce:b0:991:de8e:4f99 with SMTP id hg14-20020a1709072cce00b00991de8e4f99mr8222804ejc.70.1688049647620;
        Thu, 29 Jun 2023 07:40:47 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id lh8-20020a170906f8c800b009923998c8acsm2760768ejb.20.2023.06.29.07.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 07:40:47 -0700 (PDT)
Message-ID: <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
Date: Thu, 29 Jun 2023 16:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230227173632.3292573-30-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com
 , mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 27. 02. 23, 18:36, Suren Baghdasaryan wrote:
> Attempt VMA lock-based page fault handling first, and fall back to the
> existing mmap_lock-based handling if that fails.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>   arch/x86/Kconfig    |  1 +
>   arch/x86/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index a825bf031f49..df21fba77db1 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -27,6 +27,7 @@ config X86_64
>   	# Options that are inherently 64-bit kernel only:
>   	select ARCH_HAS_GIGANTIC_PAGE
>   	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> +	select ARCH_SUPPORTS_PER_VMA_LOCK
>   	select ARCH_USE_CMPXCHG_LOCKREF
>   	select HAVE_ARCH_SOFT_DIRTY
>   	select MODULES_USE_ELF_RELA
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index a498ae1fbe66..e4399983c50c 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -19,6 +19,7 @@
>   #include <linux/uaccess.h>		/* faulthandler_disabled()	*/
>   #include <linux/efi.h>			/* efi_crash_gracefully_on_page_fault()*/
>   #include <linux/mm_types.h>
> +#include <linux/mm.h>			/* find_and_lock_vma() */
>   
>   #include <asm/cpufeature.h>		/* boot_cpu_has, ...		*/
>   #include <asm/traps.h>			/* dotraplinkage, ...		*/
> @@ -1333,6 +1334,38 @@ void do_user_addr_fault(struct pt_regs *regs,
>   	}
>   #endif
>   
> +#ifdef CONFIG_PER_VMA_LOCK
> +	if (!(flags & FAULT_FLAG_USER))
> +		goto lock_mmap;
> +
> +	vma = lock_vma_under_rcu(mm, address);
> +	if (!vma)
> +		goto lock_mmap;
> +
> +	if (unlikely(access_error(error_code, vma))) {
> +		vma_end_read(vma);
> +		goto lock_mmap;
> +	}
> +	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
> +	vma_end_read(vma);
> +
> +	if (!(fault & VM_FAULT_RETRY)) {
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +		goto done;
> +	}
> +	count_vm_vma_lock_event(VMA_LOCK_RETRY);

This is apparently not strong enough as it causes go build failures like:

[  409s] strconv
[  409s] releasep: m=0x579e2000 m->p=0x5781c600 p->m=0x0 p->status=2
[  409s] fatal error: releasep: invalid p state
[  409s]

[  325s] hash/adler32
[  325s] hash/crc32
[  325s] cmd/internal/codesign
[  336s] fatal error: runtime: out of memory

There are many kinds of similar errors. It happens in 1-3 out of 20 
builds only.

If I revert the commit on top of 6.4, they all dismiss. Any idea?

The downstream report:
https://bugzilla.suse.com/show_bug.cgi?id=1212775

> +
> +	/* Quick path to respond to signals */
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			kernelmode_fixup_or_oops(regs, error_code, address,
> +						 SIGBUS, BUS_ADRERR,
> +						 ARCH_DEFAULT_PKEY);
> +		return;
> +	}
> +lock_mmap:
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
>   	/*
>   	 * Kernel-mode access to the user address space should only occur
>   	 * on well-defined single instructions listed in the exception
> @@ -1433,6 +1466,9 @@ void do_user_addr_fault(struct pt_regs *regs,
>   	}
>   
>   	mmap_read_unlock(mm);
> +#ifdef CONFIG_PER_VMA_LOCK
> +done:
> +#endif
>   	if (likely(!(fault & VM_FAULT_ERROR)))
>   		return;
>   

thanks,
-- 
js
suse labs

