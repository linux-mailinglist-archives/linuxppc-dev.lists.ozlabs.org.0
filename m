Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40407403F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 21:14:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bM9Je+tO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrDtL42Bpz3c2b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bM9Je+tO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrDsV1fzCz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 05:14:06 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-66869feb7d1so2817373b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687893243; x=1690485243;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kvHLvhv1Vboi73O1yp/Tlc9InhlPe7nOe1kq7T+MFRo=;
        b=bM9Je+tOekLovPkvT+/l7nbya5CmvdUQjXrADEm1UMcV4/Dft3yRiRDI0ZDflduo0a
         eCCHc/eGgHA3aTnPLKW75ZP3+msGkQAgAajr0fU475B6t9dnUbkeGDGaGhTQuEs9G8Em
         fP/NIDTeV8LmgxO8Ql0wOGFl7SgfrLikcvULFnS16kiPfzK7oAB1YpIUgqh/lMxpHyod
         tqWpPiE4/bUvsjhZfVbvFSWKmV4p5zoSojTJH1B4PXJkJ5GFHQt4ps0dwXEGoW/rFJ5j
         7OEFRkR/4WYv521gDAmtenL688/6yjI/zD/BFplexhWDCjqz/HwvAM7QaYSh0oWP3Dui
         ALeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893243; x=1690485243;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvHLvhv1Vboi73O1yp/Tlc9InhlPe7nOe1kq7T+MFRo=;
        b=DRWghxUpDQOcswSpEvKrHGG6h7ix4HCjSixMxxAFKmJcW5Uul7q71IxSYFcfELGl+o
         6ZTyYfeKYBYFXbinJ0nsjfNxTtNX2K9ddZzObiK+pjgzyJ2lS1pzs72Ej14A+czkofjW
         qmcncaJVvDHLjn1M19dqvoNadxKp+QT6ITk7lq+MqjUlB8D3deNX1o7VkMuUoKd1wRfs
         tRfJo3aVO4y09P6V6WGGOW4qHrOJcjVJvUQ7jfeJ6eiqO175QFhnaH9SP7J4BOKMNyr/
         i9EiDSkazsAFXsUM8VxzwFD/H1JbYIHle7mkq5mcULaPDhZZy39M7+tQLrg/1sKX6rlr
         oEIQ==
X-Gm-Message-State: AC+VfDz3yRXwxujQN1MYO/loo7zlal6f9MqgNH6p7sl+jcPLhUdESYo/
	kGo4wHF0y7UcyAP9VduJLvw=
X-Google-Smtp-Source: ACHHUZ7LJIGe+68y+/f7zW8IDz+Iq/yBUPpzssEQrXLR8wKbF9q9Wu20nywq5XNVdfXVbWMgiaxYCw==
X-Received: by 2002:a05:6a00:2490:b0:668:7209:1856 with SMTP id c16-20020a056a00249000b0066872091856mr26446249pfv.14.1687893243046;
        Tue, 27 Jun 2023 12:14:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1-20020aa78281000000b0065a1b05193asm5742654pfm.185.2023.06.27.12.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 12:14:02 -0700 (PDT)
Message-ID: <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
Date: Tue, 27 Jun 2023 12:14:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Vishal Moola <vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
In-Reply-To: <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/27/23 12:10, Guenter Roeck wrote:
> On 6/27/23 10:42, Vishal Moola wrote:
>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>> ptdesc equivalents.
>>>>
>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>
>>> This patch causes all nios2 builds to fail.
>>
>> It looks like you tried to apply this patch on its own. This patch depends
>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>> this architecture and it worked, but let me know if something fails
>> when its applied on top of those patches (or the rest of the patchset).
> 
> 
> No, I did not try to apply this patch on its own. I tried to build yesterday's
> pending-fixes branch of linux-next.
> 

A quick check shows that the build fails with next-20230627. See log below.

Guenter

---

$ git describe
next-20230627
$ git describe --match 'v*'
v6.4-12601-g53cdf865f90b

Build reference: v6.4-12601-g53cdf865f90b
Compiler version: nios2-linux-gcc (GCC) 11.4.0
Assembler version: GNU assembler (GNU Binutils) 2.40

Building nios2:allnoconfig ... failed
--------------
Error log:
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
In file included from mm/memory.c:86:
mm/memory.c: In function 'free_pte_range':
arch/nios2/include/asm/pgalloc.h:33:17: error: implicit declaration of function 'pagetable_pte_dtor'; did you mean 'pgtable_pte_page_dtor'? [-Werror=implicit-function-declaration]
    33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
       |                 ^~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
   666 |                 __pte_free_tlb(tlb, ptep, address);             \
       |                 ^~~~~~~~~~~~~~
mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
   194 |         pte_free_tlb(tlb, token, addr);
       |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:33:36: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
    33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
       |                                    ^~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
   666 |                 __pte_free_tlb(tlb, ptep, address);             \
       |                 ^~~~~~~~~~~~~~
mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
   194 |         pte_free_tlb(tlb, token, addr);
       |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:34:17: error: implicit declaration of function 'tlb_remove_page_ptdesc'; did you mean 'tlb_remove_page_size'? [-Werror=implicit-function-declaration]
    34 |                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
       |                 ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
   666 |                 __pte_free_tlb(tlb, ptep, address);             \
       |                 ^~~~~~~~~~~~~~
mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
   194 |         pte_free_tlb(tlb, token, addr);
       |         ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:243: mm/memory.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:477: mm] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:2022: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2
