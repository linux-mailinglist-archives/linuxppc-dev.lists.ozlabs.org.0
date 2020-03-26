Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE137193F82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 14:11:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p53k6qXczDr0V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 00:11:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LMyGOtON; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p4fy3YzTzDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:53:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48p4fq29TYz9vBnF;
 Thu, 26 Mar 2020 13:53:39 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LMyGOtON; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 90yt0EtupaJb; Thu, 26 Mar 2020 13:53:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48p4fq0qPRz9vBnC;
 Thu, 26 Mar 2020 13:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585227219; bh=pv5nl1zmDcq3y5iwkiuJhYXlqL7JGHrLvXca9WF8M7U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LMyGOtONLwl4lZL1yJByBQT5ZaVwcGGqx08lFVKYcLFc/Kf+UTGbH5Ee8OxEw2tJa
 rd8ZRoai5oUExchjaSlAltOy2MaOCBekxlIT0odeIug2+9m2lVTlbk3mJs7Qjmw/j5
 thaq7bCNspyOR1zahy2HM9D+5UM5pM5w+NqwHNZU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C2D88B7BC;
 Thu, 26 Mar 2020 13:53:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IbawcdGDWZPr; Thu, 26 Mar 2020 13:53:40 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93C7D8B7BA;
 Thu, 26 Mar 2020 13:53:39 +0100 (CET)
Subject: Re: [PATCH v5 10/13] powerpc/ptrace: split out ADV_DEBUG_REGS related
 functions.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org
References: <cover.1582848567.git.christophe.leroy@c-s.fr>
 <e2bd7d275bd5933d848aad4fee3ca652a14d039b.1582848567.git.christophe.leroy@c-s.fr>
 <87imizdbaz.fsf@mpe.ellerman.id.au>
 <25a7f050-f241-6035-e778-16b1ca9928f3@c-s.fr>
 <87k13axoda.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e2e02786-1b6c-7e91-6768-60563ad21505@c-s.fr>
Date: Thu, 26 Mar 2020 13:53:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87k13axoda.fsf@mpe.ellerman.id.au>
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



Le 24/03/2020 à 07:23, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> On 03/20/2020 02:12 AM, Michael Ellerman wrote:
>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>> Move ADV_DEBUG_REGS functions out of ptrace.c, into
>>>> ptrace-adv.c and ptrace-noadv.c
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>> ---
>>>> v4: Leave hw_breakpoint.h for ptrace.c
>>>> ---
>>>>    arch/powerpc/kernel/ptrace/Makefile       |   4 +
>>>>    arch/powerpc/kernel/ptrace/ptrace-adv.c   | 468 ++++++++++++++++
>>>>    arch/powerpc/kernel/ptrace/ptrace-decl.h  |   5 +
>>>>    arch/powerpc/kernel/ptrace/ptrace-noadv.c | 236 ++++++++
>>>>    arch/powerpc/kernel/ptrace/ptrace.c       | 650 ----------------------
>>>>    5 files changed, 713 insertions(+), 650 deletions(-)
>>>>    create mode 100644 arch/powerpc/kernel/ptrace/ptrace-adv.c
>>>>    create mode 100644 arch/powerpc/kernel/ptrace/ptrace-noadv.c
>>>
>>> This is somehow breaking the ptrace-hwbreak selftest on Power8:
>>>
>>>     test: ptrace-hwbreak
>>>     tags: git_version:v5.6-rc6-892-g7a285a6067d6
>>>     PTRACE_SET_DEBUGREG, WO, len: 1: Ok
>>>     PTRACE_SET_DEBUGREG, WO, len: 2: Ok
>>>     PTRACE_SET_DEBUGREG, WO, len: 4: Ok
>>>     PTRACE_SET_DEBUGREG, WO, len: 8: Ok
>>>     PTRACE_SET_DEBUGREG, RO, len: 1: Ok
>>>     PTRACE_SET_DEBUGREG, RO, len: 2: Ok
>>>     PTRACE_SET_DEBUGREG, RO, len: 4: Ok
>>>     PTRACE_SET_DEBUGREG, RO, len: 8: Ok
>>>     PTRACE_SET_DEBUGREG, RW, len: 1: Ok
>>>     PTRACE_SET_DEBUGREG, RW, len: 2: Ok
>>>     PTRACE_SET_DEBUGREG, RW, len: 4: Ok
>>>     PTRACE_SET_DEBUGREG, RW, len: 8: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO, len: 6: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RO, len: 6: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RW, len: 6: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, WO, len: 6: Ok
>>>     PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, RO, len: 6: Fail
>>>     failure: ptrace-hwbreak
>>>
>>> I haven't had time to work out why yet.
>>>
>>
>> A (big) part of commit c3f68b0478e7 ("powerpc/watchpoint: Fix ptrace
>> code that muck around with address/len") was lost during rebase.
>>
>> I'll send a fix, up to you to squash it in or commit it as is.
> 
> Thanks.
> 

One person asked me if I sent the fix already. So yes, it is there:

https://patchwork.ozlabs.org/patch/1259348/

Christophe
