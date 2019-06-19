Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A404B9BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:22:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TQbv1x9hzDqL8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:22:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Ga0F0K7E"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQWX34X1zDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:18:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45TQWN67qgzB09ZM;
 Wed, 19 Jun 2019 15:18:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ga0F0K7E; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eJHKCkKy6Csx; Wed, 19 Jun 2019 15:18:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45TQWN4sgfzB09ZJ;
 Wed, 19 Jun 2019 15:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560950320; bh=qiE5blyrEXjR+EvN4cIOjdw+vmQhFfJ4XznqchvkiBE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ga0F0K7E3XoSDkoIpBC50ILQufEvplU5MlC4X6vPhMU1h2lHMVlSrVE5mHAB+nqNC
 u3xzEP6IH5n8KFFmyPV57vrixG7l5hCWIOZ2C/GfThUKzBI/uYSic2p6jPyCT5mGlK
 iHsxCiOKvH3UEOSNrHTp85AHc9HB4RkpVmLZLu9A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0727F8B92B;
 Wed, 19 Jun 2019 15:18:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KNj3EcPtKvgV; Wed, 19 Jun 2019 15:18:42 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A64938B93C;
 Wed, 19 Jun 2019 15:18:42 +0200 (CEST)
Subject: Re: [PATCH 1/4] mm: Move ioremap page table mapping function to mm/
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
 <86991f76-2101-8087-37db-d939d5d744fa@c-s.fr>
 <1560915576.aqf69c3nf8.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7218a243-0d9c-ad90-d409-87663893799e@c-s.fr>
Date: Wed, 19 Jun 2019 15:18:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560915576.aqf69c3nf8.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/06/2019 à 05:43, Nicholas Piggin a écrit :
> Christophe Leroy's on June 11, 2019 3:24 pm:
>>
>>
>> Le 10/06/2019 à 06:38, Nicholas Piggin a écrit :

[snip]

>>> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>>> index 51e131245379..812bea5866d6 100644
>>> --- a/include/linux/vmalloc.h
>>> +++ b/include/linux/vmalloc.h
>>> @@ -147,6 +147,9 @@ extern struct vm_struct *find_vm_area(const void *addr);
>>>    extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
>>>    			struct page **pages);
>>>    #ifdef CONFIG_MMU
>>> +extern int vmap_range(unsigned long addr,
>>> +		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
>>> +		       unsigned int max_page_shift);
>>
>> Drop extern keyword here.
> 
> I don't know if I was going crazy but at one point I was getting
> duplicate symbol errors that were fixed by adding extern somewhere.

probably not on a function name ...

> Maybe sleep depravation. However...
> 
>> As checkpatch tells you, 'CHECK:AVOID_EXTERNS: extern prototypes should
>> be avoided in .h files'
> 
> I prefer to follow existing style in surrounding code at the expense
> of some checkpatch warnings. If somebody later wants to "fix" it
> that's fine.

I don't think that's fine to 'fix' later things that could be done right 
from the begining. 'Cosmetic only' fixes never happen because they are a 
nightmare for backports, and a shame for 'git blame'.

In some patches, you add cleanups to make the code look nicer, and here 
you have the opportunity to make the code nice from the begining and you 
prefer repeating the errors done in the past ? You're surprising me.

Christophe

> 
> Thanks,
> Nick
> 
