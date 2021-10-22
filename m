Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A84374E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbK851bNQz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbK7h1l4dz305p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 20:39:40 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HbK7X4Dqsz9sSZ;
 Fri, 22 Oct 2021 11:39:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ED0utl9MtJQ0; Fri, 22 Oct 2021 11:39:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HbK7X2xhNz9sSX;
 Fri, 22 Oct 2021 11:39:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D17388B816;
 Fri, 22 Oct 2021 11:39:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rLLb7zBVSMvy; Fri, 22 Oct 2021 11:39:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.57])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24F998B764;
 Fri, 22 Oct 2021 11:39:34 +0200 (CEST)
Subject: Re: [PATCH v3 16/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-17-npiggin@gmail.com>
 <cfd73dd0-a7a2-b8b3-34d8-5a225758b056@csgroup.eu>
 <1634895021.4d2890ma8z.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a5c2c57f-a1b6-e0da-92fe-29c8b432c95b@csgroup.eu>
Date: Fri, 22 Oct 2021 11:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1634895021.4d2890ma8z.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/10/2021 à 11:34, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of October 22, 2021 5:18 pm:
>>
>>
>> Le 22/10/2021 à 00:30, Nicholas Piggin a écrit :

>>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>>> index 7d556b5513e4..57d2d797c4f6 100644
>>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>>> @@ -535,7 +535,7 @@ static int __init pgtable_debugfs_setup(void)
>>>    }
>>>    arch_initcall(pgtable_debugfs_setup);
>>>    
>>> -#ifdef CONFIG_ZONE_DEVICE
>>> +#if defined(CONFIG_ZONE_DEVICE) && defined(ARCH_HAS_MEMREMAP_COMPAT_ALIGN)
>>
>> Patch 12 does
>>
>> 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_BOOK3S_64
> 
> Ah, I meant to change that to PPC_64S_HASH_MMU.

You did it later yes.

What I meant is that as you are in book3s64/pgtable.c, you are sure that 
ARCH_HAS_MEMREMAP_COMPAT_ALIGN is selected so you don't need to check.

> 
>>
>> So this change is not needed
>>
>>>    /*
>>>     * Override the generic version in mm/memremap.c.
>>>     *
>>
>>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>>> index dd8241c009e5..30f764476c30 100644
>>> --- a/arch/powerpc/xmon/xmon.c
>>> +++ b/arch/powerpc/xmon/xmon.c
>>> @@ -1160,9 +1160,11 @@ cmds(struct pt_regs *excp)
>>>    			show_tasks();
>>>    			break;
>>>    #ifdef CONFIG_PPC_BOOK3S
>>> +#if defined(CONFIG_PPC32) || defined(CONFIG_PPC_64S_HASH_MMU)
>>
>> I think you'll get a build failure here.
>>
>> dump_segments() is defined only with CONFIG_PPC_BOOK3S_64 and
>> CONFIG_PPC_BOOK3S_32, see
>>
>> https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/powerpc/xmon/xmon.c#L3745
>>
>> and
>>
>> https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/powerpc/xmon/xmon.c#L3784
> 
> AFAIKS it is okay because it still has ifdef BOOK3S?
> 

Ah, I missed it.

But why keep a double ifdef ? instead of just :

	#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_64S_HASH_MMU)
