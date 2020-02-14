Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7715D63B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 12:04:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jr9z5WMlzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 22:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jr7v62WZzDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 22:02:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=AXPIAzZI; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Jr7v4Wwqz8syf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 22:02:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Jr7v4CqNz9sRQ; Fri, 14 Feb 2020 22:02:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=AXPIAzZI; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Jr7t1hTkz9sNg
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Feb 2020 22:02:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Jr7j1ntmz9txYh;
 Fri, 14 Feb 2020 12:02:41 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AXPIAzZI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dr3spzWu6Kgn; Fri, 14 Feb 2020 12:02:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Jr7j093fz9txYg;
 Fri, 14 Feb 2020 12:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581678161; bh=v9M8VmksV7u9xH2sUOYyhQSMnHo0bJJ8k5ZvL4FuUMI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=AXPIAzZI+Eb+swPa+oOmgB8SuiUHeFit7p7h8jS66VMNzXt3yRGAv7THN9GAJDobc
 /XGC86cTmSvySDqPPtv5M6tKwdUVOuzg12OWQZB26+IDSr3esEIk+JV+x2BoWO23ZK
 CE/3GX2MTL5CP0Bcxa7nT4bgUrnFpaivimr2SwGI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C17C8B896;
 Fri, 14 Feb 2020 12:02:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id c7FDXdAbgLDq; Fri, 14 Feb 2020 12:02:41 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DABF68B895;
 Fri, 14 Feb 2020 12:02:40 +0100 (CET)
Subject: Re: RESEND: Re: Problem booting a PowerBook G4 Aluminum after commit
 cd08f109 with CONFIG_VMAP_STACK=y
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
 <9429f86e-8c7d-b2e6-6dc1-8f58c44baadc@c-s.fr>
 <2da19b26-9a44-2e4e-ab7d-d3fff65091bd@lwfinger.net>
 <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
Message-ID: <bd705040-914b-21a8-dfb2-c98bc8c96609@c-s.fr>
Date: Fri, 14 Feb 2020 12:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/02/2020 à 07:24, Christophe Leroy a écrit :
> Larry,
> 
> Le 14/02/2020 à 00:09, Larry Finger a écrit :
>> Christophe,
>>
>> With this patch, it gets further. Sometime after the boot process 
>> tries to start process init, it crashes with the unable to read data 
>> at 0x000157a0 with a faulting address of 0xc001683c. The screenshot is 
>> attached and the gzipped vmlinux is at 
>> http://www.lwfinger.com/download/vmlinux2.gz. The patches that were 
>> applied for this kernel are also attached,
>>
> 
> 
> Did you try with the patch at https://patchwork.ozlabs.org/patch/1237387/ ?
> 
> I see the problem happens in kprobe_handler(). Can you try without 
> CONFIG_KPROBE ?
> 

In fact, you hit two bugs. The first one is due to CONFIG_VMAP_STACK. 
The second one has always existed (at least since kernel source tree has 
been in git).

First bug is in function enter_rtas() which tries to read data on stack 
by using the linear physical address translation. This cannot be used 
with VM stack, it must re-enable data MMU translation to access data on 
the stack.

Second bug is in kprobe_handler() function, which does:

	if (*addr != BREAKPOINT_INSTRUCTION)

addr is the address where the 'trap' happened. When a trap happens with 
MMU disabled, addr contains the physical address of the trap. 
kprobe_handler() tries to read the instruction using physical address 
whereas MMU is enabled, so you get a bad access either because the said 
address is not mapped, or because access to userspace is not allowed.


Due to the first bug, you get a 'machine check', and as 
current->thread.rtas_sp has not been cleared yet, the machine check 
handler jumps to 'machine_check_in_rtas'.

machine_check_in_rtas does a trap, which in turn triggers the second bug.


Once the first bug is fixed, the second one should not popup.

Can you test patch https://patchwork.ozlabs.org/patch/1237929/ that 
fixes the first bug ?

Christophe
