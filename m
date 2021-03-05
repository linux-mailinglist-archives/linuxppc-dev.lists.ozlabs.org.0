Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA232E3FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 09:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsM4S2gDXz3dHB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 19:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsM470nLYz30Ml
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 19:54:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DsM406713z9twsP;
 Fri,  5 Mar 2021 09:54:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id T8CJAndR9POI; Fri,  5 Mar 2021 09:54:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DsM405JP6z9twsN;
 Fri,  5 Mar 2021 09:54:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B77808B78B;
 Fri,  5 Mar 2021 09:54:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ODY3hqu1EVFa; Fri,  5 Mar 2021 09:54:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D8ED8B818;
 Fri,  5 Mar 2021 09:54:25 +0100 (CET)
Subject: Re: [PATCH v5 05/22] powerpc/irq: Add helper to set regs->softe
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <5f37d1177a751fdbca79df461d283850ca3a34a2.1612796617.git.christophe.leroy@csgroup.eu>
 <1612832745.vhjk6358hf.astroid@bobo.none>
 <5987787e-ee80-ed0e-0c34-9884f6aad3c5@csgroup.eu>
 <1612856863.0x6ebz3hce.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d243672c-ea47-2d0c-bfe4-e6eed5460868@csgroup.eu>
Date: Fri, 5 Mar 2021 09:54:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1612856863.0x6ebz3hce.astroid@bobo.none>
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



Le 09/02/2021 à 08:49, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 4:18 pm:
>>
>>
>> Le 09/02/2021 à 02:11, Nicholas Piggin a écrit :
>>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>>> regs->softe doesn't exist on PPC32.
>>>>
>>>> Add irq_soft_mask_regs_set_state() helper to set regs->softe.
>>>> This helper will void on PPC32.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>
>>> You could do the same with the kuap_ functions to change some ifdefs
>>> to IS_ENABLED.
>>>
>>> That's just my preference but if you prefer this way I guess that's
>>> okay.
>>>
>>
>>
>> That's also my preference on the long term.
>>
>> Here it is ephemeral, I have a follow up series implementing interrupt exit/entry in C and getting
>> rid of all the assembly kuap hence getting rid of those ifdefs.
> 
> I thought it might have been because you hate ifdef more tha most :)
>   
>> The issue I see when using IS_ENABLED() is that you have to indent to the right, then you interfere
>> with the file history and 'git blame'
> 
> Valid point if it's just going to indent back the other way in your next
> series.
> 
>> Thanks for reviewing my series and looking forward to your feedback on my series on the interrupt
>> entry/exit that I will likely release later today.
> 
> Cool, I'm eager to see them.
> 

Hi Nick, have you been able to look at it ?

https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1612864003.git.christophe.leroy@csgroup.eu/

Thanks
Christophe
