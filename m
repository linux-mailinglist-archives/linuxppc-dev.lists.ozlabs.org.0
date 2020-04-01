Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D8519A8D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:45:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48shBz6yNlzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:45:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=XH7zg2Fd; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgf51DjDzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:20:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sgf04npTz9txmT;
 Wed,  1 Apr 2020 11:20:24 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XH7zg2Fd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LrwWMFl3-E7n; Wed,  1 Apr 2020 11:20:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sgf03bt7z9txmS;
 Wed,  1 Apr 2020 11:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585732824; bh=RdCwVqnG+mgvh3hfqg59yovpqSaBby3zvQrIMEdmRpE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XH7zg2FdzF2RS35R/gIrtumJIqP3Hvo83KJDW/dz5mimMYkfSu70Y9/6Z3S7O7zWF
 u3dRyixL/1pDSpdDRPVf7qpFVRl4MtL/BvgBVf2Wbrm7a84WGCc54DXbhndSfyAA63
 k8TrANwQfZKZ+/lVsp6SHURFcLuGb03DN02KwiHw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 986F98B7B9;
 Wed,  1 Apr 2020 11:20:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N0fWgGw9nX-y; Wed,  1 Apr 2020 11:20:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 61D468B752;
 Wed,  1 Apr 2020 11:20:21 +0200 (CEST)
Subject: Re: [PATCH v2 13/16] powerpc/watchpoint: Prepare handler to handle
 more than one watcnhpoint
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-14-ravi.bangoria@linux.ibm.com>
 <6b89991b-481a-8cbd-b5b7-559e5e16cf92@c-s.fr>
 <cb2c250b-c963-45fe-f3b4-879076c495ab@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <78559ff4-c2c3-e652-a906-8f40673b53d6@c-s.fr>
Date: Wed, 1 Apr 2020 11:20:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cb2c250b-c963-45fe-f3b4-879076c495ab@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, mikey@neuling.org, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/04/2020 à 11:13, Ravi Bangoria a écrit :
> 
> 
> On 4/1/20 12:20 PM, Christophe Leroy wrote:
>>
>>
>> Le 01/04/2020 à 08:13, Ravi Bangoria a écrit :
>>> Currently we assume that we have only one watchpoint supported by hw.
>>> Get rid of that assumption and use dynamic loop instead. This should
>>> make supporting more watchpoints very easy.
>>>
>>> With more than one watchpoint, exception handler need to know which
>>> DAWR caused the exception, and hw currently does not provide it. So
>>> we need sw logic for the same. To figure out which DAWR caused the
>>> exception, check all different combinations of user specified range,
>>> dawr address range, actual access range and dawrx constrains. For ex,
>>> if user specified range and actual access range overlaps but dawrx is
>>> configured for readonly watchpoint and the instruction is store, this
>>> DAWR must not have caused exception.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/processor.h |   2 +-
>>>   arch/powerpc/include/asm/sstep.h     |   2 +
>>>   arch/powerpc/kernel/hw_breakpoint.c  | 396 +++++++++++++++++++++------
>>>   arch/powerpc/kernel/process.c        |   3 -
>>>   4 files changed, 313 insertions(+), 90 deletions(-)
>>>
>>
>> [...]
>>
>>> -static bool
>>> -dar_range_overlaps(unsigned long dar, int size, struct 
>>> arch_hw_breakpoint *info)
>>> +static bool dar_user_range_overlaps(unsigned long dar, int size,
>>> +                    struct arch_hw_breakpoint *info)
>>>   {
>>>       return ((dar <= info->address + info->len - 1) &&
>>>           (dar + size - 1 >= info->address));
>>>   }
>>
>> Here and several other places, I think it would be more clear if you 
>> could avoid the - 1 :
>>
>>      return ((dar < info->address + info->len) &&
>>          (dar + size > info->address));
> 
> Ok. see below...
> 
>>
>>
>>> +static bool dar_in_hw_range(unsigned long dar, struct 
>>> arch_hw_breakpoint *info)
>>> +{
>>> +    unsigned long hw_start_addr, hw_end_addr;
>>> +
>>> +    hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
>>> +    hw_end_addr = ALIGN(info->address + info->len, 
>>> HW_BREAKPOINT_SIZE) - 1;
>>> +
>>> +    return ((hw_start_addr <= dar) && (hw_end_addr >= dar));
>>> +}
>>
>>      hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
>>
>>      return ((hw_start_addr <= dar) && (hw_end_addr > dar));
> 
> I'm using -1 while calculating end address is to make it
> inclusive. If I don't use -1, the end address points to a
> location outside of actual range, i.e. it's not really an
> end address.

But that's what is done is several places, for instance:

https://elixir.bootlin.com/linux/v5.6/source/arch/powerpc/mm/dma-noncoherent.c#L22

https://elixir.bootlin.com/linux/v5.6/source/arch/powerpc/include/asm/book3s/32/kup.h#L92

In several places like this, end is outside of the range. My feeling is 
that is helps with readability.

Christophe
