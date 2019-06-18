Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6D498CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:16:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SdBy2F3fzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Kez0CNpF"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sd943h3kzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:15:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Sd911hX5z9v32x;
 Tue, 18 Jun 2019 08:15:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Kez0CNpF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id M3PGQrwHcKMg; Tue, 18 Jun 2019 08:15:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Sd910ccgz9v32w;
 Tue, 18 Jun 2019 08:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560838501; bh=I7JZ9gFH0idmpMT36+ZfnaVxZu1dS6ov87xVghAIsHI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Kez0CNpFgGZ3NO9Di1I6CyWydEgSaGBOUXCnxjRlwzyPH/feGNWpybrn9vWiZUNum
 VSREH721pYnrFfPLh5AbaKfQCUzVfax5o0bHPZXYq7J7u+RGb7mcBL5uWlkjfBCgLz
 qhRDSqMjghVBqNHreAcgwU4+hfHUXZMHIKr9Y3m0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0ED818B880;
 Tue, 18 Jun 2019 08:15:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IJKu8cZ1nbSz; Tue, 18 Jun 2019 08:15:00 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 46ED58B78B;
 Tue, 18 Jun 2019 08:15:00 +0200 (CEST)
Subject: Re: [PATCH 1/5] Powerpc/hw-breakpoint: Replace stale do_dabr() with
 do_break()
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-2-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ad944298-3418-cc94-c120-554ba0f03f0c@c-s.fr>
Date: Tue, 18 Jun 2019 08:14:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618042732.5582-2-ravi.bangoria@linux.ibm.com>
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

The subject text should mention you are changing comments. Here it 
suggests you are changing code text.

Le 18/06/2019 à 06:27, Ravi Bangoria a écrit :
> do_dabr() was renamed with do_break() long ago. But I still see
> some comments mentioning do_dabr(). Replace it.

s/Replace it/Replace them/

Christophe

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/kernel/hw_breakpoint.c | 2 +-
>   arch/powerpc/kernel/ptrace.c        | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index a293a53b4365..1908e4fcc132 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -232,7 +232,7 @@ int hw_breakpoint_handler(struct die_args *args)
>   	 * Return early after invoking user-callback function without restoring
>   	 * DABR if the breakpoint is from ptrace which always operates in
>   	 * one-shot mode. The ptrace-ed process will receive the SIGTRAP signal
> -	 * generated in do_dabr().
> +	 * generated in do_break().
>   	 */
>   	if (bp->overflow_handler == ptrace_triggered) {
>   		perf_bp_event(bp, regs);
> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index 684b0b315c32..44b823e5e8c8 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c
> @@ -2373,7 +2373,7 @@ void ptrace_triggered(struct perf_event *bp,
>   	/*
>   	 * Disable the breakpoint request here since ptrace has defined a
>   	 * one-shot behaviour for breakpoint exceptions in PPC64.
> -	 * The SIGTRAP signal is generated automatically for us in do_dabr().
> +	 * The SIGTRAP signal is generated automatically for us in do_break().
>   	 * We don't have to do anything about that here
>   	 */
>   	attr = bp->attr;
> 
