Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0D117F43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 05:59:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X7C92Zr8zDqW1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 15:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="c2X7ViWA"; 
 dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X70w6QY0zDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 15:50:40 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id w5so6853832pjh.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 20:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FsMIdfl3m8/c1WE+yOFhND7ZsJwRTVkCLazOCGjZnN8=;
 b=c2X7ViWAwT4nDF+KC7Y/b1WzXboHzz7ukoSPvoKflW4TsHPurFX7rS4kcLqXgZLTFW
 LQH9Utw/DS/pQAE9TcqxpENCcL/FCcX9UkiuRRUnj0etipqgDbMlUTBCDsq0LYvxSMNi
 6+XF2pheGdnIN9vvex/NwI7kMNBk5AdyHHBWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=FsMIdfl3m8/c1WE+yOFhND7ZsJwRTVkCLazOCGjZnN8=;
 b=jUDAVIEhAiSWMsAIIpPRafaZEQoF3cC1kIxekR1YJvfonAHOhuDOPs2TYmy0W+N2AE
 1vSaybwrYdST98hRCyQCE/7h7rx02bcG74q5Kjbdr09AuhYBKwCFhadYscC4TXBC0BP0
 W6v/jEgSJ4K/NgCG3tBv3GB3EZkGeBX6UR6h1M+eiELVtP9QLcDEaacgcR2iYtzY6D3K
 cOg2USzlJf9t82xznTR6pH6MmOwrV58H7ti6TNFwqeVURh0PD1zqBDIyfr9HKDouK/uy
 xBXoZUM5K+sOzNLlLaXHA874CBNoqqU1d0P4u8MrwbcHpbtg4MwHSBlF1DocTLP0osfz
 Qgbg==
X-Gm-Message-State: APjAAAXO/Z8qc+ZjATPdjPsv98b/RLe3LlSOQbPn+h5sLJGzMNmlTMlz
 2pht5iJ216RuWWkiHBDTVmgnUg==
X-Google-Smtp-Source: APXvYqyfShCIa1668eXnS5jC0soaGWmx6qbebwdnzY1BvJKY+MKDfsqCBIs51HNPUe+GZCZsS+4ZWw==
X-Received: by 2002:a17:90b:941:: with SMTP id
 dw1mr3203291pjb.21.1575953437115; 
 Mon, 09 Dec 2019 20:50:37 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-e460-0b66-7007-c654.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:e460:b66:7007:c654])
 by smtp.gmail.com with ESMTPSA id i127sm1250009pfe.54.2019.12.09.20.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 20:50:36 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: Re: [PATCH 1/4] kasan: allow arches to provide their own early shadow
 setup
In-Reply-To: <023863f0-0aa5-17f5-41c9-88acfc9a786b@c-s.fr>
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-2-dja@axtens.net>
 <023863f0-0aa5-17f5-41c9-88acfc9a786b@c-s.fr>
Date: Tue, 10 Dec 2019 15:50:33 +1100
Message-ID: <87blsgdbs6.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 07/08/2019 =C3=A0 01:38, Daniel Axtens a =C3=A9crit=C2=A0:
>> powerpc supports several different MMUs. In particular, book3s
>> machines support both a hash-table based MMU and a radix MMU.
>> These MMUs support different numbers of entries per directory
>> level: the PTES_PER_* defines evaluate to variables, not constants.
>> This leads to complier errors as global variables must have constant
>> sizes.
>>=20
>> Allow architectures to manage their own early shadow variables so we
>> can work around this on powerpc.
>
> This seems rather strange to move the early shadow tables out of=20
> mm/kasan/init.c allthough they are used there still.
>
> What about doing for all what is already done for=20
> kasan_early_shadow_p4d[], in extenso define constant max sizes=20
> MAX_PTRS_PER_PTE, MAX_PTRS_PER_PMD and MAX_PTRS_PER_PUD ?

I have added this. I haven't tried the ifndef magic, I've just defined
the constant for all arches that implement KASAN.

Regards,
Daniel

>
> With a set of the following, it would remain transparent for other arches.
> #ifndef MAX_PTRS_PER_PXX
> #define MAX_PTRS_PER_PXX PTRS_PER_PXX
> #endif
>
> Then you would just need to do the following for Radix:
>
> #define MAX_PTRS_PER_PTE		(1 << RADIX_PTE_INDEX_SIZE)
> #define MAX_PTRS_PER_PMD		(1 << RADIX_PMD_INDEX_SIZE)
> #define MAX_PTRS_PER_PUD		(1 << RADIX_PUD_INDEX_SIZE)
>
>
> For the kasan_early_shadow_page[], I don't think we have variable=20
> PAGE_SIZE, have we ?
>
> Christophe
>
>
>>=20
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>=20
>> ---
>> Changes from RFC:
>>=20
>>   - To make checkpatch happy, move ARCH_HAS_KASAN_EARLY_SHADOW from
>>     a random #define to a config option selected when building for
>>     ppc64 book3s
>> ---
>>   include/linux/kasan.h |  2 ++
>>   lib/Kconfig.kasan     |  3 +++
>>   mm/kasan/init.c       | 10 ++++++++++
>>   3 files changed, 15 insertions(+)
>>=20
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index ec81113fcee4..15933da52a3e 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -14,11 +14,13 @@ struct task_struct;
>>   #include <asm/kasan.h>
>>   #include <asm/pgtable.h>
>>=20=20=20
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>>   extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
>>   extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
>>   extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
>>   extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
>> +#endif
>>=20=20=20
>>   int kasan_populate_early_shadow(const void *shadow_start,
>>   				const void *shadow_end);
>> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
>> index a320dc2e9317..0621a0129c04 100644
>> --- a/lib/Kconfig.kasan
>> +++ b/lib/Kconfig.kasan
>> @@ -9,6 +9,9 @@ config HAVE_ARCH_KASAN_SW_TAGS
>>   config	HAVE_ARCH_KASAN_VMALLOC
>>   	bool
>>=20=20=20
>> +config ARCH_HAS_KASAN_EARLY_SHADOW
>> +	bool
>> +
>>   config CC_HAS_KASAN_GENERIC
>>   	def_bool $(cc-option, -fsanitize=3Dkernel-address)
>>=20=20=20
>> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
>> index ce45c491ebcd..7ef2b87a7988 100644
>> --- a/mm/kasan/init.c
>> +++ b/mm/kasan/init.c
>> @@ -31,10 +31,14 @@
>>    *   - Latter it reused it as zero shadow to cover large ranges of mem=
ory
>>    *     that allowed to access, but not handled by kasan (vmalloc/vmemm=
ap ...).
>>    */
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
>> +#endif
>>=20=20=20
>>   #if CONFIG_PGTABLE_LEVELS > 4
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_p4d_table(pgd_t pgd)
>>   {
>>   	return pgd_page(pgd) =3D=3D virt_to_page(lm_alias(kasan_early_shadow_=
p4d));
>> @@ -46,7 +50,9 @@ static inline bool kasan_p4d_table(pgd_t pgd)
>>   }
>>   #endif
>>   #if CONFIG_PGTABLE_LEVELS > 3
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_pud_table(p4d_t p4d)
>>   {
>>   	return p4d_page(p4d) =3D=3D virt_to_page(lm_alias(kasan_early_shadow_=
pud));
>> @@ -58,7 +64,9 @@ static inline bool kasan_pud_table(p4d_t p4d)
>>   }
>>   #endif
>>   #if CONFIG_PGTABLE_LEVELS > 2
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_pmd_table(pud_t pud)
>>   {
>>   	return pud_page(pud) =3D=3D virt_to_page(lm_alias(kasan_early_shadow_=
pmd));
>> @@ -69,7 +77,9 @@ static inline bool kasan_pmd_table(pud_t pud)
>>   	return false;
>>   }
>>   #endif
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
>> +#endif
>>=20=20=20
>>   static inline bool kasan_pte_table(pmd_t pmd)
>>   {
>>=20
