Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C71A06B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:51:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGkN16qDzDqG1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:51:40 +1000 (AEST)
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
 header.s=mail header.b=iDRwPVn9; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGPg1d9czDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:37:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGPZ567Dz9tyl0;
 Tue,  7 Apr 2020 07:37:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iDRwPVn9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id he_JtFx4FWod; Tue,  7 Apr 2020 07:37:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGPZ3sLsz9tykx;
 Tue,  7 Apr 2020 07:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586237826; bh=0x4+TWqk8JW6pvSjtGBATvZRUz0SffM/R45B7NoZvGE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iDRwPVn9l6EMEAPKcEg7YkbwNyKGgJQn6eSVb/3ns2xOEo4TNl6UCV60tun1npTbb
 HjbXZ56ASAkKybsHkyyLgapCQWPKw9vqRweX8IH502w2sVzTu24yAze9073TjKMsMg
 1In8R5vlVG0JKqyxKpjEL8YJKdEK0k5N4WKBmXRI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 46D528B76E;
 Tue,  7 Apr 2020 07:37:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ouk7-S44oSdO; Tue,  7 Apr 2020 07:37:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 767308B75E;
 Tue,  7 Apr 2020 07:37:06 +0200 (CEST)
Subject: Re: [PATCH v3 11/15] powerpc/64s: machine check interrupt update NMI
 accounting
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-12-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <684cdf24-a87a-1099-70c1-d3ff9a3921ff@c-s.fr>
Date: Tue, 7 Apr 2020 07:37:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407051636.648369-12-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/04/2020 à 07:16, Nicholas Piggin a écrit :
> machine_check_early is taken as an NMI, so nmi_enter is used there.
> machine_check_exception is no longer taken as an NMI (it's invoked
> via irq_work in the case a machine check hits in kernel mode), so
> remove the nmi_enter from that case.

Euh ... Is that also the case for PPC32 ?

AFAIK machine_check_exception() is called as an NMI on PPC32.

Christophe

> 
> In NMI context, hash faults don't try to refill the hash table, which
> can lead to crashes accessing non-pinned kernel pages. System reset
> still has this potential problem.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/mce.c     |  7 +++++++
>   arch/powerpc/kernel/process.c |  2 +-
>   arch/powerpc/kernel/traps.c   | 13 +------------
>   3 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 8077b5fb18a7..be7e3f92a7b5 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -574,6 +574,9 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>   long machine_check_early(struct pt_regs *regs)
>   {
>   	long handled = 0;
> +	bool nested = in_nmi();
> +	if (!nested)
> +		nmi_enter();
>   
>   	hv_nmi_check_nonrecoverable(regs);
>   
> @@ -582,6 +585,10 @@ long machine_check_early(struct pt_regs *regs)
>   	 */
>   	if (ppc_md.machine_check_early)
>   		handled = ppc_md.machine_check_early(regs);
> +
> +	if (!nested)
> +		nmi_exit();
> +
>   	return handled;
>   }
>   
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 9c21288f8645..44410dd3029f 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1421,7 +1421,7 @@ void show_regs(struct pt_regs * regs)
>   		pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>   #endif
>   #ifdef CONFIG_PPC64
> -	pr_cont("IRQMASK: %lx ", regs->softe);
> +	pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_paca()->in_nmi, (int)get_paca()->in_mce);
>   #endif
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	if (MSR_TM_ACTIVE(regs->msr))
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 3fca22276bb1..9f221772eb73 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -823,9 +823,6 @@ int machine_check_generic(struct pt_regs *regs)
>   void machine_check_exception(struct pt_regs *regs)
>   {
>   	int recover = 0;
> -	bool nested = in_nmi();
> -	if (!nested)
> -		nmi_enter();
>   
>   	__this_cpu_inc(irq_stat.mce_exceptions);
>   
> @@ -851,20 +848,12 @@ void machine_check_exception(struct pt_regs *regs)
>   	if (check_io_access(regs))
>   		goto bail;
>   
> -	if (!nested)
> -		nmi_exit();
> -
>   	die("Machine check", regs, SIGBUS);
>   
> +bail:
>   	/* Must die if the interrupt is not recoverable */
>   	if (!(regs->msr & MSR_RI))
>   		nmi_panic(regs, "Unrecoverable Machine check");
> -
> -	return;
> -
> -bail:
> -	if (!nested)
> -		nmi_exit();
>   }
>   
>   void SMIException(struct pt_regs *regs)
> 
