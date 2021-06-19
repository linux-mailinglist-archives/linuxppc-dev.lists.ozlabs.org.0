Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2893AD906
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 11:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6Vz700kRz3c0S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 19:36:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6Vyl4SWFz300C
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 19:35:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G6VyZ7271zBCrT;
 Sat, 19 Jun 2021 11:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMgoAH-W2QMk; Sat, 19 Jun 2021 11:35:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G6VyZ5z1fzBCpZ;
 Sat, 19 Jun 2021 11:35:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8790E8B76C;
 Sat, 19 Jun 2021 11:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JVPRvw2P2n4I; Sat, 19 Jun 2021 11:35:34 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 462238B763;
 Sat, 19 Jun 2021 11:35:33 +0200 (CEST)
Subject: Re: [PATCH for 4.16 v7 02/11] powerpc: membarrier: Skip memory
 barrier in switch_mm()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20180129202020.8515-1-mathieu.desnoyers@efficios.com>
 <20180129202020.8515-3-mathieu.desnoyers@efficios.com>
 <8b200dd5-f37b-b208-82fb-2775df7bcd49@csgroup.eu>
 <2077369633.12794.1624037192994.JavaMail.zimbra@efficios.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4d2026cc-28e1-7781-fc95-e6160bd8db86@csgroup.eu>
Date: Sat, 19 Jun 2021 11:35:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2077369633.12794.1624037192994.JavaMail.zimbra@efficios.com>
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
Cc: maged michael <maged.michael@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave Watson <davejwatson@fb.com>,
 Will Deacon <will.deacon@arm.com>, Andrew Hunter <ahh@google.com>,
 David Sehr <sehr@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arch <linux-arch@vger.kernel.org>,
 x86 <x86@kernel.org>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 Greg Hackmann <ghackmann@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Paul <paulmck@linux.vnet.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, Avi Kivity <avi@scylladb.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-api <linux-api@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/06/2021 à 19:26, Mathieu Desnoyers a écrit :
> ----- On Jun 18, 2021, at 1:13 PM, Christophe Leroy christophe.leroy@csgroup.eu wrote:
> [...]
>>
>> I don't understand all that complexity to just replace a simple
>> 'smp_mb__after_unlock_lock()'.
>>
>> #define smp_mb__after_unlock_lock()	smp_mb()
>> #define smp_mb()	barrier()
>> # define barrier() __asm__ __volatile__("": : :"memory")
>>
>>
>> Am I missing some subtility ?
> 
> On powerpc CONFIG_SMP, smp_mb() is actually defined as:
> 
> #define smp_mb()        __smp_mb()
> #define __smp_mb()      mb()
> #define mb()   __asm__ __volatile__ ("sync" : : : "memory")
> 
> So the original motivation here was to skip a "sync" instruction whenever
> switching between threads which are part of the same process. But based on
> recent discussions, I suspect my implementation may be inaccurately doing
> so though.
> 

I see.

Then, if you think a 'sync' is a concern, shouldn't we try and remove the forest of 'sync' in the 
I/O accessors ?

I can't really understand why we need all those 'sync' and 'isync' and 'twi' around the accesses 
whereas I/O memory is usually mapped as 'Guarded' so memory access ordering is already garantied.

I'm sure we'll save a lot with that.

Christophe
