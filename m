Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8886391CA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 07:42:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BjVs1tmWzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="denaVW6w"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BjTF0bN1zDr0C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 15:41:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46BjT12gM4z9txRw;
 Mon, 19 Aug 2019 07:40:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=denaVW6w; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0hzF2hOGeWtK; Mon, 19 Aug 2019 07:40:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46BjT11ZJdz9txRv;
 Mon, 19 Aug 2019 07:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566193253; bh=slCIs1ABIzIVXZpwN19CyhQdc00di8vdt1eulyooFrU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=denaVW6wEh0EnnNoMhBYxRB+4Tbl1rFqoVmwq6lLxJQC/ezVanpfP9iNq5ywveCx0
 BS9e24PC3BSxw9NaD5h2Pkl/QaPXR4rYWUOI8RJA/SzPPW8sJOgzy3dMAH+zu/OOKs
 OkDyAtNwICEV1cIhQV9GPNGd3wU4ip0M4SQ84a9E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 184A08B77F;
 Mon, 19 Aug 2019 07:40:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 82Bdaw2RJIVW; Mon, 19 Aug 2019 07:40:58 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE7A58B74F;
 Mon, 19 Aug 2019 07:40:57 +0200 (CEST)
Subject: Re: [PATCH] powerpc: optimise WARN_ON()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20190817090442.C5FEF106613@localhost.localdomain>
 <20190818120135.GV31406@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f1c0d9d9-d978-794f-82ce-494d2e52d743@c-s.fr>
Date: Mon, 19 Aug 2019 07:40:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818120135.GV31406@gate.crashing.org>
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



Le 18/08/2019 à 14:01, Segher Boessenkool a écrit :
> On Sat, Aug 17, 2019 at 09:04:42AM +0000, Christophe Leroy wrote:
>> Unlike BUG_ON(x), WARN_ON(x) uses !!(x) as the trigger
>> of the t(d/w)nei instruction instead of using directly the
>> value of x.
>>
>> This leads to GCC adding unnecessary pair of addic/subfe.
> 
> And it has to, it is passed as an "r" to an asm, GCC has to put the "!!"
> value into a register.
> 
>> By using (x) instead of !!(x) like BUG_ON() does, the additional
>> instructions go away:
> 
> But is it correct?  What happens if you pass an int to WARN_ON, on a
> 64-bit kernel?

On a 64-bit kernel, an int is still in a 64-bit register, so there would 
be no problem with tdnei, would it ? an int 0 is the same as an long 0, 
right ?

It is on 32-bit kernel that I see a problem, if one passes a long long 
to WARN_ON(), the forced cast to long will just drop the upper size of 
it. So as of today, BUG_ON() is buggy for that.

> 
> (You might want to have 64-bit generate either tw or td.  But, with
> your __builtin_trap patch, all that will be automatic).
> 

Yes I'll discard this patch and focus on the __builtin_trap() one which 
should solve most issues.

Christophe
