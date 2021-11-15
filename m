Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943BA44FFB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 09:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht1vd39xRz2yMV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 19:05:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht1vB1CxKz2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 19:04:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ht1v323vdz9sSH;
 Mon, 15 Nov 2021 09:04:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qe2v3QVn8OFm; Mon, 15 Nov 2021 09:04:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ht1v26RDGz9sS8;
 Mon, 15 Nov 2021 09:04:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C71BA8B767;
 Mon, 15 Nov 2021 09:04:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EsYuPdIrXK02; Mon, 15 Nov 2021 09:04:46 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 964918B763;
 Mon, 15 Nov 2021 09:04:46 +0100 (CET)
Message-ID: <f48406ee-6bd8-2340-c79f-96f8882bd757@csgroup.eu>
Date: Mon, 15 Nov 2021 09:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] mm: Remove a repeated word in a comment
Content-Language: fr-FR
To: Jason Wang <wangborong@cdjrlc.com>, benh@kernel.crashing.org
References: <20211113044018.130835-1-wangborong@cdjrlc.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211113044018.130835-1-wangborong@cdjrlc.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/11/2021 à 05:40, Jason Wang a écrit :
> The double word `up' in a comment is repeated, thus one of
> them should be removed.

If you do other changes than this one, say it here as well, see below.

> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>   drivers/macintosh/mediabay.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
> index eab7e83c11c4..ec23094263e7 100644
> --- a/drivers/macintosh/mediabay.c
> +++ b/drivers/macintosh/mediabay.c
> @@ -129,7 +129,7 @@ enum {
>   /*
>    * Functions for polling content of media bay
>    */
> -
> +

This change is not part of your description.

>   static u8
>   ohare_mb_content(struct media_bay_info *bay)
>   {
> @@ -331,12 +331,12 @@ static void keylargo_mb_un_reset_ide(struct media_bay_info* bay)
>   
>   static inline void set_mb_power(struct media_bay_info* bay, int onoff)
>   {
> -	/* Power up up and assert the bay reset line */
> +	/* Power up and assert the bay reset line */
>   	if (onoff) {
>   		bay->ops->power(bay, 1);
>   		bay->state = mb_powering_up;
>   		pr_debug("mediabay%d: powering up\n", bay->index);
> -	} else {
> +	} else {

This change is not part of your description.

>   		/* Make sure everything is powered down & disabled */
>   		bay->ops->power(bay, 0);
>   		bay->state = mb_powering_down;
> @@ -577,7 +577,7 @@ static int media_bay_attach(struct macio_dev *mdev,
>   		macio_release_resources(mdev);
>   		return -ENOMEM;
>   	}
> -	
> +

This change is not part of your description.

>   	i = media_bay_count++;
>   	bay = &media_bays[i];
>   	bay->mdev = mdev;
> @@ -745,7 +745,7 @@ static int __init media_bay_init(void)
>   	if (!machine_is(powermac))
>   		return 0;
>   
> -	macio_register_driver(&media_bay_driver);	
> +	macio_register_driver(&media_bay_driver);

This change is not part of your description.

>   
>   	return 0;
>   }
> 
