Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D702658E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:40:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnl2h4dX0zDqXw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:40:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnl130ysLzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:38:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bnl0w4Zd9z9tynT;
 Fri, 11 Sep 2020 07:38:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vp3BUqbbRUij; Fri, 11 Sep 2020 07:38:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bnl0w3Fzfz9tynS;
 Fri, 11 Sep 2020 07:38:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BDDB8B832;
 Fri, 11 Sep 2020 07:38:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iSygJtrQWMMk; Fri, 11 Sep 2020 07:38:41 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E22AC8B75E;
 Fri, 11 Sep 2020 07:38:40 +0200 (CEST)
Subject: Re: [PATCH 3/7] powerpc/sstep: Fix W=1 compile warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-4-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8a71335b-12b8-4d17-9b98-ff1eb0a39b84@csgroup.eu>
Date: Fri, 11 Sep 2020 07:38:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910210250.1962595-4-clg@kaod.org>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
> ../arch/powerpc/lib/sstep.c: In function ‘mlsd_8lsd_ea’:
> ../arch/powerpc/lib/sstep.c:225:3: error: suggest braces around empty body in an ‘if’ statement [-Werror=empty-body]
>     ; /* Invalid form. Should already be checked for by caller! */
>     ^

A small sentence explaining how this is fixed would be welcome, so that 
you don't need to read the code the know what the commit does to fix the 
warning. Also the subject should be more explicit.



> 
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/lib/sstep.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index caee8cc77e19..14572af16e55 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -221,8 +221,9 @@ static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
>   		; /* Leave ea as is */
>   	else if (prefix_r && !ra)
>   		ea += regs->nip;
> -	else if (prefix_r && ra)
> +	else if (prefix_r && ra) {
>   		; /* Invalid form. Should already be checked for by caller! */
> +	}

You can't do that. Now checkpatch will complain that you don't have 
braces on all legs of the if/else dance.

I think the last 'else if' should simply be removed entirely as it does 
nothing. Eventually, just leave the comment, something like:

	/* (prefix_r && ra) is Invalid form. Should already be checked for by 
caller! */

And if (prefix_r && ra) is not possible, then the previous if should 
just be 'if (prefx_r)'

Christophe


>   
>   	return ea;
>   }
> 
