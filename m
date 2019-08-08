Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7985D3C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 10:48:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46428V2yd2zDqMT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 18:48:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="UH12Bwxv"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46426Z2ZYGzDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 18:46:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46426M58z8z9txqh;
 Thu,  8 Aug 2019 10:46:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UH12Bwxv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b77WLz6w-gsB; Thu,  8 Aug 2019 10:46:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46426M40Sdz9txqg;
 Thu,  8 Aug 2019 10:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565253995; bh=/j0L6U1ootYvUCLGn7BUQxjfLDtBKup0NqPdL/Ob6TY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UH12BwxvtavgiK4lPjeIoeLpZXpGNwS7KX7nZNNKTRvSBJwrEn3njbY85QnXA/AYy
 oFWdMTw98AgQuhjQbPgnGe7gLz7IzdJ1b3zytb1+LRma+usSGfgXOEd1GwGxFUpQ85
 Cy5lnvwQzv64T50DwJ6443s0c3fwJSWcIXCZPH48=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A81CA8B848;
 Thu,  8 Aug 2019 10:46:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PPwwiEIOCXua; Thu,  8 Aug 2019 10:46:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E466D8B7A0;
 Thu,  8 Aug 2019 10:46:35 +0200 (CEST)
Subject: Re: SMP lockup at boot on Freescale/NXP T2080 (powerpc 64)
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>
References: <1564970785.27215.29.camel@alliedtelesis.co.nz>
 <4525a16cd3e65f89741b50daf2ec259b6baaab78.camel@alliedtelesis.co.nz>
 <87wofqv8a0.fsf@concordia.ellerman.id.au>
 <1565135404.16914.5.camel@alliedtelesis.co.nz>
 <87o911vktx.fsf@concordia.ellerman.id.au>
 <1565141097.19352.12.camel@alliedtelesis.co.nz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b0ad453c-3a2b-6dd5-7bfc-5e275aa7bf62@c-s.fr>
Date: Thu, 8 Aug 2019 10:46:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565141097.19352.12.camel@alliedtelesis.co.nz>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Grant McEwan <grant.mcewan@alliedtelesis.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2019 à 03:24, Chris Packham a écrit :
> On Wed, 2019-08-07 at 11:13 +1000, Michael Ellerman wrote:
>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
>>>
>>> On Tue, 2019-08-06 at 21:32 +1000, Michael Ellerman wrote:
>>> The difference between a working and non working defconfig is
>>> CONFIG_PREEMPT specifically CONFIG_PREEMPT=y makes my system hang
>>> at
>>> boot.
>>>
>>> Is that now intentionally prohibited on 64-bit powerpc?
>> It's not prohibitied, but it probably should be because no one really
>> tests it properly. I have a handful of IBM machines where I boot a
>> PREEMPT kernel but that's about it.
>>
>> The corenet configs don't have PREEMPT enabled, which suggests it was
>> never really supported on those machines.
>>
>> But maybe someone from NXP can tell me otherwise.
>>
> 
> I think our workloads need CONFIG_PREEMPT=y because our systems have
> switch ASIC drivers implemented in userland and we need to be able to
> react quickly to network events in order to prevent loops. We have seen
> instances of this not happening simply because some other process is in
> the middle of a syscall.
> 
> One thing I am working on here is a setup with a few vendor boards and
> some of our own kit that we can test the upstream kernels on. Hopefully
> that'd make these kinds of reports more timely rather than just
> whenever we decide to move to a new kernel version.
> 
> 


The defconfig also sets CONFIG_DEBUG_PREEMPT. Have you tried without 
CONFIG_DEBUG_PREEMPT ?

Christophe
