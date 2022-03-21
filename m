Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 258844E22C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:59:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMT8P0dqkz3bbY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:59:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMT7y6hm5z2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:59:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KMT7t5LbXz9sSP;
 Mon, 21 Mar 2022 09:59:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQyRukt0YNBs; Mon, 21 Mar 2022 09:59:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KMT7t4THWz9sSL;
 Mon, 21 Mar 2022 09:59:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 883768B766;
 Mon, 21 Mar 2022 09:59:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fdlLtslsU7Vk; Mon, 21 Mar 2022 09:59:17 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 612C08B763;
 Mon, 21 Mar 2022 09:59:17 +0100 (CET)
Message-ID: <6916e1a6-f83c-bfa1-fe62-fd5fa02f7b63@csgroup.eu>
Date: Mon, 21 Mar 2022 09:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
 <87pmmgghvu.fsf@mpe.ellerman.id.au>
 <a688b641-a8ef-8e6b-4f94-da5edd1c6943@csgroup.eu>
 <0a8285c7-67d2-5697-5c41-f6699f9b5599@csgroup.eu>
In-Reply-To: <0a8285c7-67d2-5697-5c41-f6699f9b5599@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/03/2022 à 09:30, Christophe Leroy a écrit :
> 
> 
> Le 21/03/2022 à 08:56, Christophe Leroy a écrit :
>>
>>
>> Le 21/03/2022 à 03:27, Michael Ellerman a écrit :
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> Le 18/03/2022 à 13:26, Peter Zijlstra a écrit :
>>>>> On Fri, Mar 18, 2022 at 04:21:40PM +0530, Sathvika Vasireddy wrote:
>>>>>> This patch adds powerpc specific functions required for
>>>>>> 'objtool mcount' to work, and enables mcount for ppc.
>>>>>
>>>>> I would love to see more objtool enablement for Power :-)
>>>>
>>>> I have not received this series and I can't see it on powerpc patchwork
>>>> either (https://patchwork.ozlabs.org/project/linuxppc-dev/list/)
>>>>
>>>> Did you send it to linuxppc-dev list ? If not can you resend it there ?
>>>
>>> It is there, might have been delayed?
>>>
>>> http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=291129
>>>
>>> There are some CI failures.
>>>
>>
>> On PPC32 I get :
>>
>> [    0.000000] ftrace: No functions to be traced?
>>
>> Without this series I get:
>>
>> [    0.000000] ftrace: allocating 22508 entries in 17 pages
>> [    0.000000] ftrace: allocated 17 pages with 2 groups
>>
>>
> 
> 
> ppc64_defconfig on QEMU:
> 
> [    0.000000][    T0] ftrace: No functions to be traced?
> 
> Without your series:
> 
> [    0.000000][    T0] ftrace: allocating 38750 entries in 15 pages
> [    0.000000][    T0] ftrace: allocated 15 pages with 4 groups
> [    0.000000][    T0] trace event string verifier disabled
> 

ppc64le_defconfig on QEMU:

[    0.000000][    T0] ftrace: allocating 37236 entries in 14 pages
[    0.000000][    T0] ftrace: allocated 14 pages with 3 groups

Without your series:

[    0.000000][    T0] ftrace: allocating 37236 entries in 14 pages
[    0.000000][    T0] ftrace: allocated 14 pages with 3 groups

So it seems it works only on Little Endian.
Works neither on PPC32 nor on PPC64 Big Endian

Christophe
