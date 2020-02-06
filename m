Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0C153E5A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 06:50:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CnZY4Y5xzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 16:49:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=K6q2h/Nm; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CnXx6PMDzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 16:48:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48CnXq4Wx4z9v024;
 Thu,  6 Feb 2020 06:48:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=K6q2h/Nm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QzYOt4K16qMr; Thu,  6 Feb 2020 06:48:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48CnXq33Gnz9v01y;
 Thu,  6 Feb 2020 06:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580968107; bh=jlshEA1gsn0iWO7u4jYH/z5ROmbK58lfBdzgt7JI0Rg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K6q2h/Nm3gLs3zdDE8GipYrFPQBqGlf2n5rYou4MJFj5CCancQ46f9nXTEiplN1sZ
 MaOJiCKHenN3TgDVIdf9xFwdmfWzunLsPeISw5xj4NVhxTN6UFi2HrlG387bOcyf3E
 zU0xN3ybGVHIISPeAOmVyF/IU8J6OF8dvHKDAOQw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51F678B776;
 Thu,  6 Feb 2020 06:48:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8MY5d7mOlDvx; Thu,  6 Feb 2020 06:48:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E9848B78A;
 Thu,  6 Feb 2020 06:48:12 +0100 (CET)
Subject: Re: [PATCH v6 04/11] powerpc/mce_power: Use functions to track
 lockless pgtbl walks
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Balbir Singh <bsingharora@gmail.com>, Reza Arbab <arbab@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>
References: <20200206030900.147032-1-leonardo@linux.ibm.com>
 <20200206030900.147032-5-leonardo@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e8a5db5a-d1a5-ef25-af46-c44949750e8a@c-s.fr>
Date: Thu, 6 Feb 2020 06:48:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206030900.147032-5-leonardo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/02/2020 à 04:08, Leonardo Bras a écrit :
> Applies the new functions used for tracking lockless pgtable walks on
> addr_to_pfn().
> 
> local_irq_{save,restore} is already inside {begin,end}_lockless_pgtbl_walk,
> so there is no need to repeat it here.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>   arch/powerpc/kernel/mce_power.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
> index 1cbf7f1a4e3d..a9e38ef4e437 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -29,7 +29,7 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>   {
>   	pte_t *ptep;
>   	unsigned int shift;
> -	unsigned long pfn, flags;
> +	unsigned long pfn, irq_mask;

Why change the name ? flags is a well known historical name.

>   	struct mm_struct *mm;
>   
>   	if (user_mode(regs))
> @@ -37,7 +37,7 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>   	else
>   		mm = &init_mm;
>   
> -	local_irq_save(flags);
> +	irq_mask = begin_lockless_pgtbl_walk();
>   	ptep = __find_linux_pte(mm->pgd, addr, NULL, &shift);
>   
>   	if (!ptep || pte_special(*ptep)) {
> @@ -53,7 +53,7 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>   	}
>   
>   out:
> -	local_irq_restore(flags);
> +	end_lockless_pgtbl_walk(irq_mask);
>   	return pfn;
>   }
>   
> 

Christophe
