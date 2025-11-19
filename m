Return-Path: <linuxppc-dev+bounces-14344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B9DC6E0E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 11:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBJDD5DZKz3bxM;
	Wed, 19 Nov 2025 21:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763549436;
	cv=none; b=G7TEWgmZ1Mf3OXbENmBEyz6GEVc4alil7sTmoHVBE3vsPD6lg3Qb5lUTWzZstW2AagqfLNJlnX2y7fTwVH//hcu8bhHce315yqJuiyv0B8RG+pnbMCz1qb2EaHjEZ5Y4sTdFe+uPHGUG+xAfHvLhSezst8OqPQCyZNV55vWHYCzJnHbql4AmW3YoTy+lscaxGxjvDJqzLUgHcV2VvcsLXY6E977OHFusMN2IURwB6k9xTunyOrKyraBycYKyZt1pBD3gDMsW5aTL8xJmLHOk5b8LL6Aw2iZNyuN/sCCoAic6zrsJ9+2ojp29b8ccO9t5qvBI6syy8N/+iTr7K85bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763549436; c=relaxed/relaxed;
	bh=78ce7NvoXVP4pXzDTFwgxEycEGX8JMKLb/OtQbtVkSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NtEWtx5WrEleg/e9yce8fMGSIMO7A/BdkGPXikxJIuqnvPsCsx2Ueud9Yy/Nc5sGRMXXwFn4tPsg2e8TMZBubspfJEvL6hiXo+dJfur9616IFzgtEmEnaVnGx2mdTYjVF7FcHqUgV9Np1jzOtJcM8/bJ4O6ShWpBHNTNKTF99ulWFuj5BxRcyTS3fM/xYqeeGwDfiU81Krr+kwhclNDihe+1Txo2rd+5UcokGxMIl9s5fLNz3XVDwplUXLz1gi4bFBq7GuEqnKlCblXnrkbz4AW20G0XufT0LNQQozwSw2be0UGNaQ8T7Qm73Bkf+J+IZ3BoezQCC22zpUy49W2ayw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBJDC58HLz3bsf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:50:34 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4dBJ0p4RtKz9sV0;
	Wed, 19 Nov 2025 11:40:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vK53AaPnp_tc; Wed, 19 Nov 2025 11:40:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4dBJ0p3JYBz9sTy;
	Wed, 19 Nov 2025 11:40:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 604388B76D;
	Wed, 19 Nov 2025 11:40:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id b8kAGR5T4qpO; Wed, 19 Nov 2025 11:40:42 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BFEA8B763;
	Wed, 19 Nov 2025 11:40:42 +0100 (CET)
Message-ID: <4f3e8320-c417-4de9-8026-f9b72ede7601@csgroup.eu>
Date: Wed, 19 Nov 2025 11:40:41 +0100
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
Subject: Re: PPC code-patching calls tlb flush with irqs disabled?
To: Christian Melki <christian.melki@westermo.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <PA3P192MB2865C07D634E3B775D003C7F8CD7A@PA3P192MB2865.EURP192.PROD.OUTLOOK.COM>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <PA3P192MB2865C07D634E3B775D003C7F8CD7A@PA3P192MB2865.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/11/2025 à 08:38, Christian Melki a écrit :
> [Vous ne recevez pas souvent de courriers de christian.melki@westermo.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> A little bit of enabled debugging gave this lockdep irq warning.
> The machine is a e5500 Book-E running in 32-bit (e500mc).
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 0 at kernel/smp.c:807 smp_call_function_many_cond+0x520/0x700
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.45-5.26+ #1
> Hardware name: wmo,Viper-<LEGACYSWCLASS>12A e5500 0x80241021 CoreNet Generic
> NIP:  c016c9c8 LR: c016c510 CTR: c00d2dd4
> REGS: c216ddb0 TRAP: 0700   Not tainted  (6.12.45-5.26+)
> MSR:  00021002 <CE,ME>  CR: 24004888  XER: 20000000
> 
> GPR00: c016cccc c216de90 c20725c0 00000000 c116d440 00000000 00000001 00000000
> GPR08: 1c6bb000 00000003 00000003 76153240 84004888 6ccf16ef 1ff29e0c 0ff51000
> GPR16: 1fe9a6fc 00000004 00000000 00000000 00000000 00000000 00000000 c21a0000
> GPR24: 00000001 c016cccc 00000000 00000000 c0021640 c219b528 00000000 00000001
> NIP [c016c9c8] smp_call_function_many_cond+0x520/0x700
> LR [c016c510] smp_call_function_many_cond+0x68/0x700
> Call Trace:
> [c216de90] [c00dd268] lock_acquire.part.0+0x124/0x338 (unreliable)
> [c216def0] [c016cccc] smp_call_function+0x4c/0xa8
> [c216df10] [c00218e8] flush_tlb_kernel_range+0x28/0x7c
> [c216df20] [c0023170] patch_mem.constprop.0+0x13c/0x1ec
> [c216df50] [c02b71e0] __jump_label_update+0x78/0x130
> [c216df80] [c02b82d4] static_key_slow_inc_cpuslocked+0x9c/0xf0
> [c216dfa0] [c2013494] sched_clock_init+0x1c/0x64
> [c216dfb0] [c200130c] start_kernel+0x40c/0x530
> [c216dff0] [c00003e4] set_ivor+0x13c/0x178
> Code: 7ea9402e 81220000 3929ffff 2c090000 91220000 40c20014 81220080 71290004 41c20008 48d64931 2c150000 40c201cc <0fe00000> 82810030 4bfffc30 60000000
> irq event stamp: 170
> hardirqs last  enabled at (169): [<c0edc424>] _raw_spin_unlock_irqrestore+0x74/0xb0
> hardirqs last disabled at (170): [<c0023204>] patch_mem.constprop.0+0x1d0/0x1ec
> softirqs last  enabled at (10): [<c004a50c>] handle_softirqs+0x400/0x418
> softirqs last disabled at (3): [<c0006654>] do_softirq_own_stack+0x34/0x4c
> ---[ end trace 0000000000000000 ]---
> 
> Seems patch_mem() in code-patching.c is doing interesting things here?
> I don't get why it disables irqs and calls TLB flushing. How does that work with SMP IPIs?
> Maybe this warning is a dud for 32-bit Book-Es nohash MMU?
> 

We don't want an interrupt in the middle of a patching sequence were the 
code would be in a wobbly situation.
We also don't want other parts of kelnel being able to access that 
temporary RW mapping of kernel code until it is unmapped.

How can we achieve this goal if we can't flush TLBs while IRQs are 
disabled ?



