Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211944FFB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 09:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht1x43wlmz2ypK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 19:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht1wd66Dkz2xCN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 19:06:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ht1wZ35mLz9sSH;
 Mon, 15 Nov 2021 09:06:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GicMj1TSfUZ; Mon, 15 Nov 2021 09:06:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ht1wZ2GzRz9sS8;
 Mon, 15 Nov 2021 09:06:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35AB18B767;
 Mon, 15 Nov 2021 09:06:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0-dUyzFHv-UY; Mon, 15 Nov 2021 09:06:06 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05CDC8B763;
 Mon, 15 Nov 2021 09:06:06 +0100 (CET)
Message-ID: <2ebdfb0c-867e-37f0-2c77-41c83b4048d0@csgroup.eu>
Date: Mon, 15 Nov 2021 09:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] soc: fsl: qe: Fix typo in a comment
Content-Language: fr-FR
To: Jason Wang <wangborong@cdjrlc.com>, leoyang.li@nxp.com
References: <20211113055900.212568-1-wangborong@cdjrlc.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211113055900.212568-1-wangborong@cdjrlc.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/11/2021 à 06:59, Jason Wang a écrit :
> The double `is' in a comment is repeated, thus one of them
> should be removed.

You are also clean blanks it seems, so say it or don't do it.

> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>   drivers/soc/fsl/qe/qe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 4d38c80f8be8..b3c226eb5292 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -147,7 +147,7 @@ EXPORT_SYMBOL(qe_issue_cmd);
>    * memory mapped space.
>    * The BRG clock is the QE clock divided by 2.
>    * It was set up long ago during the initial boot phase and is
> - * is given to us.
> + * given to us.
>    * Baud rate clocks are zero-based in the driver code (as that maps
>    * to port numbers). Documentation uses 1-based numbering.
>    */
> @@ -421,7 +421,7 @@ static void qe_upload_microcode(const void *base,
>   
>   	for (i = 0; i < be32_to_cpu(ucode->count); i++)
>   		iowrite32be(be32_to_cpu(code[i]), &qe_immr->iram.idata);
> -	
> +

This change is not linked to the double "is".

>   	/* Set I-RAM Ready Register */
>   	iowrite32be(QE_IRAM_READY, &qe_immr->iram.iready);
>   }
> 
