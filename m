Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4273F23FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 02:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrMLG0qgwz3cW8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 10:03:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=bUVS0z1t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=bUVS0z1t; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrMKc3ltQz305v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 10:03:14 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id y23so7445408pgi.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 17:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vRFO+rG5NKULoNq4nrGremPyKJ3sp4O0aBsDwvD+Jws=;
 b=bUVS0z1tbTEuTnJpUI0DCsREOWqYBS393adFo6vkPpAcDd3VFldkcu6Bu8+NPNkVIr
 zVB/aqzwm03BccvSPAo1MxAZoGqM1V3G7Ml6IdOp9vADp+ZnRlfr9+qSxRd7e6+I4Agi
 5JhMzvnd1IByLpNrXS8swwAmSNZRyvnAn463M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vRFO+rG5NKULoNq4nrGremPyKJ3sp4O0aBsDwvD+Jws=;
 b=DTDCTdjDHGjhRE3r4agqExXsyCZnKejmIvK89Ru3HJUWHBVdzE8nfcFHGTXp3Fug6O
 OCROTCV6z/UoLYm1/gxx8NN0HxWqLivgSr0jalvzya0JXjIt4eN0SpsbMCmelpAGoot9
 mIQss57dNrhhoHgLhJJNtNWKeayrMDlNDeJh1CyK9Sqo9QN+quT74itpldebDw7ONeSI
 LRQGLPrNbJjYVND68n2Fxnl1tLdjRYKvzMBDFwMzS+cAgbCHq7vTVnXXA9aRdQRCJIv8
 /htDwT4+zl2UPeY92HMuu4OGageTxOya5EwBas24Lgj/oWETDM854l+pqFeYdupGz3oi
 n8NQ==
X-Gm-Message-State: AOAM531JUQtp8iqRHK/oyb8MS6pkcw3FeUZb2yEez4DKL9UGbeLBEoq/
 k1IHzFxSRmGI3wg4AmndZi1emg==
X-Google-Smtp-Source: ABdhPJxUAM4AJRANovdfNIBfj6aTNBPXbXy30qW0KYGlBj+lnS2H5nQpOUOt6OPGf27oUrWy+/Ipjg==
X-Received: by 2002:a63:2242:: with SMTP id t2mr15735424pgm.111.1629417791779; 
 Thu, 19 Aug 2021 17:03:11 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:3a83:f47e:d5a3:378a])
 by smtp.gmail.com with ESMTPSA id d15sm3189825pfh.34.2021.08.19.17.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 17:03:11 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paul Mackerras
 <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Michael Neuling
 <mikey@neuling.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc: rectify selection to
 ARCH_ENABLE_SPLIT_PMD_PTLOCK
In-Reply-To: <20210819113954.17515-3-lukas.bulwahn@gmail.com>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
 <20210819113954.17515-3-lukas.bulwahn@gmail.com>
Date: Fri, 20 Aug 2021 10:03:08 +1000
Message-ID: <87pmu99e4j.fsf@dja-thinkpad.axtens.net>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Commit 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
> selects the non-existing config ARCH_ENABLE_PMD_SPLIT_PTLOCK in
> ./arch/powerpc/platforms/Kconfig.cputype, but clearly it intends to select
> ARCH_ENABLE_SPLIT_PMD_PTLOCK here (notice the word swapping!), as this
> commit does select that for all other architectures.
>
> Rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK instead.
>

Yikes, yes, 66f24fa766e3 does seem to have got that wrong. It looks like
that went into 5.13.

I think we want to specifically target this for stable so that we don't
lose the perfomance and scalability benefits of split pmd ptlocks:

Cc: stable@vger.kernel.org # v5.13+

(I don't think you need to do another revision for this, I think mpe
could add it when merging.)

I tried to check whether we accidentally broke SPLIT_PMD_PTLOCKs while
they were disabled:

 - There hasn't been any change to the pgtable_pmd_page_ctor or _dtor
   prototypes, and we haven't made any relevant changes to any of the
   files in arch/powerpc that called it.

 - I checked out v5.13 and powerpc/merge, applied this patch, built a
   pseries_le_defconfig and boot tested it in qemu. It didn't crash on
   boot or with /bin/sh and some shell commands, but I didn't exactly
   stress test the VM subsystem either.

This gives me some confidence it's both good for powerpc and stable-worthy.

Overall:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Fixes: 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/powerpc/platforms/Kconfig.cputype | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 6794145603de..a208997ade88 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -98,7 +98,7 @@ config PPC_BOOK3S_64
>  	select PPC_HAVE_PMU_SUPPORT
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> -	select ARCH_ENABLE_PMD_SPLIT_PTLOCK
> +	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_SUPPORTS_HUGETLBFS
>  	select ARCH_SUPPORTS_NUMA_BALANCING
> -- 
> 2.26.2
