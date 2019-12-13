Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5411E2FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 12:47:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z86H15h5zDrF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 22:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="m4cjFtGL"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z83h0RsSzDrCW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 22:45:01 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Z83T0PBLz9vBJw;
 Fri, 13 Dec 2019 12:44:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=m4cjFtGL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5SpWWOJ66fyK; Fri, 13 Dec 2019 12:44:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Z83S6KYcz9vBJv;
 Fri, 13 Dec 2019 12:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576237492; bh=GXcNSiIRiKyDXyT92jW4k31tmkd7NQbvaQCCa3tyddM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m4cjFtGL8SkCpYJQPnCwHiliR5AgfcG6foyAqvIzxOuLBFFwNCSce0Ossokt85nR5
 rX93sRfRc/CcwJ1XvylByHJRFSyfDbT3OrDLWC6BlQ4Y4f3YxOrcZnilJc2kndrVEX
 vtb0MwixQoFPgUuBQomOOm+9Hd3sGWGlu8zb5sdc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 240FD8B8B1;
 Fri, 13 Dec 2019 12:44:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sa1BVUFoOkYZ; Fri, 13 Dec 2019 12:44:54 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B2A7C8B8AE;
 Fri, 13 Dec 2019 12:44:53 +0100 (CET)
Subject: Re: [PATCH 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-5-dja@axtens.net>
 <372df444-27e7-12a7-0bdb-048f29983cf4@c-s.fr>
 <878snkdauf.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <464a8b50-0d4c-b1ea-485b-851f7cd7643b@c-s.fr>
Date: Fri, 13 Dec 2019 12:44:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <878snkdauf.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/12/2019 à 06:10, Daniel Axtens a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> Le 07/08/2019 à 01:38, Daniel Axtens a écrit :
>>> KASAN support on powerpc64 is interesting:
>>>
>>>    - We want to be able to support inline instrumentation so as to be
>>>      able to catch global and stack issues.
>>>
>>>    - We run a lot of code at boot in real mode. This includes stuff like
>>>      printk(), so it's not feasible to just disable instrumentation
>>>      around it.
>>
>> Have you definitely given up the idea of doing a standard implementation
>> of KASAN like other 64 bits arches have done ?
>>
>> Isn't it possible to setup an early 1:1 mapping and go in virtual mode
>> earlier ? What is so different between book3s64 and book3e64 ?
>> On book3e64, we've been able to setup KASAN before printing anything
>> (except when using EARLY_DEBUG). Isn't it feasible on book3s64 too ?
> 
> So I got this pretty wrong when trying to explain it. The problem isn't
> that we run the code in boot as I said, it's that a bunch of the KVM
> code runs in real mode.

Ok.

Does it mean we would be able to implement it the standard way when 
CONFIG_KVM is not selected ?

> 
>>>    - disabled reporting when we're checking the stack for exception
>>>      frames. The behaviour isn't wrong, just incompatible with KASAN.
>>
>> Does this applies to / impacts PPC32 at all ?
> 
> It should. I found that when doing stack walks, the code would touch
> memory that KASAN hadn't unpoisioned. I'm a bit surprised you haven't
> seen it arise, tbh.

How do you trigger that ?

I've tried to provoke some faults with LKDTM that provoke BUG dumps, but 
it doesn't trip.
I also performed task state listing via sysrq, and I don't get anything 
wrong either.

> 
>>>    - Dropped old module stuff in favour of KASAN_VMALLOC.
>>
>> You said in the cover that this is done to avoid having to split modules
>> out of VMALLOC area. Would it be an issue to perform that split ?
>> I can understand it is not easy on 32 bits because vmalloc space is
>> rather small, but on 64 bits don't we have enough virtual space to
>> confortably split modules out of vmalloc ? The 64 bits already splits
>> ioremap away from vmalloc whereas 32 bits have them merged too.
> 
> I could have done this. Maybe I should have done this. But now I have
> done vmalloc space support.

So you force the use of KASAN_VMALLOC ? Doesn't it have a performance 
impact ?


Christophe
