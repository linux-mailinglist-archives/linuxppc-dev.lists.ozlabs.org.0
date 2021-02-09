Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7131538C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:15:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZp0H2cvwzDsqJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:15:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZnxz2hJhzDsmy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:13:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZnxl0tRtz9v0Jx;
 Tue,  9 Feb 2021 17:13:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VNxI6Xy2d8lS; Tue,  9 Feb 2021 17:13:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZnxk6yd8z9v0JL;
 Tue,  9 Feb 2021 17:13:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ED6B8B764;
 Tue,  9 Feb 2021 17:13:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SpEj3Si2q6SX; Tue,  9 Feb 2021 17:13:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE8778B7EA;
 Tue,  9 Feb 2021 17:13:31 +0100 (CET)
Subject: Re: [PATCH v5 16/22] powerpc/syscall: Avoid stack frame in likely
 part of system_call_exception()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <981edfd50d4c980634b74c4bb76b765c499a87ec.1612796617.git.christophe.leroy@csgroup.eu>
 <1612834634.qle1lc7n6y.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f2b17529-e1b6-3d2c-a38b-51e91841e438@csgroup.eu>
Date: Tue, 9 Feb 2021 17:13:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612834634.qle1lc7n6y.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/02/2021 à 02:55, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>> When r3 is not modified, reload it from regs->orig_r3 to free
>> volatile registers. This avoids a stack frame for the likely part
>> of system_call_exception()
> 
> This doesn't on my 64s build, but it does reduce one non volatile
> register save/restore. With quite a bit more register pressure
> reduction 64s can avoid the stack frame as well.

The stack frame is not due to the registers because on PPC64 you have the redzone that you don't 
have on PPC32.

As far as I can see, this is due to a call to .arch_local_irq_restore().

On ppc32 arch_local_irq_restore() is just a write to MSR.


> 
> It's a cool trick but quite code and compiler specific so I don't know
> how worthwhile it is to keep considering we're calling out into random
> kernel C code after this.
> 
> Maybe just keep it PPC32 specific for the moment, will have to do more
> tuning for 64 and we have other stuff to do there first.
> 
> If you are happy to make it 32-bit only then

I think we can leave without this, that's only one or two cycles won.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
