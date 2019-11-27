Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A910B256
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 16:23:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NPg53pKkzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 02:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="RElQVMX9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NPTh3WpPzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 02:15:20 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47NPTZ5Z5sz9v0vn;
 Wed, 27 Nov 2019 16:15:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RElQVMX9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eEa3dEyy4enE; Wed, 27 Nov 2019 16:15:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47NPTZ4Wzmz9v0vj;
 Wed, 27 Nov 2019 16:15:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574867714; bh=xDzqAuKpsMI0fM1Nu2APkhHGF83sjAZj+b2lNk9mmCU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RElQVMX9+cCEQ78l0/J1L3DVbJxFsc0NztZpgSERF3y/OySvGhO+jQzlTNdzWyb64
 f+vTAMnbV/x1zA7L+63FgChsJ6lc31ydvuTMVMObuv0zcJFM8zhorlNmr3lRheuJgs
 VEUpw+GHSuU0PQLV6/W/oj5hu5sjavTHhRdzLf0o=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 253978B868;
 Wed, 27 Nov 2019 16:15:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TiWizM8GxlXJ; Wed, 27 Nov 2019 16:15:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 806FA8B85A;
 Wed, 27 Nov 2019 16:15:15 +0100 (CET)
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <f12fb9a6cc52d83ee9ddf15a36ee12ac77e6379f.1570684298.git.christophe.leroy@c-s.fr>
 <5ca6639b7c1c21ee4b4138b7cfb31d6245c4195c.1570684298.git.christophe.leroy@c-s.fr>
 <877e3tbvsa.fsf@mpe.ellerman.id.au>
 <20191121101552.GR16031@gate.crashing.org>
 <87y2w49rgo.fsf@mpe.ellerman.id.au> <20191125142556.GU9491@gate.crashing.org>
 <5fdb1c92-8bf4-01ca-f81c-214870c33be3@c-s.fr>
 <20191127145958.GG9491@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
Date: Wed, 27 Nov 2019 16:15:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127145958.GG9491@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/11/2019 à 15:59, Segher Boessenkool a écrit :
> On Wed, Nov 27, 2019 at 02:50:30PM +0100, Christophe Leroy wrote:
>> So what do we do ? We just drop the "r2" clobber ?
> 
> You have to make sure your asm code works for all ABIs.  This is quite
> involved if you do a call to an external function.  The compiler does
> *not* see this call, so you will have to make sure that all that the
> compiler and linker do will work, or prevent some of those things (say,
> inlining of the function containing the call).

But the whole purpose of the patch is to inline the call to __do_irq() 
in order to avoid the trampoline function.

> 
>> Otherwise, to be on the safe side we can just save r2 in a local var
>> before the bl and restore it after. I guess it won't collapse CPU time
>> on a performant PPC64.
> 
> That does not fix everything.  The called function requires a specific
> value in r2 on entry.

Euh ... but there is nothing like that when using existing 
call_do_irq(). How does GCC know that call_do_irq() has same TOC as 
__do_irq() ?

> 
> So all this needs verification.  Hopefully you can get away with just
> not clobbering r2 (and not adding a nop after the bl), sure.  But this
> needs to be checked.
> 
> Changing control flow inside inline assembler always is problematic.
> Another problem in this case (on all ABIs) is that the compiler does
> not see you call __do_irq.  Again, you can probably get away with that
> too, but :-)

Anyway it sees I reference it, as it is in input arguments. Isn't it 
enough ?

Christophe
