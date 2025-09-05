Return-Path: <linuxppc-dev+bounces-11760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4F0B44CE5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 06:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ3mj0RR4z30V0;
	Fri,  5 Sep 2025 14:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757047796;
	cv=none; b=dN1wQybkrITrScRQO6SEgl7CkMrHeDMzaCY7XlI3ZwbdB2KJgxMnE9X1Nsa7tqXCBKCciKKv9myyqaKg1b7wqEGrAbpr+ogfoYDqtGwnpSWyYdcC76y84VJQRGksOYgg/Sg8nQOMFpixsEkI3OLwKmzaFEpMz0tAgiFeQ7iceVRAwfbodsJnMYMnGkA5F2mtZpjtmKgedh+uWzGIRP+V0L1FCpDZ3YVjA/CX5BmXjg2bDyik9kLZqPqplPCOCaEi/RSjrO+bT0Ffh+Gafc9tS/MwSa2vg5SMm4eC656O29yzt65FWFiC008NhOzPhUgGzDAsForrSye14W4M9dkuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757047796; c=relaxed/relaxed;
	bh=IxcFv1jGHHWePgPdTLSKcytFmfYfh0ATpkvB8I26vi8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References; b=JdAQYSDnfDSt00x2ulsdp+3W56IKh6H1aHnQazhVkrkIunPuUXRVI8k+du8MonWAVd89KddA+9MXmKIMR4xzG/kdpN9S7S0o0xYemmf9RgdTAQbyPigRz36lc+5c2ndekecWtVLi5r73Ya1ZRvy7zguFMkkB3ocmMmGneswm6BfvHN775a9devzzA9rSinexKupISRXzkqHwCRXcTtv9qP+DJu6ti2igGaBXdVl7IO2DB36A0PUP7IxjckONDuYfi87PiQi1MxAGpLvjOzGIHH+ritgR8sj4iHz0uKwdUV1eqj2yIjBi20c3t330r4KF4V9t9hmkRZ4CAIISEzFllA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xa9RGUYa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xa9RGUYa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ3mg3KQGz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 14:49:54 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-248ff68356aso18013965ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 21:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047792; x=1757652592; darn=lists.ozlabs.org;
        h=references:date:in-reply-to:subject:cc:to:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxcFv1jGHHWePgPdTLSKcytFmfYfh0ATpkvB8I26vi8=;
        b=Xa9RGUYab51tBkUP/0AdDeqgjQkeFj4N6/SyKKc2nKrIxEL77wbCn6tKX5DGfl7LYG
         46jWZ3u6qztiSbLjiVOeKuwLsVfbH0Z1EfVZ25Us7r4q3ZCfKfz2k3AMqIYXHB/A570S
         5U+NcyLpcO3+vVEkvL2cAVLRS2BiYoKlS/7g5T1gPaEw5YbOPEBjnwMjSdYfH6mAChKu
         ogdobCBb+1Lo2uxRaxVOgK6t13UPRoVdJArlulMh8s+lFir9S0e1BnTXJRKKRZxUaBst
         IzAa6D+7ly0wBb7ta0tpYKhGHAPp8LdqnEgEHZV2Cv7i8257nBeVNHvmm2p+yf8l/a1U
         thuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047792; x=1757652592;
        h=references:date:in-reply-to:subject:cc:to:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxcFv1jGHHWePgPdTLSKcytFmfYfh0ATpkvB8I26vi8=;
        b=TvUNVKCXijK+w1fDW/H9We2S1gFnlLzSJFWshxkTGeZjxTCOLip/fXkmDLxwo2y0Vd
         MzY8NpBFhWi8xnj1xYjL3k8pHBFzVkL2EdmnZ5DhDR9hveNi1QmIVtuMsR/T/kGD4gyX
         NEuKgip/1DJsH0s1MdE/Nwh/6TIB+pyrHFgvE6WhYJDicm29ZvnaVsubt8YFD8VZCnLO
         Nf0M2saxno8SY2VjheLxumqbFDCvtxirTOSSLe1OJ2DYTV9G6h4FdFiFaZJxZPh235no
         r1MqxHa9u6SoD74jYZ9JVY9CeSNCozk7K+vfCGu8jU4KnYr2Gj8Rka0kSXL7OGSW2ic/
         OWAg==
X-Forwarded-Encrypted: i=1; AJvYcCWJVAct6pYeWfQMsmLSP/UCUdzaDO5goy1AEqPNWXA0CDhBc/hktvz6UNOfP9HAteq2E71iIcLn0mG8cOc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvtIEU1F19n/Hzu0wKRtZ3dFFkbuKDuD730KaID5LihfaMsIlw
	yrAi4dmKvV0z/6PVMnb2nI9edb9fOeEoZMNq0bFVNGm4dNrzrc0kWS++Sd3cmQ==
X-Gm-Gg: ASbGncsZz4Rstb0eR6NfPGHe190J7+MksHBiNdGHcj6+1nbnhaahbQ0oIpwa3KOX2pP
	v/SzWAq48DrUkeDWKvFLHHdaZ+b/fSNHypDM7TfiquYvttMGoYkGzk1o7zePDVanqmMAgdK7gWS
	kt7eteN5x0Qzv98W5jiS+TrStznYvAA5upF0uEJ+5vphSpgbE+ZhovzXiaSDr7y2o2hAjVmANgR
	0B4TWcOJmV4zAfI8LzRNPpDCSgrtMKYMdIsSrmmfH+4le4pIsfjFUIkL8OK8yGAKbmNKapJCiY7
	F9V/BIFlefa1sji05Li8E89URL2bo1sLC6a4WXVuyRqNL+3bs7XdKWTznvUI/j8AGM5p+UE1+Uw
	2QaUvSl+eSP2+w+WudCRedcZzGSf6jw174SiH
X-Google-Smtp-Source: AGHT+IHX8e4Inpx2hBks4rAQrQfUIDHGhgp1fO6cFmLJ0IOo+VGkzueivYyMxmOU6vV1rXg0Tl/w0A==
X-Received: by 2002:a17:902:f688:b0:246:8ba5:f450 with SMTP id d9443c01a7336-24cefe326b3mr25473425ad.28.1757047791577;
        Thu, 04 Sep 2025 21:49:51 -0700 (PDT)
Received: from dw-tp ([171.76.86.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc1a82a34sm34286845ad.151.2025.09.04.21.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:49:50 -0700 (PDT)
Message-ID: <68ba6bee.170a0220.3b821b.ca9d@mx.google.com>
X-Google-Original-Message-ID: <87v7lxime4.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Donnellan <ajd@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
In-Reply-To: <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
Date: Fri, 05 Sep 2025 09:25:15 +0530
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org> <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
> kernel text has to be mapped read-only or read-write based on build
> time options.
>
> But nowadays, with functionnalities like jump_labels, static links,
> etc ... more only less all kernels need to be read-write at some
> point, and some combinations of configs failed to work due to
> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
> access to kernel modifications.
>
> Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
> possible options that may imply kernel text modification, always
> set kernel text read-write at startup and rely on
> CONFIG_STRICT_KERNEL_RWX to provide accurate protection.
>
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/pgtable.h | 12 ------------
>  arch/powerpc/mm/book3s32/mmu.c     |  4 ++--
>  arch/powerpc/mm/pgtable_32.c       |  2 +-
>  3 files changed, 3 insertions(+), 15 deletions(-)
>

AFAIU - mmu_mark_initmem_nx gets called during kernel_init() which is
way after static call initialization correct? i.e.

start_kernel
  ...
  jump_label_init()
  static_call_init()
  ...
  ...
  rest_init()      /* Do the rest non-__init'ed, we're now alive */
    kernel_init()
      free_initmem() -> mark_initmem_nx() -> __mark_initmem_nx -> mmu_mark_initmem_nx() 
      mark_readonly()
        if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled) {
           jump_label_init_ro()
           mark_rodata_ro() -> ....
           ...
        ...

Then I guess we mainly only need __mapin_ram_chunk() to be PAGE_KERNEL_X (RWX)
instead of PAGE_KERNEL_TEXT (ROX), isn't it?

Let me quickly validate it... 
...Ok, so I was able to get just this diff to be working. 

Thoughts?

diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 15276068f657..0c9ef705803e 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
        p = memstart_addr + s;
        for (; s < top; s += PAGE_SIZE) {
                ktext = core_kernel_text(v);
-               map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
+               map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
                v += PAGE_SIZE;
                p += PAGE_SIZE;
        }

-ritesh



> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 93d77ad5a92f..d8f944a5a037 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -20,18 +20,6 @@ struct mm_struct;
>  #include <asm/nohash/pgtable.h>
>  #endif /* !CONFIG_PPC_BOOK3S */
>  
> -/*
> - * Protection used for kernel text. We want the debuggers to be able to
> - * set breakpoints anywhere, so don't write protect the kernel text
> - * on platforms where such control is possible.
> - */
> -#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_SWITCH) || \
> -	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
> -#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
> -#else
> -#define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
> -#endif
> -
>  /* Make modules code happy. We don't set RO yet */
>  #define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
>  
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index be9c4106e22f..c42ecdf94e48 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -204,7 +204,7 @@ int mmu_mark_initmem_nx(void)
>  
>  	for (i = 0; i < nb - 1 && base < top;) {
>  		size = bat_block_size(base, top);
> -		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
> +		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
>  		base += size;
>  	}
>  	if (base < top) {
> @@ -215,7 +215,7 @@ int mmu_mark_initmem_nx(void)
>  				pr_warn("Some RW data is getting mapped X. "
>  					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
>  		}
> -		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
> +		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
>  		base += size;
>  	}
>  	for (; i < nb; i++)
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 15276068f657..0c9ef705803e 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
>  	p = memstart_addr + s;
>  	for (; s < top; s += PAGE_SIZE) {
>  		ktext = core_kernel_text(v);
> -		map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
> +		map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
>  		v += PAGE_SIZE;
>  		p += PAGE_SIZE;
>  	}
> -- 
> 2.49.0

