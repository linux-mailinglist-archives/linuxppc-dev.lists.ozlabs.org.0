Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5045318514
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 07:15:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbmZr389yzDwlf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 17:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbmXs5cmjzDwkm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 17:13:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DbmXc2c03z9v00m;
 Thu, 11 Feb 2021 07:13:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XVriXF1VhpHq; Thu, 11 Feb 2021 07:13:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DbmXc1gTkz9v00l;
 Thu, 11 Feb 2021 07:13:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C3958B815;
 Thu, 11 Feb 2021 07:13:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e9Aiw-FGIZwf; Thu, 11 Feb 2021 07:13:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3DA28B771;
 Thu, 11 Feb 2021 07:13:36 +0100 (CET)
Subject: Re: Declaring unrecoverable_exception() as __noreturn ?
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <5ecc1a9a-92eb-7006-6c94-2b7b700d182a@csgroup.eu>
 <1613004125.9jpd8u2w0w.astroid@bobo.none> <87mtwbnrlf.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <251d7de1-bb72-a949-6e64-e342a3becdfd@csgroup.eu>
Date: Thu, 11 Feb 2021 07:13:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87mtwbnrlf.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2021 à 05:41, Michael Ellerman a écrit :
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Christophe Leroy's message of February 11, 2021 2:44 am:
>>> As far as I can see, almost all callers of unrecoverable_exception() expect it to never return.
>>>
>>> Can we mark it __noreturn ?
>>
>> I don't see why not, do_exit is noreturn. We could make die() noreturn
>> as well.
> 
> I'm always nervous about that, because we can return if a debugger is
> involved:
> 
> DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)

Hum ... Is that correct to define it as an interrupt handler ?

Also, I see it declared a second time in interrupt.c, this time not as an interrupt handler. Is that 
wanted ?

> {
> 	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
> 		 regs->trap, regs->nip, regs->msr);
> 	die("Unrecoverable exception", regs, SIGABRT);
> }
> 
> void die(const char *str, struct pt_regs *regs, long err)
> {
> 	unsigned long flags;
> 
> 	/*
> 	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
> 	 */
> 	if (TRAP(regs) != 0x100) {
> 		if (debugger(regs))
> 			return;
> 
> 
> We obviously don't want to optimise for that case, but it worries me
> slightly if we're marking things noreturn when they can actually return.
> 

I don't think I want to declare die() as __noreturn, need to look at it more in details first.

Christophe
