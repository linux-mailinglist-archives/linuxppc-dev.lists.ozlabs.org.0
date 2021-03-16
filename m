Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44B33DDA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 20:35:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0NmP2Skyz3bqr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 06:35:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Nm04Z5Nz2yYw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 06:34:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0Nls3mZdz9v0qk;
 Tue, 16 Mar 2021 20:34:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mD59kMBJKbL1; Tue, 16 Mar 2021 20:34:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0Nls2gYwz9v0qh;
 Tue, 16 Mar 2021 20:34:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 512708B7EF;
 Tue, 16 Mar 2021 20:34:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id flZpLUzJXXny; Tue, 16 Mar 2021 20:34:49 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 167548B7E1;
 Tue, 16 Mar 2021 20:34:49 +0100 (CET)
Subject: Re: [PATCH 10/14] powerpc/64: use interrupt restart table to speed up
 return from interrupt
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-11-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f39dab9b-2f16-4c3d-9d7e-4fd2487c5c7d@csgroup.eu>
Date: Tue, 16 Mar 2021 20:34:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315220402.260594-11-npiggin@gmail.com>
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



Le 15/03/2021 à 23:03, Nicholas Piggin a écrit :
> The restart table facility is used to return from interrupt without
> disabling MSR EE or RI.

What happens when an interrupt happens between the point you restore the user r1 and the rfi which 
returns to user ?
If an interrupt happens there, the interrupt prolog sees it as an interrupt coming from kernel, so 
it uses r1 as is, but r1 points to user stack.

Don't we end up in kernel_bad_stack() ?

Or we take a KUAP fault and end-up in an infinite loop ?

> 
> Interrupt return code is put into the low soft-masked region.
> 
> Critical code that has no exit work, SRRs set, soft-masked state set to
> return state, saves r1 in the PACA and then begins to run instructions
> that have an alternate return handler.
> 
> In this region, pending interrupts are checked, and if any exist then
> it branches directly to the restart handler.
> 
> If it does not branch, then no masked interrupts are pending, and if any
> interrupts do hit, we will go out the restart handler.
> 
> The restart handler re-loads the saved r1, and from there we can find
> regs, and reload critical state before setting things up to replay
> interrupts and go around the exit prepare sequence again.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
