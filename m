Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6233AD3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 09:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTs21Bnvz2yxv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 19:21:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTrj1dv8z2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 19:20:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzTrW13W2z9tyDT;
 Mon, 15 Mar 2021 09:20:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rRQxvVjnW5aL; Mon, 15 Mar 2021 09:20:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzTrT21bKz9tyDR;
 Mon, 15 Mar 2021 09:20:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1426D8B775;
 Mon, 15 Mar 2021 09:20:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7X39ztjzW6og; Mon, 15 Mar 2021 09:20:46 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 076F28B777;
 Mon, 15 Mar 2021 09:20:44 +0100 (CET)
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
 <186d3513-d7ab-a658-cdb2-6fe5146c1fc4@csgroup.eu>
Message-ID: <db33a984-b921-6147-0f80-fda157fae4ee@csgroup.eu>
Date: Mon, 15 Mar 2021 09:20:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <186d3513-d7ab-a658-cdb2-6fe5146c1fc4@csgroup.eu>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 08:50, Christophe Leroy a écrit :
> 
> 
> Le 15/03/2021 à 04:17, Nicholas Piggin a écrit :
>> Update the new C and asm interrupt return code to account for 64e
>> specifics, switch over to use it.
>>
>> The now-unused old ret_from_except code, that was moved to 64e after the
>> 64s conversion, is removed.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>>   arch/powerpc/kernel/entry_64.S            |   9 +-
>>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
>>   arch/powerpc/kernel/interrupt.c           |  27 +-
>>   arch/powerpc/kernel/irq.c                 |  76 -----
>>   5 files changed, 56 insertions(+), 379 deletions(-)
>>
>> @@ -1016,284 +1021,8 @@ alignment_more:
> 
> ...
> 
>> -fast_exception_return:
>> -    wrteei    0
>> -1:    mr    r0,r13
>> -    ld    r10,_MSR(r1)
>> -    REST_4GPRS(2, r1)
>> -    andi.    r6,r10,MSR_PR
>> -    REST_2GPRS(6, r1)
>> -    beq    1f
>> -    ACCOUNT_CPU_USER_EXIT(r13, r10, r11)
> 
> Then ACCOUNT_CPU_USER_EXIT can be removed from asm/ppc_asm.h
> 

And all associated definitions in asm-offsets.c

And also ACCOUNT_USER_TIME which was likely left over after the removal of ACCOUNT_CPU_USER_ENTRY()
