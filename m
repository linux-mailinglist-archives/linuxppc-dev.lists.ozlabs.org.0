Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3687AE5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 15:13:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464lzt4QHyzDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 23:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tBEcK4rU"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464lxT4745zDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 23:11:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 464lxK5bX8z9tx79;
 Fri,  9 Aug 2019 15:11:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tBEcK4rU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id W_5uaS5qZUZH; Fri,  9 Aug 2019 15:11:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 464lxK4Scvz9tx70;
 Fri,  9 Aug 2019 15:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565356277; bh=2sJg6VJRhDkRB3ZjxBuPHfmdBZMP6IT8rneXsxRG5/g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tBEcK4rUKzllrmRoOUZow4dFrmZCtHAMsPZyNQ5vovuJDQAcg5y9kCa1GMi38HwnQ
 TMeOkDSNy81y+6OaNv4u/IT0otPrN+LsYjVEfPI0W5dBg8ThCPnhvW+6BbldFNrIDx
 fXR49wff2kXrek/dkl5zMoY6Ziu5cgrxdAO+1yKU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D3FC8B8B3;
 Fri,  9 Aug 2019 15:11:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bMzYOwUeXpGE; Fri,  9 Aug 2019 15:11:19 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD9F18B8AD;
 Fri,  9 Aug 2019 15:11:18 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/mm: Warn if W+X pages found on boot
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20190424063958.24559-1-ruscur@russell.cc>
 <20190424063958.24559-2-ruscur@russell.cc>
 <8e659a8f-af3f-e889-3f7a-560178c1f7b1@c-s.fr>
 <ca5e1db5fca5c12ca69d7810d575a437ae39ec87.camel@russell.cc>
 <673532fb-cd09-748f-e936-14c0cab854b1@c-s.fr>
 <6f3c93698669da36cb6bb354394a1f63c93a58cc.camel@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0bff3a15-254f-c04f-d5ac-2e1355064b7c@c-s.fr>
Date: Fri, 9 Aug 2019 15:11:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6f3c93698669da36cb6bb354394a1f63c93a58cc.camel@russell.cc>
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/05/2019 à 07:51, Russell Currey a écrit :
>>>>> +	if (radix_enabled())
>>>>> +		st.start_address = PAGE_OFFSET;
>>>>> +	else
>>>> +		st.start_address = KERN_VIRT_START;
>>>>
>>>> KERN_VIRT_START doesn't exist on PPC32.
>>>>
>>>> Christophe
>>>>
>>> Thanks a lot for the review!  Applied all your suggestions.  What
>>> should I use on PPC32 instead?
>>
>> Indeed it looks like KERN_VIRT_START is defined as 0 for PPC32 at
>> the
>> top of ptdump.c, which look strange to me.
>>
>> I guess PAGE_OFFSET should be the good value for KERN_VIRT_START on
>> PPC32.
>>
>> Christophe
> 
> git blame says you put it there :) I'll set it to PAGE_OFFSET instead
> of zero.  Cheers
> 

Finally it seems that I was right at first place. KERN_VIRT_START should 
be 0 because in walk_pagetables(), it starts with:

pgd_t *pgd = pgd_offset_k(0UL);

Now that KERN_VIRT_START has changed to 0xc0000000, I get a shift of 
0xc0000000 in the display, ie the kernel pages are displayed starting at 
0x80000000 instead of 0xc0000000 (0x80000000 = 0xc0000000 + 0xc0000000)

Since we only want to display kernel pages, I guess we should use

pgd_t *pgd = pgd_offset_k(KERN_VIRT_START); but then we can't use the 
for () loop as it is.

Does it work properly on PPC64 ? If so, that's surprising.

Christophe
