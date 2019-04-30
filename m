Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F09FE69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 19:05:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnvn4MlpzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 03:05:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="thokTpL/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tnt50Z9LzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 03:03:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44tnsz6jTpz9v084;
 Tue, 30 Apr 2019 19:03:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=thokTpL/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FKqMaVCQSI9R; Tue, 30 Apr 2019 19:03:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44tnsz5TNtz9v0Y5;
 Tue, 30 Apr 2019 19:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556643815; bh=cw+Y+kaLK7q7FJ1N0DeZMDtRi1OTaVzMwfDIbH5gM7Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=thokTpL/usXGt8BLX8V2bx8xWqTNVqvaxd/bd14d0oRIPi+Nz75ahCnI3zJqcb7sE
 cnvJnJ+Rie6rzo9bbmId8kh11O2ox3khrby3ZW0DroYbZYzqH75JjtflH6umK7BHGk
 PIf8qIauQL14H6yyf1kHivDOgb7L7ziv12g0y3kk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76D118B8F1;
 Tue, 30 Apr 2019 19:03:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id juwZzfHI02dr; Tue, 30 Apr 2019 19:03:37 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D857D8B8DF;
 Tue, 30 Apr 2019 19:03:36 +0200 (CEST)
Subject: Re: [PATCH 1/5] soc/fsl/qe: qe.c: drop useless static qualifier
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190430133615.25721-2-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <510c1b8f-515c-1cc0-d6b5-eaeaed63b738@c-s.fr>
Date: Tue, 30 Apr 2019 19:03:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430133615.25721-2-rasmus.villemoes@prevas.dk>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/04/2019 à 15:36, Rasmus Villemoes a écrit :
> The local variable snum_init has no reason to have static storage duration.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   drivers/soc/fsl/qe/qe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 612d9c551be5..855373deb746 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -306,7 +306,7 @@ static void qe_snums_init(void)
>   		0x28, 0x29, 0x38, 0x39, 0x48, 0x49, 0x58, 0x59,
>   		0x68, 0x69, 0x78, 0x79, 0x80, 0x81,
>   	};
> -	static const u8 *snum_init;
> +	const u8 *snum_init;
>   
>   	qe_num_of_snum = qe_get_num_of_snums();
>   
> 
