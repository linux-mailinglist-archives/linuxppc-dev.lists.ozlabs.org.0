Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94415B98B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 07:25:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J61p2n4jzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 17:25:02 +1100 (AEDT)
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
 header.s=mail header.b=ZC+B1G07; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J6082s9MzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 17:23:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48J6044Y3Pz9twjc;
 Thu, 13 Feb 2020 07:23:32 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZC+B1G07; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gKaSaOXr3cJi; Thu, 13 Feb 2020 07:23:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48J6043DSLz9twjb;
 Thu, 13 Feb 2020 07:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581575012; bh=otW24MZh5lx9y9WBrLGnCru3UqDysL423wGGBmzok+c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZC+B1G07KwXT4KAohJpbETmPNEcjOkgmr8ePhh19i6rRo3B+4f39XzCvba8eyKMEv
 7rBASBjjpKz0xyxmtqhKHfomq9FnYUAJvxclpc4pZzhbFzG3MFhOoQeoUr4DF6kU5d
 XNq+2LFcd4kYdqIzvgjIXIx7Tn6j3PNMxx3wJ2EU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 279838B793;
 Thu, 13 Feb 2020 07:23:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nUDy-hFVV_gp; Thu, 13 Feb 2020 07:23:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC97D8B752;
 Thu, 13 Feb 2020 07:23:32 +0100 (CET)
Subject: Re: [PATCH v2] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20200213052327.24207-1-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <058bf3e8-84e6-d0b6-9836-72dda7d524e2@c-s.fr>
Date: Thu, 13 Feb 2020 07:23:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213052327.24207-1-dja@axtens.net>
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/02/2020 à 06:23, Daniel Axtens a écrit :
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index e05e6dd67ae6..ef455da7efa3 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -285,18 +285,25 @@ void __init early_setup(unsigned long dt_ptr)
>   
>   	/* -------- printk is _NOT_ safe to use here ! ------- */
>   
> -	/* Try new device tree based feature discovery ... */
> -	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
> -		/* Otherwise use the old style CPU table */
> -		identify_cpu(0, mfspr(SPRN_PVR));
> +	/* Assume we're on cpu 0 for now. Don't write to the paca yet!
> +	 *
> +	 * We need to load a PACA very early if we are using kcov. kcov will
> +	 * call in_task() in its instrumentation, which relies on the current
> +	 * task from the PACA. dt_cpu_ftrs_init is coveraged-enabled and also
> +	 * calls into the coverage-enabled generic dt library.
> +	 */

Checkpatch won't be happy I guess. For multiline comments, there should 
be no text on the first line starting with /*

Christophe
