Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB1160DF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 10:05:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LdP52wDGzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 20:05:29 +1100 (AEDT)
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
 header.s=mail header.b=WQfZxMMR; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LdLl4wH4zDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 20:03:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48LdLZ49gmz9v1WW;
 Mon, 17 Feb 2020 10:03:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WQfZxMMR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TNmFgMAQgiDf; Mon, 17 Feb 2020 10:03:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48LdLZ2cPzz9v1WS;
 Mon, 17 Feb 2020 10:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581930198; bh=KojM6T89T5lJkXgtiN49huPDHZvGUWiBtyDFVCX7aps=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WQfZxMMRFnD2XeNPwW0+oQfyZsVQ6sbwSLbc+cS7LvoRLNf/6QXg8SaXm3jB5A5Wd
 POqn73bE6R8/F4vjlM1awcMRWfyOmPm0ybgRDSH5P7MHop3AwzgfJYuH2uE7Oeb4s1
 vK6pGuTLBMdBN1Y3uEcCGe2HgK3BpCoGq/x7+2WA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB7B18B755;
 Mon, 17 Feb 2020 10:03:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YNxAztCy48Gr; Mon, 17 Feb 2020 10:03:22 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 882EC8B7A6;
 Mon, 17 Feb 2020 10:03:22 +0100 (CET)
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
To: Masami Hiramatsu <mhiramat@kernel.org>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
 <20200214225434.464ec467ad9094961abb8ddc@kernel.org>
 <e09d3c42-542e-48c1-2f1e-cfe605b05bec@c-s.fr>
 <20200216213411.824295a321d8fa979dedbbbe@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <baee8186-549a-f6cf-3619-884b6d708185@c-s.fr>
Date: Mon, 17 Feb 2020 10:03:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200216213411.824295a321d8fa979dedbbbe@kernel.org>
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
Cc: linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable@kernel.vger.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/02/2020 à 13:34, Masami Hiramatsu a écrit :
> On Sat, 15 Feb 2020 11:28:49 +0100
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> Hi,
>>
>> Le 14/02/2020 à 14:54, Masami Hiramatsu a écrit :
>>> Hi,
>>>
>>> On Fri, 14 Feb 2020 12:47:49 +0000 (UTC)
>>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>
>>>> When a program check exception happens while MMU translation is
>>>> disabled, following Oops happens in kprobe_handler() in the following
>>>> test:
>>>>
>>>> 		} else if (*addr != BREAKPOINT_INSTRUCTION) {
>>>
>>> Thanks for the report and patch. I'm not so sure about powerpc implementation
>>> but at where the MMU translation is disabled, can the handler work correctly?
>>> (And where did you put the probe on?)
>>>
>>> Your fix may fix this Oops, but if the handler needs special care, it is an
>>> option to blacklist such place (if possible).
>>
>> I guess that's another story. Here we are not talking about a place
>> where kprobe has been illegitimately activated, but a place where there
>> is a valid trap, which generated a valid 'program check exception'. And
>> kprobe was off at that time.
> 
> Ah, I got it. It is not a kprobe breakpoint, but to check that correctly,
> it has to know the address where the breakpoint happens. OK.
> 
>>
>> As any 'program check exception' due to a trap (ie a BUG_ON, a WARN_ON,
>> a debugger breakpoint, a perf breakpoint, etc...) calls
>> kprobe_handler(), kprobe_handler() must be prepared to handle the case
>> where the MMU translation is disabled, even if probes are not supposed
>> to be set for functions running with MMU translation disabled.
> 
> Can't we check the MMU is disabled there (as same as checking the exception
> happened in user space or not)?
> 

What do you mean by 'there' ? At the entry of kprobe_handler() ?

That's what my patch does, it checks whether MMU is disabled or not. If 
it is, it converts the address to a virtual address.

Do you mean kprobe_handler() should bail out early as it does when the 
trap happens in user mode ? Of course we can do that, I don't know 
enough about kprobe to know if kprobe_handler() should manage events 
that happened in real-mode or just ignore them. But I tested adding an 
event on a function that runs in real-mode, and it (now) works.

So, what should we do really ?

Christophe
