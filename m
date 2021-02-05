Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C1031064B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 09:11:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX7R72t0szDvXT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 19:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX7PD3qJzzDvX5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 19:09:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DX7P17228z9tyqn;
 Fri,  5 Feb 2021 09:09:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X-moiIomnrFF; Fri,  5 Feb 2021 09:09:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DX7P16D46z9tyqm;
 Fri,  5 Feb 2021 09:09:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE3D18B81A;
 Fri,  5 Feb 2021 09:09:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gBGbeM981naj; Fri,  5 Feb 2021 09:09:26 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A5CFF8B75F;
 Fri,  5 Feb 2021 09:09:26 +0100 (CET)
Subject: Re: [PATCH v7 28/42] powerpc: convert interrupt handlers to use
 wrappers
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-29-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0e319d85-9fa0-ff97-03b2-93637ad89a99@csgroup.eu>
Date: Fri, 5 Feb 2021 09:09:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130130852.2952424-29-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/01/2021 à 14:08, Nicholas Piggin a écrit :
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index f70d3f6174c8..7ff915aae8ec 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c

> @@ -1462,7 +1474,7 @@ static int emulate_math(struct pt_regs *regs)
>   static inline int emulate_math(struct pt_regs *regs) { return -1; }
>   #endif
>   
> -void program_check_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   	unsigned int reason = get_reason(regs);
> @@ -1587,14 +1599,14 @@ NOKPROBE_SYMBOL(program_check_exception);
>    * This occurs when running in hypervisor mode on POWER6 or later
>    * and an illegal instruction is encountered.
>    */
> -void emulation_assist_interrupt(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
>   {
>   	regs->msr |= REASON_ILLEGAL;
>   	program_check_exception(regs);

Is it correct that an INTERRUPT_HANDLER calls another INTERRUPT_HANDLER ?

>   }
>   NOKPROBE_SYMBOL(emulation_assist_interrupt);
>   
