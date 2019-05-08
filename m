Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0EF17EFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 19:19:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zjrT1kQ2zDqDJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 03:19:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="MqFiSXb9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zjq12z1fzDq83
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 03:18:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44zjps6jG8z9typg;
 Wed,  8 May 2019 19:17:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MqFiSXb9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FLpoFjDUKmry; Wed,  8 May 2019 19:17:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44zjps5JRmz9typ9;
 Wed,  8 May 2019 19:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557335877; bh=MKRqTd55kcmH4RuMf7lscRR+wmVsjwNJCi3x5iDCJ9A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MqFiSXb9MqsOQ+bHpePbwO6iRjE3kzoFDjv3i+IkEnEKK+brV+aG/uyHr0ZQxNR1Q
 tCOUVSe1OoTkkUiOgSzktDZ5EsKspeFTi3sEocTifVGHREv8ywV1kVdD/4YMp0opc6
 4gXVu1IW0LIPk9SsbJGfQt/IzHrQlei20B17+pHY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69BB18B90B;
 Wed,  8 May 2019 19:17:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r2BSWgysYCEQ; Wed,  8 May 2019 19:17:59 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F320B8B909;
 Wed,  8 May 2019 19:17:58 +0200 (CEST)
Subject: Re: IPIC_SERMR vs IPIC_SERMR
To: "Rodriguez Quesada, Pablo" <Pablo.Rodriguez-Quesada@windriver.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4@ALA-MBD.corp.ad.wrs.com>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <173648c3-686f-098f-a910-f81ffc1a660a@c-s.fr>
Date: Wed, 8 May 2019 19:17:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0CDD4071D6ACF54ABB9CF1A6D90375A809BAF4E4@ALA-MBD.corp.ad.wrs.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190508-2, 08/05/2019), Outbound message
X-Antivirus-Status: Clean
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
Cc: "Ramirez Rojas, Luis Daniel \(Daniel\)" <Daniel.RamirezRojas@windriver.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pablo,

Le 07/05/2019 à 23:50, Rodriguez Quesada, Pablo a écrit :
> Hi, Christophe and everyone from the LinuxPPC community,
> 
> Hope you are doing well!
> 
> I was working with Daniel, and we were reviewing the ipic source code 
> and came to these questions:
> 
> 1.The first one came up while reviewing the document “Understanding 
> IPIC” from NXP (*). The document states that:
> 
> /System Error Status Register (SERSR) – 0x40: Each bit in the SERSR 
> register corresponds to a non-maskable error source that generates a 
> machine check exception (MCP). These bits are cleared by writing the bit 
> location with a logic 1./
> 
> /The interrupting source must be cleared before clearing the interrupts 
> error status bit./
> 
> /System Error Mask Register (SERMR) – 0x44 When a machine check 
> exception is signaled from one of the peripheral modules, its 
> corresponding flag bit in this register is set. Any of the interrupting 
> sources can be individually masked./

I guess the above description is misleading.

In the MPC8323 Reference Manual, I find it more explicit:

8.5.14 System Error Mask Register (SERMR)
Each implemented bit in SERMR, shown in Figure 8-16, corresponds to an 
external and an internal mcp source (MCP). The user masks an MCP by 
clearing and enables an interrupt by setting the corresponding SERMR 
bit. When a masked MCP occurs, the corresponding SERSR bit is set, 
regardless of the setting of the corresponding SERMR bit although no MCP 
request is passed to the core in this case. The SERMR can be read by the 
user at any time.

> 
> //
> 
> We noticed that you changed the ipic_clear_mcp_status  function by 
> swapping SERMR to SERSR, but we don’t fully understand why. Could you 
> please elaborate on why this change is made? This because we had a code 
> that was working before the patch and we would fully understand why it 
> stopped working. From our perspective, both SERSR and SERMR are related 
> to MCEs and honestly don’t know what’s the difference at the hardware 
> level, and the role of every register on the machine check flow. It is 
> also weird for us that before your patch the register SERSR wasn’t used 
> in any part of the Linux kernel.

I suppose you are referring to the patch 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/sysdev/ipic.c?h=v5.1&id=6b148a7ce72a7f87c81cbcde48af014abc0516a9

For me the role of a function called ipic_clear_mcp_status() is ... to 
clear the status, not to manipulate a mask. So it has to deal with the 
status register (SERSR) and has nothing to do with the mask register 
(SERMR).

> 
> 2.In commit 8acb88682cc00a41a677c2455a7c992d you removed 
> ipic_set_highest_priority(), ipic_enable_mcp() and 
> ipic_disable_mcp()because it wasn’t used but here we are confused 
> because ipic_clear_mcp_status() sets all bits with the mask and in the 
> old disable function the bits from the mask are cleared with a bitwise 
> AND,changing the other bits from the SERMR register but the mcp_irq.

Probably the parameter of ipic_clear_mcp_status() should not be called 
'mask'. This parameter identifies the sources to clear. The bits set to 
1 corresponds to the sources to clear. The bits set to 0 corresponds to 
the sources we don't want to touch.

ipic_enable_mcp() and ipic_disable_mcp() had a different role, their 
role was to activate or deactivate interrupts generated by MCP sources 
iaw the description of SERMR.

> 
> ipic_clear:
> 
> ipic_write 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_write>(primary_ipic 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/primary_ipic>->regs, 
> IPIC_SERMR <https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR>, 
> mask);
> 
> ipic_disable:
> 
> temp <https://elixir.bootlin.com/linux/v4.1.13/ident/temp> = ipic_read 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_read>(ipic 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/ipic>->regs, IPIC_SERMR 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR>);
> 
> temp <https://elixir.bootlin.com/linux/v4.1.13/ident/temp> &= (1 << (31 
> - mcp_irq));
> 
> ipic_write 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/ipic_write>(ipic 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/ipic>->regs, IPIC_SERMR 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/IPIC_SERMR>, temp 
> <https://elixir.bootlin.com/linux/v4.1.13/ident/temp>);
> 
>                  Isn’t ipic_clear a set function instead of a clear 
> function? This bring us confusion

No, ipic_clear() role is to clear the status in accordance with the 
description of SERSR. In the description you copied, it is explicitely 
said: "These bits are cleared by writing the bit location with a logic 1".

In the MPC8323 Reference Manual, it is even more explicit:

Each implemented bit in the SERSR, listed in Table 8-22, corresponds to 
an external and an internal error source (mcp). When an error interrupt 
signal is received, the interrupt controller sets the corresponding 
SERSR bit. SERSR bits are cleared by writing ones to them. Unmasked 
event register bits should be cleared before clearing SERSR bits. 
Because the user can only clear bits in this register, writing zeros to 
this register has no effect.

> 
> Another question is why these functions were created in the first place?

I guess someone wanted to create a full API to the IPIC, but it was 
never used, or it was used by out-of-tree drivers or was used before the 
kernel was it GIT.

> 
> 3.In the NXP document it states that: /These bits are cleared by writing 
> the bit location with a logic 1. The interrupting source must be cleared 
> before clearing the interrupts error status bit./
> 
> Does this mean that these registers work with negative logic? How is 
> this managed in the kernel?
> 
> The interrupting source is the SERMR register, the SERSR or any other?
> 
> 4.What is the real difference between MCP and MCE? What are their uses?

MCE means Machine Check Exception

A machine check exception can be generated for several reasons, not only 
MCP. For instead a TEA will also generate a MCE.

Iaw MPC8323 Reference Manual:

MCP = Machine-check interrupt

In table 7.7:
Machine check 00200 Caused by the assertion of the tea signal during a 
data bus transaction, assertion of mcp, an address or data parity error, 
or an instruction or data cache parity error. Note that the e300 has 
SRR1 register values that are different from the G2/G2_LE cores’ when a 
machine check occurs

In §8.1:
The machine check exception is caused by the internal mcp signal 
generated by the IPIC, informing the host processor of error conditions, 
assertion of the external IRQ0 machine-check request (enabled when 
SEMSR[SIRQ0] = 1), and other conditions.



> 
> I know it is a lot of information but we are very confused about the use 
> of these registers and we noticed that you are very involved on the PPC 
> development. So we would like to hear from an expert.
> 
> Thank you very much for your time,

You are welcome

Christophe

> 
> Pablo
> 
> (*) https://www.nxp.com/docs/en/application-note/AN3797.pdf
> 

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

