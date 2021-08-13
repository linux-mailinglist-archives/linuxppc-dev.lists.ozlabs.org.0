Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B23EB1B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 09:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmFpJ5M3Rz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 17:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=aKagUz1P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=aKagUz1P; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmFng4ywTz30LB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 17:39:49 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id j1so14085936pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rq5NT6ymn5YFPepcSa+GSbpNxqhhGT2CNtfO4KyTyrs=;
 b=aKagUz1P05PT0YM7DfpX5cf7NA8R7V/QF6YoSt15FHoqQ07kkmdlPN/7Eo1yoDemJK
 ChYpzmTZanfjBSXIhvsKJtce/7rj4W7BcxdLmKyaFS5n8622RiTF4lhgZ9HCunSoPalz
 y0gbd4FsnPYvsRxkam5YyD2Hu51FDFHdP8fg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rq5NT6ymn5YFPepcSa+GSbpNxqhhGT2CNtfO4KyTyrs=;
 b=lADl3pMgXqDwmkmW8kOQG2SZ65XgOOS5rMsIYLhNtaZ+tPhgkixF318gcPgrxuoZg4
 ZyZH5/UWYELwjpODHCoXHwrp3nx2Rt2TCn310JzZAhVZm/JIcZeokGTNQuijOCBDPGqO
 sXOF0CY45zw16sFKkKdWDC6RPJOYdaUhlBz9WmHsua4zJ8lw4mK3zTFLuiyI/cD6HpuU
 YAWMTsHpaqF/EEoujxHtROPw5CwfjV4Talendht4gErWs8Fk+Oy0Boincrnmsf9mvvO6
 iaED99oIApfc0I5RBF/KOmWP2YKzwosIjiNNPvjkgLDuMGqgxwqiaO85QP27uJfMfGX0
 HseQ==
X-Gm-Message-State: AOAM533HNEvihW6WcIR/gXXt1OsAJ1T7Y/dBDEZWoEDA713zBnSw9PKS
 R8NNFLusL8looZmzAvp1VvQT+Q==
X-Google-Smtp-Source: ABdhPJwmqyEDE3FbNdPNqdbkpL+bedpgIi+mPHMtdFXyREhl1/byAHJQgy+33Sm2yqwg5B0GAGtZsw==
X-Received: by 2002:a17:90a:c8c:: with SMTP id
 v12mr1375028pja.37.1628840384771; 
 Fri, 13 Aug 2021 00:39:44 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:e80c:91ad:1614:aeef])
 by smtp.gmail.com with ESMTPSA id i13sm1137323pfr.79.2021.08.13.00.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 00:39:44 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/2] powerpc/book3s64/radix: make
 tlb_single_page_flush_ceiling a debugfs entry
In-Reply-To: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
References: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
Date: Fri, 13 Aug 2021 17:39:41 +1000
Message-ID: <87v949eqte.fsf@linkitivity.dja.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_ceiling.
> Also add a debugfs entry for tlb_local_single_page_flush_ceiling.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
> Changes from v1:
> * switch to debugfs_create_u32
>
>  arch/powerpc/mm/book3s64/radix_tlb.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index aefc100d79a7..1fa2bc6a969e 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -17,6 +17,7 @@
>  #include <asm/trace.h>
>  #include <asm/cputhreads.h>
>  #include <asm/plpar_wrappers.h>
> +#include <asm/debugfs.h>
>  
>  #include "internal.h"
>  
> @@ -1106,8 +1107,8 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
>   * invalidating a full PID, so it has a far lower threshold to change from
>   * individual page flushes to full-pid flushes.
>   */
> -static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
> -static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
> +static u32 tlb_single_page_flush_ceiling __read_mostly = 33;
> +static u32 tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
>  
>  static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>  					    unsigned long start, unsigned long end)
> @@ -1524,3 +1525,14 @@ void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
>  EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
>  
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> +
> +static int __init create_tlb_single_page_flush_ceiling(void)
> +{
> +	debugfs_create_u32("tlb_single_page_flush_ceiling", 0600,
> +			   powerpc_debugfs_root, &tlb_single_page_flush_ceiling);
> +	debugfs_create_u32("tlb_local_single_page_flush_ceiling", 0600,
> +			   powerpc_debugfs_root, &tlb_local_single_page_flush_ceiling);
> +	return 0;
> +}
> +late_initcall(create_tlb_single_page_flush_ceiling);

This patch seems to do what the commit message says, and it does seem to
make sense to have these parameters as tunables.

I was briefly concerned that switching from an unsigned long to a u32
might lead to suboptimal code generation in older gcc versions, but it
doesn't seem to be a case where a single instruction is going to make a
huge impact.

I also wondered what the C integer promotion rules would do with a the
nr_pages > tlb*flush_ceiling comparisons, but if we are trying to flush
more than 4 billion pages we might have other, bigger problems! (Also,
if I understand the C integer rules correctly the u32 will get promoted
to an unsigned long anyway.)

All in all this seems good to me.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel



> +
> -- 
> 2.31.1
