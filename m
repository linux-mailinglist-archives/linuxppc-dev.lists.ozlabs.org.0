Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC8370B1F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 12:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FY2jj52KFz30Dk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 20:42:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=phGGyNK5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=phGGyNK5; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FY2j96djTz2xYk
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 20:41:47 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id h7so1313363plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ps4eR7rfnwSM5U+xizV4ZhAOdr8sW7gR/loX/BuQkqw=;
 b=phGGyNK52sVkIH5sIaeBMgB0c41i5hmIoeI9tjz4pFRP1bE1WHCHl7sZvopnMEoU1x
 MK227t4S05xYPeD23VLi1v+TYsCXV5UChYMx7cicd/fIXAONz1gT30rOBoVf9KUJVTEE
 7HUQ7ouPNIsYbbew3uNQl1sR/YVDVri5opOQyqHVYjJZSj4p15SfYTXQvadppSkhyPGh
 P4qO3Jq5NBvBWxm40r1pwUHRFKYc7ZsJmg62FOb1MaoXpxSy1cnHcN6N6IByzS5DYuGA
 VH6GglKlcgYeKMDASGUeg5+neOd7n9XlPe6F5FEjWvXU0Ah//v1qwD/za4X1+lY1hLci
 8YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ps4eR7rfnwSM5U+xizV4ZhAOdr8sW7gR/loX/BuQkqw=;
 b=TLELzGV56NzxH27aTpPBI5K6jJ0Sjk/c/wHnQJJJKxmYMC+1Wgzh57prrjSW8XTnY3
 diVaXU4C+vMmaUdmn08j4/4SUPOoLRH1oIKNxiLdIF2N93zHNRnC8NH5NKe3nijGT0QS
 8UzJBQsjuhoJP9oeRiiaZwgUEmZMikY3u5xDspQej3Y/HPGdQklOADJfuPxRisLjcs2M
 0IIgz0ku90AdzZvJt7FNFUBTkBMF9Z911R0we7FFJCUPNCT98zYVWXyjh6ycwHR0xgI8
 qvWjBaunTz7pxqU1SvqEFWwiyILcrQcCD9kgEW+RabXeCGDMjvH9L1u49yybJxV6IG6o
 DB3A==
X-Gm-Message-State: AOAM531pNaM1ZSjfgA8G4H8H8PnjjAiJ0tErOFlVWUWp5xJfRU0yz0Jj
 MrpPu+CDCxuS71j9bbbUEI4=
X-Google-Smtp-Source: ABdhPJwwi0a+SvBpUeCCZKsx7bsr8mAsxLh6c6/vuZpXsy5OSGgVE5CV0RhNLMDjJPrmEL1oA0ckFA==
X-Received: by 2002:a17:90a:fb97:: with SMTP id
 cp23mr24720739pjb.169.1619952102678; 
 Sun, 02 May 2021 03:41:42 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id m188sm6086587pfm.167.2021.05.02.03.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 03:41:42 -0700 (PDT)
Date: Sun, 02 May 2021 20:41:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/radix: Enable huge vmalloc mappings
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210502045615.237268-1-npiggin@gmail.com>
 <60e4f5d6-67ae-42a9-5edd-bed2dfde2eb3@csgroup.eu>
In-Reply-To: <60e4f5d6-67ae-42a9-5edd-bed2dfde2eb3@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1619951870.7xruc3u7a2.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of May 2, 2021 5:34 pm:
>=20
>=20
> Le 02/05/2021 =C3=A0 06:56, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This reduces TLB misses by nearly 30x on a `git diff` workload on a
>> 2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
>> to vfs hashes being allocated with 2MB pages.
>>=20
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> This was in the -mm tree but was dropped at the last minute after
>> clashing with a patch in powerpc next.
>>=20
>> Now all prerequisites are upstream, this can be merged as is. Probably
>> makes sense now to go via powerpc tree.
>>=20
>> This is rebased and retested on upstream.
>>=20
>>   Documentation/admin-guide/kernel-parameters.txt |  2 ++
>>   arch/powerpc/Kconfig                            |  1 +
>>   arch/powerpc/include/asm/pgtable.h              |  5 +++++
>>   arch/powerpc/kernel/module.c                    | 16 +++++++++++++---
>>   4 files changed, 21 insertions(+), 3 deletions(-)
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
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/a=
sm/pgtable.h
>> index c6a676714f04..1678e4b08fc3 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -39,6 +39,11 @@ struct mm_struct;
>>   #define __S110	PAGE_SHARED_X
>>   #define __S111	PAGE_SHARED_X
>>  =20
>> +#ifndef MODULES_VADDR
>> +#define MODULES_VADDR	VMALLOC_START
>> +#define MODULES_END	VMALLOC_END
>> +#endif
>=20
> This will also require some changes in a few places, see=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210429031602.26=
06654-4-jniethe5@gmail.com/

I see.

I'll just make the PPC64 version use VMALLOC_START/VMALLOC_END, which
avoids that stupid compiler warning found by kbuild robot as well.

>=20
>> +
>>   #ifndef __ASSEMBLY__
>>  =20
>>   /* Keep these as a macros to avoid include dependency mess */
>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>> index fab84024650c..77aefcbbd276 100644
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
>> @@ -88,17 +89,24 @@ int module_finalize(const Elf_Ehdr *hdr,
>>   	return 0;
>>   }
>>  =20
>> -#ifdef MODULES_VADDR
>>   static __always_inline void *
>>   __module_alloc(unsigned long size, unsigned long start, unsigned long =
end)
>>   {
>> +	/*
>> +	 * Don't do huge page allocations for modules yet until more testing
>> +	 * is done. STRICT_MODULE_RWX may require extra work to support this
>> +	 * too.
>> +	 */
>>   	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
>> -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>> +				    PAGE_KERNEL_EXEC,
>> +				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
>> +				    NUMA_NO_NODE,
>>   				    __builtin_return_address(0));
>=20
> Can we avoid so many lines ? Doesn't it fit on 3 lines now that 100 chars=
 per line are tolerated ?

It could be squashed onto fewer lines. Is it better?

>=20
>>   }
>>  =20
>>   void *module_alloc(unsigned long size)
>>   {
>> +#ifdef CONFIG_PPC32
>=20
> Can we just add an IS_ENABLED(CONFIG_PPC32) in the 'if' instead of this #=
ifdef/#else ?

I guess not if I don't define MODULES_VADDR. Jordan's clenup patch could=20
change it to IS_ENABLED.

Thanks,
Nick

>=20
>>   	unsigned long limit =3D (unsigned long)_etext - SZ_32M;
>>   	void *ptr =3D NULL;
>>  =20
>> @@ -112,5 +120,7 @@ void *module_alloc(unsigned long size)
>>   		ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END);
>>  =20
>>   	return ptr;
>> -}
>> +#else
>> +	return __module_alloc(size, MODULES_VADDR, MODULES_END);
>>   #endif
>> +}
>>=20
>=20
