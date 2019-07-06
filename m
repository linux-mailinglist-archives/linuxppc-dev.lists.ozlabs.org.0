Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D474E60F74
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 10:28:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45glGf6Ff0zDqdv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 18:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ru2p0jnF"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45glDy2zzNzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 18:26:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45glDq6ZjYz9vBmT;
 Sat,  6 Jul 2019 10:26:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ru2p0jnF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AECzU9flJshk; Sat,  6 Jul 2019 10:26:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45glDq4qGpz9vBmQ;
 Sat,  6 Jul 2019 10:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562401611; bh=mh8ujrNVmKQnrW9nDzbu+49uRl2+DM2LFGY+iQ49uaE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ru2p0jnF3ids7fmZpTgeYrASFyvoVkL72KL/HeYQ+FTu3BKXtl3xPhH5MVCevoRU5
 ujz7aVUOcCi7kYFlJeRsd9lMWRlLVvjxRFDOamnDYT9QN93qZB0IWNb1IKUooXuOTZ
 rE509HWZ5soWFRwGVdAFSl/JOYdXdrOteQE3s3Ok=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA47F8B768;
 Sat,  6 Jul 2019 10:26:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IektAObbTzti; Sat,  6 Jul 2019 10:26:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47A948B74C;
 Sat,  6 Jul 2019 10:26:52 +0200 (CEST)
Subject: Re: [PATCH] powerpc/hw_breakpoint: move instruction stepping out of
 hw_breakpoint_handler()
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <f8cdc3f1c66ad3c43ebc568abcc6c39ed4676284.1561737231.git.christophe.leroy@c-s.fr>
 <57148696-b9a5-d3c1-1e29-82673c558927@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <bef43f48-fa40-284e-a299-bc73ebc3e725@c-s.fr>
Date: Sat, 6 Jul 2019 10:26:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <57148696-b9a5-d3c1-1e29-82673c558927@linux.ibm.com>
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



Le 03/07/2019 à 08:20, Ravi Bangoria a écrit :
> 
> 
> On 6/28/19 9:25 PM, Christophe Leroy wrote:
>> On 8xx, breakpoints stop after executing the instruction, so
>> stepping/emulation is not needed. Move it into a sub-function and
>> remove the #ifdefs.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
> 
> Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> 
> Just one neat below...

Thanks for the review.

> 
> [...]
> 
>> -#ifndef CONFIG_PPC_8xx
>> -	/* Do not emulate user-space instructions, instead single-step them */
>> -	if (user_mode(regs)) {
>> -		current->thread.last_hit_ubp = bp;
>> -		regs->msr |= MSR_SE;
>> +	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info->address))
> 
> May be split this line. It's 86 chars long and checkpatch.pl is warning
> about this:

Didn't you use arch/powerpc/tools/checkpatch.sh ?

powerpc accepts 90 chars per line.

Christophe

> 
> WARNING: line over 80 characters
> #257: FILE: arch/powerpc/kernel/hw_breakpoint.c:282:
> +	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info->address))
> 
