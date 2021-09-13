Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2937409A7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 19:15:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Y5V67G4z2yn8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 03:15:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Y511JN4z2yHw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 03:14:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H7Y4w5GKJz9sTs;
 Mon, 13 Sep 2021 19:14:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7hGuJ2nnmOP; Mon, 13 Sep 2021 19:14:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H7Y4w4Gd4z9sTr;
 Mon, 13 Sep 2021 19:14:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7402F8B76E;
 Mon, 13 Sep 2021 19:14:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DHIZJjoe87a4; Mon, 13 Sep 2021 19:14:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.172])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DCC9D8B763;
 Mon, 13 Sep 2021 19:14:55 +0200 (CEST)
Subject: Re: [PATCH RESEND v3 6/6] powerpc/signal: Use
 unsafe_copy_siginfo_to_user()
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
 <2b179deba4fd4ec0868cdc48a0230dfa3aa5a22f.1631537060.git.christophe.leroy@csgroup.eu>
 <87h7eopixa.fsf@disp2133>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fe9ffdd1-e37e-ab2b-3157-d6f60bcf23e5@csgroup.eu>
Date: Mon, 13 Sep 2021 19:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87h7eopixa.fsf@disp2133>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/09/2021 à 17:57, Eric W. Biederman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Use unsafe_copy_siginfo_to_user() in order to do the copy
>> within the user access block.
>>
>> On an mpc 8321 (book3s/32) the improvment is about 5% on a process
>> sending a signal to itself.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v3: Don't leave compat aside, use the new unsafe_copy_siginfo_to_user32()
>> ---
>>   arch/powerpc/kernel/signal_32.c | 8 +++-----
>>   arch/powerpc/kernel/signal_64.c | 5 +----
>>   2 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
>> index ff101e2b3bab..3a2db8af2d65 100644
>> --- a/arch/powerpc/kernel/signal_32.c
>> +++ b/arch/powerpc/kernel/signal_32.c
>> @@ -710,9 +710,9 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
>>   }
>>   #endif
>>   
>> -#ifdef CONFIG_PPC64
>> +#ifndef CONFIG_PPC64
>>   
>> -#define copy_siginfo_to_user	copy_siginfo_to_user32
>> +#define unsafe_copy_siginfo_to_user32	unsafe_copy_siginfo_to_user
>>   
>>   #endif /* CONFIG_PPC64 */
> 
> Any particular reason to reverse the sense of this #ifdef?

Yes I had double definition of unsafe_copy_siginfo_to_user(), I could 
have ifdefed out unsafe_copy_siginfo_to_user() in signal.h, but I 
prefered to ifdef out copy_siginfo_to_user32() in compat.h

> 
> Otherwise this change looks much cleaner.

Thanks
Christophe

