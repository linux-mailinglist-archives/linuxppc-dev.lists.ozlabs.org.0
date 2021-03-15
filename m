Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1433B32F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:03:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzc6B5GRWz30FM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzc5s1rYmz2xZD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:02:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dzc5h1DH7z9tyRm;
 Mon, 15 Mar 2021 14:02:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zbRByMg-vOPS; Mon, 15 Mar 2021 14:02:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dzc5g6C1Zz9tyRk;
 Mon, 15 Mar 2021 14:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C1CF88B776;
 Mon, 15 Mar 2021 14:02:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2I_92wJSbw6e; Mon, 15 Mar 2021 14:02:36 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F29F8B779;
 Mon, 15 Mar 2021 14:02:36 +0100 (CET)
Subject: Re: [PATCH v6 19/22] powerpc/book3s64/hash/kuap: Enable kuap on hash
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-20-aneesh.kumar@linux.ibm.com>
 <2898f50c-aa42-5842-9d29-7272c7da5d00@csgroup.eu>
 <cc0338af-da92-f6d5-c0fb-aca67a2cccc5@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <02869c06-a3e5-2f9e-50a4-9b1d63061401@csgroup.eu>
Date: Mon, 15 Mar 2021 14:02:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cc0338af-da92-f6d5-c0fb-aca67a2cccc5@linux.ibm.com>
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 13:59, Aneesh Kumar K.V a écrit :
> On 3/15/21 5:36 PM, Christophe Leroy wrote:
>>
>>
>> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>>> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>
>> PPC_HAVE_KUAP is only selected on book3s/64 when PPC_RADIX_MMU is selected. Is that normal ?
>>
> 
> 
> I guess we missed fixing that with this patch. How about

Yes, looks good to me.

> 
> modified   arch/powerpc/platforms/Kconfig.cputype
> @@ -103,6 +103,8 @@ config PPC_BOOK3S_64
>       select ARCH_SUPPORTS_NUMA_BALANCING
>       select IRQ_WORK
>       select PPC_MM_SLICES
> +    select PPC_HAVE_KUEP
> +    select PPC_HAVE_KUAP
> 
>   config PPC_BOOK3E_64
>       bool "Embedded processors"
> @@ -365,8 +367,6 @@ config PPC_RADIX_MMU
>       bool "Radix MMU Support"
>       depends on PPC_BOOK3S_64
>       select ARCH_HAS_GIGANTIC_PAGE
> -    select PPC_HAVE_KUEP
> -    select PPC_HAVE_KUAP
>       default y
>       help
>         Enable support for the Power ISA 3.0 Radix style MMU. Currently this
> 
> 
> 
> 
> 
> -aneesh
