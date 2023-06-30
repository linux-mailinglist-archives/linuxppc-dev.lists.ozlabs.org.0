Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FA743522
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 08:36:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QslvM5b8hz3bZ6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 16:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qsltt0Nwvz30GP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 16:35:33 +1000 (AEST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-991c786369cso179515366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 23:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688106929; x=1690698929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20rBaj2Y5A8WawnZ5IpIpG7vFTWBtQPIoAz1oe/gFqA=;
        b=ici64DU3hXuvxwdtSB44oulWEag+eZ3JB9FQOJ13PZZ5GbSqK4hDjn48YXZuUKXUX9
         wRWPbx83dgAdeZTWca/uzecOgbRX1TDvmw0xw1W61E39ZJLEFcEpJRq/KTWAU52imvVd
         5sQZribLvJtphbbo/CMPa+QyPAkuT6jr9y/dwEJc8A4ICAGvoJP/iGSNgZ6Mk/t/PEfa
         7SK02hEI7HJAIsFQOT25LD+2p8jhT49oZya4gIVM18nMei1A/tpxzAwMuOsCcvbvJTgX
         cCaupixMAywELXZU28U9IxmtM0O8a7PWe7qJbbr/yl1GTMqPb6TERwDWBYHXCDifu1da
         7P+Q==
X-Gm-Message-State: ABy/qLZqXQBLVZPlPdjwDcsKGDjhOAQlW6AIzr3YfMIKf2FRs64nuqtd
	m7+fipKdVf1nEm213C4oY2k=
X-Google-Smtp-Source: APBJJlFfYhTxC8ahwzU+JKDiJhjiAHDdaDYcw6muBSFSxnAn39XJR+dtpGgU7WNpRhVqsWEErFSBog==
X-Received: by 2002:a17:906:5593:b0:982:6bba:79c9 with SMTP id y19-20020a170906559300b009826bba79c9mr1180362ejp.20.1688106928988;
        Thu, 29 Jun 2023 23:35:28 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id l8-20020a170906414800b0098e2969ed44sm6614566ejk.45.2023.06.29.23.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 23:35:28 -0700 (PDT)
Message-ID: <9a8d788c-b8ba-1b8a-fd79-0e25b1b60bed@kernel.org>
Date: Fri, 30 Jun 2023 08:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
 <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
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

On 29. 06. 23, 17:30, Suren Baghdasaryan wrote:
> On Thu, Jun 29, 2023 at 7:40 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>
>> Hi,
>>
>> On 27. 02. 23, 18:36, Suren Baghdasaryan wrote:
>>> Attempt VMA lock-based page fault handling first, and fall back to the
>>> existing mmap_lock-based handling if that fails.
>>>
>>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>>> ---
>>>    arch/x86/Kconfig    |  1 +
>>>    arch/x86/mm/fault.c | 36 ++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 37 insertions(+)
>>>
>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>> index a825bf031f49..df21fba77db1 100644
>>> --- a/arch/x86/Kconfig
>>> +++ b/arch/x86/Kconfig
>>> @@ -27,6 +27,7 @@ config X86_64
>>>        # Options that are inherently 64-bit kernel only:
>>>        select ARCH_HAS_GIGANTIC_PAGE
>>>        select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>>> +     select ARCH_SUPPORTS_PER_VMA_LOCK
>>>        select ARCH_USE_CMPXCHG_LOCKREF
>>>        select HAVE_ARCH_SOFT_DIRTY
>>>        select MODULES_USE_ELF_RELA
>>> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
>>> index a498ae1fbe66..e4399983c50c 100644
>>> --- a/arch/x86/mm/fault.c
>>> +++ b/arch/x86/mm/fault.c
>>> @@ -19,6 +19,7 @@
>>>    #include <linux/uaccess.h>          /* faulthandler_disabled()      */
>>>    #include <linux/efi.h>                      /* efi_crash_gracefully_on_page_fault()*/
>>>    #include <linux/mm_types.h>
>>> +#include <linux/mm.h>                        /* find_and_lock_vma() */
>>>
>>>    #include <asm/cpufeature.h>         /* boot_cpu_has, ...            */
>>>    #include <asm/traps.h>                      /* dotraplinkage, ...           */
>>> @@ -1333,6 +1334,38 @@ void do_user_addr_fault(struct pt_regs *regs,
>>>        }
>>>    #endif
>>>
>>> +#ifdef CONFIG_PER_VMA_LOCK
>>> +     if (!(flags & FAULT_FLAG_USER))
>>> +             goto lock_mmap;
>>> +
>>> +     vma = lock_vma_under_rcu(mm, address);
>>> +     if (!vma)
>>> +             goto lock_mmap;
>>> +
>>> +     if (unlikely(access_error(error_code, vma))) {
>>> +             vma_end_read(vma);
>>> +             goto lock_mmap;
>>> +     }
>>> +     fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
>>> +     vma_end_read(vma);
>>> +
>>> +     if (!(fault & VM_FAULT_RETRY)) {
>>> +             count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>> +             goto done;
>>> +     }
>>> +     count_vm_vma_lock_event(VMA_LOCK_RETRY);
>>
>> This is apparently not strong enough as it causes go build failures like:
>>
>> [  409s] strconv
>> [  409s] releasep: m=0x579e2000 m->p=0x5781c600 p->m=0x0 p->status=2
>> [  409s] fatal error: releasep: invalid p state
>> [  409s]
>>
>> [  325s] hash/adler32
>> [  325s] hash/crc32
>> [  325s] cmd/internal/codesign
>> [  336s] fatal error: runtime: out of memory
> 
> Hi Jiri,
> Thanks for reporting! I'm not familiar with go builds. Could you
> please explain the error to me or point me to some documentation to
> decipher that error?

Sorry, we are on the same boat -- me neither. It only popped up in our 
(openSUSE) build system and I only tracked it down by bisection. Let me 
know if I can try something (like a patch or gathering some debug info).

thanks,
-- 
js
suse labs

