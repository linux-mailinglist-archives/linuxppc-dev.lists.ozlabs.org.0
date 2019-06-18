Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC279498BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:03:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Scw13mPlzDqMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:03:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qegwrawi"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Scsb5RcgzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:01:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ScsR5HjJz9v2JK;
 Tue, 18 Jun 2019 08:01:31 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qegwrawi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id H_7TJYDp76pN; Tue, 18 Jun 2019 08:01:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ScsR46MYz9v2Hx;
 Tue, 18 Jun 2019 08:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560837691; bh=7MhG5BQkk93ena6b4Du32oIN3mMMrdzWABAMIxugFnc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qegwrawi6feoHNSh2Z6KCBFdsFriTp9GllNy2ti98hOfc27ImcSnjNl2rap3hlGOJ
 PuNFHQ5X1MoHA5k/uhh6YIWVg3nyzewpLjx/7fJBPCJ2aXMByBYco/YmW+94e1xMwz
 SubkBI8di+Pqeo2S9AjeMKRzB4hrk4u5c5cGIXMw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D29A8B880;
 Tue, 18 Jun 2019 08:01:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fjVvnbzRWAAh; Tue, 18 Jun 2019 08:01:31 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A5A758B78B;
 Tue, 18 Jun 2019 08:01:30 +0200 (CEST)
Subject: Re: [PATCH 0/5] Powerpc/hw-breakpoint: Fixes plus Code refactor
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2344165b-b55b-d1b9-fd96-e057500e8c74@c-s.fr>
Date: Tue, 18 Jun 2019 08:01:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
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
Cc: mikey@neuling.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/06/2019 à 06:27, Ravi Bangoria a écrit :
> patch 1-3: Code refactor
> patch 4: Speedup disabling breakpoint
> patch 5: Fix length calculation for unaligned targets

While you are playing with hw breakpoints, did you have a look at 
https://github.com/linuxppc/issues/issues/38 ?

Christophe

> 
> Ravi Bangoria (5):
>    Powerpc/hw-breakpoint: Replace stale do_dabr() with do_break()
>    Powerpc/hw-breakpoint: Refactor hw_breakpoint_arch_parse()
>    Powerpc/hw-breakpoint: Refactor set_dawr()
>    Powerpc/hw-breakpoint: Optimize disable path
>    Powerpc/Watchpoint: Fix length calculation for unaligned target
> 
>   arch/powerpc/include/asm/hw_breakpoint.h | 10 ++--
>   arch/powerpc/kernel/hw_breakpoint.c      | 56 ++++++++++++----------
>   arch/powerpc/kernel/process.c            | 61 +++++++++++++++++++-----
>   arch/powerpc/kernel/ptrace.c             |  2 +-
>   4 files changed, 86 insertions(+), 43 deletions(-)
> 
