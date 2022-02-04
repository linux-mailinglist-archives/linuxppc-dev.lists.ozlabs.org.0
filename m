Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9E4A971E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 10:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqrNC1dpxz3cSZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 20:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqrMk1MpKz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 20:48:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JqrMW5BVwz9sSr;
 Fri,  4 Feb 2022 10:48:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waWtxEWQL5Zl; Fri,  4 Feb 2022 10:48:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JqrMW4LrJz9sRm;
 Fri,  4 Feb 2022 10:48:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 840CC8B839;
 Fri,  4 Feb 2022 10:48:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uU0SuNHbRtb8; Fri,  4 Feb 2022 10:48:39 +0100 (CET)
Received: from [192.168.5.213] (unknown [192.168.5.213])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 472958B764;
 Fri,  4 Feb 2022 10:48:39 +0100 (CET)
Message-ID: <30b02d7e-1bbe-1081-9bca-50cdf510a875@csgroup.eu>
Date: Fri, 4 Feb 2022 10:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] powerpc: Fix xmon ml command to work with 64 bit values.
Content-Language: fr-FR
To: Rashmica Gupta <rashmicy@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1448406993-7888-1-git-send-email-rashmicy@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1448406993-7888-1-git-send-email-rashmicy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: jwboyer@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2015 à 00:16, Rashmica Gupta a écrit :
> The ml command in xmon currently only works for 32-bit values and so fails
> to find 64-bit values on a ppc64 machine. So change to work for 64-bit
> values.
> 
> This is based off a patch by Josh Boyer.
> 
> Signed-off-by: Rashmica Gupta <rashmicy@gmail.com>
> ---
> 
> Based off this patch: http://patchwork.ozlabs.org/patch/90309/
> 
>   arch/powerpc/xmon/xmon.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 786bf01691c9..df05bd2fca07 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -184,6 +184,12 @@ extern void xmon_leave(void);
>   #define GETWORD(v)	(((v)[0] << 24) + ((v)[1] << 16) + ((v)[2] << 8) + (v)[3])
>   #endif
>   
> +#if BITS_PER_LONG == 64
> +#define GETLONG(v)	(((unsigned long) GETWORD(v)) << 32 | GETWORD(v+4))
> +#else
> +#define GETLONG(v)	GETWORD(v)
> +#endif
> +

memlocate() is the only place when GETWORD() is used. Shouldn't we just 
replace GETWORD() by GETLONG() instead of doing a GETLONG() with GETWORD() ?

Also, can we use CONFIG_PPC64 instead of BITS_PER_LONG == 64 ?

>   static char *help_string = "\
>   Commands:\n\
>     b	show breakpoints\n\
> @@ -2447,14 +2453,15 @@ memdiffs(unsigned char *p1, unsigned char *p2, unsigned nb, unsigned maxpr)
>   		printf("Total of %d differences\n", prt);
>   }
>   
> -static unsigned mend;
> -static unsigned mask;
> +static unsigned long mend;
> +static unsigned long mask;
>   
>   static void
>   memlocate(void)
>   {
> -	unsigned a, n;
> -	unsigned char val[4];
> +	unsigned long a, n;
> +	int size = sizeof(unsigned long);
> +	unsigned char val[size];
>   
>   	last_cmd = "ml";
>   	scanhex((void *)&mdest);
> @@ -2470,10 +2477,10 @@ memlocate(void)
>   		}
>   	}
>   	n = 0;
> -	for (a = mdest; a < mend; a += 4) {
> -		if (mread(a, val, 4) == 4
> -			&& ((GETWORD(val) ^ mval) & mask) == 0) {
> -			printf("%.16x:  %.16x\n", a, GETWORD(val));
> +	for (a = mdest; a < mend; a += size) {
> +		if (mread(a, val, size) == size
> +			&& ((GETLONG(val) ^ mval) & mask) == 0){
> +			printf("%.16lx:  %.16lx\n", a, GETLONG(val));
>   			if (++n >= 10)
>   				break;
>   		}
