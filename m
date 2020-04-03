Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 942AB19D95E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:44:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2kp4zQXzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:44:18 +1100 (AEDT)
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
 header.s=mail header.b=LdgOBpgV; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v2VP6s0ZzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 01:33:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48v2VJ02pqz9vBTZ;
 Fri,  3 Apr 2020 16:33:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LdgOBpgV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qohEeScBKu3E; Fri,  3 Apr 2020 16:33:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48v2VH5l7Wz9vBTX;
 Fri,  3 Apr 2020 16:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585924407; bh=YHfep6fRmWTQ628Du5m3Bj55eqaX1GQfXJKDyD5Kf6M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LdgOBpgVDFdabeMJxsuYBTxXHXQpVaX6EIwd1SgXc1UIMxzw9oO7aUpO9XVYr8Qz4
 ZUCufbF5X5UCYSj3k4WpLRK117FcYEizagCS4RWIqS+GNzG59gZOGDyoyErb0d1sy/
 MNoxGZHNZEoRDRiMg37wiUj4r0skB8Qq39I56oHk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 14BB18B956;
 Fri,  3 Apr 2020 16:33:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id v7wnzdwVjQyx; Fri,  3 Apr 2020 16:33:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E0E68B951;
 Fri,  3 Apr 2020 16:33:28 +0200 (CEST)
Subject: Re: [PATCH v2 06/14] powerpc/pseries/ras: FWNMI_VALID off by one
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-7-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <dc2fdaa8-ff1d-bf33-254e-9efa91f3413c@c-s.fr>
Date: Fri, 3 Apr 2020 16:33:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403132622.130394-7-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 15:26, Nicholas Piggin a écrit :
> This was discovered developing qemu fwnmi sreset support. This
> off-by-one bug means the last 16 bytes of the rtas area can not
> be used for a 16 byte save area.
> 
> It's not a serious bug, and QEMU implementation has to retain a
> workaround for old kernels, but it's good to tighten it.
> 
> Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/ras.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index c74d5e740922..9a37bda47468 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -395,10 +395,11 @@ static irqreturn_t ras_error_interrupt(int irq, void *dev_id)
>   /*
>    * Some versions of FWNMI place the buffer inside the 4kB page starting at
>    * 0x7000. Other versions place it inside the rtas buffer. We check both.
> + * Minimum size of the buffer is 16 bytes.
>    */
>   #define VALID_FWNMI_BUFFER(A) \
> -	((((A) >= 0x7000) && ((A) < 0x7ff0)) || \
> -	(((A) >= rtas.base) && ((A) < (rtas.base + rtas.size - 16))))
> +	((((A) >= 0x7000) && ((A) <= 0x8000 - 16)) || \
> +	(((A) >= rtas.base) && ((A) <= (rtas.base + rtas.size - 16))))

Why not just change < to <= and leave the 0x7ff0 ?

>   
>   static inline struct rtas_error_log *fwnmi_get_errlog(void)
>   {
> 

Christophe
