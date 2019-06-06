Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7C36B6C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 07:17:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KDRj025CzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 15:17:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cDxoJ54b"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KDQL58w2zDqbF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 15:15:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45KDQB3Qhfz9tyby;
 Thu,  6 Jun 2019 07:15:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cDxoJ54b; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oyWmvV2Y5Yuw; Thu,  6 Jun 2019 07:15:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45KDQB2Dcnz9tybx;
 Thu,  6 Jun 2019 07:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559798146; bh=QL+fUN3JouwfP38XkDLmp9BNWkwHwsZQLPqYEMCRxKM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cDxoJ54bAUYylJpBNy9N1fVFIFZK18LSVVi2nN7ZqjCAl3xLD4J3BG6B+lQ3oH87u
 ZM5O1YbLzmPGhPayHQGSexi4NtHGVi8JFm/+QucXGJJ+YJCOiAhEtO5U4L0e90eR2S
 lF5gWJRkgeQF9g0/rHO6BDPVb87jkJnqKIO5gjig=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25F3F8B81B;
 Thu,  6 Jun 2019 07:15:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WkY6dPBX2AZF; Thu,  6 Jun 2019 07:15:47 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B54768B75B;
 Thu,  6 Jun 2019 07:15:46 +0200 (CEST)
Subject: Re: PowerPC arch_ptrace() writes beyond thread_struct/task_struct
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <CAD5jUk-meCjEoqJqwriEZxfXQqWvObZUPq0MP=pSQmAbAbXMkw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <84012c6a-befa-5091-ee13-4da5d5eb7d75@c-s.fr>
Date: Thu, 6 Jun 2019 07:15:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAD5jUk-meCjEoqJqwriEZxfXQqWvObZUPq0MP=pSQmAbAbXMkw@mail.gmail.com>
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
Cc: Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/06/2019 à 23:45, Radu Rendec a écrit :
> Hi Everyone,
> 
> I'm seeing some weird memory corruption that I have been able to isolate
> to arch_ptrace() [arch/powerpc/kernel/ptrace.c] and PTRACE_POKEUSR. I am
> on PowerPC 32 (MPC8378), kernel 4.9.179.
> 
> It's not very easy for me to test on the latest kernel, but I guess
> little has changed since 4.9 in either the architecture specific ptrace
> code or PowerPC register data structures.
> 
> What happens is that gdb calls ptrace(PTRACE_POKEUSER) with addr=0x158.
> This goes down to arch_ptrace() [arch/powerpc/kernel/ptrace.c], inside
> `case PTRACE_POKEUSR`, on the branch that does this:
> 
>      memcpy(&child->thread.TS_FPR(fpidx), &data,
>              sizeof(long));
> 
> where:
>      index = addr >> 2 = 0x56 = 86
>      fpidx = index - PT_FPR0 = 86 - 48 = 38

In struct thread_fp_state, fpr field is u64, so I guess we should have 
the following on PPC32:

fpidx = (index - PT_FPR0) >> 1;

Christophe

>      &child->thread.TS_FPR(fpidx) = (void *)child + 1296
> 
>      offsetof(struct task_struct, thread) = 960
>      sizeof(struct thread_struct) = 336
>      sizeof(struct task_struct) = 1296
> 
> In other words, the memcpy() call writes just beyond thread_struct
> (which is also beyond task_struct, for that matter).
> 
> This should never get past the bounds checks for `index`, so perhaps
> there is a mismatch between ptrace macros and the actual register data
> structures layout.
> 
> I will continue to investigate, but I'm not familiar with the PowerPC
> registers so it will take a while before I make sense of all the data
> structures and macros. Hopefully this rings a bell to someone who is
> already familiar with those and could figure out quickly what the
> problem is.
> 
> Best regards,
> Radu Rendec
> 
