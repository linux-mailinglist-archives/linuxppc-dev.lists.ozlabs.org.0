Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0451F325E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 04:48:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gvh70FTVzDqT9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 12:48:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49gvfT0t7mzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 12:47:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F7DE1FB;
 Mon,  8 Jun 2020 19:47:07 -0700 (PDT)
Received: from [10.163.79.104] (unknown [10.163.79.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDD0C3F66F;
 Mon,  8 Jun 2020 19:47:05 -0700 (PDT)
Subject: Re: [PATCH v2] mm/debug_vm_pgtable: Fix kernel crash by checking for
 THP support
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200608125252.407659-1-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <826398c3-9abe-e173-407e-e7a84c772517@arm.com>
Date: Tue, 9 Jun 2020 08:17:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200608125252.407659-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/08/2020 06:22 PM, Aneesh Kumar K.V wrote:
> Architectures can have CONFIG_TRANSPARENT_HUGEPAGE enabled but
> no THP support enabled based on platforms. For ex: with 4K
> PAGE_SIZE ppc64 supports THP only with radix translation.
> 
> This results in below crash when running with hash translation and
> 4K PAGE_SIZE.
> 
> kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:140!
> cpu 0x61: Vector: 700 (Program Check) at [c000000ff948f860]
>     pc: c0000000018810f8: debug_vm_pgtable+0x480/0x8b0
>     lr: c0000000018810ec: debug_vm_pgtable+0x474/0x8b0
> ...
> [c000000ff948faf0] c000000001880fec debug_vm_pgtable+0x374/0x8b0 (unreliable)
> [c000000ff948fbf0] c000000000011648 do_one_initcall+0x98/0x4f0
> [c000000ff948fcd0] c000000001843928 kernel_init_freeable+0x330/0x3fc
> [c000000ff948fdb0] c0000000000122ac kernel_init+0x24/0x148
> [c000000ff948fe20] c00000000000cc44 ret_from_kernel_thread+0x5c/0x78
> 
> Check for THP support correctly
> 
> Cc: anshuman.khandual@arm.com
> Fixes: 399145f9eb6c ("mm/debug: add tests validating architecture page table helpers")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 188c18908964..df3a3a08f4f8 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -61,6 +61,9 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd = pfn_pmd(pfn, prot);
>  
> +	if (!has_transparent_hugepage())
> +		return;
> +
>  	WARN_ON(!pmd_same(pmd, pmd));
>  	WARN_ON(!pmd_young(pmd_mkyoung(pmd_mkold(pmd))));
>  	WARN_ON(!pmd_dirty(pmd_mkdirty(pmd_mkclean(pmd))));
> @@ -80,6 +83,9 @@ static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pud_t pud = pfn_pud(pfn, prot);
>  
> +	if (!has_transparent_hugepage())
> +		return;
> +
>  	WARN_ON(!pud_same(pud, pud));
>  	WARN_ON(!pud_young(pud_mkyoung(pud_mkold(pud))));
>  	WARN_ON(!pud_write(pud_mkwrite(pud_wrprotect(pud))));
> 

Builds with THP on arc, s390 and runs with THP on x86 and arm64 platforms.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
