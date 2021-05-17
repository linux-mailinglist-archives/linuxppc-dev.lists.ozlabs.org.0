Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9D382E14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLMh0JXYz308Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLMG5f7Sz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:58:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FkLMB5gl4z9sYQ;
 Mon, 17 May 2021 15:58:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kki3eKxYEEqF; Mon, 17 May 2021 15:58:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FkLMB4h80z9sYK;
 Mon, 17 May 2021 15:58:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D71A8B7A1;
 Mon, 17 May 2021 15:58:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZgcPxZlbLKOZ; Mon, 17 May 2021 15:58:30 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E5D78B79C;
 Mon, 17 May 2021 15:58:30 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/interrupt: Refactor
 interrupt_exit_user_prepare() and syscall_exit_prepare()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cd0634769e5fea397411a0f833db52749852c6f8.1620980916.git.christophe.leroy@csgroup.eu>
 <1621237386.33q9uyrpc3.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96329062-9e00-28a7-749e-b57a34beb56c@csgroup.eu>
Date: Mon, 17 May 2021 15:57:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621237386.33q9uyrpc3.astroid@bobo.none>
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



Le 17/05/2021 à 09:44, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of May 14, 2021 6:28 pm:
>> Last part of interrupt_exit_user_prepare() and syscall_exit_prepare()
>> are identical.
>>
>> Create a __interrupt_exit_user_prepare() function that is called by
>> both.
>>
>> Note that it replaces a local_irq_save(flags) by local_irq_disable().
>> This is similar because the flags are never used. On ppc 8xx it is
>> more efficient because it doesn't require reading MSR.
> 
> Can these cleanups go after my interrupt performance improvements?
> I posted them for last series but were dropped due to crashes without
> time to resubmit. I'm working on them again now.
> 

Euh ... ok why not, but at the time being interrupt_exit_user_prepare() and syscall_exit_prepare() 
are very similar. Which makes sense because both of them are returning from kernel to user so they 
are to do the same preparation.

If you are doing the same changes to both of them, maybe it is worst including this refactor at the 
begining of your series. Or are you making them diverge with that series ?

Christophe
