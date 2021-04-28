Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6906736D204
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 08:08:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVSqx2QNLz30Fb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 16:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVSqc3fcNz2xyC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 16:08:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FVSqQ5srxz9tFg;
 Wed, 28 Apr 2021 08:08:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhY9mgrBk-PK; Wed, 28 Apr 2021 08:08:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FVSqQ4w9Lz9tFZ;
 Wed, 28 Apr 2021 08:08:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C25D8B799;
 Wed, 28 Apr 2021 08:08:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4OQ0zrISaDns; Wed, 28 Apr 2021 08:08:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 09DF78B76B;
 Wed, 28 Apr 2021 08:08:17 +0200 (CEST)
Subject: Re: PPC476 hangs during tlb flush after calling /init in crash kernel
 with linux 5.4+
To: Eddie James <eajames@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
 <a24e9e0d-1d4f-506b-9303-4b995815d3c4@csgroup.eu>
 <2f7587b1986d597a63169567124438325cbedfd7.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <711a9a60-264b-9b86-6772-6585622a5bd4@csgroup.eu>
Date: Wed, 28 Apr 2021 08:08:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2f7587b1986d597a63169567124438325cbedfd7.camel@linux.ibm.com>
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
Cc: miltonm@us.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/04/2021 à 00:42, Eddie James a écrit :
> On Tue, 2021-04-27 at 19:26 +0200, Christophe Leroy wrote:
>> Hi Eddies,
>>
>> Le 27/04/2021 à 19:03, Eddie James a écrit :
>>> Hi all,
>>>
>>> I'm having a problem in simulation and hardware where my PPC476
>>> processor stops executing instructions after callling /init. In my
>>> case
>>> this is a bash script. The code descends to flush the TLB, and
>>> somewhere in the loop in _tlbil_pid, the PC goes to
>>> InstructionTLBError47x but does not go any further. This only
>>> occurs in
>>> the crash kernel environment, which is using the same kernel,
>>> initramfs, and init script as the main kernel, which executed fine.
>>> I
>>> do not see this problem with linux 4.19 or 3.10. I do see it with
>>> 5.4
>>> and 5.10. I see a fair amount of refactoring in the PPC memory
>>> management area between 4.19 and 5.4. Can anyone point me in a
>>> direction to debug this further? My stack trace is below as I can
>>> run
>>> gdb in simulation.
>>
>> Can you bisect to pin point the culprit commit ?
> 
> Hi, thanks for your prompt reply.
> 
> Good idea! I have bisected to:
> 
> commit 9e849f231c3c72d4c3c1b07c9cd19ae789da0420 (b8-bad,
> refs/bisect/bad)
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Thu Feb 21 19:08:40 2019 +0000
> 
>      powerpc/mm/32s: use generic mmu_mapin_ram() for all blocks.
>      
>      Now that mmu_mapin_ram() is able to handle other blocks
>      than the one starting at 0, the WII can use it for all
>      its blocks.
>      
>      Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> I also confirmed that reverting this commit resolves the issue in 5.4+.
> 
> Now, I don't understand why this is problematic or what is really
> happening... Reverting is probably not the desired solution.
> 

Can you provide the 'dmesg' or a dump of the logs printed by the kernel at boottime ?

The difference with this commit is that if there are several memblocks, all get mapped. Maybe your 
target doesn't like it.

You are talking about simulation, are you using QEMU ? If yes can you provide details so that I can 
try and reproduce the issue ?

Thanks
Christophe
