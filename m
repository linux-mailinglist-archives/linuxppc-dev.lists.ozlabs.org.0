Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D219519D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 07:54:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXds2Cz8zDqCw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 17:54:25 +1100 (AEDT)
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
 header.s=mail header.b=gAJAvFvv; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXVn2DRjzDqCt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 17:48:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pXVg1XcFz9txpw;
 Fri, 27 Mar 2020 07:48:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gAJAvFvv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZttA5gZgh6-O; Fri, 27 Mar 2020 07:48:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pXVg01Xwz9txpv;
 Fri, 27 Mar 2020 07:48:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585291691; bh=XtREjkZioCDKt0oyfaYInS0P1aj7ONXkqyS8vxM50hQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gAJAvFvvUn6JgC9oVc84SwWCACdpxEYjXH+aRI0YMmKHrC4zsHB6/8XyESoNxdtoZ
 zeb3S1JW3aFKoeast7L7a4B/2bcar+TqT/IkiyXfW5agYv4/6Iam3/t5ISUtBMwimp
 BbplrKct9UFSICgoS1xwjQeXDM5mv+GZJTs1t/iU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 887518B7BC;
 Fri, 27 Mar 2020 07:48:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WcDGs2iv5XSU; Fri, 27 Mar 2020 07:48:11 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA0DC8B756;
 Fri, 27 Mar 2020 07:48:10 +0100 (CET)
Subject: Re: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi` instruction
 for 64bit Book3S
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200326061522.33123-1-bala24@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
Date: Fri, 27 Mar 2020 07:48:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326061522.33123-1-bala24@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/03/2020 à 07:15, Balamuruhan S a écrit :
> Data Cache Block Invalidate (dcbi) instruction was implemented back in PowerPC
> architecture version 2.03. It is obsolete and attempt to use of this illegal
> instruction results in a hypervisor emulation assistance interrupt. So, ifdef
> it out the option `i` in xmon for 64bit Book3S.

I don't understand. You say two contradictory things:
1/ You say it _was_ added back.
2/ You say it _is_ obsolete.

How can it be obsolete if it was added back ?

[...]

> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 0ec9640335bb..bfd5a97689cd 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -335,10 +335,12 @@ static inline void cflush(void *p)
>   	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
>   }
>   
> +#ifndef CONFIG_PPC_BOOK3S_64

You don't need that #ifndef. Keeping it should be harmless.

>   static inline void cinval(void *p)
>   {
>   	asm volatile ("dcbi 0,%0; icbi 0,%0" : : "r" (p));
>   }
> +#endif
>   
>   /**
>    * write_ciabr() - write the CIABR SPR
> @@ -1791,8 +1793,9 @@ static void prregs(struct pt_regs *fp)
>   
>   static void cacheflush(void)
>   {
> -	int cmd;
>   	unsigned long nflush;
> +#ifndef CONFIG_PPC_BOOK3S_64

Don't make it so complex, see below

> +	int cmd;
>   
>   	cmd = inchar();
>   	if (cmd != 'i')
> @@ -1800,13 +1803,14 @@ static void cacheflush(void)
>   	scanhex((void *)&adrs);
>   	if (termch != '\n')
>   		termch = 0;
> +#endif
>   	nflush = 1;
>   	scanhex(&nflush);
>   	nflush = (nflush + L1_CACHE_BYTES - 1) / L1_CACHE_BYTES;
>   	if (setjmp(bus_error_jmp) == 0) {
>   		catch_memory_errors = 1;
>   		sync();
> -
> +#ifndef CONFIG_PPC_BOOK3S_64

You don't need that ifndef, just ensure below that regardless of cmd, 
book3s/64 calls cflush and not cinval.

>   		if (cmd != 'i') {

The only thing you have to do is to replace the above test by:

		if (cmd != 'i' || IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {

>   			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
>   				cflush((void *) adrs);
> @@ -1814,6 +1818,10 @@ static void cacheflush(void)
>   			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
>   				cinval((void *) adrs);
>   		}
> +#else

Don't need that at all, it's a duplication of the above.

> +		for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
> +			cflush((void *)adrs);
> +#endif
>   		sync();
>   		/* wait a little while to see if we get a machine check */
>   		__delay(200);
> 
> base-commit: a87b93bdf800a4d7a42d95683624a4516e516b4f
> 

Christophe
