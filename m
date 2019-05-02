Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAABD11259
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 06:52:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vjYy2wz7zDqQw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 14:52:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="RRbCPbxn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vjXf12jHzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 14:51:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vjXT3tPVz9v0dC;
 Thu,  2 May 2019 06:51:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RRbCPbxn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3NqOSpeVpOTg; Thu,  2 May 2019 06:51:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vjXT2pDFz9v0dB;
 Thu,  2 May 2019 06:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556772697; bh=bKp40p29ww5rWYWudCtNM/eqZO3Koty1E3gHLJJDIRc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RRbCPbxnLgXWlaX1rtHvlgQTduiVbrwYwYfPRqWoCouk04XpiXQ4Oit7TlcLBvUqI
 IORSjyEt82psaGWuAiiWAVwdpQWgiDy+eFb5WNCfasy8kTeLF6pIzHcB/cNJXU0Gtr
 XCbWeCzkzjM0zp7Lc2jdnYlhWjFqR3hVxBy/aKww=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 305578B84C;
 Thu,  2 May 2019 06:51:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pErdMFLohumg; Thu,  2 May 2019 06:51:38 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 894618B74C;
 Thu,  2 May 2019 06:51:37 +0200 (CEST)
Subject: Re: [PATCH v2 2/6] soc/fsl/qe: qe.c: reduce static memory footprint
 by 1.7K
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-3-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <cae22a68-40f3-5993-22a0-222134e76def@c-s.fr>
Date: Thu, 2 May 2019 06:51:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501092841.9026-3-rasmus.villemoes@prevas.dk>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/05/2019 à 11:29, Rasmus Villemoes a écrit :
> The current array of struct qe_snum use 256*4 bytes for just keeping
> track of the free/used state of each index, and the struct layout
> means there's another 768 bytes of padding. If we just unzip that
> structure, the array of snum values just use 256 bytes, while the
> free/inuse state can be tracked in a 32 byte bitmap.
> 
> So this reduces the .data footprint by 1760 bytes. It also serves as
> preparation for introducing another DT binding for specifying the snum
> values.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

Trivial comment below

> ---
>   drivers/soc/fsl/qe/qe.c | 43 ++++++++++++-----------------------------
>   1 file changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 855373deb746..303aa29cb27d 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -14,6 +14,7 @@
>    * Free Software Foundation;  either version 2 of the  License, or (at your
>    * option) any later version.
>    */
> +#include <linux/bitmap.h>
>   #include <linux/errno.h>
>   #include <linux/sched.h>
>   #include <linux/kernel.h>
> @@ -43,25 +44,14 @@ static DEFINE_SPINLOCK(qe_lock);
>   DEFINE_SPINLOCK(cmxgcr_lock);
>   EXPORT_SYMBOL(cmxgcr_lock);
>   
> -/* QE snum state */
> -enum qe_snum_state {
> -	QE_SNUM_STATE_USED,
> -	QE_SNUM_STATE_FREE
> -};
> -
> -/* QE snum */
> -struct qe_snum {
> -	u8 num;
> -	enum qe_snum_state state;
> -};
> -
>   /* We allocate this here because it is used almost exclusively for
>    * the communication processor devices.
>    */
>   struct qe_immap __iomem *qe_immr;
>   EXPORT_SYMBOL(qe_immr);
>   
> -static struct qe_snum snums[QE_NUM_OF_SNUM];	/* Dynamically allocated SNUMs */
> +static u8 snums[QE_NUM_OF_SNUM];	/* Dynamically allocated SNUMs */
> +static DECLARE_BITMAP(snum_state, QE_NUM_OF_SNUM);
>   static unsigned int qe_num_of_snum;
>   
>   static phys_addr_t qebase = -1;
> @@ -315,10 +305,8 @@ static void qe_snums_init(void)
>   	else
>   		snum_init = snum_init_46;
>   
> -	for (i = 0; i < qe_num_of_snum; i++) {
> -		snums[i].num = snum_init[i];
> -		snums[i].state = QE_SNUM_STATE_FREE;
> -	}
> +	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
> +	memcpy(snums, snum_init, qe_num_of_snum);
>   }
>   
>   int qe_get_snum(void)
> @@ -328,12 +316,10 @@ int qe_get_snum(void)
>   	int i;
>   
>   	spin_lock_irqsave(&qe_lock, flags);
> -	for (i = 0; i < qe_num_of_snum; i++) {
> -		if (snums[i].state == QE_SNUM_STATE_FREE) {
> -			snums[i].state = QE_SNUM_STATE_USED;
> -			snum = snums[i].num;
> -			break;
> -		}
> +	i = find_first_zero_bit(snum_state, qe_num_of_snum);
> +	if (i < qe_num_of_snum) {
> +		set_bit(i, snum_state);
> +		snum = snums[i];
>   	}
>   	spin_unlock_irqrestore(&qe_lock, flags);
>   
> @@ -343,14 +329,9 @@ EXPORT_SYMBOL(qe_get_snum);
>   
>   void qe_put_snum(u8 snum)
>   {
> -	int i;
> -
> -	for (i = 0; i < qe_num_of_snum; i++) {
> -		if (snums[i].num == snum) {
> -			snums[i].state = QE_SNUM_STATE_FREE;
> -			break;
> -		}
> -	}
> +	const u8 *p = memchr(snums, snum, qe_num_of_snum);

A blank line is expected here.

Christophe

> +	if (p)
> +		clear_bit(p - snums, snum_state);
>   }
>   EXPORT_SYMBOL(qe_put_snum);
>   
> 
