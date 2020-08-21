Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF524CD75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 07:55:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXrMm08JkzDr80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 15:55:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXrDb2Dd4zDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 15:49:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BXrDW3DBnz9vD3p;
 Fri, 21 Aug 2020 07:48:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VpnWpAjDVMm5; Fri, 21 Aug 2020 07:48:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BXrDW28hTz9vD3n;
 Fri, 21 Aug 2020 07:48:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 347958B87B;
 Fri, 21 Aug 2020 07:49:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OrIyz0STq1FM; Fri, 21 Aug 2020 07:49:00 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 479D18B75F;
 Fri, 21 Aug 2020 07:48:59 +0200 (CEST)
Subject: Re: [PATCH v5 6/8] mm: Move vmap_range from lib/ioremap.c to
 mm/vmalloc.c
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20200821044427.736424-1-npiggin@gmail.com>
 <20200821044427.736424-7-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <75f426b3-fcaf-c8fc-65b8-a6f501bae1da@csgroup.eu>
Date: Fri, 21 Aug 2020 07:48:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821044427.736424-7-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/08/2020 à 06:44, Nicholas Piggin a écrit :
> This is a generic kernel virtual memory mapper, not specific to ioremap.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   include/linux/vmalloc.h |   2 +
>   mm/ioremap.c            | 192 ----------------------------------------
>   mm/vmalloc.c            | 191 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 193 insertions(+), 192 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 787d77ad7536..e3590e93bfff 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -181,6 +181,8 @@ extern struct vm_struct *remove_vm_area(const void *addr);
>   extern struct vm_struct *find_vm_area(const void *addr);
>   
>   #ifdef CONFIG_MMU
> +extern int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift);

extern keyword is useless on function prototypes and deprecated. Please 
don't add new function prototypes with that keyword.

>   extern int map_kernel_range_noflush(unsigned long start, unsigned long size,
>   				    pgprot_t prot, struct page **pages);
>   int map_kernel_range(unsigned long start, unsigned long size, pgprot_t prot,

Christophe
