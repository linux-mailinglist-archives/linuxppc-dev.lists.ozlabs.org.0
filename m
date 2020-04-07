Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99F1A06D2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:56:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGqM0VyPzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:55:59 +1000 (AEST)
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
 header.s=mail header.b=rbA1pmIw; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGVz14gPzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:41:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGVv0WFpz9tyl1;
 Tue,  7 Apr 2020 07:41:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rbA1pmIw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yFUpcJwxSbcs; Tue,  7 Apr 2020 07:41:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGVt6Kp7z9tyl0;
 Tue,  7 Apr 2020 07:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586238102; bh=TJjdSz4BqExs2HuFCSIlMxyXD9GAkaK11xFYU9L9Jo4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rbA1pmIwewDJ7kSZc98XqakHIoWQg15E2R7ei9uWYqcff0W9XUq1C7nZWawq9OX0o
 xirzTWdxT3fKp2DOJ0YEMuIF2cI5lYWpX5BoJXBdcKC1E5EyZuHzZozhvL2PThceO+
 8mC934nV0bcklpF+gpZQ6Qb45uDpIKIclZ/7ubkQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF7DE8B76E;
 Tue,  7 Apr 2020 07:41:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4iJhtd15_HEU; Tue,  7 Apr 2020 07:41:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C538B8B75E;
 Tue,  7 Apr 2020 07:41:42 +0200 (CEST)
Subject: Re: [PATCH v3 08/15] powerpc/pseries/ras: fwnmi sreset should not
 interlock
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-9-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1641291c-f0e9-230f-6268-449112fb4066@c-s.fr>
Date: Tue, 7 Apr 2020 07:41:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407051636.648369-9-npiggin@gmail.com>
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
> PAPR does not specify that fwnmi sreset should be interlocked, and
> PowerVM (and therefore now QEMU) do not require it.
> 
> These "ibm,nmi-interlock" calls are ignored by firmware, but there
> is a possibility that the sreset could have interrupted a machine
> check and release the machine check's interlock too early, corrupting
> it if another machine check came in.
> 
> This is an extremely rare case, but it should be fixed for clarity
> and reducing the code executed in the sreset path. Firmware also
> does not provide error information for the sreset case to look at, so
> remove that comment.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/ras.c | 46 +++++++++++++++++++---------
>   1 file changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 2c60e2be1bc5..d65bc38bcb8f 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -406,6 +406,20 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
>   	return (struct rtas_error_log *)local_paca->mce_data_buf;
>   }
>   
> +static unsigned long *fwnmi_get_savep(struct pt_regs *regs)
> +{
> +	unsigned long savep_ra;
> +
> +	/* Mask top two bits */
> +	savep_ra = regs->gpr[3] & ~(0x3UL << 62);
> +	if (!VALID_FWNMI_BUFFER(savep_ra)) {
> +		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);

pr_err() ?

> +		return NULL;
> +	}
> +
> +	return __va(savep_ra);
> +}
> +
>   /*
>    * Get the error information for errors coming through the
>    * FWNMI vectors.  The pt_regs' r3 will be updated to reflect
> @@ -423,20 +437,14 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
>    */
>   static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
>   {
> -	unsigned long savep_ra;
>   	unsigned long *savep;
>   	struct rtas_error_log *h;
>   
> -	/* Mask top two bits */
> -	savep_ra = regs->gpr[3] & ~(0x3UL << 62);
> -
> -	if (!VALID_FWNMI_BUFFER(savep_ra)) {
> -		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
> +	savep = fwnmi_get_savep(regs);
> +	if (!savep)
>   		return NULL;
> -	}
>   
> -	savep = __va(savep_ra);
> -	regs->gpr[3] = be64_to_cpu(savep[0]);	/* restore original r3 */
> +	regs->gpr[3] = be64_to_cpu(savep[0]); /* restore original r3 */

Not sure the above line change is needed.

>   
>   	h = (struct rtas_error_log *)&savep[1];
>   	/* Use the per cpu buffer from paca to store rtas error log */
> @@ -483,11 +491,21 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
>   #endif
>   
>   	if (fwnmi_active) {
> -		struct rtas_error_log *errhdr = fwnmi_get_errinfo(regs);
> -		if (errhdr) {
> -			/* XXX Should look at FWNMI information */
> -		}
> -		fwnmi_release_errinfo();
> +		unsigned long *savep;
> +
> +		/*
> +		 * Firmware (PowerVM and KVM) saves r3 to a save area like
> +		 * machine check, which is not exactly what PAPR (2.9)
> +		 * suggests but there is no way to detect otherwise, so this
> +		 * is the interface now.
> +		 *
> +		 * System resets do not save any error log or require an
> +		 * "ibm,nmi-interlock" rtas call to release.
> +		 */
> +
> +		savep = fwnmi_get_savep(regs);
> +		if (savep)
> +			regs->gpr[3] = be64_to_cpu(savep[0]); /* restore original r3 */
>   	}
>   
>   	if (smp_handle_nmi_ipi(regs))
> 

Christophe
