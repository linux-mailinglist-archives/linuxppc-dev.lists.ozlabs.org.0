Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06B658F00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Dec 2022 17:25:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjYdb1spXz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 03:25:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JyJ1Hotx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JyJ1Hotx;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjYZc1Z6Tz3bWT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 03:22:30 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so16215299pjg.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Dec 2022 08:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec85AyiKc77bI9XsP5tX5lamemx/Nh18BP3PMc4R5sU=;
        b=JyJ1HotxL5h5gP0PAUr+bSyy8u1zOFXKWz1ZfgSiQeQvzYRYtdYK5A29TTv7eUyBSq
         O6WUTpHiy10Kl0hHmRgy/d9fal5bMY/E/lNTQ2LCgCfG8iVu/uN6+Uj5ExC6mHOnsXiu
         0ohB97kr44YJgmKniWXNLUoVi+8oVMmtdexytQrx6+rzrxhktuoTfzAedL35hCbYbn09
         5yB5XsMVIjKdTNReT5H6YpQsO7a4nnDDcbUBIjnPH2H4vmdpB5S32Eq6ZsH3EXQnBVqu
         h/JxK+dWLoxFuxlgdjXCLEO7aHIvjXxyMe2Wjpx0m1kdrzxduQK6w3r0Q8wQ2fW6djA1
         pXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec85AyiKc77bI9XsP5tX5lamemx/Nh18BP3PMc4R5sU=;
        b=hxkEutA8olSC6qoaFFb6CY39E37zwibQyBO8A/zlq6N2urSu928X1eMt0lUyBTjT4e
         zhZqhMvUlOIlVX/LMaZejbLRL5qfbGPH8eZVfC8tKPpaudR7dJ5xznwDlZHyZ5xAPWhm
         JKyQ8O8ZJS+qubco7FayDu5Uoh226V9aBVQDes3RwkSD0W742+tvbbaAEl9hjVWtF39C
         J05Xfk3oiCbo6kRX57O7esp+OoX+p9+NhSAIDEQO8xSZsmY4uXRmslI3ULDtckg0NYqw
         na19UXjFTpMKj89Kw+hvZkRGcxLJOxDPdwQK+5NBcunnOrZgg5VpCjFeA72Jw8mnwyiN
         DrFA==
X-Gm-Message-State: AFqh2kqiy6JU4IbgWn+xYxLGAdLu6lmEAKWZdxScjDVzVYUAH0VyriD+
	LgK5w80vkZkDXJERQ+my29gU+A==
X-Google-Smtp-Source: AMrXdXvdOJhcRsj0KUW218UKcAvJUd1l0xKIGxZQv8spR2kcI0qwBPtGX+cj507spyFm31HkJycFdg==
X-Received: by 2002:a17:902:a981:b0:187:403c:7a3b with SMTP id bh1-20020a170902a98100b00187403c7a3bmr25977484plb.69.1672330943683;
        Thu, 29 Dec 2022 08:22:23 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902bcc400b0019254c19697sm13000824pls.289.2022.12.29.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:23 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:23 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:51:42 PST (-0800)
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use zap_vma_page_range
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mike.kravetz@oracle.com
Message-ID: <mhng-3136c2a0-6953-4794-856c-46cacdc2c30a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: brauner@kernel.org, linux-s390@vger.kernel.org, nadav.amit@gmail.com, mhocko@suse.com, Will Deacon <will@kernel.org>, david@redhat.com, netdev@vger.kernel.org, riel@surriel.com, linux-kernel@vger.kernel.org, peterx@redhat.com, linux-mm@kvack.org, edumazet@google.com, dave.hansen@linux.intel.com, willy@infradead.org, linux-riscv@lists.infradead.org, borntraeger@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, vbabka@suse.cz, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Dec 2022 11:20:12 PST (-0800), mike.kravetz@oracle.com wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas as calls
> should be vma specific.
>
> Instead of fixing zap_page_range, change all callers to use the new
> routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> zap_page_range_single passing in NULL zap details.  The name is also
> more in line with other exported routines that operate within a vma.
> We can then remove zap_page_range.
>
> Also, change madvise_dontneed_single_vma to use this new routine.
>
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm64/kernel/vdso.c                |  4 ++--
>  arch/powerpc/kernel/vdso.c              |  2 +-
>  arch/powerpc/platforms/book3s/vas-api.c |  2 +-
>  arch/powerpc/platforms/pseries/vas.c    |  2 +-
>  arch/riscv/kernel/vdso.c                |  4 ++--
>  arch/s390/kernel/vdso.c                 |  2 +-
>  arch/s390/mm/gmap.c                     |  2 +-
>  arch/x86/entry/vdso/vma.c               |  2 +-
>  drivers/android/binder_alloc.c          |  2 +-
>  include/linux/mm.h                      |  7 ++++--
>  mm/madvise.c                            |  4 ++--
>  mm/memory.c                             | 30 -------------------------
>  mm/page-writeback.c                     |  2 +-
>  net/ipv4/tcp.c                          |  6 ++---
>  14 files changed, 22 insertions(+), 49 deletions(-)

[snip]

> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index e410275918ac..a405119da2c0 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -127,10 +127,10 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  		unsigned long size = vma->vm_end - vma->vm_start;
>
>  		if (vma_is_special_mapping(vma, vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #ifdef CONFIG_COMPAT
>  		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #endif
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!
