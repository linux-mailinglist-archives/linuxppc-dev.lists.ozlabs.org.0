Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABFB3B251C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 04:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9PRc3f5Nz3bv5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 12:37:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=bE7Ut1O6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=bE7Ut1O6; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9PRB1Btmz2yjH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 12:36:52 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so2570441pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 19:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PA0sGsnWn7x6YWMb364WdKSRZr6JVc7r09OSPHJyTVk=;
 b=bE7Ut1O6iEYhIzFYgS1kBHToBaRwb/B7k+v81/L3nAJV4duuuiXjpCwWPApRgLqP+C
 EnSiLIXsZjAz29cVdDq0shYtP+Bjk60JqK4sMgivH2RsI/exQv3FR4cJ9+GMkfU9wGJL
 Kl00N45p8PMsMHtCWRsr/wnmjyx+N2ydS5GG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PA0sGsnWn7x6YWMb364WdKSRZr6JVc7r09OSPHJyTVk=;
 b=KjDNNWSKtAnmTLYuQ1xMQPiWVcXySYBoXDmZLYIQXPODcyldXh9HT0/GyV04Lgo6E8
 i44qqUYyO7BBHyKg8jivoXr7oI7REv2nbwEdmd86cgiTZW24x8EXGcrYEpgvz8aALWXk
 YkKwnR0KXlLiAhN+4RNAylHki/8YKQx6N/yFQciy8zYdIznGYPA5hydKHD46lcSnOT1F
 wM00Dd5XfEWrft93a90UqbIStyHSfaSlKO0fCYnJtJzsH68qe1PjR35j9MBw2YTiXSQu
 YzCucOMmkEFLKo7Z86vln//O7G8X2WUa5Av7NLZ0rLMpjS+nOGT+J0+nKllDD4/SRGd6
 wYqw==
X-Gm-Message-State: AOAM530TnS5AG91Y5NOrAyb/gmhmRTdnf/6CjeeVBeyyjgbW/j0HOAum
 kqv0JcTGD4QD6E4zeBKtS1+QPUR3k6R81w==
X-Google-Smtp-Source: ABdhPJy9QZIYxHRsZyK7FJh0LJUF507UJ3DFUZzXdvU/CLgGpPexvwUcuURZcEFZRwUQQ+WMl2/9/w==
X-Received: by 2002:a17:90b:4b0f:: with SMTP id
 lx15mr2918093pjb.34.1624502208883; 
 Wed, 23 Jun 2021 19:36:48 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id v1sm746256pjg.19.2021.06.23.19.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 19:36:48 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 2/3] powerpc: Define swapper_pg_dir[] in C
In-Reply-To: <87czsc21st.fsf@mpe.ellerman.id.au>
References: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
 <5e3f1b8a4695c33ccc80aa3870e016bef32b85e1.1623063174.git.christophe.leroy@csgroup.eu>
 <871r8siyqm.fsf@dja-thinkpad.axtens.net>
 <87czsc21st.fsf@mpe.ellerman.id.au>
Date: Thu, 24 Jun 2021 12:36:43 +1000
Message-ID: <874kdoyon8.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Daniel Axtens <dja@axtens.net> writes:
>> Hi Christophe,
>>
>> This breaks booting a radix KVM guest with 4k pages for me:
>>
>> make pseries_le_defconfig
>> scripts/config -d CONFIG_PPC_64K_PAGES
>> scripts/config -e CONFIG_PPC_4K_PAGES
>> make vmlinux
>> sudo qemu-system-ppc64 -enable-kvm -M pseries -m 1G -nographic -vga none -smp 4 -cpu host -kernel vmlinux
>>
>> Boot hangs after printing 'Booting Linux via __start()' and qemu's 'info
>> registers' reports that it's stuck at the instruction fetch exception.
>>
>> My host is Power9, 64k page size radix, and
>> gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34
>>
>
> ...
>>> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
>>> index 730838c7ca39..79f2d1e61abd 100644
>>> --- a/arch/powerpc/kernel/head_64.S
>>> +++ b/arch/powerpc/kernel/head_64.S
>>> @@ -997,18 +997,3 @@ start_here_common:
>>>  0:	trap
>>>  	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
>>>  	.previous
>>> -
>>> -/*
>>> - * We put a few things here that have to be page-aligned.
>>> - * This stuff goes at the beginning of the bss, which is page-aligned.
>>> - */
>>> -	.section ".bss"
>>> -/*
>>> - * pgd dir should be aligned to PGD_TABLE_SIZE which is 64K.
>>> - * We will need to find a better way to fix this
>>> - */
>>> -	.align	16
>>> -
>>> -	.globl	swapper_pg_dir
>>> -swapper_pg_dir:
>>> -	.space	PGD_TABLE_SIZE
>
> This is now 4K aligned whereas it used to be 64K.
>
> This fixes it and is not completely ugly?
>
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 1707ab580ee2..298469beaa90 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -28,7 +28,13 @@
>  #include <asm/hugetlb.h>
>  #include <asm/pte-walk.h>
>  
> -pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __page_aligned_bss;
> +#ifdef CONFIG_PPC64
> +#define PGD_ALIGN 0x10000
> +#else
> +#define PGD_ALIGN PAGE_SIZE
> +#endif
> +
> +pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __section(".bss..page_aligned") __aligned(PGD_ALIGN);

The fix works for me, thank you.

Kind regards,
Daniel
>  
>  static inline int is_exec_fault(void)
>  {
>
>
> cheers
