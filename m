Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC463372D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 13:38:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx7ll63D7z3dC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 23:38:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx7lQ55nkz3cKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 23:38:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dx7lF5W0Kz9typg;
 Thu, 11 Mar 2021 13:38:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zg2vF4EyxMrh; Thu, 11 Mar 2021 13:38:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dx7lF478Pz9typf;
 Thu, 11 Mar 2021 13:38:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E028F8B80A;
 Thu, 11 Mar 2021 13:38:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TXSY3mhLfLtq; Thu, 11 Mar 2021 13:38:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FCCF8B80D;
 Thu, 11 Mar 2021 13:38:02 +0100 (CET)
Subject: Re: [PATCH v2 36/43] powerpc/32: Set current->thread.regs in C
 interrupt entry
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <8d523f9ecee1de0515cc31d43030c12ab171a670.1615291474.git.christophe.leroy@csgroup.eu>
 <1615339900.vmbtzuirqw.astroid@bobo.none>
 <035298ad-4d0b-5e74-6f5c-e03677580924@csgroup.eu>
Message-ID: <5a80e05e-27d7-0e95-67c7-0fe3255c4be1@csgroup.eu>
Date: Thu, 11 Mar 2021 13:38:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <035298ad-4d0b-5e74-6f5c-e03677580924@csgroup.eu>
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



Le 11/03/2021 à 11:38, Christophe Leroy a écrit :
> 
> 
> Le 10/03/2021 à 02:33, Nicholas Piggin a écrit :
>> Excerpts from Christophe Leroy's message of March 9, 2021 10:10 pm:
>>> No need to do that is assembly, do it in C.
>>
>> Hmm. No issues with the patch as such, but why does ppc32 need this but
>> not 64? AFAIKS 64 sets this when a thread is created.
> 
> Looks like ppc64 was doing the same in function save_remaining_regs() in arch/ppc64/kernel/head.S 
> until commit https://github.com/mpe/linux-fullhistory/commit/e5bb080d
> 
> But I can't find what happend to it in that commit.
> 
> Where is it done now ? Maybe that's also already done for ppc32.
> 

I digged a bit more and found a later bug fix which adds that setting of current->thread.regs at 
task creation: https://github.com/mpe/linux-fullhistory/commit/3eac1897

That was in the ppc64 tree only at that time, and was merged into the common powerpc tree via commit 
https://github.com/mpe/linux-fullhistory/commit/06d67d54

So we have it for both ppc32 and ppc64 and ppc32 doesn't need to do it at exception entry anymore. 
I'll remove it.

Thanks
Christophe
