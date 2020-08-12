Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC4C242842
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 12:32:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRQxw3lKgzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 20:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRQvv1fBDzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 20:30:48 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8A1BD6E;
 Wed, 12 Aug 2020 03:30:45 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07943F22E;
 Wed, 12 Aug 2020 03:30:43 -0700 (PDT)
Subject: Re: [PATCH 04/16] debug_vm_pgtables/hugevmap: Use the arch helper to
 identify huge vmap support.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-4-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <30437101-3372-b4f7-e24a-10cdad101f77@arm.com>
Date: Wed, 12 Aug 2020 16:00:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-4-aneesh.kumar@linux.ibm.com>
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


On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
> ppc64 supports huge vmap only with radix translation. Hence use arch helper
> to determine the huge vmap support.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 02a7c20aa4a2..679bb3d289a3 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -206,7 +206,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd;
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pmd_supported())
>  		return;
>  
>  	pr_debug("Validating PMD huge\n");
> 

Problem is arch_ioremap_pmd_supported() symbol which should also be
explicitly included via <linux/io.h>, is not available without the
config CONFIG_HAVE_ARCH_HUGE_VMAP. ioremap_pmd_enabled() should have
been better here and has a fallback for !CONFIG_HAVE_ARCH_HUGE_VMAP.
But then the symbol is local to that file. Unless we would like to
make ioremap_pxx_enabled generally available, the remaining option
would be to wrap pxx_huge_tests() with CONFIG_HAVE_ARCH_HUGE_VMAP.
Similar changes should also be done for pud_huge_tests() as well.
