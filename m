Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 281121724B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:11:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Szj92MkzzDr6l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:11:25 +1100 (AEDT)
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
 header.s=mail header.b=wR2VozWe; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SzgG3WRwzDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:09:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Szg86mjrz9tyl9;
 Thu, 27 Feb 2020 18:09:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wR2VozWe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sWRTNANo0VvI; Thu, 27 Feb 2020 18:09:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Szg85cnNz9tyl6;
 Thu, 27 Feb 2020 18:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582823380; bh=FcXtMozaz5aKjR+MsTQyybTO/Ns9vbTusP0TC2E6/Rc=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=wR2VozWeQBdMWkmwLMTgbQha488lPIfS8dqydiYIMk0CxSwz4qFGTKE/7UFBGBAnV
 IvaNU5MzUmAnCSmvKoWvANls5L8e6TnpWVZNMd96+Ty+THmb62qEG/gAjyt5/APY+P
 UW+vQh0rV6A8qEbCbqtzd6QAtLVyhTz67sRrwubo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C2528B880;
 Thu, 27 Feb 2020 18:09:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fDbqYkuli0hU; Thu, 27 Feb 2020 18:09:42 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 803598B799;
 Thu, 27 Feb 2020 18:09:40 +0100 (CET)
Subject: Re: [PATCH v4 13/13] powerpc/ptrace: move ptrace_triggered() into
 hw_breakpoint.c
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 mikey@neuling.org, Russell Currey <ruscur@russell.cc>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
 <d45c91cf5f83424b8f3989b7ead28c50d8d765a9.1582803998.git.christophe.leroy@c-s.fr>
Message-ID: <4e528bf2-2b53-ae93-cdcc-0c80953f40f2@c-s.fr>
Date: Thu, 27 Feb 2020 18:09:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d45c91cf5f83424b8f3989b7ead28c50d8d765a9.1582803998.git.christophe.leroy@c-s.fr>
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

Russel,

Le 27/02/2020 à 12:49, Christophe Leroy a écrit :
> ptrace_triggered() is declared in asm/hw_breakpoint.h and
> only needed when CONFIG_HW_BREAKPOINT is set, so move it
> into hw_breakpoint.c

My series v4 is definitely buggy (I included ptrace_decl.h instead 
instead of ptrace-decl.h), how can Snowpatch say build succeeded 
(https://patchwork.ozlabs.org/patch/1245807/) ?

It fails at least on pmac32_defconfig and ppc64_defconfig, see:

http://kisskb.ellerman.id.au/kisskb/head/d45c91cf5f83424b8f3989b7ead28c50d8d765a9/

Christophe

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v4: removing inclusing of hw_breakpoint.h now. Previously it was done too early.
> ---
>   arch/powerpc/kernel/hw_breakpoint.c | 16 ++++++++++++++++
>   arch/powerpc/kernel/ptrace/ptrace.c | 19 -------------------
>   2 files changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 2462cd7c565c..2c0be9d941cf 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -427,3 +427,19 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
>   {
>   	/* TODO */
>   }
> +
> +void ptrace_triggered(struct perf_event *bp,
> +		      struct perf_sample_data *data, struct pt_regs *regs)
> +{
> +	struct perf_event_attr attr;
> +
> +	/*
> +	 * Disable the breakpoint request here since ptrace has defined a
> +	 * one-shot behaviour for breakpoint exceptions in PPC64.
> +	 * The SIGTRAP signal is generated automatically for us in do_dabr().
> +	 * We don't have to do anything about that here
> +	 */
> +	attr = bp->attr;
> +	attr.disabled = true;
> +	modify_user_hw_breakpoint(bp, &attr);
> +}
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index a44f6e5e05ff..f6e51be47c6e 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -18,7 +18,6 @@
>   #include <linux/regset.h>
>   #include <linux/tracehook.h>
>   #include <linux/audit.h>
> -#include <linux/hw_breakpoint.h>
>   #include <linux/context_tracking.h>
>   #include <linux/syscalls.h>
>   
> @@ -31,24 +30,6 @@
>   
>   #include "ptrace-decl.h"
>   
> -#ifdef CONFIG_HAVE_HW_BREAKPOINT
> -void ptrace_triggered(struct perf_event *bp,
> -		      struct perf_sample_data *data, struct pt_regs *regs)
> -{
> -	struct perf_event_attr attr;
> -
> -	/*
> -	 * Disable the breakpoint request here since ptrace has defined a
> -	 * one-shot behaviour for breakpoint exceptions in PPC64.
> -	 * The SIGTRAP signal is generated automatically for us in do_dabr().
> -	 * We don't have to do anything about that here
> -	 */
> -	attr = bp->attr;
> -	attr.disabled = true;
> -	modify_user_hw_breakpoint(bp, &attr);
> -}
> -#endif /* CONFIG_HAVE_HW_BREAKPOINT */
> -
>   /*
>    * Called by kernel/ptrace.c when detaching..
>    *
> 
