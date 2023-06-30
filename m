Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD30743723
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 10:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QspPQ1ZZSz3bn3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 18:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.54; helo=mail-wm1-f54.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QspNs1CpBz30Ct
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 18:28:12 +1000 (AEST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbc244d386so10538665e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113689; x=1690705689;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRYyHPJ0l3JptHpg3mFpGfjchjllb0zu8LBlb7XT5hw=;
        b=Fu560hvQv5TrbMaETdqygHXT8VmqyDCl9N3aE0Mj6YtFtco2C5qeGOR3V1AB7bkaSl
         AZaPk4OKyUmKcAgNfFmOmG3UzBvQ0CTqxqYcEgkoU8O5qUpdUjpjJd4bbiyDO3yWSLs7
         uBoMPDAThqr2vQ9Hw1flalXD5KNRMEp1eyVG1BSYU2rSV2FnLISCetumxIjvQ8icAHUm
         DmPC1mgdKz6iu/Bqq2nLgnjKk0eOcYuCR3NkxN8h8NGGkUYXip/Dih7oZbkgGu8KMCwg
         3uhvKmdfOSFk+n3PqO15Q3/1TwwewOH7rCvaac5mw+yAH/utokj9vpUSN1hAkm6fB68n
         WhXA==
X-Gm-Message-State: AC+VfDw3pn3OYOzFdtjOJSLj34xblcup7jRZWEVeLwRXCesVHL9mymyH
	YJpTYnRmXcRTLOLD5BXjgB8=
X-Google-Smtp-Source: ACHHUZ4ThngeqilmApKJMZhIhCcwEYSoxdwUR+ukZaaoc8YnAj64SIh0BEAZ3duaqDYdxup994pnqw==
X-Received: by 2002:a7b:cb88:0:b0:3fb:b890:128e with SMTP id m8-20020a7bcb88000000b003fbb890128emr1255564wmi.33.1688113688346;
        Fri, 30 Jun 2023 01:28:08 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id o23-20020a05600c379700b003fae92e7a8dsm12201517wmr.27.2023.06.30.01.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:28:07 -0700 (PDT)
Message-ID: <f7ad7a42-13c8-a486-d0b7-01d5acf01e13@kernel.org>
Date: Fri, 30 Jun 2023 10:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
 <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
 <9a8d788c-b8ba-1b8a-fd79-0e25b1b60bed@kernel.org>
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
In-Reply-To: <9a8d788c-b8ba-1b8a-fd79-0e25b1b60bed@kernel.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30. 06. 23, 8:35, Jiri Slaby wrote:
> On 29. 06. 23, 17:30, Suren Baghdasaryan wrote:
>> On Thu, Jun 29, 2023 at 7:40 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>>
>>> Hi,
>>>
>>> On 27. 02. 23, 18:36, Suren Baghdasaryan wrote:
>>>> Attempt VMA lock-based page fault handling first, and fall back to the
>>>> existing mmap_lock-based handling if that fails.
>>>>
>>>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>>>> ---
>>>>    arch/x86/Kconfig    |  1 +
>>>>    arch/x86/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 37 insertions(+)
>>>>
>>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>>> index a825bf031f49..df21fba77db1 100644
>>>> --- a/arch/x86/Kconfig
>>>> +++ b/arch/x86/Kconfig
>>>> @@ -27,6 +27,7 @@ config X86_64
>>>>        # Options that are inherently 64-bit kernel only:
>>>>        select ARCH_HAS_GIGANTIC_PAGE
>>>>        select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>>>> +     select ARCH_SUPPORTS_PER_VMA_LOCK
>>>>        select ARCH_USE_CMPXCHG_LOCKREF
>>>>        select HAVE_ARCH_SOFT_DIRTY
>>>>        select MODULES_USE_ELF_RELA
>>>> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
>>>> index a498ae1fbe66..e4399983c50c 100644
>>>> --- a/arch/x86/mm/fault.c
>>>> +++ b/arch/x86/mm/fault.c
>>>> @@ -19,6 +19,7 @@
>>>>    #include <linux/uaccess.h>          /* 
>>>> faulthandler_disabled()      */
>>>>    #include <linux/efi.h>                      /* 
>>>> efi_crash_gracefully_on_page_fault()*/
>>>>    #include <linux/mm_types.h>
>>>> +#include <linux/mm.h>                        /* find_and_lock_vma() */
>>>>
>>>>    #include <asm/cpufeature.h>         /* boot_cpu_has, 
>>>> ...            */
>>>>    #include <asm/traps.h>                      /* dotraplinkage, 
>>>> ...           */
>>>> @@ -1333,6 +1334,38 @@ void do_user_addr_fault(struct pt_regs *regs,
>>>>        }
>>>>    #endif
>>>>
>>>> +#ifdef CONFIG_PER_VMA_LOCK
>>>> +     if (!(flags & FAULT_FLAG_USER))
>>>> +             goto lock_mmap;
>>>> +
>>>> +     vma = lock_vma_under_rcu(mm, address);
>>>> +     if (!vma)
>>>> +             goto lock_mmap;
>>>> +
>>>> +     if (unlikely(access_error(error_code, vma))) {
>>>> +             vma_end_read(vma);
>>>> +             goto lock_mmap;
>>>> +     }
>>>> +     fault = handle_mm_fault(vma, address, flags | 
>>>> FAULT_FLAG_VMA_LOCK, regs);
>>>> +     vma_end_read(vma);
>>>> +
>>>> +     if (!(fault & VM_FAULT_RETRY)) {
>>>> +             count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>>> +             goto done;
>>>> +     }
>>>> +     count_vm_vma_lock_event(VMA_LOCK_RETRY);
>>>
>>> This is apparently not strong enough as it causes go build failures 
>>> like:
>>>
>>> [  409s] strconv
>>> [  409s] releasep: m=0x579e2000 m->p=0x5781c600 p->m=0x0 p->status=2
>>> [  409s] fatal error: releasep: invalid p state
>>> [  409s]
>>>
>>> [  325s] hash/adler32
>>> [  325s] hash/crc32
>>> [  325s] cmd/internal/codesign
>>> [  336s] fatal error: runtime: out of memory
>>
>> Hi Jiri,
>> Thanks for reporting! I'm not familiar with go builds. Could you
>> please explain the error to me or point me to some documentation to
>> decipher that error?
> 
> Sorry, we are on the same boat -- me neither. It only popped up in our 
> (openSUSE) build system and I only tracked it down by bisection. Let me 
> know if I can try something (like a patch or gathering some debug info).

FWIW, a failed build log:
https://decibel.fi.muni.cz/~xslaby/n/vma/log.txt

and a strace for it:
https://decibel.fi.muni.cz/~xslaby/n/vma/strace.txt

An excerpt from the log:

[   55s] runtime: marked free object in span 0x7fca6824bec8, 
elemsize=192 freeindex=0 (bad use of unsafe.Pointer? try -d=checkptr)
[   55s] 0xc0002f2000 alloc marked
[   55s] 0xc0002f20c0 alloc marked
[   55s] 0xc0002f2180 alloc marked
[   55s] 0xc0002f2240 free  unmarked
[   55s] 0xc0002f2300 alloc marked
[   55s] 0xc0002f23c0 alloc marked
[   55s] 0xc0002f2480 alloc marked
[   55s] 0xc0002f2540 alloc marked
[   55s] 0xc0002f2600 alloc marked
[   55s] 0xc0002f26c0 alloc marked
[   55s] 0xc0002f2780 alloc marked
[   55s] 0xc0002f2840 alloc marked
[   55s] 0xc0002f2900 alloc marked
[   55s] 0xc0002f29c0 free  unmarked
[   55s] 0xc0002f2a80 alloc marked
[   55s] 0xc0002f2b40 alloc marked
[   55s] 0xc0002f2c00 alloc marked
[   55s] 0xc0002f2cc0 alloc marked
[   55s] 0xc0002f2d80 alloc marked
[   55s] 0xc0002f2e40 alloc marked
[   55s] 0xc0002f2f00 alloc marked
[   55s] 0xc0002f2fc0 alloc marked
[   55s] 0xc0002f3080 alloc marked
[   55s] 0xc0002f3140 alloc marked
[   55s] 0xc0002f3200 alloc marked
[   55s] 0xc0002f32c0 alloc marked
[   55s] 0xc0002f3380 free  unmarked
[   55s] 0xc0002f3440 free  marked   zombie


An excerpt from strace:
 > 2348 
clone3({flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, 
child_tid=0x7fcaa6a1b990, parent_tid=0x7fcaa6a1b990, exit_signal=0, 
stack=0x7fcaa621b000, stack_size=0x7ffe00, tls=0x7fcaa6a1b6c0} => 
{parent_tid=[2350]}, 88) = 2350

 > 2348 
clone3({flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, 
child_tid=0x7fcaa5882990, parent_tid=0x7fcaa5882990, exit_signal=0, 
stack=0x7fcaa5082000, stack_size=0x7ffe00, tls=0x7fcaa58826c0} => 
{parent_tid=[2351]}, 88) = 2351
 > 2350  <... clone3 resumed> => {parent_tid=[2372]}, 88) = 2372
 > 2351  <... clone3 resumed> => {parent_tid=[2354]}, 88) = 2354
 > 2351  <... clone3 resumed> => {parent_tid=[2357]}, 88) = 2357
 > 2354  <... clone3 resumed> => {parent_tid=[2355]}, 88) = 2355
 > 2355  <... clone3 resumed> => {parent_tid=[2370]}, 88) = 2370
 > 2370  mmap(NULL, 262144, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
 > 2370  <... mmap resumed>)               = 0x7fca68249000
 > 2372  <... clone3 resumed> => {parent_tid=[2384]}, 88) = 2384
 > 2384  <... clone3 resumed> => {parent_tid=[2388]}, 88) = 2388
 > 2388  <... clone3 resumed> => {parent_tid=[2392]}, 88) = 2392
 > 2392  <... clone3 resumed> => {parent_tid=[2395]}, 88) = 2395
 > 2395  write(2, "runtime: marked free object in s"..., 36 <unfinished ...>

I.e. IIUC, all are threads (CLONE_VM) and thread 2370 mapped ANON 
0x7fca68249000 - 0x7fca6827ffff and go in thread 2395 thinks for some 
reason 0x7fca6824bec8 in that region is "bad".

> thanks,-- 
-- 
js
suse labs

