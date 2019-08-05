Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 202FB81A0C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 14:54:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462Hlb0Z0czDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 22:54:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XtxUPa/N"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462Hj50K3wzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 22:52:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 462Hhp6jK3z9v18q;
 Mon,  5 Aug 2019 14:51:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XtxUPa/N; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h3q1Vo-2yBs2; Mon,  5 Aug 2019 14:51:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 462Hhp5YFPz9v18p;
 Mon,  5 Aug 2019 14:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565009514; bh=2zT/KaFK8wIUi5/VsUUBoI973M2hXgTMBwlrTMoGcnQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XtxUPa/N1gmzl7loSC9Tsbv8Ns398aCNv0I0EQydq78XzArWfOJejVyx1XPT+CjNF
 VNz8c9LPygIKA6/bT8PCt6v7D/lDRaNLvx3CWwwEi/k1dS20ypViE5Tl2G0x+jPt9P
 6EUG8f4xSQjLebXCnVkT53CZ/ngdHsl8CFGaLjYw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 404EE8B7BB;
 Mon,  5 Aug 2019 14:52:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bRxg608HAhm3; Mon,  5 Aug 2019 14:52:00 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26A9E8B7B7;
 Mon,  5 Aug 2019 14:52:00 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <20190610030818.17965-2-npiggin@gmail.com>
 <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
 <1560915874.eudrz3r20a.astroid@bobo.none>
 <19abe0c7-9d58-73f9-d1e9-118e95a7961c@c-s.fr>
 <1561338208.fzkdxt4wa2.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d1b14605-c821-7f88-941d-f188f417b0a6@c-s.fr>
Date: Mon, 5 Aug 2019 14:52:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561338208.fzkdxt4wa2.astroid@bobo.none>
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



Le 24/06/2019 à 05:12, Nicholas Piggin a écrit :
> Christophe Leroy's on June 20, 2019 2:25 am:
>>
>>
>> Le 19/06/2019 à 05:59, Nicholas Piggin a écrit :
>>> Christophe Leroy's on June 11, 2019 4:46 pm:
>>>>
>>>>
>>>> Le 10/06/2019 à 05:08, Nicholas Piggin a écrit :
>>> I would like to remove the early ioremap or make it into its own
>>> function. Re-implement map_kernel_page with ioremap_page_range,
>>> allow page tables that don't use slab to avoid the early check,
>>> unbolt the hptes mapped in early boot, etc.
>>
>> Getting early ioremap out of the picture is a very good idea, it will
>> help making things more common between all platform types. Today we face
>> the fact that PPC32 allocates early io from the top of memory while
>> PPC64 allocates it from the bottom of memory.
>>
>> Any idea on how to proceed ?
> 
> I have to have a bit better look at other arches and our platform
> code. Without having looked closely at all the details, I would hope
> we could use GENERIC_EARLY_IOREMAP without too much pain.
> 

Good idea.

I have looked at it and implemented it for PPC32. In its own it works 
well, now the challenge is to move all early call sites of ioremap() to 
early_ioremap().

I point however is that early_ioremap() expects all maps being released 
by the time we do paging_init(), whereas several of early PPC ioremap() 
users never release the mapped area. I think we have to dig into this in 
more details.

Christophe
