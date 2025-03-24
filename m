Return-Path: <linuxppc-dev+bounces-7307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F313EA6D665
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 09:39:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLmgn34jwz2ykZ;
	Mon, 24 Mar 2025 19:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742805573;
	cv=none; b=OQsAEa5h+3H7a0HADFq3IyC+E4Ac8+eA9V6GChe/NrontuljMlOBrrzHy1nhA6kP+AxZcUqhU9UnbbNHQmMf3b72pMOKA8VwzleFxEkTq5yJjYQF6pUom+DNph4uIjlpZ0Bw45ALSY4ZFOb7wnzhi0S8a+xppGRMnFgdw/Cr2Q7tdcKxVxtt0MYusCVqPBRqRuM22m/0lSs/ofQRH1UKahfqUHCDEH2q7gcJNLCzGY5qtsicKmeaY1WNAEf8frIrn9kZJzLjowjzPvdV0hZuHQLm9IMyXWcmzvXDavOzMy7ta5S0PtEWe+JyAwQlOa/gNwIGlcNtYYL0MDs++ABnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742805573; c=relaxed/relaxed;
	bh=HBG2SFimC367ri+OK5yqfITjdNOx6Z+4gkaFl607Uhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYV9LIFdXZHZUhPjShl1ZtwAucAgoiFtBdlNJJyl/kGzxpm4Nhn8KuQbftCMB9d3qG+2WG2CFsaTeeW6vUC9U3VIXJCu60naShj3dDX/cGcsV7r5vkxp980L17ytNj+BGjJOLc6CYMFmgoDZ6Dk3EfXK+Kr7/PqjGgBYf+OhdigU2gRCxJw6cqXBEmKxmmKxVB4DhTAH07MOauztQ5hrWcV6FV5VxOEy9w54+jRkzobwRCUQLEX3Ms3iHSR+0hOA11BOwng+HUYAnpVNcLHBcWUAJ5opuTTSDAbc+80Lam3dFGW5usRo9+fcEvjcziP/cnNIsMONmB+KN4JgA8Gs9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLmgm3vg2z2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 19:39:30 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3C51A2D;
	Mon, 24 Mar 2025 01:39:05 -0700 (PDT)
Received: from [10.57.41.67] (unknown [10.57.41.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53A833F58B;
	Mon, 24 Mar 2025 01:38:53 -0700 (PDT)
Message-ID: <efc72f28-0dcb-4811-a20c-73bcdbdf28fb@arm.com>
Date: Mon, 24 Mar 2025 09:37:56 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] mm: Call ctor/dtor for kernel PTEs
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
 <20250317141700.3701581-3-kevin.brodsky@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250317141700.3701581-3-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/03/2025 15:16, Kevin Brodsky wrote:
> diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
> index e164ca66f0f6..3c8ec3bfea44 100644
> --- a/include/asm-generic/pgalloc.h
> +++ b/include/asm-generic/pgalloc.h
> @@ -23,6 +23,11 @@ static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
>  
>  	if (!ptdesc)
>  		return NULL;
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {

As reported by the CI [1], this can cause trouble on x86 because dtor
calls are missing in pud_free_pmd_page() and pmd_free_pte_page(). Will
fix in the next version.

- Kevin

[1] https://lore.kernel.org/oe-lkp/202503211612.e11bd73f-lkp@intel.com/

