Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FC3105DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 08:32:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX6Zl3Hn5zDwv3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX6KN1w5DzDwhj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 18:21:09 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DX6KF4L2tz9tyrq;
 Fri,  5 Feb 2021 08:21:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nOfXsRkH2akN; Fri,  5 Feb 2021 08:21:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DX6KF3V8tz9tyrZ;
 Fri,  5 Feb 2021 08:21:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 637988B75F;
 Fri,  5 Feb 2021 08:21:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7RRufg4Z5zAI; Fri,  5 Feb 2021 08:21:06 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D41418B81B;
 Fri,  5 Feb 2021 08:21:05 +0100 (CET)
Subject: Re: [PATCH] arch:powerpc simple_write_to_buffer return check
To: Mayank Suman <mayanksuman@live.com>, ruscur@russell.cc, oohall@gmail.com, 
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8be2b91b-cef1-ea68-836a-94c8a574d760@csgroup.eu>
Date: Fri, 5 Feb 2021 08:21:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please provide some description of the change.

And please clarify the patch subject, because as far as I can see, the return is already checked 
allthough the check seams wrong.

Le 04/02/2021 à 19:16, Mayank Suman a écrit :
> Signed-off-by: Mayank Suman <mayanksuman@live.com>
> ---
>   arch/powerpc/kernel/eeh.c                    | 8 ++++----
>   arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 813713c9120c..2dbe1558a71f 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1628,8 +1628,8 @@ static ssize_t eeh_force_recover_write(struct file *filp,
>   	char buf[20];
>   	int ret;
>   
> -	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> -	if (!ret)
> +	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> +	if (ret <= 0) >   		return -EFAULT;

Why return -EFAULT when the function has returned -EINVAL ?
And why is it -EFAULT when ret is 0 ? EFAULT means error accessing memory.

>   
>   	/*
> @@ -1696,7 +1696,7 @@ static ssize_t eeh_dev_check_write(struct file *filp,
>   
>   	memset(buf, 0, sizeof(buf));
>   	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> -	if (!ret)
> +	if (ret <= 0)
>   		return -EFAULT;
>   
>   	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
> @@ -1836,7 +1836,7 @@ static ssize_t eeh_dev_break_write(struct file *filp,
>   
>   	memset(buf, 0, sizeof(buf));
>   	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> -	if (!ret)
> +	if (ret <= 0)
>   		return -EFAULT;
>   
>   	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 89e22c460ebf..36ed2b8f7375 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -76,8 +76,8 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
>   		return -ENXIO;
>   
>   	/* Copy over argument buffer */
> -	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> -	if (!ret)
> +	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> +	if (ret <= 0)
>   		return -EFAULT;
>   
>   	/* Retrieve parameters */
> 
