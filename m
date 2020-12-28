Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB152E6AFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 22:28:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4Vyr2wCQzDqF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 08:28:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=APaKQfS/; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4Vx32DqGzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 08:26:46 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id DD2AF276346;
 Mon, 28 Dec 2020 16:26:42 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bbvVjxmkCU_s; Mon, 28 Dec 2020 16:26:42 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 680D4276524;
 Mon, 28 Dec 2020 16:26:42 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 680D4276524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1609190802;
 bh=z5SadIcR2lzpMzQSq0MlMGX6w4abtftg0yLn7xs5uL0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=APaKQfS/4RtIWzaWOaHYIx5R3o6+lMdlIwnwMvuRpQPipj9Vp5blrwND39rR+isBS
 si6sR5LIrYQxIyVChB8SzsIXIJhMANi1S1teS4XeCjz7xEY1a/JyedylDqgsP4pQjR
 NVMmTbwC4A7eYN3McEdVHyAjaancpxsGQFXHYaJlOm/t4D0jIkO9hm+CJVECVz12AJ
 F4K2OUbbRpRsgnd2ALM5tqH11Nd6ye1S7LIH8C3PnR4reveNmvnbnvNTLaK1WasdWp
 nT6sVspVjGFMUSzI/+326EQCOivv6yCkn0Tda/qm3O/aASJ47v7WebROPCfSbx+mlR
 dECQokSZCgHOw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6zlFCT90YhfK; Mon, 28 Dec 2020 16:26:42 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 53B23276602;
 Mon, 28 Dec 2020 16:26:42 -0500 (EST)
Date: Mon, 28 Dec 2020 16:26:42 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <1378834482.3699.1609190802236.JavaMail.zimbra@efficios.com>
In-Reply-To: <CALCETrXx3Xe+4Y6WM-mp0cTUU=r3bW6PV2b25yA8bm1Gvak6wQ@mail.gmail.com>
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <20201228102537.GG1551@shell.armlinux.org.uk>
 <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
 <CAG48ez0YZ_iy6qZpdGUj38wqeg_NzLHHhU-mBCBf5hcopYGVPg@mail.gmail.com>
 <20201228190852.GI1551@shell.armlinux.org.uk>
 <CALCETrVpvrBufrJgXNY=ogtZQLo7zgxQmD7k9eVCFjcdcvarmA@mail.gmail.com>
 <1086654515.3607.1609187556216.JavaMail.zimbra@efficios.com>
 <CALCETrXx3Xe+4Y6WM-mp0cTUU=r3bW6PV2b25yA8bm1Gvak6wQ@mail.gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3991 (ZimbraWebClient - FF84 (Linux)/8.8.15_GA_3980)
Thread-Topic: membarrier: Rewrite sync_core_before_usermode()
Thread-Index: tIlQLlu+op3Kl5YqWG9aEqEFkV0nuQ==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 paulmck <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>, "Russell King,
 ARM Linux" <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 stable <stable@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Dec 28, 2020, at 4:06 PM, Andy Lutomirski luto@kernel.org wrote:

> On Mon, Dec 28, 2020 at 12:32 PM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
>> ----- On Dec 28, 2020, at 2:44 PM, Andy Lutomirski luto@kernel.org wrote:
>>
>> > On Mon, Dec 28, 2020 at 11:09 AM Russell King - ARM Linux admin
>> > <linux@armlinux.org.uk> wrote:
>> >>
>> >> On Mon, Dec 28, 2020 at 07:29:34PM +0100, Jann Horn wrote:
>> >> > After chatting with rmk about this (but without claiming that any of
>> >> > this is his opinion), based on the manpage, I think membarrier()
>> >> > currently doesn't really claim to be synchronizing caches? It just
>> >> > serializes cores. So arguably if userspace wants to use membarrier()
>> >> > to synchronize code changes, userspace should first do the code
>> >> > change, then flush icache as appropriate for the architecture, and
>> >> > then do the membarrier() to ensure that the old code is unused?
>>
>> ^ exactly, yes.
>>
>> >> >
>> >> > For 32-bit arm, rmk pointed out that that would be the cacheflush()
>> >> > syscall. That might cause you to end up with two IPIs instead of one
>> >> > in total, but we probably don't care _that_ much about extra IPIs on
>> >> > 32-bit arm?
>>
>> This was the original thinking, yes. The cacheflush IPI will flush specific
>> regions of code, and the membarrier IPI issues context synchronizing
>> instructions.
>>
>> Architectures with coherent i/d caches don't need the cacheflush step.
> 
> There are different levels of coherency -- VIVT architectures may have
> differing requirements compared to PIPT, etc.
> 
> In any case, I feel like the approach taken by the documentation is
> fundamentally confusing.  Architectures don't all speak the same
> language

Agreed.

> How about something like:

I dislike the wording "barrier" and the association between "write" and
"instruction fetch" done in the descriptions below. It leads to think that
this behaves like a memory barrier, when in fact my understanding of
a context synchronizing instruction is that it simply flushes internal
CPU state, which would cause coherency issues if the CPU observes both the
old and then the new code without having this state flushed.

[ Sorry if I take more time to reply and if my replies are a bit more
  concise than usual. I'm currently on parental leave, so I have
  non-maskable interrupts to attend to. ;-) ]

Thanks,

Mathieu

> 
> The SYNC_CORE operation causes all threads in the caller's address
> space (including the caller) to execute an architecture-defined
> barrier operation.  membarrier() will ensure that this barrier is
> executed at a time such that all data writes done by the calling
> thread before membarrier() are made visible by the barrier.
> Additional architecture-dependent cache management operations may be
> required to use this for JIT code.
> 
> x86: SYNC_CORE executes a barrier that will cause subsequent
> instruction fetches to observe prior writes.  Currently this will be a
> "serializing" instruction, but, if future improved CPU documentation
> becomes available and relaxes this requirement, the barrier may
> change.  The kernel guarantees that writing new or modified
> instructions to normal memory (and issuing SFENCE if the writes were
> non-temporal) then doing a membarrier SYNC_CORE operation is
> sufficient to cause all threads in the caller's address space to
> execute the new or modified instructions.  This is true regardless of
> whether or not those instructions are written at the same virtual
> address from which they are subsequently executed.  No additional
> cache management is required on x86.
> 
> arm: Something about the cache management syscalls.
> 
> arm64: Ditto
> 
> powerpc: I have no idea.

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
