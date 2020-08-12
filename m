Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA0242A50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:27:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRVr769SdzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 23:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRVNH1LT9zDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 23:07:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6484731B;
 Wed, 12 Aug 2020 06:07:09 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7E33F70D;
 Wed, 12 Aug 2020 06:07:07 -0700 (PDT)
Subject: Re: [PATCH 15/16] debug_vm_pgtable/savedwrite: Use savedwrite test
 with protnone ptes
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-15-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <10d250e4-acb8-92a3-50c2-4ffce836c7db@arm.com>
Date: Wed, 12 Aug 2020 18:36:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-15-aneesh.kumar@linux.ibm.com>
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
> Saved write support was added to track the write bit of a pte after marking the
> pte protnone. This was done so that AUTONUMA can convert a write pte to protnone
> and still track the old write bit. When converting it back we set the pte write
> bit correctly thereby avoiding a write fault again.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 3e112d0ba1b2..eea62d5e503b 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -1006,8 +1006,8 @@ static int __init debug_vm_pgtable(void)
>  	pud_leaf_tests(pud_aligned, prot);
>  
>  #ifdef CONFIG_NUMA_BALANCING
> -	pte_savedwrite_tests(pte_aligned, prot);
> -	pmd_savedwrite_tests(pmd_aligned, prot);
> +	pte_savedwrite_tests(pte_aligned, protnone);
> +	pmd_savedwrite_tests(pmd_aligned, protnone);
>  #endif
>  	pte_special_tests(pte_aligned, prot);
>  	pte_protnone_tests(pte_aligned, protnone);
> 

This can be folded back with [PATCH 5/16] which now checks for
CONFIG_NUMA_BALANCING in pxx_savedwrite_tests().
