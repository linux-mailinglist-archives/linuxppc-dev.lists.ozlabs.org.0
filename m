Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB411400
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 09:16:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vmlh3M7qzDqD2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:16:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rEHNJlQJ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vmkF129tzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 17:15:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vmk73BzLz9v05Y;
 Thu,  2 May 2019 09:15:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rEHNJlQJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TpNxnI6ZUBCj; Thu,  2 May 2019 09:15:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vmk7298cz9v05W;
 Thu,  2 May 2019 09:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556781311; bh=iVXsSTH0lWTeNrTGnZuWHGTn/IUlAmjSq/GG8IGe/k8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rEHNJlQJLgyz3el1t5mt6kuHmKaCiL4acEa59WfA+KAOI5dYLu45M3p1CGuWA/WYL
 TVSkOntHyh1uSSt79aFkqM/JN19f+/ZETREARyzIsC9fmZ+neXavstcaZF2vDxjW7f
 AczpdarKEYo01SrVfFQx19275Ca6wB8JegEsRzXg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EBD78B87F;
 Thu,  2 May 2019 09:15:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cgB-cgIwqxf4; Thu,  2 May 2019 09:15:12 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A72218B74C;
 Thu,  2 May 2019 09:15:11 +0200 (CEST)
Subject: Re: [PATCH v1 2/4] powerpc/mm: Move book3s64 specifics in
 subdirectory mm/book3s64
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1553853405.git.christophe.leroy@c-s.fr>
 <c4afde657ef9e4ad0266ae62e9907313c41c4a16.1553853405.git.christophe.leroy@c-s.fr>
 <87sgtx5o0j.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7dbe8476-bfa3-29ac-5155-a67823d39ef4@c-s.fr>
Date: Thu, 2 May 2019 09:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87sgtx5o0j.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/05/2019 à 09:11, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> Many files in arch/powerpc/mm are only for book3S64. This patch
>> creates a subdirectory for them.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/mm/Makefile                           | 25 +++----------------
>>   arch/powerpc/mm/book3s64/Makefile                  | 28 ++++++++++++++++++++++
>>   arch/powerpc/mm/{ => book3s64}/hash64_4k.c         |  0
>>   arch/powerpc/mm/{ => book3s64}/hash64_64k.c        |  0
>>   arch/powerpc/mm/{ => book3s64}/hash_native_64.c    |  0
>>   arch/powerpc/mm/{ => book3s64}/hash_utils_64.c     |  0
>>   arch/powerpc/mm/{ => book3s64}/hugepage-hash64.c   |  0
>>   .../powerpc/mm/{ => book3s64}/hugetlbpage-hash64.c |  0
>>   arch/powerpc/mm/{ => book3s64}/hugetlbpage-radix.c |  0
>>   .../mm/{ => book3s64}/mmu_context_book3s64.c       |  0
>>   arch/powerpc/mm/{ => book3s64}/mmu_context_iommu.c |  0
>>   arch/powerpc/mm/{ => book3s64}/pgtable-book3s64.c  |  0
>>   arch/powerpc/mm/{ => book3s64}/pgtable-hash64.c    |  0
>>   arch/powerpc/mm/{ => book3s64}/pgtable-radix.c     |  0
>>   arch/powerpc/mm/{ => book3s64}/pkeys.c             |  0
>>   arch/powerpc/mm/{ => book3s64}/slb.c               |  0
>>   arch/powerpc/mm/{ => book3s64}/subpage-prot.c      |  0
>>   arch/powerpc/mm/{ => book3s64}/tlb-radix.c         |  0
>>   arch/powerpc/mm/{ => book3s64}/tlb_hash64.c        |  0
>>   arch/powerpc/mm/{ => book3s64}/vphn.c              |  0
>>   arch/powerpc/mm/{ => book3s64}/vphn.h              |  0
>>   arch/powerpc/mm/numa.c                             |  2 +-
>>   22 files changed, 32 insertions(+), 23 deletions(-)
>>   create mode 100644 arch/powerpc/mm/book3s64/Makefile
>>   rename arch/powerpc/mm/{ => book3s64}/hash64_4k.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/hash64_64k.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/hash_native_64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/hash_utils_64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/hugepage-hash64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/hugetlbpage-hash64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/hugetlbpage-radix.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/mmu_context_book3s64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/mmu_context_iommu.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/pgtable-book3s64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/pgtable-hash64.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/pgtable-radix.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/pkeys.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/slb.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/subpage-prot.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/tlb-radix.c (100%)
>>   rename arch/powerpc/mm/{ => book3s64}/tlb_hash64.c (100%)
> 
> Do you mind if I take this but rework the destination names in the process?

I don't mind, I think it's a good idea.

> 
> I don't like having eg. book3s64/pgtable-book3s64.c
> 
> And some of the other names could use a bit of cleanup too.
> 
> What about:
> 
>   arch/powerpc/mm/{hash64_4k.c => book3s64/hash_4k.c}
>   arch/powerpc/mm/{hash64_64k.c => book3s64/hash_64k.c}
>   arch/powerpc/mm/{hugepage-hash64.c => book3s64/hash_hugepage.c}
>   arch/powerpc/mm/{hugetlbpage-hash64.c => book3s64/hash_hugetlbpage.c}
>   arch/powerpc/mm/{hash_native_64.c => book3s64/hash_native.c}
>   arch/powerpc/mm/{pgtable-hash64.c => book3s64/hash_pgtable.c}
>   arch/powerpc/mm/{tlb_hash64.c => book3s64/hash_tlb.c}
>   arch/powerpc/mm/{hash_utils_64.c => book3s64/hash_utils.c}
>   arch/powerpc/mm/{mmu_context_iommu.c => book3s64/iommu_api.c}
>   arch/powerpc/mm/{mmu_context_book3s64.c => book3s64/mmu_context.c}
>   arch/powerpc/mm/{pgtable-book3s64.c => book3s64/pgtable.c}
>   arch/powerpc/mm/{hugetlbpage-radix.c => book3s64/radix_hugetlbpage.c}
>   arch/powerpc/mm/{pgtable-radix.c => book3s64/radix_pgtable.c}
>   arch/powerpc/mm/{tlb-radix.c => book3s64/radix_tlb.c}

Looks good

Christophe
