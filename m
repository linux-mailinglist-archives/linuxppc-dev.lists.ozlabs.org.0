Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E6DF145
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 17:25:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xgSn0gRLzDr1Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 02:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xgQY5bQ9zDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 02:23:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Skk3cYPI"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46xgQX4cXKz8tTQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 02:23:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46xgQX49m8z9sPT; Tue, 22 Oct 2019 02:23:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Skk3cYPI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46xgQW5vNHz9sPL
 for <linuxppc-dev@ozlabs.org>; Tue, 22 Oct 2019 02:23:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46xgQL1gnpz9tyv5;
 Mon, 21 Oct 2019 17:23:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Skk3cYPI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0oLWw6VBcru1; Mon, 21 Oct 2019 17:23:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46xgQL0Xwsz9tyv4;
 Mon, 21 Oct 2019 17:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571671418; bh=nm0UPQIaAz9eXoUIEZbDmlT9s/fOientiagkm7/79CU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Skk3cYPIGnFSMihmQlheRa3z/IOC/tmfS1U8+JeB7nQ26lsXGHlUGpqJpOVPKEDNA
 x0EFrq7w6gMb5hmhMWXTx2aWBboHBLsJvmzE+nAlOArBN6SErIbFu54Ck7MJXz2f7Q
 U4HrIEBt2eV5Wo+/INlnh1l+kTjje6HT8WMBBS8I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 371118BB21;
 Mon, 21 Oct 2019 17:23:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FqiSqnIpHT5m; Mon, 21 Oct 2019 17:23:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7BFE8B8FE;
 Mon, 21 Oct 2019 17:23:42 +0200 (CEST)
Subject: Re: [PATCH] lib/vdso: Make clock_getres() POSIX compliant again
To: Thomas Gleixner <tglx@linutronix.de>,
 Andreas Schwab <schwab@linux-m68k.org>
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home> <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
 <87tv83zqt1.fsf@hase.home> <b64c367b-d1e5-bf26-d452-145c0be6e30a@c-s.fr>
 <alpine.DEB.2.21.1910201243580.2090@nanos.tec.linutronix.de>
 <875zkjipra.fsf@igel.home>
 <alpine.DEB.2.21.1910201731070.2090@nanos.tec.linutronix.de>
 <87r237h01a.fsf@igel.home>
 <alpine.DEB.2.21.1910202145160.2090@nanos.tec.linutronix.de>
 <87eez7glre.fsf@igel.home>
 <alpine.DEB.2.21.1910211202260.1904@nanos.tec.linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fb552fd1-99e4-0685-c41f-3e4e0efc46ec@c-s.fr>
Date: Mon, 21 Oct 2019 17:23:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910211202260.1904@nanos.tec.linutronix.de>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/10/2019 à 12:07, Thomas Gleixner a écrit :
> A recent commit removed the NULL pointer check from the clock_getres()
> implementation causing a test case to fault.
> 
> POSIX requires an explicit NULL pointer check for clock_getres() aside of
> the validity check of the clock_id argument for obscure reasons.
> 
> Add it back for both 32bit and 64bit.
> 
> Note, this is only a partial revert of the offending commit which does not
> bring back the broken fallback invocation in the the 32bit compat
> implementations of clock_getres() and clock_gettime().
> 
> Fixes: a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer checks")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>

> Cc: stable@vger.kernel.org
> ---
>   lib/vdso/gettimeofday.c |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -214,9 +214,10 @@ int __cvdso_clock_getres_common(clockid_
>   		return -1;
>   	}
>   
> -	res->tv_sec = 0;
> -	res->tv_nsec = ns;
> -
> +	if (likely(res)) {
> +		res->tv_sec = 0;
> +		res->tv_nsec = ns;
> +	}
>   	return 0;
>   }
>   
> @@ -245,7 +246,7 @@ static __maybe_unused int
>   		ret = clock_getres_fallback(clock, &ts);
>   #endif
>   
> -	if (likely(!ret)) {
> +	if (likely(!ret && res)) {
>   		res->tv_sec = ts.tv_sec;
>   		res->tv_nsec = ts.tv_nsec;
>   	}
> 
