Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22330B7B7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 07:17:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVF2l6cdJzDrCM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 17:17:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVF104c9kzDqrr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 17:15:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DVF0s1sVlz9v0wq;
 Tue,  2 Feb 2021 07:15:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mYst6peVqSxD; Tue,  2 Feb 2021 07:15:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DVF0s0sgCz9v0wp;
 Tue,  2 Feb 2021 07:15:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3A5A8B7AC;
 Tue,  2 Feb 2021 07:15:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OgbS6D32jxqj; Tue,  2 Feb 2021 07:15:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F5A58B75B;
 Tue,  2 Feb 2021 07:15:25 +0100 (CET)
Subject: Re: [PATCH v4 11/23] powerpc/syscall: Rename syscall_64.c into
 syscall.c
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 David Laight <David.Laight@ACULAB.COM>, Michael Ellerman
 <mpe@ellerman.id.au>, "msuchanek@suse.de" <msuchanek@suse.de>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <ff9dd4accdc897013594768833d54444e4823bf9.1611585031.git.christophe.leroy@csgroup.eu>
 <1611656343.yaxha7r2q4.astroid@bobo.none>
 <d9993f034db848d1afeffa322373b811@AcuMS.aculab.com>
 <1611791083.sqnnh21vv0.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0cf90825-da89-6464-98d4-dc7490bff557@csgroup.eu>
Date: Tue, 2 Feb 2021 07:15:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611791083.sqnnh21vv0.astroid@bobo.none>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/01/2021 à 00:50, Nicholas Piggin a écrit :
> Excerpts from David Laight's message of January 26, 2021 8:28 pm:
>> From: Nicholas Piggin
>>> Sent: 26 January 2021 10:21
>>>
>>> Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
>>>> syscall_64.c will be reused almost as is for PPC32.
>>>>
>>>> Rename it syscall.c
>>>
>>> Could you rename it to interrupt.c instead? A system call is an
>>> interrupt, and the file now also has code to return from other
>>> interrupts as well, and it matches the new asm/interrupt.h from
>>> the interrupts series.
>>
>> Hmmm....
>>
>> That might make it harder for someone looking for the system call
>> entry code to find it.
> 
> It's very grep'able.
> 
>> In some sense interrupts are the simpler case.
>>
>> Especially when comparing with other architectures which have
>> special instructions for syscall entry.
> 
> powerpc does have a special instruction for syscall, and it causes a
> system call interrupt.
> 
> I'm not sure about other architectures, but for powerpc its more
> sensible to call it interrupt.c than syscall.c.

Many other architectures have a syscall.c but for a different purpose: it contains arch specific 
system calls. We have that in powerpc as well, it is called syscalls.c

So to avoid confusion, I'll rename it. But I think "interrupt" is maybe not the right name. An 
interrupt most of the time refers to IRQ. For me system call is not an interrupt in the way it 
doesn't unexpectedly interrupt a program flow. In powerpc manuals it is generally called exceptions, 
no I'm more inclined to call it exception.c

Christophe
