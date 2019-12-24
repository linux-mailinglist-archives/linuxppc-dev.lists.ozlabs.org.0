Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E0D12A0D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 12:44:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hvXB5p94zDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 22:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="lYmJlwXj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hvSq3FK6zDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 22:41:47 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hvSk5rlxz9tvqq;
 Tue, 24 Dec 2019 12:41:42 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=lYmJlwXj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WeNRdbd7lgXn; Tue, 24 Dec 2019 12:41:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hvSk41pRz9tvqp;
 Tue, 24 Dec 2019 12:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577187702; bh=zVvs2ouna/B/Vb/2RfZVUK0x0665UncRbgfLeAdSnnY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lYmJlwXjs+sVC+Oy+w8vyY3OjRXZBsUlCFzkOcAtGzQv8VGRTjvaBltJ8BvY0yncd
 kvWtk3/4+I6R+C35vHzjesQG3ZepSfG0mV/VjcD+JMGNw5tKirhTpTWaYsm2DosM1j
 4yvJ9P1cylNo9xPKKIo9g95EUbXTD0fvHykyHi40=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C1F0C8B783;
 Tue, 24 Dec 2019 12:41:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EbbqCE6Lvv3b; Tue, 24 Dec 2019 12:41:43 +0100 (CET)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACB038B782;
 Tue, 24 Dec 2019 12:41:42 +0100 (CET)
Subject: Re: [RFC PATCH v2 02/10] lib: vdso: move call to fallback out of
 common code.
To: Andy Lutomirski <luto@kernel.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <de073962c1a5911343e13c183fbbdef0fe95449e.1577111365.git.christophe.leroy@c-s.fr>
 <CALCETrXWHk9J-pYm+eopMuW3x7Jr_LnzRjr94gq8g66xOO6SBg@mail.gmail.com>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <36f1ce73-d8bc-9c46-8a2a-b6514d4a1ba0@c-s.fr>
Date: Tue, 24 Dec 2019 12:41:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CALCETrXWHk9J-pYm+eopMuW3x7Jr_LnzRjr94gq8g66xOO6SBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 191223-0, 23/12/2019), Outbound message
X-Antivirus-Status: Not-Tested
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/12/2019 à 03:24, Andy Lutomirski a écrit :
> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> On powerpc, VDSO functions and syscalls cannot be implemented in C
>> because the Linux kernel ABI requires that CR[SO] bit is set in case
>> of error and cleared when no error.
>>
>> As this cannot be done in C, C VDSO functions and syscall'based
>> fallback need a trampoline in ASM.
>>
>> By moving the fallback calls out of the common code, arches like
>> powerpc can implement both the call to C VDSO and the fallback call
>> in a single trampoline function.
> 
> Maybe the issue is that I'm not a powerpc person, but I don't
> understand this.  The common vDSO code is in C.  Presumably this means
> that you need an asm trampoline no matter what to call the C code.  Is
> the improvement that, with this change, you can have the asm
> trampoline do a single branch, so it's logically:
> 
> ret = [call the C code];
> if (ret == 0) {
>   set success bit;
> } else {
>   ret = fallback;
>   if (ret == 0)
>    set success bit;
> else
>    set failure bit;
> }

More simple than above, in fact it is:

ret = [call the C code];
if (ret == 0) {
  set success bit;
} else {
  ret = fallback [ which sets the success/failure bit];
}
return ret


> 
> return ret;
> 
> instead of:
> 
> ret = [call the C code, which includes the fallback];

C code cannot handle the success/failure bit so we need to do something 
which does:

int assembly_to_fallback()
{
	ret = [syscall the fallback]
	if (success bit set)
		return ret;
	else
		return -ret;
}

Also means going back and forth between the success bit and negative return.

> if (ret == 0)
>    set success bit;
> else
>    set failure bit;
> 
> It's not obvious to me that the former ought to be faster.
> 
>>
>> The two advantages are:
>> - No need play back and forth with CR[SO] and negative return value.
>> - No stack frame is required in VDSO C functions for the fallbacks.
> 
> How is no stack frame required?  Do you mean that the presence of the
> fallback causes worse code generation?  Can you improve the fallback
> instead?
> 

When function F1 calls function F2 (with BL insn), the link register 
(LR) is set with the return address in F1, so that at the end of F2, F2 
branches to LR (with BLR insn), that's how you return from functions.

When F2 calls function F3, the same happens, LR is set to the return of 
F3 into F2. It means that F2 has to save LR in order to be able to 
return to F1, otherwise the return address from F2 into F1 is lost.

But ... thinking about it once more, indeed fallback means doing a 
syscall, and in fact I realise that syscalls won't clobber LR, so it 
should be possible to do something. Let me try it.

Christophe
