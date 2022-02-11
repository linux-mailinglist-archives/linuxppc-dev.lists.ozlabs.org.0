Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA9B4B232E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:34:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw93R5CFMz3cPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 21:34:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SvqgYTsP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SvqgYTsP; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw92p4s0Vz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 21:34:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3178EB8294F;
 Fri, 11 Feb 2022 10:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AED7C340E9;
 Fri, 11 Feb 2022 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644575645;
 bh=wXXuyKBQt46IGOEHezmN82dITuXgKrK5o/eWPXu2fvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SvqgYTsPaCzQdgevk0P6T6vM6jW6nDW8c4Md4WJQARQLFYVVvGHCfSM3lOGaDZL2m
 zJhOtTpJWum2yeaLgVDIhHKciV0E8HE7GgjUI6g5vkGsm6QT9O9f/XEL7rO2oSGM32
 Wb6+NgshhTdM2q/d9LDUChl7laPTCNStwtZ3wR1t2LjtwY1DazH7nJrxUByhI0cb3y
 FKLeEyg8UjIp8pey9AYNC27YThq42ecrLJ7sUiW+Tkhq9yH2P2DJoVuv12tS9TvPhu
 8pzH6EhPyfHX8BH3dveaWXMJRiUYrkVK+offjxfTHFacoVRlLJBDdm8CInbKRnItbc
 yB/EPxDXx8DvA==
Date: Fri, 11 Feb 2022 12:33:56 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Message-ID: <YgY7lDToiQ0pM6U6@kernel.org>
References: <20220211063330.99648-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211063330.99648-1-aneesh.kumar@linux.ibm.com>
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
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 11, 2022 at 12:03:28PM +0530, Aneesh Kumar K.V wrote:
> Keep it simple by using a #define and limiting hugepage size to 2M.
> This keeps the test simpler instead of dynamically finding the page size
> and huge page size.
> 
> Without this tests are broken w.r.t reading /proc/self/pagemap
> 
> 	if (pread(pagemap_fd, ent, sizeof(ent),
> 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
> 		err(2, "read pagemap");
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  tools/testing/selftests/vm/ksm_tests.c        | 9 ++++++++-
>  tools/testing/selftests/vm/transhuge-stress.c | 9 ++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
> index 1436e1a9a3d3..cae72872152b 100644
> --- a/tools/testing/selftests/vm/ksm_tests.c
> +++ b/tools/testing/selftests/vm/ksm_tests.c
> @@ -22,7 +22,14 @@
>  #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>  #define MB (1ul << 20)
>  
> -#define PAGE_SHIFT 12
> +#ifdef __powerpc64__
> +#define PAGE_SHIFT	16
> +#else
> +#define PAGE_SHIFT	12
> +#endif

Page size can be other than 4096 for other configurations as well. And even
on ppc64 it's not necessarily 64k.

Ideally page size in selftests/vm should be sysconf(_SC_PAGESIZE)

> +/*
> + * On ppc64 this will only work with radix 2M hugepage size
> + */
>  #define HPAGE_SHIFT 21
>  
>  #define PAGE_SIZE (1 << PAGE_SHIFT)
> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
> index 5e4c036f6ad3..b1f8d98355c5 100644
> --- a/tools/testing/selftests/vm/transhuge-stress.c
> +++ b/tools/testing/selftests/vm/transhuge-stress.c
> @@ -16,7 +16,14 @@
>  #include <string.h>
>  #include <sys/mman.h>
>  
> -#define PAGE_SHIFT 12
> +#ifdef __powerpc64__
> +#define PAGE_SHIFT	16
> +#else
> +#define PAGE_SHIFT	12
> +#endif
> +/*
> + * On ppc64 this will only work with radix 2M hugepage size
> + */
>  #define HPAGE_SHIFT 21
>  
>  #define PAGE_SIZE (1 << PAGE_SHIFT)
> -- 
> 2.34.1
> 
> 

-- 
Sincerely yours,
Mike.
