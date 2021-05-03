Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE6371022
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 02:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYPPP2DNQz300b
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 10:44:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vUe8KnV7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vUe8KnV7; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYPNr14gZz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 10:43:53 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id v191so3014761pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fpmzZpvJQO4/lm0f1UurHWqxbKqO5UQScohRkn/ls3Y=;
 b=vUe8KnV7gcaBeLT6/pjpZbZZcyW5DGfYOVK6kgON8QcQbDfrz9CHaeY2mxpdmIsXke
 PuWPjmF0/kd8AYmMKEzjxStY1Db4dzWTeMW5Z5Z8l6eOQrGCm3/nz+A7YDdlc1C4vC/Y
 7WxLNXXY/Fcsvm2JmKdHNxIMywzRD1pfUWpaVSSiX7wVaO8C+ORSM/xPeMPaKbKr1ijO
 /pYDT9Skq+ZnEjr9hQwuFN7HL0rtEFr9g0JXXtWZCV2CmOzf8F3DhQh/l3uSogrZP130
 rBSfazh3hkkvy6deVcECBY8KQRyKOg0gJoWoVJXF/rc5mks9/+lSb1WqRQTrRazPbvV/
 rAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fpmzZpvJQO4/lm0f1UurHWqxbKqO5UQScohRkn/ls3Y=;
 b=afvLB3h/b0vQLwhb+UhEaZ3TIAvyn2keIJ9AD7AE5oXuRL8DJO32w51cnizBXLyje+
 xmTdJPxqzH/EnxMR2KpIhwep0lo/tjMicPpZkLEQzwytGjbOuo/jA0o9JH6p1dVII035
 ApxU5Wm1kK8rkw73qzDVVesElG0zJdpRyzK0TtEYcRVF4HfgLcatsfeNvkViuIAuhH1j
 EeFw90EGK+RftsNZRnEG/xAtZX3GP6+BeJ/N706d+b+m7hmOIAo6y0JRAF9Tx75xsWi+
 pTS6Z/SgZWjhg/WhefwMIu7mgRkILzTzDH8j6X6IZGNWo/bi+8CtS/aNhzxR2tQtQf09
 4jUA==
X-Gm-Message-State: AOAM530bcv9YOpnlvuw8KDojCgnmQCMg5lvwqBnm/3iY5OePwP27acbt
 o9nEWQN2bgvA1ZgxkRY4Unao0YfERVU=
X-Google-Smtp-Source: ABdhPJwfJJ1Hale3qXPv4sMZUfGJJPDstkmDEqU2RY/ucGkmoDzmAOVZ8byIseV02ENVR1GpPAVuTQ==
X-Received: by 2002:a05:6a00:1c5b:b029:28e:650d:7f9a with SMTP id
 s27-20020a056a001c5bb029028e650d7f9amr7656180pfw.70.1620002629979; 
 Sun, 02 May 2021 17:43:49 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id ne20sm5645253pjb.52.2021.05.02.17.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 17:43:49 -0700 (PDT)
Date: Mon, 03 May 2021 10:43:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64s/radix: Enable huge vmalloc mappings
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210502110050.324953-1-npiggin@gmail.com>
 <5d2548a4-876e-ac11-87f5-b8a2e8a04232@csgroup.eu>
In-Reply-To: <5d2548a4-876e-ac11-87f5-b8a2e8a04232@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1620002526.pn3l97mk14.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of May 3, 2021 3:11 am:
>=20
>=20
> Le 02/05/2021 =C3=A0 13:00, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This reduces TLB misses by nearly 30x on a `git diff` workload on a
>> 2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
>> to vfs hashes being allocated with 2MB pages.
>>=20
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> Since v1:
>> - Don't define MODULES_VADDR which has some other side effect (e.g.,
>>    ptdump).
>> - Fixed (hopefully) kbuild warning.
>> - Keep __vmalloc_node_range call on 3 lines.
>>=20
>>   .../admin-guide/kernel-parameters.txt          |  2 ++
>>   arch/powerpc/Kconfig                           |  1 +
>>   arch/powerpc/kernel/module.c                   | 18 +++++++++++++-----
>>   3 files changed, 16 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
>> index 1c0a3cf6fcc9..1be38b25c485 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -3250,6 +3250,8 @@
>>  =20
>>   	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
>>  =20
>> +	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
>> +
>>   	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
>>   			Equivalent to smt=3D1.
>>  =20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 1e6230bea09d..c547a9d6a2dd 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -185,6 +185,7 @@ config PPC
>>   	select GENERIC_VDSO_TIME_NS
>>   	select HAVE_ARCH_AUDITSYSCALL
>>   	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>> +	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
>>   	select HAVE_ARCH_JUMP_LABEL
>>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <=3D 14
>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>> index fab84024650c..ea1fa55a6897 100644
>> --- a/arch/powerpc/kernel/module.c
>> +++ b/arch/powerpc/kernel/module.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/moduleloader.h>
>>   #include <linux/err.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/mm.h>
>>   #include <linux/bug.h>
>>   #include <asm/module.h>
>>   #include <linux/uaccess.h>
>> @@ -88,17 +89,22 @@ int module_finalize(const Elf_Ehdr *hdr,
>>   	return 0;
>>   }
>>  =20
>> -#ifdef MODULES_VADDR
>>   static __always_inline void *
>>   __module_alloc(unsigned long size, unsigned long start, unsigned long =
end)
>>   {
>> -	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
>> -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>> -				    __builtin_return_address(0));
>> +	/*
>> +	 * Don't do huge page allocations for modules yet until more testing
>> +	 * is done. STRICT_MODULE_RWX may require extra work to support this
>> +	 * too.
>> +	 */
>> +	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE_KERN=
EL_EXEC,
>> +				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
>> +				    NUMA_NO_NODE, __builtin_return_address(0));
>>   }
>>  =20
>>   void *module_alloc(unsigned long size)
>>   {
>> +#ifdef CONFIG_PPC32
>=20
> What then happens to PPC32 platforms that doesn't define MODULES_VADDR, f=
or instance 4xx or booke ?
>=20
> I think it should be:
>=20
> #ifdef MODULES_VADDR

Yes the kernel build robot agrees with you. I'll respin.

Thanks,
Nick

>=20
>>   	unsigned long limit =3D (unsigned long)_etext - SZ_32M;
>>   	void *ptr =3D NULL;
>>  =20
>> @@ -112,5 +118,7 @@ void *module_alloc(unsigned long size)
>>   		ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END);
>>  =20
>>   	return ptr;
>> -}
>> +#else
>> +	return __module_alloc(size, VMALLOC_START, VMALLOC_END);
>>   #endif
>> +}
>>=20
>=20
