Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C598AC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 07:07:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DXbX61xDzDr48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BkpRitEX"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DXYX65YKzDr1X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:06:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DXYR1J3Hz9tygb;
 Thu, 22 Aug 2019 07:06:03 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BkpRitEX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S6X_i_dSBXy6; Thu, 22 Aug 2019 07:06:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DXYR05QWz9tygX;
 Thu, 22 Aug 2019 07:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566450363; bh=uczfUv3hnybC8UExT8P+EcZ1T/EfN1469uNM/tj0H6A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BkpRitEX2o9PA/vIhLtEKfnzZrsui3ZJjjWvIrcsMx8koUrySSY8ivASlF+09RAmP
 gpQNLFiBZl0emVtdPbxh36E+GPgwgdtx8Z58713B2SOY/bBxOro9H3JL+W0PBXwq51
 u3FbR9+kV/GAGVJV2G9iLn2uQj+gOjf0GagmOvC8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C728F8B791;
 Thu, 22 Aug 2019 07:06:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id erEJnxsK7q5p; Thu, 22 Aug 2019 07:06:03 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69A0D8B752;
 Thu, 22 Aug 2019 07:06:03 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
To: Alastair D'Silva <alastair@au1.ibm.com>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
 <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
 <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
 <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c22dfd19-872a-afe1-40c6-82e11b0af9e1@c-s.fr>
Date: Thu, 22 Aug 2019 07:06:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
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



Le 22/08/2019 à 02:27, Alastair D'Silva a écrit :
> On Wed, 2019-08-21 at 22:27 +0200, Christophe Leroy wrote:
>>
>> Le 20/08/2019 à 06:36, Alastair D'Silva a écrit :
>>> On Fri, 2019-08-16 at 15:52 +0000, Christophe Leroy wrote:
>>
>> [...]
>>
>>>
>>> Thanks Christophe,
>>>
>>> I'm trying a somewhat different approach that requires less
>>> knowledge
>>> of assembler. Handling of CPU_FTR_COHERENT_ICACHE is outside this
>>> function. The code below is not a patch as my tree is a bit messy,
>>> sorry:
>>
>> Can we be 100% sure that GCC won't add any code accessing some
>> global
>> data or stack while the Data MMU is OFF ?
>>
>> Christophe
>>
> 
> +mpe
> 
> I'm not sure how we would go about making such a guarantee, but I've
> tied every variable used to a register and addr is passed in a
> register, so there is no stack usage, and every call in there only
> operates on it's operands.
> 
> The calls to the inline cache helpers (for the PPC32 case) are all
> constants, so I can't see a reasonable scenario where there would be a
> function call and reordered to after the DR bit is turned off, but I
> guess if we want to be paranoid, we could always add an mb() call
> before the DR bit is manipulated to prevent the compiler from
> reordering across the section where the data MMU is disabled.
> 
> 

Anyway, I think the benefit of converting that function to C is pretty 
small. flush_dcache_range() and friends were converted to C mainly in 
order to inline them. But this __flush_dcache_icache_phys() is too big 
to be worth inlining, yet small and stable enough to remain in assembly 
for the time being.

So I suggest you keep it aside your series for now, just move 
PURGE_PREFETCHED_INS inside it directly as it will be the only remaining 
user of it.

Christophe
