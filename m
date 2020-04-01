Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FE719A8C0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:39:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sh4G2BxszDr2q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:39:42 +1100 (AEDT)
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
 header.s=mail header.b=I6/Plgav; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgSS55jPzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:12:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sgSK4qdgz9txmR;
 Wed,  1 Apr 2020 11:12:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=I6/Plgav; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3OuDUj6fhu3g; Wed,  1 Apr 2020 11:12:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sgSK2RwQz9txmQ;
 Wed,  1 Apr 2020 11:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585732321; bh=v/M1qlUNLZHKi5q5xeuGllGSHSgakulgXfO0VNVJ6NY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I6/Plgav0YcsyHzBZIlcsCiKkXb7KabxBRp0Jp3jQFBwOEM+fOfsRAX3nCboA+rpE
 3fpsluZTKTbRqBDY/IOHQzgSugq9xvAG5h3kt13sXWyKYMrkwrDf+e8Qid3gGRdO1U
 R9bUe8NNCmVxOAocY/ypEEnw7AqpnU4R8pRA+r5c=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 748458B778;
 Wed,  1 Apr 2020 11:12:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a3-4XKS6Ledk; Wed,  1 Apr 2020 11:12:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62FD68B752;
 Wed,  1 Apr 2020 11:12:01 +0200 (CEST)
Subject: Re: [PATCH v2 06/16] powerpc/watchpoint: Provide DAWR number to
 __set_breakpoint
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-7-ravi.bangoria@linux.ibm.com>
 <89f43001-0fa4-1394-4158-878fca4962e3@c-s.fr>
 <cb9ccaa1-9ea2-c3d7-4724-f75ebff4b66d@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d62efd40-4aa6-01e5-a669-3590b121c0f8@c-s.fr>
Date: Wed, 1 Apr 2020 11:11:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cb9ccaa1-9ea2-c3d7-4724-f75ebff4b66d@linux.ibm.com>
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



Le 01/04/2020 à 10:57, Ravi Bangoria a écrit :
> 
> 
> On 4/1/20 12:33 PM, Christophe Leroy wrote:
>>
>>
>> Le 01/04/2020 à 08:12, Ravi Bangoria a écrit :
>>> Introduce new parameter 'nr' to __set_breakpoint() which indicates
>>> which DAWR should be programed. Also convert current_brk variable
>>> to an array.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/debug.h         |  2 +-
>>>   arch/powerpc/include/asm/hw_breakpoint.h |  2 +-
>>>   arch/powerpc/kernel/hw_breakpoint.c      |  8 ++++----
>>>   arch/powerpc/kernel/process.c            | 14 +++++++-------
>>>   arch/powerpc/kernel/signal.c             |  2 +-
>>>   arch/powerpc/xmon/xmon.c                 |  2 +-
>>>   6 files changed, 15 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/debug.h 
>>> b/arch/powerpc/include/asm/debug.h
>>> index 7756026b95ca..6228935a8b64 100644
>>> --- a/arch/powerpc/include/asm/debug.h
>>> +++ b/arch/powerpc/include/asm/debug.h
>>> @@ -45,7 +45,7 @@ static inline int debugger_break_match(struct 
>>> pt_regs *regs) { return 0; }
>>>   static inline int debugger_fault_handler(struct pt_regs *regs) { 
>>> return 0; }
>>>   #endif
>>> -void __set_breakpoint(struct arch_hw_breakpoint *brk);
>>> +void __set_breakpoint(struct arch_hw_breakpoint *brk, int nr);
>>
>> Same, I think it would make more sense to have nr as first argument.
> 
> Sorry, didn't get your point. How will that help?
> 

Well, it is a tiny detail but for me it is more natural to first tel 
which element you modify before telling how you modify it.

Christophe
