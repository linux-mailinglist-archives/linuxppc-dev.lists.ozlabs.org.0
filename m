Return-Path: <linuxppc-dev+bounces-9674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B36ABAE5EF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 10:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRHvW2XGsz2xk5;
	Tue, 24 Jun 2025 18:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750753239;
	cv=none; b=fojYzRxQ7jEn4WzLs8t9FaikrdiybMoashO2w13UtnNxpQH/mT7niu7+PPynmMN8NkPLpmX0qJmyBFLXPVDjp0E6Nwi/qYIFs12XuqVFQKP5T7LNfZuXf5jOFc9LV7i+M4kjhekCNQcU/CKpCRqEy95K8Vz4kJ4ksrpQccOt0kUigqldAxAnjLGhFPfuEatSG43bQyf1ccicFvECz6A/CCaWetfSr47b7Aljxgl65bwu9ggUwveZ/gGcWh8C83blB9EwhbuRZox+bFN6wspWpAgkYxOkuk+3Br1B8GDC0/2rlpSmApKXPMbynoQcdOT31L83s2B8XzL+OwQcX+18xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750753239; c=relaxed/relaxed;
	bh=EO1qbStgarmOW9mGDSDoweBf/E2w4Qp1gXtmbRU0lGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrKK4f0R1dMt4yFs3dIiRCh35rnEc7TY3/JBmHhXODDGQl7AecHJtY/3FmkHzB/I5sN65tHMn9fDW90iUF3XH6GhHNm9Usf6rbHwV/mmo2LATcsKHbL5D0LuwSi6ahEhSZo6G2VdIBcNdot/NBBBVt7ezOOTsh+Brt48xcd3AW4bNM8a5Ye+qbY8ecs/P9zBE0tI244/h928ADGfEXwf3FpBagjEDgnEQt6OKJL90+XiRYZrEaNv1/axLel/ZMJApWM4AuFEH+bJuc5ZiSGyWbK2gB/3vrrDCT0HyTMsbkQGc0zdcZrT7xZ8I+E1u4SYoD8udojWDeJr64aDVljMeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRHvV4rVPz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 18:20:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bRD450pqCz9sHR;
	Tue, 24 Jun 2025 07:27:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQwRk1sPy-Tu; Tue, 24 Jun 2025 07:27:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bRD446pFmz9sFT;
	Tue, 24 Jun 2025 07:27:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DB3938B768;
	Tue, 24 Jun 2025 07:27:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SZzaiK0op1Va; Tue, 24 Jun 2025 07:27:48 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F03358B767;
	Tue, 24 Jun 2025 07:27:47 +0200 (CEST)
Message-ID: <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
Date: Tue, 24 Jun 2025 07:27:47 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
To: David Laight <david.laight.linux@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622172043.3fb0e54c@pumpkin>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250622172043.3fb0e54c@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/06/2025 à 18:20, David Laight a écrit :
> On Sun, 22 Jun 2025 11:52:38 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> Masked user access avoids the address/size verification by access_ok().
>> Allthough its main purpose is to skip the speculation in the
>> verification of user address and size hence avoid the need of spec
>> mitigation, it also has the advantage to reduce the amount of
>> instructions needed so it also benefits to platforms that don't
>> need speculation mitigation, especially when the size of the copy is
>> not know at build time.
> 
> It also removes a conditional branch that is quite likely to be
> statically predicted 'the wrong way'.

But include/asm-generic/access_ok.h defines access_ok() as:

	#define access_ok(addr, size) likely(__access_ok(addr, size))

So GCC uses the 'unlikely' variant of the branch instruction to force 
the correct prediction, doesn't it ?

> 
>> Unlike x86_64 which masks the address to 'all bits set' when the
>> user address is invalid, here the address is set to an address in
>> the gap. It avoids relying on the zero page to catch offseted
>> accesses. On book3s/32 it makes sure the opening remains on user
>> segment. The overcost is a single instruction in the masking.
> 
> That isn't true (any more).
> Linus changed the check to (approx):
> 	if (uaddr > TASK_SIZE)
> 		uaddr = TASK_SIZE;
> (Implemented with a conditional move)

Ah ok, I overlooked that, I didn't know the cmove instruction, seem 
similar to the isel instruction on powerpc e500.

Christophe


