Return-Path: <linuxppc-dev+bounces-5587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E871A1D244
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 09:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhLvC5SL1z304C;
	Mon, 27 Jan 2025 19:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737966007;
	cv=none; b=LAnRBUMgKzjJvc8GlHJZfJfkqVk2zufa+zHpfmwDw6qIBKqZAHC2IJnzXDYkXbDWHrWyBm0jcjmpB30XMCyY0KetYQnTGqGUnW09pGK19lRiWF1V45fX3QzSzgM8c4GnKaQa72C1VfFyMyFIKZeIG7JLSbJulqYE6XNNxQ3wm55C5DPzyefuUfJwmlud2HeRDnNERDbNDHm2tQLUw8j726SgWoRSiJbFZMY8JGVgdvWxla12TkfAGz0AhDwi3XCt49erEER11PJPs/J+YENey/2j1cUzNEP3aSlFsjGt5OxbscN2T6zeKo4YOnlkPstbC+10siRGfVkEwQ+v0XheMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737966007; c=relaxed/relaxed;
	bh=1IDSXgPqGUnROEN6PgUPRBh1EN9XG5YMqPhQkPwBV9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cothMenYNYntuBaMIg8aGhr2TImoTSHUaLCjJ1ewNyUKnDFaaaNnyICiMwMUdqkjfjq4WbPaSvVU7Y8mvGupm3arsKAczPve131k/MEZdNHwmruWI4qg+W/xovMj/T8/MQ7oOe/I3G/r72ZSfviCWqphhfrtmL+F8zxOjqzwZc0JnHwFIe7PW2Cgh8GvbZg8iAYt4C/lRJn++A1C5UC7YK1HmmZ5UbQF3PtJyTF1GxpITIMCY+Cz18Rh57A3tshxKlYLvoGncZ0+htLrmNUH/3fXSMAErwdLy2yDUBx7xmYiZ0F/Ce1QaDSPl6riW3mN00g+6yPyVQJUnmpPZvapmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhLvB3c4Kz3011
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 19:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YhLJ708mlz9sRk;
	Mon, 27 Jan 2025 08:53:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yq7lNBtm7Jta; Mon, 27 Jan 2025 08:53:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YhLJ66KD9z9sPd;
	Mon, 27 Jan 2025 08:53:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C96138B764;
	Mon, 27 Jan 2025 08:53:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3B3nWqhsvGgA; Mon, 27 Jan 2025 08:53:10 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 64C6A8B763;
	Mon, 27 Jan 2025 08:53:10 +0100 (CET)
Message-ID: <50d7c398-b043-478f-92ee-70d144126e4a@csgroup.eu>
Date: Mon, 27 Jan 2025 08:53:10 +0100
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
Subject: Re: [PATCH v3] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20250125104928.88881-1-sourabhjain@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250125104928.88881-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/01/2025 à 11:49, Sourabh Jain a écrit :
> The fadump kernel boots with limited memory solely to collect the kernel
> core dump. Having gigantic hugepages in the fadump kernel is of no use.
> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
> gigantic hugepages are allocated.
> 
> To address this, disable gigantic hugepages if fadump is active by
> returning early from arch_hugetlb_valid_size() using
> hugepages_supported(). hugepages_supported() returns false if fadump is
> active.

Maybe you could explain how that's done. As far as I can see there is no 
powerpc specific version of hugepages_supported(), so it relies on 
hpage_shift being 0, but I was not able to quickly spot where that is done.

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
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> 
> Changelog:
> 
> v1:
> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
> 
> v2:
> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
> 
> v3:
>   - Do not modify the initialization of the shift variable
> 
> ---
>   arch/powerpc/mm/hugetlbpage.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 6b043180220a..88cfd182db4e 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>   	int shift = __ffs(size);
>   	int mmu_psize;
>   
> +	if (!hugepages_supported())
> +		return false;
> +
>   	/* Check that it is a page size supported by the hardware and
>   	 * that it fits within pagetable and slice limits. */
>   	if (size <= PAGE_SIZE || !is_power_of_2(size))


