Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F2160A7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 07:33:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LZ1F3M0wzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 17:33:05 +1100 (AEDT)
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
 header.s=mail header.b=qsp3FcoV; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LYzD5HkDzDqTR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 17:31:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48LYz30xBJz9tyKv;
 Mon, 17 Feb 2020 07:31:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qsp3FcoV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 58-kPQzPnR-F; Mon, 17 Feb 2020 07:31:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48LYz26lZ8z9tyKt;
 Mon, 17 Feb 2020 07:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581921070; bh=Hgi3ypUkfbLg/h7YzQMYOwDmEkgVzSHWMc1RBorVoxQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qsp3FcoV9oyuESfmt2dP/QDODLjOkxnSnMya2Ltlksqsl38oOo3pXu/Icec2CGFM8
 6kGj2L2+cjl8SSIx+2e2m/rdIISbQvwIV3vhJCSKgWna3TTyBjrFB6qQeqwU/GhaNm
 G0wRKzWBMuT1geiJDn5Wjcs/zkK+OQQ2gbD1sbNQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 602818B79C;
 Mon, 17 Feb 2020 07:31:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PNlTi_jw4LA4; Mon, 17 Feb 2020 07:31:15 +0100 (CET)
Received: from [172.25.230.102] (unknown [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 417D38B755;
 Mon, 17 Feb 2020 07:31:15 +0100 (CET)
Subject: Re: [PATCH 1/1] powerpc/cputable: Remove unnecessary copy of
 cpu_spec->oprofile_type
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, desnesn@linux.ibm.com
References: <20200215053637.280880-1-leonardo@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0d33a8b2-a7e5-c3e0-b28a-fd39f1231d97@c-s.fr>
Date: Mon, 17 Feb 2020 07:31:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200215053637.280880-1-leonardo@linux.ibm.com>
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



Le 15/02/2020 à 06:36, Leonardo Bras a écrit :
> Before checking for cpu_type == NULL, this same copy happens, so doing
> it here will just write the same value to the t->oprofile_type
> again.
> 
> Remove the repeated copy, as it is unnecessary.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>   arch/powerpc/kernel/cputable.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
> index e745abc5457a..5a87ec96582f 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -2197,7 +2197,6 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
>   		 */
>   		if (old.oprofile_cpu_type != NULL) {
>   			t->oprofile_cpu_type = old.oprofile_cpu_type;
> -			t->oprofile_type = old.oprofile_type;
>   		}

The action being reduced to a single line, the { } should be removed.

Christophe
