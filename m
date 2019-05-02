Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 755AA1184B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 13:44:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vthf07GZzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 21:44:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EXLy1HDZ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vtgG53jDzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 21:43:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vtg83SdBzB09ZH;
 Thu,  2 May 2019 13:43:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EXLy1HDZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KxwpglQ6XV5S; Thu,  2 May 2019 13:43:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vtg82KKYzB09ZF;
 Thu,  2 May 2019 13:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556797380; bh=cMkTXTCMVvl2JDSWZdRJlzPRMgw1uvnG3jkjZKVvvsk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EXLy1HDZv52mN/1dlOI3ETPX2N0L3qyIz1HsaOh/OyZ9yN0bXdxRFyNe84tECqkd+
 sd/uksma7l8uPfYyZkNThvD/GsjFZI3suXI2876n57CgQ39O7jlfvQzCErWRKc3ga/
 LPuKAgdU93mOX+1JFnoJjjxOVCX8/FPFZqpp0BFM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F5A18B8F7;
 Thu,  2 May 2019 13:43:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Hd4E6wWeUzz0; Thu,  2 May 2019 13:43:01 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49A5B8B899;
 Thu,  2 May 2019 13:43:01 +0200 (CEST)
Subject: Re: [PATCH v1 3/4] powerpc/mm: Move book3s32 specifics in
 subdirectory mm/book3s64
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1553853405.git.christophe.leroy@c-s.fr>
 <12c1ba4fc9e2e55ca44c5c57225669b296d48c74.1553853405.git.christophe.leroy@c-s.fr>
 <87tvedxfa6.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9577f0d2-2447-5407-0b69-339a89cf40e1@c-s.fr>
Date: Thu, 2 May 2019 13:43:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87tvedxfa6.fsf@concordia.ellerman.id.au>
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



Le 02/05/2019 à 13:32, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> Several files in arch/powerpc/mm are only for book3S32. This patch
>> creates a subdirectory for them.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/mm/Makefile                            | 3 +--
>>   arch/powerpc/mm/book3s32/Makefile                   | 6 ++++++
>>   arch/powerpc/mm/{ => book3s32}/hash_low_32.S        | 0
>>   arch/powerpc/mm/{ => book3s32}/mmu_context_hash32.c | 0
>>   arch/powerpc/mm/{ => book3s32}/ppc_mmu_32.c         | 0
>>   arch/powerpc/mm/{ => book3s32}/tlb_hash32.c         | 0
>>   6 files changed, 7 insertions(+), 2 deletions(-)
>>   create mode 100644 arch/powerpc/mm/book3s32/Makefile
>>   rename arch/powerpc/mm/{ => book3s32}/hash_low_32.S (100%)
>>   rename arch/powerpc/mm/{ => book3s32}/mmu_context_hash32.c (100%)
>>   rename arch/powerpc/mm/{ => book3s32}/ppc_mmu_32.c (100%)
>>   rename arch/powerpc/mm/{ => book3s32}/tlb_hash32.c (100%)
> 
> I shortened them to:
> 
>    arch/powerpc/mm/{hash_low_32.S => book3s32/hash_low.S}
>    arch/powerpc/mm/{ppc_mmu_32.c => book3s32/mmu.c}

To be consistent with what you did in nohash/ dir, shouldn't we rename 
the above 'ppc.c' or 'ppc_32.c' instead of 'mmu.c' ?

Christophe

>    arch/powerpc/mm/{mmu_context_hash32.c => book3s32/mmu_context.c}
>    arch/powerpc/mm/{tlb_hash32.c => book3s32/tlb.c}
> 
> cheers
> 
