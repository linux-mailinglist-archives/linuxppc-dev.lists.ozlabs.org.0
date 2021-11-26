Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43F45EBD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0rpl6LSqz3cQJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 21:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0rpL4Pz1z2y7W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 21:39:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0rpG6WqTz9sSM;
 Fri, 26 Nov 2021 11:39:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eLy64U4mjAW; Fri, 26 Nov 2021 11:39:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0rpG5nGXz9sSK;
 Fri, 26 Nov 2021 11:39:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B81CB8B77D;
 Fri, 26 Nov 2021 11:39:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a8QbGGboKAzC; Fri, 26 Nov 2021 11:39:18 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FD8A8B763;
 Fri, 26 Nov 2021 11:39:18 +0100 (CET)
Message-ID: <cad41998-9f03-017a-3243-0efad14ea71a@csgroup.eu>
Date: Fri, 26 Nov 2021 11:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] powerpc/code-patching: work around code patching
 verification in patching tests
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211126032249.1652080-1-npiggin@gmail.com>
 <f9e53405-b5b9-15d1-eaf9-0616a5b87424@csgroup.eu>
 <1637922388.sidg5s6in4.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1637922388.sidg5s6in4.astroid@bobo.none>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 11:27, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of November 26, 2021 4:34 pm:
>>
>>
>> Le 26/11/2021 à 04:22, Nicholas Piggin a écrit :
>>> Code patching tests patch the stack and (non-module) vmalloc space now,
>>> which falls afoul of the new address check.
>>>
>>> The stack patching can easily be fixed, but the vmalloc patching is more
>>> difficult. For now, add an ugly workaround to skip the check while the
>>> test code is running.
>>
>> This really looks hacky.
>>
>> To skip the test, you can call do_patch_instruction() instead of calling
>> patch_instruction().
> 
> And make a do_patch_branch function. I thought about it, and thought
> this is sligtly easier.
> 

Anyway, as reported by Sachin the ftrace code also trips in the new 
verification. So I have submitted a patch to revert to the previous 
level of verification.

Then we can fix all this properly without going through a temporary hack 
and activate the verification again once every caller is fixed.

I was not able to reproduce Sachin's problem on PPC32. Could it be 
specific to PPC64 ?

Christophe
