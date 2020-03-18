Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D1189B3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 12:51:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j7fm3M1xzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:51:28 +1100 (AEDT)
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
 header.s=mail header.b=esUinrc0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j7WK3y7zzDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 22:45:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48j7WC0C0mz9ty2j;
 Wed, 18 Mar 2020 12:44:55 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=esUinrc0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8uLqouGGgVFQ; Wed, 18 Mar 2020 12:44:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48j7WB5nk2zB09Zs;
 Wed, 18 Mar 2020 12:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584531894; bh=i9/g7S7vCeFnTbt92JfSyh0tklUAjkcV+vcz9GQlJLE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=esUinrc0CYXh5iVrqAAh4vbUTRmAaN6sx8GwlpVfFD8C3S1NXIIXXpHImrV86V06a
 Wiwu8CV7Ulf3sBc68gS/OxjJ49ewarVB3vuzQj7QjpnK99HLEwfFEjf85Vx/tZ3t/l
 5uXxdFhsR0ToRU7BSyuHr8sHQFwyi1mEvrhdPl9s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DA218B78B;
 Wed, 18 Mar 2020 12:44:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7BX-2czHO79Y; Wed, 18 Mar 2020 12:44:55 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F4CA8B75B;
 Wed, 18 Mar 2020 12:44:55 +0100 (CET)
Subject: Re: [PATCH 12/15] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
To: Michael Ellerman <mpe@ellerman.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-13-ravi.bangoria@linux.ibm.com>
 <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
 <87zhcdevz7.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a7829a23-9b4d-0248-415e-85409f17dd77@c-s.fr>
Date: Wed, 18 Mar 2020 12:44:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87zhcdevz7.fsf@mpe.ellerman.id.au>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/03/2020 à 12:35, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
>>> Currently we assume that we have only one watchpoint supported by hw.
>>> Get rid of that assumption and use dynamic loop instead. This should
>>> make supporting more watchpoints very easy.
>>
>> I think using 'we' is to be avoided in commit message.
> 
> Hmm, is it?
> 
> I use 'we' all the time. Which doesn't mean it's correct, but I think it
> reads OK.
> 
> cheers
> 

 From 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html :

Describe your changes in imperative mood, e.g. “make xyzzy do frotz” 
instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to 
do frotz”, as if you are giving orders to the codebase to change its 
behaviour.

Christophe
