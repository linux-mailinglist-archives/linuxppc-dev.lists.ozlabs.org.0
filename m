Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFF2DA7C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 06:43:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw6cK3Bx6zDqSG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 16:43:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw6Zp60zTzDqLW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 16:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Cw6Zp4NZwz8tY6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 16:41:54 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4Cw6Zp3qT0z9sS8; Tue, 15 Dec 2020 16:41:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Cw6Zn2Y4wz9sRK
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Dec 2020 16:41:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cw6ZY4YTfz9v0Jf;
 Tue, 15 Dec 2020 06:41:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6I8zgyug_2OX; Tue, 15 Dec 2020 06:41:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cw6ZY3mcRz9v0Jd;
 Tue, 15 Dec 2020 06:41:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 506188B76A;
 Tue, 15 Dec 2020 06:41:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uJ2YUkZP-TW1; Tue, 15 Dec 2020 06:41:42 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E0B8B75E;
 Tue, 15 Dec 2020 06:41:41 +0100 (CET)
Subject: Re: [PATCH] powerpc: Inline setup_kup()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20201214123011.311024-1-mpe@ellerman.id.au>
 <09e673ec-6d4e-2e8d-b843-018ce94142a4@csgroup.eu>
 <87czzbzvyg.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1ff11fdc-3274-5be3-6968-14084874e212@csgroup.eu>
Date: Tue, 15 Dec 2020 06:41:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87czzbzvyg.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/12/2020 à 02:42, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 14/12/2020 à 13:30, Michael Ellerman a écrit :
>>> setup_kup() is used by both 64-bit and 32-bit code. However on 64-bit
>>> it must not be __init, because it's used for CPU hotplug, whereas on
>>> 32-bit it should be __init because it calls setup_kuap/kuep() which
>>> are __init.
>>>
>>> We worked around that problem in the past by marking it __ref, see
>>> commit 67d53f30e23e ("powerpc/mm: fix section mismatch for
>>> setup_kup()").
>>>
>>> Marking it __ref basically just omits it from section mismatch
>>> checking, which can lead to bugs, and in fact it did, see commit
>>> 44b4c4450f8d ("powerpc/64s: Mark the kuap/kuep functions non __init")
>>>
>>> We can avoid all these problems by just making it static inline.
>>> Because all it does is call other functions, making it inline actually
>>> shrinks the 32-bit vmlinux by ~76 bytes.
>>>
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>    arch/powerpc/include/asm/kup.h | 8 ++++++--
>>>    arch/powerpc/mm/init-common.c  | 6 ------
>>>    2 files changed, 6 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
>>> index 5a9820c54da9..46b12c6dc728 100644
>>> --- a/arch/powerpc/include/asm/kup.h
>>> +++ b/arch/powerpc/include/asm/kup.h
>>> @@ -49,8 +49,6 @@ extern bool disable_kuap;
>>>    
>>>    #include <linux/pgtable.h>
>>>    
>>> -void setup_kup(void);
>>> -
>>>    #ifdef CONFIG_PPC_KUEP
>>>    void setup_kuep(bool disabled);
>>>    #else
>>> @@ -85,6 +83,12 @@ static inline void restore_user_access(unsigned long flags) { }
>>>    #endif /* CONFIG_PPC_BOOK3S_64 */
>>>    #endif /* CONFIG_PPC_KUAP */
>>>    
>>> +static inline void setup_kup(void)
>>
>> Should it be __always_inline ?
> 
> Yes I guess so, will fix. Thanks for reviewing.
> 

While we are talking about __always_inline, do you plan to take the following patch this cycle ?

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/a1d31f84ddb0926813b17fcd5cc7f3fa7b4deac2.1602759123.git.christophe.leroy@csgroup.eu/

Christophe
