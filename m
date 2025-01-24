Return-Path: <linuxppc-dev+bounces-5549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20FBA1B7C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 15:20:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yfg2054V2z2yYs;
	Sat, 25 Jan 2025 01:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737728408;
	cv=none; b=A6VQg+/nP1auqbijdBATkt7vzlabfqSRvCRQvBlE5cJBTjMQiFhhl378WoFzmvVXp+jqoKcOlY5d4CON1F9MYPXiEImCL91z43OQha2puy1LYl/rG8HA0ND2vHJxCYyqIzXt+CWLO9ExjJ+kClqznywWgTCdZxmB42jvsw9bPpbnVv9KVv34rwlLsE1ICkcu7iyjoVDaVXMDG8GlhO50Xbd7ifbyrFnrtx8F06gEcgjrnZkTXmVzXy1fMiSnS+KDPo89d9HsUWFUl1yA58Mnz5VOKMXAuGyZQZfOpBBjjpgApsyZYcOr3hkCPoncIWGJ/L0orXI/rU1D/E/ACjaFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737728408; c=relaxed/relaxed;
	bh=0aRKrW5Q722urjD7r6kGvbvgeEPB4oglH6SM2l6UXXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNWbUYFksonkHaThzrUeCVLAlKVFV/OWT6cb2SnjdMhHSeWa1qzaWn7FG/xaQcNDREi7PcZeiRr6nj7PPnP0vLCKbtm/9UlmAaGfcdTU5FzxXeiepqL/AeVxJeeJraGVOeS7ZBI9yHSAp+QTH+cT5H8cz9WgUnUbnHb2tE8ke3/h+xTl1utg/CVI5l0/bmhYdYqofTe5oJHfdZrbjWsFXdArumuDtobjRSlKFE/OepzaDbjmo6ZyEwGKPr9sc8EKdETN3gFLhqKLHOKpdTZxB1vFPBt+XCdlPV4vOVSoFAzeo5tQJnJ0ouazCBKjIeBOP3/DemYir0PL9uX+se+/Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yfg1z75dRz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 01:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YffvM1NF1z9sSW;
	Fri, 24 Jan 2025 15:14:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aC33Jj63eXKI; Fri, 24 Jan 2025 15:14:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YffvM0QCTz9sSR;
	Fri, 24 Jan 2025 15:14:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F1ED08B775;
	Fri, 24 Jan 2025 15:14:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hNsdM5NPl2E0; Fri, 24 Jan 2025 15:14:22 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 94A698B763;
	Fri, 24 Jan 2025 15:14:22 +0100 (CET)
Message-ID: <147cd977-bfd0-4f9d-a9ae-748351ebaeab@csgroup.eu>
Date: Fri, 24 Jan 2025 15:14:22 +0100
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
Subject: Re: [PATCH v2] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20250124103220.111303-1-sourabhjain@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250124103220.111303-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 24/01/2025 à 11:32, Sourabh Jain a écrit :
> The fadump kernel boots with limited memory solely to collect the kernel
> core dump. Having gigantic hugepages in the fadump kernel is of no use.
> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
> gigantic hugepages are allocated.
> 
> To address this, disable gigantic hugepages if fadump is active by
> returning early from arch_hugetlb_valid_size() using
> hugepages_supported(). hugepages_supported() returns false if fadump is
> active.
> 
> Returning early from arch_hugetlb_valid_size() not only disables
> gigantic hugepages but also avoids unnecessary hstate initialization for
> every hugepage size supported by the platform.
> 
> kernel logs related to hugepages with this patch included:
> kernel argument passed: hugepagesz=1G hugepages=1
> 
> First kernel: gigantic hugepage got allocated
> ==============================================
> 
> dmesg | grep -i "hugetlb"
> -------------------------
> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
> 
> $ cat /proc/meminfo | grep -i "hugetlb"
> -------------------------------------
> Hugetlb:         1048576 kB
> 
> Fadump kernel: gigantic hugepage not allocated
> ===============================================
> 
> dmesg | grep -i "hugetlb"
> -------------------------
> [    0.000000] HugeTLB: unsupported hugepagesz=1G
> [    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
> [    0.706375] HugeTLB support is disabled!
> [    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes
> 
> $ cat /proc/meminfo | grep -i "hugetlb"
> ----------------------------------
> <Nothing>
> 
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> 
> Changelog:
> 
> v1:
> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
> 
> v2:
>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
> 
> ---
>   arch/powerpc/mm/hugetlbpage.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 6b043180220a..087a8df32416 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -135,8 +135,12 @@ int __init alloc_bootmem_huge_page(struct hstate *h, int nid)
>   
>   bool __init arch_hugetlb_valid_size(unsigned long size)
>   {
> -	int shift = __ffs(size);
> -	int mmu_psize;
> +	int shift, mmu_psize;
> +
> +	if (!hugepages_supported())
> +		return false;
> +
> +	shift = __ffs(size);

Why change the declaration/init of shift ?

It should be enough to leave things as they are and just add

	if (!hugepages_supported())
		return false;


>   
>   	/* Check that it is a page size supported by the hardware and
>   	 * that it fits within pagetable and slice limits. */


