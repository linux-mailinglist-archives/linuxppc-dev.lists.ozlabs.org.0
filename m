Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946B301A60
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 08:45:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNlR12s97zDqVc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 18:45:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ECst8pGK; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNlP66t40zDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 18:43:54 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id my11so7959044pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 23:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+/6kKIloWjHkv6epE2TcP1cNMAlAxbqvJ/hMS+1BVS4=;
 b=ECst8pGK76Kt1i3hYRpk0C6YXFoVILwmhhITV8vLf7lxSp2DLkJIQbiJRMgNAQ8RhZ
 2FVBi6yU5cpVn2+k1ymdhPEiD0mTUZewRMTA/C2lx5qVisItC7g1Qk4OGg76U8ceJGgf
 oVWl3fnrKEggNSaXGGGHmXoOoXhZnwiVh1RBJL+lYFEHkFwpvlYF/ZZKyKChrGABAFdp
 R/fMbwbCbc15w5wSt5bs8uhzzHSiG/b/UpPKVMdktKCdkIGIrgNk1sVD54D/UhBtSvjQ
 s/HrxyZxn4pyAnjsJNo50WHO0keUtTPyw5qR6gy6UgFyMCLXWft4SR0fRSKV2J1bQRZG
 TWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+/6kKIloWjHkv6epE2TcP1cNMAlAxbqvJ/hMS+1BVS4=;
 b=YnDkGDKfz7ntXsxqrRmwEKIdzrK0AuTqXikTKt3A2Y2mNP6auEKQImTQCHQmFzngbM
 GYkjGl1/VohEGtnBCbS7DfYHdtlZrBz6FnRzcDQWDytYuwsAGAIYYzGdACeMcMp7xR04
 c7dP4VL9GFJPiI9GMjbZEBc8q2yqhSLusGmijQFric/4fWZvPALqQfMr8jlOWlwMTfGI
 /DVvJQ+8FcIw/ZeENFzOtiRYGwIIo+IGOUWO3XsWnpPB6wKrogmKSYwFdrvis0/HE5AH
 xe03S1TwGli3tRC8pHOBvUMdCpel8CSdU8w56SIAMc0LA457LnSlU7NgQGRjUzTAFl2K
 9vDQ==
X-Gm-Message-State: AOAM5334u99yU16YajNbiASj01UC0UmyYpZZ12YrkhW2YMUygGL/MfJ+
 c5//oZkFg7QDS8Xa75ttIBs=
X-Google-Smtp-Source: ABdhPJzN8ma2KWKosLen5J4F3FRMoKuPNeofyB7rb0dBGiGJZybg1BFnjDhMrrGiBy+u68O8a9eDMw==
X-Received: by 2002:a17:90a:de97:: with SMTP id
 n23mr6422067pjv.216.1611474229873; 
 Sat, 23 Jan 2021 23:43:49 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id b17sm12014448pfp.167.2021.01.23.23.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 23:43:49 -0800 (PST)
Date: Sun, 24 Jan 2021 17:43:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v9 05/12] mm: HUGE_VMAP arch support cleanup
To: Andrew Morton <akpm@linux-foundation.org>, Ding Tianhong
 <dingtianhong@huawei.com>, linux-mm@kvack.org
References: <20201205065725.1286370-1-npiggin@gmail.com>
 <20201205065725.1286370-6-npiggin@gmail.com>
 <c7eb5ba6-1187-d82f-d74c-0ca2c8ae8faf@huawei.com>
In-Reply-To: <c7eb5ba6-1187-d82f-d74c-0ca2c8ae8faf@huawei.com>
MIME-Version: 1.0
Message-Id: <1611473993.etnqidihnt.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Borislav Petkov <bp@alien8.de>,
 =?iso-8859-1?q?Jonathan=0A?= Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?iso-8859-1?q?Rick=0A?= Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ding Tianhong's message of January 4, 2021 10:33 pm:
> On 2020/12/5 14:57, Nicholas Piggin wrote:
>> This changes the awkward approach where architectures provide init
>> functions to determine which levels they can provide large mappings for,
>> to one where the arch is queried for each call.
>>=20
>> This removes code and indirection, and allows constant-folding of dead
>> code for unsupported levels.
>>=20
>> This also adds a prot argument to the arch query. This is unused
>> currently but could help with some architectures (e.g., some powerpc
>> processors can't map uncacheable memory with large pages).
>>=20
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: x86@kernel.org
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Acked-by: Catalin Marinas <catalin.marinas@arm.com> [arm64]
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/arm64/include/asm/vmalloc.h         |  8 +++
>>  arch/arm64/mm/mmu.c                      | 10 +--
>>  arch/powerpc/include/asm/vmalloc.h       |  8 +++
>>  arch/powerpc/mm/book3s64/radix_pgtable.c |  8 +--
>>  arch/x86/include/asm/vmalloc.h           |  7 ++
>>  arch/x86/mm/ioremap.c                    | 10 +--
>>  include/linux/io.h                       |  9 ---
>>  include/linux/vmalloc.h                  |  6 ++
>>  init/main.c                              |  1 -
>>  mm/ioremap.c                             | 88 +++++++++---------------
>>  10 files changed, 77 insertions(+), 78 deletions(-)
>>=20
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/v=
malloc.h
>> index 2ca708ab9b20..597b40405319 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -1,4 +1,12 @@
>>  #ifndef _ASM_ARM64_VMALLOC_H
>>  #define _ASM_ARM64_VMALLOC_H
>> =20
>> +#include <asm/page.h>
>> +
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +bool arch_vmap_p4d_supported(pgprot_t prot);
>> +bool arch_vmap_pud_supported(pgprot_t prot);
>> +bool arch_vmap_pmd_supported(pgprot_t prot);
>> +#endif
>> +
>>  #endif /* _ASM_ARM64_VMALLOC_H */
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ca692a815731..1b60079c1cef 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1315,12 +1315,12 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phy=
s, int *size, pgprot_t prot)
>>  	return dt_virt;
>>  }
>> =20
>> -int __init arch_ioremap_p4d_supported(void)
>> +bool arch_vmap_p4d_supported(pgprot_t prot)
>>  {
>> -	return 0;
>> +	return false;
>>  }
>> =20
>=20
> I think you should put this function in the CONFIG_HAVE_ARCH_HUGE_VMAP, o=
therwise it may break the compile when disable the CONFIG_HAVE_ARCH_HUGE_VM=
AP, the same
> as the x86 and ppc.

Ah, good catch. arm64 is okay because it always selects=20
HAVE_ARCH_HUGE_VMAP, powerpc is okay because it places
them in a file that's only compiled for configs that select
huge vmap, but x86-32 without PAE build breaks. I'll fix that.

Thanks,
Nick
