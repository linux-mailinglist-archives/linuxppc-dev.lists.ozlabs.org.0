Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718F3AD102
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 19:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G65Bj5gFXz3c71
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 03:14:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G65BM2GC8z3bvQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 03:14:15 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G65BC2JzFzBF8j;
 Fri, 18 Jun 2021 19:14:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFQ9Fjr9vo63; Fri, 18 Jun 2021 19:14:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G65BC1F6JzBF8S;
 Fri, 18 Jun 2021 19:14:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E461E8B84F;
 Fri, 18 Jun 2021 19:14:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2wpqGmPr9Fdb; Fri, 18 Jun 2021 19:14:10 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CB7F8B84E;
 Fri, 18 Jun 2021 19:14:09 +0200 (CEST)
Subject: Re: [PATCH for 4.16 v7 02/11] powerpc: membarrier: Skip memory
 barrier in switch_mm()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20180129202020.8515-1-mathieu.desnoyers@efficios.com>
 <20180129202020.8515-3-mathieu.desnoyers@efficios.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8b200dd5-f37b-b208-82fb-2775df7bcd49@csgroup.eu>
Date: Fri, 18 Jun 2021 19:13:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20180129202020.8515-3-mathieu.desnoyers@efficios.com>
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
Cc: Maged Michael <maged.michael@gmail.com>, Dave Watson <davejwatson@fb.com>,
 Will Deacon <will.deacon@arm.com>, Andrew Hunter <ahh@google.com>,
 David Sehr <sehr@google.com>, Paul Mackerras <paulus@samba.org>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-arch@vger.kernel.org, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Greg Hackmann <ghackmann@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, Avi Kivity <avi@scylladb.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/01/2018 à 21:20, Mathieu Desnoyers a écrit :
> Allow PowerPC to skip the full memory barrier in switch_mm(), and
> only issue the barrier when scheduling into a task belonging to a
> process that has registered to use expedited private.
> 
> Threads targeting the same VM but which belong to different thread
> groups is a tricky case. It has a few consequences:
> 
> It turns out that we cannot rely on get_nr_threads(p) to count the
> number of threads using a VM. We can use
> (atomic_read(&mm->mm_users) == 1 && get_nr_threads(p) == 1)
> instead to skip the synchronize_sched() for cases where the VM only has
> a single user, and that user only has a single thread.
> 
> It also turns out that we cannot use for_each_thread() to set
> thread flags in all threads using a VM, as it only iterates on the
> thread group.
> 
> Therefore, test the membarrier state variable directly rather than
> relying on thread flags. This means
> membarrier_register_private_expedited() needs to set the
> MEMBARRIER_STATE_PRIVATE_EXPEDITED flag, issue synchronize_sched(), and
> only then set MEMBARRIER_STATE_PRIVATE_EXPEDITED_READY which allows
> private expedited membarrier commands to succeed.
> membarrier_arch_switch_mm() now tests for the
> MEMBARRIER_STATE_PRIVATE_EXPEDITED flag.

Looking at switch_mm_irqs_off(), I found it more complex than expected and found that this patch is 
the reason for that complexity.

Before the patch (ie in kernel 4.14), we have:

00000000 <switch_mm_irqs_off>:
    0:	81 24 01 c8 	lwz     r9,456(r4)
    4:	71 29 00 01 	andi.   r9,r9,1
    8:	40 82 00 1c 	bne     24 <switch_mm_irqs_off+0x24>
    c:	39 24 01 c8 	addi    r9,r4,456
   10:	39 40 00 01 	li      r10,1
   14:	7d 00 48 28 	lwarx   r8,0,r9
   18:	7d 08 53 78 	or      r8,r8,r10
   1c:	7d 00 49 2d 	stwcx.  r8,0,r9
   20:	40 c2 ff f4 	bne-    14 <switch_mm_irqs_off+0x14>
   24:	7c 04 18 40 	cmplw   r4,r3
   28:	81 24 00 24 	lwz     r9,36(r4)
   2c:	91 25 04 4c 	stw     r9,1100(r5)
   30:	4d 82 00 20 	beqlr
   34:	48 00 00 00 	b       34 <switch_mm_irqs_off+0x34>
			34: R_PPC_REL24	switch_mmu_context


After the patch (ie in 5.13-rc6), that now is:

00000000 <switch_mm_irqs_off>:
    0:	81 24 02 18 	lwz     r9,536(r4)
    4:	71 29 00 01 	andi.   r9,r9,1
    8:	41 82 00 24 	beq     2c <switch_mm_irqs_off+0x2c>
    c:	7c 04 18 40 	cmplw   r4,r3
   10:	81 24 00 24 	lwz     r9,36(r4)
   14:	91 25 04 d0 	stw     r9,1232(r5)
   18:	4d 82 00 20 	beqlr
   1c:	81 24 00 28 	lwz     r9,40(r4)
   20:	71 29 00 0a 	andi.   r9,r9,10
   24:	40 82 00 34 	bne     58 <switch_mm_irqs_off+0x58>
   28:	48 00 00 00 	b       28 <switch_mm_irqs_off+0x28>
			28: R_PPC_REL24	switch_mmu_context
   2c:	39 24 02 18 	addi    r9,r4,536
   30:	39 40 00 01 	li      r10,1
   34:	7d 00 48 28 	lwarx   r8,0,r9
   38:	7d 08 53 78 	or      r8,r8,r10
   3c:	7d 00 49 2d 	stwcx.  r8,0,r9
   40:	40 a2 ff f4 	bne     34 <switch_mm_irqs_off+0x34>
   44:	7c 04 18 40 	cmplw   r4,r3
   48:	81 24 00 24 	lwz     r9,36(r4)
   4c:	91 25 04 d0 	stw     r9,1232(r5)
   50:	4d 82 00 20 	beqlr
   54:	48 00 00 00 	b       54 <switch_mm_irqs_off+0x54>
			54: R_PPC_REL24	switch_mmu_context
   58:	2c 03 00 00 	cmpwi   r3,0
   5c:	41 82 ff cc 	beq     28 <switch_mm_irqs_off+0x28>
   60:	48 00 00 00 	b       60 <switch_mm_irqs_off+0x60>
			60: R_PPC_REL24	switch_mmu_context


Especially, the comparison of 'prev' to 0 is pointless as both cases end up with just branching to 
'switch_mmu_context'

I don't understand all that complexity to just replace a simple 'smp_mb__after_unlock_lock()'.

#define smp_mb__after_unlock_lock()	smp_mb()
#define smp_mb()	barrier()
# define barrier() __asm__ __volatile__("": : :"memory")


Am I missing some subtility ?

Thanks
Christophe
